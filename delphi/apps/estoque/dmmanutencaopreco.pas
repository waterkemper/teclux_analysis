unit dmmanutencaopreco;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Math, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes, biblio, clusuario, clparametrossistema,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmtecsoft, dmbasico, ZTransact, Variants, Provider, DBClient,
  cpnumero, DBAdvGrid, AdvSmoothProgressBar;

const
 caract_preco_col = 1;
 caracteristica   = 2;
 preco            = 3;
 coluna           = 4;
 valor            = 5;
 validade         = 6;

 caracteristicam  = 1;
 markup           = 2;
 grupo            = 3;
 classe           = 4;
 marca            = 5;
 precotabelado    = 6;

{
 produto_marketplace_m_p_f = 1;
 produto_m_p_f = 2;
 marketplace_m_p_f = 3;
 fator_m_p_f = 4;
}

 marketplace_codigo = 1;
 marketplace_margem_final_desejada = 2;

 produto = 1;
 precoproduto   = 2;
{ promocao = 3;}

 produto_cargo_pc = 1;
 produto_pc = 2;
 cargo_pc = 3;
 desconto_pc = 4;

 caract_preco_promocao= 1;
 caracteristica_pro   = 2;
 preco_pro            = 3;
 promocao_pro         = 4;

type
  TdtmManutencaoPreco = class(TdtmBasico)
    qryColuna: TtecQuery;
    qryColunacodigo: TIntegerField;
    qryColunadescricao: TStringField;
    qryManutencaoPreco: TtecQuery;
    dsrManutencaoPreco: TtecDataSource;
    qryExisteColunaPreco: TtecQuery;
    qryExisteColunaPrecocaracteristica: TLargeintField;
    qryExisteColunaPrecopreco: TIntegerField;
    qryExisteColunaPrecocoluna: TIntegerField;
    qryExisteColunaPrecovalor: TFloatField;
    qryExisteColunaPrecovalidade: TDateField;
    qryExisteColunaPrecodata: TDateField;
    qryColunasPrecos: TtecQuery;
    qryProcuraColunas: TtecQuery;
    dsrProcuraColunas: TtecDataSource;
    qryProcuraColunascodigo: TIntegerField;
    qryProcuraColunasdescricao: TStringField;
    qryConsultaColunas: TtecQuery;
    qryConsultaColunasdescricao: TStringField;
    qryConsultaColunascodigo: TIntegerField;
    qryColunasFiliais: TtecQuery;
    qryProcuraFiliais: TtecQuery;
    dsrProcuraFiliais: TtecDataSource;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryColunasFiliaispreconormal: TIntegerField;
    qryColunasFiliaisprecopromocao: TIntegerField;
    qryMultiplosProduto: TtecQuery;
    qryMultiplosProdutomultiplo_produto: TFloatField;
    qryMultiplosProdutomultiplo_grupo: TFloatField;
    qryMultiplosProdutomultiplo_classe: TFloatField;
    qryConsultaFiliaisMovimentos: TtecQuery;
    qryProcuraFilialMovimentos: TtecQuery;
    dsrProcuraFilialMovimentos: TtecDataSource;
    qryConsultaTipoMovimentos: TtecQuery;
    qryConsultaSerieNfEntrada: TtecQuery;
    qryConsultaNfEntrada: TtecQuery;
    qryProcuraTipoMovimentos: TtecQuery;
    dsrProcuraTipoMovimentos: TtecDataSource;
    qryProcuraSerieNFEntrada: TtecQuery;
    qryProcuraNFEntrada: TtecQuery;
    dsrProcuraSerieNFEntrada: TtecDataSource;
    dsrProcuraNFEntrada: TtecDataSource;
    qryConsultaTipoMovimentoscodigo: TStringField;
    qryConsultaTipoMovimentosdescricao: TStringField;
    qryConsultaSerieNfEntradaserie: TStringField;
    qryConsultaNfEntradanumero: TIntegerField;
    qryProcuraFilialMovimentoscodigo: TIntegerField;
    qryProcuraFilialMovimentosnome: TStringField;
    qryProcuraTipoMovimentoscodigo: TStringField;
    qryProcuraTipoMovimentosdescricao: TStringField;
    qryProcuraSerieNFEntradaserie: TStringField;
    qryProcuraNFEntradanumero: TIntegerField;
    qryConsultaFiliaisMovimentosnome: TStringField;
    qryConsultaFiliaisMovimentoscodigo: TIntegerField;
    qryProdutosCargos: TtecQuery;
    qryProdutosCargoscargo: TIntegerField;
    qryProdutosCargosdescricao: TStringField;
    qryManutencao_preco: TtecQuery;
    qryManutencao_precocargo: TtecQuery;
    qryManutencao_precocargovalor: TFloatField;
    qryCaracteristicas: TtecQuery;
    qryAtualizarCaracteristicas: TtecQuery;
    qryCaracteristicascodigo: TLargeintField;
    qryCaracteristicasmarkup: TFloatField;
    qryColunanormal: TBooleanField;
    qryColunapromocao: TBooleanField;
    qryManutencao_precoprecovenda: TFloatField;
    qryManutencao_precoprecovendaantesimpostos: TFloatField;
    qryExisteProdutoCargo: TtecQuery;
    qryExisteProdutoCargoproduto: TLargeintField;
    qryExisteProdutoCargocargo: TIntegerField;
    qryExisteProdutoCargomarkup: TFloatField;
    qryExisteProdutoCargoprodutodigitado: TStringField;
    qryAtualizarProdutosCargos: TtecQuery;
    qryCaracteristicasgrupo: TStringField;
    qryCaracteristicasclasse: TStringField;
    qryCaracteristicasmarca: TIntegerField;
    qryPrecos: TtecQuery;
    qryPrecoscaracteristica: TLargeintField;
    qryPrecoscodigo: TIntegerField;
    qryPrecosdescricao: TStringField;
    qryPrecoscadastrado: TBooleanField;
    spcPrecoProximo: TtecQuery;
    qryPrecosavariado: TBooleanField;
    qryManutencaoPrecoAux: TtecQuery;
    qryProdutosPreco: TtecQuery;
    qryProdutosPrecocodigo: TLargeintField;
    qryProdutosPrecopreco: TIntegerField;
    dsrColuna: TtecDataSource;
    qryProdutosPrecopromocao: TIntegerField;
    qryPrecosPromocoes: TtecQuery;
    qryPrecosPromocoescaracteristica: TLargeintField;
    qryPrecosPromocoescodigo: TIntegerField;
    qryPrecosPromocoesdescricao: TStringField;
    qryPrecosPromocoesavariado: TBooleanField;
    qryPrecosPromocoespromocao: TIntegerField;
    qryManutencao_precomarkup_inverso: TFloatField;
    dsrMarketplace: TtecDataSource;
    cdsMarketplace: TtecQuery;
    cdsMarketplacedescricaomarketplace: TStringField;
    cdsMarketplacetabela: TStringField;
    cdsMarketplaceproduto: TLargeintField;
    cdsMarketplacedescricao: TStringField;
    cdsMarketplacevalorgrade1: TStringField;
    cdsMarketplacevalorgrade2: TStringField;
    cdsMarketplaceresultadocurvaabc: TStringField;
    cdsMarketplacecsosn: TStringField;
    cdsMarketplacecusto_produto: TFloatField;
    cdsMarketplacepeso_entrega: TFloatField;
    cdsMarketplaceprecovendacargo: TFloatField;
    cdsMarketplacecomissao: TFloatField;
    cdsMarketplacecusto_frete: TFloatField;
    cdsMarketplaceperccomissao: TFloatField;
    cdsMarketplacecst: TStringField;
    cdsMarketplaceregimetributario: TIntegerField;
    cdsMarketplacedescricaoregimetributario: TStringField;
    cdsMarketplaceprodutovisual: TStringField;
    cdsMarketplacecaracteristica: TLargeintField;
    cdsMarketplacecaracteristicavisual: TStringField;
    cdsMarketplacemarkup: TFloatField;
    cdsMarketplacemarkupinverso: TFloatField;
    cdsMarketplaceprecovenda: TFloatField;
    cdsMarketplacealterar: TBooleanField;
    cdsMarketplacepreconormal: TFloatField;
    cdsMarketplacemargem_cargo: TFloatField;
    cdsMarketplacedesconto_cargo: TFloatField;
    cdsMarketplacealterado: TBooleanField;
    cdsMarketplacegrupo: TStringField;
    cdsMarketplaceclasse: TStringField;
    cdsMarketplacemarca: TIntegerField;
    cdsMarketplacefilial_estoque: TIntegerField;
    cdsMarketplaceultimacompra: TFloatField;
    cdsMarketplacecargo: TIntegerField;
    cdsMarketplacecoluna: TIntegerField;
    cdsMarketplacepreco: TIntegerField;
    cdsMarketplacevalidade: TDateField;
    cdsMarketplacepromocao: TIntegerField;
    cdsMarketplacedescricaopromocao: TStringField;
    cdsMarketplacecampocalculado: TFloatField;
    cdsMarketplacemarketplace: TIntegerField;
    qryExistemarketplace_produtos_fator: TtecQuery;
    qryExistemarketplace_produtos_fatormarketplace: TIntegerField;
    qryExistemarketplace_produtos_fatorfator: TFloatField;
    qryAtualizarmarketplace_produtos_fator: TtecQuery;
    cdsMarketplacenomecampocalculado: TStringField;
    cdsMarketplacetabela_frete: TIntegerField;
    qryTabelaMarketplace: TtecQuery;
    cdsMarketplace_seq: TLargeintField;
    cdsMarketplaceValorImposto: TCurrencyField;
    cdsMarketplacemargem: TCurrencyField;
    cdsMarketplacePercentualDescontoInformado: TCurrencyField;
    cdsMarketplaceValorDescontoInformado: TCurrencyField;
    cdsMarketplacePrecoVendaComDesconto: TCurrencyField;
    cdsMarketplaceComissPrecoVendaComDesc: TCurrencyField;
    cdsMarketplacePercentualDevDescontoInformado: TCurrencyField;
    cdsMarketplaceValorDevDescInformado: TCurrencyField;
    cdsMarketplaceValorComissaoDevDes: TCurrencyField;
    cdsMarketplaceNovoValorImposto: TCurrencyField;
    cdsMarketplaceNovaMargem: TCurrencyField;
    qryProcuraMarketPlace: TtecQuery;
    dsrProcuraMarketPlace: TtecDataSource;
    qryConsultaMarketPlace: TtecQuery;
    qryProcuraMarketPlacecodigo: TIntegerField;
    qryProcuraMarketPlacedescricao: TStringField;
    cdsMarketplacefilial: TIntegerField;
    qryExistemarketplace_produtos_fatorproduto: TLargeintField;
    qrycomissao_manutencao_preco: TtecQuery;
    qrycomissao_manutencao_precocomissao: TFloatField;
    cdsMarketplacemargem_final_desejada_mk: TCurrencyField;
    cdsMarketplacenovo_preco_desejado: TCurrencyField;
    cdsMarketplacealiq_icms: TCurrencyField;
    cdsMarketplace_copia: TtecQuery;
    cdsMarketplacePercentualICMSNormal: TCurrencyField;
    cdsMarketplacePercentualICMSSimples: TCurrencyField;
    cdsMarketplaceprecotabelado: TBooleanField;
    cdsMarketplacemargem_final_desejada_pm: TCurrencyField;
    cdsMarketplacecodigo: TIntegerField;
    cdsMarketplacecodigo_produto_marketplace: TIntegerField;
    qryCaracteristicasprecotabelado: TBooleanField;
    qryMarketPlace: TtecQuery;
    qryproduto_marketplace: TtecQuery;
    cdsMarketplacevendedor: TIntegerField;
    cdsMarketplaceperccomissao_recalculado: TCurrencyField;
    qryConsultaMarketPlacecodigo: TIntegerField;
    qryConsultaMarketPlacedescricao: TStringField;
    procedure qryManutencaoPrecoAfterInsert(DataSet: TDataSet);
    procedure qryManutencaoPrecoAfterEdit(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryManutencaoPrecoAfterOpen(DataSet: TDataSet);
    procedure dsrManutencaoPrecoDataChange(Sender: TObject; Field: TField);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryProcuraSerieNFEntradaAfterScroll(DataSet: TDataSet);
    procedure qryProcuraFornecedorNFEntradaAfterScroll(DataSet: TDataSet);
    procedure qryManutencaoPrecoAfterScroll(DataSet: TDataSet);
    procedure qryPrecosBeforeOpen(DataSet: TDataSet);
    procedure qryPrecosNewRecord(DataSet: TDataSet);
    procedure qryPrecosAfterScroll(DataSet: TDataSet);
    procedure qryManutencaoPrecoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsMarketplace_nnnnnCalcFields(DataSet: TDataSet);
    procedure qryManutencaoPrecoBeforeClose(DataSet: TDataSet);
    procedure dsrMarketplaceDataChange(Sender: TObject; Field: TField);
    procedure cdsMarketplace_nnnnnmarkupChange(Sender: TField);
    procedure cdsMarketplaceBeforeEdit(DataSet: TDataSet);
    procedure cdsMarketplaceAfterPost(DataSet: TDataSet);
    procedure cdsMarketplaceAfterCancel(DataSet: TDataSet);
    procedure cdsMarketplace_nnnnnAfterEdit(DataSet: TDataSet);
    procedure cdsMarketplace_nnnnnBeforeOpen(DataSet: TDataSet);
    procedure cdsMarketplace_nnnnnFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsMarketplaceCalcFields(DataSet: TDataSet);
    procedure cdsMarketplaceAfterEdit(DataSet: TDataSet);
    procedure cdsMarketplaceFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsMarketplaceAfterOpen(DataSet: TDataSet);
    procedure qryProcuraColunasBeforeOpen(DataSet: TDataSet);
    procedure cdsMarketplaceBeforeOpen(DataSet: TDataSet);
  private
    fmargem_final_desejada: Currency;
    function Getmargem_final_desejada: Currency;
  private
    vNomeCalculado : String;
    vCopiandoCampoCalculado : Boolean;
    AlterarMarkupInverso : Boolean;
    vFiltroCaracteristica,
    vFiltroPreco,
    vFiltroProduto: String;

    FDataInicial: String;
    FDataFinal: String;
    FFornecedores: Boolean;
    FDataMovtoInicial: String;
    FDataMovtoFinal: String;
    FDataNotaInicial: String;
    FDataNotaFinal: String;
    fSomenteComEstoque: Boolean;
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    PPromocao: String;
    fListaCodigosPromocao: String;
    fSomenteComPromocoes: boolean;
    FGravarPromocao: TNotifyEvent;
    fListaCSOSN: String;
    fListaCST: String;
    fParametroListasPadrao: String;
    fCompostos: byte;
    FprodutoInativo: Boolean;
    FprodutoEmLinha: Boolean;
    FProdutoBrinde: Boolean;
    FProdutoNaoBrinde: Boolean;
    FprodutoAtivo: Boolean;
    FprodutoForadeLinha: Boolean;
    FProdutoSemMontagem: Boolean;
    FProdutoComMontagem: Boolean;
    fDisponivelnoSite: Boolean;
    fNaoDisponivelnoSite: Boolean;
    FEditandoMKP: boolean;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
    procedure SetDataMovtoInicial(const Value: String);
    procedure SetDataMovtoFinal(const Value: String);
    procedure SetDataNotaFinal(const Value: String);
    procedure SetDataNotaInicial(const Value: String);
    procedure AlterarValoresPrecosMarkup(AlterarPrecoNormal: boolean = true);
    procedure AlterarValoresPrecosMarkupMKP(AlterarPrecoNormal: boolean = true);

    procedure setColunaPromocao(const Value: integer);
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
    function GetCampoDataValidadeDestino: String;
    function GetCampoDataValidadeOrigem: String;
    function GetCampoMargemDestino: String;
    function GetCampoMargemOrigem: String;
    function getCampoDataValidadeExcluir: String;
    function GetCampoMargemExcluir: String;
    procedure ReadOnlyFieldsManutencao;

    Function ValoredtPercentualDesconto: Variant;
    Function ValorDescontoInformado: Variant;

    Function PrecoVendaComDesconto: Variant;
    Function ComissPrecoVendaComDesc: Variant;
    Function Comissao(vComissao: Currency): Variant;
    Function perccomissao_recalculado: Variant;

    Function ValoredtPercentualDevolucaoDesconto: Variant;
    Function ValorDevolucaoDescontoInformado: Variant;
    Function ValorComissaoDevDes: Variant;

    Function NovoValorImposto: Variant;
    Function NovaMargem: Variant;
//    function Aliq_icms: Variant;
    function Novo_Preco_Desejado(vComissao: Real): Variant;
    function Marketplacemargem_final_desejada: Variant;
    function Adicional_Custo_Produto: Real;

//    Function PrecoVendacomFrete: Variant;

    Function ValorImposto: Variant;

    Function Margem: Variant;

    procedure AtribuirValoresCamposCalculados(Editar: Boolean);
    function comissao_manutencao_preco(pPercComissao: Currency;
    pvalorBaseComissao: Currency; pNomeVendedor: String): Currency;
    property margem_final_desejada: Currency read Getmargem_final_desejada write fmargem_final_desejada;



  protected
    PrecosCaracteristicasAlterados: array [1..6] of TStringList;
    PrecosCaracteristicasAlteradosMKP: array [1..6] of TStringList;

    CaracteristicasAlteradas: array [1..5] of TStringList;
    CaracteristicasAlteradasMKP: array [1..6] of TStringList;

    ProdutosAlterados: array [1..3] of TStringList;
    DescontosProdutosCargosAlterados: array [1..4] of TStringList;
    DescontosProdutosCargosAlteradosMKP: array [1..4] of TStringList;

{    marketplace_produtos_fator: Array [1..4] of TStringList;}
    marketplace: Array [1..2] of TStringList;
    produto_marketplace: Array [1..2] of TStringList;

    CaracteristicasPrecoPromocaoAlteradas: array [1..4] of TStringList;

    Filial: integer;
    PCodigoPromocao: String;
    FColunaPromocao : integer;
    FPrecosDiferenciados: Boolean;
    FPrecos: Integer;
    FOrdenacao: Integer;
//    FSelecaoProdutos: Integer;
    FEditando: boolean;
    function GetConsultarColunas: TtecQuery;
    function GetConsultaFiliais: TtecQuery;
//    function GetDescricaoColuna: String;
    function GetNumeroRegistro: Integer;
    function ArredondarPrecoProduto(Produto: LargeInt; Valor: Currency): Variant;

    procedure AtualizarDescontoCargos(Campodesconto_pc : String);
    procedure AtualizarDescontoCargosMKP(Todos: Boolean = True);

//    procedure AtualizarfatormarkprodutoMKP;
    procedure AtualizarMarketPlace_Margem_Final_Desejada_mk;
    procedure AtualizarMarketPlace_Margem_Final_Desejada_pm;
    procedure AtualizarMarketPlace_novo_preco_desejado;

    procedure AtualizarPrecoCargos(CampoPrecoCargo_pc : String);
    procedure AtualizarPrecoCargosMKP(CampoPrecoCargo_pc : String);

//    procedure Atualizarprecovendacargo_m_p_f;

    procedure ExluirColunasPreco;

    procedure AtualizarColunasPreco(pvalor: String);


  public
    PNormal: String;

    CampoColunaOrigem : String;
    CampoColunaDestino: String;
    CampoColunaExcluir: String;
    qryProcuraFornecedores : tTecquery;
    qryProcuraFornecedorNFEntrada : tTecquery;

    FCodigosAlteracoesPrecos: array of Integer;
    procedure AplicarPercentualEValidade(Origem: Integer; Percentual, Validade: String);
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecPesquisa);

    procedure AlterarColunasPrecosProdutos;
    procedure AlterarColunasPrecosMarketPlace;

    procedure CopiarColunaPreco(Validade, Percentual: String);
    constructor Create(AOwner: TComponent); override;
    procedure ExcluirColunaPreco;
    function  ExisteColunas(Campo, codigo: String): Boolean;
    function  ExisteFiliais(campo, codigo: String): Boolean;
    function  ExisteFilialFornec(campo, codigo: String): Boolean;
    function  ExisteTipoMovto(campo, codigo: String): Boolean;
    function  ExisteSerieNota(campo, codigo: String): Boolean;
    function  ExisteNota(campo, codigo: String): Boolean;
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecPesquisa);
    procedure LimpaTabelas;

    procedure MontarSQLManutencaoPreco(CondicaoCaracteristica, CondicaoItemProduto,
               CondicaoMarca, CondicaoGrupo,
               CondicaoClasse, CondicaoMarketPlace: String; ProdutoEspecifico: String = '');

    procedure PreencherComboBox(Lista: TComboBox; definirpromocao: boolean = false);
    procedure ReFazConsultaFiliais;
    procedure Selecionar(TipoPesquisa: TTecPesquisa);

    property ConsultarColunas: TtecQuery read GetConsultarColunas;
    property ConsultaFiliais: TtecQuery read GetConsultaFiliais;
//    property DescricaoColuna: String read GetDescricaoColuna;
    property NumeroRegistro: Integer read GetNumeroRegistro;
    property Editando: boolean read FEditando write FEditando;
    property EditandoMKP: boolean read FEditandoMKP write FEditandoMKP;

//    property SelecaoProdutos: Integer read FSelecaoProdutos write FSelecaoProdutos;



    property SomenteComEstoque: Boolean read fSomenteComEstoque write fSomenteComEstoque;
    property Ordenacao: Integer read FOrdenacao write FOrdenacao;
    property Precos: Integer read FPrecos write FPrecos;
    property PrecosDiferenciados: Boolean read FPrecosDiferenciados write FPrecosDiferenciados;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property DataMovtoInicial: String read FDataMovtoInicial write SetDataMovtoInicial;
    property DataMovtoFinal: String read FDataMovtoFinal write SetDataMovtoFinal;
    property DataNotaInicial: String read FDataNotaInicial write SetDataNotaInicial;
    property DataNotaFinal  : String read FDataNotaFinal write SetDataNotaFinal; 
    property Fornecedores: Boolean read FFornecedores write FFornecedores;
    property SomenteComPromocoes: boolean read fSomenteComPromocoes write fSomenteComPromocoes;
    property ListaCodigosPromocao: String read fListaCodigosPromocao write fListaCodigosPromocao;
    property ListaCST: String read fListaCST write fListaCST;
    property ListaCSOSN: String read fListaCSOSN write fListaCSOSN;
    property ParametroListasPadrao: String read fParametroListasPadrao write fParametroListasPadrao;
    property Compostos : byte read fCompostos write fCompostos;


    function  MontaCondicaoMovimentacao: String;
    function  MontaCondicaoNotaEntrada: String;
    procedure AtualizarPrecos(calcularValoresPrecosMarkup: boolean);
    procedure AtualizarPrecosMKP(calcularValoresPrecosMarkup: boolean);

    procedure AtualizarMarkups(calcularValoresPrecosMarkup: boolean);
    procedure AtualizarMarkupsMKP(calcularValoresPrecosMarkup: boolean);
    procedure AtualizarPrecoTabeladoMKP;

    procedure LimparProdutosAlterados;
    procedure LimparProdutosAlteradosMKP;

    procedure MarcarRegistrosManutencaoPrecosAtualizar(Marcando, Todos: boolean);
    procedure MarcarRegistrosMarketPlaceAtualizar(Marcando, Todos: boolean);

    property ColunaPromocao: integer read fColunaPromocao write setColunaPromocao;
    property OnScrollLinhaColunaGrade : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property GravarPromocao : TNotifyEvent read FGravarPromocao write FGravarPromocao;

    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;

    property CampoDataValidadeOrigem: String read GetCampoDataValidadeOrigem;
    property CampoDataValidadeDestino: String read GetCampoDataValidadeDestino;
    property CampoDataValidadeExcluir: String read getCampoDataValidadeExcluir;

    property CampoMargemOrigem: String read GetCampoMargemOrigem;
    property CampoMargemDestino: String read GetCampoMargemDestino;
    property CampoMargemExcluir: String read GetCampoMargemExcluir;
    function GravarPrecos: boolean;
    procedure AtualizarCampoPrecoTabelaPreco;

    procedure AtribuirDadosGrupoProdutos(codigo, descricao: String);
    procedure AtribuirDadosClasseProdutos(codigo, descricao: String);
    procedure AtribuirDadosPromocaoProdutos(codigo, descricao: variant);
    procedure AtribuirDadosMarcaProdutos(codigo, descricao: String);
    procedure limparPromocoes;

    property ProdutoEmLinha: Boolean read FprodutoEmLinha write FProdutoEmLinha;
    property ProdutoForadeLinha: Boolean read FprodutoForadeLinha write FProdutoForadeLinha;
    property ProdutoAtivo: Boolean read FprodutoAtivo write FProdutoAtivo;
    property ProdutoInativo: Boolean read FprodutoInativo write FProdutoInativo;
    property ProdutoComMontagem: Boolean read FProdutoComMontagem write FProdutoComMontagem;
    property ProdutoSemMontagem: Boolean read FProdutoSemMontagem write FProdutoSemMontagem;
    property ProdutoBrinde: Boolean read FProdutoBrinde write FProdutoBrinde;
    property ProdutoNaoBrinde: Boolean read FProdutoNaoBrinde write FProdutoNaoBrinde;
    property DisponivelnoSite: Boolean read fDisponivelnoSite write fDisponivelnoSite;
    property NaoDisponivelnoSite: Boolean read fNaoDisponivelnoSite write fNaoDisponivelnoSite;

    procedure CopiarCampoCalculado(var vNomeCampo: String; vAscendig: Boolean);

    function MarketPlacecomRegistros: Boolean;
  end;

var
  Index : Integer;
  IndexMKP : Integer;
  IndexM : integer;
  IndexMMKP : integer;
  IndexPC : Integer;
  IndexPCMKP : Integer;

  IndexCodigomkp : Integer;
  IndexCodigomkpProduto : Integer;

  IndexProduto : integer;
  IndexCaracteristicasPrecoPromocaoAlteradas : integer;

  DataValidade: String;
  AtualizandoPrecos, VarrendoManutencao: Boolean;
  Col : String; ColMKP : String;
  Cargo : String; CargoMKP : String;
  vLimiteCampoAlteravel: Integer;

{  dtmManutencaoPreco: TdtmManutencaoPreco;}


implementation

{$R *.dfm}

procedure TdtmManutencaoPreco.AbreTabelaPesquisa(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
             pesCOLUNAS : Abre(ctConsultaColunas);
     pesTIPOSMOVIMENTOS : qryConsultaTipoMovimentos.Open;
               pesNOTAS : qryConsultaNfEntrada.Open;
  pesSERIESFORNECEDORES : qryConsultaSerieNfEntrada.Open;
             pesFILIAIS : if not FFornecedores then Abre(ctConsultaFiliais)
                          else qryConsultaFiliaisMovimentos.Open;
  end;
end;

function TdtmManutencaoPreco.ArredondarPrecoProduto(Produto: LargeInt; Valor: Currency): Variant;
Var
  Mult: Real;
begin
  Mult:= 0;
  ReFazConsulta(qryMultiplosProduto,[0],[Produto]);
  if not qryMultiplosProduto.IsEmpty then begin
    if qryMultiplosProdutomultiplo_produto.AsFloat > 0 then
      Mult:= Multiplo(Valor,qryMultiplosProdutomultiplo_produto.AsFloat)
    else if (qryMultiplosProdutomultiplo_grupo.AsFloat > 0) then
      Mult:= Multiplo(Valor,qryMultiplosProdutomultiplo_grupo.AsFloat)
    else if (qryMultiplosProdutomultiplo_classe.AsFloat > 0) then
      Mult:= Multiplo(Valor,qryMultiplosProdutomultiplo_classe.AsFloat)
  end;
  if (Mult = 0) and (ParSistema.MultiploPreco > 0) then
    Mult:= Multiplo(Valor,ParSistema.MultiploPreco);
  if Mult > 0 then
       Result:= Mult
  else Result:= Valor;
end;

procedure TdtmManutencaoPreco.AplicarPercentualEValidade(Origem: Integer; Percentual, Validade: String);
var
  Pos: TBookmark;
  I: Integer;
  Perc: Real;
begin
  if Percentual <> '' then
       Perc:= StrToFloat(Percentual)
  else Perc:= 0;

  qryManutencaoPreco.DisableControls;
  Pos:= qryManutencaoPreco.GetBookmark;
  try
//    VarrendoManutencao := True;
    qryManutencaoPreco.First;
    for I:= 1 to qryManutencaoPreco.RecordCount do
    begin
      if qryManutencaoPreco.FieldByName('alterar').asboolean then
      begin
        qryManutencaoPreco.Edit;

        if Perc <> 0 then
        begin
          VarrendoManutencao := True;
          qryManutencaoPreco.Fieldbyname(CampoColunaorigem).AsVariant:= ArredondarPrecoProduto(qryManutencaoPreco.FieldbyName('produto').AsVariant,
                                                                            (qryManutencaoPreco.Fieldbyname(CampoColunaorigem).AsFloat +
                                                                             RoundTo(qryManutencaoPreco.Fieldbyname(CampoColunaorigem).AsFloat * (Perc / 100),-2)));

          VarrendoManutencao := False;
        end
        else qryManutencaoPreco.Fieldbyname(CampoColunaorigem).AsVariant:= qryManutencaoPreco.Fieldbyname(CampoColunaorigem).AsVariant;

        if Validade <> '' then
             qryManutencaoPreco.FieldByName(CampoDataValidadeOrigem).asVariant:= Validade
        else qryManutencaoPreco.FieldByName(CampoDataValidadeOrigem).AsVariant:= qryManutencaoPreco.FieldByName(CampoDataValidadeOrigem).AsVariant;

        qryManutencaoPreco.Post;

        VarrendoManutencao := True;
        dsrManutencaoPrecoDataChange(self,qryManutencaoPreco.Fieldbyname(CampoColunaorigem));
        VarrendoManutencao := False;


      end;
      qryManutencaoPreco.Next;
    end;
  finally
    qryManutencaoPreco.GotoBookmark(Pos);
    qryManutencaoPreco.FreeBookmark(Pos);
    qryManutencaoPreco.EnableControls;
  end;
end;

procedure TdtmManutencaoPreco.CopiarColunaPreco(Validade, Percentual: String);
var
  Pos: TBookmark;
  I: Integer;
  Perc: Real;
  Valor : Variant;
  NomeCampo : String;
begin
  if Percentual <> '' then
       Perc:= StrToFloat(Percentual)
  else Perc:= 0;

  qryManutencaoPreco.DisableControls;
  Pos:= qryManutencaoPreco.GetBookmark;
  try
    VarrendoManutencao := True;
    qryManutencaoPreco.First;
    for I:= 1 to qryManutencaoPreco.RecordCount do
    begin
      if qryManutencaoPreco.FieldByName('alterar').asboolean then
      begin
        Valor := qryManutencaoPreco.Fieldbyname(CampoColunaOrigem).AsVariant;

        if Valor > 0 then
        begin
          qryManutencaoPreco.Edit;
          if Perc <> 0 then
               qryManutencaoPreco.Fieldbyname(CampoColunaDestino).AsVariant:= ArredondarPrecoProduto(qryManutencaoPreco.Fieldbyname('produto').AsVariant,
                                                                                  (qryManutencaoPreco.FieldbyName(CampoColunaOrigem).AsVariant +
                                                                                   RoundTo(qryManutencaoPreco.FieldByName(CampoColunaOrigem).AsVariant * (Perc / 100),-2)))
          else qryManutencaoPreco.Fieldbyname(CampoColunaDestino).AsVariant:= qryManutencaoPreco.Fieldbyname(CampoColunaOrigem).AsVariant;


          if Validade <> '' then
               qryManutencaoPreco.Fieldbyname(CampoDataValidadeDestino).AsVariant:= Validade
          else qryManutencaoPreco.Fieldbyname(CampoDataValidadeDestino).AsVariant:= qryManutencaoPreco.Fieldbyname(CampoDataValidadeOrigem).AsVariant;

          qryManutencaoPreco.Fieldbyname(CampoMargemDestino).AsVariant:= qryManutencaoPreco.Fieldbyname(CampoMargemOrigem).AsVariant;

          qryManutencaoPreco.Post;
          dsrManutencaoPrecoDataChange(self,qryManutencaoPreco.Fieldbyname(CampoColunaDestino));
        end;
      end;
      qryManutencaoPreco.Next;
    end;
  finally
    qryManutencaoPreco.GotoBookmark(Pos);
    qryManutencaoPreco.FreeBookmark(Pos);
    qryManutencaoPreco.EnableControls;
    VarrendoManutencao := False;
  end;
end;

procedure TdtmManutencaoPreco.PreencherComboBox(Lista: TComboBox; definirpromocao: boolean);
var
  I, J: Integer;
begin
  Lista.Items.Clear;
  Lista.Items.Add('Nenhuma');
    {
    if not qryProcuraColunascodigo.IsNull then
    begin
      if (qryProcuraColunascodigo.AsInteger <> StrToInt(PNormal)) then begin
        if qryColuna.Locate('codigo',StrToInt(PNormal),[]) then
             Lista.Items.Add(PrimeiraMaiuscula(LowerCase(qryColunadescricao.AsString)))
        else Lista.Items.Add('');
      end;
      Lista.Items.Add(PrimeiraMaiuscula(LowerCase(qryProcuraColunasdescricao.AsString)));
    end
    else
    begin
      qryColuna.First;
      for I:= 1 to qryColuna.RecordCount do begin
        Lista.Items.Add(PrimeiraMaiuscula(LowerCase(qryColunadescricao.AsString)));
        qryColuna.Next;
      end;
    end;
    }

    J := 0;
    qryColuna.First;
    for I:= 1 to qryColuna.RecordCount do
    begin
      Lista.Items.Add(PrimeiraMaiuscula(LowerCase(qryColunadescricao.AsString)));

      if definirpromocao then
        if qryColunapromocao.asboolean then
        begin
          J := I;
          fColunaPromocao := I;
        end;

      qryColuna.Next;
    end;

    Lista.ItemIndex := J;



end;

constructor TdtmManutencaoPreco.Create(AOwner: TComponent);
begin
  inherited;
//  qryColuna.Tag                  := ctTabelas;
//  qryProcuraColunas.Tag          := ctTabelas;
//  qryProcuraFiliais.Tag          := ctTabelas;
//  qryTabelaMarketplace.Tag       := ctTabelas;

  qryConsultaColunas.Tag         := ctConsultaColunas;
  qryConsultaFiliais.Tag         := ctConsultaFiliais;
  qryManutencaoPreco.Tag         := ctManutencaoPreco;


  PrecosCaracteristicasAlterados[caract_preco_col] := TStringList.Create;
  PrecosCaracteristicasAlterados[Caracteristica] := TStringList.Create;
  PrecosCaracteristicasAlterados[preco] := TStringList.Create;
  PrecosCaracteristicasAlterados[coluna] := TStringList.Create;
  PrecosCaracteristicasAlterados[valor] := TStringList.Create;
  PrecosCaracteristicasAlterados[validade] := TStringList.Create;

  CaracteristicasAlteradas[caracteristicam] := TStringList.Create;
  CaracteristicasAlteradas[markup] := TStringList.Create;
  CaracteristicasAlteradas[grupo] := TStringList.Create;
  CaracteristicasAlteradas[classe] := TStringList.Create;
  CaracteristicasAlteradas[marca] := TStringList.Create;


  PrecosCaracteristicasAlteradosMKP[caract_preco_col] := TStringList.Create;
  PrecosCaracteristicasAlteradosMKP[Caracteristica] := TStringList.Create;
  PrecosCaracteristicasAlteradosMKP[preco] := TStringList.Create;
  PrecosCaracteristicasAlteradosMKP[coluna] := TStringList.Create;
  PrecosCaracteristicasAlteradosMKP[valor] := TStringList.Create;
  PrecosCaracteristicasAlteradosMKP[validade] := TStringList.Create;

  CaracteristicasAlteradasMKP[caracteristicam] := TStringList.Create;
  CaracteristicasAlteradasMKP[markup] := TStringList.Create;
  CaracteristicasAlteradasMKP[grupo] := TStringList.Create;
  CaracteristicasAlteradasMKP[classe] := TStringList.Create;
  CaracteristicasAlteradasMKP[marca] := TStringList.Create;
  CaracteristicasAlteradasMKP[precotabelado] := TStringList.Create;

  ProdutosAlterados[produto]  := TStringList.Create;
  ProdutosAlterados[precoproduto] := TStringList.Create;
//  ProdutosAlterados[promocao] := TStringList.Create;

  DescontosProdutosCargosAlterados[produto_cargo_pc] := TStringList.Create;
  DescontosProdutosCargosAlterados[produto_pc] := TStringList.Create;
  DescontosProdutosCargosAlterados[cargo_pc] := TStringList.Create;
  DescontosProdutosCargosAlterados[desconto_pc] := TStringList.Create;

  DescontosProdutosCargosAlteradosMKP[produto_cargo_pc] := TStringList.Create;
  DescontosProdutosCargosAlteradosMKP[produto_pc] := TStringList.Create;
  DescontosProdutosCargosAlteradosMKP[cargo_pc] := TStringList.Create;
  DescontosProdutosCargosAlteradosMKP[desconto_pc] := TStringList.Create;

  MarketPlace[marketplace_codigo] := TStringList.Create;
  MarketPlace[marketplace_margem_final_desejada] := TStringList.Create;

  produto_marketplace[marketplace_codigo] := TStringList.Create;
  produto_marketplace[marketplace_margem_final_desejada] := TStringList.Create;

  {
  marketplace_produtos_fator[produto_marketplace_m_p_f] := TStringList.Create;
  marketplace_produtos_fator[produto_m_p_f] := TStringList.Create;
  marketplace_produtos_fator[marketplace_m_p_f] := TStringList.Create;
  marketplace_produtos_fator[fator_m_p_f] := TStringList.Create;
  }



  CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao] := TStringList.Create;
  CaracteristicasPrecoPromocaoAlteradas[caracteristica_pro] := TStringList.Create;
  CaracteristicasPrecoPromocaoAlteradas[preco_pro] := TStringList.Create;
  CaracteristicasPrecoPromocaoAlteradas[promocao_pro] := TStringList.Create;

  fColunaPromocao := 0;

end;

procedure TdtmManutencaoPreco.ExcluirColunaPreco;
var
  Pos: TBookmark;
  I: Integer;
begin

  qryManutencaoPreco.DisableControls;
  Pos:= qryManutencaoPreco.GetBookmark;
  try
    VarrendoManutencao := True;
    qryManutencaoPreco.First;
    for I:= 1 to qryManutencaoPreco.RecordCount do
    begin
      if qryManutencaoPreco.FieldByName('alterar').asboolean then
      begin
        qryManutencaoPreco.Edit;
        qryManutencaoPreco.FieldByName(CampoColunaExcluir).AsCurrency  := 0;
        qryManutencaoPreco.FieldByName(CampoDataValidadeExcluir).Clear;
        qryManutencaoPreco.FieldByName(CampoMargemExcluir).Clear;

        qryManutencaoPreco.Post;
        dsrManutencaoPrecoDataChange(self,qryManutencaoPreco.FieldByName(CampoColunaExcluir));
      end;
      qryManutencaoPreco.Next;

    end;
  finally
    qryManutencaoPreco.GotoBookmark(Pos);
    qryManutencaoPreco.FreeBookmark(Pos);
    qryManutencaoPreco.EnableControls;
    VarrendoManutencao := False;
  end;
end;



function TdtmManutencaoPreco.ExisteColunas(Campo, codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaColunas, campo, codigo);
end;



function TdtmManutencaoPreco.ExisteFiliais(campo, codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

procedure TdtmManutencaoPreco.LimpaTabelas;
begin
  if not qryProcuraColunas.IsEmpty then
    ReFazConsulta(qryProcuraColunas,[0],[0]);
  if not qryProcuraFiliais.IsEmpty then
    ReFazConsultaFiliais;
  if not qryManutencaoPreco.IsEmpty then
    Fecha(ctManutencaoPreco);
end;

procedure TdtmManutencaoPreco.FechaTabelaPesquisa(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of

     pesCARACTERISTICAS : Fecha(ctPesquisaCaracteristica);
             pesCLASSES : Fecha(ctPesquisaClasse);
              pesGRUPOS : Fecha(ctPesquisaGrupo);
             pesCOLUNAS : Fecha(ctConsultaColunas);
              pesMARCAS : Fecha(ctConsultaMarcas);
     pesTIPOSMOVIMENTOS : qryConsultaTipoMovimentos.Close;
               pesNOTAS : qryConsultaNfEntrada.Close;
  pesSERIESFORNECEDORES : qryConsultaSerieNfEntrada.Close;
             pesFILIAIS : if not FFornecedores then Fecha(ctConsultaFiliais)
                          else qryConsultaFiliaisMovimentos.Close;
  end;
end;


function TdtmManutencaoPreco.GetConsultarColunas: TtecQuery;
begin
  Result:= qryConsultaColunas;
end;


function TdtmManutencaoPreco.GetConsultaFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

//function TdtmManutencaoPreco.GetDescricaoColuna: String;
//begin
//  Result:= PrimeiraMaiuscula(LowerCase(qryProcuraColunasdescricao.AsString));
//end;

function TdtmManutencaoPreco.GetNumeroRegistro: Integer;
begin
  Result:= qryManutencaoPreco.RecordCount;
end;

procedure TdtmManutencaoPreco.MontarSQLManutencaoPreco(CondicaoCaracteristica, CondicaoItemProduto,
    CondicaoMarca, CondicaoGrupo,
    CondicaoClasse, CondicaoMarketPlace: String; ProdutoEspecifico: String);

const

//  Sql_1  = 'SELECT cast(p.codigovisual||'' - ''||p.descricao as varchar(85)) as visualdescricao, ' +#13 +
  Sql_1  =        'select  c.codigo as caracteristica, '  +
                  'c.codigovisual as caracteristicavisual, ' +
                  'p.codigo as produto, '        +
                  'p.codigovisual as produtovisual, '   +
                  'p.descricao as descproduto, ' +

                  'p.valorgrade1, ' +
                  'p.valorgrade2, ' +
                  '(select gr.descricao from grades gr where gr.codigo = c.grade1) as linha, ' +
                  '(select gr.descricao from grades gr where gr.codigo = c.grade2) as coluna, ' +
                  'p.referencia, '               +
                  'c.grupo, '               +
                  'g.descricao as descricaogrupo, '+
                  'pr.promocao, pro.descricao as descricaopromocao, '+
                  'c.classe, '               +
                  'cl.descricao as descricaoclasse, ' +
                  'c.marca, '+
                  'm.descricao as descricaomarca, '+
                  'p.resultadocurvaabc, '        +
                  'pr.codigo as preco, '        +
                  'pr.descricao as descpreco, '    +
                  '(select ti.valor from tributosicms ti where ti.codigo = c.incidencia) as cst_produto, ' +
                  'c.csosn as csosn_produto, ' +
                  '(Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial) as ultimacompra, ' +
                  '(Select e.datacompra from estoques e where e.produto = p.codigo and e.filial  = :filial) as dataultimacompra, ' +
                  '(SELECT CASE when sum (e.emestoque + e.reservado + e.reservaprevia + e.transito + e.demonstracao + e.conserto + e.danificada)=0 THEN 0 '+
                  '       ELSE sum(e.financeiro) /sum (e.emestoque + e.reservado + e.reservaprevia + e.transito + e.demonstracao + e.conserto + e.danificada) '+
                  '       END from estoques e where e.produto=p.codigo) as customediogeral ,'+
                  'CASE WHEN c.csosn in (''101'',''102'') THEN ' +
                  '(Select e.valorultimacompra + (e.precocomicms - e.precosemicms) from estoques e where e.produto = p.codigo and e.filial = :filial) ELSE ' +
                  '(Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial = :filial) END as ultimacompra_com_icms, ' +
                  '(select sum(e.emestoque + e.reservado + e.reservaprevia + e.transito + e.demonstracao + e.conserto + e.danificada) ' +
                  ' from estoques e where e.produto = p.codigo) as estoquetotal, ' +
                  'false as alterado, '          +
                  '(Select e.precocomicms from estoques e where e.produto = p.codigo and e.filial  = :filial) as precocomicms, ' +
                  '(Select e.precosemicms from estoques e where e.produto = p.codigo and e.filial  = :filial) as precosemicms, ' +
                  '(select precovendaantesimpostos from formacaoprecovenda(p.codigo, cast(:filial as integer), '''', '''', (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial), 0, c.markup, 0, 0)) as precovendaantesimpostos, '  +
                  'c.markup, ' +

                  ' (select markup_inverso from formacaoprecovenda(p.codigo, cast(:filial as integer), '''', '''', (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial), 0, c.markup, 0, 0, '+
                  ' estoques_preconormal(p.codigo, :filial) )) as markupinverso, '+


                  '(select precovenda from formacaoprecovenda(p.codigo, cast(:filial as integer), '''', '''', (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial), 0, c.markup, 0, 0)) as precovenda, ' +
                  'true as alterar ';

  From_1 = ' from (((((((caracteristicas c join produtos p on c.codigo = p.caracteristica ' +
                                                      '  join (precos pr left join promocoes pro on pr.promocao = pro.codigo) on pr.caracteristica = c.codigo ' +
														        ' and pr.codigo =  %s)) '+
                                                        ' join marcas m on c.marca = m.codigo) ' +
                                                        ' join grupos g on c.grupo = g.codigo) ' +
                    				        ' join classes cl on c.classe = cl.codigo) ' +
                                                        ' join tributosicms ti on ti.codigo = c.incidencia) ' +
                                                        ' left join csosn on csosn.codigo = c.csosn) ';


{
' (select precovenda from formacaoprecovenda(p.codigo, cast(:filial as integer), '''', '''', (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial), 0, c.markup, 0, 0)) )) as markupinverso, ' +

estoques_preco(p.codigo, :filial)

                  '(select markup_inverso from formacaoprecovenda(p.codigo, cast(:filial as integer), '''', '''', (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial), 0, c.markup, 0, 0, ' +
                  ' (select precovenda from formacaoprecovenda(p.codigo, cast(:filial as integer), '''', '''', (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial), 0, c.markup, 0, 0)) )) as markupinverso, ' +

}



var
  Select,
  From,
  Where,
  Ordem: String;
  {Filial,} I: Integer;

begin
  {Quando produto especifico então irá recuperar para mostrar os dados como o prço especificado, isto em na tabela qryManutencaoPrecoAux }

  if ProdutoEspecifico = '' then
  begin
    PNormal := '0';
    PPromocao := '0';
    Fecha(ctManutencaoPreco);

    if FPrecosDiferenciados then
    begin
      Filial:= qryProcuraFiliaiscodigo.AsInteger;
      ReFazConsulta(qryColunasFiliais,[0],[qryProcuraFiliaiscodigo.AsInteger]);
      PNormal := qryColunasFiliaispreconormal.AsString;
      PPromocao := qryColunasFiliaisprecopromocao.AsString;
    end
    else
    begin
      Filial := FilialBase;
      PNormal:= PrecoNormal;
      PPromocao := PrecoPromocao;

    end;

    if PPromocao = '' then
      PPromocao := '0';
  end;

  Select:= Sql_1;

//  Select:= Format(Select,[inttostr(Filial), inttostr(Filial), inttostr(Filial), inttostr(Filial), inttostr(Filial), inttostr(Filial), inttostr(Filial)]);

  if ProdutoEspecifico = '' then
    From  := format(From_1, ['p.preco'])
  else
    From  := format(From_1, [qryPrecoscodigo.asString]);

  Ordem := '';

  qryColuna.parambyname('PNormal').asInteger := strtoint(PNormal);
  qryColuna.parambyname('PPromocao').asInteger := strtoint(PPromocao);

  if not qryProcuraColunascodigo.IsNull then
    qryColuna.macrobyname('Sql').asString := ' and (codigo = ' + PNormal + ' or ' +
                                             '      codigo = ' + PPromocao + ' or ' +
                                             '      codigo = ' + qryProcuraColunascodigo.asString + ')'
  else
    qryColuna.macrobyname('Sql').asString := '';

  qryColuna.close;
  qryColuna.Open;
  qryColuna.First;


  for I := 1 to qryColuna.RecordCount do
  begin
    Select := Select + ', ' ;
    Select := Select + 'l' + qryColunacodigo.AsString + '.valor as valor_l' + qryColunacodigo.AsString + ', ' ;

    if qryColunanormal.AsBoolean then
    begin
      Select := Select + 'CASE WHEN COALESCE(l' + qryColunacodigo.AsString + '.valor,0)=0 THEN 0 ELSE (1 - (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial)/l' + qryColunacodigo.AsString + '.valor) * 100 END as margem_l' + qryColunacodigo.AsString + ', ' ;
      Select := Select + 'l' + qryColunacodigo.AsString + '.validade as validade_l' + qryColunacodigo.AsString ;
    end
    else
    begin
      Select := Select + 'CASE WHEN COALESCE(l' + qryColunacodigo.AsString + '.valor,0)=0 THEN 0 ELSE (1 - (Select e.valorultimacompra from estoques e where e.produto = p.codigo and e.filial  = :filial)/l' + qryColunacodigo.AsString + '.valor) * 100 END as margem_l' + qryColunacodigo.AsString + ', ' ;
      Select := Select + 'l' + qryColunacodigo.AsString + '.validade as validade_l' + qryColunacodigo.AsString ;
    end;

    From := From  + 'LEFT JOIN colunasprecos as l' + qryColunacodigo.AsString  + ' ON (pr.caracteristica = l' + qryColunacodigo.AsString + '.caracteristica)' +
                    ' and (pr.codigo = l'+ qryColunacodigo.AsString + '.preco)' +
                    ' and (l' + qryColunacodigo.AsString + '.coluna = ' + qryColunacodigo.AsString + ') ';

    if (FDataInicial<>'') and (FDataFinal <> '') then
      From := From +  ' and (l' + qryColunacodigo.AsString + '.alteracao between '''+FormatDateTime('yyyy-MM-dd',strtodate(FDataInicial))+''' and ''' + FormatDateTime('yyyy-MM-dd',strtodate(FDataFinal)) + ''')';

    qryColuna.Next;
  end;

         {
  Where := ' (p.caracteristica = c.codigo) '     +
                 'and (c.codigo  = pr.caracteristica) ' +
                 'and (p.preco = pr.codigo)          ' ;
                 }

  Where := ' true ';

  if ProdutoEspecifico = '' then
  begin

    case compostos of
      1: Where := Where + ' and not (coalesce(c.composto,false))' ;
      2: Where := Where + ' and (coalesce(c.composto,false))' ;
    end;

    if CondicaoCaracteristica<>'' then
      Where:= Where + 'and ( ' + CondicaoCaracteristica + ')' ;

    if CondicaoItemProduto<>'' then
      Where:= Where + 'and ( ' + CondicaoItemProduto + ')' ;

    if CondicaoMarca <> '' then
      Where:= Where + 'and ( ' + CondicaoMarca + ')' ;

    if Condicaogrupo <> '' then
      Where:= Where + 'and ( ' + Condicaogrupo + ')' ;

    if SomenteComPromocoes then
      Where:= Where + ' and pr.promocao is not null ';

    if Listacodigospromocao<>'' then
      Where:= Where + ' and (' + listacodigospromocao +')';

    if ListaCST<>'' then
      Where:= Where + ' and (' + ListaCST +')';

    if ListaCSOSN<>'' then
      Where:= Where + ' and (' + ListaCSOSN +')';

    if ParametroListasPadrao <> '' then
      Where := Where + ' and (p.codigo in (select plp.produto '+
                                          ' from produtoslistaspadrao plp '+
                                          '      join listaspadrao lp '+
                                          '      on plp.listapadrao = lp.codigo '+
                                          ' where ' + ParametroListasPadrao + '))';

    if CondicaoClasse <> '' then
      Where:= Where + ' and ( ' + CondicaoClasse + ')' ;

    if not qryProcuraFornecedores.fieldbyname('codigo').IsNull then
      Where:= Where + ' and ((SELECT COUNT(*) ' +
                            ' FROM fornecedoresprodutos fp ' +
                            ' WHERE (fp.caracteristica = c.codigo) and ' + 
                                  '(fp.fornecedor = ' + qryProcuraFornecedores.fieldbyname('codigo').AsString + ')) > 0)' ;

    Where:= Where + MontaCondicaoMovimentacao +' '; //Condição para Filtrar por Movimentação de estoque
    Where:= Where + MontaCondicaoNotaEntrada +' ';  //Condição para Filtrar por Notas de Entrada

    if FProdutoEmLinha and not FprodutoForadeLinha then
       Where := Where + ' and  not p.foralinhal and not c.foralinhal'
    else
    if FprodutoForadeLinha and not Fprodutoemlinha then
       Where := Where + ' and  (p.foralinhal or c.foralinhal)';


    if FProdutoAtivo and not FprodutoInativo then
       Where := Where + ' and  (not (p.inativo is not null))'
    else
    if FprodutoInativo and not FprodutoAtivo then
       Where := Where + ' and  (p.inativo is not null)';

    if FProdutoComMontagem and not FProdutoSemMontagem then
       Where := Where + ' and (c.montagem)'
    else
    if FProdutoSemMontagem and not FProdutoComMontagem then
       Where := Where + ' and not (c.montagem)';

    if FProdutoBrinde and not FProdutoNaoBrinde then
       Where := Where + ' and (c.brinde)'
    else
    if FProdutoNaoBrinde and not FProdutoBrinde then
       Where := Where + ' and not (c.brinde)';

    if FDisponivelnoSite and not FNaoDisponivelnoSite then
       Where := Where + ' and (p.aparecernosite)'
    else
    if FNaoDisponivelnoSite and not FDisponivelnoSite then
       Where := Where + ' and not (p.aparecernosite)';

    if SomenteComEstoque then
       Where:= Where + 'and (select sum(emestoque+reservado+conserto+demonstracao+reservaprevia+futuro) from estoques where estoques.produto=p.codigo)>0 ' ;

    case FPrecos of
      0: Where:= Where + 'and not estoques_produtoempromocao(p.codigo, ' + IntToStr(Filial) + ')' ;
      1: Where:= Where + 'and estoques_produtoempromocao(p.codigo, ' + IntToStr(Filial) + ')'     ;
    end;
  end
  else
    Where:= Where + 'and (p.codigo = '+ProdutoEspecifico+')';

  case FOrdenacao of
     0: Ordem:= 'ORDER BY p.codigovisual ';
     1: Ordem:= 'ORDER BY UPPER(TO_ASCII(p.Descricao,''LATIN1'')), p.codigovisual ';
  end;


  if parsistema.PrecosporCargo then
  begin
    qryProdutosCargos.MacroByName('SQLCondicao').asString := ' and ' + where;

    qryProdutosCargos.close;
    qryProdutosCargos.open;

    for I := 1 to qryProdutosCargos.RecordCount do
    begin

      if ProdutoEspecifico = '' then
      begin
        Select := Select + ', ' ;

        select := select + ' NULLIF(estoques_preco(cast(p.codigo as bigint), cast(' + inttostr(filial) + ' as integer) , cast((Select pc.markup ' +
                                           ' from produtoscargos pc  where pc.cargo = '+qryProdutosCargoscargo.AsString + ' and ' +
                                           ' pc.produto = p.codigo) as numeric)), 0) as cargo_' + qryProdutosCargoscargo.AsString;

        select := select + ', CASE WHEN estoques_preco(cast(p.codigo as bigint), cast(' + inttostr(filial) + ' as integer) ,cast((Select pc.markup ' +
                                           ' from produtoscargos pc  where pc.cargo = '+qryProdutosCargoscargo.AsString + ' and ' +
                                           ' pc.produto = p.codigo) as Numeric)) = 0 then 0   else ' +
                                           ' (1 -  (Select e.valorultimacompra ' +
                                           '           from estoques e ' +
                                           '           where e.produto = p.codigo ' +
                                           '             and e.filial  = :filial)/estoques_preco(cast(p.codigo as bigint), cast(' + inttostr(filial) + ' as integer) ,cast((Select pc.markup ' +
                                           ' from produtoscargos pc  where pc.cargo = '+qryProdutosCargoscargo.AsString + ' and ' +
                                           ' pc.produto = p.codigo) as numeric))) * 100  end as margem_pc' + qryProdutosCargoscargo.AsString;

        select := select + ', (Select pc.markup ' +
                            ' from produtoscargos pc where pc.cargo = '+qryProdutosCargoscargo.AsString + ' and ' +
                                                         ' pc.produto = p.codigo) as desconto_pc' + qryProdutosCargoscargo.AsString;
      end
      else
      begin
        Select := Select + ', ' ;

        select := select + ' NULLIF(estoques_preco_manutencao_preco(p.codigo, '
                                                   + inttostr(filial) + ', ' +
                                                   trocar(qryManutencaoPreco.fieldbyname('desconto_pc'+qryProdutosCargoscargo.AsString).asstring, ',', '.') + ', '+
                                                   qryPrecoscodigo.asString+'),0) as cargo_' + qryProdutosCargoscargo.AsString;

        select := select + ', CASE WHEN estoques_preco_manutencao_preco(p.codigo, '
                                                   + inttostr(filial) + ', ' +
                                                   trocar(qryManutencaoPreco.fieldbyname('desconto_pc'+qryProdutosCargoscargo.AsString).asstring, ',','.') + ', '+
                                                   qryPrecoscodigo.asString+') = 0 then 0   else ' +
                                           ' (1 -  (Select e.valorultimacompra ' +
                                           '           from estoques e ' +
                                           '           where e.produto = p.codigo ' +
                                           '             and e.filial  = :filial)/estoques_preco_manutencao_preco(p.codigo, '
                                                   + inttostr(filial) + ', ' +
                                                   trocar(qryManutencaoPreco.fieldbyname('desconto_pc'+qryProdutosCargoscargo.AsString).asstring, ',','.') + ', '+
                                                   qryPrecoscodigo.asString+')) * 100  end as margem_pc' + qryProdutosCargoscargo.AsString;

        select := select + ', (Select cast(' + trocar(qryManutencaoPreco.fieldbyname('desconto_pc'+qryProdutosCargoscargo.AsString).asstring, ',', '.') +
                            ' as numeric)) as desconto_pc' + qryProdutosCargoscargo.AsString;

      end;

      qryProdutosCargos.Next;
    end;
  end;


  if ProdutoEspecifico = '' then
  begin

    {cdsMarketplace.close;}
    qryManutencaoPreco.Sql.Clear;
    qryManutencaoPreco.Sql.Text := Select + From + ' where ' + Where + Ordem;
    qryManutencaoPreco.parambyname('filial').asinteger := filial;

    cdsMarketplace.macrobyname('SQL').asString :=  Where;
    if CondicaoMarketPlace <> '' then
      cdsMarketplace.macrobyname('SQLMarketPlace').asString :=  'and ( ' + CondicaoMarketPlace + ')'
    else
      cdsMarketplace.macrobyname('SQLMarketPlace').asString :=  ' and coalesce(mk.ativo,false) ';


    cdsMarketplace.close;


//    Abre(ctManutencaoPreco);

  end
  else
  begin
    qryManutencaoPrecoAux.Sql.Clear;
    qryManutencaoPrecoAux.Sql.Text := Select + From + ' where ' + Where + Ordem;
    qryManutencaoPrecoAux.parambyname('filial').asinteger := filial;

    qryManutencaoPrecoAux.open;
  end;

end;

procedure TdtmManutencaoPreco.qryManutencaoPrecoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  FEditando:= True;
end;

procedure TdtmManutencaoPreco.qryManutencaoPrecoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryManutencaoPreco.Cancel;
end;

procedure TdtmManutencaoPreco.Selecionar(TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
             pesCOLUNAS : ReFazConsulta(qryProcuraColunas,[0],[qryConsultaColunascodigo.AsInteger]);
     pesTIPOSMOVIMENTOS : ReFazConsulta(qryProcuraTipoMovimentos,[0],[qryConsultaTipoMovimentoscodigo.AsVariant]);
               pesNOTAS : ReFazConsultaPorNome(qryProcuraNFEntrada,
                                            ['fornecedor','tipofornecedor','serie', 'numero'],

                                            [qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsVariant,
                                             qryProcuraFornecedorNFEntrada.fieldbyname('tipo').AsVariant,

                                             qryProcuraSerieNFEntradaserie.AsVariant,
                                             qryConsultaNfEntradanumero.AsVariant]);

  pesSERIESFORNECEDORES : ReFazConsulta(qryProcuraSerieNFEntrada,[0,1],[qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsVariant,
                                                                          qryConsultaSerieNfEntradaserie.AsVariant]);
             pesFILIAIS : if not FFornecedores then
                            ReFazConsulta(qryProcuraFiliais,[0],[qryConsultaFiliaiscodigo.AsInteger])
                          else
                            ReFazConsulta(qryProcuraFilialMovimentos,[0],[qryConsultaFiliaisMovimentoscodigo.AsInteger]);
  end;
end;

procedure TdtmManutencaoPreco.ReFazConsultaFiliais;
begin
  ReFazConsulta(qryProcuraFiliais,[0],[0]);
end;

procedure TdtmManutencaoPreco.DataModuleDestroy(Sender: TObject);
begin
  SetLength(FCodigosAlteracoesPrecos, 0);
  inherited;
end;

procedure TdtmManutencaoPreco.qryManutencaoPrecoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  {
  qryManutencaoPreco.Fields[0].Visible := false;
  qryManutencaoPreco.Fields[1].visible := False;
  }
  LimparProdutosAlterados;
  ReadOnlyFieldsManutencao;
end;

procedure TdtmManutencaoPreco.dsrManutencaoPrecoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsrManutencaoPreco.dataset.active then
  begin

    if (field <> nil) and
       (field.fieldname = 'alterar') then
    begin
      MarcarRegistrosManutencaoPrecosAtualizar(false, false);
      tlabel(self.findcomponent('lblExibirTotalMarcados')).Caption := inttostr(QtdeMarcados);
    end;


    if (field <> nil) and
       (field.fieldname <> 'alterado') and
       (field.fieldname <> 'alterar') then
    begin
      if qryManutencaoPreco.state <> dsedit then
        qryManutencaoPreco.edit;

      dsrManutencaoPreco.OnDataChange := nil;
      qryManutencaoPreco.fieldbyname('alterado').asBoolean := true;
      dsrManutencaoPreco.OnDataChange := dsrManutencaoPrecoDataChange;

      if field.FieldName <> 'promocao' then
        if qryManutencaoPreco.state = dsedit then
        begin
  //        qryManutencaoPreco.post;

          dsrManutencaoPreco.OnDataChange := nil;
          qryManutencaoPreco.post;
          dsrManutencaoPreco.OnDataChange := dsrManutencaoPrecoDataChange;

        end;

    end;

    if not AtualizandoPrecos then
      if field <> nil then

        if ((copy(Field.FieldName,1,7)='valor_l') or
            (copy(Field.FieldName,1,10)='validade_l')) {and
            (qryManutencaoPreco.fieldByName('caracteristica').asstring<>'')} then  //Gedovar: perguntar se caracterisitca <> '' não condiz com o sql
        begin
          if copy(Field.FieldName,1,7)='valor_l' then
            Col := copy(Field.FieldName,8,length(Field.FieldName)-7)
          else
            Col := copy(Field.FieldName,11,length(Field.FieldName)-10);

          index := PrecosCaracteristicasAlterados[caract_preco_col].IndexOf(
              qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
              qryManutencaoPreco.fieldByName('preco').asstring + '-' +
              Col);

          if index = -1 then
          begin

            PrecosCaracteristicasAlterados[caract_preco_col].Add(
                qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
                qryManutencaoPreco.fieldByName('preco').asstring + '-' +
                Col);

            PrecosCaracteristicasAlterados[caracteristica].Add(qryManutencaoPreco.fieldByName('caracteristica').asstring);
            PrecosCaracteristicasAlterados[preco].Add(qryManutencaoPreco.fieldByName('preco').asstring);
            PrecosCaracteristicasAlterados[coluna].Add(Col);

            if (qryManutencaoPreco.FieldByName('valor_l'+col).AsString='') then
             PrecosCaracteristicasAlterados[valor].Add('0')
            else
             PrecosCaracteristicasAlterados[valor].Add(qryManutencaoPreco.FieldByName('valor_l'+col).AsString);

            PrecosCaracteristicasAlterados[validade].Add(qryManutencaoPreco.FieldByName('validade_l'+col).AsString);

            index := PrecosCaracteristicasAlterados[caract_preco_col].IndexOf(

                     qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
                     qryManutencaoPreco.fieldByName('preco').asstring + '-' +
                     Col);
          end
          else
          begin
            if (PrecosCaracteristicasAlterados[valor].Strings[index] <> qryManutencaoPreco.FieldByName('valor_l'+col).AsString) or
               (PrecosCaracteristicasAlterados[validade].Strings[index] <> qryManutencaoPreco.FieldByName('validade_l'+col).AsString) then
            begin
              if (qryManutencaoPreco.FieldByName('valor_l'+col).AsString='') then
               PrecosCaracteristicasAlterados[valor].Strings[index] := '0'
              else
               PrecosCaracteristicasAlterados[valor].Strings[index] := qryManutencaoPreco.FieldByName('valor_l'+col).AsString;
              PrecosCaracteristicasAlterados[validade].Strings[index] := qryManutencaoPreco.FieldByName('validade_l'+col).AsString;
            end;
          end;

          if not VarrendoManutencao then
          begin

            if (col = PNormal) or
               (col = PPromocao) then
            begin

              if (copy(Field.FieldName,1,7)='valor_l') and (col = PNormal) then
              begin
                AlterarMarkupInverso := true;
                AtualizarPrecos(true);
                AlterarMarkupInverso := false;
              end
              else
                AtualizarPrecos(true);
            end
            else
              AtualizarPrecos(false);
          end;

        end
        else
        if (field.FieldName = 'markup') or
           (field.FieldName = 'grupo') or
           (field.FieldName = 'classe') or
           (field.FieldName = 'marca') then
        begin

          indexM := CaracteristicasAlteradas[caracteristicam].IndexOf(
            qryManutencaoPreco.fieldByName('caracteristica').asstring);

          if indexM = -1 then
          begin
            CaracteristicasAlteradas[caracteristicam].Add(qryManutencaoPreco.fieldByName('caracteristica').asstring);
            CaracteristicasAlteradas[markup].Add(qryManutencaoPreco.fieldByName('markup').asstring);
            CaracteristicasAlteradas[grupo].Add(qryManutencaoPreco.fieldByName('grupo').asstring);
            CaracteristicasAlteradas[classe].Add(qryManutencaoPreco.fieldByName('classe').asstring);
            CaracteristicasAlteradas[marca].Add(qryManutencaoPreco.fieldByName('marca').asstring);

            indexM := CaracteristicasAlteradas[caracteristicaM].IndexOf(qryManutencaoPreco.fieldByName('caracteristica').asstring);
          end
          else
          if (CaracteristicasAlteradas[markup].Strings[indexM] <> qryManutencaoPreco.FieldByName('markup').AsString) or
             (CaracteristicasAlteradas[grupo].Strings[indexM] <> qryManutencaoPreco.FieldByName('grupo').AsString) or
             (CaracteristicasAlteradas[classe].Strings[indexM] <> qryManutencaoPreco.FieldByName('classe').AsString) or
             (CaracteristicasAlteradas[marca].Strings[indexM] <> qryManutencaoPreco.FieldByName('marca').AsString) then
          begin
            CaracteristicasAlteradas[markup].Strings[indexM] := qryManutencaoPreco.FieldByName('markup').AsString;
            CaracteristicasAlteradas[grupo].Strings[indexM] := qryManutencaoPreco.FieldByName('grupo').AsString;
            CaracteristicasAlteradas[classe].Strings[indexM] := qryManutencaoPreco.FieldByName('classe').AsString;
            CaracteristicasAlteradas[marca].Strings[indexM] := qryManutencaoPreco.FieldByName('marca').AsString;
          end;

          if (field.FieldName = 'markup') then
            if not VarrendoManutencao then
              AtualizarMarkups(true);

        end
        else
        if (copy(field.FieldName,1,11)= 'desconto_pc') then
        begin

          dsrManutencaoPreco.OnDataChange := nil;
          AtualizarDescontoCargos(field.fieldname);
          dsrManutencaoPreco.OnDataChange := dsrManutencaoPrecoDataChange;

        end
        else
        if (copy(field.FieldName,1,5)= 'cargo') then
          AtualizarPrecoCargos(field.fieldname)
        else
        if field.FieldName = 'preco' then
        begin

          indexProduto := ProdutosAlterados[produto].IndexOf(qryManutencaoPreco.fieldByName('produto').asstring);

          if indexProduto = -1 then
          begin
            ProdutosAlterados[produto].Add(qryManutencaoPreco.fieldByName('produto').asstring);
            ProdutosAlterados[precoproduto].Add(qryManutencaoPreco.fieldByName('preco').asstring);
            indexProduto := ProdutosAlterados[produto].IndexOf(qryManutencaoPreco.fieldByName('produto').asstring);
          end
          else
          if (ProdutosAlterados[precoproduto].Strings[indexProduto] <> qryManutencaoPreco.FieldByName('preco').AsString) then
            ProdutosAlterados[precoproduto].Strings[indexProduto] := qryManutencaoPreco.FieldByName('preco').AsString;

        end

        else
        if field.FieldName = 'promocao' then
        begin

          IndexCaracteristicasPrecoPromocaoAlteradas := CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao].IndexOf(
              qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
              qryManutencaoPreco.fieldByName('preco').asstring);

          if IndexCaracteristicasPrecoPromocaoAlteradas = -1 then
          begin
            CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao].Add(
                qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
                qryManutencaoPreco.fieldByName('preco').asstring);
            CaracteristicasPrecoPromocaoAlteradas[caracteristica_pro].Add(qryManutencaoPreco.fieldByName('caracteristica').asstring);
            CaracteristicasPrecoPromocaoAlteradas[preco_pro].Add(qryManutencaoPreco.fieldByName('preco').asstring);
            CaracteristicasPrecoPromocaoAlteradas[promocao_pro].Add(qryManutencaoPreco.FieldByName('promocao').AsString);

            IndexCaracteristicasPrecoPromocaoAlteradas := CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao].IndexOf(
                        qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
                        qryManutencaoPreco.fieldByName('preco').asstring);
          end
          else
          if (CaracteristicasPrecoPromocaoAlteradas[promocao_pro].Strings[IndexCaracteristicasPrecoPromocaoAlteradas] <>
             qryManutencaoPreco.FieldByName('promocao').AsString) then
          begin

            CaracteristicasPrecoPromocaoAlteradas[promocao_pro].Strings[IndexCaracteristicasPrecoPromocaoAlteradas] :=
               qryManutencaoPreco.FieldByName('promocao').AsString;
          end;

          dsrManutencaoPreco.OnDataChange := nil;

          if Assigned(GravarPromocao) then
             GravarPromocao(qryManutencaoPreco);

          dsrManutencaoPreco.OnDataChange := dsrManutencaoPrecoDataChange;




        end;
  end;
end;

procedure TdtmManutencaoPreco.AtualizarPrecos(calcularValoresPrecosMarkup: boolean);
var
 RegistroAtual : TBookMark;
begin
 RegistroAtual := qryManutencaoPreco.GetBookmark;
 qryManutencaoPreco.DisableControls;
 qryManutencaoPreco.First;
 While not qryManutencaoPreco.Eof do
 begin
   if ((qryManutencaoPreco.fieldByName('caracteristica').asstring +'-'+ qryManutencaoPreco.fieldByName('preco').AsString + '-'+col) =  PrecosCaracteristicasAlterados[caract_preco_col].strings[index]) then
   begin

     if (qryManutencaoPreco.FieldByName('valor_l'+col).AsString    <> PrecosCaracteristicasAlterados[valor].strings[index]) or
        (qryManutencaoPreco.FieldByName('validade_l'+col).AsString <> PrecosCaracteristicasAlterados[validade].strings[index]) then
     begin
       AtualizandoPrecos := True;
       qryManutencaoPreco.Edit;
       qrymanutencaopreco.FieldByName('valor_l'+col).AsString := PrecosCaracteristicasAlterados[valor].strings[index];
       qrymanutencaopreco.FieldByName('validade_l'+col).AsString := PrecosCaracteristicasAlterados[validade].strings[index];
       qryManutencaoPreco.post;
     end;

     AtualizandoPrecos := False;

     if calcularValoresPrecosMarkup then
       AlterarValoresPrecosMarkup(false);

   end;

   qryManutencaoPreco.Next;
 end;
 qrymanutencaopreco.GotoBookmark(RegistroAtual);
 qryManutencaoPreco.FreeBookmark(RegistroAtual);
 qryManutencaoPreco.enableControls;
 AtualizandoPrecos := False;
end;

procedure TdtmManutencaoPreco.AlterarColunasPrecosProdutos;

var
  Usuario: TtecUsuarios;
  Indice: INteger;
  RegistroAtual : TBookMark;

  procedure InserirColunasPreco;
  begin
     qryColunasPrecos.Sql.Clear;
      qryColunasPrecos.Sql.Add('Insert Into colunasprecos (caracteristica, preco, coluna, valor, validade, data, alteracao)' +
                               ' Values (' + PrecosCaracteristicasAlterados[caracteristica].strings[indice]       + ', ' +
                                             PrecosCaracteristicasAlterados[preco].strings[indice]                + ', ' +
                                             PrecosCaracteristicasAlterados[coluna].strings[indice]               + ', ' +
                                             Trocar(PrecosCaracteristicasAlterados[valor].strings[indice],',','.')+ ', ' +
                                             DataValidade                                                         + ', ' +
                                             'Current_Date'                                                       + ', ' +
                                             'Current_Date' + ')');
      qryColunasPrecos.Open;
//      Perpetrar([qryColunasPrecos]);
  end;

  procedure InserirProdutosCargos;
  begin
    qryAtualizarProdutosCargos.Sql.Clear;
    qryAtualizarProdutosCargos.Sql.Add('Insert Into produtoscargos (produto, cargo, markup)' +
                               ' Values (' + DescontosProdutosCargosAlterados[produto_pc].strings[indice]       + ', ' +
                                             DescontosProdutosCargosAlterados[cargo_pc].strings[indice]                + ', ' +
                                             Trocar(DescontosProdutosCargosAlterados[desconto_pc].strings[indice],',','.')+ ')');
    qryAtualizarProdutosCargos.Open;
  end;

  procedure AtualizarProdutosCargos;
  begin
    qryAtualizarProdutosCargos.Sql.Clear;
    qryAtualizarProdutosCargos.Sql.Add('Update produtoscargos set markup = ' + Trocar(DescontosProdutosCargosAlterados[desconto_pc].strings[indice],',','.') +
                              ' Where produto = ' + qryExisteProdutoCargoproduto.AsString +
                              ' and  cargo   = ' + qryExisteProdutoCargocargo.asString);

    qryAtualizarProdutosCargos.Open;
  end;

begin

  Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
  try

    RegistroAtual := qryManutencaoPreco.GetBookmark;
    qryManutencaoPreco.DisableControls;


    if UsuarioLogin.GerenteEstoque then
         Usuario:= ObterAutorizacao(taSENHA)
    else Usuario:= ObterAutorizacao(taLOGIN, ctGERENTEESTOQUE, ctAUTORIZADO);

    if Assigned(Usuario) then
    begin
      if Usuario.GerenteEstoque then
      begin


       for indice := 0 to PrecosCaracteristicasAlterados[caract_preco_col].Count -1 do
       begin
         if qrymanutencaopreco.locate('caracteristica;preco', VarArrayOf([PrecosCaracteristicasAlterados[caracteristica].strings[indice], PrecosCaracteristicasAlterados[preco].strings[indice]]), [] ) then
         begin
           ReFazConsulta(qryExisteColunaPreco,[0,1,2],[PrecosCaracteristicasAlterados[caracteristica].strings[indice],
                                                       PrecosCaracteristicasAlterados[preco].strings[indice],
                                                       PrecosCaracteristicasAlterados[coluna].strings[indice]]);
           if PrecosCaracteristicasAlterados[validade].strings[indice]<>'' then
                DataValidade:= '''' + PrecosCaracteristicasAlterados[validade].strings[indice]+ ''''
           else DataValidade:= 'null';

           if not qryExisteColunaPreco.IsEmpty then begin
             if StrToCurr(PrecosCaracteristicasAlterados[valor].strings[indice]) = 0 then
                 ExluirColunasPreco
             else
             if ((StrToCurr(PrecosCaracteristicasAlterados[valor].strings[indice])  <> qryExisteColunaPrecovalor.AsCurrency) or
                 (PrecosCaracteristicasAlterados[validade].strings[indice] <> qryExisteColunaPrecovalidade.AsString)) then
               AtualizarColunasPreco(Trocar(PrecosCaracteristicasAlterados[valor].strings[indice],',','.'));
           end
           else
             if (StrToCurr(PrecosCaracteristicasAlterados[valor].strings[indice]) <> 0) then
                 InserirColunasPreco;
         end;
       end;
       Perpetrar([qryColunasPrecos]);

       for indice := 0 to CaracteristicasAlteradas[caracteristicam].Count -1 do
       begin

        ReFazConsultapornome(qryCaracteristicas,['codigo'], [CaracteristicasAlteradas[caracteristicaM].strings[indice]]);

        if qryCaracteristicas.recordcount = 1 then
        begin
          if (CaracteristicasAlteradas[markup].strings[indice] <> qryCaracteristicasmarkup.asString) or
             (CaracteristicasAlteradas[grupo].strings[indice] <> qryCaracteristicasgrupo.asString) or
             (CaracteristicasAlteradas[classe].strings[indice] <> qryCaracteristicasclasse.asString) or
             (CaracteristicasAlteradas[marca].strings[indice] <> qryCaracteristicasmarca.asString) then
          begin
            qryAtualizarCaracteristicas.ParamByName('codigo').asString := qryCaracteristicascodigo.asString;
            qryAtualizarCaracteristicas.ParamByName('markup').asString := trocar(CaracteristicasAlteradas[markup].strings[indice], ',', '.');
            qryAtualizarCaracteristicas.ParamByName('grupo').asString := CaracteristicasAlteradas[grupo].strings[indice];
            qryAtualizarCaracteristicas.ParamByName('classe').asString := CaracteristicasAlteradas[classe].strings[indice];
            qryAtualizarCaracteristicas.ParamByName('marca').asString := CaracteristicasAlteradas[marca].strings[indice];
            qryAtualizarCaracteristicas.execSQL;
          end
        end
        else
          mensagemerro('O produto ' + CaracteristicasAlteradas[caracteristicaM].strings[indice] + ' não foi encontrado.');
       end;

       Perpetrar([qryAtualizarCaracteristicas]);


       for indice := 0 to DescontosProdutosCargosAlterados[produto_cargo_pc].Count -1 do
       begin
         ReFazConsultapornome(qryExisteProdutoCargo,['produto','cargo'],
                              [DescontosProdutosCargosAlterados[produto_pc].strings[indice],
                               DescontosProdutosCargosAlterados[cargo_pc].strings[indice]]);

         if not qryExisteProdutoCargo.IsEmpty then
         begin
           if (StrToCurr(DescontosProdutosCargosAlterados[desconto_pc].strings[indice])  <> qryExisteProdutoCargomarkup.AsCurrency) then
             AtualizarProdutosCargos;
         end
         else
           if (DescontosProdutosCargosAlterados[desconto_pc].strings[indice] <> '') then
             InserirProdutosCargos;
       end;

       Perpetrar([qryAtualizarProdutosCargos]);


       for indice := 0 to ProdutosAlterados[produto].Count -1 do
       begin

         if qrymanutencaopreco.locate('produto;preco', VarArrayOf([ProdutosAlterados[produto].strings[indice], ProdutosAlterados[precoproduto].strings[indice]]),[] ) then
         begin
           ReFazConsultapornome(qryProdutosPreco,['produto'], [ProdutosAlterados[produto].strings[indice]]);
           if qryProdutosPrecopreco.asString <> ProdutosAlterados[precoproduto].strings[indice] then
           begin
             qryProdutosPreco.edit;
             qryProdutosPrecopreco.asString := ProdutosAlterados[precoproduto].strings[indice];
             qryProdutosPreco.post;
             perpetrar([qryProdutosPreco]);
           end;
         end;

       end;

       for IndexCaracteristicasPrecoPromocaoAlteradas := 0 to CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao].Count -1 do
       begin
         GuardarRegistroAtual(qryManutencaoPreco, true);
         if qrymanutencaopreco.locate('caracteristica;preco;promocao',
                        VarArrayOf([CaracteristicasPrecoPromocaoAlteradas[caracteristica_pro].strings[IndexCaracteristicasPrecoPromocaoAlteradas],
                                    CaracteristicasPrecoPromocaoAlteradas[preco_pro].strings[IndexCaracteristicasPrecoPromocaoAlteradas],
                                    CaracteristicasPrecoPromocaoAlteradas[promocao_pro].strings[IndexCaracteristicasPrecoPromocaoAlteradas]]), [] ) then
         begin
           VoltarRegistroAtual(qryManutencaoPreco);

           ReFazConsultapornome(qryPrecosPromocoes,['caracteristica', 'preco'],
               [CaracteristicasPrecoPromocaoAlteradas[caracteristica_pro].strings[IndexCaracteristicasPrecoPromocaoAlteradas],
                CaracteristicasPrecoPromocaoAlteradas[preco_pro].strings[IndexCaracteristicasPrecoPromocaoAlteradas] ]);

           if qryPrecosPromocoespromocao.asString <> CaracteristicasPrecoPromocaoAlteradas[promocao_pro ].strings[IndexCaracteristicasPrecoPromocaoAlteradas] then
           begin
             qryPrecosPromocoes.edit;
             qryPrecosPromocoespromocao.asString := CaracteristicasPrecoPromocaoAlteradas[promocao_pro ].strings[IndexCaracteristicasPrecoPromocaoAlteradas];
             qryPrecosPromocoes.post;
             perpetrar([qryPrecosPromocoes]);
           end;
         end
         else
           VoltarRegistroAtual(qryManutencaoPreco);
       end;

       LimparProdutosAlterados;
       FEditando:= False;

      end
      else
       MensagemAviso(ctUSUARIOSEMPERMISSAO);
    end;
  finally
    Usuario.Free;
    qrymanutencaopreco.GotoBookmark(RegistroAtual);
    qryManutencaoPreco.FreeBookmark(RegistroAtual);
    qryManutencaoPreco.enableControls;

    editando := false;

  end;
end;

procedure TdtmManutencaoPreco.LimparProdutosAlterados;
begin
  PrecosCaracteristicasAlterados[caract_preco_col].Clear;
  PrecosCaracteristicasAlterados[Caracteristica].Clear;
  PrecosCaracteristicasAlterados[preco].Clear;
  PrecosCaracteristicasAlterados[coluna].Clear;
  PrecosCaracteristicasAlterados[valor].Clear;
  PrecosCaracteristicasAlterados[validade].Clear;

  CaracteristicasAlteradas[CaracteristicaM].Clear;
  CaracteristicasAlteradas[markup].Clear;
  CaracteristicasAlteradas[grupo].clear;
  CaracteristicasAlteradas[classe].clear;
  CaracteristicasAlteradas[marca].clear;

  DescontosProdutosCargosAlterados[produto_cargo_pc].Clear;
  DescontosProdutosCargosAlterados[produto_pc].Clear;
  DescontosProdutosCargosAlterados[cargo_pc].Clear;
  DescontosProdutosCargosAlterados[desconto_pc].Clear;

  ProdutosAlterados[produto].Clear;
  ProdutosAlterados[precoproduto].Clear;

  CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao].clear;
  CaracteristicasPrecoPromocaoAlteradas[caracteristica_pro].clear;
  CaracteristicasPrecoPromocaoAlteradas[preco_pro].clear;
  CaracteristicasPrecoPromocaoAlteradas[promocao_pro].clear;

  AtribuirDados(qryManutencaoPreco, [qryManutencaoPreco.fieldbyname('alterado')], [false], true);

end;

procedure TdtmManutencaoPreco.SetDataFinal(const Value: String);
begin
  FDataFinal := Value;
end;

procedure TdtmManutencaoPreco.SetDataInicial(const Value: String);
begin
  FDataInicial := Value;
end;

procedure TdtmManutencaoPreco.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
 FileName: String;
begin
  inherited;
  Listar := tStringlist.create;
  FileName := 'c:\lixo\manutencaoprecos.sql';
  if fileexists(FileName) then
    Listar.loadfromfile(FileName);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(FileName);
  listar.free;
end;

function TdtmManutencaoPreco.MontaCondicaoMovimentacao: String;
var SQLMovimentacao, SQLFiltroMovimento: String;
begin
  SQLMovimentacao:= 'and (p.codigo in (Select m.produto from movimentos m where ';
  SQLFiltroMovimento:= '';
  if not qryProcuraFilialMovimentos.IsEmpty then
    SQLFiltroMovimento:= SQLFiltroMovimento + 'and m.filial = '+ qryProcuraFilialMovimentoscodigo.AsString+' ';
  if not qryProcuraTipoMovimentos.IsEmpty then
    SQLFiltroMovimento:= SQLFiltroMovimento + 'and m.tipomovimento = '+QuotedStr(qryProcuraTipoMovimentoscodigo.AsString)+' ';
  if not DataEmBranco(DataMovtoInicial) and (DataEmBranco(DataMovtoFinal)) then
    SQLFiltroMovimento:= SQLFiltroMovimento + 'and m.data >= '+quotedstr(DataMovtoInicial)+' '
  else if DataEmBranco(DataMovtoInicial) and not (DataEmBranco(DataMovtoFinal)) then
    SQLFiltroMovimento:= SQLFiltroMovimento + 'and m.data <= '+quotedstr(DataMovtoFinal)+' '
  else if not (DataEmBranco(DataMovtoInicial)) and not (DataEmBranco(DataMovtoFinal)) then
    SQLFiltroMovimento:= SQLFiltroMovimento + 'and m.data between '+quotedstr(DataMovtoInicial)+' and '+quotedstr(DataMovtoFinal);

  if SQLFiltroMovimento <> '' then
  begin
    Delete(SQLFiltroMovimento,1,4);
    SQLMovimentacao:= SQLMovimentacao + SQLFiltroMovimento + '))';
    Result:= SQLMovimentacao;
  end
  else
    Result:= '';
end;

procedure TdtmManutencaoPreco.qryProcuraSerieNFEntradaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraNFEntrada.ParamByName('Serie').Value  := qryProcuraSerieNFEntradaserie.AsString;
  qryConsultaNfEntrada.ParamByName('Serie').Value := qryProcuraSerieNFEntradaserie.AsString;
end;

procedure TdtmManutencaoPreco.qryProcuraFornecedorNFEntradaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraSerieNFEntrada.ParamByName('fornecedor').Value:= qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsInteger;
  qryProcuraSerieNFEntrada.ParamByName('tipo').asString := qryProcuraFornecedorNFEntrada.fieldbyname('tipo').AsString;
  qryProcuraSerieNFEntrada.ParamByName('FilialBase').Value:= FilialBase;

  qryConsultaSerieNfEntrada.ParamByName('fornecedor').Value:= qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsInteger;
  qryConsultaSerieNfEntrada.ParamByName('tipo').asString := qryProcuraFornecedorNFEntrada.fieldbyname('tipo').AsString;
  qryConsultaSerieNfEntrada.ParamByName('FilialBase').Value:= FilialBase;

  qryProcuraNFEntrada.ParamByName('fornecedor').Value:= qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsInteger;
  qryProcuraNFEntrada.ParamByName('tipofornecedor').asString := qryProcuraFornecedorNFEntrada.fieldbyname('tipo').AsString;

  qryConsultaNfEntrada.ParamByName('fornecedor').Value:= qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsInteger;
  qryConsultaNfEntrada.ParamByName('tipofornecedor').asString := qryProcuraFornecedorNFEntrada.fieldbyname('tipo').AsString;
end;

function TdtmManutencaoPreco.ExisteFilialFornec(campo,
  codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliaisMovimentos, campo, codigo);
end;

function TdtmManutencaoPreco.ExisteNota(campo, codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaNfEntrada, campo, codigo);
end;

function TdtmManutencaoPreco.ExisteSerieNota(campo,
  codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaSerieNfEntrada, campo, codigo);
end;

function TdtmManutencaoPreco.ExisteTipoMovto(campo,
  codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaTipoMovimentos, campo, codigo);
end;

procedure TdtmManutencaoPreco.SetDataMovtoInicial(const Value: String);
begin
  FDataMovtoInicial := Value;
end;

procedure TdtmManutencaoPreco.SetDataMovtoFinal(const Value: String);
begin
  FDataMovtoFinal := Value;
end;

function TdtmManutencaoPreco.MontaCondicaoNotaEntrada: String;
var SQLNotasEntrada, SQLFiltrosNotas: String;
begin
  SQLNotasEntrada:= ' and (p.codigo in (Select pn.produto from produtosnotaspag pn join notaspag np on pn.codigonota = np.codigo where  ';
  SQLFiltrosNotas:= '';

  if not DataEmBranco(DataNotaInicial) and (DataEmBranco(DataNotaFinal)) then
      SQLFiltrosNotas:= SQLFiltrosNotas + 'and np.data >= '+quotedstr(DataNotaInicial)+' '
    else if DataEmBranco(DataNotaInicial) and not (DataEmBranco(DataNotaFinal)) then
      SQLFiltrosNotas:= SQLFiltrosNotas + 'and np.data <= '+quotedstr(DataNotaFinal)+' '
    else if not (DataEmBranco(DataNotaInicial)) and not (DataEmBranco(DataNotaFinal)) then
      SQLFiltrosNotas:= SQLFiltrosNotas + 'and np.data between '+quotedstr(DataNotaInicial)+' and '+quotedstr(DataNotaFinal);

  if not qryProcuraFornecedorNFEntrada.IsEmpty then
    SQLFiltrosNotas:= SQLFiltrosNotas + 'and np.fornecedor = '+qryProcuraFornecedorNFEntrada.fieldbyname('codigo').AsString+' ';

  if not qryProcuraSerieNFEntrada.IsEmpty then
    SQLFiltrosNotas:= SQLFiltrosNotas + 'and np.serie = '+QuotedStr(qryProcuraSerieNFEntradaserie.AsString)+' ';
  if not qryProcuraNFEntrada.IsEmpty then
    SQLFiltrosNotas:= SQLFiltrosNotas + 'and np.numero = '+qryProcuraNFEntradanumero.AsString;


  if SQLFiltrosNotas <> '' then
  begin
    Delete(SQLFiltrosNotas,1,4);
    SQLNotasEntrada:= SQLNotasEntrada + SQLFiltrosNotas + '))';
    Result:= SQLNotasEntrada;
  end
  else
    result:= '';
end;

procedure TdtmManutencaoPreco.SetDataNotaFinal(const Value: String);
begin
  FDataNotaFinal := Value;
end;

procedure TdtmManutencaoPreco.SetDataNotaInicial(const Value: String);
begin
  FDataNotaInicial := Value;
end;

procedure TdtmManutencaoPreco.AlterarValoresPrecosMarkup(AlterarPrecoNormal: boolean);
var
 i: integer;
 vDataValidade, vCampo: String;
begin

  if AlterarPrecoNormal then
  begin
//    if qryManutencaoPreco.fieldbyname('ultimacompra').ascurrency <> 0 then
      refazconsultapornome(qrymanutencao_preco, ['produto','filial', 'markup','valorultimacompra'],
                                                [qryManutencaoPreco.fieldbyname('produto').asString,
                                                 filialbase,
                                                 qryManutencaoPreco.fieldbyname('markup').ascurrency,
                                                 qryManutencaoPreco.fieldbyname('ultimacompra').ascurrency]);
{    else
      refazconsultapornome(qrymanutencao_preco, ['produto','filial', 'markup','valorultimacompra'],
                                                [qryManutencaoPreco.fieldbyname('produto').asString,
                                                 filialbase,
                                                 qryManutencaoPreco.fieldbyname('markup').ascurrency,
                                                 qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency]);}


    //VER C/ JOAO

    if (qryManutencao_precoprecovenda.AsCurrency<>0) and (qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> qryManutencao_precoprecovenda.AsCurrency) then
    begin
      qryManutencaoPreco.edit;
      qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency := qryManutencao_precoprecovenda.AsCurrency;
      qryManutencaoPreco.FieldByName('precovendaantesimpostos').AsCurrency := qryManutencao_precoprecovendaantesimpostos.AsCurrency;

      if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)) * 100
      else
        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := 0;

      qryManutencaoPreco.FieldByName('alterado').AsBoolean := true;

      dsrManutencaoPrecoDataChange(self,qryManutencaoPreco.FieldByName('valor_l'+PNormal));

      if qryManutencaoPreco.state = dsedit then
        qryManutencaoPreco.post;
    end;

  end;

  if AlterarMarkupInverso then
  begin
      refazconsultapornome(qrymanutencao_preco, ['produto','filial', 'markup','valorultimacompra','precovenda'],
                                                [qryManutencaoPreco.fieldbyname('produto').asString,
                                                 filialbase,
                                                 qryManutencaoPreco.fieldbyname('markup').ascurrency,
                                                 qryManutencaoPreco.fieldbyname('ultimacompra').ascurrency,
                                                 qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency]);

    if (qryManutencao_precomarkup_inverso.AsCurrency<>0) and (qryManutencaoPreco.FieldByName('markupinverso').AsCurrency <> qryManutencao_precomarkup_inverso.AsCurrency) then
    begin
      qryManutencaoPreco.edit;
      qryManutencaoPreco.FieldByName('markupinverso').AsCurrency := qryManutencao_precomarkup_inverso.AsCurrency;

      qryManutencaoPreco.FieldByName('alterado').AsBoolean := true;
      if qryManutencaoPreco.state = dsedit then
        qryManutencaoPreco.post;
    end;

  end;

  if roundtod(qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency, 2) <>
     roundtod(((1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)) * 100), 2) then
  begin
      qryManutencaoPreco.edit;

      if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)) * 100
      else
        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := 0;

      if qryManutencaoPreco.state = dsedit then
        qryManutencaoPreco.post;
  end;

  for i := qryManutencaoPreco.FieldCount-1 downto vLimiteCampoAlteravel+1 do
    if copy(qryManutencaoPreco.fields[i].FieldName,1,6) = 'cargo_' then
    begin
       vDataValidade := FormatDateTime('yyyy-MM-dd', DataServidor-1);
       if (PPromocao<>'0') then
       begin
         if (qryManutencaoPreco.FieldByName('validade_l'+PPromocao).asString <> '') then
           vDataValidade := FormatDateTime('yyyy-MM-dd', qryManutencaoPreco.FieldByName('validade_l'+PPromocao).asDatetime);

         refazconsultapornome(qrymanutencao_precocargo, ['produto','cargo','ValorPrecoNormal','ValorPrecoPromocao','DataValidadePromocao', 'MarkupCargo' ],
                                                      [qryManutencaoPreco.fieldbyname('produto').asString,
                                                       strtoint(somentenumero(qryManutencaoPreco.fields[i].FieldName)),
                                                       qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency,
                                                       qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency,
                                                       vDataValidade,
                                                       qryManutencaoPreco.fields[i+2].ascurrency]);
       end
       else
         refazconsultapornome(qrymanutencao_precocargo, ['produto','cargo','ValorPrecoNormal','ValorPrecoPromocao','DataValidadePromocao', 'MarkupCargo' ],
                                                      [qryManutencaoPreco.fieldbyname('produto').asString,
                                                       strtoint(somentenumero(qryManutencaoPreco.fields[i].FieldName)),
                                                       qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency,
                                                       0,
                                                       vDataValidade,
                                                       qryManutencaoPreco.fields[i+2].ascurrency]);
       if qryManutencaoPreco.Fields[i].AsCurrency <> qryManutencao_precocargovalor.AsCurrency then
       begin
         qryManutencaoPreco.edit;
         qryManutencaoPreco.Fields[i].AsCurrency := qryManutencao_precocargovalor.AsCurrency;
         vCampo := trocar(qryManutencaoPreco.Fields[i].fieldname, 'cargo_', 'margem_pc');
         if qryManutencaoPreco.Fields[i].AsCurrency <> 0 then
           qryManutencaoPreco.FieldByName(vCampo).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.Fields[i].AsCurrency)) * 100
         else
           qryManutencaoPreco.FieldByName(vCampo).AsCurrency := 0;
         qryManutencaoPreco.FieldByName('alterado').AsBoolean := true;
         if qryManutencaoPreco.state = dsedit then
           qryManutencaoPreco.post;
       end;
    end;
end;

procedure TdtmManutencaoPreco.AtualizarMarkups(calcularValoresPrecosMarkup: boolean);
var
 RegistroAtual : TBookMark;
begin
 RegistroAtual := qryManutencaoPreco.GetBookmark;
 qryManutencaoPreco.DisableControls;
 qryManutencaoPreco.First;
 While not qryManutencaoPreco.Eof do
 begin

   if (qryManutencaoPreco.fieldByName('caracteristica').asstring =  CaracteristicasAlteradas[caracteristicam].strings[indexM]) then
     { (qryManutencaoPreco.FieldByName('markup').AsString <> CaracteristicasAlteradas[markup].strings[indexM]) then}
   begin
     AtualizandoPrecos := True;
     qryManutencaoPreco.Edit;
     qrymanutencaopreco.FieldByName('markup').AsString := CaracteristicasAlteradas[markup].strings[indexM];
     qryManutencaoPreco.post;

     AtualizandoPrecos := False;
     if calcularValoresPrecosMarkup then
       AlterarValoresPrecosMarkup(true);   {ver com joao não possui valor de compra e da zero}

   end;

   qryManutencaoPreco.Next;
 end;
 qrymanutencaopreco.GotoBookmark(RegistroAtual);
 qryManutencaoPreco.FreeBookmark(RegistroAtual);
 qryManutencaoPreco.enableControls;
end;

procedure TdtmManutencaoPreco.MarcarRegistrosManutencaoPrecosAtualizar(
  Marcando, Todos: boolean);
begin
  if todos then
    MarcarRegistros(qryManutencaoPreco, TBooleanField(qryManutencaoPreco.fieldByName('alterar')), Marcando, true)
  else
    MarcarRegistros(qryManutencaoPreco, TBooleanField(qryManutencaoPreco.fieldByName('alterar')), not qryManutencaoPreco.fieldByName('alterar').asboolean, false);
end;

procedure TdtmManutencaoPreco.setColunaPromocao(const Value: integer);
var
  RegistroAtual : TBookMark;
  i: integer;
begin
  if value <> fColunaPromocao then
  begin
    fColunaPromocao := Value;
    if ColunaPromocao > 0 then
    begin
      qrycoluna.first;
      for I:= 1 to qryColuna.RecordCount do
      begin
        if ColunaPromocao = I then
        begin
          PPromocao := qryColunacodigo.AsString;
          break;
        end;
        qryColuna.Next;
      end;
    end
    else
     PPromocao := '0';


    AtualizandoPrecos := True;
    RegistroAtual := qryManutencaoPreco.GetBookmark;
    qryManutencaoPreco.DisableControls;

    try
      qryManutencaoPreco.First;
      while not qryManutencaoPreco.eof do
      begin
        AlterarValoresPrecosMarkup(false);
        qryManutencaoPreco.next;
      end;
    finally
      AtualizandoPrecos := false;
      qryManutencaoPreco.GotoBookmark(registroatual);
      qryManutencaoPreco.FreeBookmark(registroatual);
      qryManutencaoPreco.enableControls;
    end;

  end;
end;

procedure TdtmManutencaoPreco.qryManutencaoPrecoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnScrollLinhaColunaGrade) then
    OnScrollLinhaColunaGrade(qryManutencaoPreco);

end;

function TdtmManutencaoPreco.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryManutencaoPreco.fieldbyname('coluna').AsString)
end;

function TdtmManutencaoPreco.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryManutencaoPreco.fieldbyname('linha').AsString)
end;

function TdtmManutencaoPreco.GetCampoDataValidadeDestino: String;
begin
  result := '';
  if CampoColunaDestino <> '' then
    result :=  qryManutencaoPreco.fields[qryManutencaoPreco.fieldbyname(CampoColunaDestino).index+2].fieldname;
end;

function TdtmManutencaoPreco.GetCampoDataValidadeOrigem: String;
 var
  vIndex : integer;
begin
  result := '';
  if CampoColunaOrigem <> '' then
  begin
    vIndex := qryManutencaoPreco.fieldbyname(CampoColunaOrigem).index;
    result := qryManutencaoPreco.fields[vindex+2].FieldName;
  end;  
end;

function TdtmManutencaoPreco.GetCampoMargemDestino: String;
begin
  result := '';
  if CampoColunaDestino <> '' then
    result :=  qryManutencaoPreco.fields[qryManutencaoPreco.fieldbyname(CampoColunaDestino).index+1].fieldname;
end;

function TdtmManutencaoPreco.GetCampoMargemOrigem: String;
begin
  result := '';
  if CampoColunaOrigem <> '' then
    result :=  qryManutencaoPreco.fields[qryManutencaoPreco.fieldbyname(CampoColunaOrigem).index+1].fieldname;
end;

function TdtmManutencaoPreco.getCampoDataValidadeExcluir: String;
begin
  result := '';
  if CampoColunaExcluir <> '' then
    result :=  qryManutencaoPreco.fields[qryManutencaoPreco.fieldbyname(CampoColunaExcluir).index+2].fieldname;
end;

function TdtmManutencaoPreco.GetCampoMargemExcluir: String;
begin
  result := '';
  if CampoColunaExcluir <> '' then
    result :=  qryManutencaoPreco.fields[qryManutencaoPreco.fieldbyname(CampoColunaExcluir).index+1].fieldname;
end;

procedure TdtmManutencaoPreco.qryPrecosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryPrecos.ParamByName('caracteristica').AsString := qryManutencaoPreco.FieldByName('caracteristica').asString;
end;

procedure TdtmManutencaoPreco.qryPrecosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryPrecoscadastrado.asBoolean := False;
  qryPrecoscaracteristica.asString := qryManutencaoPreco.FieldByName('caracteristica').asString;
  qryPrecosavariado.asBoolean := false;

  RefazConsulta(spcPrecoProximo,[0],[qryManutencaoPreco.FieldByName('caracteristica').asString]);
  qryPrecoscodigo.AsInteger := spcPrecoProximo.FieldByName('codigo').AsInteger;
  spcPrecoProximo.Close;
end;

procedure TdtmManutencaoPreco.qryPrecosAfterScroll(DataSet: TDataSet);
begin
  inherited;
//  qryPrecos.fields.ReadOnly := qryPrecoscadastrado.asboolean;
end;

function TdtmManutencaoPreco.GravarPrecos: boolean;
begin
  result := perpetrar([qryPrecos]);
end;

procedure TdtmManutencaoPreco.AtualizarCampoPrecoTabelaPreco;
var
  i: integer;
  vMarkup : Currency;
  vGrupo, vClasse, vMarca, vPromocao : String;

begin
  if qryManutencaoPreco.fieldbyname('preco').asinteger <> qryPrecoscodigo.asinteger then
  begin
    {
    qryManutencaoPreco.edit;
    qryManutencaoPreco.fieldbyname('preco').asinteger := qryPrecoscodigo.asinteger;
    qryManutencaoPreco.fieldbyname('descpreco').asString := qryPrecosdescricao.asString;

    if qryManutencaoPreco.state in [dsedit] then
      qryManutencaoPreco.post;
    }

    MontarSQLManutencaoPreco('', '', '', '', '', qryManutencaoPreco.FieldbyName('produto').asString);

    if qryManutencaoPrecoAux.recordcount = 1 then
    begin
      dsrManutencaoPreco.onDataChange := nil;
      vMarkup := qryManutencaoPreco.FieldByName('markup').asCurrency;
      vGrupo := qryManutencaoPreco.FieldByName('grupo').asString;
      vClasse := qryManutencaoPreco.FieldByName('classe').asString;
      vMarca := qryManutencaoPreco.FieldByName('marca').asString;
      vPromocao := qryManutencaoPreco.FieldByName('promocao').asString;

      copiarRegistros(qryManutencaoPrecoAux, qryManutencaoPreco, false, false, false, true, true);

      if (vGrupo  <> qryManutencaoPreco.FieldByName('grupo').asString) or
         (vClasse <> qryManutencaoPreco.FieldByName('classe').asString) or
         (vMarca  <> qryManutencaoPreco.FieldByName('marca').asString) then
      begin
        qryManutencaoPreco.edit;
        qryManutencaoPreco.FieldByName('grupo').asString := vGrupo;
        qryManutencaoPreco.FieldByName('classe').asString := vClasse;
        qryManutencaoPreco.FieldByName('marca').asString := vMarca;
        if (qryManutencaoPreco.state in [dsedit, dsinsert]) then
          qryManutencaoPreco.post;
      end;


      dsrManutencaoPreco.onDataChange := dsrManutencaoPrecoDataChange;
      dsrManutencaoPrecoDataChange(self,qryManutencaoPreco.Fieldbyname('preco'));

      if qryManutencaoPrecoaux.FieldByName('markup').asCurrency <> vMarkup then
      begin
        qryManutencaoPreco.edit;
        qryManutencaoPreco.FieldByName('markup').asCurrency := vMarkup;

        if (qryManutencaoPreco.state in [dsedit, dsinsert]) then
          qryManutencaoPreco.post;
      end;

      IndexCaracteristicasPrecoPromocaoAlteradas := CaracteristicasPrecoPromocaoAlteradas[caract_preco_promocao].IndexOf(
          qryManutencaoPreco.fieldByName('caracteristica').asstring + '-' +
          qryManutencaoPreco.fieldByName('preco').asstring);

      if IndexCaracteristicasPrecoPromocaoAlteradas <> -1 then
      begin

        if (CaracteristicasPrecoPromocaoAlteradas[promocao_pro].Strings[IndexCaracteristicasPrecoPromocaoAlteradas] <>
           qryManutencaoPreco.FieldByName('promocao').AsString) then
        begin
          GuardarRegistroAtual(qryManutencaoPreco, true);
          vFiltroCaracteristica := qryManutencaoPreco.fieldByName('caracteristica').asstring;
          vFiltroPreco := qryManutencaoPreco.fieldByName('preco').asstring;
          vFiltroProduto := qryManutencaoPreco.fieldByName('produto').asstring;
          qryManutencaoPreco.Filtered := true;

          if qryManutencaoPreco.RecordCount <> 0 then
          begin
            qryManutencaoPreco.filtered := false;
            VoltarRegistroAtual(qryManutencaoPreco);

            qryManutencaoPreco.edit;
            qryManutencaoPreco.FieldByName('promocao').AsString := CaracteristicasPrecoPromocaoAlteradas[promocao_pro].Strings[IndexCaracteristicasPrecoPromocaoAlteradas];

            if qryManutencaoPreco.state = dsedit then
              qryManutencaoPreco.post;

          end
          else
          begin
            qryManutencaoPreco.filtered := false;
            VoltarRegistroAtual(qryManutencaoPreco);
          end;

        end;

      end;
    end;

  end;


end;

procedure TdtmManutencaoPreco.AtribuirDadosGrupoProdutos(codigo,
  descricao: String);
var
 vCaracteristica, vDescricao : String;

begin
  vDescricao := qryManutencaoPreco.fieldByName('descricaogrupo').asString;

  Atribuirdados(qryManutencaoPreco,
                [qryManutencaoPreco.fieldByName('grupo'),
                 qryManutencaoPreco.fieldByName('descricaogrupo'),
                 qryManutencaoPreco.fieldbyname('alterado')],
                [codigo, descricao, true],
                [qryManutencaoPreco.fieldByName('descricaogrupo'),
                 qryManutencaoPreco.fieldByName('caracteristica')],
                [vDescricao, qryManutencaoPreco.fieldByName('caracteristica').asString],
                ['=', '='], true, false);


end;

procedure TdtmManutencaoPreco.AtribuirDadosClasseProdutos(codigo,
  descricao: String);
var
 vDescricao : String;
begin
  vDescricao := qryManutencaoPreco.fieldByName('descricaoclasse').asString;

  Atribuirdados(qryManutencaoPreco,
                [qryManutencaoPreco.fieldByName('classe'),
                 qryManutencaoPreco.fieldByName('descricaoclasse'),
                 qryManutencaoPreco.fieldbyname('alterado')],
                [codigo, descricao, true],
                [qryManutencaoPreco.fieldByName('descricaoclasse'),
                 qryManutencaoPreco.fieldByName('caracteristica')],
                [vDescricao, qryManutencaoPreco.fieldByName('caracteristica').asString],
                ['=','='], true, false);
end;

procedure TdtmManutencaoPreco.AtribuirDadosMarcaProdutos(codigo,
  descricao: String);
var
 vDescricao : String;
begin
  vDescricao := qryManutencaoPreco.fieldByName('descricaomarca').asString;

  Atribuirdados(qryManutencaoPreco,
                [qryManutencaoPreco.fieldByName('marca'),
                 qryManutencaoPreco.fieldByName('descricaomarca'),
                 qryManutencaoPreco.fieldbyname('alterado')],
                [codigo, descricao, true],
                [qryManutencaoPreco.fieldByName('descricaomarca'),
                 qryManutencaoPreco.fieldByName('caracteristica')],
                [vDescricao, qryManutencaoPreco.fieldByName('caracteristica').asString],
                ['=','='], true, false);
end;

procedure TdtmManutencaoPreco.AtualizarDescontoCargos(Campodesconto_pc : String);
var
  vCaracteristica, vPreco, vCampoCargo, vCampoMargem : String;
  vValorDescontoCargo : String;
  vRegistroAtual : TBookMark;
begin
  vCaracteristica := qryManutencaoPreco.fieldByName('caracteristica').asString;
  vPreco          := qryManutencaoPreco.fieldByName('preco').asString;
  vValorDescontoCargo :=  qryManutencaoPreco.fieldByName(Campodesconto_pc).asString;

  Cargo := copy(Campodesconto_pc,12,length(Campodesconto_pc)-11);

  vCampoCargo := trocar(Campodesconto_pc, 'desconto_pc', 'cargo_');
  vCampoMargem := trocar(Campodesconto_pc, 'desconto_pc', 'margem_pc');

  vRegistroAtual := qryManutencaoPreco.getBookMark;

  qryManutencaoPreco.disableControls;
  qryManutencaoPreco.first;

  while not qryManutencaoPreco.eof do
  begin

    if (vCaracteristica = qryManutencaoPreco.fieldByName('caracteristica').asString) and
       (vPreco          = qryManutencaoPreco.fieldByName('preco').asString) then
    begin

      indexPC := DescontosProdutosCargosAlterados[produto_cargo_pc].IndexOf(
                qryManutencaoPreco.fieldByName('produto').asstring + '-' + Cargo);

      if indexPC = -1 then
      begin
        DescontosProdutosCargosAlterados[produto_cargo_pc].Add(
            qryManutencaoPreco.fieldByName('produto').asstring + '-' +
            Cargo);

        DescontosProdutosCargosAlterados[produto_pc].Add(qryManutencaoPreco.fieldByName('produto').asstring);
        DescontosProdutosCargosAlterados[cargo_pc].Add(cargo);

        if (vValorDescontoCargo = '') then
          DescontosProdutosCargosAlterados[desconto_pc].Add('0')
        else
          DescontosProdutosCargosAlterados[desconto_pc].Add(vValorDescontoCargo);

        indexPC := DescontosProdutosCargosAlterados[produto_cargo_pc].IndexOf(
            qryManutencaoPreco.fieldByName('produto').asstring + '-' + Cargo);

      end
      else
      begin
        if (DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC] <> vValorDescontoCargo) then
        begin

          if (vValorDescontoCargo='') then
            DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC] := '0'
          else
            DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC] := vValorDescontoCargo;

        end;
      end;

      qryManutencaoPreco.edit;

      qryManutencaoPreco.fieldByName(Campodesconto_pc).asString := vValorDescontoCargo;

      if ColunaPromocao = 0 then
        qryManutencaoPreco.fieldByName(vCampoCargo).asCurrency := estoques_preco(qryManutencaoPreco.fieldByName('produto').asString,
                                          filialbase, strToCurr(DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC]),
                                          qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency, 0)
      else
        qryManutencaoPreco.fieldByName(vCampoCargo).asCurrency := estoques_preco(qryManutencaoPreco.fieldByName('produto').asString,
                                          filialbase, strToCurr(DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC]),
                                          qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency,
                                          qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency);

      qryManutencaoPreco.FieldByName(vCampoMargem).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.fieldByName(vCampoCargo).asCurrency)) * 100;
      qryManutencaoPreco.FieldByName('alterado').AsBoolean := true;
      qryManutencaoPreco.post;

    end;

    qryManutencaoPreco.next;

  end;

  qryManutencaoPreco.enableControls;

  qryManutencaoPreco.gotoBookMark(vRegistroAtual);
  qryManutencaoPreco.freeBookMark(vRegistroAtual);

end;

procedure TdtmManutencaoPreco.AtualizarPrecoCargos(CampoPrecoCargo_pc: String);
var
  {vCaracteristica, vPreco,} vCampoDesconto {, vCampoMargem} : String;
  vPercentualDescontoCargo : Currency;
  vValorPrecoCargo : Currency;
  {vRegistroAtual : TBookMark;}
begin
  {
  vCaracteristica  := qryManutencaoPreco.fieldByName('caracteristica').asString;
  vPreco           := qryManutencaoPreco.fieldByName('preco').asString;
  }
  vValorPrecoCargo := qryManutencaoPreco.fieldByName(CampoPrecoCargo_pc).asCurrency;

  {Cargo := copy(Campopreco_pc,7,length(Campopreco_pc)-6);}

  vCampoDesconto := trocar(CampoPrecoCargo_pc, 'cargo_', 'desconto_pc');
  {vCampoMargem := trocar(CampoPrecoCargo_pcc, 'cargo_', 'margem_pc');}

  vPercentualDescontoCargo := 0;
  if ColunaPromocao = 0  then
  begin
    if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
      vPercentualDescontoCargo :=  100 - ((vValorPrecoCargo*100)/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)
  end
  else
  begin
    if qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency <> 0 then
      vPercentualDescontoCargo :=  100 - ((vValorPrecoCargo*100)/qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency)
    else
    if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
      vPercentualDescontoCargo :=  100 - ((vValorPrecoCargo*100)/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency);
  end;

  qryManutencaoPreco.fieldByName(vCampoDesconto).asCurrency := vPercentualDescontoCargo;


  {
  vRegistroAtual := qryManutencaoPreco.getBookMark;

  qryManutencaoPreco.disableControls;
  qryManutencaoPreco.first;

  while not qryManutencaoPreco.eof do
  begin
    if (vCaracteristica = qryManutencaoPreco.fieldByName('caracteristica').asString) and
       (vPreco          = qryManutencaoPreco.fieldByName('preco').asString) then
    begin


      indexPC := DescontosProdutosCargosAlterados[produto_cargo_pc].IndexOf(
                qryManutencaoPreco.fieldByName('produto').asstring + '-' + Cargo);

      if indexPC = -1 then
      begin
        DescontosProdutosCargosAlterados[produto_cargo_pc].Add(
            qryManutencaoPreco.fieldByName('produto').asstring + '-' +
            Cargo);

        DescontosProdutosCargosAlterados[produto_pc].Add(qryManutencaoPreco.fieldByName('produto').asstring);
        DescontosProdutosCargosAlterados[cargo_pc].Add(cargo);


        if (vValorPrecoCargo = '') then
          DescontosProdutosCargosAlterados[desconto_pc].Add('0')
        else
          DescontosProdutosCargosAlterados[desconto_pc].Add(vValorDescontoCargo);


        indexPC := DescontosProdutosCargosAlterados[produto_cargo_pc].IndexOf(
            qryManutencaoPreco.fieldByName('produto').asstring + '-' + Cargo);

      end
      else
      begin
        if (DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC] <> vValorDescontoCargo) then
        begin

          if (vValorDescontoCargo='') then
            DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC] := '0'
          else
            DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC] := vValorDescontoCargo;

        end;
      end;

      qryManutencaoPreco.edit;

      qryManutencaoPreco.fieldByName(Campodesconto_pc).asString := vValorDescontoCargo;

      if ColunaPromocao = 0 then
        qryManutencaoPreco.fieldByName(vCampoCargo).asCurrency := estoques_preco(qryManutencaoPreco.fieldByName('produto').asString,
                                          filialbase, strToCurr(DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC]),
                                          qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency, 0)
      else
        qryManutencaoPreco.fieldByName(vCampoCargo).asCurrency := estoques_preco(qryManutencaoPreco.fieldByName('produto').asString,
                                          filialbase, strToCurr(DescontosProdutosCargosAlterados[desconto_pc].Strings[indexPC]),
                                          qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency,
                                          qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency);

      qryManutencaoPreco.FieldByName(vCampoMargem).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.fieldByName(vCampoCargo).asCurrency)) * 100;
      qryManutencaoPreco.FieldByName('alterado').AsBoolean := true;
      qryManutencaoPreco.post;

    end;

    qryManutencaoPreco.next;

  end;

  qryManutencaoPreco.enableControls;

  qryManutencaoPreco.gotoBookMark(vRegistroAtual);
  qryManutencaoPreco.freeBookMark(vRegistroAtual);
  }

end;

procedure TdtmManutencaoPreco.AtribuirDadosPromocaoProdutos(codigo, descricao:variant);
{
var
 vDescricao : String;
 }
begin
  {vDescricao := qryManutencaoPreco.fieldByName('descricaopromocao').asString;}

  {
  qryManutencaoPreco.SortByField('produto');
  qryManutencaoPreco.SortClear;
  TZDataset(qryManutencaoPreco).SqlBuffer.ClearSort;
  }
//  TZPgSqlQuery(qryManutencaoPreco)

//  TZDataset(qryManutencaoPreco).SqlBuffer.SortFieldCount := 0;
//  TZDataset(qryManutencaoPreco).

  Atribuirdados(qryManutencaoPreco,

                [qryManutencaoPreco.fieldByName('promocao'),
                 qryManutencaoPreco.fieldByName('descricaopromocao'),
                 qryManutencaoPreco.fieldbyname('alterado')],

                [codigo, descricao, true],

                [{qryManutencaoPreco.fieldByName('descricaopromocao'),}
                 qryManutencaoPreco.fieldByName('caracteristica'),
                 qryManutencaoPreco.fieldByName('preco')],

                [{vDescricao,}
                 qryManutencaoPreco.fieldByName('caracteristica').asString,
                 qryManutencaoPreco.fieldByName('preco').AsInteger],
                ['=','='], true, false);
end;

procedure TdtmManutencaoPreco.limparPromocoes;
begin
  qryManutencaoPreco.edit;
  qryManutencaoPreco.fieldByName('descricaopromocao').clear;
  qryManutencaoPreco.fieldByName('promocao').clear;
end;


procedure TdtmManutencaoPreco.qryManutencaoPrecoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := qryManutencaoPreco.Filtered and
            (qryManutencaoPreco.fieldbyname('caracteristica').asString = vFiltroCaracteristica) and
            (qryManutencaoPreco.fieldbyname('preco').asString = vFiltroPreco) and
            (qryManutencaoPreco.fieldbyname('produto').asString <> vFiltroProduto);

end;

procedure TdtmManutencaoPreco.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
end;

procedure TdtmManutencaoPreco.ReadOnlyFieldsManutencao;
var
i: integer;
begin
  if qryManutencaoPreco.active then
  begin

    vLimiteCampoAlteravel := qryManutencaoPreco.fieldbyname('alterar').Index;

    qryManutencaoPreco.fieldByName('alterado').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('alterar').ReadOnly:= false;
    qryManutencaoPreco.fieldByName('caracteristica').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('produto').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('produtovisual').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('descproduto').ReadOnly:= True;
//    qryManutencaoPreco.fieldByName('visualdescricao').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('referencia').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('grupo').ReadOnly:= false;
    qryManutencaoPreco.fieldByName('descricaogrupo').ReadOnly:= true;

    qryManutencaoPreco.fieldByName('promocao').ReadOnly:= false;
    qryManutencaoPreco.fieldByName('descricaopromocao').ReadOnly:= true;

    qryManutencaoPreco.fieldByName('classe').ReadOnly:= false;
    qryManutencaoPreco.fieldByName('descricaoclasse').ReadOnly:= true;

    qryManutencaoPreco.fieldByName('valorgrade1').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('valorgrade2').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('linha').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('coluna').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('resultadocurvaabc').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('preco').ReadOnly:= true;
    qryManutencaoPreco.fieldByName('descpreco').ReadOnly:= true;
    qryManutencaoPreco.fieldByName('cst_produto').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('csosn_produto').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('estoquetotal').ReadOnly:= True;
    TFloatField(qryManutencaoPreco.fieldByName('estoquetotal')).displayformat := parsistema.mascaraquantidadegrade;

    qryManutencaoPreco.fieldByName('ultimacompra').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('dataultimacompra').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('customediogeral').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('precocomicms').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('precosemicms').ReadOnly:= True;
    qryManutencaoPreco.fieldByName('precovendaantesimpostos').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('marca').ReadOnly:= false;
    qryManutencaoPreco.fieldByName('descricaomarca').ReadOnly:= True;

    qryManutencaoPreco.fieldByName('markup').ReadOnly := false;
    qryManutencaoPreco.fieldByName('markupinverso').ReadOnly := true;

    qryManutencaoPreco.fieldByName('precovenda').ReadOnly := true;

    qryColuna.first;

    for I := 1 to qryColuna.RecordCount do
    begin
      qryManutencaoPreco.fieldByName('margem_l'+qryColunacodigo.AsString).ReadOnly:= True;
      qryColuna.next;
    end;

    // somente markup e as colunas de precos e validades é permitido alterar
    for i := qryManutencaoPreco.FieldCount-1 downto 0 do  // campos de cargos da tabela também readonly
      if {(copy(qryManutencaoPreco.fields[i].FieldName,1,6) = 'cargo_') or}
         (copy(qryManutencaoPreco.fields[i].FieldName,1,9) = 'margem_pc') then
        qryManutencaoPreco.fields[i].readonly := true
      else
      if vLimiteCampoAlteravel = qryManutencaoPreco.fields[i].index then
        break;
  end;
end;

procedure TdtmManutencaoPreco.cdsMarketplace_nnnnnCalcFields(DataSet: TDataSet);
{
var
 vDBAdvGrid: tDBAdvGrid;
 i: integer;
 }

begin
  inherited;
  {
  if dataset.active then
    if dataset.state = dsCalcFields then
    begin
      if not vCopiandoCampoCalculado then
        dsrMarketplace.onDataChange := nil;

      AtribuirValoresCamposCalculados(false);

      if not vCopiandoCampoCalculado then
        dsrMarketplace.onDataChange := dsrMarketplaceDataChange;

      if not vCopiandoCampoCalculado then
      begin
        try

        cdsMarketplace.onCalcFields := nil;

        vDBAdvGrid := TDBAdvGrid(self.owner.findcomponent('dbgMarketPlace'));
        for i:= vDBAdvGrid.ColumnByFieldName['descricaomarketplace'].Index  to vDBAdvGrid.colcount-1 do
        begin
          if cdsMarketplacealterado.asBoolean then
            vDBAdvGrid.CellProperties[i, cdsMarketplace.recno].FontStyle := [fsBold]
          else
            vDBAdvGrid.CellProperties[i, cdsMarketplace.recno].FontStyle := [];

          if vDBAdvGrid.Columns[i].FieldName = 'precovenda' then
            if cdsMarketplaceprecovenda.asCurrency <>
               cdsMarketplacepreconormal.asCurrency then
              vDBAdvGrid.CellProperties[i, cdsMarketplace.recno].BrushColor := clYellow;

          if (vDBAdvGrid.Columns[i].FieldName = 'markup') or
             (vDBAdvGrid.Columns[i].FieldName = 'preconormal') or
             (vDBAdvGrid.Columns[i].FieldName = 'desconto_cargo') or
             (vDBAdvGrid.Columns[i].FieldName = 'precovendacargo') or
             (vDBAdvGrid.Columns[i].FieldName = 'fatormarkproduto') or
             (vDBAdvGrid.Columns[i].FieldName = 'precovendacargo_m_p_f') then
            vDBAdvGrid.CellProperties[i, cdsMarketplace.recno].BrushColor := $00FFEAD5;

        end;
        finally
          cdsMarketplace.onCalcFields := cdsMarketplaceCalcFields;
        end;
      end;

    end;
  }  
end;

function TdtmManutencaoPreco.ValoredtPercentualDesconto: Variant;
var
  vValor : String;
begin
  result := null;

{  result := 0.00; }
  vValor := TEditNumero(self.owner.FindComponent('edtPercentualDesconto')).text;
  if vValor  <> '' then
  begin
    try
       result := strtofloat(vValor)
    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);
  
end;

function TdtmManutencaoPreco.ValorDescontoInformado: Variant;
begin
{
  result := null;
  if (cdsMarketplacePercentualDescontoInformado.asfloat  <> 0) and
     (cdsMarketplaceprecovendacomfrete.asFloat <> 0) then
  begin
    try
       result := cdsMarketplaceprecovendacomfrete.asFloat * cdsMarketplacePercentualDescontoInformado.asfloat / 100
    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

}

  result := null;
  if (cdsMarketplacePercentualDescontoInformado.asfloat  <> 0) and
     (cdsMarketplacenovo_preco_desejado.asFloat <> 0) then
  begin
    try
       result := cdsMarketplacenovo_preco_desejado.asFloat * cdsMarketplacePercentualDescontoInformado.asfloat / 100
    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);


end;

function TdtmManutencaoPreco.PrecoVendaComDesconto: Variant;
begin
  result := null;
  if {(cdsMarketplaceValorDescontoInformado.asfloat  <> 0) and}
     (cdsMarketplacenovo_preco_desejado.asFloat <> 0) then
  begin
    try
       result := cdsMarketplacenovo_preco_desejado.asFloat - cdsMarketplaceValorDescontoInformado.asfloat;
    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);
end;

function TdtmManutencaoPreco.ValoredtPercentualDevolucaoDesconto: Variant;
var
  vValor : String;
begin
  result := null;

  {result := 0.00;}
  vValor := TEditNumero(self.owner.FindComponent('edtPercentualDevolucaoDesconto')).text;
  if vValor  <> '' then
  begin
    try
       result := strtofloat(vValor)
    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;

function TdtmManutencaoPreco.ValorDevolucaoDescontoInformado: Variant;
begin
  result := null;
  if (cdsMarketplacePercentualDevDescontoInformado.asfloat  <> 0) and
     (cdsMarketplaceValorDescontoInformado.asFloat <> 0) then
  begin
    try
       result := cdsMarketplaceValorDescontoInformado.asFloat * cdsMarketplacePercentualDevDescontoInformado.asfloat / 100
    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);


end;

function TdtmManutencaoPreco.ValorComissaoDevDes: Variant;
begin
  result := null;

  if (cdsMarketplaceperccomissao_recalculado.asfloat  <> 0) and
     (cdsMarketplaceValorDevDescInformado.asFloat <> 0) and
     (cdsMarketplacedescricaomarketplace.asString<>'') then
  begin
    try
      result := comissao_manutencao_preco(cdsMarketplaceperccomissao_recalculado.asfloat,
                                 cdsMarketplaceValorDevDescInformado.asFloat,
                                 cdsMarketplacedescricaomarketplace.asString);

    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;

function TdtmManutencaoPreco.ComissPrecoVendaComDesc: Variant;
begin

  result := null;

  if (cdsMarketplaceperccomissao_recalculado.asfloat  <> 0) and
     (cdsMarketplacePrecoVendaComDesconto.asFloat <> 0) and
     (cdsMarketplacedescricaomarketplace.asString<>'') then
  begin
    try

      result := comissao_manutencao_preco(cdsMarketplaceperccomissao_recalculado.asfloat,
                                 cdsMarketplacePrecoVendaComDesconto.asFloat,
                                 cdsMarketplacedescricaomarketplace.asString);

    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);


end;

function TdtmManutencaoPreco.NovoValorImposto: Variant;
var
  vValor : Currency;

begin
  result := Null;

  if cdsMarketplaceregimetributario.asinteger = 1 then //Simples
  begin
    try
      vValor := cdsMarketplacePercentualICMSSimples.asCurrency;
      if vValor <> 0 then
        result := cdsMarketplacePrecoVendaComDesconto.asCurrency * vValor / 100
      else
        result := 0.00;
    except
      result := 0.00;
    end;

    if not ((cdsMarketplacecsosn.asstring = '101') or
            (cdsMarketplacecsosn.asstring = '102') or
            (cdsMarketplacecsosn.asstring = '900')) then
      result := result - ((result * 33.5)/100);


  end
  else
  begin
    if (cdsMarketplacecst.asstring = '00') or
       (cdsMarketplacecst.asstring = '20') then {no momento a redução não esta sendo atribuida}
    begin
      try
        vValor := cdsMarketplacePercentualICMSNormal.asCurrency;
        if vValor <> 0 then
        begin
          result := cdsMarketplacePrecoVendaComDesconto.asCurrency * vValor / 100;
        end
        else
          result := 0.00;
      except
        result := 0.00
      end;

    end
    else
      result := 0.00;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;

function TdtmManutencaoPreco.NovaMargem: Variant;
begin
 try
   result := RoundTo ((((cdsMarketplacePrecoVendaComDesconto.asCurrency +
              cdsMarketplaceValorDevDescInformado.asCurrency) -

             cdsMarketplaceComissPrecoVendaComDesc.asCurrency -
             cdsMarketplaceValorComissaoDevDes.asCurrency -
             cdsMarketplacecusto_frete.asCurrency -
             cdsMarketplacecusto_produto.asCurrency -
             Adicional_Custo_Produto -
             cdsMarketplaceNovoValorImposto.asCurrency) /

             cdsMarketplacePrecoVendaComDesconto.asCurrency) * 100, -2)
  except
    result := 0.00
  end;

end;

function TdtmManutencaoPreco.ValorImposto: Variant;
var
vValor : Currency;
begin

(*
  result := Null;

  if cdsMarketplaceregimetributario.asinteger = 1 then //Simples
  begin

    try
      vValor := TEditNumero(self.owner.FindComponent('edtPercentualSimples')).text;
      if vValor <> '' then
        result := cdsMarketplaceprecovendacomfrete.asCurrency * strtoFloat(vValor) / 100
      else
        result := 0.00;
    except
      result := 0.00;
    end;

    if not ((cdsMarketplacecsosn.asstring = '101') or
            (cdsMarketplacecsosn.asstring = '102') or
            (cdsMarketplacecsosn.asstring = '900')) then
      result := result - ((result * 33.5)/100);


  end
  else
  begin
    if (cdsMarketplacecst.asstring = '00') or
       (cdsMarketplacecst.asstring = '20') then {no momento a redução não esta sendo atribuida}
    begin
      try
        vValor := TEditNumero(self.owner.FindComponent('edtPercentualNormal')).text;
        if vValor <> '' then
          result := cdsMarketplaceprecovendacomfrete.asCurrency * strtoFloat(vValor) / 100
        else
          result := 0.00;
      except
        result := 0.00;
      end;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

*)

  result := Null;
  if cdsMarketplaceregimetributario.asinteger = 1 then //Simples
  begin

    try
      vValor := cdsMarketplacePercentualICMSSimples.asCurrency;
      if vValor <> 0 then
        result := cdsMarketplacenovo_preco_desejado.asCurrency * vValor / 100
      else
        result := 0.00;
    except
      result := 0.00;
    end;

    if not ((cdsMarketplacecsosn.asstring = '101') or
            (cdsMarketplacecsosn.asstring = '102') or
            (cdsMarketplacecsosn.asstring = '900')) then
      result := result - ((result * 33.5)/100);

  end
  else
  begin
    if (cdsMarketplacecst.asstring = '00') or
       (cdsMarketplacecst.asstring = '20') then {no momento a redução não esta sendo atribuida}
    begin
      try
        vValor := cdsMarketplacePercentualICMSNormal.asCurrency;
        if vValor <> 0 then
          result := cdsMarketplacenovo_preco_desejado.asCurrency * vValor / 100
        else
          result := 0.00;
      except
        result := 0.00;
      end;
    end
    else
      result := 0.00;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;

function TdtmManutencaoPreco.Margem: Variant;
begin

(*
  result := Null;
  if cdsMarketplaceprecovendacomfrete.asCurrency >0 then
  begin
    try
      result := roundto(((cdsMarketplaceprecovendacomfrete.asCurrency -
                  cdsMarketplacecomissao.asCurrency -
                  cdsMarketplacecusto_frete.asCurrency -
                  cdsMarketplacecusto_produto.asCurrency -
                  cdsMarketplaceValorImposto.asCurrency) / cdsMarketplaceprecovendacomfrete.asCurrency)*100, -2);
    except
      result := 0.00;
    end;
  end;
*)




  result := Null;
  if cdsMarketplacenovo_preco_desejado.asCurrency >0 then
  begin
    try
      result := roundto(((cdsMarketplacenovo_preco_desejado.asCurrency -
                  cdsMarketplacecomissao.asCurrency -
                  cdsMarketplacecusto_frete.asCurrency -
                  cdsMarketplacecusto_produto.asCurrency -
                  Adicional_Custo_Produto -
                  cdsMarketplaceValorImposto.asCurrency) / cdsMarketplacenovo_preco_desejado.asCurrency)*100, -2);
    except
      result := 0.00;
    end;
  end;


end;

procedure TdtmManutencaoPreco.qryManutencaoPrecoBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
//  mensagemaviso('fechando');
end;

procedure TdtmManutencaoPreco.dsrMarketplaceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsrMarketplace.dataset.active then
  begin
    if (field <> nil) then
    begin

      if (field.fieldname = 'alterar') then
      begin
        MarcarRegistrosMarketPlaceAtualizar(false, false);
        tlabel(self.findcomponent('lblExibirTotalMarcadosMKP')).Caption := inttostr(cdsMarketplace.QtdeMarcados);
      end;


      if not AtualizandoPrecos then
      begin
        if (Field.FieldName = 'preconormal') or     {30}
           (Field.FieldName = 'validade') then      {31}
        begin
          ColMKP := cdsMarketplacecoluna.asString;

          indexMKP := PrecosCaracteristicasAlteradosMKP[caract_preco_col].IndexOf(
              cdsMarketplacecaracteristica.asstring + '-' +
              cdsMarketplacepreco.asstring + '-' +
              ColMKP);

          if indexMKP = -1 then
          begin

            PrecosCaracteristicasAlteradosMKP[caract_preco_col].Add(
                cdsMarketplacecaracteristica.asstring + '-' +
                cdsMarketplacepreco.asstring + '-' +
                ColMKP);

            PrecosCaracteristicasAlteradosMKP[caracteristica].Add(cdsMarketplacecaracteristica.asstring);
            PrecosCaracteristicasAlteradosMKP[preco].Add(cdsMarketplacepreco.asstring);
            PrecosCaracteristicasAlteradosMKP[coluna].Add(ColMKP);

            if (cdsMarketplacepreconormal.AsString='') then
              PrecosCaracteristicasAlteradosMKP[valor].Add('0')
            else
              PrecosCaracteristicasAlteradosMKP[valor].Add(cdsMarketplacepreconormal.AsString);

            PrecosCaracteristicasAlteradosMKP[validade].Add(cdsMarketplacevalidade.AsString);

            IndexMKP := PrecosCaracteristicasAlteradosMKP[caract_preco_col].IndexOf(

                     cdsMarketplacecaracteristica.asstring + '-' +
                     cdsMarketplacepreco.asstring + '-' +
                     ColMKP);
          end
          else
          begin
            if (PrecosCaracteristicasAlteradosMKP[valor].Strings[IndexMKP] <> cdsMarketplacepreconormal.AsString) or
               (PrecosCaracteristicasAlteradosMKP[validade].Strings[IndexMKP] <> cdsMarketplacevalidade.AsString) then
            begin
              if (cdsMarketplacepreconormal.AsString='') then
                PrecosCaracteristicasAlteradosMKP[valor].Strings[IndexMKP] := '0'
              else
                PrecosCaracteristicasAlteradosMKP[valor].Strings[IndexMKP] := cdsMarketplacepreconormal.AsString;

              PrecosCaracteristicasAlteradosMKP[validade].Strings[IndexMKP] := cdsMarketplacevalidade.AsString;
            end;
          end;

          if not VarrendoManutencao then
          begin
            AlterarMarkupInverso := true;
            AtualizarPrecosMKP(true);
            AlterarMarkupInverso := false;
          end;
        end
        else

        if (field.FieldName = 'markup') or
           (field.FieldName = 'grupo') or
           (field.FieldName = 'classe') or
           (field.FieldName = 'marca') or
           (field.FieldName = 'precotabelado') then

        begin

          indexMMKP := CaracteristicasAlteradasMKP[caracteristicam].IndexOf(
            cdsMarketplacecaracteristica.asstring);

          if indexMMKP = -1 then
          begin
            CaracteristicasAlteradasMKP[caracteristicam].Add(cdsMarketplacecaracteristica.asstring);
            CaracteristicasAlteradasMKP[markup].Add(cdsMarketplacemarkup.asstring);
            CaracteristicasAlteradasMKP[grupo].Add(cdsMarketplacegrupo.asstring);
            CaracteristicasAlteradasMKP[classe].Add(cdsMarketplaceclasse.asstring);
            CaracteristicasAlteradasMKP[marca].Add(cdsMarketplacemarca.asstring);
            CaracteristicasAlteradasMKP[precotabelado].Add(cdsMarketplaceprecotabelado.asstring);

            indexMMKP := CaracteristicasAlteradasMKP[caracteristicaM].IndexOf(cdsMarketplacecaracteristica.asstring);
          end
          else
          if (CaracteristicasAlteradasMKP[markup].Strings[indexMMKP] <> cdsMarketplacemarkup.AsString) or
             (CaracteristicasAlteradasMKP[grupo].Strings[indexMMKP] <> cdsMarketplacegrupo.AsString) or
             (CaracteristicasAlteradasMKP[classe].Strings[indexMMKP] <> cdsMarketplaceclasse.AsString) or
             (CaracteristicasAlteradasMKP[marca].Strings[indexMMKP] <> cdsMarketplacemarca.AsString) or
             (CaracteristicasAlteradasMKP[precotabelado].Strings[indexMMKP] <> cdsMarketplaceprecotabelado.AsString) then
          begin
            CaracteristicasAlteradasMKP[markup].Strings[indexMMKP] := cdsMarketplacemarkup.AsString;
            CaracteristicasAlteradasMKP[grupo].Strings[indexMMKP] := cdsMarketplacegrupo.AsString;
            CaracteristicasAlteradasMKP[classe].Strings[indexMMKP] := cdsMarketplaceclasse.AsString;
            CaracteristicasAlteradasMKP[marca].Strings[indexMMKP] := cdsMarketplacemarca.AsString;
            CaracteristicasAlteradasMKP[precotabelado].Strings[indexMMKP] := cdsMarketplaceprecotabelado.AsString;

          end;

          if (field.FieldName = 'markup') then
            if not VarrendoManutencao then
              AtualizarMarkupsMKP(true);


          if (field.FieldName = 'precotabelado') then
            if not VarrendoManutencao then
              AtualizarPrecoTabeladoMKP;


        end
        else
        if (field.FieldName = 'desconto_cargo') then  {32}
        begin

          dsrMarketplace.OnDataChange := nil;
          AtualizarDescontoCargosMKP;
          dsrMarketplace.OnDataChange := dsrMarketplaceDataChange;

        end
        else
        if (field.FieldName = 'precovendacargo') then
          AtualizarPrecoCargosMKP(field.fieldname)
        else
        if (field.FieldName = 'margem_final_desejada_mk') then
        begin
          dsrMarketplace.OnDataChange := nil;
          AtualizarMarketPlace_Margem_Final_Desejada_mk;
          dsrMarketplace.OnDataChange := dsrMarketplaceDataChange;
        end
        else
        if (field.FieldName = 'margem_final_desejada_pm') then
        begin
          dsrMarketplace.OnDataChange := nil;
          AtualizarMarketPlace_Margem_Final_Desejada_pm;
          dsrMarketplace.OnDataChange := dsrMarketplaceDataChange;
        end
        else
        if (field.FieldName = 'novo_preco_desejado') then
        begin
          dsrMarketplace.OnDataChange := nil;
          AtualizarMarketPlace_novo_preco_desejado;
          dsrMarketplace.OnDataChange := dsrMarketplaceDataChange;
        end;


          {
        else
        if (field.fieldname = 'fatormarkproduto') then
        begin
          dsrMarketplace.OnDataChange := nil;
          AtualizarfatormarkprodutoMKP;
          dsrMarketplace.OnDataChange := dsrMarketplaceDataChange;
        end
        else
        if (field.FieldName = 'precovendacargo_m_p_f') then
          Atualizarprecovendacargo_m_p_f}

      end;
    end;
  end;
end;

procedure TdtmManutencaoPreco.AtualizarMarkupsMKP(
  calcularValoresPrecosMarkup: boolean);
var
 RegistroAtual : TBookMark;
begin
 RegistroAtual := cdsMarketplace.GetBookmark;
 cdsMarketplace.DisableControls;
 cdsMarketplace.First;
 While not cdsMarketplace.Eof do
 begin

   if (cdsMarketplacecaracteristica.asstring =  CaracteristicasAlteradasMKP[caracteristicam].strings[IndexMMKP]) then
   begin
     AtualizandoPrecos := True;
     cdsMarketplace.Edit;
     cdsMarketplacemarkup.AsString := CaracteristicasAlteradasMKP[markup].strings[indexMMKP];
     cdsMarketplace.post;

     AtualizandoPrecos := False;
     if calcularValoresPrecosMarkup then
       AlterarValoresPrecosMarkupMKP(true);

   end;

   cdsMarketplace.Next;
 end;
 cdsMarketplace.GotoBookmark(RegistroAtual);
 cdsMarketplace.FreeBookmark(RegistroAtual);
 cdsMarketplace.enableControls;
end;

procedure TdtmManutencaoPreco.AlterarValoresPrecosMarkupMKP(
  AlterarPrecoNormal: boolean);

var
 i: integer;
 vDataValidade, vCampo: String;

begin

  if AlterarPrecoNormal then
  begin
    refazconsultapornome(qrymanutencao_preco, ['produto','filial', 'markup','valorultimacompra'],
                                                [cdsMarketplaceproduto.asString,
                                                 cdsMarketplacefilial_estoque.asString,
                                                 cdsMarketplacemarkup.ascurrency,
                                                 cdsMarketplaceultimacompra.ascurrency], true);

    if (qryManutencao_precoprecovenda.AsCurrency<>0) and (cdsMarketplacepreconormal.AsCurrency <> qryManutencao_precoprecovenda.AsCurrency) then
    begin
      cdsMarketplace.edit;
      cdsMarketplacepreconormal.AsCurrency := qryManutencao_precoprecovenda.AsCurrency;
//      cdsMarketplaceprecovendaantesimpostos').AsCurrency := qryManutencao_precoprecovendaantesimpostos.AsCurrency; não possui

//      if cdsMarketplacepreconormal').AsCurrency <> 0 then  não possui campo margem
//        cdsMarketplacemargem_l'+PNormal).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)) * 100
//      else
//        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := 0;

      cdsMarketplacealterado.AsBoolean := true;

      dsrMarketplaceDataChange(self, tField(cdsMarketplacepreconormal));

      if cdsMarketplace.state = dsedit then
        cdsMarketplace.post;
    end;

  end;

  if AlterarMarkupInverso then
  begin
    refazconsultapornome(qrymanutencao_preco, ['produto','filial', 'markup','valorultimacompra','precovenda'],
                                                [cdsMarketplaceproduto.asString,
                                                 cdsMarketplacefilial_estoque.asString,
                                                 cdsMarketplacemarkup.ascurrency,
                                                 cdsMarketplaceultimacompra.ascurrency,
                                                 cdsMarketplacepreconormal.AsCurrency], True);

    if (qryManutencao_precomarkup_inverso.AsCurrency<>0) and (cdsMarketplacemarkupinverso.AsCurrency <> qryManutencao_precomarkup_inverso.AsCurrency) then
    begin
      cdsMarketplace.edit;
      cdsMarketplacemarkupinverso.AsCurrency := qryManutencao_precomarkup_inverso.AsCurrency;

      cdsMarketplacealterado.AsBoolean := true;
      if cdsMarketplace.state = dsedit then
        cdsMarketplace.post;
    end;
  end;


  { sem o campo margem para o preconormal
  if roundtod(qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency, 2) <>
     roundtod(((1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)) * 100), 2) then
  begin
      qryManutencaoPreco.edit;

      if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := (1-(qryManutencaoPreco.FieldByName('ultimacompra').AsCurrency/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency)) * 100
      else
        qryManutencaoPreco.FieldByName('margem_l'+PNormal).AsCurrency := 0;

      if qryManutencaoPreco.state = dsedit then
        qryManutencaoPreco.post;
  end;
  }

//  for i := qryManutencaoPreco.FieldCount-1 downto vLimiteCampoAlteravel+1 do
//    if copy(qryManutencaoPreco.fields[i].FieldName,1,6) = 'cargo_' then
//    begin

       vDataValidade := FormatDateTime('yyyy-MM-dd', DataServidor-1);
             { não exibe preço promoção neste caso
       if (PPromocao<>'0') then
       begin
         if (qryManutencaoPreco.FieldByName('validade_l'+PPromocao).asString <> '') then
           vDataValidade := FormatDateTime('yyyy-MM-dd', qryManutencaoPreco.FieldByName('validade_l'+PPromocao).asDatetime);

         refazconsultapornome(qrymanutencao_precocargo, ['produto','cargo','ValorPrecoNormal','ValorPrecoPromocao','DataValidadePromocao', 'MarkupCargo' ],
                                                      [qryManutencaoPreco.fieldbyname('produto').asString,
                                                       strtoint(somentenumero(qryManutencaoPreco.fields[i].FieldName)),
                                                       qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency,
                                                       qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency,
                                                       vDataValidade,
                                                       qryManutencaoPreco.fields[i+2].ascurrency]);
       end
       else
       }
         refazconsultapornome(qrymanutencao_precocargo, ['produto','cargo','ValorPrecoNormal','ValorPrecoPromocao','DataValidadePromocao', 'MarkupCargo' ],
                                                      [cdsMarketplaceproduto.asString,
                                                       cdsMarketplacecargo.asinteger,
                                                       cdsMarketplacepreconormal.AsCurrency,
                                                       0,
                                                       vDataValidade,
                                                       cdsMarketplacedesconto_cargo.ascurrency], true);

       if cdsMarketplaceprecovendacargo.AsCurrency <> qryManutencao_precocargovalor.AsCurrency then
       begin
         cdsMarketplace.edit;
         cdsMarketplaceprecovendacargo.AsCurrency := qryManutencao_precocargovalor.AsCurrency;

//         vCampo := trocar(qryManutencaoPreco.Fields[i].fieldname, 'cargo_', 'margem_pc');
         if cdsMarketplaceprecovendacargo.AsCurrency <> 0 then
           cdsMarketplacemargem_cargo.AsCurrency := (1-(cdsMarketplaceultimacompra.AsCurrency/cdsMarketplaceprecovendacargo.AsCurrency)) * 100
         else
           cdsMarketplacemargem_cargo.AsCurrency := 0;

         cdsMarketplacealterado.AsBoolean := true;

        AtualizarDescontoCargosMKP(false);

         if cdsMarketplace.state = dsedit then
           cdsMarketplace.post;
       end;

//    end;
end;

procedure TdtmManutencaoPreco.cdsMarketplace_nnnnnmarkupChange(Sender: TField);
begin
  inherited;
//  dsrMarketplaceDataChange(Sender, Sender);
end;

procedure TdtmManutencaoPreco.cdsMarketplaceBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  cdsMarketplace.onCalcFields := nil;
end;

procedure TdtmManutencaoPreco.cdsMarketplaceAfterPost(DataSet: TDataSet);
begin
  inherited;
  cdsMarketplace.onCalcFields :=   cdsMarketplaceCalcFields;
end;

procedure TdtmManutencaoPreco.cdsMarketplaceAfterCancel(DataSet: TDataSet);
begin
  inherited;
  cdsMarketplace.onCalcFields :=   cdsMarketplaceCalcFields;
end;

(*
function TdtmManutencaoPreco.PrecoVendacomFrete: Variant;
begin
  result := Null;

  if not cdsMarketplaceprecovendacargo_m_p_f.isnull then
  begin
    try
      result := cdsMarketplaceprecovendacargo_m_p_f.asCurrency +
                cdsMarketplacecusto_frete.asCurrency;
    except
      result := 0.00
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;
*)

procedure TdtmManutencaoPreco.AtualizarPrecosMKP(
  calcularValoresPrecosMarkup: boolean);
var
  RegistroAtual : TBookMark;
begin

  RegistroAtual := cdsMarketplace.GetBookmark;
  cdsMarketplace.DisableControls;
  cdsMarketplace.First;
  While not cdsMarketplace.Eof do
  begin
    if ((cdsMarketplacecaracteristica.asstring +'-'+ cdsMarketplacepreco.AsString + '-'+ColMKP) =  PrecosCaracteristicasAlteradosMKP[caract_preco_col].strings[IndexMKP]) then
    begin

      if (cdsMarketplacepreconormal.AsString    <> PrecosCaracteristicasAlteradosMKP[valor].strings[IndexMKP]) or
         (cdsMarketplacevalidade.AsString <> PrecosCaracteristicasAlteradosMKP[validade].strings[IndexMKP]) then
      begin
        AtualizandoPrecos := True;
        cdsMarketplace.Edit;
        cdsMarketplacepreconormal.AsString := PrecosCaracteristicasAlteradosMKP[valor].strings[indexMKP];
        cdsMarketplacevalidade.AsString := PrecosCaracteristicasAlteradosMKP[validade].strings[indexMKP];
        cdsMarketplace.post;
      end;

      AtualizandoPrecos := False;

      if calcularValoresPrecosMarkup then
        AlterarValoresPrecosMarkupMKP(false);

    end;

    cdsMarketplace.Next;
  end;
  cdsMarketplace.GotoBookmark(RegistroAtual);
  cdsMarketplace.FreeBookmark(RegistroAtual);
  cdsMarketplace.enableControls;
  AtualizandoPrecos := False;

end;


procedure TdtmManutencaoPreco.AtualizarDescontoCargosMKP(
  Todos: Boolean = True);
var
  vCaracteristica, vPreco, vCampoCargo, vCampoMargem : String;
  vProduto, vCargo: String;
  vValorDescontoCargo : String;
  vRegistroAtual : TBookMark;
begin
  vCaracteristica := cdsMarketplacecaracteristica.asString;
  vPreco          := cdsMarketplacepreco.asString;
  vValorDescontoCargo :=  cdsMarketplacedesconto_cargo.asString;


  vProduto := cdsMarketplaceproduto.asString;
  vCargo := cdsMarketplacecargo.asString;

  CargoMKP := cdsMarketplacecargo.asString;

  vCampoCargo := 'precovendacargo';
  vCampoMargem := 'margem_cargo';

  vRegistroAtual := cdsMarketplace.getBookMark;

  cdsMarketplace.disableControls;

  if todos then
    cdsMarketplace.first;

  while not cdsMarketplace.eof do
  begin
    { ATENÇÃO!!!
     Situação de erro!! uma alteração de um desconto de um cargo deve obedecer a chave da tabelea produtoscargos...(produto,cargo)
     a condição do loop abaixo esta errado! ver a função AtualizarDescontoCargos também}

{
    if (vCaracteristica = cdsMarketplacecaracteristica.asString) and
       (vPreco          = cdsMarketplacepreco.asString) then
}

    if (vProduto = cdsMarketplaceproduto.asString) and
       (vCargo = cdsMarketplacecargo.asString) then
    begin

      indexPCMKP := DescontosProdutosCargosAlteradosMKP[produto_cargo_pc].IndexOf(
                cdsMarketplaceproduto.asstring + '-' + CargoMKP);

      if indexPCMKP = -1 then
      begin
        DescontosProdutosCargosAlteradosMKP[produto_cargo_pc].Add(
            cdsMarketplaceproduto.asstring + '-' +
            CargoMKP);

        DescontosProdutosCargosAlteradosMKP[produto_pc].Add(cdsMarketplaceproduto.asstring);
        DescontosProdutosCargosAlteradosMKP[cargo_pc].Add(cargoMKP);

        if (vValorDescontoCargo = '') then
          DescontosProdutosCargosAlteradosMKP[desconto_pc].Add('0')
        else
          DescontosProdutosCargosAlteradosMKP[desconto_pc].Add(vValorDescontoCargo);

        indexPCMKP := DescontosProdutosCargosAlteradosMKP[produto_cargo_pc].IndexOf(
            cdsMarketplaceproduto.asstring + '-' + CargoMKP);

      end
      else
      begin
        if (DescontosProdutosCargosAlteradosMKP[desconto_pc].Strings[indexPCMKP] <> vValorDescontoCargo) then
        begin

          if (vValorDescontoCargo='') then
            DescontosProdutosCargosAlteradosMKP[desconto_pc].Strings[indexPCMKP] := '0'
          else
            DescontosProdutosCargosAlteradosMKP[desconto_pc].Strings[indexPCMKP] := vValorDescontoCargo;

        end;
      end;

      cdsMarketplace.edit;

      if todos then
      begin
        cdsMarketplacedesconto_cargo.asString := vValorDescontoCargo;
        cdsMarketplaceprecovendacargo.asCurrency := estoques_preco(cdsMarketplaceproduto.asString,
                                          cdsMarketplacefilial_estoque.AsInteger,
                                          strToCurr(DescontosProdutosCargosAlteradosMKP[desconto_pc].Strings[indexPCMKP]),
                                          cdsMarketplacepreconormal.AsCurrency, 0);
      end;

      cdsMarketplacemargem_cargo.AsCurrency := (1-(cdsMarketplaceultimacompra.AsCurrency/cdsMarketplaceprecovendacargo.asCurrency)) * 100;

{      cdsMarketplaceValorMarkProduto.asCurrency := cdsMarketplaceprecovendacargo.asCurrency * cdsMarketplacefatormarkproduto.asCurrency/100;}
{      cdsMarketplaceprecovendacargo_m_p_f.asCurrency := cdsMarketplaceprecovendacargo.asCurrency + cdsMarketplaceValorMarkProduto.asCurrency;}
      cdsMarketplacecusto_frete.asCurrency := custo_frete(cdsMarketplaceproduto.asString,  cdsMarketplacetabela_frete.asinteger, cdsMarketplacenovo_preco_desejado.asCurrency, false);

      cdsMarketplacealterado.AsBoolean := true;
      cdsMarketplace.post;

    end;

    if todos then
      cdsMarketplace.next
    else
      break;

  end;

  cdsMarketplace.enableControls;

  cdsMarketplace.gotoBookMark(vRegistroAtual);
  cdsMarketplace.freeBookMark(vRegistroAtual);

end;

procedure TdtmManutencaoPreco.AtualizarPrecoCargosMKP(
  CampoPrecoCargo_pc: String);
var
  vCampoDesconto : String;
  vPercentualDescontoCargo : Currency;
  vValorPrecoCargo : Currency;
begin
//  vValorPrecoCargo := cdsMarketplace.fieldByName(CampoPrecoCargo_pc).asCurrency;
  vValorPrecoCargo := cdsMarketplaceprecovendacargo.asCurrency;

//  vCampoDesconto := trocar(CampoPrecoCargo_pc, 'cargo_', 'desconto_pc');
  vCampoDesconto := 'desconto_cargo';

  vPercentualDescontoCargo := 0;
  {
  if ColunaPromocao = 0  then
  begin
  }
//    if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
    if cdsMarketplacepreconormal.AsCurrency <> 0 then
      vPercentualDescontoCargo :=  100 - ((vValorPrecoCargo*100)/cdsMarketplacepreconormal.AsCurrency);
      {
  end
  else
  begin
    if qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency <> 0 then
      vPercentualDescontoCargo :=  100 - ((vValorPrecoCargo*100)/qryManutencaoPreco.FieldByName('valor_l'+PPromocao).AsCurrency)
    else
    if qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency <> 0 then
      vPercentualDescontoCargo :=  100 - ((vValorPrecoCargo*100)/qryManutencaoPreco.FieldByName('valor_l'+PNormal).AsCurrency);
  end;
  }

//  qryManutencaoPreco.fieldByName(vCampoDesconto).asCurrency := vPercentualDescontoCargo;
  cdsMarketplacedesconto_cargo.asCurrency := vPercentualDescontoCargo;
  
//  if not assigned(dsrMarketplace.ondatachange) then
//     dsrMarketplaceDataChange(self, tField(cdsMarketplacedesconto_cargo));


end;

procedure TdtmManutencaoPreco.MarcarRegistrosMarketPlaceAtualizar(Marcando,
  Todos: boolean);
begin
  if todos then
    cdsMarketplace.MarcarRegistros(cdsMarketplace, cdsMarketplacealterar, Marcando, true)
  else
    cdsMarketplace.MarcarRegistros(cdsMarketplace, cdsMarketplacealterar, not cdsMarketplacealterar.asboolean, false);
end;

procedure TdtmManutencaoPreco.cdsMarketplace_nnnnnAfterEdit(DataSet: TDataSet);
begin
  inherited;
  EditandoMKP := true;
end;

procedure TdtmManutencaoPreco.AlterarColunasPrecosMarketPlace;
var
  Usuario: TtecUsuarios;
  Indice: INteger;
  RegistroAtual : TBookMark;

  procedure InserirColunasPreco;
  begin
     qryColunasPrecos.Sql.Clear;
     qryColunasPrecos.Sql.Add('Insert Into colunasprecos (caracteristica, preco, coluna, valor, validade, data, alteracao)' +
                               ' Values (' + PrecosCaracteristicasAlteradosMKP[caracteristica].strings[indice]       + ', ' +
                                             PrecosCaracteristicasAlteradosMKP[preco].strings[indice]                + ', ' +
                                             PrecosCaracteristicasAlteradosMKP[coluna].strings[indice]               + ', ' +
                                             Trocar(PrecosCaracteristicasAlteradosMKP[valor].strings[indice],',','.')+ ', ' +
                                             DataValidade                                                         + ', ' +
                                             'Current_Date'                                                       + ', ' +
                                             'Current_Date' + ')');
     qryColunasPrecos.Open;
  end;

  procedure InserirProdutosCargos;
  begin
    qryAtualizarProdutosCargos.Sql.Clear;
    qryAtualizarProdutosCargos.Sql.Add('Insert Into produtoscargos (produto, cargo, markup)' +
                               ' Values (' + DescontosProdutosCargosAlteradosMKP[produto_pc].strings[indice]       + ', ' +
                                             DescontosProdutosCargosAlteradosMKP[cargo_pc].strings[indice]                + ', ' +
                                             Trocar(DescontosProdutosCargosAlteradosMKP[desconto_pc].strings[indice],',','.')+ ')');
    qryAtualizarProdutosCargos.Open;
  end;

  procedure AtualizarProdutosCargos;
  begin
    qryAtualizarProdutosCargos.Sql.Clear;
    qryAtualizarProdutosCargos.Sql.Add('Update produtoscargos set markup = ' + Trocar(DescontosProdutosCargosAlteradosMKP[desconto_pc].strings[indice],',','.') +
                              ' Where produto = ' + qryExisteProdutoCargoproduto.AsString +
                              ' and  cargo   = ' + qryExisteProdutoCargocargo.asString);

    qryAtualizarProdutosCargos.Open;
  end;


  {
  procedure Inserirmarketplace_produtos_fator;
  begin

    qryAtualizarmarketplace_produtos_fator.Sql.Clear;
    qryAtualizarmarketplace_produtos_fator.Sql.Add('Insert Into marketplace_produtos_fator (produto, marketplace, fator)' +
                               ' Values (' + marketplace_produtos_fator[produto_m_p_f].strings[indice]       + ', ' +
                                             marketplace_produtos_fator[marketplace_m_p_f].strings[indice]                + ', ' +
                                             Trocar(marketplace_produtos_fator[fator_m_p_f].strings[indice],',','.')+ ')');
    qryAtualizarmarketplace_produtos_fator.Open;
  end;

  procedure Atualizarmarketplace_produtos_fator;
  begin
    qryAtualizarmarketplace_produtos_fator.Sql.Clear;
    qryAtualizarmarketplace_produtos_fator.Sql.Add('Update marketplace_produtos_fator set fator = ' + Trocar(marketplace_produtos_fator[fator_m_p_f].strings[indice],',','.') +
                              ' Where produto = ' + qryExistemarketplace_produtos_fatorproduto.AsString +
                              ' and  marketplace   = ' + qryExistemarketplace_produtos_fatormarketplace.asString);

    qryAtualizarmarketplace_produtos_fator.Open;
  end;

  }

begin

  Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
  try

    RegistroAtual := cdsMarketplace.GetBookmark;
    cdsMarketplace.DisableControls;


    if UsuarioLogin.GerenteEstoque then
         Usuario:= ObterAutorizacao(taSENHA)
    else Usuario:= ObterAutorizacao(taLOGIN, ctGERENTEESTOQUE, ctAUTORIZADO);

    if Assigned(Usuario) then
    begin
      if Usuario.GerenteEstoque then
      begin


       for indice := 0 to PrecosCaracteristicasAlteradosMKP[caract_preco_col].Count -1 do
       begin
         if cdsMarketplace.locate('caracteristica;preco',
           VarArrayOf([PrecosCaracteristicasAlteradosMKP[caracteristica].strings[indice],
                       PrecosCaracteristicasAlteradosMKP[preco].strings[indice]]), [] ) then
         begin
           ReFazConsulta(qryExisteColunaPreco,[0,1,2],[PrecosCaracteristicasAlteradosMKP[caracteristica].strings[indice],
                                                       PrecosCaracteristicasAlteradosMKP[preco].strings[indice],
                                                       PrecosCaracteristicasAlteradosMKP[coluna].strings[indice]]);
           if PrecosCaracteristicasAlteradosMKP[validade].strings[indice]<>'' then
                DataValidade:= '''' + PrecosCaracteristicasAlteradosMKP[validade].strings[indice]+ ''''
           else DataValidade:= 'null';

           if not qryExisteColunaPreco.IsEmpty then
           begin
             if StrToCurr(PrecosCaracteristicasAlteradosMKP[valor].strings[indice]) = 0 then
                 ExluirColunasPreco
             else
             if ((StrToCurr(PrecosCaracteristicasAlteradosMKP[valor].strings[indice])  <> qryExisteColunaPrecovalor.AsCurrency) or
                 (PrecosCaracteristicasAlteradosMKP[validade].strings[indice] <> qryExisteColunaPrecovalidade.AsString)) then
               AtualizarColunasPreco(Trocar(PrecosCaracteristicasAlteradosMKP[valor].strings[indice],',','.'));
           end
           else
             if (StrToCurr(PrecosCaracteristicasAlteradosMKP[valor].strings[indice]) <> 0) then
                 InserirColunasPreco;
         end;
       end;
       Perpetrar([qryColunasPrecos]);

       for indice := 0 to CaracteristicasAlteradasMKP[caracteristicam].Count -1 do
       begin

        ReFazConsultapornome(qryCaracteristicas,['codigo'], [CaracteristicasAlteradasMKP[caracteristicaM].strings[indice]]);

        if qryCaracteristicas.recordcount = 1 then
        begin
          if (CaracteristicasAlteradasMKP[markup].strings[indice] <> qryCaracteristicasmarkup.asString) or
             (CaracteristicasAlteradasMKP[grupo].strings[indice] <> qryCaracteristicasgrupo.asString) or
             (CaracteristicasAlteradasMKP[classe].strings[indice] <> qryCaracteristicasclasse.asString) or
             (CaracteristicasAlteradasMKP[marca].strings[indice] <> qryCaracteristicasmarca.asString) or
             (CaracteristicasAlteradasMKP[precotabelado].strings[indice] <> qryCaracteristicasprecotabelado.asString) then
          begin
            qryAtualizarCaracteristicas.ParamByName('codigo').asString := qryCaracteristicascodigo.asString;
            qryAtualizarCaracteristicas.ParamByName('markup').asString := trocar(CaracteristicasAlteradasMKP[markup].strings[indice], ',', '.');
            qryAtualizarCaracteristicas.ParamByName('grupo').asString := CaracteristicasAlteradasMKP[grupo].strings[indice];
            qryAtualizarCaracteristicas.ParamByName('classe').asString := CaracteristicasAlteradasMKP[classe].strings[indice];
            qryAtualizarCaracteristicas.ParamByName('marca').asString := CaracteristicasAlteradasMKP[marca].strings[indice];
            qryAtualizarCaracteristicas.ParamByName('precotabelado').asString := CaracteristicasAlteradasMKP[precotabelado].strings[indice];

            qryAtualizarCaracteristicas.execSQL;
          end
        end
        else
          mensagemerro('O produto ' + CaracteristicasAlteradasMKP[caracteristicaM].strings[indice] + ' não foi encontrado.');
       end;

       Perpetrar([qryAtualizarCaracteristicas]);


       for indice := 0 to MarketPlace[marketplace_codigo].Count - 1 do
       begin
         RefazConsultaPorNome(qryMarketPlace, ['codigo'],
            [MarketPlace[marketplace_codigo].Strings[indice]]);

         if qryMarketPlace.recordcount = 1 then
         begin
           if qryMarketPlace.fieldbyname('margem_final_desejada').asString <>
              MarketPlace[marketplace_margem_final_desejada].Strings[indice] then
           begin
             qryMarketPlace.edit;
             qryMarketPlace.fieldbyname('margem_final_desejada').asString :=
                MarketPlace[marketplace_margem_final_desejada].Strings[indice];
             qryMarketPlace.post;
             perpetrar([qryMarketPlace]);
           end;
         end;
       end;


       for indice := 0 to  produto_marketplace[marketplace_codigo].Count - 1 do
       begin
         RefazConsultaPorNome(qryproduto_marketplace, ['codigo'],
            [produto_marketplace[marketplace_codigo].Strings[indice]]);

         if qryproduto_marketplace.recordcount = 1 then
         begin
           if qryproduto_marketplace.fieldbyname('margem_final_desejada').asString <>
              produto_marketplace[marketplace_margem_final_desejada].Strings[indice] then
           begin
             qryproduto_marketplace.edit;
             qryproduto_marketplace.fieldbyname('margem_final_desejada').asString :=
                produto_marketplace[marketplace_margem_final_desejada].Strings[indice];
             qryproduto_marketplace.post;
             perpetrar([qryproduto_marketplace]);
           end;
         end;
       end;


       {
       for indice := 0 to marketplace_produtos_fator[produto_marketplace_m_p_f].Count -1 do
       begin
         ReFazConsultapornome(qryExistemarketplace_produtos_fator,['produto','marketplace'],
                              [marketplace_produtos_fator[produto_m_p_f].strings[indice],
                               marketplace_produtos_fator[marketplace_m_p_f].strings[indice]]);

         if not qryExistemarketplace_produtos_fator.IsEmpty then
         begin
           if (StrToCurr(marketplace_produtos_fator[fator_m_p_f].strings[indice])  <> qryExistemarketplace_produtos_fatorfator.AsCurrency) then
             Atualizarmarketplace_produtos_fator;
         end
         else
           if (marketplace_produtos_fator[fator_m_p_f].strings[indice] <> '') then
             Inserirmarketplace_produtos_fator;
       end;

       Perpetrar([qryAtualizarmarketplace_produtos_fator]);
       }

       LimparProdutosAlteradosMKP;
       FEditando:= False;

      end
      else
       MensagemAviso(ctUSUARIOSEMPERMISSAO);
    end;
  finally
    Usuario.Free;
    cdsMarketplace.GotoBookmark(RegistroAtual);
    cdsMarketplace.FreeBookmark(RegistroAtual);
    cdsMarketplace.enableControls;
    editandoMKP := false;
  end;

end;

procedure TdtmManutencaoPreco.ExluirColunasPreco;
begin
  qryColunasPrecos.Sql.Clear;
  qryColunasPrecos.Sql.Add('Delete From colunasprecos Where caracteristica = ' + qryExisteColunaPrecocaracteristica.AsString +
                           ' and preco = '  + qryExisteColunaPrecopreco.AsString  +
                           ' and coluna = ' + qryExisteColunaPrecocoluna.AsString + '');
  qryColunasPrecos.Open;
end;

procedure TdtmManutencaoPreco.AtualizarColunasPreco(pvalor: String);
begin
  qryColunasPrecos.Sql.Clear;
  qryColunasPrecos.Sql.Add('Update colunasprecos Set valor      = ' + pValor  + ',' +
                                                     'validade  = ' + DataValidade                                                             + ',' +
                                                     'data      = ' + 'Current_Date' + ',' +
                                                     'alteracao = ' + 'Current_Date' +
                            ' Where caracteristica = ' + qryExisteColunaPrecocaracteristica.AsString +
                            ' and  preco          = ' + qryExisteColunaPrecopreco.AsString          +
                            ' and  coluna         = ' + qryExisteColunaPrecocoluna.AsString         + '');
  qryColunasPrecos.Open;

end;

procedure TdtmManutencaoPreco.LimparProdutosAlteradosMKP;
begin
  PrecosCaracteristicasAlteradosMKP[caract_preco_col].Clear;
  PrecosCaracteristicasAlteradosMKP[Caracteristica].Clear;
  PrecosCaracteristicasAlteradosMKP[preco].Clear;
  PrecosCaracteristicasAlteradosMKP[coluna].Clear;
  PrecosCaracteristicasAlteradosMKP[valor].Clear;
  PrecosCaracteristicasAlteradosMKP[validade].Clear;

  CaracteristicasAlteradasMKP[CaracteristicaM].Clear;
  CaracteristicasAlteradasMKP[markup].Clear;
  CaracteristicasAlteradasMKP[grupo].clear;
  CaracteristicasAlteradasMKP[classe].clear;
  CaracteristicasAlteradasMKP[marca].clear;

  DescontosProdutosCargosAlteradosMKP[produto_cargo_pc].Clear;
  DescontosProdutosCargosAlteradosMKP[produto_pc].Clear;
  DescontosProdutosCargosAlteradosMKP[cargo_pc].Clear;
  DescontosProdutosCargosAlteradosMKP[desconto_pc].Clear;

  MarketPlace[marketplace_codigo].Clear;
  MarketPlace[marketplace_margem_final_desejada].Clear;

  produto_marketplace[marketplace_codigo].Clear;
  produto_marketplace[marketplace_margem_final_desejada].Clear;

       {
  marketplace_produtos_fator[produto_marketplace_m_p_f].Clear;
  marketplace_produtos_fator[produto_m_p_f].Clear;
  marketplace_produtos_fator[marketplace_m_p_f].Clear;
  marketplace_produtos_fator[fator_m_p_f].Clear;
  }


//  ProdutosAlteradosMKP[produto].Clear;
//  ProdutosAlteradosMKP[precoproduto].Clear;

//  CaracteristicasPrecoPromocaoAlteradasMKP[caract_preco_promocao].clear;
//  CaracteristicasPrecoPromocaoAlteradasMKP[caracteristica_pro].clear;
//  CaracteristicasPrecoPromocaoAlteradasMKP[preco_pro].clear;
//  CaracteristicasPrecoPromocaoAlteradasMKP[promocao_pro].clear;

  AtribuirDados(cdsMarketplace, [cdsMarketplacealterado], [false], true);

end;

procedure TdtmManutencaoPreco.CopiarCampoCalculado(var vNomeCampo: String; vAscendig: Boolean);
var
 vRegistroAtual, vRegistroCorrente: TBookMark;
 vPosition : dOUBLE;
 i,  vRecno: integer;
 vValorCampoCalculado : Variant;
 vTotalRegistros : integer;


begin

//  cdsMarketplace.IndexDefs.update;
  if cdsMarketplace.fieldbyname(vNomeCampo).FieldKind = fkCalculated then
  begin

    try
      if vAscendig then
        vNomeCalculado := vNomeCampo+'A'
      else
        vNomeCalculado := vNomeCampo+'D';

//      tDbadvgrid(self.owner.FindComponent('dbgMarketPlace')).visible := False;

      vTotalRegistros := cdsMarketplace.recordcount;

      vCopiandoCampoCalculado := true;

      cdsMarketplace.oncalcFields := nil;
      cdsMarketplace.AfterEdit := nil;
      dsrMarketplace.onDataChange := nil;

      vRegistroAtual := cdsMarketplace.GetBookmark;
      vRecno := cdsMarketplace.recno;

      cdsMarketplace.disablecontrols;
      cdsMarketplace.filtered := true;
      cdsMarketplace.first;


      TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := true;


      while not cdsMarketplace.eof do
      begin

        AtribuirValoresCamposCalculados(true);
        if cdsMarketplace.fieldbyname(vNomeCampo).isnull then
          vValorCampoCalculado := null
        else
          vValorCampoCalculado := cdsMarketplace.fieldbyname(vNomeCampo).asVariant;

        cdsMarketplace.edit;

        cdsMarketplacecampocalculado.asVariant := vValorCampoCalculado;
        cdsMarketplacenomecampocalculado.asString :=  vNomeCalculado;
        cdsMarketplace.post;

        vPosition:=  ((cdsMarketplace.recordcount) * 100) / vTotalRegistros;
          
        TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Appearance.ValueFormat := 'Ordenando registros  %.0f%%';
        TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Position := vPosition;

        Application.ProcessMessages;
        
//        cdsMarketplace.next;

      end;

    finally
    
      cdsMarketplace.filtered := false;
      cdsMarketplace.EnableControls;

      if cdsMarketplace.BookmarkValid(vRegistroAtual) then
        cdsMarketplace.GotoBookmark(vRegistroAtual);
        
      cdsMarketplace.FreeBookmark(vRegistroAtual);

      cdsMarketplace.recno := vrecno;


      TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := false;

      vNomeCampo := 'CampoCalculado';

      cdsMarketplace.AfterEdit := cdsMarketplaceAfterEdit;
      dsrMarketplace.onDataChange := dsrMarketplaceDataChange;
      cdsMarketplace.oncalcFields := cdsMarketplacecalcFields;

//      tDbadvgrid(self.owner.FindComponent('dbgMarketPlace')).visible := true;

      vCopiandoCampoCalculado := false;


    end;

  end;

end;

procedure TdtmManutencaoPreco.cdsMarketplace_nnnnnBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cdsMarketplace.IndexName := '';
//  cdsMarketplace.IndexDefs.Clear;
end;

procedure TdtmManutencaoPreco.AtribuirValoresCamposCalculados(Editar: Boolean);
begin
  if Editar then
    cdsMarketplace.edit;

//  cdsMarketplaceprecovendacomfrete.asVariant := PrecoVendacomFrete; {tirar}


  cdsMarketplacenovo_preco_desejado.asVariant            := novo_preco_desejado(cdsMarketplaceperccomissao.asFloat);
  cdsMarketplacecomissao.asVariant                       := Comissao(cdsMarketplaceperccomissao.asFloat);
  cdsMarketplaceperccomissao_recalculado.asVariant       := perccomissao_recalculado;
  cdsMarketplacenovo_preco_desejado.asVariant            := novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asFloat);

  cdsMarketplaceValorImposto.asVariant                   := ValorImposto;
  cdsMarketplacemargem.asVariant                         := Margem;
  cdsMarketplacePercentualDescontoInformado.asVariant    := ValoredtPercentualDesconto;
  cdsMarketplaceValorDescontoInformado.asVariant         := ValorDescontoInformado;
  cdsMarketplacePrecoVendaComDesconto.asVariant          := PrecoVendaComDesconto;
  cdsMarketplaceComissPrecoVendaComDesc.asVariant        := ComissPrecoVendaComDesc; { usa o banco }
  cdsMarketplacePercentualDevDescontoInformado.asVariant := ValoredtPercentualDevolucaoDesconto;
  cdsMarketplaceValorDevDescInformado.asVariant          := ValorDevolucaoDescontoInformado;
  cdsMarketplaceValorComissaoDevDes.asVariant            := ValorComissaoDevDes;     { usa o banco }
  cdsMarketplaceNovoValorImposto.asVariant               := NovoValorImposto;
  cdsMarketplaceNovaMargem.asVariant                     := NovaMargem;





end;

(*
procedure TdtmManutencaoPreco.AtualizarfatormarkprodutoMKP;
var
  vProduto, vMarketPlace : String;
  vfatormarkProdutoMKP : String;
  vRegistroAtual : TBookMark;
begin
  vProduto := cdsMarketplaceproduto.asString;
  vMarketPlace := cdsMarketplaceMarketPlace.asString;
  vfatormarkProdutoMKP :=  cdsMarketplacefatormarkProduto.asString;

  vRegistroAtual := cdsMarketplace.getBookMark;

  cdsMarketplace.disableControls;
  cdsMarketplace.first;

  while not cdsMarketplace.eof do
  begin
    if (vProduto = cdsMarketplaceProduto.asString) and
       (vMarketPlace = cdsMarketplaceMarketPlace.asString) then
    begin

      Index_f_m_p := marketplace_produtos_fator[produto_marketplace_m_p_f].IndexOf(
                cdsMarketplaceproduto.asstring + '-' + cdsMarketplacemarketplace.asString);

      if Index_f_m_p = -1 then
      begin
        marketplace_produtos_fator[produto_marketplace_m_p_f].Add(
            cdsMarketplaceproduto.asstring + '-' +
            cdsMarketplacemarketplace.asString);

        marketplace_produtos_fator[produto_m_p_f].Add(cdsMarketplaceproduto.asstring);
        marketplace_produtos_fator[marketplace_m_p_f].Add(cdsMarketplacemarketplace.asString);

        if (vfatormarkprodutoMKP = '') then
          marketplace_produtos_fator[fator_m_p_f].Add('0')
        else
          marketplace_produtos_fator[fator_m_p_f].Add(vfatormarkprodutoMKP);

        Index_f_m_p := marketplace_produtos_fator[produto_marketplace_m_p_f].IndexOf(
                  cdsMarketplaceproduto.asstring + '-' + cdsMarketplacemarketplace.asString);

      end
      else
      begin
        if (marketplace_produtos_fator[fator_m_p_f].Strings[Index_f_m_p] <> vfatormarkprodutoMKP) then
        begin

          if (vfatormarkprodutoMKP='') then
            marketplace_produtos_fator[fator_m_p_f].Strings[Index_f_m_p] := '0'
          else
            marketplace_produtos_fator[fator_m_p_f].Strings[Index_f_m_p] := vfatormarkprodutoMKP;

        end;
      end;

      cdsMarketplace.edit;

      cdsMarketplacefatormarkproduto.asString := vfatormarkprodutoMKP;

      cdsMarketplaceValorMarkProduto.asCurrency := cdsMarketplaceprecovendacargo.asCurrency * cdsMarketplacefatormarkproduto.asCurrency/100;
      cdsMarketplaceprecovendacargo_m_p_f.asCurrency := cdsMarketplaceprecovendacargo.asCurrency + cdsMarketplaceValorMarkProduto.asCurrency;
      cdsMarketplacecusto_frete.asCurrency := custo_frete(cdsMarketplaceproduto.asString,  cdsMarketplacetabela_frete.asinteger, cdsMarketplaceprecovendacargo_m_p_f.asCurrency, false);

      cdsMarketplacealterado.AsBoolean := true;
      cdsMarketplace.post;

    end;

    cdsMarketplace.next;

  end;

  cdsMarketplace.enableControls;

  cdsMarketplace.gotoBookMark(vRegistroAtual);
  cdsMarketplace.freeBookMark(vRegistroAtual);

end;

*)

(*
procedure TdtmManutencaoPreco.Atualizarprecovendacargo_m_p_f;
var
  vCampoDesconto : String;
  vfatormarkproduto : Currency;
  vprecovendacargo_m_p_f : Currency;
  vDif : Currency;
begin
  vprecovendacargo_m_p_f := cdsMarketplaceprecovendacargo_m_p_f.asCurrency;

  vfatormarkproduto := 0;
  vDif := cdsMarketplaceprecovendacargo_m_p_f.asCurrency - cdsMarketplaceprecovendacargo.AsCurrency;

  vfatormarkproduto := vDif * 100 / cdsMarketplaceprecovendacargo.AsCurrency;

  if cdsMarketplaceprecovendacargo.AsCurrency <> 0 then
    vfatormarkproduto := vDif * 100 / cdsMarketplaceprecovendacargo.AsCurrency;
//    vfatormarkproduto :=  100 - ((vprecovendacargo_m_p_f*100)/cdsMarketplaceprecovendacargo.AsCurrency);

  cdsMarketplacefatormarkproduto.asCurrency := vfatormarkproduto;

end;
*)

procedure TdtmManutencaoPreco.cdsMarketplace_nnnnnFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if cdsMarketplace.filtered then
    Accept := cdsMarketplacenomecampocalculado.asString <> vNomeCalculado;
end;

procedure TdtmManutencaoPreco.cdsMarketplaceCalcFields(DataSet: TDataSet);
var
 vDBAdvGrid: tDBAdvGrid;
 i: integer;

begin
  inherited;
  if dataset.active then
//    if dataset.state = dsInternalCalc then
    if dataset.state = dsCalcFields then
    begin
      if not vCopiandoCampoCalculado then
        dsrMarketplace.onDataChange := nil;

      AtribuirValoresCamposCalculados(false);

      if not vCopiandoCampoCalculado then
        dsrMarketplace.onDataChange := dsrMarketplaceDataChange;

        (*
      if not vCopiandoCampoCalculado then
      begin
        try

        cdsMarketplace.onCalcFields := nil;

        vDBAdvGrid := TDBAdvGrid(self.owner.findcomponent('dbgMarketPlace'));
        if (vDBAdvGrid.colcount-1) > 1 then
        begin
          if cdsMarketplaceprecovenda.asCurrency <>
             cdsMarketplacepreconormal.asCurrency then
               vDBAdvGrid.CellProperties[vDBAdvGrid.ColumnByFieldName['precovenda'].Index, cdsMarketplace.recno].BrushColor := clYellow;

                  {
          if cdsMarketplacealterado.asBoolean then
          begin
            for i:= vDBAdvGrid.ColumnByFieldName['descricaomarketplace'].Index  to vDBAdvGrid.colcount-1 do
            begin
              if cdsMarketplacealterado.asBoolean then
                vDBAdvGrid.CellProperties[i, cdsMarketplace.recno].FontStyle := [fsBold]
              else
                vDBAdvGrid.CellProperties[i, cdsMarketplace.recno].FontStyle := [];

            end;
          end;
                  }
        end;
        finally
          cdsMarketplace.onCalcFields := cdsMarketplaceCalcFields;
        end;
      end;
         *)

    end;

end;

procedure TdtmManutencaoPreco.cdsMarketplaceAfterEdit(DataSet: TDataSet);
begin
  inherited;
  EditandoMKP := true;
end;

procedure TdtmManutencaoPreco.cdsMarketplaceFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if cdsMarketplace.filtered then
    Accept := cdsMarketplacenomecampocalculado.asString <> vNomeCalculado;

end;

procedure TdtmManutencaoPreco.cdsMarketplaceAfterOpen(DataSet: TDataSet);
begin
  inherited;
;
end;

function TdtmManutencaoPreco.MarketPlacecomRegistros: Boolean;
begin
  if not qryTabelaMarketplace.active then
    qryTabelaMarketplace.active := True;
    
  result := qryTabelaMarketplace.recordcount <> 0
end;

procedure TdtmManutencaoPreco.qryProcuraColunasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
;
end;

function TdtmManutencaoPreco.comissao_manutencao_preco(pPercComissao: Currency;
  pvalorBaseComissao: Currency; pNomeVendedor: String): Currency;
var
  vComissao : Currency;
begin

  { DEMOOOOORA SER FOR NO BANCO
  RefazConsultaPorNome(qrycomissao_manutencao_preco,
    ['pPercComissao','pvalorBaseComissao', 'pNomeVendedor'],
    [pPercComissao, pvalorBaseComissao, pNomeVendedor], True);

  result := qrycomissao_manutencao_precocomissao.asCurrency;
  }

   vComissao:=0;

   vComissao:=(pPercComissao/100)*pValorBaseComissao;

   if (pos('SHOPEE',pNomeVendedor)<>0) AND (vComissao>100) THEN
     vComissao:=100
    {
   ELSE
   IF pos('MAGALU', pNomeVendedor)<>0  THEN
     vComissao:=vComissao+3};

   result := vComissao;



end;

function TdtmManutencaoPreco.Novo_Preco_Desejado(vComissao: Real): Variant;
begin
  result := Null;

  try

   if cdsMarketplaceprecotabelado.asBoolean then
     result := cdsMarketplaceprecovendacargo.asFloat
   else
     result := RoundTo (

                  (cdsMarketplacecusto_produto.asFloat +
                   cdsMarketplacecusto_frete.asFloat +
                   Adicional_Custo_Produto ) /

                  (1 - margem_final_desejada/100 -
                   (vComissao +

                   cdsMarketplacealiq_icms.asFloat

                   )/100)

                   , -2);
  except
    result := 0.00
  end;
end;

(*
function TdtmManutencaoPreco.Aliq_icms: Variant;
var
  vValor : String;

begin
  result := Null;

  if cdsMarketplaceregimetributario.asinteger = 1 then //Simples
  begin

    try
      vValor := TEditNumero(self.owner.FindComponent('edtPercentualSimples')).text;

      if vValor <> '' then
        result := strtoFloat(vValor)
      else
        result := 0.00;
    except
      result := 0.00;
    end;

    if not ((cdsMarketplacecsosn.asstring = '101') or
            (cdsMarketplacecsosn.asstring = '102') or
            (cdsMarketplacecsosn.asstring = '900')) then
      result := ((result * 66.5)/100);

  end
  else
  begin

    if (cdsMarketplacecst.asstring = '00') or
       (cdsMarketplacecst.asstring = '20') then {no momento a redução não esta sendo atribuida}
    begin
      try
        vValor := TEditNumero(self.owner.FindComponent('edtPercentualNormal')).text;
        if vValor <> '' then
          result := strtofloat(vValor)
        else
          result := 0.00;
      except
        result := 0.00
      end;

    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;
*)



{

FatorMarkProduto
ValorMarkProduto
precovendacargo_m_p_f

}

function TdtmManutencaoPreco.Getmargem_final_desejada: Currency;
begin
  if not cdsMarketplacemargem_final_desejada_pm.isnull then
    fmargem_final_desejada := cdsMarketplacemargem_final_desejada_pm.ascurrency
  else
    fmargem_final_desejada := cdsMarketplacemargem_final_desejada_mk.ascurrency;

  Result := fmargem_final_desejada;
end;

procedure TdtmManutencaoPreco.AtualizarMarketPlace_Margem_Final_Desejada_pm;
var
  vcdsMarketplacecodigo,
  vcdsMarketplacemargem_final_desejada_pm : String;

begin
  vcdsMarketplacecodigo := cdsMarketplacecodigo_produto_marketplace.asString;
  vcdsMarketplacemargem_final_desejada_pm := cdsMarketplacemargem_final_desejada_pm.AsString;

  IndexCodigomkpproduto := produto_marketplace[marketplace_codigo].IndexOf(
            vcdsMarketplacecodigo);

  if IndexCodigomkpproduto = -1 then
  begin

    produto_marketplace[marketplace_codigo].Add(vcdsMarketplacecodigo);
    produto_marketplace[marketplace_margem_final_desejada].Add(vcdsMarketplacemargem_final_desejada_pm);
    IndexCodigomkpproduto:= produto_marketplace[marketplace_codigo].IndexOf(vcdsMarketplacecodigo);

  end
  else
  begin
    if (produto_marketplace[marketplace_margem_final_desejada].Strings[IndexCodigomkpproduto] <> vcdsMarketplacemargem_final_desejada_pm) then
        produto_marketplace[marketplace_margem_final_desejada].Strings[IndexCodigomkpproduto] := vcdsMarketplacemargem_final_desejada_pm;
  end;

  cdsMarketplace.edit;
  cdsMarketplacealterado.AsBoolean := true;
  cdsMarketplace.post;

  {
  if cdsMarketplacenovo_preco_desejado.asCurrency <> novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asCurrency) then
  begin
    cdsMarketplace.edit;
    cdsMarketplacenovo_preco_desejado.asCurrency := novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asCurrency);
    cdsMarketplace.post;
  end;
  }

end;

function TdtmManutencaoPreco.Marketplacemargem_final_desejada: Variant;
begin


 try


   result := {RoundTo(} (100 * (cdsMarketplacenovo_preco_desejado.asCurrency -
                    (cdsMarketplaceperccomissao_recalculado.asCurrency +
                     cdsMarketplacealiq_icms.asCurrency) / 100 *
                     cdsMarketplacenovo_preco_desejado.asCurrency -
                     cdsMarketplacecusto_produto.asCurrency -
                     Adicional_Custo_Produto -
                     cdsMarketplacecusto_frete.asCurrency) / cdsMarketplacenovo_preco_desejado.asCurrency){, 0)};


  except
    result := 0.00
  end;

end;

procedure TdtmManutencaoPreco.AtualizarMarketPlace_Margem_Final_Desejada_mk;
var
  vcdsMarketplacecodigo,
  vcdsMarketplacemargem_final_desejada_mk : String;
  vRegistroAtual : TBookMark;

begin
  vcdsMarketplacecodigo := cdsMarketplacecodigo.asString;
  vcdsMarketplacemargem_final_desejada_mk := cdsMarketplacemargem_final_desejada_mk.AsString;
  IndexCodigomkp := marketplace[marketplace_codigo].IndexOf(vcdsMarketplacecodigo);

  if IndexCodigomkp = -1 then
  begin
    marketplace[marketplace_codigo].Add(vcdsMarketplacecodigo);
    marketplace[marketplace_margem_final_desejada].Add(vcdsMarketplacemargem_final_desejada_mk);
    IndexCodigomkp := marketplace[marketplace_codigo].IndexOf(vcdsMarketplacecodigo);
  end
  else
  begin
    if (marketplace[marketplace_margem_final_desejada].Strings[IndexCodigomkp] <> vcdsMarketplacemargem_final_desejada_mk) then
        marketplace[marketplace_margem_final_desejada].Strings[IndexCodigomkp] := vcdsMarketplacemargem_final_desejada_mk;
  end;


  vRegistroAtual := cdsMarketplace.getBookMark;
  cdsMarketplace.disableControls;
  cdsMarketplace.first;

  while not cdsMarketplace.eof do
  begin
    if (vcdsMarketplacecodigo = cdsMarketplacecodigo.asString) then
    begin
      cdsMarketplace.edit;
      cdsMarketplacemargem_final_desejada_mk.AsString := vcdsMarketplacemargem_final_desejada_mk;

      {
      if cdsMarketplacenovo_preco_desejado.asCurrency <> novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asCurrency) then
        cdsMarketplacenovo_preco_desejado.asCurrency := novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asCurrency);
        }

      cdsMarketplacealterado.AsBoolean := true;
      cdsMarketplace.post;

    end;

    cdsMarketplace.next;

  end;

  cdsMarketplace.enableControls;

  cdsMarketplace.gotoBookMark(vRegistroAtual);
  cdsMarketplace.freeBookMark(vRegistroAtual);

end;

procedure TdtmManutencaoPreco.AtualizarPrecoTabeladoMKP;
var
 RegistroAtual : TBookMark;
begin
 RegistroAtual := cdsMarketplace.GetBookmark;
 cdsMarketplace.DisableControls;
 cdsMarketplace.First;
 While not cdsMarketplace.Eof do
 begin

   if (cdsMarketplacecaracteristica.asstring =  CaracteristicasAlteradasMKP[caracteristicam].strings[IndexMMKP]) then
   begin
     AtualizandoPrecos := True;
     cdsMarketplace.Edit;
     cdsMarketplaceprecotabelado.AsString := CaracteristicasAlteradasMKP[precotabelado].strings[indexMMKP];
     cdsMarketplacenovo_preco_desejado.AsFloat := novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asFloat);
     cdsMarketplace.post;

     AtualizandoPrecos := False;

   end;

   cdsMarketplace.Next;
 end;
 cdsMarketplace.GotoBookmark(RegistroAtual);
 cdsMarketplace.FreeBookmark(RegistroAtual);
 cdsMarketplace.enableControls;
end;

procedure TdtmManutencaoPreco.AtualizarMarketPlace_novo_preco_desejado;
var
//  vcdsMarketplacecodigo : String;
  vcdsMarketplacenovo_preco_desejado : Currency;

begin
{Marketplacemargem_final_desejada}

//  vcdsMarketplacecodigo := cdsMarketplacecodigo_produto_marketplace.asString;
  vcdsMarketplacenovo_preco_desejado := cdsMarketplacenovo_preco_desejado.AsCurrency;
  if vcdsMarketplacenovo_preco_desejado <> novo_preco_desejado(cdsMarketplaceperccomissao_recalculado.asFloat) then
    if cdsMarketplacemargem_final_desejada_pm.asCurrency <> Marketplacemargem_final_desejada then
    begin
      cdsMarketplace.edit;
      cdsMarketplacemargem_final_desejada_pm.asCurrency := Marketplacemargem_final_desejada;
      cdsMarketplacealterado.AsBoolean := true;
      cdsMarketplace.post;

      while vcdsMarketplacenovo_preco_desejado <> cdsMarketplacenovo_preco_desejado.AsCurrency do
      begin
        cdsMarketplace.edit;
        cdsMarketplacenovo_preco_desejado.AsCurrency := vcdsMarketplacenovo_preco_desejado;
//        cdsMarketplacemargem_final_desejada_pm.asCurrency := Marketplacemargem_final_desejada;
//        cdsMarketplacealterado.AsBoolean := true;
        if cdsMarketplace.state = dsedit then
          cdsMarketplace.post;
      end;

      AtualizarMarketPlace_Margem_Final_Desejada_pm;
    end;

end;

procedure TdtmManutencaoPreco.cdsMarketplaceBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cdsMarketplace.ParamByName('PercentualICMSSimples').asCurrency :=
    parsistema.AliquotaSimplesNacional;

  if ValoredtPercentualDesconto <> null then
    cdsMarketplace.ParamByName('PercentualDescontoInformado').asCurrency := ValoredtPercentualDesconto
  else
    cdsMarketplace.ParamByName('PercentualDescontoInformado').asCurrency := 0;

  if ValoredtPercentualDevolucaoDesconto <> null then
    cdsMarketplace.ParamByName('PercentualDevDescontoInformado').asCurrency := ValoredtPercentualDevolucaoDesconto
  else
    cdsMarketplace.ParamByName('PercentualDevDescontoInformado').asCurrency := 0;




end;

function TdtmManutencaoPreco.Comissao(vComissao: Currency): Variant;
begin
  result := null;

  if (vComissao  <> 0) and
     (cdsMarketplacenovo_preco_desejado.asFloat <> 0) and
     (cdsMarketplacedescricaomarketplace.asString<>'') then
  begin
    try

      result := comissao_manutencao_preco(vComissao,
                                 cdsMarketplacenovo_preco_desejado.asFloat,
                                 cdsMarketplacedescricaomarketplace.asString);

    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);
end;

function TdtmManutencaoPreco.perccomissao_recalculado: Variant;
begin
  result := null;

  if (cdsMarketplacecomissao.asfloat  <> 0) and
     (cdsMarketplacenovo_preco_desejado.asFloat <> 0) then
  begin
    try

      result := cdsMarketplacecomissao.asfloat * 100 / cdsMarketplacenovo_preco_desejado.asFloat

    except
       result := 0.00;
    end;
  end;

  if result <> null then
    result := Roundto(result, -2);

end;

function TdtmManutencaoPreco.Adicional_Custo_Produto: Real;
begin
    if pos('MAGALU', cdsMarketplacedescricaomarketplace.asString)<>0  THEN
      result := 5.00
    else
      result := 0.00;
end;

end.



