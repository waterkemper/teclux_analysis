unit dmparametrosselecaoinativos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  //Biblio
  ctconstantes,biblio;

type
  TdtmParametrosSelecaoInativos = class(TdtmBasico)
    qryConsultaInativos: TtecQuery;
    qryConsultaInativoscodigo: TIntegerField;
    qryConsultaInativosnome: TStringField;
    qryConsultaInativosestado: TStringField;
    qryConceito: TtecQuery;
    qryConsultaConceito: TtecQuery;
    dsrConceito: TtecDataSource;
    dsrConsultaConceito: TtecDataSource;
    qryEstado: TtecQuery;
    qryConsultaEstado: TtecQuery;
    dsrEstado: TtecDataSource;
    dsrConsultaEstado: TtecDataSource;
    qryEstadocodigo: TStringField;
    qryEstadonome: TStringField;
    qryConsultaEstadonome: TStringField;
    qryConsultaEstadocodigo: TStringField;
    qryConsultaConceitodescricao: TStringField;
    qryConsultaConceitocodigo: TIntegerField;
    qryConceitocodigo: TIntegerField;
    qryConceitodescricao: TStringField;
  protected
    FEstado: String;
    FDiasAtrasoMaximo: String;
    FConceitos: String;
    FTelefones: TtecSelecao;
    FRenegociados: TtecSelecao;
    FDataPagInicial: String;
    FDataPagFinal: String;
    procedure GetEstado(const Value: String);
    procedure SetDiasAtrasoMaximo(const Value: String);
    procedure SetConceitos(const Value: String);
    procedure SetRenegociados(const Value: TtecSelecao);
    procedure SetTelefones(const Value: TtecSelecao);
    procedure SetDataPagFinal(const Value: String);
    procedure SetDataPagInicial(const Value: String);
    function  GetTabelaConsultaInativo: TtecQuery;
//procura
    function GetCodigoConceito      : integer;
    function GetCodigoEstado        : string;
    function GetConsultaConceito    : TtecQuery;
    function GetConsultaEstado      : TtecQuery;
  public
    function NrRegistrosSelecionados: Integer;
    procedure MontaConsultaPorDataPagamento;
    property Estado: String read FEstado write GetEstado;
    property DiasAtrasoMaximo: String read FDiasAtrasoMaximo write SetDiasAtrasoMaximo;
    property Conceitos: String read FConceitos write SetConceitos;
    property Renegociados: TtecSelecao read FRenegociados write SetRenegociados;
    property Telefones: TtecSelecao read FTelefones write SetTelefones;
    property DataPagInicial: String read FDataPagInicial write SetDataPagInicial;
    property DataPagFinal: String read FDataPagFinal write SetDataPagFinal;
    property TabelaConsultaInativo: TtecQuery read GetTabelaConsultaInativo;
//procura
    procedure RefazConsultaConceito(codConceito:integer);
    procedure RefazConsultaEstado(codEstado:string);
    procedure SetarFaixaValor(valorinicial,valorfinal:string);
    function  ExisteConceito(campo, codigo: string): boolean;
    function  ExisteEstado(campo, codigo: string): boolean;
    property  CodigoConceito    : integer read GetCodigoConceito;
    property  CodigoEstado      : string  read GetCodigoEstado;
    property  ConsultaConceito  : TtecQuery read GetConsultaConceito;
    property  ConsultaEstado    : TtecQuery read GetConsultaEstado;

    constructor Create(AOwner: TComponent); override;
end;

var
  dtmParametrosSelecaoInativos: TdtmParametrosSelecaoInativos;

const
  ctWhereBase           = 7;
  ctDataPagamento       = ctWhereBase + 1;
  ctInativo             = ctDataPagamento + 4;
  ctRenegociado         = ctDataPagamento + 5;
  ctTelefone            = ctDataPagamento + 6;
  ctConceitos           = ctDataPagamento + 7;
  ctDiasAtrasoMaximo    = ctDataPagamento + 8;
  ctEstado              = ctDataPagamento + 9;

implementation

{$R *.dfm}

uses
  dmtecsoft;

{ Tdtmconsultainativos }

constructor TdtmParametrosSelecaoInativos.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaInativos.Tag := ctSACTabelasConsultaInativos;
  qryConceito.Tag         := ctSACTabelasConsultaInativosFind;
  qryEstado.Tag           := ctSACTabelasConsultaInativosFind;
  qryConsultaConceito.Tag := ctSACTabelasConsultaInativosProcura;
  qryConsultaEstado.Tag   := ctSACTabelasConsultaInativosProcura;
end;

function TdtmParametrosSelecaoInativos.ExisteConceito(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaConceito, campo, codigo);
end;

function TdtmParametrosSelecaoInativos.ExisteEstado(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaEstado, campo, codigo);
end;

function TdtmParametrosSelecaoInativos.GetCodigoConceito: integer;
begin
  Result := qryConsultaConceitocodigo.AsInteger
end;

function TdtmParametrosSelecaoInativos.GetCodigoEstado: string;
begin
  Result := qryConsultaEstadocodigo.AsString
end;

function TdtmParametrosSelecaoInativos.GetConsultaConceito: TtecQuery;
begin
  Result := qryConsultaConceito
end;

function TdtmParametrosSelecaoInativos.GetConsultaEstado: TtecQuery;
begin
  Result := qryConsultaEstado
end;

procedure TdtmParametrosSelecaoInativos.GetEstado(const Value: String);
begin
  if FEstado <> Value then
     FEstado:= Value;
  if FEstado = '' then
       qryConsultaInativos.Sql[ctEstado] := ''
  else qryConsultaInativos.Sql[ctEstado] := 'and (clientes.estado = ''' + FEstado + ''')'
end;

function TdtmParametrosSelecaoInativos.GetTabelaConsultaInativo: TtecQuery;
begin
  Result:= qryConsultaInativos;
end;

procedure TdtmParametrosSelecaoInativos.MontaConsultaPorDataPagamento;
begin
  if DataEmBranco(DataPagFinal) then
    if DataEmBranco(DatapagInicial) then
      qryConsultaInativos.Sql[ctDataPagamento] := ''
    else
      qryConsultaInativos.Sql[ctDataPagamento] := 'and (parcelas.datapagto >= ''' + DataPagInicial + ''')'
  else if DataEmBranco(DataPagInicial) then
    qryConsultaInativos.Sql[ctDataPagamento]   := 'and (parcelas.datapagto >= ''' + DataPagFinal   + ''')'
  else
    qryConsultaInativos.Sql[ctDataPagamento]   := 'and (parcelas.datapagto >= ''' + DataPagInicial + ''')'
                                                + 'and (parcelas.datapagto <= ''' + DataPagFinal   + ''')';

  qryConsultaInativos.Sql[ctInativo]           := 'and (clientes_inativo(codigo, ''' +
                                                   DataPagInicial + ''', ''' + DataPagFinal + '''))';
end;

function TdtmParametrosSelecaoInativos.NrRegistrosSelecionados: Integer;
begin
  Result:= qryConsultaInativos.RecordCount;
end;

procedure TdtmParametrosSelecaoInativos.RefazConsultaConceito(
  codConceito: integer);
begin
  RefazConsulta(qryConceito, [0] ,[codConceito]);
end;

procedure TdtmParametrosSelecaoInativos.RefazConsultaEstado(
  codEstado: string);
begin
  RefazConsulta(qryEstado, [0] ,[codEstado]);
end;

procedure TdtmParametrosSelecaoInativos.SetarFaixaValor(valorinicial,
  valorfinal: string);
begin
  qryConsultaInativos.sql[9]:='and (contratos.valorprazo between '''+StringReplace(valorinicial,',','.',[rfReplaceAll])+''' and '''+StringReplace(valorfinal,',','.',[rfReplaceAll])+''')';
end;

procedure TdtmParametrosSelecaoInativos.SetConceitos(const Value: String);
begin
  if FConceitos <> Trim(Value) then begin
    FConceitos := Trim(Value);
    if FConceitos <> '' then begin
      qryConsultaInativos.Sql[ctConceitos] := 'and (clientes.conceito = ' + FConceitos + ')'
    end else
      qryConsultaInativos.Sql[ctConceitos] := ''
  end
end;

procedure TdtmParametrosSelecaoInativos.SetDataPagFinal(const Value: String);
begin
  if FDataPagFinal <> Value then begin
    FDataPagFinal := Value;
    MontaConsultaPorDataPagamento
  end
end;

procedure TdtmParametrosSelecaoInativos.SetDataPagInicial(const Value: String);
begin
  if FDataPagInicial <> Value then begin
    FDataPagInicial := Value;
    MontaConsultaPorDataPagamento
  end
end;

procedure TdtmParametrosSelecaoInativos.SetDiasAtrasoMaximo(const Value: String);
begin
  if FDiasAtrasoMaximo <> Trim(Value) then
    FDiasAtrasoMaximo := Trim(Value);
  if Trim(FDiasAtrasoMaximo) <> '' then
    qryConsultaInativos.Sql[ctDiasAtrasoMaximo] := 'and (clientes_mediaatrasopagto(codigo) <= ' + FDiasAtrasoMaximo + ')'
  else
    qryConsultaInativos.Sql[ctDiasAtrasoMaximo] := ''
end;

procedure TdtmParametrosSelecaoInativos.SetRenegociados(const Value: TtecSelecao);
begin
  FRenegociados := Value;
  case FRenegociados of
    slSIM  : qryConsultaInativos.Sql[ctRenegociado] := 'and clientes_jarenegociou(codigo)';
    slNAO  : qryConsultaInativos.Sql[ctRenegociado] := 'and not clientes_jarenegociou(codigo)';
    slAMBOS: qryConsultaInativos.Sql[ctRenegociado] := '';
  end;
end;

procedure TdtmParametrosSelecaoInativos.SetTelefones(const Value: TtecSelecao);
begin
  FTelefones := Value;
  case FTelefones of
    slSIM: qryConsultaInativos.Sql[ctTelefone] := 'and ((clientes.fonenumero     is not null) or '  +
                                                   '     (clientes.fone2numero    is not null) or '  +
                                                   '     (clientes.empfonenumero  is not null) or '  +
                                                   '     (clientes.confonenumero  is not null))';
    slNAO: qryConsultaInativos.Sql[ctTelefone] := 'and ((clientes.fonenumero      is null)     and ' +
                                                   '     (clientes.fone2numero    is null)     and ' +
                                                   '     (clientes.empfonenumero  is null)     and ' +
                                                   '     (clientes.confonenumero  is null))';
    slAMBOS: qryConsultaInativos.Sql[ctTelefone] := '';
  end;
end;

end.
