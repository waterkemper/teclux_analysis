unit dmdevolucaofornecedores;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, biblio, ctconstantes, Windows, Forms, clparametrossistema, ZTransact,
  clusuario, FR_DSet, FR_DBSet, FR_Class, fmpreviewpadrao, dmgerarnotafiscal,
  Math, dmimprimefiscal;

type
  TdtmDevolucaoFornecedores = class(TdtmBasico)
    qryProdutosMovimentados: TtecQuery;
    dsrProdutosMovimentados: TtecDataSource;
    qryProdutosMovimentadoscodigoitem: TLargeintField;
    qryProdutosMovimentadositem: TStringField;
    qryProdutosMovimentadosQtdestoque: TFloatField;
    qryProdutosMovimentadosquantidade: TFloatField;
    qryProdutosMovimentadosfornecedor: TIntegerField;
    qryProdutosMovimentadosserie: TStringField;
    qryProdutosMovimentadosnumero: TIntegerField;
    qryProdutosMovimentadosdata: TDateField;
    qryProdutosMovimentadosnomefornecedor: TStringField;
    qryProdutosMovimentadosaliquotaicms: TFloatField;
    qryProdutosMovimentadosvaloricms: TFloatField;
    qryProdutosMovimentadosaliquotaipi: TFloatField;
    qryProdutosMovimentadosvaloripi: TFloatField;
    qryProdutosMovimentadospendente: TFloatField;
    qryProdutosMovimentadosmarcar: TBooleanField;
    qryProdutosMovimentadosQtsaidanf: TFloatField;
    qryDadosFiscais: TtecQuery;
    qryDadosFiscaisnumero: TIntegerField;
    qryDadosFiscaisdata: TDateField;
    qryDadosFiscaissituacao: TStringField;
    qryDadosFiscaisfilialvenda: TIntegerField;
    qryDadosFiscaisvalortotal: TFloatField;
    qryDadosFiscaisvalorvista: TFloatField;
    qryDadosFiscaisdesconto: TFloatField;
    qryDadosFiscaisvalorfrete: TFloatField;
    qryDadosFiscaisseguro: TFloatField;
    qryDadosFiscaisvaloripi: TFloatField;
    qryDadosFiscaisdespesasacessorias: TFloatField;
    qryDadosFiscaiscodigofiscal: TIntegerField;
    qryDadosFiscaisestadocfo: TStringField;
    qryDadosFiscaisfilialemissao: TIntegerField;
    qryDadosFiscaisnatureza: TStringField;
    qryDadosFiscaisdescricaosemprodutos: TStringField;
    qryDadosFiscaisviatransporte: TStringField;
    qryDadosFiscaisdatasaida: TDateField;
    qryDadosFiscaisfornecedortransporte: TIntegerField;
    qryDadosFiscaisfrete: TStringField;
    qryDadosFiscaiscliente: TIntegerField;
    qryDadosFiscaistipocliente: TStringField;
    qryDadosFiscaisestadoplaca: TStringField;
    qryDadosFiscaisplaca: TStringField;
    qryDadosFiscaisnome: TStringField;
    qryDadosFiscaisrua: TStringField;
    qryDadosFiscaisbairro: TIntegerField;
    qryDadosFiscaiscidade: TIntegerField;
    qryDadosFiscaisestado: TStringField;
    qryDadosFiscaiscep: TIntegerField;
    qryDadosFiscaispessoatipo: TStringField;
    qryDadosFiscaispessoanumero: TStringField;
    qryDadosFiscaisfonenumero: TIntegerField;
    qryDadosFiscaisfoneddd: TIntegerField;
    qryDadosFiscaisdocumento: TStringField;
    qryDadosFiscaisobservacoes: TStringField;
    qryDadosFiscaiscodigonatureza: TIntegerField;
    qryDadosFiscaisacrescimofinanceiro: TFloatField;
    qryDadosFiscaisvalorprodutos: TFloatField;
    qryDadosFiscaistotalvaloricmssubstituicao: TFloatField;
    qryDadosFiscaisbaseicms: TFloatField;
    qryDadosFiscaisvaloricms: TFloatField;
    qryDadosFiscaisvalorissqn: TFloatField;
    dsrDadosFiscais: TtecDataSource;
    qryProdutos: TtecQuery;
    qryCalculos: TtecQuery;
    qryCalculosdadofiscal: TIntegerField;
    qryCalculosnumero: TIntegerField;
    qryCalculostipo: TStringField;
    qryCalculosaliquota: TFloatField;
    qryCalculosbase: TFloatField;
    qryCalculosisentas: TFloatField;
    qryCalculosoutras: TFloatField;
    qryCalculosvalor: TFloatField;
    qryNotas: TtecQuery;
    qryNotasfilial: TIntegerField;
    qryNotasserie: TStringField;
    qryNotasnumero: TIntegerField;
    qryNotasdadofiscal: TIntegerField;
    qrySeriesFiliais: TtecQuery;
    qrySeriesFiliaisvalor: TStringField;
    qrySeriesFiliaisnumeroinicial: TIntegerField;
    qrySeriesFiliaisnumerofinal: TIntegerField;
    qrySeriesFiliaismodelonota: TIntegerField;
    qryProdutosMovimentadoscodigonota: TIntegerField;
    qryProdutosNotaFiscal: TtecQuery;
    dsrProdutosNotaFiscal: TtecDataSource;
    spcDadosFiscaisProximo: TtecQuery;
    spcDadosFiscaisProximonumero: TIntegerField;
    qryFornecedorDestino: TtecQuery;
    qryEstoqueBloqueio: TtecQuery;
    qryEstoqueBloqueioproduto: TLargeintField;
    qryEstoqueBloqueiofilial: TIntegerField;
    qryEstoqueBloqueioemestoque: TFloatField;
    qryEstoqueBloqueioreservaprevia: TFloatField;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentosreferencia: TStringField;
    qryMovimentosoperacao: TStringField;
    qryMovimentosemestoque: TFloatField;
    qryMovimentosreservado: TFloatField;
    qryMovimentostransito: TFloatField;
    qryMovimentosdemonstracao: TFloatField;
    qryMovimentosconserto: TFloatField;
    qryMovimentosfuturo: TFloatField;
    qryMovimentosdanificada: TFloatField;
    qryMovimentosfinanceiro: TFloatField;
    qryMovimentosvalor: TFloatField;
    qryMovimentosdata: TDateField;
    qryMovimentostrfproduto: TLargeintField;
    qryMovimentostrffilial: TIntegerField;
    qryMovimentoscliente: TIntegerField;
    qryMovimentostipocliente: TStringField;
    qryMovimentosdadofiscal: TIntegerField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
    qryExisteEstoque: TtecQuery;
    qryExisteEstoqueproduto: TLargeintField;
    qryExisteEstoquefilial: TIntegerField;
    qryEstoques: TtecQuery;
    qryEstoquesproduto: TLargeintField;
    qryEstoquesfilial: TIntegerField;
    qryEstoquesemestoque: TFloatField;
    qryEstoquesreservado: TFloatField;
    qryEstoquestransito: TFloatField;
    qryEstoquesdemonstracao: TFloatField;
    qryEstoquesconserto: TFloatField;
    qryEstoquesfuturo: TFloatField;
    qryEstoquesdanificada: TFloatField;
    qryEstoquesestoquefisico: TFloatField;
    qryProdutosMovimentadosunidade: TStringField;
    qryNotasPag: TtecQuery;
    qryDadosFiscaismodelodocto: TStringField;
    frpProdutosMovimentados: TfrReport;
    fdsProdutosMovimentados: TfrDBDataSet;
    qryDadosFiscaismanual: TBooleanField;
    qryDadosFiscaiscontrato: TStringField;
    qryDadosFiscaiscodigofiscalservico: TIntegerField;
    qryDadosFiscaisvendedor: TIntegerField;
    qryDadosFiscaisagente: TIntegerField;
    qryDadosFiscaisplano: TIntegerField;
    qryDadosFiscaisconceito: TIntegerField;
    qryDadosFiscaisdebitar: TIntegerField;
    qryDadosFiscaiscreditar: TIntegerField;
    qryDadosFiscaishistorico: TIntegerField;
    qryDadosFiscaistotalbaseicmsproprio: TFloatField;
    qryDadosFiscaistotalvaloricmsproprio: TFloatField;
    qryDadosFiscaistotalbaseicmssubstituicao: TFloatField;
    qryDadosFiscaisaliquotaicmsproprio: TFloatField;
    qryDadosFiscaisanexotres: TStringField;
    qryDadosFiscaisacrescimoexcluido: TFloatField;
    qryDadosFiscaisicmsexcluido: TFloatField;
    qryDadosFiscaisvalorservicos: TFloatField;
    qryDadosFiscaisirretido: TFloatField;
    qryDadosFiscaisinssretido: TFloatField;
    qryDadosFiscaisissretido: TFloatField;
    qryDadosFiscaiscofinsretido: TFloatField;
    qryDadosFiscaispisretido: TFloatField;
    qryDadosFiscaiscsllretido: TFloatField;
    qryDadosFiscaissubstituicaoipi: TBooleanField;
    qryDadosFiscaisobservacoescomplementar: TStringField;
    qryDadosFiscaisobscliente: TStringField;
    qryDadosFiscaisobsclienteipisuspenso: TStringField;
    qryDadosFiscaisobservacoesicmssubstituido: TStringField;
    qryDadosFiscaisdadofiscalcomplementar: TIntegerField;
    qryDadosFiscaisversaolayout: TFloatField;
    qryDadosFiscaisnrdocumento: TIntegerField;
    qryDadosFiscaiscodaleatorio: TIntegerField;
    qryDadosFiscaisformapagto: TIntegerField;
    qryDadosFiscaisformatodanfe: TIntegerField;
    qryDadosFiscaisformaemissao: TIntegerField;
    qryDadosFiscaisdigchaveacesso: TIntegerField;
    qryDadosFiscaisambiente: TIntegerField;
    qryDadosFiscaisfinalidadenf: TIntegerField;
    qryDadosFiscaisprocemissao: TIntegerField;
    qryDadosFiscaisversaoteclux: TStringField;
    qryDadosFiscaistotalimportacao: TFloatField;
    qryDadosFiscaistotalvalorpis: TFloatField;
    qryDadosFiscaistotalvalorcofins: TFloatField;
    qryDadosFiscaisnomebairro: TStringField;
    qryDadosFiscaisnomecidade: TStringField;
    qryDadosFiscaiscidadeibge: TIntegerField;
    qryDadosFiscaispais: TIntegerField;
    qryDadosFiscaisnomepais: TStringField;
    qryDadosFiscaislocalretirada_cnpj: TStringField;
    qryDadosFiscaislocalretirada_rua: TStringField;
    qryDadosFiscaislocalretirada_complemento: TStringField;
    qryDadosFiscaislocalretirada_bairro: TIntegerField;
    qryDadosFiscaislocalretirada_nomebairro: TStringField;
    qryDadosFiscaislocalretirada_cidade: TIntegerField;
    qryDadosFiscaislocalretirada_cep: TIntegerField;
    qryDadosFiscaislocalretirada_nomecidade: TStringField;
    qryDadosFiscaislocalretirada_cidadeibge: TIntegerField;
    qryDadosFiscaislocalretirada_estado: TStringField;
    qryDadosFiscaislocalentrega_cnpj: TStringField;
    qryDadosFiscaislocalentrega_rua: TStringField;
    qryDadosFiscaislocalentrega_complemento: TStringField;
    qryDadosFiscaislocalentrega_bairro: TIntegerField;
    qryDadosFiscaislocalentrega_nomebairro: TStringField;
    qryDadosFiscaislocalentrega_cidade: TIntegerField;
    qryDadosFiscaislocalentrega_cep: TIntegerField;
    qryDadosFiscaislocalentrega_nomecidade: TStringField;
    qryDadosFiscaislocalentrega_cidadeibge: TIntegerField;
    qryDadosFiscaislocalentrega_estado: TStringField;
    qryDadosFiscaistransportadora_cnpj: TStringField;
    qryDadosFiscaistransportadora_ie: TStringField;
    qryDadosFiscaistransportadora_nome: TStringField;
    qryDadosFiscaistransportadora_rua: TStringField;
    qryDadosFiscaistransportadora_bairro: TIntegerField;
    qryDadosFiscaistransportadora_nomebairro: TStringField;
    qryDadosFiscaistransportadora_cidade: TIntegerField;
    qryDadosFiscaistransportadora_nomecidade: TStringField;
    qryDadosFiscaistransportadora_cidadeibge: TIntegerField;
    qryDadosFiscaistransportadora_estado: TStringField;
    qryDadosFiscaistransportadora_rntc: TStringField;
    qryDadosFiscaisinfcomplementar: TStringField;
    qryDadosFiscaisexportacoes_ufembarque: TStringField;
    qryDadosFiscaisexportacoes_localembarque: TStringField;
    qryDadosFiscaisendnumero: TIntegerField;
    qryDadosFiscaisendcomplemento: TStringField;
    qryDadosFiscaislocalretirada_numero: TIntegerField;
    qryDadosFiscaislocalentrega_numero: TIntegerField;
    qryDadosFiscaissuframa: TStringField;
    qryDadosFiscaisiesubsttributario: TStringField;
    qryDadosFiscaisnumlotenfe: TStringField;
    qryDadosFiscaisnumrecibonfe: TStringField;
    qryDadosFiscaisnumprotocolonfe: TStringField;
    qryDadosFiscaisemail: TStringField;
    qryDadosFiscaisdatacancelamento: TDateField;
    qryDadosFiscaisnumcancelamentonfe: TStringField;
    qryDadosFiscaischv_nfe: TStringField;
    qryDadosFiscaisnuminutilizacaonfe: TStringField;
    qryDadosFiscaisdatahoraemissao: TDateTimeField;
    qryDadosFiscaisregimetributario: TIntegerField;
    qryDadosFiscaisnosimples: TBooleanField;
    qryDadosFiscaisdhprocnfe: TDateTimeField;
    qryDadosFiscaisusuariologadoalteracao: TIntegerField;
    qryDadosFiscaisusuarioalteracao: TIntegerField;
    qryDadosFiscaisdatahoraalteracaousuario: TDateTimeField;
    qryDadosFiscaisnotavinculada: TBooleanField;
    qryDadosFiscaisdadofiscalvinculado: TIntegerField;
    qryDadosFiscaishsaient: TDateTimeField;
    qryDadosFiscaistotalprodutos: TFloatField;
    qryDadosFiscaistotalQtdeprodutos: TFloatField;
    qryDadosFiscaisvcredicmssn: TFloatField;
    qryDadosFiscaisvicmsstret: TFloatField;
    qrySeriesFiliaisfilial: TIntegerField;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryProdutosMovimentadosAfterInsert(DataSet: TDataSet);
    procedure qryProdutosMovimentadosAfterPost(DataSet: TDataSet);
    procedure qryProdutosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryDadosFiscaisNewRecord(DataSet: TDataSet);
    procedure qryProdutosMovimentadosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure frpProdutosMovimentadosBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    CodigoNota : integer;
    FCodigoNatureza: integer;
    FCodigoFiscal: integer;
    FqryProcuraNaturezasCFOP: TtecQuery;
    FDadoFiscal: integer;
    fDataInclusaoNF: tDateTime;
    fObservacoes: String;
    procedure CalcularSaldoPendente;
    function  VerificarSerieFilial: Boolean;
    function  PreencherNotaFiscal: Boolean;
    procedure PreencherDadoFiscal;
    procedure IncluirImpostos;
    procedure AtribuirValoresImpostosDadosFiscais;

    function IncluirProdutos: Boolean;
    function  NovoNumeroDadoFiscal: Integer;
    procedure InicializarTabelas;
    procedure FinalizarTabelas;
    procedure BloquearEstoque;
    procedure NovoMovimento(Produto: String; Filial: Integer);

    procedure IncluirMovimentos;
    function GetDadoFiscal: integer;

  protected

  public
    { Public declarations }
    Percorrendo : Boolean;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    function GravarDevolucaoFornecedor: Boolean;
    function AbrirConsulta(Data, DataLimiteNF, FilialEmissao, fornecedor,
    listagruposdeprodutos, listaclassesdeprodutos, listamarcasdeprodutos,
    localizacao: String; listagruposfornecedores: String): Boolean;

    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    function ImprimirNotasFiscais: Boolean;
    procedure ImprimirListagem;
    property qryProcuraNaturezasCFOP: TtecQuery read FqryProcuraNaturezasCFOP write FqryProcuraNaturezasCFOP;
    property DadoFiscal: integer read GetDadoFiscal write FDadoFiscal;
    property DataInclusaoNF: tDateTime read fDataInclusaoNF write fDataInclusaoNF;
    property Observacoes: String read fObservacoes write fObservacoes;

  end;

var
  dtmDevolucaoFornecedores: TdtmDevolucaoFornecedores;

implementation

{$R *.dfm}

{ TdtmDevolucaoFornecedores }


function TdtmDevolucaoFornecedores.AbrirConsulta(Data, DataLimiteNF, FilialEmissao,
Fornecedor, listagruposdeprodutos, listaclassesdeprodutos, listamarcasdeprodutos,
localizacao: String; listagruposfornecedores: String): Boolean;
const
  //SQLGrupos = 'and (c.grupo in (%s))';
  //SQLClasses = 'and (c.classe in (%s))';
  //SQLMarcas = 'and (c.marca in (%s))';
  SQLLocalizacao = 'and (e.localizacao in (%s))';

  SQLFornecedor = ' and np.fornecedor = :fornecedor ';

  SQLSelecao = ' and (m1.produto,m1.filial) in (select distinct pnp.produto,                   '+
               '                                       pnp.filial                              '+
               '                                 from notaspag np                              '+
               '                                      join produtosnotaspag pnp                '+
               '                                      on np.codigo = pnp.codigonota            '+
               '                                      join fornecedores f                      '+
               '                                      on np.fornecedor = f.codigo              '+
               '                                      join produtos p                          '+
               '                                      on pnp.produto = p.codigo                '+
               '                                      join caracteristicas c                   '+
               '                                      on p.caracteristica = c.codigo           '+
               '                                 where np.data between :DataLimiteNF and :data '+
               '                                   and np.filial = :FilialEmissao              '+
               '                                   %s                                          '+
               ' order by pnp.produto, pnp.filial )';

  SQLListaGruposFornecedores      = ' and f.grupofornecedor in (%s) ';
  SQLListaGruposdeprodutos  = ' and c.grupo           in (%s) ';
  SQLListaClassesdeprodutos = ' and c.classe          in (%s) ';
  SQLListaMarcadeprodutos   = ' and c.marca           in (%s) ';
var
  SQLSelecaoProdutos: String;
begin
  qryProdutosMovimentados.ParamByName('data').AsString := Data;

  qryProdutosMovimentados.ParamByName('DataLimiteNF').AsString := DataLimiteNF;

  qryProdutosMovimentados.ParamByName('FilialEmissao').AsString := FilialEmissao;

  SQLSelecaoProdutos := '';

  if fornecedor<>'' then
  begin
    qryProdutosMovimentados.ParamByName('Fornecedor').AsString := fornecedor;
    SQLSelecaoProdutos := SQLSelecaoProdutos + SQLFornecedor;
  end
  else
    qryProdutosMovimentados.ParamByName('Fornecedor').AsString := '0';

  qryProdutosMovimentados.ParamByName('ListaFornecedores').Value := listagruposfornecedores;

  if listagruposfornecedores<>'{}' then
    SQLSelecaoProdutos := SQLSelecaoProdutos + format(SQLListaGruposFornecedores,[trocar(trocar(ListaGruposFornecedores,'}',''),'{','')]);

  if listagruposdeprodutos<>'' then
  begin
//    qryProdutosMovimentados.MacroByName('SQLFiltroGrupos').asstring :=
//      format(SQLGrupos,[listagruposdeprodutos]);
    SQLSelecaoProdutos := SQLSelecaoProdutos + format(SQLListaGruposdeprodutos,[ListaGruposdeprodutos]);
  end
  else
//    qryProdutosMovimentados.MacroByName('SQLFiltroGrupos').asstring := '';

  if listaclassesdeprodutos<>'' then
  begin
//    qryProdutosMovimentados.MacroByName('SQLFiltroClasses').asstring :=
 //     format(SQLClasses,[listaclassesdeprodutos]);
    SQLSelecaoProdutos := SQLSelecaoProdutos + format(SQLListaClassesdeprodutos,[listaclassesdeprodutos]);
  end
  else
//    qryProdutosMovimentados.MacroByName('SQLFiltroClasses').asstring := '';

  if listamarcasdeprodutos<>'' then
  begin
//    qryProdutosMovimentados.MacroByName('SQLFiltroMarcas').asstring :=
//      format(SQLMarcas,[listamarcasdeprodutos]);
    SQLSelecaoProdutos := SQLSelecaoProdutos + format(SQLListaMarcadeprodutos,[listamarcasdeprodutos]);
  end
  else
//    qryProdutosMovimentados.MacroByName('SQLFiltroMarcas').asstring := '';

  if localizacao <> '' then
     qryProdutosMovimentados.MacroByName('SQLFiltroLocalizacao').AsString :=
       format(SQLLocalizacao,['ilike '+quotedstr(Localizacao+'%')])
  else
     qryProdutosMovimentados.MacroByName('SQLFiltroLocalizacao').AsString := '';

  if SQLSelecaoProdutos <> '' then
     qryProdutosMovimentados.MacroByName('SQLSelecao').AsString :=
      format(SQLSelecao,[SQLSelecaoProdutos]);

  ReFazConsulta(qryProdutosMovimentados,[],[]);

  result := not qryProdutosMovimentados.IsEmpty;

end;

constructor TdtmDevolucaoFornecedores.Create(AOwner: TComponent);
begin
  inherited;
  qryProdutosMovimentadosQtdestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosMovimentadosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosMovimentadospendente.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosMovimentadosQtsaidanf.DisplayFormat := ParSistema.MascaraQuantidadeGrade;

  Percorrendo := False;
  qryProdutosMovimentados.Filtered := False;
{  ListaProdutosSelecionados := ' and p.codigo <> 0 ';}
end;

destructor TdtmDevolucaoFornecedores.Destroy;
begin

  inherited;
end;


function TdtmDevolucaoFornecedores.GravarDevolucaoFornecedor: Boolean;
begin
 result := true;
end;

procedure TdtmDevolucaoFornecedores.MarcarSelecionados(Marcando,
  Todos: Boolean);
begin
  if (qryProdutosMovimentadospendente.AsCurrency<>0) or
      qryProdutosMovimentadosmarcar.AsBoolean then
    MarcarRegistros(qryProdutosMovimentados,
                    qryProdutosMovimentadosmarcar,
                    Marcando,
                    Todos);
end;

procedure TdtmDevolucaoFornecedores.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\qryProdutosMovimentados.sql') then
    Listar.loadfromfile('c:\qryProdutosMovimentados.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\qryProdutosMovimentados.sql');
  listar.free;
end;

procedure TdtmDevolucaoFornecedores.qryProdutosMovimentadosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosMovimentados.Cancel;
end;

procedure TdtmDevolucaoFornecedores.qryProdutosMovimentadosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  CalcularSaldoPendente;

end;

procedure TdtmDevolucaoFornecedores.CalcularSaldoPendente;
var
  produto : String;
  pendente: currency ;
begin
  qryProdutosMovimentados.AfterPost := nil;
  if qryProdutosMovimentadosmarcar.AsBoolean then
  begin
    qryProdutosMovimentados.Edit;
    if qryProdutosMovimentadospendente.AsCurrency >=
       qryProdutosMovimentadosquantidade.AsCurrency then
    begin
      qryProdutosMovimentadosQtsaidanf.AsCurrency := qryProdutosMovimentadosquantidade.AsCurrency;
      qryProdutosMovimentadospendente.AsCurrency := qryProdutosMovimentadospendente.AsCurrency -
                                                    qryProdutosMovimentadosQtsaidanf.AsCurrency;
    end
    else
    begin
      if qryProdutosMovimentadospendente.AsCurrency<>0 then
      begin
        qryProdutosMovimentadosQtsaidanf.AsCurrency := qryProdutosMovimentadospendente.AsCurrency;
        qryProdutosMovimentadospendente.AsCurrency := 0;
      end;
    end;
    qryProdutosMovimentados.Post;
  end
  else
  begin
    qryProdutosMovimentados.Edit;
    if qryProdutosMovimentadospendente.AsCurrency=0 then
      qryProdutosMovimentadospendente.AsCurrency :=
        qryProdutosMovimentadosQtsaidanf.AsCurrency
    else
      qryProdutosMovimentadospendente.AsCurrency :=
        qryProdutosMovimentadospendente.AsCurrency +
        qryProdutosMovimentadosQtsaidanf.AsCurrency;

    qryProdutosMovimentadosQtsaidanf.Clear;
    qryProdutosMovimentados.Post;
  end;

  pendente  := qryProdutosMovimentadospendente.AsCurrency;
  produto   := qryProdutosMovimentadositem.AsString;

  GuardarRegistroAtual(qryProdutosMovimentados,true);

  qryProdutosMovimentados.First;
  while not qryProdutosMovimentados.Eof do
  begin
    if produto = qryProdutosMovimentadositem.AsString then
    begin
      qryProdutosMovimentados.Edit;
      qryProdutosMovimentadospendente.AsCurrency := pendente;
      qryProdutosMovimentados.Post;
    end;
    qryProdutosMovimentados.Next;
  end;

  VoltarRegistroAtual(qryProdutosMovimentados);
  qryProdutosMovimentados.AfterPost := qryProdutosMovimentadosAfterPost;

end;

procedure TdtmDevolucaoFornecedores.ImprimirListagem;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= RazaoFilialBase;
//  frpProdutosMovimentados.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3;
  try
   GuardarRegistroAtual(qryProdutosMovimentados,True);
   qryProdutosMovimentados.Filtered := True;

   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   frmPreview.frCompositeReport.Reports.Add(frpProdutosMovimentados);
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free;
   qryProdutosMovimentados.Filtered := False;
   VoltarRegistroAtual(qryProdutosMovimentados);
  end;
end;

function TdtmDevolucaoFornecedores.ImprimirNotasFiscais: Boolean;
var
 SQLBloqueio: String;

begin
  try
    GuardarRegistroAtual(qryProdutosMovimentados, true);
    qryProdutosMovimentados.SortDescByField('data,fornecedor,serie,numero,codigoitem');
    qryProdutosMovimentados.First;
    while not qryProdutosMovimentados.Eof do
    begin
      if qryProdutosMovimentadosmarcar.AsBoolean then
      begin
        InicializarTabelas;
        result := VerificarSerieFilial;
        if result then
        begin
          CodigoNota := qryProdutosMovimentadoscodigonota.AsInteger;
          while (qryProdutosMovimentadosmarcar.AsBoolean and
                (CodigoNota = qryProdutosMovimentadoscodigonota.AsInteger)) and
                not (qryProdutosMovimentados.Eof) do
          begin
            if qryNotasPag.ParamByName('codigo').AsInteger <>
               qryProdutosMovimentadoscodigonota.asinteger then
              RefazConsultaPorNome(qrynotaspag,['codigo'],
                [qryProdutosMovimentadoscodigonota.asinteger]);

            RefazConsultaPorNome(qryProdutosNotaFiscal,['codigonota','produto'],
               [qryProdutosMovimentadoscodigonota.asinteger,
                qryProdutosMovimentadoscodigoitem.asString]);

            if not qryProdutosNotaFiscal.IsEmpty then
            begin
              qryProdutos.Insert;
              qryProdutos.fieldbyname('codigonota').AsInteger   := qryProdutosMovimentadoscodigonota.AsInteger;
              qryProdutos.fieldbyname('produto').AsString       := qryProdutosMovimentadoscodigoitem.AsString;
              qryprodutos.fieldbyname('descricaoproduto').AsString := qryProdutosMovimentadositem.AsString;
              qryprodutos.fieldbyname('unidade').AsString := qryProdutosMovimentadosunidade.AsString;

              qryProdutos.fieldbyname('filial').AsInteger       := qryProdutosMovimentados.Parambyname('FilialEmissao').AsInteger;
              qryProdutos.fieldbyname('quantidade').AsCurrency  := qryProdutosMovimentadosQtsaidanf.AsCurrency;
              qryProdutos.fieldbyname('precovenda').AsCurrency  := qryProdutosNotaFiscal.fieldbyname('precounitario').AsCurrency;
              qryProdutos.fieldbyname('precotabela').AsCurrency := qryProdutosNotaFiscal.fieldbyname('precounitario').AsCurrency;
              qryProdutos.fieldbyname('aliquotaicms').AsFloat   := qryProdutosNotaFiscal.fieldbyname('aliquotaicms').AsFloat;
              qryprodutos.fieldbyname('icmsvalor').AsCurrency   := qryProdutosNotaFiscal.fieldbyname('icmsvalor').AsCurrency;
              qryProdutos.fieldbyname('icmsbasecalculo').AsCurrency := qryProdutosNotaFiscal.fieldbyname('icmsbasecalculo').AsCurrency;

              qryProdutos.fieldbyname('ipibasecalculo').AsCurrency := qryProdutosNotaFiscal.fieldbyname('ipibasecalculo').AsFloat;
              qryProdutos.fieldbyname('valoripi').AsFloat       := (qryProdutosNotaFiscal.fieldbyname('valoripi').AsFloat/
                                                                   qryProdutosNotaFiscal.fieldbyname('quantidade').AsFloat) *
                                                                    qryProdutos.fieldbyname('quantidade').AsCurrency;

              qryProdutos.fieldbyname('aliquotaipi').AsFloat    := qryProdutosNotaFiscal.fieldbyname('aliquotaipi').AsFloat;

              qryprodutos.fieldbyname('pisbasecalculo').AsCurrency := qryProdutosNotaFiscal.fieldbyname('pisbasecalculo').AsFloat;
              qryprodutos.fieldbyname('pisvalor').AsCurrency       := qryProdutosNotaFiscal.fieldbyname('pisvalor').AsFloat;

              qryprodutos.fieldbyname('cofinsbasecalculo').AsCurrency := qryprodutosNotaFiscal.fieldbyname('pisbasecalculo').AsCurrency;
              qryprodutos.fieldbyname('cofinsvalor').AsCurrency       := qryProdutosNotaFiscal.fieldbyname('pisvalor').AsCurrency;

              qryProdutos.fieldbyname('incidencia').AsString    := qryProcuraNaturezasCFOP.fieldbyname('icmscst').AsString;
              qryProdutos.fieldbyname('ipicst').AsString        := qryProcuraNaturezasCFOP.fieldbyname('ipicst').AsString;
              qryProdutos.fieldbyname('piscst').AsString        := qryProcuraNaturezasCFOP.fieldbyname('piscst').AsString;
              qryProdutos.fieldbyname('cofinscst').AsString     := qryProcuraNaturezasCFOP.fieldbyname('cofinscst').AsString;
              qryProdutos.fieldbyname('origem').AsString        := qryProdutosNotaFiscal.fieldbyname('origem').AsString;
              qryProdutos.fieldbyname('codigofiscal').AsInteger := qryProcuraNaturezasCFOP.fieldbyname('CodigoFiscal').AsInteger;
              qryProdutos.fieldbyname('natureza').AsInteger     := qryProcuraNaturezasCFOP.fieldbyname('CodigoNatureza').AsInteger;
              qryProdutos.fieldbyname('destacaripi').AsBoolean  := qryProcuraNaturezasCFOP.fieldbyname('destacaripi').AsBoolean;
              qryProdutos.fieldbyname('entregar').AsBoolean     := False;
              qryProdutos.fieldbyname('composto').AsBoolean     := False;
              AtribuirDadosProdutos(qryprodutos, qryDadosFiscais, nil, False, NotaAvulsa);
//              CalcularImpostos(qryprodutos, qryDadosFiscais, true,false);
              qryProdutos.Post;

            end;
            qryProdutosMovimentados.Next;
          end;

          if not qryProdutosMovimentados.Eof then
            qryProdutosMovimentados.Prior;

          result := PreencherNotaFiscal;
          if result then
          begin
            BloquearEstoque;
            PreencherDadoFiscal;
            IncluirMovimentos;
      //      IncluirImpostos;
          end
          else
            break;
        end
        else
          break;

      end;
      qryProdutosMovimentados.Next;
    end;

    if result then
    begin
      result := CalcularImpostos(qryprodutos, qryDadosFiscais, true, true, true, nil, nil, false, NotaAvulsa);

      if result then
      begin

        result := Perpetrar([qryDadosFiscais, qryNotas, qryMovimentos, qryProdutos, qrySeriesFiliais ]);

        if result then
        dtmImprimeFiscal := TdtmImprimeFiscal.Create(Self);
        try
          begin
            qryDadosFiscais.First;
            while not qryDadosFiscais.Eof do
            begin
              dtmImprimeFiscal.ImprimirNota(qryDadosFiscaisnumero.AsInteger, qrySeriesFiliaismodelonota.AsInteger, ParSistema.NomeImpressoraNotaMercadorias);
              qryDadosFiscais.Next;
            end;
          end;
        finally
            dtmImprimeFiscal.Free
        end;
      end;
    end;

  finally
    qryProdutosMovimentados.SortClear;
    VoltarRegistroAtual(qryProdutosMovimentados);
    FinalizarTabelas;
  end;

end;

function TdtmDevolucaoFornecedores.VerificarSerieFilial: Boolean;
begin
  result := true;
  if not qrySeriesFiliais.Active then
  begin
    ReFazConsulta(qrySeriesFiliais, [0,1], [FilialBase, SerieSugestao]);
    if qrySeriesFiliais.RecordCount = 0 then begin
      MensagemAviso(format(ctFILIALSEMSERIE, [FilialBase, 'mercadorias']));
      Result := False;
    end else if qrySeriesFiliaismodelonota.IsNull then begin
      MensagemAviso(ctSERIESUGESTAOSEMMODELO);
      Result := False;
    end else
      Result := True;
  end;      
end;

function TdtmDevolucaoFornecedores.PreencherNotaFiscal: Boolean;
begin
  qryNotas.Append;
  qryNotasfilial.AsInteger            := FilialBase;
  qryNotasserie.AsString              := SerieSugestao;
  qryNotasnumero.AsInteger            := qrySeriesFiliaisnumeroinicial.AsInteger;

  qrySeriesFiliais.Edit;
  qrySeriesFiliaisnumeroinicial.AsInteger := qrySeriesFiliaisnumeroinicial.AsInteger + 1;
  qrySeriesFiliais.Post;

  if qrySeriesFiliaisnumeroinicial.AsInteger <= qrySeriesFiliaisnumerofinal.AsInteger then
    Result := True
  else
    Result := MensagemAviso(Format(ctSERIEESGOTADA, [qrySeriesFiliaisnumerofinal.AsString]) + #13#10 + ctCONFIRMEINPRESSAO) = smbOK;
end;

procedure TdtmDevolucaoFornecedores.PreencherDadoFiscal;
var
  Cont: Integer;
begin
  RefazConsultaPorNome(qryFornecedorDestino,['codigofornecedor'],
       [qryProdutosMovimentadosfornecedor.AsVariant]);

  qryNotas.Edit;
  qryNotasdadofiscal.AsInteger := NovoNumeroDadoFiscal;
  qryNotas.Post;

  qryDadosFiscais.Insert;
  qryDadosFiscaisnumero.AsInteger       := qryNotasdadofiscal.AsInteger;
  qryDadosFiscaisdata.AsDateTime        := DataInclusaoNF;
  qryDadosFiscaissituacao.AsString      := 'N';
  qryDadosFiscaisfilialvenda.AsInteger  := qryProdutosMovimentados.parambyname('FilialEmissao').AsInteger;
  qryDadosFiscaisestadocfo.AsString     := qryFornecedorDestino.fieldbyname('estado').AsString;
  qryDadosFiscaiscodigofiscal.AsInteger := qryProcuraNaturezasCFOP.fieldbyname('codigofiscal').AsInteger;
  qryDadosFiscaiscodigonatureza.AsInteger := qryProcuraNaturezasCFOP.fieldbyname('codigonatureza').asinteger;
  qryDadosFiscaisnatureza.AsString       := qryProcuraNaturezasCFOP.fieldbyname('descricaonatureza').asString;

  if HeUnidadeFederacao(qryDadosFiscaisestadocfo.AsString) then
  begin
    if qryDadosFiscaisestadocfo.AsString = EstadoFilialBase then
       qryDadosFiscaiscodigofiscal.AsInteger := 5000 + qryDadosFiscaiscodigofiscal.AsInteger mod 1000
    else
       qryDadosFiscaiscodigofiscal.AsInteger := 6000 + qryDadosFiscaiscodigofiscal.AsInteger mod 1000;
  end
  else
    qryDadosFiscaiscodigofiscal.AsInteger := 7000 + qryDadosFiscaiscodigofiscal.AsInteger mod 1000;

  qryDadosFiscaisfilialemissao.AsInteger:= qryProdutosMovimentados.Parambyname('FilialEmissao').AsInteger;
  qryDadosFiscaisdatasaida.AsDateTime   := DataInclusaoNF;
  qryDadosFiscaisDesconto.AsCurrency    := 0;
  qryDadosFiscaisfrete.AsCurrency       := 0;
  qryDadosFiscaisseguro.AsCurrency      := 0;
  qryDadosFiscaiscliente.AsInteger      := qryProdutosMovimentados.fieldbyname('fornecedor').AsInteger;
  qryDadosFiscaistipocliente.AsString   := 'F';
  qryDadosFiscaisnome.AsString          := qryFornecedorDestino.fieldbyname('razao').AsString;
  qryDadosFiscaisrua.AsString           := qryFornecedorDestino.fieldbyname('rua').AsString;
  qryDadosFiscaisestado.AsString        := qryFornecedorDestino.fieldbyname('estado').AsString;
  qryDadosFiscaisbairro.AsInteger       := qryFornecedorDestino.fieldbyname('bairro').AsInteger;
  qryDadosFiscaiscidade.AsInteger       := qryFornecedorDestino.fieldbyname('cidade').AsInteger;
  qryDadosFiscaiscep.AsInteger          := qryFornecedorDestino.fieldbyname('cep').AsInteger;
  qryDadosFiscaispessoatipo.AsString    := 'J';
  qryDadosFiscaispessoanumero.AsString  := qryFornecedorDestino.fieldbyname('cnpj').AsString;
  qryDadosFiscaisdocumento.AsString     := qryFornecedorDestino.fieldbyname('inscricaoestadual').AsString;
  qryDadosFiscaisfoneddd.AsInteger      := qryFornecedorDestino.fieldbyname('foneddd').AsInteger;
  qryDadosFiscaisfonenumero.AsInteger   := qryFornecedorDestino.fieldbyname('fonenumero').AsInteger;
  qryDadosFiscaisviatransporte.AsString := 'R';
  qryDadosFiscaisfrete.AsString         := '1';
  qryDadosFiscaisobservacoes.AsString   := Observacoes + ' ' + qryProdutosMovimentadosnumero.AsString;

  qryDadosFiscais.Post;

  qryprodutos.Filtered := true;
  Cont := 0;
  qryProdutos.First;
  while not qryProdutos.Eof do
  begin
    qryProdutos.Edit;
    qryProdutos.fieldbyname('dadofiscal').AsInteger := qryDadosFiscaisnumero.AsInteger;
    qryProdutos.fieldbyname('numero').AsInteger     := Cont + 1;
    qryProdutos.Post;
    qryProdutos.Next;
    Inc(Cont);
  end;

  qryprodutos.Filtered := false;

end;

function TdtmDevolucaoFornecedores.IncluirProdutos: Boolean;
begin

end;

function TdtmDevolucaoFornecedores.NovoNumeroDadoFiscal: Integer;
begin
  spcDadosFiscaisProximo.Open;
  Result := spcDadosFiscaisProximonumero.AsInteger;
  spcDadosFiscaisProximo.Close;
end;

procedure TdtmDevolucaoFornecedores.IncluirImpostos;
begin
  try
    qryprodutos.Filtered := true;
    dtmGerarNotaFiscal.qryCalculosDadosFiscais.Filtered := true;

    dtmGerarNotaFiscal.CalcularDadosFiscais(nfSAIDA,
                       qryDadosFiscaisnumero.AsInteger,
                       qryDadosFiscaiscodigofiscal.AsInteger,
                       qryDadosFiscaisvalorfrete.AsCurrency, 0.00, false,
                       qryDadosFiscaisseguro.AsCurrency, 0.00, false,
                       0.00,
                       qryDadosFiscaisdesconto.AsCurrency,
                       qryDadosFiscaisacrescimofinanceiro.AsCurrency,
                       qryDadosFiscaisvalortotal.AsCurrency,
                       qryDadosFiscaisvalorprodutos.AsCurrency,
                       qryProdutos,
                       nil,
                       nil,
                       false,
                       false,true,
                       qryDadosFiscaisestadocfo.AsString,
                       qryDadosFiscaispessoatipo.AsString,
                       qryDadosFiscaistotalvaloricmssubstituicao.AsCurrency,
                       True,
                       false,
                       qryDadosFiscaiscodigonatureza.AsInteger);

     AtribuirValoresImpostosDadosFiscais;
  finally
    qryProdutos.Filtered := false;
    dtmGerarNotaFiscal.qryCalculosDadosFiscais.Filtered := false;
  end;
end;

procedure TdtmDevolucaoFornecedores.AtribuirValoresImpostosDadosFiscais;
var
  baseicms,
  valoricms,
  valoripi,
  ValorISS: Currency;
begin
  dtmGerarNotaFiscal.AtribuirValoresImpostos(nfSAIDA,
                      baseicms, valoricms, valoripi, ValorISS);

  qryDadosFiscais.Edit;
  qryDadosFiscaisbaseicms.AsCurrency := baseicms;
  qryDadosFiscaisvaloricms.AsCurrency := valoricms;
  qryDadosFiscaisvalorissqn.AsCurrency := valorISS;
  qryDadosFiscaisvaloripi.AsCurrency := ValorIPI;
  qryDadosFiscaisvalortotal.AsCurrency := qryDadosFiscaisvalortotal.AsCurrency + valoripi;
  qryDadosFiscaisvalorvista.AsCurrency := qryDadosFiscaisvalorvista.AsCurrency + valoripi;

  qryDadosFiscais.Post;

end;

procedure TdtmDevolucaoFornecedores.InicializarTabelas;
begin
  if not qryDadosFiscais.Active then
    qryDadosFiscais.Open;

  if not qryNotas.Active then
    qryNotas.Open;

  if not qryProdutos.Active then
    qryProdutos.Open;

  if not qryMovimentos.Active then
    qryMovimentos.Open;

  if not qryEstoques.Active then
    qryEstoques.Open;

  if not assigned(dtmGerarNotaFiscal) then
  begin
    dtmGerarNotaFiscal := tdtmGerarNotaFiscal.create(self);
    dtmGerarNotaFiscal.ChaveNotas := GetDadoFiscal;
  end;  

  if not dtmGerarNotaFiscal.qryCalculosDadosFiscais.active then
    dtmGerarNotaFiscal.qryCalculosDadosFiscais.open;

end;

procedure TdtmDevolucaoFornecedores.BloquearEstoque;
var
  WhereSQL: String;

  procedure IncluirProdutoNoEstoque;
  begin
    qryEstoques.Insert;
    qryEstoquesproduto.AsString      := qryProdutos.fieldbyname('produto').AsString;
    qryEstoquesfilial.AsInteger        := qryprodutos.fieldbyname('filial').asinteger;
    qryEstoquesemestoque.AsCurrency     := 0;
    qryEstoquesreservado.AsCurrency     := 0;
    qryEstoquestransito.AsCurrency      := 0;
    qryEstoquesdemonstracao.AsCurrency  := 0;
    qryEstoquesconserto.AsCurrency      := 0;
    qryEstoquesfuturo.AsCurrency        := 0;
    qryEstoquesdanificada.AsCurrency    := 0;
    qryEstoquesestoquefisico.AsCurrency := 0;
    qryEstoques.Post;
  end;


begin
  // Verifica a existencia do produto na filial requisitante.
  qryprodutos.Filtered := true;
  qryProdutos.First;
  while not qryProdutos.Eof do begin
    ReFazConsulta(qryExisteEstoque,[0,1],[qryProdutos.fieldbyname('produto').AsString,
                                          qryProdutos.fieldbyname('filial').asInteger]);
    if qryExisteEstoque.IsEmpty then
      IncluirProdutoNoEstoque;
    qryProdutos.Next;
  end;
  Perpetrar([qryEstoques]);

  try
    if qryProdutos.RecordCount = 0 then
      WhereSQL := 'false'
    else begin
      WhereSQL := '';
      qryProdutos.First;
      while Not qryProdutos.Eof do begin
        WhereSQL := WhereSQL +
        '((e.produto = ' + qryProdutos.fieldbyname('produto').AsString + ')and' +
        '(e.filial = '   + qryProdutos.fieldbyname('filial').AsString  + '))or';
        qryProdutos.Next
      end;
      Delete(WhereSQL, Length(WhereSQL) - 1, 2);
    end
  finally
    qryprodutos.Filtered := false;
  end;

  qryEstoqueBloqueio.MacroByName('ProdutoFilial').AsString := WhereSQL;
  if qryEstoqueBloqueio.Active then
    qryEstoqueBloqueio.Close;
  qryEstoqueBloqueio.Open;
end;

procedure TdtmDevolucaoFornecedores.IncluirMovimentos;
var
  Total : Currency;
begin
  Total:= 0;
  try
    qryprodutos.Filtered := true;
    qryProdutos.First;
    while not qryProdutos.Eof do
    begin
      NovoMovimento(qryProdutos.fieldbyname('produto').AsString, qryProdutos.fieldbyname('filial').AsInteger);
      qryMovimentosquantidade.AsCurrency   := qryProdutos.fieldbyname('quantidade').AsCurrency;
      qryMovimentostipomovimento.AsString := qryProcuraNaturezasCFOP.fieldbyname('tipomovimento').asstring;

      qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryNotasnumero.AsInteger) +
                                             ' S-' + SerieSugestao + ' DEVOLUÇÃO';

      qryMovimentosvalor.AsCurrency       := RoundTo((qryMovimentosquantidade.AsCurrency *
                                                      qryProdutos.fieldbyname('precovenda').AsCurrency),-2);
      Total:= Total + qryMovimentosvalor.AsCurrency;

      qryMovimentosdadofiscal.AsInteger   := qryDadosFiscaisnumero.AsInteger;
      qryMovimentos.Post;
      qryProdutos.Next;
    end;

  finally
    qryDadosFiscais.Edit;
    qryDadosFiscaisvalorvista.AsCurrency:= Total;
    qryDadosFiscaisvalortotal.AsCurrency:= Total;
    qryDadosFiscaisvalorprodutos.AsCurrency := Total;

    qryDadosFiscaisvalorfrete.AsCurrency := 0;
    qryDadosFiscaisseguro.AsCurrency := 0;
    qryDadosFiscaisdespesasacessorias.AsCurrency := 0;
    qryDadosFiscaisdesconto.AsCurrency := 0;
    qryDadosFiscaisacrescimofinanceiro.AsCurrency := 0;

    if qryDadosFiscaisvalorprodutos.AsCurrency = qrynotaspag.FieldByName('totalprodutos').AsCurrency then
    begin
      qryDadosFiscaisvalorfrete.AsCurrency := qryNotasPag.fieldbyname('freteinterno').AsCurrency;
      qryDadosFiscaisseguro.AsCurrency := qryNotasPag.fieldbyname('seguro').AsCurrency;
      qryDadosFiscaisdespesasacessorias.AsCurrency := qryNotasPag.fieldbyname('despesasacessorias').AsCurrency;
      qryDadosFiscaisdesconto.AsCurrency := qryNotasPag.fieldbyname('desconto').AsCurrency;
      qryDadosFiscaisacrescimofinanceiro.AsCurrency := qryNotasPag.fieldbyname('acrescimo').AsCurrency;
    end
    else
    begin
      if qryNotasPag.fieldbyname('freteinterno').AsCurrency<>0 then
        qryDadosFiscaisvalorfrete.AsCurrency :=
          qryDadosFiscaisvalorprodutos.AsCurrency *
          qryNotasPag.fieldbyname('freteinterno').AsCurrency/
          qrynotaspag.FieldByName('totalprodutos').AsCurrency;

      if qryNotasPag.fieldbyname('seguro').AsCurrency<>0 then
        qryDadosFiscaisseguro.AsCurrency :=
          qryDadosFiscaisvalorprodutos.AsCurrency *
          qryNotasPag.fieldbyname('seguro').AsCurrency/
          qrynotaspag.FieldByName('totalprodutos').AsCurrency;

      if qryNotasPag.fieldbyname('despesasacessorias').AsCurrency<>0 then
        qryDadosFiscaisdespesasacessorias.AsCurrency :=
          qryDadosFiscaisvalorprodutos.AsCurrency *
          qryNotasPag.fieldbyname('despesasacessorias').AsCurrency/
          qrynotaspag.FieldByName('totalprodutos').AsCurrency;

      if qryNotasPag.fieldbyname('desconto').AsCurrency<>0 then
        qryDadosFiscaisdesconto.AsCurrency :=
          qryDadosFiscaisvalorprodutos.AsCurrency *
          qryNotasPag.fieldbyname('desconto').AsCurrency/
          qrynotaspag.FieldByName('totalprodutos').AsCurrency;

      if qryNotasPag.fieldbyname('acrescimo').AsCurrency<>0 then
        qryDadosFiscaisacrescimofinanceiro.AsCurrency :=
          qryDadosFiscaisvalorprodutos.AsCurrency *
          qryNotasPag.fieldbyname('acrescimo').AsCurrency/
          qrynotaspag.FieldByName('totalprodutos').AsCurrency;

    end;

    qryDadosFiscaisvalortotal.AsCurrency :=
      qryDadosFiscaisvalortotal.AsCurrency +
      qryDadosFiscaisvalorfrete.AsCurrency +
      qryDadosFiscaisseguro.AsCurrency +
      qryDadosFiscaisdespesasacessorias.AsCurrency;

    qryDadosFiscaisvalorvista.AsCurrency :=
      qryDadosFiscaisvalorvista.AsCurrency +
      qryDadosFiscaisvalorfrete.AsCurrency +
      qryDadosFiscaisseguro.AsCurrency +
      qryDadosFiscaisdespesasacessorias.AsCurrency;

    qryDadosFiscais.Post;
    qryprodutos.Filtered := false;
  end
end;

procedure TdtmDevolucaoFornecedores.NovoMovimento(Produto: String;
  Filial: Integer);
begin
  qryMovimentos.Append;
  spcMovimentosProximo.Open;
  qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
  spcMovimentosProximo.Close;
  
  qryMovimentosproduto.AsString   := Produto;
  qryMovimentosfilial.AsInteger     := Filial;
  qryMovimentoscliente.AsInteger    := qryProdutosMovimentadosfornecedor.AsInteger;
  qryMovimentostipocliente.AsString := 'F';
end;

procedure TdtmDevolucaoFornecedores.qryProdutosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := qryProdutos.fieldbyname('codigonota').AsInteger = CodigoNota;
end;

procedure TdtmDevolucaoFornecedores.FinalizarTabelas;
begin
  if qryDadosFiscais.Active then
    qryDadosFiscais.close;

  if qryNotas.Active then
    qryNotas.Close;

  if qryProdutos.Active then
    qryProdutos.Close;

  if qryMovimentos.Active then
    qryMovimentos.Close;

  if qryEstoques.Active then
    qryEstoques.Close;

  if qrySeriesFiliais.Active then
    qrySeriesFiliais.Close;

  if dtmGerarNotaFiscal.qryCalculosDadosFiscais.active then
    dtmGerarNotaFiscal.qryCalculosDadosFiscais.Close;

end;

function TdtmDevolucaoFornecedores.GetDadoFiscal: integer;
begin
  FDadoFiscal := qryDadosFiscaisnumero.AsInteger;
  Result := FDadoFiscal;
end;

procedure TdtmDevolucaoFornecedores.qryDadosFiscaisNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryDadosFiscaismodelodocto.AsString := ModeloDoctoFiscal;
  qryDadosFiscaismanual.AsBoolean := false;

end;

procedure TdtmDevolucaoFornecedores.qryProdutosMovimentadosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := qryProdutosMovimentadosmarcar.AsBoolean
end;

procedure TdtmDevolucaoFornecedores.frpProdutosMovimentadosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpProdutosMovimentados, view);
end;

end.
