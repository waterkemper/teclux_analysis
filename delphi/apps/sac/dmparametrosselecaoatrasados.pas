unit dmparametrosselecaoatrasados;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  //Componetes
  cpquery,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Constantes
  ctConstantes,
  //Repositorio
  dmtecsoft, dmbasico, cpdatasource;

type
  TdtmParametrosSelecaoAtrasados = class(TdtmBasico)
    qryConceitos: TtecQuery;
    dsrConceitos: TtecDataSource;
    qryConsultaConceitos: TtecQuery;
    dsrConsultaConceitos: TtecDataSource;
    qryConsultaConceitosdescricao: TStringField;
    qryConsultaConceitoscodigo: TIntegerField;
    qryConsultaAtrasados: TtecQuery;
    qryConsultaAtrasadoscodigo: TIntegerField;
    qryConsultaAtrasadosnome: TStringField;
    qryConceitoscodigo: TIntegerField;
    qryConceitosdescricao: TStringField;
  protected
    FCarencia: String;
    FOcorrencias: TtecSelecao;
    FTipoDeAtraso: TtecSelecao;
    FDataVenInicial: String;
    FDataVenFinal: String;
    FNenhumPagamento: TtecSelecao;
    FConceitos: String;
    FTelefones: TtecSelecao;
    procedure SetCarencia(const Value: String);
    procedure SetOcorrencias(const Value: TtecSelecao);
    procedure SetTipoDeAtraso(const Value: TtecSelecao);
    procedure SetNenhumPagamento(const Value: TtecSelecao);
    procedure SetDataVenFinal(const Value: String);
    procedure SetDataVenInicial(const Value: String);
    procedure SetConceitos(const Value: String);
    procedure SetTelefones(const Value: TtecSelecao);
    function  GetTabelaConsultaAtrasado: TtecQuery;
    function  GetTabelaConsultaConceitos: TtecQuery;
  public
    procedure PosicionarConceitos;
    function ExisteConceitos(NomeCampo: String; Inf: Variant): Boolean;
    function NrRegistrosSelecionados: Integer;
    procedure MontaConsultaPorDataAtraso;
    procedure MontaConsultaPorDataVencimento;
    constructor Create(AOwner: TComponent); override;
    property Carencia: String read FCarencia write SetCarencia;    
    property Ocorrencias: TtecSelecao read FOcorrencias write SetOcorrencias;
    property Telefones: TtecSelecao read FTelefones write SetTelefones;
    property Conceitos: String read FConceitos write SetConceitos;
    property DataVenInicial: String read FDataVenInicial write SetDataVenInicial;
    property DataVenFinal: String read FDataVenFinal write SetDataVenFinal;
    property NenhumPagamento: TtecSelecao read FNenhumPagamento write SetNenhumPagamento;
    property TipoDeAtraso: TtecSelecao read FTipoDeAtraso write SetTipoDeAtraso;
    property TabelaConsultaAtrasado : TtecQuery read GetTabelaConsultaAtrasado;
    property TabelaConsultaConceitos: TtecQuery read GetTabelaConsultaConceitos;
  end;

var
  dtmParametrosSelecaoAtrasados: TdtmParametrosSelecaoAtrasados;

const
  ctWhereBase           = 6;
  ctDataVencimento      = ctWhereBase + 1;
  ctNenhumPagamento     = ctWhereBase + 2;
  ctTelefone            = ctNenhumPagamento + 3;
  ctConceitos           = ctNenhumPagamento + 4;
  ctAtrasado            = ctNenhumPagamento + 5;
  ctOcorrencia          = ctNenhumPagamento + 6;
  ctCarencia            = ctNenhumPagamento + 7;

implementation

{$R *.dfm}

Uses
  biblio;

{ TdtmParametrosAtrasados }

constructor TdtmParametrosSelecaoAtrasados.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaAtrasados.Tag:= ctSACTabelasConsultaAtrasados;
  qryConsultaConceitos.Tag:= ctConsultaConceitos;
  qryConceitos.Tag        := ctTabelas;
end;

function TdtmParametrosSelecaoAtrasados.GetTabelaConsultaAtrasado: TtecQuery;
begin
  Result:= qryConsultaAtrasados;
end;

procedure TdtmParametrosSelecaoAtrasados.MontaConsultaPorDataAtraso;
begin
  if DataEmBranco(FDataVenFinal) then
    if DataEmBranco(FDataVenInicial) then
      qryConsultaAtrasados.Sql[ctAtrasado] := ''
    else
      qryConsultaAtrasados.Sql[ctAtrasado] := 'and (clientes_primeiroatraso(codigo) = ' + FDataVenInicial + ')'
  else if DataEmBranco(FDataVenInicial) then
    qryConsultaAtrasados.Sql[ctAtrasado]   := 'and (clientes_primeiroatraso(clientes.codigo) = ' + FDataVenFinal + ')'
  else
    qryConsultaAtrasados.Sql[ctAtrasado]   := 'and (clientes_primeiroatraso(clientes.codigo) between ''' + FDataVenInicial +
                                              ''' and ''' + FDataVenFinal + ''')'
end;

procedure TdtmParametrosSelecaoAtrasados.MontaConsultaPorDataVencimento;
const
  DATAPAGAMENTO: string = 'and (parcelas.datapagto is null)';
begin
  if DataEmBranco(FDataVenFinal) then
    if DataEmBranco(FDataVenInicial) then
      qryConsultaAtrasados.Sql[ctDataVencimento] := ''
    else
      qryConsultaAtrasados.Sql[ctDataVencimento] := DATAPAGAMENTO + ' and (parcelas.datavencto = ''' + FDataVenInicial + ''')'
  else if DataEmBranco(FDataVenInicial) then
    qryConsultaAtrasados.Sql[ctDataVencimento]   := DATAPAGAMENTO + ' and (parcelas.datavencto = ''' + FDataVenFinal   + ''')'
  else
    qryConsultaAtrasados.Sql[ctDataVencimento]   := DATAPAGAMENTO + ' and (parcelas.datavencto >= ''' + FDataVenInicial + ''')'
                                                                  + 'and (parcelas.datavencto <= ''' + FDataVenFinal   + ''')';
end;

function TdtmParametrosSelecaoAtrasados.NrRegistrosSelecionados: Integer;
begin
  Result:= qryConsultaAtrasados.RecordCount;
end;

procedure TdtmParametrosSelecaoAtrasados.SetConceitos(const Value: String);
begin
  if FConceitos <> Trim(Value) then
    FConceitos := Trim(Value);
  if FConceitos <> '' then begin
    qryConsultaAtrasados.Sql[ctConceitos] := 'and (clientes.conceito = ' + FConceitos + ')'
  end else
    qryConsultaAtrasados.Sql[ctConceitos] := ''
end;

procedure TdtmParametrosSelecaoAtrasados.SetOcorrencias(const Value: TtecSelecao);
begin
  FOcorrencias := Value;
  case FOcorrencias of
    slSIM: qryConsultaAtrasados.Sql[ctOcorrencia]   := 'and atendimentos_cobrancasemaviso(clientes.codigo)';
    slNAO: qryConsultaAtrasados.Sql[ctOcorrencia]   := 'and not atendimentos_cobrancasemaviso(clientes.codigo)';
    slAMBOS: qryConsultaAtrasados.Sql[ctOcorrencia] := '';
  end;
end;

procedure TdtmParametrosSelecaoAtrasados.SetDataVenFinal(const Value: String);
begin
  if FDataVenFinal <> Value then
     FDataVenFinal:= Value;
  MontaConsultaPorDataVencimento;
end;

procedure TdtmParametrosSelecaoAtrasados.SetDataVenInicial(const Value: String);
begin
  if FDataVenInicial <> Value then
    FDataVenInicial:= Value;
  MontaConsultaPorDataVencimento;
end;

procedure TdtmParametrosSelecaoAtrasados.SetNenhumPagamento(const Value: TtecSelecao);
begin
  if FNenhumPagamento <> Value then
     FNenhumPagamento:= Value;
  case NenhumPagamento of
    slSIM: qryConsultaAtrasados.Sql[ctNenhumPagamento] := 'and contratos_nenhumpagamento(parcelas.contrato)';
    slNAO: qryConsultaAtrasados.Sql[ctNenhumPagamento] := '';
  end;
end;

procedure TdtmParametrosSelecaoAtrasados.SetTelefones(const Value: TtecSelecao);
begin
  FTelefones := Value;
  case FTelefones of
    slSIM: qryConsultaAtrasados.Sql[ctTelefone] := 'and ((clientes.fonenumero     is not null) or '  +
                                                   '     (clientes.fone2numero    is not null) or '  +
                                                   '     (clientes.empfonenumero  is not null) or '  +
                                                   '     (clientes.confonenumero  is not null) or '  +
                                                   '     (clientes.reffonenumero  is not null) or '  +
                                                   '     (clientes.reffone2numero is not null))';
    slNAO: qryConsultaAtrasados.Sql[ctTelefone] := 'and ((clientes.fonenumero     is null)     and ' +
                                                   '     (clientes.fone2numero    is null)     and ' +
                                                   '     (clientes.empfonenumero  is null)     and ' +
                                                   '     (clientes.confonenumero  is null)     and ' +
                                                   '     (clientes.reffonenumero  is null)     and ' +
                                                   '     (clientes.reffone2numero is null))';
    slAMBOS: qryConsultaAtrasados.Sql[ctTelefone] := '';
  end;
end;

procedure TdtmParametrosSelecaoAtrasados.SetTipoDeAtraso(const Value: TtecSelecao);
begin
  if FTipoDeAtraso <> Value then
    FTipoDeAtraso := Value;
  case TipoDeAtraso of
    slSIM: MontaConsultaPorDataAtraso;
    slNAO: qryConsultaAtrasados.Sql[ctAtrasado] := '' ;
  end
end;

procedure TdtmParametrosSelecaoAtrasados.SetCarencia(const Value: String);
begin
  if FCarencia <> Value then
     FCarencia := Value;
  if Trim(FCarencia) <> '' then
    qryConsultaAtrasados.Sql[ctCarencia] := 'and (clientes_diasultimopagamento(clientes.codigo) > ' + FCarencia + ')'
  else
    qryConsultaAtrasados.Sql[ctCarencia] := ''
end;

function TdtmParametrosSelecaoAtrasados.GetTabelaConsultaConceitos: TtecQuery;
begin
  Result:= qryConsultaConceitos;
end;

function TdtmParametrosSelecaoAtrasados.ExisteConceitos(NomeCampo: String; Inf: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaConceitos, NomeCampo, Inf);
//  if Result then
//    ReFazConsulta(qryConceitos, [0], [qryConsultaConceitoscodigo.AsInteger])
end;

procedure TdtmParametrosSelecaoAtrasados.PosicionarConceitos;
begin
  ReFazConsulta(qryConceitos,[0],[qryConsultaConceitoscodigo.AsInteger]);
end;

end.
