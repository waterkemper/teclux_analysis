unit dmquitacaorequisicoesmontagens;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, ctconstantes, biblio, Variants, Types, Menus,
  clparametrossistema, ZTransact;

type
  TdtmQuitacaoRequisicoesMontagens = class(TdtmBasico)
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
    qryItensRequisicoesabertura: TDateField;
    qryItensRequisicoesrequisicao: TIntegerField;
    qryItensRequisicoesdadofiscal: TIntegerField;
    qryItensRequisicoesproduto: TLargeintField;
    qryItensRequisicoesfilial: TIntegerField;
    qryItensRequisicoesdescricaoproduto: TStringField;
    qryItensRequisicoesquantidade: TFloatField;
    qryProdutosContratosquantidade: TFloatField;
    qryProdutosDadosFiscaisquantidade: TFloatField;
    qryProdutosContratoscancelado: TFloatField;
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
    qryItensRequisicoesnomefilialemissao: TStringField;
    qryItensRequisicoesemissaodadofiscal: TDateField;
    qryItensRequisicoesserie: TStringField;
    qryItensRequisicoesnotafiscal: TIntegerField;
    qryItensRequisicoesmaquina: TIntegerField;
    qryItensRequisicoesintervensao: TIntegerField;
    qryItensRequisicoescupomfiscal: TIntegerField;
    qryItensRequisicoescliente: TIntegerField;
    qryItensRequisicoestipocliente: TStringField;
    qryItensRequisicoesfilialproduto: TStringField;
    qryItensRequisicoesvalorpagto: TFloatField;
    qryItensRequisicoesdatapagto: TDateField;
    dsrItensRequisicoes: TtecDataSource;
    qryProdutosContratos: TtecQuery;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosproduto: TLargeintField;
    qryProdutosContratosdescricao: TStringField;
    qryProdutosContratosprecovenda: TFloatField;
    qryProdutosContratosreserva: TIntegerField;
    qryProdutosContratosmontagem: TStringField;
    qryProdutosContratosentrega: TStringField;
    qryProdutosContratosbrinde: TBooleanField;
    dsrProdutosContratos: TtecDataSource;
    dsrProdutosDadosFiscais: TtecDataSource;
    qryProdutosDadosFiscais: TtecQuery;
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
    qryClientesRequisicoesnomecidade: TStringField;
    qryClientesRequisicoesnomebairro: TStringField;
    dsrClientesRequisicoes: TtecDataSource;
    qryMontador: TtecQuery;
    qryMontadorcodigo: TIntegerField;
    qryMontadornome: TStringField;
    qryMontadortipo: TStringField;
    dsrMontador: TtecDataSource;
    qryConsultaMontador: TtecQuery;
    qryConsultaMontadornome: TStringField;
    qryConsultaMontadorcodigo: TIntegerField;
    qryConsultaMontadortipo: TStringField;
    qryConsultaMontadortipoorig: TStringField;
    qryRequisicoesItens: TtecQuery;
    qryRequisicoesItensrequisicao: TIntegerField;
    qryRequisicoesItensproduto: TLargeintField;
    qryRequisicoesItensfilial: TIntegerField;
    qryRequisicoesItensdatapagto: TDateField;
    qryItensRequisicoesdatahora: TDateTimeField;
    qryItensRequisicoesfilialmontagem: TIntegerField;
    qryItensRequisicoesnomefilialmontagem: TStringField;
    qryItensRequisicoesmontador: TIntegerField;
    qryItensRequisicoesnomemontador: TStringField;
    qryItensRequisicoesvendedor: TIntegerField;
    qryItensRequisicoesnomevendedor: TStringField;
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
    qryItensRequisicoesendnumero: TIntegerField;
    qryItensRequisicoesendcomplemento: TStringField;
    qryClientesRequisicoesnumero: TIntegerField;
    qryClientesRequisicoescomplemento: TStringField;
    procedure qryItensRequisicoesAfterScroll(DataSet: TDataSet);
    procedure qryProdutosContratosAfterScroll(DataSet: TDataSet);
    procedure qryProdutosDadosFiscaisAfterScroll(DataSet: TDataSet);
  private
    FMontadorMontagem: String;
    FGrupoFilialdeMontagem: String;
    FDataInicial: string;
    FDataFinal: string;
    FFilialdeMontagem: String;
    FDatadePagto: String;
    FOnScrollLinhaColunaGradeProdutosDadosFiscais: TNotifyEvent;
    FOnScrollLinhaColunaGradeitensRequisicoes: TNotifyEvent;
    FOnScrollLinhaColunaGradeProdutosContratos: TNotifyEvent;
    function GetConsultaFiliais: TZDataSet;
    function GetConsultaGrupoFiliais: TZDataSet;
    function GetConsultaMontadores: TZDataSet;
    function GetTotalRegistros: Integer;
    procedure SetDataFinal(const Value: string);
    procedure SetDataInicial(const Value: string);
    procedure SetFilialdeMontagem(const Value: String);
    procedure SetGrupoFilialdeMontagem(const Value: String);
    procedure SetMontadorMontagem(const Value: String);
    function GetColunadaGradeItensRequisicoes: String;
    function GetColunadaGradeProdutosContratos: String;
    function GetColunadaGradeProdutosDadosFiscais: String;
    function GetLinhadaGradeItensRequisicoes: String;
    function GetLinhadaGradeProdutosContratos: String;
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
    function ExisteFilial(NomeCampo: String; Value: Variant): Boolean;
    function ExisteGrupoFilial(NomeCampo: String; Value: Variant): Boolean;
    function ExisteMontador(NomeCampo: String; Value: Variant): Boolean;
    property TotalRegistros: Integer read GetTotalRegistros;
    property DataInicial: string read FDataInicial write SetDataInicial;
    property DataFinal: string read FDataFinal write SetDataFinal;
    property FilialdeMontagem: String read FFilialdeMontagem write SetFilialdeMontagem;
    property GrupoFilialdeMontagem: String read FGrupoFilialdeMontagem write SetGrupoFilialdeMontagem;
    property MontadorMontagem: String read FMontadorMontagem write SetMontadorMontagem;
    property DatadePagto: String read FDatadePagto write FDatadePagto;
    procedure GerarQuitacaoRequisicoes;
    procedure SelecionarQuitacaoRequisicoes;
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
  dtmQuitacaoRequisicoesMontagens: TdtmQuitacaoRequisicoesMontagens;

implementation

{$R *.dfm}
const
 WhereFiliaisMontagem = 67;
 WhereMontador        = 68;


{ TdtmQuitacaoRequisicoesMontagens }

procedure TdtmQuitacaoRequisicoesMontagens.AbreTabelaPesquisa(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
  case TipoPesquisa of
   tpRequisicoesFiliaisdeMontagem        :abre(ctConsultaFiliaisdeMontagem);
   tpRequisicoesGrupoFiliaisdeMontagem   :abre(ctConsultaGrupoFiliaisMontagem);
   tpRequisicoesMontadores               :abre(ctConsultaMontadoresMontagem);
  end
end;

constructor TdtmQuitacaoRequisicoesMontagens.Create(AOwner: TComponent);
begin
  inherited;
  qryFilialMontagem.Tag          := ctTabelas;
  qryGrupoFiliaisMontagem.Tag    := ctTabelas;
  qryMontador.Tag                := ctTabelas;
  qryConsultaFiliais.Tag         := ctConsultaFiliaisdeMontagem;
  qryConsultaGrupoFiliais.Tag    := ctConsultaGrupoFiliaisMontagem;
  qryConsultaMontador.Tag        := ctConsultaMontadoresMontagem;
  qryItensRequisicoesquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosContratosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosDadosFiscaisquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosContratoscancelado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMontador.Params[1].AsString :='U';
end;

function TdtmQuitacaoRequisicoesMontagens.ExisteFilial(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaFiliais, Nomecampo, Value);
end;

function TdtmQuitacaoRequisicoesMontagens.ExisteGrupoFilial(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaGrupoFiliais, Nomecampo, Value);
end;

function TdtmQuitacaoRequisicoesMontagens.ExisteMontador(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaMontador, Nomecampo, Value);
end;

procedure TdtmQuitacaoRequisicoesMontagens.FechaTabelaPesquisa(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
  case TipoPesquisa of
   tpRequisicoesFiliaisdeMontagem        : fecha(ctConsultaFiliaisdeMontagem);
   tpRequisicoesGrupoFiliaisdeMontagem   : fecha(ctConsultaGrupoFiliaisMontagem);
   tpRequisicoesMontadores               : fecha(ctConsultaMontadoresMontagem);
  end
end;

function TdtmQuitacaoRequisicoesMontagens.GetConsultaFiliais: TZDataSet;
begin
  result := qryConsultaFiliais;
end;

function TdtmQuitacaoRequisicoesMontagens.GetConsultaGrupoFiliais: TZDataSet;
begin
 result:=qryConsultaGrupoFiliais;
end;

function TdtmQuitacaoRequisicoesMontagens.GetConsultaMontadores: TZDataSet;
begin
  result := qryConsultaMontador;
end;

function TdtmQuitacaoRequisicoesMontagens.GetTotalRegistros: Integer;
begin
  result := qryItensRequisicoes.RecordCount;
end;

procedure TdtmQuitacaoRequisicoesMontagens.Selecionar(
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
end

end;

procedure TdtmQuitacaoRequisicoesMontagens.SetDataFinal(
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

procedure TdtmQuitacaoRequisicoesMontagens.SetDataInicial(
  const Value: string);
begin
  FDataInicial := Value;
end;

procedure TdtmQuitacaoRequisicoesMontagens.SetFilialdeMontagem(
  const Value: String);
begin
  FFilialdeMontagem := Value;
  if Value <> '' then
    qryItensRequisicoes.Sql[WhereFiliaisMontagem]:=' and (r.filialMontagem = ' + Value + ')'
  else
    qryItensRequisicoes.Sql[WhereFiliaisMontagem]:='';
end;

procedure TdtmQuitacaoRequisicoesMontagens.SetGrupoFilialdeMontagem(
  const Value: String);
begin
 FGrupoFilialdeMontagem := Value;
 if (Value <> '') then
   qryItensRequisicoes.Sql[WhereFiliaisMontagem] :=
    'and (r.filialMontagem in (Select filial From filiaisgruposfiliais '+
    'Where grupo = ' + Value + '))';
end;

procedure TdtmQuitacaoRequisicoesMontagens.SetMontadorMontagem(
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

procedure TdtmQuitacaoRequisicoesMontagens.qryItensRequisicoesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryItensRequisicoes.ControlsDisabled then
  begin
   RefazConsulta(qryProdutosContratos, [0], [qryItensRequisicoescontrato.AsVariant]);
   RefazConsulta(qryProdutosDadosFiscais, [0], [qryItensRequisicoesdadofiscal.AsVariant]);
   RefazConsulta(qryClientesRequisicoes, [0,1], [qryItensRequisicoescliente.AsVariant,
                                    qryItensRequisicoestipocliente.AsVariant]);
  end;
  if Assigned(FOnScrollLinhaColunaGradeItensRequisicoes) then
   FOnScrollLinhaColunaGradeitensRequisicoes(DataSet);
                                    
end;

procedure TdtmQuitacaoRequisicoesMontagens.GerarQuitacaoRequisicoes;
begin
  try
   SelecionarQuitacaoRequisicoes;
   qryRequisicoesItens.First;
   while not qryRequisicoesItens.Eof do
   begin
    if qryItensRequisicoes.Locate('requisicao; produto; filial',
      VarArrayof([qryRequisicoesItensrequisicao.AsString,
                  qryRequisicoesItensproduto.AsString,
                  qryRequisicoesItensfilial.AsString]), []) then
    begin
     qryRequisicoesItens.Edit;
     qryRequisicoesItensdatapagto.Value:=qryItensRequisicoesdatapagto.Value;
     qryRequisicoesItens.Post;
    end;
    qryRequisicoesItens.Next;
   end;
   Perpetrar([qryRequisicoesItens]);
  finally
   qryRequisicoesItens.Close;
  end;
end;

procedure TdtmQuitacaoRequisicoesMontagens.SelecionarQuitacaoRequisicoes;
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
    qryItensRequisicoesdatapagto.AsString:=DatadePagto;
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
  qryRequisicoesItens.Sql[6]:= Format(SQLStr, [SQL]);
  qryRequisicoesItens.Open;
 end;
end;

procedure TdtmQuitacaoRequisicoesMontagens.MarcarSelecionados(Marcando,
  Todos: Boolean);
begin
  MarcarRegistros(qryItensRequisicoes,
                  qryItensRequisicoesmarcar,
                  qryItensRequisicoesvalor,
                  Marcando,
                  Todos);
end;

function TdtmQuitacaoRequisicoesMontagens.GetColunadaGradeItensRequisicoes: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryItensRequisicoescoluna.AsString)
end;

function TdtmQuitacaoRequisicoesMontagens.GetColunadaGradeProdutosContratos: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosContratoscoluna.AsString)
end;

function TdtmQuitacaoRequisicoesMontagens.GetColunadaGradeProdutosDadosFiscais: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosDadosFiscaiscoluna.AsString)
end;

function TdtmQuitacaoRequisicoesMontagens.GetLinhadaGradeItensRequisicoes: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryItensRequisicoeslinha.AsString)
end;

function TdtmQuitacaoRequisicoesMontagens.GetLinhadaGradeProdutosContratos: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosContratoslinha.AsString)
end;

function TdtmQuitacaoRequisicoesMontagens.GetLinhadaGradeProdutosDadosFiscais: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosDadosFiscaislinha.AsString)
end;

procedure TdtmQuitacaoRequisicoesMontagens.qryProdutosContratosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGradeProdutosContratos) then
   FOnScrollLinhaColunaGradeProdutosContratos(DataSet);
end;

procedure TdtmQuitacaoRequisicoesMontagens.qryProdutosDadosFiscaisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGradeprodutosdadosfiscais) then
   FOnScrollLinhaColunaGradeProdutosDadosFiscais(DataSet);
end;

end.
