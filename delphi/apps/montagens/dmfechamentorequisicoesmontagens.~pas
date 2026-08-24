
unit dmfechamentorequisicoesmontagens;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, ctconstantes, biblio, Variants, clparametrossistema,
  ZTransact;

type
  TdtmFechamentoRequisicoesMontagens = class(TdtmBasico)
    qryFilialMontagem: TtecQuery;
    qryFilialMontagemcodigo: TIntegerField;
    qryFilialMontagemnome: TStringField;
    dsrFilialMontagem: TtecDataSource;
    qryGrupoFiliaisMontagem: TtecQuery;
    qryGrupoFiliaisMontagemcodigo: TIntegerField;
    qryGrupoFiliaisMontagemdescricao: TStringField;
    dsrGrupoFiliaisMontagem: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaGrupoFiliais: TtecQuery;
    qryConsultaGrupoFiliaisdescricao: TStringField;
    qryConsultaGrupoFiliaiscodigo: TIntegerField;
    qryItensRequisicoes: TtecQuery;
    dsrItensRequisicoes: TtecDataSource;
    qryItensRequisicoesabertura: TDateField;
    qryItensRequisicoesrequisicao: TIntegerField;
    qryItensRequisicoesdadofiscal: TIntegerField;
    qryItensRequisicoesproduto: TLargeintField;
    qryItensRequisicoesfilial: TIntegerField;
    qryItensRequisicoesdescricaoproduto: TStringField;
    qryItensRequisicoesquantidade: TFloatField;
    qryItensRequisicoesmontagem: TIntegerField;
    qryItensRequisicoesdescricaomontagem: TStringField;
    qryItensRequisicoestipodemontagem: TStringField;
    qryItensRequisicoesdatamontagem: TDateField;
    qryItensRequisicoesobservacoes: TStringField;
    qryItensRequisicoesmarcar: TBooleanField;
    qryItensRequisicoesentrua: TStringField;
    qryItensRequisicoesentcidade: TIntegerField;
    qryItensRequisicoescidade: TStringField;
    qryItensRequisicoesentestado: TStringField;
    qryItensRequisicoesentbairro: TIntegerField;
    qryItensRequisicoesbairro: TStringField;
    qryItensRequisicoesentcep: TIntegerField;
    qryItensRequisicoesentfoneddd: TIntegerField;
    qryItensRequisicoesentfonenumero: TIntegerField;
    qryItensRequisicoesentfoneramal: TStringField;
    qryItensRequisicoescontrato: TStringField;
    qryItensRequisicoesemissaocontrato: TDateField;
    qryItensRequisicoesnomefilialvenda: TStringField;
    qryProdutosContratos: TtecQuery;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosproduto: TLargeintField;
    qryProdutosContratosdescricao: TStringField;
    qryProdutosContratosquantidade: TFloatField;
    qryProdutosContratoscancelado: TFloatField;
    qryProdutosContratosprecovenda: TFloatField;
    qryProdutosContratosreserva: TIntegerField;
    qryProdutosContratosmontagem: TStringField;
    qryProdutosContratosentrega: TStringField;
    qryProdutosContratosbrinde: TBooleanField;
    dsrProdutosContratos: TtecDataSource;
    dsrProdutosDadosFiscais: TtecDataSource;
    qryProdutosDadosFiscais: TtecQuery;
    qryProdutosDadosFiscaisquantidade: TFloatField;
    qryProdutosDadosFiscaisaliquotaicms: TFloatField;
    qryProdutosDadosFiscaisproduto: TLargeintField;
    qryProdutosDadosFiscaispreco: TIntegerField;
    qryProdutosDadosFiscaisprecovenda: TFloatField;
    qryProdutosDadosFiscaisprodutodescricao: TStringField;
    qryProdutosDadosFiscaismarcadescricao: TStringField;
    qryProdutosDadosFiscaisprecototal: TFloatField;
    qryClientesRequisicoes: TtecQuery;
    qryClientesRequisicoescodigo: TIntegerField;
    qryClientesRequisicoestipo: TStringField;
    qryClientesRequisicoesnome: TStringField;
    qryClientesRequisicoespessoanumero: TStringField;
    qryClientesRequisicoescnpj: TStringField;
    qryClientesRequisicoesinscricaoestadual: TStringField;
    qryClientesRequisicoesrua: TStringField;
    qryClientesRequisicoescidade: TIntegerField;
    qryClientesRequisicoesbairro: TIntegerField;
    qryClientesRequisicoesestado: TStringField;
    qryClientesRequisicoescep: TIntegerField;
    qryClientesRequisicoesfonenumero: TIntegerField;
    qryClientesRequisicoesfoneddd: TIntegerField;
    qryClientesRequisicoesfoneramal: TStringField;
    qryClientesRequisicoesfonenumeroempresa: TIntegerField;
    qryClientesRequisicoesfonedddempresa: TIntegerField;
    qryClientesRequisicoesfoneramalempresa: TStringField;
    dsrClientesRequisicoes: TtecDataSource;
    qryItensRequisicoesnomefilialemissao: TStringField;
    qryItensRequisicoesemissaodadofiscal: TDateField;
    qryItensRequisicoesserie: TStringField;
    qryItensRequisicoesnotafiscal: TIntegerField;
    qryItensRequisicoesmaquina: TIntegerField;
    qryItensRequisicoesintervensao: TIntegerField;
    qryItensRequisicoescupomfiscal: TIntegerField;
    qryItensRequisicoescliente: TIntegerField;
    qryItensRequisicoestipocliente: TStringField;
    qryMontador: TtecQuery;
    dsrMontador: TtecDataSource;
    qryConsultaMontador: TtecQuery;
    qryConsultaMontadornome: TStringField;
    qryConsultaMontadorcodigo: TIntegerField;
    qryConsultaMontadortipo: TStringField;
    qryConsultaMontadortipoorig: TStringField;
    qryMontadorcodigo: TIntegerField;
    qryMontadornome: TStringField;
    qryMontadortipo: TStringField;
    qryClientesRequisicoesnomecidade: TStringField;
    qryClientesRequisicoesnomebairro: TStringField;
    qryConsultaTabeladeMontagem: TtecQuery;
    qryConsultaTabeladeMontagemdescricao: TStringField;
    qryConsultaTabeladeMontagemcodigo: TIntegerField;
    qryItensRequisicoesfilialproduto: TStringField;
    qryProcuraTabeladeMontagem: TtecQuery;
    qryProcuraTabeladeMontagemcodigo: TIntegerField;
    qryProcuraTabeladeMontagemdescricao: TStringField;
    dsrProcuraTabeladeMontagem: TtecDataSource;
    qryItensRequisicoesvalorpagto: TFloatField;
    qryItensRequisicoesdatapagto: TDateField;
    qryProcuraTabeladeMontagemvalorloja: TFloatField;
    qryProcuraTabeladeMontagemvalordentro: TFloatField;
    qryProcuraTabeladeMontagemvalorfora: TFloatField;
    qryRequisicoesItens: TtecQuery;
    qryRequisicoesItensrequisicao: TIntegerField;
    qryRequisicoesItensproduto: TLargeintField;
    qryRequisicoesItensfilial: TIntegerField;
    qryRequisicoesItensmontagem: TIntegerField;
    qryRequisicoesItenstipodemontagem: TStringField;
    qryRequisicoesItensdatamontagem: TDateField;
    qryRequisicoesItensvalorpagto: TFloatField;
    qryItensRequisicoesdatahora: TDateTimeField;
    qryItensRequisicoesfilialmontagem: TIntegerField;
    qryItensRequisicoesnomefilialmontagem: TStringField;
    qryItensRequisicoesmontador: TIntegerField;
    qryItensRequisicoesnomemontador: TStringField;
    qryItensRequisicoesvendedor: TIntegerField;
    qryItensRequisicoesnomevendedor: TStringField;
    qryProcuraTabeladeMontagemtipovalor: TStringField;
    qryProcuraProdutos: TtecQuery;
    qryProcuraProdutosdescricao: TStringField;
    qryProcuraProdutoscodigo: TLargeintField;
    qryProcuraProdutosfilial: TIntegerField;
    qryProcuraProdutospreco: TFloatField;
    dsrProcuraProdutos: TtecDataSource;
    qryProdutosDadosFiscaisdadofiscal: TIntegerField;
    qryProdutosDadosFiscaisfilial: TIntegerField;
    qryItensRequisicoesvalor: TFloatField;
    qryItensRequisicoeslinha: TStringField;
    qryItensRequisicoescoluna: TStringField;
    qryItensRequisicoesvalorgrade1: TStringField;
    qryItensRequisicoesvalorgrade2: TStringField;
    qryProdutosContratoslinha: TStringField;
    qryProdutosContratoscoluna: TStringField;
    qryProdutosContratosvalorgrade1: TStringField;
    qryProdutosContratosvalorgrade2: TStringField;
    qryProdutosDadosFiscaislinha: TStringField;
    qryProdutosDadosFiscaiscoluna: TStringField;
    qryProdutosDadosFiscaisvalorgrade1: TStringField;
    qryProdutosDadosFiscaisvalorgrade2: TStringField;
    qryItensRequisicoesdescricaoprodutolc: TStringField;
    qryItensRequisicoesentnumero: TIntegerField;
    qryItensRequisicoesentcomplemento: TStringField;
    qryClientesRequisicoesnumero: TIntegerField;
    qryClientesRequisicoescomplemento: TStringField;
    procedure qryItensRequisicoesAfterScroll(DataSet: TDataSet);
    procedure dsrItensRequisicoesDataChange(Sender: TObject;
      Field: TField);
    procedure qryProdutosContratosAfterScroll(DataSet: TDataSet);
    procedure qryProdutosDadosFiscaisAfterScroll(DataSet: TDataSet);
    procedure qryItensRequisicoesCalcFields(DataSet: TDataSet);
  private
    FDataFinal: string;
    FFilialdeMontagem: String;
    FGrupoFilialdeMontagem: String;
    FDataInicial: string;
    FMontadorMontagem: String;
    FDatadeMontagem: String;
    FCodigoTabeladeMontagem: string;
    FTipodeMontagem: string;
    FDescricaoTabeladeMontagem: String;
    FValordaMontagem: String;
    FOnScrollLinhaColunaGradeitensRequisicoes: TNotifyEvent;
    FOnScrollLinhaColunaGradeProdutosContratos: TNotifyEvent;
    FOnScrollLinhaColunaGradeProdutosDadosFiscais: TNotifyEvent;
    function GetConsultaFiliais: TZDataSet;
    function GetConsultaGrupoFiliais: TZDataSet;
    function GetConsultaMontadores: TZDataSet;
    function GetTotalRegistros: Integer;
    procedure SetDataFinal(const Value: string);
    procedure SetDataInicial(const Value: string);
    procedure SetFilialdeMontagem(const Value: String);
    procedure SetGrupoFilialdeMontagem(const Value: String);
    procedure SetMontadorMontagem(const Value: String);
    function GetTabelaItensRequisicoes: TZDataSet;
    procedure SetRequisicoesItensTabeladeMontagem(const Value: integer);
    function GetConsultaTabelademontagens: TZDataSet;
    procedure SetTipodeMontagem(const Value: string);
    procedure SetCodigoTabeladeMontagem(const Value: string);
    function GetRequisicaoDadoFiscal: Integer;
    function GetColunadaGradeItensRequisicoes: String;
    function GetLinhadaGradeItensRequisicoes: String;
    function GetColunadaGradeProdutosContratos: String;
    function GetLinhadaGradeProdutosContratos: String;
    function GetColunadaGradeProdutosDadosFiscais: String;
    function GetLinhadaGradeProdutosDadosFiscais: String;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TipoProcuraRequisicoes);
    procedure FechaTabelaPesquisa(TipoPesquisa: TipoProcuraRequisicoes);
    procedure Selecionar(TipoPesquisa: TipoProcuraRequisicoes);
    property ConsultaFiliais: TZDataSet read GetConsultaFiliais;
    property ConsultaGrupoFiliais: TZDataSet read GetConsultaGrupoFiliais;
    property ConsultaMontadores: TZDataSet read GetConsultaMontadores;
    property ConsultaTabeladeMontagens: TZDataSet read GetConsultaTabelademontagens;
    property TabelaItensRequisicoes: TZDataSet read GetTabelaItensRequisicoes;
    function ExisteFilial(NomeCampo: String; Value: Variant): Boolean;
    function ExisteGrupoFilial(NomeCampo: String; Value: Variant): Boolean;
    function ExisteMontador(NomeCampo: String; Value: Variant): Boolean;
    property TotalRegistros: Integer read GetTotalRegistros;
    property DataInicial: string read FDataInicial write SetDataInicial;
    property DataFinal: string read FDataFinal write SetDataFinal;
    property FilialdeMontagem: String read FFilialdeMontagem write SetFilialdeMontagem;
    property GrupoFilialdeMontagem: String read FGrupoFilialdeMontagem write SetGrupoFilialdeMontagem;
    property MontadorMontagem: String read FMontadorMontagem write SetMontadorMontagem;
    function EditarItensRequisicoes: Boolean;
    function GravarItensRequisicoes: boolean;
    property RequisicoesItensTabeladeMontagem: integer write SetRequisicoesItensTabeladeMontagem;
    function ExisteTabeladeMontagem(NomeCampo: String; Value: Variant): Boolean;
    procedure GerarFechamentoRequisicoes;
    procedure SelecionarFechamentoRequisicoes;
    property CodigoTabeladeMontagem: string read FCodigoTabeladeMontagem write SetCodigoTabeladeMontagem;
    property DescricaoTabeladeMontagem: String read FDescricaoTabeladeMontagem write FDescricaoTabeladeMontagem;
    property TipodeMontagem: string read FTipodeMontagem write SetTipodeMontagem;
    property DatadeMontagem: String read FDatadeMontagem write FDatadeMontagem;
    property ValordaMontagem: String read FValordaMontagem write FValordaMontagem;
    procedure CalcularValorPagto;
    property RequisicaoDadoFiscal: Integer read GetRequisicaoDadoFiscal;
    procedure MarcarSelecionados(Marcando, Todos: Boolean);

    property OnScrollLinhaColunaGradeItensRequisicoes    : TNotifyEvent read FOnScrollLinhaColunaGradeitensRequisicoes write FOnScrollLinhaColunaGradeItensRequisicoes;
    property LinhadaGradeItensRequisicoes: String read GetLinhadaGradeItensRequisicoes;
    property ColunadaGradeItensRequisicoes: String read GetColunadaGradeItensRequisicoes;

    property OnScrollLinhaColunaGradeProdutosContratos    : TNotifyEvent read FOnScrollLinhaColunaGradeProdutosContratos write FOnScrollLinhaColunaGradeProdutosContratos;
    property LinhadaGradeProdutosContratos: String read GetLinhadaGradeProdutosContratos;
    property ColunadaGradeProdutosContratos: String read GetColunadaGradeProdutosContratos;

    property OnScrollLinhaColunaGradeProdutosDadosFiscais    : TNotifyEvent read FOnScrollLinhaColunaGradeProdutosDadosFiscais write FOnScrollLinhaColunaGradeProdutosDadosFiscais;
    property LinhadaGradeProdutosDadosFiscais: String read GetLinhadaGradeProdutosDadosFiscais;
    property ColunadaGradeProdutosDadosFiscais: String read GetColunadaGradeProdutosDadosFiscais;


  end;

var
  dtmFechamentoRequisicoesMontagens: TdtmFechamentoRequisicoesMontagens;

implementation
{$R *.dfm}

const
 WhereFiliaisMontagem = 66;
 WhereMontador        = 67;


{ TdtmFechamentoRequisicoesMontagens }

procedure TdtmFechamentoRequisicoesMontagens.AbreTabelaPesquisa(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
  case TipoPesquisa of
   tpRequisicoesFiliaisdeMontagem        :abre(ctConsultaFiliaisdeMontagem);
   tpRequisicoesGrupoFiliaisdeMontagem   :abre(ctConsultaGrupoFiliaisMontagem);
   tpRequisicoesMontadores               :abre(ctConsultaMontadoresMontagem);
   tpRequisicoesItensTabeladeMontagem,
   tpRequisicoesLerDadosTabeladeMontagem :Abre(ctConsultaTabelaMontagem);
  end
end;

constructor TdtmFechamentoRequisicoesMontagens.Create(AOwner: TComponent);
begin
  inherited;
  qryFilialMontagem.Tag          := ctTabelas;
  qryGrupoFiliaisMontagem.Tag    := ctTabelas;
  qryMontador.Tag                := ctTabelas;
  qryProcuraTabeladeMontagem.Tag := ctTabelas;
  qryConsultaFiliais.Tag         := ctConsultaFiliaisdeMontagem;
  qryConsultaGrupoFiliais.Tag    := ctConsultaGrupoFiliaisMontagem;
  qryConsultaMontador.Tag        := ctConsultaMontadoresMontagem;
  qryConsultaTabeladeMontagem.Tag:= ctConsultaTabelaMontagem;
  qryItensRequisicoesquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosContratosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosDadosFiscaisquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosContratoscancelado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMontador.Params[1].AsString :='U';
end;

function TdtmFechamentoRequisicoesMontagens.ExisteFilial(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaFiliais, Nomecampo, Value);
end;

function TdtmFechamentoRequisicoesMontagens.ExisteGrupoFilial(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaGrupoFiliais, Nomecampo, Value);
end;

function TdtmFechamentoRequisicoesMontagens.ExisteMontador(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaMontador, Nomecampo, Value);
end;

procedure TdtmFechamentoRequisicoesMontagens.FechaTabelaPesquisa(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
  case TipoPesquisa of
   tpRequisicoesFiliaisdeMontagem        : fecha(ctConsultaFiliaisdeMontagem);
   tpRequisicoesGrupoFiliaisdeMontagem   : fecha(ctConsultaGrupoFiliaisMontagem);
   tpRequisicoesMontadores               : fecha(ctConsultaMontadoresMontagem);
   tpRequisicoesItensTabeladeMontagem,
   tpRequisicoesLerDadosTabeladeMontagem : fecha(ctConsultaTabelaMontagem);
  end
end;

function TdtmFechamentoRequisicoesMontagens.GetConsultaFiliais: TZDataSet;
begin
  result := qryConsultaFiliais;
end;

function TdtmFechamentoRequisicoesMontagens.GetConsultaGrupoFiliais: TZDataSet;
begin
 result:=qryConsultaGrupoFiliais;
end;

function TdtmFechamentoRequisicoesMontagens.GetConsultaMontadores: TZDataSet;
begin
  result := qryConsultaMontador;
end;

function TdtmFechamentoRequisicoesMontagens.GetTotalRegistros: Integer;
begin
  result := qryItensRequisicoes.RecordCount;
end;

procedure TdtmFechamentoRequisicoesMontagens.qryItensRequisicoesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryItensRequisicoes.ControlsDisabled then
  begin
   RefazConsulta(qryProdutosContratos, [0], [qryItensRequisicoescontrato.AsVariant]);
   RefazConsulta(qryClientesRequisicoes, [0,1], [qryItensRequisicoescliente.AsVariant,
                                    qryItensRequisicoestipocliente.AsVariant]);
  end;
  RefazConsulta(qryProdutosDadosFiscais, [0], [qryItensRequisicoesdadofiscal.AsVariant]);

  if Assigned(FOnScrollLinhaColunaGradeItensRequisicoes) then
   FOnScrollLinhaColunaGradeitensRequisicoes(DataSet);
end;

procedure TdtmFechamentoRequisicoesMontagens.Selecionar(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
case TipoPesquisa of
 tpRequisicoesFiliaisdeMontagem       : RefazConsulta(qryFilialMontagem,
                                       [0],[qryConsultaFiliaiscodigo.AsInteger]);
 tpRequisicoesGrupoFiliaisdeMontagem  : RefazConsulta(qryGrupoFiliaisMontagem,
                                       [0],[qryConsultaGrupoFiliaiscodigo.AsInteger]);
 tpRequisicoesMontadores              : RefazConsulta(qryMontador,
                                       [0,1],[qryConsultaMontadorcodigo.AsVariant,
                                              qryConsultaMontadortipo.AsVariant ]);
 tpRequisicoesItensTabeladeMontagem   :RequisicoesItensTabeladeMontagem:=qryConsultaTabeladeMontagemCodigo.Asinteger;
 tpRequisicoesLerDadosTabeladeMontagem: RefazConsulta(qryProcuraTabeladeMontagem,
                                        [0], [qryConsultaTabeladeMontagemcodigo.AsVariant]);

end

end;

procedure TdtmFechamentoRequisicoesMontagens.SetDataFinal(
  const Value: string);
begin
  FDataFinal := Value;

  if value='' then
    FDataFinal:=FDataInicial;

  if FDataInicial='' then
    FDataInicial:=FDataFinal;
    
  qryItensRequisicoes.parambyname('DataInicial').asstring:=FDataInicial;
  qryItensRequisicoes.parambyname('DataFinal').asstring:=FDataFinal;
end;

procedure TdtmFechamentoRequisicoesMontagens.SetDataInicial(
  const Value: string);
begin
  FDataInicial := Value;
end;

procedure TdtmFechamentoRequisicoesMontagens.SetFilialdeMontagem(
  const Value: String);
begin
  FFilialdeMontagem := Value;
  if Value <> '' then
    qryItensRequisicoes.Sql[WhereFiliaisMontagem]:=' and (r.filialMontagem = ' + Value + ')'
  else
    qryItensRequisicoes.Sql[WhereFiliaisMontagem]:='';
end;

procedure TdtmFechamentoRequisicoesMontagens.SetGrupoFilialdeMontagem(
  const Value: String);
begin
 FGrupoFilialdeMontagem := Value;
 if (Value <> '') then
   qryItensRequisicoes.Sql[WhereFiliaisMontagem] :=
    'and (r.filialMontagem in (Select filial From filiaisgruposfiliais '+
    'Where grupo = ' + Value + '))';
end;

procedure TdtmFechamentoRequisicoesMontagens.SetMontadorMontagem(
  const Value: String);
begin
  FMontadorMontagem := Value;
  if Value <> '' then
    qryItensRequisicoes.Sql[WhereMontador]:=
    ' and (r.montador = ' + Value +
    ') and (r.tipomontador = ' + quotedstr(qryMontadortipo.AsString) + ')'
  else
    qryItensRequisicoes.Sql[WhereMontador]:='';
end;

function TdtmFechamentoRequisicoesMontagens.GetTabelaItensRequisicoes: TZDataSet;
begin
  result := qryItensRequisicoes;
end;

function TdtmFechamentoRequisicoesMontagens.EditarItensRequisicoes: Boolean;
begin
// qryItensRequisicoes.Edit;
 Result := True;
end;

function TdtmFechamentoRequisicoesMontagens.GravarItensRequisicoes: boolean;
begin
  result := false;
  if qryItensRequisicoes.CheckRequiredFields then
  begin
   if not (qryItensRequisicoes.State in [dsinsert, dsedit]) then
    qryItensRequisicoes.Edit;
   qryItensRequisicoes.Post;
   result:=true;
  end;
end;

procedure TdtmFechamentoRequisicoesMontagens.SetRequisicoesItensTabeladeMontagem(
  const Value: integer);
begin
  if Not (qryItensRequisicoes.State in [dsInsert, dsEdit]) then
    qryItensRequisicoes.Edit;
  qryItensRequisicoesmontagem.AsInteger := Value
end;

function TdtmFechamentoRequisicoesMontagens.ExisteTabeladeMontagem(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaTabeladeMontagem, Nomecampo, Value);
end;

function TdtmFechamentoRequisicoesMontagens.GetConsultaTabelademontagens: TZDataSet;
begin
  result := qryConsultaTabeladeMontagem;
end;

procedure TdtmFechamentoRequisicoesMontagens.dsrItensRequisicoesDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryItensRequisicoesmontagem then
   CalcularValorPagto
  else
  if Field = qryItensRequisicoestipodemontagem then
   CalcularValorPagto;
end;

procedure TdtmFechamentoRequisicoesMontagens.SelecionarFechamentoRequisicoes;
const
  SQLStr = ' Where (%s)';
Var
RegistroAtual : TBookmark;
SQL: String;
begin
 RegistroAtual:=qryItensRequisicoes.GetBookmark;
 try
  qryItensRequisicoes.DisableControls;
  SQL:='';
  qryItensRequisicoes.First;
  while not qryItensRequisicoes.Eof do
  begin
   if qryItensRequisicoesmarcar.AsBoolean then
   begin
    qryItensRequisicoes.Edit;
    if qryItensRequisicoesmontagem.AsString='' then
     qryItensRequisicoesmontagem.AsString:=CodigoTabeladeMontagem;
    if qryItensRequisicoestipodemontagem.AsString='' then
      qryItensRequisicoestipodemontagem.AsString:=TipodeMontagem;
    RefazConsulta(qryProcuraTabeladeMontagem, [0],
                  [qryItensRequisicoesmontagem.AsVariant]);
    CalcularValorPagto;
    if qryItensRequisicoesdatamontagem.AsString='' then
     qryItensRequisicoesdatamontagem.AsString:=DatadeMontagem;
    qryItensRequisicoes.Post;
    if SQL<>'' then
     SQL:=SQL+' or ';
    SQL:=SQL+'(ri.requisicao = '+quotedstr(qryItensRequisicoesrequisicao.AsString)+' and '+
             'ri.produto = '+quotedstr(qryItensRequisicoesproduto.AsString)+' and '+
             'ri.filial = '+quotedstr(qryItensRequisicoesfilial.AsString)+')';
   end;
   qryItensRequisicoes.Next;
  end;
 finally
  qryItensRequisicoes.GotoBookmark(RegistroAtual);
  qryItensRequisicoes.FreeBookmark(RegistroAtual);
  qryItensRequisicoes.EnableControls;
  qryRequisicoesItens.Sql[9]:= Format(SQLStr, [SQL]);
  qryRequisicoesItens.Open;
 end;
end;

procedure TdtmFechamentoRequisicoesMontagens.SetTipodeMontagem(
  const Value: string);
begin
  FTipodeMontagem := Value;
  if FCodigoTabeladeMontagem='' then
    FValordaMontagem:=''
  else
  if value='L' then
   FValordaMontagem:=qryProcuraTabeladeMontagemvalorloja.AsString
  else
  if value='D' then
   FValordaMontagem:=qryProcuraTabeladeMontagemvalordentro.AsString
  else
  if value='F' then
   FValordaMontagem:=qryProcuraTabeladeMontagemvalorfora.AsString;
end;

procedure TdtmFechamentoRequisicoesMontagens.SetCodigoTabeladeMontagem(
  const Value: string);
begin
  FCodigoTabeladeMontagem := Value;
  FDescricaoTabeladeMontagem := qryProcuraTabeladeMontagemdescricao.AsString;
end;

procedure TdtmFechamentoRequisicoesMontagens.GerarFechamentoRequisicoes;
begin
  try
   SelecionarFechamentoRequisicoes;
   qryRequisicoesItens.First;
   while not qryRequisicoesItens.Eof do
   begin
    if qryItensRequisicoes.Locate('requisicao; produto; filial',
      VarArrayof([qryRequisicoesItensrequisicao.AsString,
                  qryRequisicoesItensproduto.AsString,
                  qryRequisicoesItensfilial.AsString]), []) then
    begin
     qryRequisicoesItens.Edit;
     qryRequisicoesItensmontagem.Value:=qryItensRequisicoesmontagem.Value;
     qryRequisicoesItenstipodemontagem.Value:=qryItensRequisicoestipodemontagem.Value;
     qryRequisicoesItensdatamontagem.Value:=qryItensRequisicoesdatamontagem.Value;
     qryRequisicoesItensvalorpagto.Value:=qryItensRequisicoesvalorpagto.Value;
     qryRequisicoesItens.Post;
    end;
    qryRequisicoesItens.Next;
   end;
   Perpetrar([qryRequisicoesItens]);
  finally
   qryRequisicoesItens.Close;
  end;
end;

procedure TdtmFechamentoRequisicoesMontagens.CalcularValorPagto;
begin
 if qryItensRequisicoesmontagem.AsString='' then
 begin
  qryItensRequisicoesdescricaomontagem.asstring:='';
  qryItensrequisicoesvalorpagto.asstring:='';
 end
 else
 begin
  qryItensRequisicoesdescricaomontagem.AsString:=qryProcuraTabeladeMontagemdescricao.AsString;
  if qryProcuraTabeladeMontagemtipovalor.AsString='V' then
  begin
   if (qryItensRequisicoestipodemontagem.AsString='') or
      (qryItensRequisicoestipodemontagem.AsString='L') then
   begin
    qryItensRequisicoestipodemontagem.asstring:='L';
    qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*qryProcuraTabeladeMontagemvalorloja.AsCurrency;
   end
   else
   if qryItensRequisicoestipodemontagem.AsString='D' then
    qryItensRequisicoesvalorpagto.AsCurrency:=
      qryItensRequisicoesquantidade.AsCurrency*qryProcuraTabeladeMontagemvalordentro.AsCurrency
   else
   if qryItensRequisicoestipodemontagem.AsString='F' then
    qryItensRequisicoesvalorpagto.AsCurrency:=
     qryItensRequisicoesquantidade.AsCurrency*qryProcuraTabeladeMontagemvalorfora.AsCurrency;
  end
  else
  if Requisicaodadofiscal=0 then
  begin
    RefazConsulta(qryProcuraProdutos, [0,1],
                     [qryItensRequisicoesproduto.AsVariant,
                      qryItensRequisicoesfilial.AsVariant]);
    if (qryItensRequisicoestipodemontagem.AsString='') or
       (qryItensRequisicoestipodemontagem.AsString='L') then
    begin
     qryItensRequisicoestipodemontagem.AsString:='L';
     qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*
       ((qryProcuraProdutospreco.AsCurrency*
         qryProcuraTabeladeMontagemvalorloja.AsCurrency)/100);
    end
    else
    if qryItensRequisicoestipodemontagem.AsString='D' then
       qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*
       ((qryProcuraProdutospreco.AsCurrency*
        qryProcuraTabeladeMontagemvalordentro.AsCurrency)/100)
    else
    if qryItensRequisicoestipodemontagem.AsString='F' then
       qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*
       ((qryProcuraProdutospreco.AsCurrency*
        qryProcuraTabeladeMontagemvalorfora.AsCurrency)/100);
  end
  else
  if qryProdutosDadosFiscais.Locate('dadofiscal; produto; filial',
       VarArrayOf([qryItensRequisicoesdadofiscal.AsString,
                  qryItensRequisicoesproduto.asString,
                  qryItensRequisicoesfilial.asString]), []) then
  begin
    if (qryItensRequisicoestipodemontagem.AsString='') or
       (qryItensRequisicoestipodemontagem.AsString='L') then
    begin
     qryItensRequisicoestipodemontagem.AsString:='L';
     qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*
       ((qryProdutosDadosFiscaisprecovenda.AsCurrency*
        qryProcuraTabeladeMontagemvalorloja.AsCurrency)/100);
    end
    else
    if qryItensRequisicoestipodemontagem.AsString='D' then
       qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*
       ((qryProdutosDadosFiscaisprecovenda.AsCurrency*
        qryProcuraTabeladeMontagemvalordentro.AsCurrency)/100)
    else
    if qryItensRequisicoestipodemontagem.AsString='F' then
       qryItensRequisicoesvalorpagto.AsCurrency:=
       qryItensRequisicoesquantidade.AsCurrency*
       ((qryProdutosDadosFiscaisprecovenda.AsCurrency*
        qryProcuraTabeladeMontagemvalorfora.AsCurrency)/100);
  end;
 end;
end;

function TdtmFechamentoRequisicoesMontagens.GetRequisicaoDadoFiscal: Integer;
begin
  result := qryItensRequisicoesdadofiscal.AsInteger;
end;

procedure TdtmFechamentoRequisicoesMontagens.MarcarSelecionados(Marcando,
  Todos: Boolean);
begin
  MarcarRegistros(qryItensRequisicoes,
                  qryItensRequisicoesmarcar,
                  qryItensRequisicoesvalor,
                  Marcando,
                  Todos);
end;

function TdtmFechamentoRequisicoesMontagens.GetColunadaGradeItensRequisicoes: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryItensRequisicoescoluna.AsString)
end;

function TdtmFechamentoRequisicoesMontagens.GetLinhadaGradeItensRequisicoes: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryItensRequisicoeslinha.AsString)
end;

procedure TdtmFechamentoRequisicoesMontagens.qryProdutosContratosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGradeProdutosContratos) then
   FOnScrollLinhaColunaGradeProdutosContratos(DataSet);
end;

function TdtmFechamentoRequisicoesMontagens.GetColunadaGradeProdutosContratos: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosContratoscoluna.AsString)
end;

function TdtmFechamentoRequisicoesMontagens.GetLinhadaGradeProdutosContratos: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosContratoslinha.AsString)
end;

function TdtmFechamentoRequisicoesMontagens.GetColunadaGradeProdutosDadosFiscais: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosDadosFiscaiscoluna.AsString)
end;

function TdtmFechamentoRequisicoesMontagens.GetLinhadaGradeProdutosDadosFiscais: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosDadosFiscaislinha.AsString)
end;

procedure TdtmFechamentoRequisicoesMontagens.qryProdutosDadosFiscaisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGradeprodutosdadosfiscais) then
   FOnScrollLinhaColunaGradeProdutosDadosFiscais(DataSet);
end;

procedure TdtmFechamentoRequisicoesMontagens.qryItensRequisicoesCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryItensRequisicoesdescricaoprodutolc.AsString :=
    qryItensRequisicoesdescricaoproduto.AsString+' '+
    qryItensRequisicoesvalorgrade1.AsString+' '+
    qryItensRequisicoesvalorgrade2.AsString;
end;

end.

