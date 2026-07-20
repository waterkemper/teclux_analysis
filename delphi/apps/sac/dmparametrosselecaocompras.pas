unit dmparametrosselecaocompras;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB,
  //Biblio
  ctconstantes,
  //Componentes
  cpquery, cpdatasource,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Repositorio
  dmbasico;

type

  TdtmParametrosSelecaoCompras = class(TdtmBasico)
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    dsrFiliais: TtecDataSource;
    dsrGruposDeFiliais: TtecDataSource;
    dsrConsultaContratos: TtecDataSource;
    qryGruposDeFiliais: TtecQuery;
    qryGruposDeFiliaiscodigo: TIntegerField;
    qryConsultaContratos: TtecQuery;
    qryGruposDeFiliaismnemonico: TStringField;
    qryFiliaismnemonico: TStringField;
    dsrConsultaFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaismnemonico: TStringField;
    qryConsultaGrupoFiliais: TtecQuery;
    dsrConsultaGrupoFiliais: TtecDataSource;
    qryConsultaGrupoFiliaiscodigo: TIntegerField;
    qryConsultaGrupoFiliaisdescricao: TStringField;
    qryConsultaGrupoFiliaismnemonico: TStringField;
    qryConsultaContratoscodigo: TIntegerField;
    qryConsultaContratosnomecliente: TStringField;
    qryConsultaContratosnumero: TStringField;
    qryConsultaContratosdata: TDateField;
    qryConsultaContratosfilialvenda: TIntegerField;
  protected
    FTelefones: TtecSelecao;
    FContactados: TtecSelecao;
    FMontados: TtecSelecao;
    FGrupoFiliais: Boolean;
    FVendedor: Boolean;
    FDataVendaInicial: String;
    FEntregue: TtecSelecao;
    FDataVendaFinal: String;
    FRegiao: Boolean;
    FRenegociados: TtecSelecao;
    FAgente: Boolean;
    FConceitos: String;
    FDiasAtrasoMaximo: String;
    FDataVenctoInicial: String;
    FDataVenctoFinal: String;
    FDataPagInicial: String;
    FDataPagFinal: String;
    FTipoVenda: TtecSACTipoVenda;
    FOnScrollConsultaContratos: TNotifyEvent;
    FFiliais: Boolean;    
    function  GetTabelaConsultaFilial: TtecQuery;
    function  GetTabelaConsultaGrupoDeFilial: TtecQuery;
    function  GetTabelaParamentroContrato: TtecQuery;
    procedure MontaConsultaPorDataVenda;
    procedure MontarSQLPorFilial;
    procedure SetDataVendaFinal(const Value: String);
    procedure SetDataVendaInicial(const Value: String);
    procedure SetEntregue(const Value: TtecSelecao);
    procedure SetFiliais(const Value: Boolean);
    procedure SetGrupoFiliais(const Value: Boolean);
    procedure SetMontados(const Value: TtecSelecao);
    procedure SetTelefones(const Value: TtecSelecao);
  public
    constructor Create(AOwner: TComponent); override;
    procedure PosicionarFiliais;
    procedure PosicionarGrupoFiliais;
    procedure SetarFaixaValor(valorinicial,valorfinal:string);
    Function NrRegistrosSelecionados: Integer;
    function ExisteFilial(NomeCampo: String; Inf: Variant): Boolean;
    function ExisteGrupoDeFilial(NomeCampo: String; Inf: Variant): Boolean;
    property DataVendaInicial: String read FDataVendaInicial write SetDataVendaInicial;
    property DataVendaFinal: String read FDataVendaFinal write SetDataVendaFinal;
    property Entregue: TtecSelecao read FEntregue write SetEntregue;
    property GrupoFiliais: Boolean read FGrupoFiliais write SetGrupoFiliais;
    property Filiais: Boolean read FFiliais write SetFiliais;
    property Montados: TtecSelecao read FMontados write SetMontados;
    property Telefones: TtecSelecao read FTelefones write SetTelefones;
    property TabelaConsultaFilial: TtecQuery read GetTabelaConsultaFilial;
    property TabelaConsultaGrupoDeFilial: TtecQuery read GetTabelaConsultaGrupoDeFilial;
    property TabelaParametroContrato : TtecQuery read GetTabelaParamentroContrato;
  end;

const
  //linhas complementares do SQL (ConsultaContratos).
  ctWhereBase           = 10;
  ctFiliais             = ctWhereBase + 1;
  ctDataVenda           = ctWhereBase + 2;
  ctEntregue            = ctWhereBase + 3;
  ctMontados            = ctWhereBase + 4;
  ctTelefone            = ctWhereBase + 5;

implementation

uses
  //Repositorio
  biblio,dmtecsoft;

{$R *.dfm}

{ TdtmConsultaContratos }

constructor TdtmParametrosSelecaoCompras.Create(AOwner: TComponent);
begin
  inherited;
  FTelefones    := slAMBOS;
  FContactados  := slAMBOS;
  FMontados     := slAMBOS;
  FEntregue     := slAMBOS;

  qryGruposDeFiliais.Tag      := ctTabelas;
  qryFiliais.Tag              := ctTabelas;
//  qryConsultaFiliais.Tag      := ctTabelasConsultaFiliais;
//  qryConsultaGrupoFiliais.Tag := ctTabelasConsultaGrupoFiliais;
  qryConsultaContratos.Tag    := ctSACTabelasConsultaContratos;
end;

procedure TdtmParametrosSelecaoCompras.MontaConsultaPorDataVenda;

begin
  if DataEmBranco(DataVendaFinal) then
    if DataEmBranco(DataVendaInicial) then
      qryConsultaContratos.Sql[ctDataVenda] := ''
    else
      qryConsultaContratos.Sql[ctDataVenda] := 'and (s.data = ''' + DataVendaInicial + ''')'
  else if DataEmBranco(DataVendaInicial) then
    qryConsultaContratos.Sql[ctDataVenda] := 'and (s.data = ''' + DataVendaFinal + ''')'
  else
    qryConsultaContratos.Sql[ctDataVenda] := 'and (s.data between ''' + DataVendaInicial +
                                             ''' and ''' + DataVendaFinal + ''')'
end;

procedure TdtmParametrosSelecaoCompras.MontarSQLPorFilial;
begin
  if FFiliais then
    qryConsultaContratos.Sql[ctFiliais] := 'and (s.filialvenda = ' + qryFiliaiscodigo.AsString + ')'
  else if FGrupoFiliais then
    qryConsultaContratos.Sql[ctFiliais] := 'and (s.filialvenda in ('+
                                           'select filial from filiaisgrupos'+
                                           'filiais fg where fg.grupo = '''+
                                           qryGruposDeFiliaiscodigo.AsString + '''))'
  else
    qryConsultaContratos.Sql[ctFiliais] := ''
end;

procedure TdtmParametrosSelecaoCompras.SetDataVendaFinal(const Value: String);
begin
  if FDataVendaFinal <> Value then begin
    FDataVendaFinal := Value;
    MontaConsultaPorDataVenda
  end
end;

procedure TdtmParametrosSelecaoCompras.SetDataVendaInicial(const Value: String);
begin
  if FDataVendaInicial <> Value then begin
    FDataVendaInicial := Value;
    MontaConsultaPorDataVenda
  end
 end;

procedure TdtmParametrosSelecaoCompras.SetEntregue(const Value: TtecSelecao);
const
  SQL: String = 'and (0 < (select Count(pc.contrato) from produtoscontratos pc where ' +
                '(pc.contrato = s.numero) and (pc.entrega = ';
begin
  FEntregue := Value;
  case FEntregue of
    slSIM  : qryConsultaContratos.Sql[ctEntregue] := SQL + '''O'')))';
    slNAO  : qryConsultaContratos.Sql[ctEntregue] := SQL + '''N'')))';
    slAMBOS: qryConsultaContratos.Sql[ctEntregue] := '';
  end;
end;

procedure TdtmParametrosSelecaoCompras.SetFiliais(const Value: Boolean);
begin
  FFiliais := Value;
  MontarSQLPorFilial
end;

procedure TdtmParametrosSelecaoCompras.SetGrupoFiliais(const Value: Boolean);
begin
  FGrupoFiliais := Value;
  MontarSQLPorFilial
end;

procedure TdtmParametrosSelecaoCompras.SetMontados(const Value: TtecSelecao);
const
  SQL: String = 'and (0 < (select Count(pc.contrato) from produtoscontratos pc where ' +
                '(pc.contrato = s.numero) and (pc.montagem = ';
begin
  FMontados := Value;
  case FMontados of
    slSIM: qryConsultaContratos.Sql[ctMontados] := SQL + '''O'')))';
    slNAO: qryConsultaContratos.Sql[ctMontados] := SQL + '''N'')))';
    slAMBOS: qryConsultaContratos.Sql[ctMontados] := '';
  end;
end;

procedure TdtmParametrosSelecaoCompras.SetTelefones(const Value: TtecSelecao);
begin
  FTelefones := Value;
  case FTelefones of
    slSIM: qryConsultaContratos.Sql[ctTelefone] := 'and ((c.fonenumero     is not null) or '  +
                                                   '     (c.fone2numero    is not null) or '  +
                                                   '     (c.empfonenumero  is not null) or '  +
                                                   '     (c.confonenumero  is not null))';
    slNAO: qryConsultaContratos.Sql[ctTelefone] := 'and ((c.fonenumero     is null)     and ' +
                                                   '     (c.fone2numero    is null)     and ' +
                                                   '     (c.empfonenumero  is null)     and ' +
                                                   '     (c.confonenumero  is null))';
    slAMBOS: qryConsultaContratos.Sql[ctTelefone] := '';
  end;
end;

function TdtmParametrosSelecaoCompras.ExisteFilial(NomeCampo: String; Inf: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, NomeCampo, Inf);
  if Result then
    ReFazConsulta(qryFiliais, [0], [qryConsultaFiliaiscodigo.AsInteger])
end;

function TdtmParametrosSelecaoCompras.ExisteGrupoDeFilial(NomeCampo: String; Inf: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupoFiliais, NomeCampo, Inf);
  if Result then
    ReFazConsulta(qryGruposDeFiliais, [0], [qryConsultaGrupoFiliaiscodigo.AsInteger])
end;

function TdtmParametrosSelecaoCompras.GetTabelaConsultaFilial: TtecQuery;
begin
  Result := qryConsultaFiliais
end;

function TdtmParametrosSelecaoCompras.GetTabelaConsultaGrupoDeFilial: TtecQuery;
begin
  Result := qryConsultaGrupoFiliais
end;

function TdtmParametrosSelecaoCompras.NrRegistrosSelecionados: Integer;
begin
  Result:= qryConsultaContratos.RecordCount;
end;

function TdtmParametrosSelecaoCompras.GetTabelaParamentroContrato: TtecQuery;
begin
  Result:= qryConsultaContratos;
end;

procedure TdtmParametrosSelecaoCompras.PosicionarFiliais;
begin
  ReFazConsulta(qryFiliais,[0],[qryConsultaFiliaiscodigo.AsInteger]);
end;

procedure TdtmParametrosSelecaoCompras.PosicionarGrupoFiliais;
begin
  ReFazConsulta(qryGruposDeFiliais,[0],[qryConsultaGrupoFiliaiscodigo.AsInteger]);
end;

procedure TdtmParametrosSelecaoCompras.SetarFaixaValor(valorinicial,
  valorfinal: string);
begin
  qryConsultaContratos.sql[16]:='and (s.valorprazo between '''+StringReplace(valorinicial,',','.',[rfReplaceAll])+''' and '''+StringReplace(valorfinal,',','.',[rfReplaceAll])+''')';
end;

end.

