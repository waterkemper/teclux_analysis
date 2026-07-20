unit dmcadastrotabelasestoque;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, Qtypes, QMenus, Variants,
  //Terceiros
  ZQuery, ZPgSqlQuery, Math,
  //Biblio
  biblio, ctconstantes,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmbasico, ZTransact, fmmensagemgrid;

type
  TdtmCadastroTabelasEstoques = class(TdtmBasico)
    qryUnidades: TtecQuery;
    dsrUnidades: TtecDataSource;
    qryUnidadescodigo: TStringField;
    qryUnidadesdescricao: TStringField;
    dsrGrupos: TtecDataSource;
    qryGrupos: TtecQuery;
    qryClasses: TtecQuery;
    dsrClasses: TtecDataSource;
    qryClassescodigo: TStringField;
    qryClassesdescricao: TStringField;
    qryClassescomissao: TFloatField;
    qryClassestipocomissao: TStringField;
    qryClassesvendanegativa: TStringField;
    qryICMS: TtecQuery;
    dsrICMS: TtecDataSource;
    qryIPI: TtecQuery;
    dsrIPI: TtecDataSource;
    qryIPICodigo: TIntegerField;
    qryIPIDescricao: TStringField;
    qryIPIAliquota: TFloatField;
    qryObsLegaisNotas: TtecQuery;
    qryColunas: TtecQuery;
    dsrObsLegaisNotas: TtecDataSource;
    qryObsLegaisNotascodigo: TIntegerField;
    dsrColunas: TtecDataSource;
    qryColunascodigo: TIntegerField;
    qryColunasdescricao: TStringField;
    qryMarcas: TtecQuery;
    dsrMarcas: TtecDataSource;
    qryMarcascodigo: TIntegerField;
    qryMarcasdescricao: TStringField;
    qryMarcasinativo: TDateField;
    qryGruposcodigo: TStringField;
    qryGruposdescricao: TStringField;
    qryGruposcomissao: TFloatField;
    qryGrupostipocomissao: TStringField;
    qryGruposvendanegativa: TStringField;
    qryConsultaUnidades: TtecQuery;
    qryConsultaUnidadesdescricao: TStringField;
    qryConsultaUnidadescodigo: TStringField;
    qryConsultaGrupos: TtecQuery;
    qryConsultaGruposdescricao: TStringField;
    qryConsultaGruposcodigo: TStringField;
    qryConsultaClasses: TtecQuery;
    qryConsultaClassesdescricao: TStringField;
    qryConsultaClassescodigo: TStringField;
    qryConsultaICMS: TtecQuery;
    qryConsultaICMSdescricao: TStringField;
    qryConsultaICMScodigo: TIntegerField;
    qryConsultaIPI: TtecQuery;
    qryConsultaIPIdescricao: TStringField;
    qryConsultaIPIcodigo: TIntegerField;
    qryConsultaObsLegais: TtecQuery;
    qryConsultaObsLegaisdescricao: TStringField;
    qryConsultaObsLegaiscodigo: TIntegerField;
    qryConsultaColunas: TtecQuery;
    qryConsultaColunasdescricao: TStringField;
    qryConsultaColunascodigo: TIntegerField;
    qryConsultaMarcas: TtecQuery;
    qryConsultaMarcasdescricao: TStringField;
    qryConsultaMarcascodigo: TIntegerField;
    dsrProcuraClasses: TtecDataSource;
    qryProcuraClasses: TtecQuery;
    qryProcuraClassescodigo: TStringField;
    qryProcuraClassesdescricao: TStringField;
    qryICMScodigo: TIntegerField;
    qryICMSdescricao: TStringField;
    dsrEstadosICMS: TtecDataSource;
    spcIPIProximo: TtecQuery;
    spcObsLegaisProximo: TtecQuery;
    spcColunasProximo: TtecQuery;
    spcMarcasProximo: TtecQuery;
    spcColunasProximocodigo: TIntegerField;
    spcMarcasProximocodigo: TIntegerField;
    spcObsLegaisProximocodigo: TIntegerField;
    spcIPIProximocodigo: TIntegerField;
    qryExisteEstadosICMS: TtecQuery;
    spcICMSProximo: TtecQuery;
    spcICMSProximocodigo: TIntegerField;
    qryICMSEstados: TtecQuery;
    qryICMSEstadosvalor: TFloatField;
    qryICMSEstadosestado: TStringField;
    qryICMSEstadosnome: TStringField;
    qryEstados: TtecQuery;
    qryEstadoscodigo: TStringField;
    qryEstadosnome: TStringField;
    qryICMSEstadosicms: TIntegerField;
    spcICMSEstadosSincronizar: TtecQuery;
    qryGruposFornecedores: TtecQuery;
    qryConsultaGruposFornecedores: TtecQuery;
    dsrGruposFornecedores: TtecDataSource;
    qryConsultaGruposFornecedorescodigo: TIntegerField;
    qryConsultaGruposFornecedoresnome: TStringField;
    qryGruposFornecedorescodigo: TIntegerField;
    qryGruposFornecedoresnome: TStringField;
    spcGruposFornecedoresProximo: TtecQuery;
    spcGruposFornecedoresProximocodigo: TIntegerField;
    qryICMStipo: TStringField;
    qryIPIClassificacaoFiscal: TStringField;
    qryGruposmarkup: TFloatField;
    qryFatoresPreco: TtecQuery;
    dsrFatoresPreco: TtecDataSource;
    qryConsultaFatoresPreco: TtecQuery;
    qryFatoresPrecocodigo: TStringField;
    qryFatoresPrecodescricao: TStringField;
    qryConsultaFatoresPrecodescricao: TStringField;
    qryConsultaFatoresPrecocodigo: TStringField;
    qryConsultaIPIclassificacaofiscal: TStringField;
    qryGruposmultiplo: TFloatField;
    qryClassesmultiplo: TFloatField;
    qryGruposcalcularpreco: TBooleanField;
    qryGrades: TtecQuery;
    qryGradescodigo: TIntegerField;
    qryGradesdescricao: TStringField;
    dsrGrades: TtecDataSource;
    qryElementosGrade: TtecQuery;
    qryElementosGradegrade: TIntegerField;
    qryElementosGradevalor: TStringField;
    qryElementosGradeemuso: TBooleanField;
    dsrElementosGrade: TtecDataSource;
    qryConsultaGrades: TtecQuery;
    qryConsultaGradescodigo: TIntegerField;
    qryConsultaGradesdescricao: TStringField;
    spcGradesProximo: TtecQuery;
    spcGradesProximocodigo: TIntegerField;
    qryGruposnaoreplicar: TBooleanField;
    qryClassesnaoreplicar: TBooleanField;
    qryElementosGradeusual: TBooleanField;
    qryElementosGradeordem: TIntegerField;
    dsrEstadosIPI: TtecDataSource;
    qryEstadosIPI: TtecQuery;
    qryEstadosIPIipi: TIntegerField;
    qryEstadosIPIEstado: TStringField;
    qryEstadosIPIAtivo: TBooleanField;
    qryEstadosIPINome: TStringField;
    qryGruposplanilhacustos: TBooleanField;
    qryIPIGenero: TIntegerField;
    qryIPIExTIPI: TStringField;
    qryEstadosIPIFatorSubstituicao: TFloatField;
    qryObsLegaisNotasdescricao: TStringField;
    qryObsLivrosFiscais: TtecQuery;
    dsrObsLivrosFiscais: TtecDataSource;
    qryObsLivrosFiscaiscodigo: TIntegerField;
    qryObsLivrosFiscaisdescricao: TStringField;
    spcObsLivrosFiscais: TtecQuery;
    qryConsultaObsLivrosFiscais: TtecQuery;
    qryConsultaObsLivrosFiscaiscodigo: TIntegerField;
    qryConsultaObsLivrosFiscaisdescricao: TStringField;
    spcObsLivrosFiscaiscodigo: TIntegerField;
    qryEstadosIPIMVA: TFloatField;
    qryModelos: TtecQuery;
    dsrModelos: TtecDataSource;
    qryModelosespecificacao: TStringField;
    qryModelosobservacao: TStringField;
    qryConsultaModelos: TtecQuery;
    qryConsultaModelosespecificacao: TStringField;
    qryModelosdescricao: TStringField;
    qryModeloscodigo: TIntegerField;
    qryConsultaModelosdescricao: TStringField;
    qryConsultaModeloscodigo: TIntegerField;
    spcModelosProximo: TtecQuery;
    spcModelosProximocodigo: TIntegerField;
    qryGruposComissoes: TtecQuery;
    dsrGruposComissoes: TtecDataSource;
    qryGruposComissoesgrupo: TStringField;
    qryGruposComissoesnumero: TIntegerField;
    qryGruposComissoestipocomissao: TStringField;
    qryGruposComissoeslimite: TFloatField;
    qryGruposComissoescomissao: TFloatField;
    qryGruposinativo: TDateField;
    qryGruposdepreciacao: TFloatField;
    qryIPINCMIsentoPISCOFINS: TBooleanField;
    qryEstadosIPIpercreducaomva: TFloatField;
    qryElementosGradecor: TStringField;
    qryGruposEmExposicao: TBooleanField;
    qryGruposumaetiquetaporbalcao: TBooleanField;
    qryGruposexigenumeroserie: TBooleanField;
    qryGruposobservacoesvenda: TStringField;
    qryMarcasobservacoesvenda: TStringField;
    dsrGruposAgendamentos: TtecDataSource;
    qryGruposAgendamentos: TtecQuery;
    qryGruposAgendamentosgrupo: TStringField;
    qryGruposAgendamentosdias: TIntegerField;
    qryGruposAgendamentosobservacoes: TStringField;
    qryPromocoes: TtecQuery;
    dsrPromocoes: TtecDataSource;
    qryPromocoescodigo: TIntegerField;
    qryPromocoesdescricao: TStringField;
    qryPromocoesvalidade: TDateField;
    qryConsultaPromocoes: TtecQuery;
    spcPromocoesProximo: TtecQuery;
    spcPromocoesProximocodigo: TIntegerField;
    qryConsultaPromocoescodigo: TIntegerField;
    qryConsultaPromocoesdescricao: TStringField;
    qryConsultaPromocoesvalidade: TDateField;
    qryPromocoesobservacoesvenda: TStringField;
    qryClassesobservacoesvenda: TStringField;
    qryClassesAgendamentos: TtecQuery;
    dsrClassesAgendamentos: TtecDataSource;
    qryClassesAgendamentosclasse: TStringField;
    qryClassesAgendamentosdias: TIntegerField;
    qryClassesAgendamentosobservacoes: TStringField;
    qryMarcasAgendamentos: TtecQuery;
    dsrMarcasAgendamentos: TtecDataSource;
    qryMarcasAgendamentosmarca: TIntegerField;
    qryMarcasAgendamentosdias: TIntegerField;
    qryMarcasAgendamentosobservacoes: TStringField;
    qryPromocoesdeny_discount: TBooleanField;
    qryGruposobservacoesentrada: TStringField;
    qryGradesnome_site: TStringField;
    qryElementosGradenome_site: TStringField;
    qryExisteSTConflitante: TtecQuery;
    qryExisteSTConflitantecodigovisual: TStringField;
    qryExisteSTConflitanteipi: TIntegerField;
    qryExisteSTConflitantecst: TStringField;
    qryExisteSTConflitantecsosn: TStringField;
    dsrExisteSTConflitante: TtecDataSource;
    qryCashBack: TtecQuery;
    dsrCashBack: TtecDataSource;
    spcCashBackProximo: TtecQuery;
    qryCashBackcodigo: TIntegerField;
    qryCashBackdescricao: TStringField;
    qryCashBackvalidadeinicial: TDateTimeField;
    qryCashBackvalidadefinal: TDateTimeField;
    qryCashBackvalidadedosaldo: TIntegerField;
    qryCashBacktipo: TStringField;
    qryCashBackcompraminima: TFloatField;
    qryCashBackvalorcashback: TFloatField;
    qryProcuraCashBack: TtecQuery;
    dsrProcuraCashBack: TtecDataSource;
    qryConsultaCashBack: TtecQuery;
    qryProcuraCashBackcodigo: TIntegerField;
    qryProcuraCashBackdescricao: TStringField;
    qryProcuraCashBackvalidadeinicial: TDateTimeField;
    qryProcuraCashBackvalidadefinal: TDateTimeField;
    qryProcuraCashBackvalidadedosaldo: TIntegerField;
    qryProcuraCashBacktipo: TStringField;
    qryProcuraCashBackcompraminima: TFloatField;
    qryProcuraCashBackvalorcashback: TFloatField;
    qryConsultaCashBackcodigo: TIntegerField;
    qryConsultaCashBackdescricao: TStringField;
    qryConsultaCashBackvalidadeinicial: TDateTimeField;
    qryConsultaCashBackvalidadefinal: TDateTimeField;
    qryConsultaCashBackvalidadedosaldo: TIntegerField;
    qryConsultaCashBacktipo: TStringField;
    qryConsultaCashBackcompraminima: TFloatField;
    qryConsultaCashBackvalorcashback: TFloatField;
    spcCashBackProximocodigo: TLargeintField;
    qryCashBackProdutos: TtecQuery;
    dsrCashBackProdutos: TtecDataSource;
    qryCashBackProdutoscashback: TIntegerField;
    qryCashBackProdutosproduto: TLargeintField;
    qryCashBackProdutosdescricaoproduto: TStringField;
    qryCashBackProdutosprodutovisual: TStringField;
    qryCashBackGrupos: TtecQuery;
    dsrCashBackGrupos: TtecDataSource;
    qryCashBackClasses: TtecQuery;
    dsrCashBackClasses: TtecDataSource;
    qryCashBackMarcas: TtecQuery;
    dsrCashBackMarcas: TtecDataSource;
    qryCashBackGruposcashback: TIntegerField;
    qryCashBackGruposgrupo: TStringField;
    qryCashBackGruposdescricaogrupo: TStringField;
    qryCashBackClassescashback: TIntegerField;
    qryCashBackClassesclasse: TStringField;
    qryCashBackClassesdescricaoclasse: TStringField;
    qryCashBackMarcascashback: TIntegerField;
    qryCashBackMarcasmarca: TIntegerField;
    qryCashBackMarcasdescricaomarca: TStringField;
    qryAtributos_Produtos: TtecQuery;
    dsrAtributos_Produtos: TtecDataSource;
    qryAtributos_Produtoscodigo: TLargeintField;
    qryAtributos_Produtosdescricao: TStringField;
    qryAtributos_Produtosatributos: TStringField;
    qryAtributos_Produtos_Items: TtecQuery;
    dsrAtributos_Produtos_Items: TtecDataSource;
    qryAtributos_Produtos_Itemsnome: TStringField;
    qryAtributos_Produtos_Itemsdescricao: TStringField;
    qryAtributos_Produtos_Itemstipo: TStringField;
    spcAtributos_Produtos_Proximo: TtecQuery;
    spcAtributos_Produtos_Proximocodigo: TLargeintField;
    qryAtributos_Produtos_Itemsnome_anterior: TStringField;
    qryCashBackdisponibilidadedosaldo: TIntegerField;
    qryCashBackCargos: TtecQuery;
    dsrCashBackCargos: TtecDataSource;
    qryCashBackCargoscashback: TIntegerField;
    qryCashBackCargoscargo: TIntegerField;
    qryCashBackCargosdescricaocargo: TStringField;
    qryCashBackFiliais: TtecQuery;
    dsrCashBackFiliais: TtecDataSource;
    qryCashBackFiliaiscashback: TIntegerField;
    qryCashBackFiliaisfilial: TIntegerField;
    qryCashBackFiliaisnomefilial: TStringField;
    qryCashBacksite: TStringField;
    qryColunasdisponivelfrentecaixa: TBooleanField;
    qryConsultaColunasdisponivelfrentecaixa: TBooleanField;
    qryCashBackProdutosexceto: TBooleanField;
    qryCashBackGruposexceto: TBooleanField;
    qryCashBackClassesexceto: TBooleanField;
    qryCashBackMarcasexceto: TBooleanField;
    qryCashBackCargosexceto: TBooleanField;
    qryCashBackFiliaisexceto: TBooleanField;
    qryGruposclassificacao_vigilancia_sanitaria: TIntegerField;
    qryICMSInterEstadual: TtecQuery;
    dsrICMSInterEstadual: TtecDataSource;
    qryICMSInterEstadualestado: TStringField;
    qryICMSInterEstadualaliquota: TFloatField;
    qryICMSInterEstadualnome: TStringField;
    procedure qryICMSAfterScroll(DataSet: TDataSet);
    procedure qryICMSEstadosAfterInsert(DataSet: TDataSet);
    procedure qryICMSEstadosBeforeEdit(DataSet: TDataSet);
    procedure qryGruposNewRecord(DataSet: TDataSet);
    procedure qryClassesNewRecord(DataSet: TDataSet);
    procedure qryICMSAfterInsert(DataSet: TDataSet);
    procedure dsrEstadosICMSDataChange(Sender: TObject; Field: TField);
    procedure qryElementosGradeNewRecord(DataSet: TDataSet);
    procedure qryElementosGradeBeforePost(DataSet: TDataSet);
    procedure qryGradesAfterOpen(DataSet: TDataSet);
    procedure qryElementosGradeBeforeEdit(DataSet: TDataSet);
    procedure qryElementosGradeBeforeDelete(DataSet: TDataSet);
    procedure qryElementosGradeAfterInsert(DataSet: TDataSet);
    procedure qryIPIAfterScroll(DataSet: TDataSet);
    procedure qryEstadosIPIAfterInsert(DataSet: TDataSet);
    procedure qryEstadosIPIBeforeEdit(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryEstadosIPIBeforePost(DataSet: TDataSet);
    procedure qryGruposAfterScroll(DataSet: TDataSet);
    procedure qryGruposComissoesAfterDelete(DataSet: TDataSet);
    procedure qryGruposComissoesAfterPost(DataSet: TDataSet);
    procedure qryGruposComissoesNewRecord(DataSet: TDataSet);
    procedure qryIPINewRecord(DataSet: TDataSet);
    procedure qryGruposAgendamentosNewRecord(DataSet: TDataSet);
    procedure qryGruposAgendamentosAfterPost(DataSet: TDataSet);
    procedure qryGruposAgendamentosAfterDelete(DataSet: TDataSet);
    procedure qryClassesAgendamentosAfterDelete(DataSet: TDataSet);
    procedure qryClassesAgendamentosAfterPost(DataSet: TDataSet);
    procedure qryClassesAgendamentosNewRecord(DataSet: TDataSet);
    procedure qryClassesAfterScroll(DataSet: TDataSet);
    procedure qryMarcasAfterScroll(DataSet: TDataSet);
    procedure qryMarcasAgendamentosAfterDelete(DataSet: TDataSet);
    procedure qryMarcasAgendamentosAfterPost(DataSet: TDataSet);
    procedure qryMarcasAgendamentosNewRecord(DataSet: TDataSet);
    procedure qryCashBackNewRecord(DataSet: TDataSet);
    procedure qryCashBackAfterScroll(DataSet: TDataSet);
    procedure qryCashBackProdutosAfterPost(DataSet: TDataSet);
    procedure qryCashBackProdutosNewRecord(DataSet: TDataSet);
    procedure qryCashBackAfterInsert(DataSet: TDataSet);
    procedure qryCashBackGruposNewRecord(DataSet: TDataSet);
    procedure qryCashBackClassesNewRecord(DataSet: TDataSet);
    procedure qryCashBackMarcasNewRecord(DataSet: TDataSet);
    procedure qryAtributos_ProdutosAfterScroll(DataSet: TDataSet);
    procedure qryAtributos_Produtos_ItemsAfterDelete(DataSet: TDataSet);
    procedure qryAtributos_Produtos_ItemsAfterPost(DataSet: TDataSet);
    procedure qryCashBackCargosNewRecord(DataSet: TDataSet);
    procedure qryCashBackFiliaisNewRecord(DataSet: TDataSet);
    procedure qryColunasNewRecord(DataSet: TDataSet);
    procedure qryICMSInterEstadualBeforeOpen(DataSet: TDataSet);
    procedure qryICMSEstadosAfterScroll(DataSet: TDataSet);
    procedure qryICMSInterEstadualAfterScroll(DataSet: TDataSet);
  private
    NumeroGrupoComissoes : Integer;
    function GetConsultarFatoresPreco: TZDataset;
    function GetTabelaFatoresPreco: TZDataset;
    function getConsultarGrade: TtecQuery;
    function getTabelaGrade: TtecQuery;
    procedure GerarEstadosIPI(IncluirIPI: Boolean);
    function GetCodigoConsultaObsLivrosFiscais: String;
    procedure EditarGrupos;
    procedure EditarClasses;
    procedure Editarmarcas;

    function GetTabelaPromocoes: TZDataSet;
    function GetCodigoConsultaPromocao: String;
    function GetConsultarPromocoes: TtecQuery;
    function GetCodigoConsultaCashBack: String;

  protected
    function  GetCodigoConsultaClasses: String;
    function  GetCodigoConsultaColunas: String;
    function  GetCodigoConsultaGrupos: String;
    function  GetCodigoConsultaICMS: String;
    function  GetCodigoConsultaIPI: String;
    function  GetCodigoConsultaObsLegais: String;
    function  GetCodigoConsultaMarcas: String;
    function  GetCodigoConsultaGruposFornecedores: String;
    function  GetCodigoConsultaUnidades: String;
    function  GetConsultarClasses: TtecQuery;
    function  GetConsultarColunas: TtecQuery;
    function  GetConsultarGrupos: TtecQuery;
    function  GetConsultarObsLegais: TtecQuery;
    function  GetConsultarICMS: TtecQuery;
    function  GetConsultarIPI: TtecQuery;
    function  GetConsultarMarcas: TtecQuery;
    function  GetConsultarGruposFornecedores: TtecQuery;
    function  GetConsultarUnidades: TtecQuery;
    function  GetTabelaClasses: TZDataSet;
    function  GetTabelaColunas: TZDataSet;
    function  GetTabelaGrupos: TZDataSet;
    function  GetTabelaICMS: TZDataSet;
    function  GetTabelaIPI: TZDataSet;
    function  GetTabelaMarcas: TZDataSet;
    function  GetTabelaGruposFornecedores: TZDataSet;
    function  GetTabelaObsLegais: TZDataSet;
    function  GetTabelaUnidades: TZDataSet;
  public
    constructor Create(AOwner: TComponent); override;
    function ExisteEstadosICMS(Estado:String): Boolean;
    function ExisteClasses(campo, codigo: String): Boolean;
    function ExisteColunas(campo, codigo: String): Boolean;
    function ExistePromocao(campo, codigo: String): Boolean;

    function ExisteGrade(campo, codigo: String): Boolean;
    function ExisteGrupos(campo, codigo: String): Boolean;
    function ExisteICMS(campo, codigo: String): Boolean;
    function ExisteIPI(campo, codigo: String): Boolean;
    function ExisteMarcas(campo, codigo: String): Boolean;
    function ExisteModelos(campo, codigo: String): Boolean;
    function ExisteGruposFornecedores(campo, codigo: String) : Boolean;
    function ExisteFatoresPreco(campo, codigo: String) : Boolean;
    function ExisteObsLegais(campo, codigo: String): Boolean;
    function ExisteLivrosFiscais(campo, codigo: String): Boolean;
    function ExisteUnidades(campo, codigo: String): Boolean;
    function ExcluirClasses: Boolean;
    function ExcluirColunas: Boolean;
    function ExcluirPromocoes: Boolean;

    function ExcluirCashBack: Boolean;


    function ExcluirGrade: Boolean;
    function ExcluirElementoGrade: Boolean;
    function ExcluirGrupos: Boolean;
    function ExcluirICMS: Boolean;
    function ExcluirIPI: Boolean;
    function ExcluirMarcas: Boolean;
    function ExcluirModelos: Boolean;
    function ExcluirGruposFornecedores: Boolean;
    function ExcluirFatoresPreco: Boolean;
    function ExcluirAtributos_Produtos: Boolean;

    function ExcluirObsLegaisNotas: Boolean;
    function ExcluirObsLegaisLivros: Boolean;
    function ExcluirUnidades: Boolean;
    function GravarClasses: Boolean;
    function GravarColunas: Boolean;
    function GravarPromocoes: Boolean;

    function GravarCashBack: Boolean;


    function GravarGrade: Boolean;
    function GravarGrupos: Boolean;
    function SalvarGruposComissoes: boolean;

    function GravarICMS: Boolean;
    function GravarIPI: Boolean;
    function GravarMarcas: Boolean;
    function GravarModelos: Boolean;

    function GravarGruposFornecedores: Boolean;
    function GravarFatoresPreco: Boolean;
    function GravarAtributos_Produtos: Boolean;

    function GravarObsLegaisNotas: Boolean;
    function GravarObsLegaisLivros: Boolean;
    function GravarUnidades: Boolean;
    function IncluirClasses: Boolean;
    function IncluirColunas: Boolean;
    function IncluirPromocoes: Boolean;

    function IncluirCashBack: Boolean;
    function IncluirAtributos_Produtos: Boolean;

    function IncluirGrade: Boolean;
    function IncluirGrupos: Boolean;
    function IncluirICMS: Boolean;
    function IncluirIPI: Boolean;
    function IncluirMarcas: Boolean;
    function IncluirModelos: Boolean;
    function IncluirGruposFornecedores: Boolean;
    function IncluirFatoresPreco: Boolean;
    function IncluirObsLegais: Boolean;
    function IncluirObsLivrosFiscais: Boolean;
    function IncluirUnidades: Boolean;
    procedure ReplicarValoresICMS;
    procedure SincronizarICMSEstados(Valor: Real);
    procedure AbrirTabelasCadastro(Tabela: TtecTabelasEstoque);
    procedure AbrirTabelasConsulta(Tabela: TtecTabelasEstoque);
    procedure FecharTabelasConsulta(Tabela: TtecTabelasEstoque);
    procedure SelecionarMultiplas(Tabela: TtecTabelasEstoque; Pesquisa: TtecPesquisa);
    property TabelaClasses: TZDataSet read GetTabelaClasses;
    property TabelaColunas: TZDataSet read GetTabelaColunas;
    property TabelaPromocoes: TZDataSet read GetTabelaPromocoes;
    property TabelaGrade: TtecQuery read getTabelaGrade;
    property TabelaGrupos: TZDataSet read GetTabelaGrupos;
    property TabelaICMS: TZDataSet read GetTabelaICMS;
    property TabelaIPI: TZDataSet read GetTabelaIPI;
    property TabelaMarcas: TZDataSet read GetTabelaMarcas;
    property TabelaGruposFornecedores: TZDataSet read GetTabelaGruposFornecedores;
    property TabelaFatoresPreco: TZDataset read GetTabelaFatoresPreco;
    property TabelaObsLegais: TZDataSet read GetTabelaObsLegais;
    property TabelaUnidades: TZDataSet read GetTabelaUnidades;
    property CodigoConsultaClasses: String read GetCodigoConsultaClasses;
    property CodigoConsultaColunas: String read GetCodigoConsultaColunas;
    property CodigoConsultaPromocao: String read GetCodigoConsultaPromocao;
    property CodigoConsultaCashBack: String read GetCodigoConsultaCashBack;


    property CodigoConsultaGrupos: String read GetCodigoConsultaGrupos;
    property CodigoConsultaICMS: String read GetCodigoConsultaICMS;
    property CodigoConsultaIPI: String read GetCodigoConsultaIPI;
    property CodigoConsultaMarcas: String read GetCodigoConsultaMarcas;
    property CodigoConsultaGruposFornecedores: String read GetCodigoConsultaGruposFornecedores;
    property CodigoConsultaObsLegais: String read GetCodigoConsultaObsLegais;
    property CodigoConsultaObsLivrosFiscais: String read GetCodigoConsultaObsLivrosFiscais;
    property CodigoConsultaUnidades: String read GetCodigoConsultaUnidades;
    property ConsultarClasses: TtecQuery read GetConsultarClasses;
    property ConsultarColunas: TtecQuery read GetConsultarColunas;
    property ConsultarPromocoes: TtecQuery read GetConsultarPromocoes;

    property ConsultarGrade: TtecQuery read getConsultarGrade;
    property ConsultarGrupos: TtecQuery read GetConsultarGrupos;
    property ConsultarICMS: TtecQuery read GetConsultarICMS;
    property ConsultarIPI: TtecQuery read GetConsultarIPI;
    property ConsultarMarcas: TtecQuery read GetConsultarMarcas;
    property ConsultarGruposFornecedores: TtecQuery read GetConsultarGruposFornecedores;
    property ConsultarFatoresPreco: TZDataset read GetConsultarFatoresPreco;
    property ConsultarObsLegais: TtecQuery read GetConsultarObsLegais;
    property ConsultarUnidades: TtecQuery read GetConsultarUnidades;
    procedure marcarusual;
    procedure SelecionarEstadoIpi;
    procedure AtualizarGruposComissoes(Operacao: String);
    procedure ExcluirGruposComissoes;
    procedure IncluirGruposComissoes(Final: Boolean);
    procedure ExcluirGruposAgendamentos;
    procedure ExcluirClassesAgendamentos;
    procedure ExcluirMarcasAgendamentos;

    procedure ExcluirCashBackProdutos;
    procedure ExcluirCashBackGrupos;
    procedure ExcluirCashBackClasses;
    procedure ExcluirCashBackMarcas;
    procedure ExcluirCashBackCargos;
    procedure ExcluirCashBackFiliais;


    procedure ExcluirAtributos_Produtos_Items;





  end;

var
  dtmCadastroTabelasEstoques: TdtmCadastroTabelasEstoques;

implementation

uses
  //Terceiros
  ZSqlTypes,
  //Repositorio
  dmtecsoft;

{$R *.dfm}

constructor TdtmCadastroTabelasEstoques.Create(AOwner: TComponent);
begin
  inherited;

  qryICMSInterEstadual.Tag := ctTabelas;

  qryGrades.Tag := ctTabelaGrades;
  qryElementosGrade.Tag := ctTabelaGrades;
  qryGrupos.Tag := ctTabelaGrupos;
  qryUnidades.Tag := ctTabelaUnidades;
  qryObsLegaisNotas.Tag := ctTabelaObsLegaisNotas;
  qryObsLivrosFiscais.Tag := ctTabelaObsLegaisLivros;
  qryColunas.Tag := ctTabelaColunas;

  qryClasses.Tag := ctTabelaClasses;
  qryICMS.Tag := ctTabelaICMS;
  qryICMSEstados.Tag := ctTabelaICMS;

  qryIPI.Tag := ctTabelaIPI;
  qryEstadosIPI.Tag := ctTabelaIPI;
  qryMarcas.Tag := ctTabelaMarcas;
  qryFatoresPreco.Tag:= ctTabelaFatoresPreco;
  qryGruposFornecedores.Tag:= ctTabelaGruposFornecedores;
  qryConsultaUnidades.Tag := ctConsultaUnidades;
  qryConsultaObsLegais.Tag := ctConsultaObsLegais;
  qryConsultaObsLivrosFiscais.Tag := ctConsultaObsLivrosFiscais;
  qryConsultaColunas.Tag := ctConsultaColunas;
  qryConsultaGrades.Tag := ctConsultaGrades;
  qryConsultaGrupos.Tag := ctConsultaGrupos;
  qryConsultaClasses.Tag := ctConsultaClasses;
  qryConsultaICMS.Tag := ctConsultaICMS;
  qryConsultaIPI.Tag := ctConsultaIPI;
  qryConsultaMarcas.Tag := ctConsultaMarcas;
  qryConsultaGruposFornecedores.Tag:= ctConsultaGruposFornecedores;
  qryConsultaFatoresPreco.Tag:= ctConsultaFatoresPreco;

  qryEstadosIPIfatorsubstituicao.DisplayFormat := '#.0000';
end;

function TdtmCadastroTabelasEstoques.ExcluirClasses: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a CLASSE'])) = smbOk then begin
    if not qryClasses.IsEmpty then
         qryClasses.Delete
    else qryClasses.Cancel;
    Perpetrar([qryClasses]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirColunas: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a COLUNA'])) = smbOk then begin
    if not qryColunas.IsEmpty then
         qryColunas.Delete
    else qryColunas.Cancel;
    Perpetrar([qryColunas]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirGrupos: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o GRUPO'])) = smbOk then begin
    if not qryGrupos.IsEmpty then
         qryGrupos.Delete
    else qryGrupos.Cancel;
    Perpetrar([qryGrupos]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirICMS: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o ICMS'])) = smbOk then begin
    if not qryICMS.IsEmpty then
         qryICMS.Delete
    else qryICMS.Cancel;
    Perpetrar([qryICMS]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirIPI: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o IPI'])) = smbOk then begin
    if not qryIPI.IsEmpty then
         qryIPI.Delete
    else qryIPI.Cancel;
    Perpetrar([qryIPI]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirMarcas: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a MARCA'])) = smbOk then begin
    if not qryMarcas.IsEmpty then
         qryMarcas.Delete
    else qryMarcas.Cancel;
    Perpetrar([qryMarcas]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirGruposFornecedores: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o GRUPO FORNECEDOR'])) = smbOk then begin
    if not qryGruposFornecedores.IsEmpty then
         qryGruposFornecedores.Delete
    else qryGruposFornecedores.Cancel;
    Perpetrar([qryGruposFornecedores]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirFatoresPreco: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o FATOR PREÇO'])) = smbOk then begin
    if not qryFatoresPreco.IsEmpty then
         qryFatoresPreco.Delete
    else qryFatoresPreco.Cancel;
    result := perpetrar([qryFatoresPreco]);
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirObsLegaisNotas: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a OBSERVAÇÃO LEGAL'])) = smbOk then begin
    if not qryObsLegaisNotas.IsEmpty then
         qryObsLegaisNotas.Delete
    else qryObsLegaisNotas.Cancel;
    Perpetrar([qryObsLegaisNotas]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirUnidades: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a UNIDADE'])) = smbOk then begin
    if not qryUnidades.IsEmpty then
         qryUnidades.Delete
    else qryUnidades.Cancel;
    Perpetrar([qryUnidades]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarClasses: Boolean;
begin
  Result:= False;
  if qryClasses.CheckRequiredFields then
  begin
    AtribuirChave(qryClassesAgendamentos, [qryClassesAgendamentosclasse], [qryClassescodigo]);
    qryClasses.Post;
    Perpetrar([qryClasses, qryClassesAgendamentos]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarColunas: Boolean;
begin
  Result:= False;
  if qryColunas.CheckRequiredFields then begin
    if qryColunas.State in [dsInsert] then begin
      spcColunasProximo.Open;
      qryColunascodigo.AsInteger:= spcColunasProximocodigo.AsInteger;
      spcColunasProximo.Close;
    end;
    qryColunas.Post;
    Perpetrar([qryColunas]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarGrupos: Boolean;
begin
  Result:= False;
  if qryGrupos.CheckRequiredFields then
  begin
    if SalvarGruposComissoes then
    begin
      AtribuirChave(qryGruposComissoes, [qryGruposComissoesgrupo], [qryGruposcodigo]);
      AtribuirChave(qryGruposAgendamentos, [qryGruposAgendamentosgrupo], [qryGruposcodigo]);
      qryGrupos.Post;
      Result := Perpetrar([qryGrupos, qrygruposComissoes, qryGruposAgendamentos]);
    end;
  end;
end;

function TdtmCadastroTabelasEstoques.GravarICMS: Boolean;
var
 Inserindo: Boolean;
begin
  Result:= False;
  Inserindo := qryICMS.State = dsInsert;
  if qryICMS.CheckRequiredFields then begin
    if Inserindo then begin
      spcICMSProximo.Open;
      qryICMScodigo.AsInteger := spcICMSProximocodigo.AsInteger;
      spcICMSProximo.Close;
    end;
    qryICMS.Post;
    if Inserindo then begin
      qryICMSEstados.DisableControls;
      try
        qryICMSEstados.First;
        while Not qryICMSEstados.Eof do
        begin
          qryICMSEstados.Edit;
          qryICMSEstadosicms.AsInteger := qryICMScodigo.AsInteger;
          qryICMSEstados.Next;
        end;
      finally
        qryICMSEstados.EnableControls
      end
    end;
    Perpetrar([qryICMS, qryICMSEstados]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarIPI: Boolean;
begin
  Result:= False;
  if qryIPI.CheckRequiredFields then
  begin
    if qryIPI.State = dsInsert then
    begin
      spcIPIProximo.Open;
      qryIPICodigo.AsInteger := spcIPIProximocodigo.AsInteger;
      spcIPIProximo.Close;
    end;
    qryIPI.Post;

    GuardarRegistroAtual(qryEstadosIPI,True);
    try
      qryEstadosIPI.First;
      while not qryEstadosIPI.Eof do
      begin
        qryEstadosIPI.Edit;
        qryEstadosIPIipi.AsInteger := qryIPICodigo.AsInteger;
        qryEstadosIPI.Post;
        qryEstadosIPI.Next;
      end;
    finally
      VoltarRegistroAtual(qryEstadosIPI);
    end;
    result := Perpetrar([qryIPI, qryEstadosIPI]);

    if result then
    begin
        RefazConsultaPorNome(qryExisteSTConflitante, ['ipi'], [qryipicodigo.asVariant]);
        if qryExisteSTConflitante.recordcount <> 0 then
        begin
          frmMensagemGrid := TfrmMensagemGrid.Create(frmMensagemGrid);
          frmMensagemGrid.Caption := 'Mensagem de aviso';
          frmMensagemGrid.lblTitulo.Caption := 'CONFLITOS ENTRE CST/CSON';
          frmMensagemGrid.lblTExto.Caption := format('Existe um conflito entre os códigos de CST/CSOSN em relação à Substituição Tributária para o estado de %s. '+chr(13)+
                               'Verifique se os mesmos estão corretos ou se deveriam estar desativados em Estoques/IPI.',[EstadoFilialBase]);
          frmMensagemGrid.dbgMensagem.DataSource := dsrExisteSTConflitante;
          frmMensagemGrid.ShowModal;
          freeandnil(frmMensagemGrid);

        end;
    end
  end
end;

function TdtmCadastroTabelasEstoques.GravarMarcas: Boolean;
begin
  Result:= False;
  if qryMarcas.CheckRequiredFields then begin
    if qryMarcas.State in [dsInsert] then begin
      spcMarcasProximo.Open;
      qryMarcascodigo.AsInteger:= spcMarcasProximocodigo.AsInteger;
      spcMarcasProximo.Close;
    end;
    AtribuirChave(qrymarcasAgendamentos, [qrymarcasAgendamentosmarca], [qrymarcascodigo]);
    qryMarcas.Post;
    Perpetrar([qryMarcas, qrymarcasAgendamentos]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarGruposFornecedores: Boolean;
begin
  Result:= False;
  if qryGruposFornecedores.CheckRequiredFields then begin
    if qryGruposFornecedores.State in [dsInsert] then begin
      spcGruposFornecedoresProximo.Open;
      qryGruposFornecedorescodigo.AsInteger:= spcGruposFornecedoresProximocodigo.AsInteger;
      spcGruposFornecedoresProximo.Close;
    end;
    qryGruposFornecedores.Post;
    Perpetrar([qryGruposFornecedores]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarFatoresPreco: Boolean;
begin
  Result:= False;
  if qryFatoresPreco.CheckRequiredFields then begin
    qryFatoresPreco.Post;
    Perpetrar([qryFatoresPreco]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarObsLegaisNotas: Boolean;
begin
  Result:= False;
  if qryObsLegaisNotas.CheckRequiredFields then begin
    if qryObsLegaisNotas.State in [dsInsert] then begin
      spcObsLegaisProximo.Open;
      qryObsLegaisNotascodigo.AsInteger:= spcObsLegaisProximocodigo.AsInteger;
      spcObsLegaisProximo.Close;
    end;
    qryObsLegaisNotas.Post;
    Perpetrar([qryObsLegaisNotas]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarUnidades: Boolean;
begin
  Result:= False;
  if qryUnidades.CheckRequiredFields then begin
    qryUnidades.Post;
    Perpetrar([qryUnidades]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.IncluirClasses: Boolean;
begin
  qryClasses.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirColunas: Boolean;
begin
  qryColunas.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirGrupos: Boolean;
begin
  qryGrupos.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirICMS: Boolean;
begin
  qryICMSEstados.DisableControls;
  qryICMSEstados.AfterInsert := nil;
  try
    qryICMS.Insert;
    qryEstados.Open;
    while Not qryEstados.Eof do begin
      qryICMSEstados.Append;
      qryICMSEstadosestado.AsString := qryEstadoscodigo.AsString;
      qryICMSEstadosnome.AsString   := qryEstadosnome.AsString;
      qryICMSEstadosvalor.AsFloat   := 0;
//      qryICMSEstadosvalorfora.AsFloat   := 0;
      qryICMSEstados.Post;
      qryEstados.Next;
    end;
    qryEstados.Close;
    qryICMSEstados.First;
  finally
    qryICMSEstados.EnableControls;
    qryICMSEstados.AfterInsert := qryICMSEstadosAfterInsert
  end;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirIPI: Boolean;
begin
  GerarEstadosIPI(True);
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirMarcas: Boolean;
begin
  qryMarcas.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirGruposFornecedores: Boolean;
begin
  qryGruposFornecedores.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirFatoresPreco: Boolean;
begin
  qryFatoresPreco.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirObsLegais: Boolean;
begin
  qryObsLegaisNotas.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.IncluirUnidades: Boolean;
begin
  qryUnidades.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.ExisteClasses(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaClasses, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteColunas(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaColunas, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteGrupos(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupos, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteICMS(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaICMS, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteIPI(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaIPI, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteMarcas(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaMarcas, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteObsLegais(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaObsLegais, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteUnidades(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaUnidades, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteGruposFornecedores(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGruposFornecedores, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExisteFatoresPreco(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFatoresPreco, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.GetTabelaClasses: TZDataSet;
begin
  Result := qryClasses;
end;

function TdtmCadastroTabelasEstoques.GetTabelaColunas: TZDataSet;
begin
  Result := qryColunas;
end;

function TdtmCadastroTabelasEstoques.GetTabelaGrupos: TZDataSet;
begin
  Result := qryGrupos;
end;

function TdtmCadastroTabelasEstoques.GetTabelaICMS: TZDataSet;
begin
  Result := qryICMS;
end;

function TdtmCadastroTabelasEstoques.GetTabelaIPI: TZDataSet;
begin
  Result := qryIPI;
end;

function TdtmCadastroTabelasEstoques.GetTabelaMarcas: TZDataSet;
begin
  Result := qryMarcas;
end;

function TdtmCadastroTabelasEstoques.GetTabelaGruposFornecedores: TZDataSet;
begin
  Result := qryGruposFornecedores;
end;

function TdtmCadastroTabelasEstoques.GetTabelaFatoresPreco: TZDataset;
begin
  Result:= qryFatoresPreco;
end;

function TdtmCadastroTabelasEstoques.GetConsultarGruposFornecedores: TtecQuery;
begin
  Result:= qryConsultaGruposFornecedores;
end;

function TdtmCadastroTabelasEstoques.GetConsultarFatoresPreco: TZDataset;
begin
  Result:= qryConsultaFatoresPreco;
end;

function TdtmCadastroTabelasEstoques.GetTabelaObsLegais: TZDataSet;
begin
  Result := qryObsLegaisNotas;
end;

function TdtmCadastroTabelasEstoques.GetTabelaUnidades: TZDataSet;
begin
  Result := qryUnidades;
end;

function TdtmCadastroTabelasEstoques.GetConsultarClasses: TtecQuery;
begin
  Result := qryConsultaClasses;
end;

function TdtmCadastroTabelasEstoques.GetConsultarColunas: TtecQuery;
begin
  Result := qryConsultaColunas;
end;

function TdtmCadastroTabelasEstoques.GetConsultarGrupos: TtecQuery;
begin
  Result := qryConsultaGrupos;
end;

function TdtmCadastroTabelasEstoques.GetConsultarICMS: TtecQuery;
begin
  Result := qryConsultaICMS;
end;

function TdtmCadastroTabelasEstoques.GetConsultarIPI: TtecQuery;
begin
  Result := qryConsultaIPI;
end;

function TdtmCadastroTabelasEstoques.GetConsultarMarcas: TtecQuery;
begin
  Result := qryConsultaMarcas;
end;

function TdtmCadastroTabelasEstoques.GetConsultarObsLegais: TtecQuery;
begin
  Result := qryConsultaObsLegais;
end;

function TdtmCadastroTabelasEstoques.GetConsultarUnidades: TtecQuery;
begin
  Result := qryConsultaUnidades;
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaClasses: String;
begin
  Result := qryConsultaClassescodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaColunas: String;
begin
  Result := qryConsultaColunascodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaGrupos: String;
begin
  Result := qryConsultaGruposcodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaICMS: String;
begin
  Result := qryConsultaICMScodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaIPI: String;
begin
  Result := qryConsultaIPIcodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaMarcas: String;
begin
  Result := qryConsultaMarcascodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaGruposFornecedores: String;
begin
  Result:= qryConsultaGruposFornecedorescodigo.AsString;
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaObsLegais: String;
begin
  Result := qryConsultaObsLegaiscodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaUnidades: String;
begin
  Result := qryConsultaUnidadescodigo.AsString
end;

procedure TdtmCadastroTabelasEstoques.AbrirTabelasCadastro(Tabela: TtecTabelasEstoque);
begin
  case Tabela of
    tbeGRADES             : Abre(ctTabelaGrades);
    tbeGRUPOS             : Abre(ctTabelaGrupos);
    tbeCLASSES            : Abre(ctTabelaClasses);
    tbeUNIDADES           : Abre(ctTabelaUnidades);
    tbeICMS               : Abre(ctTabelaICMS);
    tbeIPI                : Abre(ctTabelaIPI);
    tbeOBSLEGAIS          : Abre(ctTabelaObsLegaisNotas);
    tbeOBSLIVROSFISCAIS   : Abre(ctTabelaObsLegaisLivros);
    tbeCOLUNAS            : Abre(ctTabelaColunas);
    tbePROMOCOES          : qryPromocoes.Open;
    tbeCASHBACK           : qryCashBack.Open;
    tbeATRIBUTOS          : qryAtributos_Produtos.Open;
    tbeMARCAS             : Abre(ctTabelaMarcas);
    tbeMODELOS            : qrymodelos.open;
    tbeGRUPOSFORNECEDORES : Abre(ctTabelaGruposFornecedores);
    tbeFATORES            : Abre(ctTabelaFatoresPreco);
  end;
end;

procedure TdtmCadastroTabelasEstoques.AbrirTabelasConsulta(Tabela: TtecTabelasEstoque);
begin
  case Tabela of
    tbeGRADES             : Abre(ctConsultaGrades);
    tbeGRUPOS    : begin
                     Abre(ctConsultaGrupos);
                     Abre(ctConsultaClasses);
                   end;
    tbeCLASSES            : Abre(ctConsultaClasses);
    tbeUNIDADES           : Abre(ctConsultaUnidades);
    tbeICMS               : Abre(ctConsultaICMS);
    tbeIPI                : Abre(ctConsultaIPI);
    tbeOBSLEGAIS          : Abre(ctConsultaObsLegais);
    tbeOBSLIVROSFISCAIS   : Abre(ctConsultaObsLivrosFiscais);
    tbeCOLUNAS            : Abre(ctConsultaColunas);
    tbePROMOCOES          : qryConsultaPromocoes.open;
    tbeMARCAS             : Abre(ctConsultaMarcas);
    tbeMODELOS            : qryConsultaModelos.Open;
    tbeGRUPOSFORNECEDORES : Abre(ctConsultaGruposFornecedores);
    tbeFATORES            : Abre(ctConsultaFatoresPreco);
  end;
end;

procedure TdtmCadastroTabelasEstoques.FecharTabelasConsulta(Tabela: TtecTabelasEstoque);
begin
  case Tabela of
    tbeGRADES             : Fecha(ctConsultaGrades);
    tbeGRUPOS    : begin
                     Fecha(ctConsultaGrupos);
                     Fecha(ctConsultaClasses);
                   end;
    tbeCLASSES            : Fecha(ctConsultaClasses);
    tbeUNIDADES           : Fecha(ctConsultaUnidades);
    tbeICMS               : Fecha(ctConsultaICMS);
    tbeIPI                : Fecha(ctConsultaIPI);
    tbeOBSLEGAIS          : Fecha(ctConsultaObsLegais);
    tbeOBSLIVROSFISCAIS   : Fecha(ctConsultaObsLivrosFiscais);
    tbeCOLUNAS            : Fecha(ctConsultaColunas);
    tbePROMOCOES          : qryConsultaPromocoes.close;
    tbeMARCAS             : Fecha(ctConsultaMarcas);
    tbeMODELOS            : qryConsultaModelos.Close;
    tbeGRUPOSFORNECEDORES : Fecha(ctConsultaGruposFornecedores);
    tbeFATORES            : Fecha(ctConsultaFatoresPreco);
  end;
end;

procedure TdtmCadastroTabelasEstoques.SelecionarMultiplas(Tabela: TtecTabelasEstoque; Pesquisa: TtecPesquisa);
begin
  case Tabela of
    tbeGRADES:             ReFazConsulta(qryGrades,             [0], [qryConsultaGradescodigo.AsInteger]);
    tbeGRUPOS:             ReFazConsulta(qryGrupos,             [0], [CodigoConsultaGrupos]);
    tbeCLASSES:            ReFazConsulta(qryClasses,            [0], [CodigoConsultaClasses]);
    tbeUNIDADES:           ReFazConsulta(qryUnidades,           [0], [CodigoConsultaUnidades]);
    tbeICMS:               ReFazConsulta(qryICMS,               [0], [CodigoConsultaICMS]);
    tbeIPI:                ReFazConsulta(qryIPI,                [0], [CodigoConsultaIPI]);
    tbeOBSLEGAIS:          ReFazConsulta(qryObsLegaisNotas,     [0], [CodigoConsultaObsLegais]);
    tbeOBSLIVROSFISCAIS:   ReFazConsulta(qryObsLivrosFiscais,   [0], [CodigoConsultaObsLivrosFiscais]);
    tbeCOLUNAS:            ReFazConsulta(qryColunas,            [0], [CodigoConsultaColunas]);
    tbePROMOCOES:          ReFazConsulta(qryPromocoes,          [0], [CodigoConsultaPromocao]);
    tbeCASHBACK: ReFazConsulta(qryCashBack,            [0], [CodigoConsultaPromocao]);
    tbeMARCAS:             ReFazConsulta(qryMarcas,             [0], [CodigoConsultaMarcas]);
    tbeMODELOS:            ReFazConsulta(qryModelos,            [0], [qryConsultaModeloscodigo.AsVariant]);
    tbeGRUPOSFORNECEDORES: ReFazConsulta(qryGruposFornecedores, [0], [CodigoConsultaGruposFornecedores]);
    tbeFATORES:            ReFazConsulta(qryFatoresPreco,       [0], [qryConsultaFatoresPrecocodigo.AsString]);
  end;
end;

procedure TdtmCadastroTabelasEstoques.qryICMSAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsulta(qryICMSEstados,[0],[qryICMScodigo.AsInteger]);
end;

function TdtmCadastroTabelasEstoques.ExisteEstadosICMS(Estado:String): Boolean;
begin
  ReFazConsulta(qryExisteEstadosICMS,[0,1],[qryICMSCodigo.AsInteger,Estado]);
  Result:= not qryExisteEstadosICMS.IsEmpty;
end;

procedure TdtmCadastroTabelasEstoques.qryICMSEstadosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryICMSEstados.Cancel
end;

procedure TdtmCadastroTabelasEstoques.qryICMSEstadosBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  qryICMS.Edit
end;

procedure TdtmCadastroTabelasEstoques.ReplicarValoresICMS;
var
 ValorAnteriordentro, ValorAnteriorfora: Currency;
 Str: String;
 Pos: TBookmark;
begin
  if (qryICMSEstadosvalor.AsInteger >= 0) {and
     (qryICMSEstadosvalorfora.AsInteger >= 0)} then begin
    Str := Format(ctCONFIRMAREPLICACAOVALORICMS, [qryICMSEstadosvalor.AsFloat {,qryICMSEstadosvalorfora.AsFloat}]);
    if MensagemConfirmacao(Str) = smbOK then begin
      ValorAnteriordentro := qryICMSEstadosvalor.AsCurrency;
//      ValorAnteriorfora := qryICMSEstadosvalorfora.AsCurrency;
      qryICMSEstados.DisableControls;
      Pos := qryICMSEstados.GetBookmark;
      try
        qryICMSEstados.Next;
        while Not qryICMSEstados.Eof do begin
          qryICMSEstados.Edit;
          qryICMSEstadosvalor.AsCurrency := ValorAnteriordentro;
//          qryICMSEstadosvalorfora.AsCurrency := ValorAnteriorfora;
          qryICMSEstados.Next;
        end
      finally
        qryICMSEstados.GotoBookmark(Pos);
        qryICMSEstados.EnableControls
      end
    end
  end
end;

procedure TdtmCadastroTabelasEstoques.SincronizarICMSEstados(Valor: Real);
begin
  spcICMSEstadosSincronizar.Params[0].AsFloat := Valor;
  spcICMSEstadosSincronizar.ExecSql;
  qryICMSEstados.DisableControls;
  try
    ReFazConsulta(qryICMS, [], []);
  finally
    qryICMSEstados.EnableControls
  end
end;

procedure TdtmCadastroTabelasEstoques.qryGruposNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryGruposvendanegativa.Value     := 'N';
  qryGrupostipocomissao.Value      := '%';
  qryGruposcalcularpreco.AsBoolean := True;
  qryGruposnaoreplicar.AsBoolean   := False;
  qryGruposplanilhacustos.AsBoolean := false;
  qryGruposEmExposicao.asBoolean := false;
  
end;

procedure TdtmCadastroTabelasEstoques.qryClassesNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryClassesvendanegativa.Value   := 'N';
  qryClassestipocomissao.Value    := '%';
  qryClassesnaoreplicar.AsBoolean := False;
end;

procedure TdtmCadastroTabelasEstoques.qryICMSAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryICMStipo.AsString := 'P';
end;

procedure TdtmCadastroTabelasEstoques.dsrEstadosICMSDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryICMSEstadosvalor then
  begin
   if qryICMSEstadosvalor.AsString ='' then
     qryICMSEstadosvalor.AsString := '0'
  end
  {
  else
  if Field = qryICMSEstadosvalorfora then
  begin
   if qryICMSEstadosvalorfora.AsString ='' then
     qryICMSEstadosvalorfora.AsString := '0'
  end;
  }
end;


function TdtmCadastroTabelasEstoques.getConsultarGrade: TtecQuery;
begin
  Result := qryConsultaGrades
end;

function TdtmCadastroTabelasEstoques.getTabelaGrade: TtecQuery;
begin
  Result := qryGrades
end;

function TdtmCadastroTabelasEstoques.IncluirGrade: Boolean;
begin
  qryGrades.Append;
  ReFazConsulta(qryElementosGrade, [0], [0]);
  Result := True
end;

function TdtmCadastroTabelasEstoques.GravarGrade: Boolean;
var
  a, b: Integer;
  PosAnt: TBookmark;
  OK: Boolean;
  Valores: array of String;
begin
  Result:= False;
  if qryGrades.CheckRequiredFields and qryElementosGrade.CheckRequiredFields then begin
      OK := True;
      if qryElementosGrade.State in [dsEdit, dsInsert] then
        qryElementosGrade.Post;
      if qryElementosGrade.RecordCount > 1 then begin
        SetLength(Valores, qryElementosGrade.RecordCount);
        PosAnt := qryElementosGrade.GetBookmark;
        qryElementosGrade.DisableControls;
        try
          qryElementosGrade.First;
          for a := 0 to qryElementosGrade.RecordCount - 1 do begin
            Valores[a]  := qryElementosGradevalor.AsString;
            qryElementosGrade.Next;
          end;
        finally
          qryElementosGrade.GotoBookmark(PosAnt);
          qryElementosGrade.FreeBookmark(PosAnt);
          qryElementosGrade.EnableControls
        end;
        for a := 0 to High(Valores) - 1 do begin
          for b := a + 1 to High(Valores) do
            if Valores[a] = Valores[b] then begin
              OK := False;
              break
            end;
          if Not OK then
            Break
        end
      end;
      if OK then begin
        if qryGrades.State in [dsInsert] then begin
          spcGradesProximo.Open;
          qryGradescodigo.AsInteger:= spcGradesProximocodigo.AsInteger;
          spcGradesProximo.Close;
        end;
        PosAnt := qryElementosGrade.GetBookmark;
        qryElementosGrade.DisableControls;
        try
          qryElementosGrade.First;
          while Not qryElementosGrade.Eof and OK do begin
            if qryElementosGradegrade.AsInteger = 0 then begin
              qryElementosGrade.Edit;
              qryElementosGradegrade.AsInteger := qryGradescodigo.AsInteger;
            end;
            qryElementosGrade.Next;
          end;
        finally
          qryElementosGrade.GotoBookmark(PosAnt);
          qryElementosGrade.FreeBookmark(PosAnt);
          qryElementosGrade.EnableControls
        end;
        if qryGrades.State in [dsEdit, dsInsert] then
          qryGrades.Post;
        Perpetrar([qryGrades, qryElementosGrade]);
        Result := True;
      end else begin
        Result := False;
        MensagemAviso(ctREPETICAOELEMENTOGRADE);
      end
  end
end;

function TdtmCadastroTabelasEstoques.ExcluirGrade: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a GRADE'])) = smbOk then begin
    if not qryGrades.IsEmpty then
      qryGrades.Delete
    else
      qryGrades.Cancel;
    try
     Perpetrar([qryGrades]);
    finally
     if (qryGradescodigo.AsString<>'') then
       ReFazConsulta(qryGrades, [0], [qryGradescodigo.AsVariant])
     else
       ReFazConsulta(qryGrades, [0], [0]);
    end;
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.ExisteGrade(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrades, campo, codigo)
end;

procedure TdtmCadastroTabelasEstoques.qryElementosGradeNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryElementosGradeemuso.AsBoolean := False;
end;

procedure TdtmCadastroTabelasEstoques.qryElementosGradeBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryElementosGradevalor.AsString := Trim(qryElementosGradevalor.AsString)
end;

procedure TdtmCadastroTabelasEstoques.qryGradesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryElementosGrade, [0], [qryGradescodigo.AsInteger]);
end;

procedure TdtmCadastroTabelasEstoques.qryElementosGradeBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if qryElementosGradeemuso.AsBoolean then begin
    MensagemAviso(ctELEMENTOGRADEEMUSO);
    Abort
  end
end;

procedure TdtmCadastroTabelasEstoques.qryElementosGradeBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  qryGrades.Edit
end;

function TdtmCadastroTabelasEstoques.ExcluirElementoGrade: Boolean;
begin
  if qryElementosGradeemuso.AsBoolean then begin
    MensagemAviso(ctELEMENTOGRADEEMUSO);
    Result := False
  end else begin
    qryGrades.Edit;
    qryElementosGrade.Delete;
    Result := True
  end
end;

procedure TdtmCadastroTabelasEstoques.qryElementosGradeAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryElementosGradeusual.AsBoolean := true;
end;

procedure TdtmCadastroTabelasEstoques.marcarusual;
begin
 if not (qryElementosGrade.State in [dsedit, dsinsert]) then
  qryelementosgrade.Edit;
 qryElementosGradeusual.AsBoolean := not qryElementosGradeusual.AsBoolean;  
end;

procedure TdtmCadastroTabelasEstoques.qryIPIAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsulta(qryEstadosIPI, [0], [qryIPICodigo.AsVariant]);
end;

procedure TdtmCadastroTabelasEstoques.qryEstadosIPIAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryEstadosIPI.Cancel;
end;

procedure TdtmCadastroTabelasEstoques.qryEstadosIPIBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryIPI.Edit;
end;

procedure TdtmCadastroTabelasEstoques.GerarEstadosIPI(IncluirIPI: Boolean);
begin
//  GuardarRegistroAtual(qryEstadosIPI, True);
  qryEstadosIPI.AfterInsert := nil;
  try
    if IncluirIPI then                                                                   
      qryIPI.Insert;

    qryEstados.Open;
    while Not qryEstados.Eof do begin
      qryEstadosIPI.Append;
      qryEstadosIPIestado.AsString := qryEstadoscodigo.AsString;
      qryEstadosIPInome.AsString   := qryEstadosnome.AsString;
      qryEstadosIPIativo.AsBoolean := False;
      qryEstados.Next;
    end;
    qryEstados.Close;
    qryEstadosIPI.First;
  finally
//    VoltarRegistroAtual(qryEstadosIPI);
    qryEstadosIPI.AfterInsert := qryEstadosIPIAfterInsert
  end;
end;

procedure TdtmCadastroTabelasEstoques.SelecionarEstadoIpi;
begin
  qryEstadosIPI.Edit;
  qryEstadosIPIativo.AsBoolean := not qryEstadosIPIativo.AsBoolean;
end;

procedure TdtmCadastroTabelasEstoques.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
  Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\ipi.sql') then
    Listar.loadfromfile('c:\ipi.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\ipi.sql');
  listar.free;
end;

function TdtmCadastroTabelasEstoques.ExcluirObsLegaisLivros: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a OBSERVAÇÃO LEGAL'])) = smbOk then begin
    if not qryObsLivrosFiscais.IsEmpty then
         qryObsLivrosFiscais.Delete
    else qryObsLivrosFiscais.Cancel;
    Perpetrar([qryObsLivrosFiscais]);
    Result:= True;
  end
end;


function TdtmCadastroTabelasEstoques.GravarObsLegaisLivros: Boolean;
begin
  Result:= False;
  if qryObsLivrosFiscais.CheckRequiredFields then begin
    if qryObsLivrosFiscais.State in [dsInsert] then begin
      spcObsLivrosFiscais.Open;
      qryObsLivrosFiscaiscodigo.AsInteger:= spcObsLivrosFiscaiscodigo.AsInteger;
      spcObsLivrosFiscais.Close;
    end;
    qryObsLivrosFiscais.Post;
    Perpetrar([qryObsLivrosFiscais]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaObsLivrosFiscais: String;
begin
  Result := qryConsultaObsLivrosFiscaiscodigo.AsString
end;

function TdtmCadastroTabelasEstoques.IncluirObsLivrosFiscais: Boolean;
begin
  qryObsLivrosFiscais.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.ExisteLivrosFiscais(campo,
  codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaObsLivrosFiscais, campo, codigo)
end;


procedure TdtmCadastroTabelasEstoques.qryEstadosIPIBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if qryEstadosIPImva.AsCurrency > 0 then
    qryEstadosIPIfatorsubstituicao.AsCurrency := 1+(qryEstadosIPImva.AsCurrency/100)
  else
    qryEstadosIPIfatorsubstituicao.AsCurrency := 1;
end;

function TdtmCadastroTabelasEstoques.IncluirModelos: Boolean;
begin
  qryModelos.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.ExcluirModelos: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o MODELO'])) = smbOk then begin
    if not qryModelos.IsEmpty then
         qryModelos.Delete
    else qryModelos.Cancel;
    Perpetrar([qryModelos]);
    Result:= True;
  end
end;

function TdtmCadastroTabelasEstoques.GravarModelos: Boolean;
begin
  Result:= False;
  if qryModelos.CheckRequiredFields then
  begin
    if qryModelos.State = dsInsert then
    begin
      spcModelosProximo.Open;
      qryModeloscodigo.AsInteger := spcModelosProximocodigo.AsInteger;
      spcModelosProximo.Close;
    end;
    qryModelos.Post;
    Perpetrar([qryModelos]);
    Result := True;
  end;
end;

function TdtmCadastroTabelasEstoques.ExisteModelos(campo,
  codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaModelos, campo, codigo)
end;

procedure TdtmCadastroTabelasEstoques.qryGruposAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  refazconsultapornome(qryGruposComissoes,['grupo'],[qryGruposcodigo.AsVariant]);
  RefazConsultaPorNome(qryGruposAgendamentos, ['grupo'], [qryGruposcodigo.asVariant])
end;

procedure TdtmCadastroTabelasEstoques.qryGruposComissoesAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qrygrupos.edit;
end;

procedure TdtmCadastroTabelasEstoques.qryGruposComissoesAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qrygrupos.edit;
end;

procedure TdtmCadastroTabelasEstoques.qryGruposComissoesNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryGruposComissoesgrupo.AsString := qryGruposcodigo.AsString;
  AtualizarGruposComissoes('A');
end;

procedure TdtmCadastroTabelasEstoques.AtualizarGruposComissoes(
  Operacao: String);
begin
{ Operacao: E -> Excluindo  I -> Inserindo  A -> Adicionando}

  qryGruposComissoes.DisableControls;

  if operacao = 'A' then
  begin
    qryGruposComissoes.Edit;
    qryGruposComissoesnumero.AsInteger := ifthen(qryGruposComissoes.RecordCount=0,1,qryGruposComissoes.recno);
    qryGruposComissoes.Post;
//    qryGruposComissoes.last;
  end
  else
  if operacao = 'E' then
  begin
    while not qryGruposComissoes.eof do
    begin
      if  qryGruposComissoesnumero.AsInteger <> qryGruposComissoes.RecNo then
      begin
        qryGruposComissoes.Edit;
        qryGruposComissoesnumero.AsInteger := qryGruposComissoes.RecNo;
        qryGruposComissoes.Post;
      end;
      qryGruposComissoes.next;
    end;

    if not qryGruposComissoes.Locate('numero',NumeroGrupoComissoes,[]) then
      qryGruposComissoes.last;

  end
  else
  if operacao = 'I' then
  begin
    while not qryGruposComissoes.eof do
    begin
      qryGruposComissoes.Edit;
      qryGruposComissoesnumero.AsInteger := qryGruposComissoes.RecNo + 1;
      qryGruposComissoes.Post;
      qryGruposComissoes.next;
    end;

    if NumeroGrupoComissoes = 1 then
      qryGruposComissoes.First
    else
      qryGruposComissoes.Locate('numero',NumeroGrupoComissoes+1,[]);

    qryGruposComissoes.Insert;
    qryGruposComissoesgrupo.AsString := qryGruposCodigo.AsString;
    if NumeroGrupoComissoes = 0
    then qryGruposComissoesnumero.AsInteger:= 1
    else qryGruposComissoesnumero.AsInteger := NumeroGrupoComissoes;
  end;

  qryGruposComissoes.EnableControls

end;

procedure TdtmCadastroTabelasEstoques.ExcluirGruposComissoes;
begin
  if not qryGruposComissoes.IsEmpty then
    if not qryGruposComissoes.ReadOnly then
    begin
      NumeroGrupoComissoes := qryGruposComissoesnumero.AsInteger;
      qryGruposComissoes.Delete;
      AtualizarGruposComissoes('E');
    end;
end;

procedure TdtmCadastroTabelasEstoques.IncluirGruposComissoes(
  Final: Boolean);
begin
  NumeroGrupoComissoes := qryGruposComissoes.RecNo;
  qryGruposComissoes.OnNewRecord := nil;
  AtualizarGruposComissoes('I');
  qryGruposComissoes.OnNewRecord := qryGruposComissoesNewRecord;

end;

function TdtmCadastroTabelasEstoques.SalvarGruposComissoes: boolean;
begin
  result := true;
  if (qryGruposComissoes.State in [dsedit, dsinsert]) then
  begin
    if qryGruposComissoes.CheckRequiredFields then
      qryGruposComissoes.Post
    else
      result := false;
  end;
end;

procedure TdtmCadastroTabelasEstoques.qryIPINewRecord(DataSet: TDataSet);
begin
  inherited;
  qryIPIAliquota.          AsCurrency:= 0;
  qryIPINCMIsentoPISCOFINS.AsBoolean := false;
end;

procedure TdtmCadastroTabelasEstoques.qryGruposAgendamentosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryGruposAgendamentosgrupo.asString := qryGruposcodigo.asString;
end;

procedure TdtmCadastroTabelasEstoques.qryGruposAgendamentosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarGrupos;
//  perpetrar([qryGruposAgendamentos]);
end;

procedure TdtmCadastroTabelasEstoques.EditarGrupos;
begin
  if not (qryGrupos.State in [dsEdit, dsInsert]) then
    qryGrupos.Edit;
end;

procedure TdtmCadastroTabelasEstoques.qryGruposAgendamentosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarGrupos;
  perpetrar([qryGruposAgendamentos]);

end;

procedure TdtmCadastroTabelasEstoques.ExcluirGruposAgendamentos;
begin
  if not qryGruposAgendamentos.IsEmpty then
    if MensagemConfirmacao('Excluir o agendamento deste grupos') = smbOk then
      qryGruposAgendamentos.Delete;
end;

function TdtmCadastroTabelasEstoques.GetTabelaPromocoes: TZDataSet;
begin
  Result := qryPromocoes;
end;

function TdtmCadastroTabelasEstoques.ExistePromocao(campo,
  codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaPromocoes, campo, codigo)
end;

function TdtmCadastroTabelasEstoques.ExcluirPromocoes: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a PROMOÇÃO'])) = smbOk then begin
    if not qryPromocoes.IsEmpty then
         qryPromocoes.Delete
    else qryPromocoes.Cancel;
    Perpetrar([qryPromocoes]);
    Result:= True;
  end

end;

function TdtmCadastroTabelasEstoques.GravarPromocoes: Boolean;
begin
  Result:= False;
  if qryPromocoes.CheckRequiredFields then begin
    if qryPromocoes.State in [dsInsert] then begin
      spcPromocoesProximo.Open;
      qryPromocoescodigo.AsInteger:= spcPromocoesProximocodigo.AsInteger;
      spcPromocoesProximo.Close;
    end;
    qryPromocoes.Post;
    Perpetrar([qryPromocoes]);
    Result := True;
  end
end;

function TdtmCadastroTabelasEstoques.IncluirPromocoes: Boolean;
begin
  qryPromocoes.Insert;
  Result := True;
end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaPromocao: String;
begin
  Result := qryConsultaPromocoescodigo.AsString
end;

function TdtmCadastroTabelasEstoques.GetConsultarPromocoes: TtecQuery;
begin
  Result := qryConsultaPromocoes;
end;

procedure TdtmCadastroTabelasEstoques.ExcluirClassesAgendamentos;
begin
  if not qryClassesAgendamentos.IsEmpty then
    if MensagemConfirmacao('Excluir o agendamento desta classe') = smbOk then
      qryClassesAgendamentos.Delete;

end;

procedure TdtmCadastroTabelasEstoques.qryClassesAgendamentosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarClasses;
  perpetrar([qryClassesAgendamentos]);

end;

procedure TdtmCadastroTabelasEstoques.EditarClasses;
begin
  if not (qryClasses.State in [dsEdit, dsInsert]) then
    qryClasses.Edit;
end;

procedure TdtmCadastroTabelasEstoques.qryClassesAgendamentosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarClasses;
//  perpetrar([qryClassesAgendamentos]);

end;

procedure TdtmCadastroTabelasEstoques.qryClassesAgendamentosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryClassesAgendamentosclasse.asString := qryClassescodigo.asString;
end;

procedure TdtmCadastroTabelasEstoques.qryClassesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryClassesAgendamentos, ['classe'], [qryClassescodigo.asVariant])
end;

procedure TdtmCadastroTabelasEstoques.qryMarcasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryMarcasAgendamentos, ['marca'], [qryMarcascodigo.asVariant])
end;

procedure TdtmCadastroTabelasEstoques.ExcluirMarcasAgendamentos;
begin
  if not qrymarcasAgendamentos.IsEmpty then
    if MensagemConfirmacao('Excluir o agendamento desta marca') = smbOk then
      qrymarcasAgendamentos.Delete;

end;

procedure TdtmCadastroTabelasEstoques.qryMarcasAgendamentosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarMarcas;
  perpetrar([qryMarcasAgendamentos]);

end;

procedure TdtmCadastroTabelasEstoques.qryMarcasAgendamentosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarMarcas;
//  perpetrar([qryMarcasAgendamentos]);
end;

procedure TdtmCadastroTabelasEstoques.qryMarcasAgendamentosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qrymarcasAgendamentosmarca.asString := qrymarcascodigo.asString;
end;

procedure TdtmCadastroTabelasEstoques.Editarmarcas;
begin
  if not (qrymarcas.State in [dsEdit, dsInsert]) then
    qrymarcas.Edit;

end;

function TdtmCadastroTabelasEstoques.GetCodigoConsultaCashBack: String;
begin
  ;
end;

function TdtmCadastroTabelasEstoques.ExcluirCashBack: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o CASH BACK'])) = smbOk then begin
    if not qryCashBack.IsEmpty then
         qryCashBack.Delete
    else qryCashBack.Cancel;
    Perpetrar([qryCashBack]);
    Result:= True;
  end

end;

function TdtmCadastroTabelasEstoques.GravarCashBack: Boolean;
begin
  Result:= False;
  if qryCashBack.CheckRequiredFields then
  begin
    if qryCashBackProdutos.CheckRequiredFields(true, false, true) then
      if qryCashBackGrupos.CheckRequiredFields(true, false, true) then
        if qryCashBackClasses.CheckRequiredFields(true, false, true) then
          if qryCashBackMarcas.CheckRequiredFields(true, false, true) then
            if qryCashBackCargos.CheckRequiredFields(true, false, true) then
              if qryCashBackFiliais.CheckRequiredFields(true, false, true) then
               begin
                 qryCashBack.Post;
                 Perpetrar([qryCashBack, qryCashBackProdutos,
                      qryCashBackGrupos, qryCashBackClasses,
                      qryCashBackMarcas, qryCashBackCargos,
                      qryCashBackFiliais ]);
                 Result := True;
               end;

  end;
end;

function TdtmCadastroTabelasEstoques.IncluirCashBack: Boolean;
begin
  qryCashBack.Insert;
  Result := True;

end;

procedure TdtmCadastroTabelasEstoques.qryCashBackNewRecord(
  DataSet: TDataSet);
begin
  inherited;

  qryCashBackvalidadeinicial.asDateTime := datahoraservidor;
  qryCashBackvalidadefinal.asDateTime := datahoraservidor;
  qryCashBacktipo.asString := '%';
  qryCashBacksite.asString := 'Nao';
end;

procedure TdtmCadastroTabelasEstoques.qryCashBackAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryCashBackProdutos,
      ['cashback'], [qryCashBackcodigo.AsVariant]);

  RefazConsultaPorNome(qryCashBackGrupos,
      ['cashback'], [qryCashBackcodigo.AsVariant]);

  RefazConsultaPorNome(qryCashBackClasses,
      ['cashback'], [qryCashBackcodigo.AsVariant]);

  RefazConsultaPorNome(qryCashBackMarcas,
      ['cashback'], [qryCashBackcodigo.AsVariant]);

  RefazConsultaPorNome(qryCashBackCargos,
      ['cashback'], [qryCashBackcodigo.AsVariant]);

  RefazConsultaPorNome(qryCashBackFiliais,
      ['cashback'], [qryCashBackcodigo.AsVariant]);


end;

procedure TdtmCadastroTabelasEstoques.ExcluirCashBackProdutos;
begin
  if not qryCashBackProdutos.IsEmpty then
    if MensagemConfirmacao('Excluir o produto deste cash back') = smbOk then
      dtmCadastroTabelasEstoques.qryCashBackProdutos.delete;

end;

procedure TdtmCadastroTabelasEstoques.qryCashBackProdutosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBack.edit;
end;

procedure TdtmCadastroTabelasEstoques.qryCashBackProdutosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBackProdutoscashback.asinteger := qryCashBackcodigo.asinteger;
end;

procedure TdtmCadastroTabelasEstoques.qryCashBackAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  spcCashBackProximo.Open;
  qryCashBackcodigo.AsInteger := spcCashBackProximocodigo.AsInteger;
  spcCashBackProximo.Close;

end;

procedure TdtmCadastroTabelasEstoques.qryCashBackGruposNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBackGruposcashback.asinteger := qryCashBackcodigo.asinteger;

end;

procedure TdtmCadastroTabelasEstoques.qryCashBackClassesNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBackClassescashback.asinteger := qryCashBackcodigo.asinteger;
end;

procedure TdtmCadastroTabelasEstoques.qryCashBackMarcasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBackMarcascashback.asinteger := qryCashBackcodigo.asinteger;
end;

procedure TdtmCadastroTabelasEstoques.ExcluirCashBackGrupos;
begin
  if not qryCashBackGrupos.IsEmpty then
    if MensagemConfirmacao('Excluir o grupo deste Cash Back') = smbOk then
      dtmCadastroTabelasEstoques.qryCashBackGrupos.delete;
end;

procedure TdtmCadastroTabelasEstoques.ExcluirCashBackClasses;
begin
  if not qryCashBackClasses.IsEmpty then
    if MensagemConfirmacao('Excluir a classe deste Cash Back') = smbOk then
      dtmCadastroTabelasEstoques.qryCashBackClasses.delete;
end;

procedure TdtmCadastroTabelasEstoques.ExcluirCashBackMarcas;
begin
  if not qryCashBackMarcas.IsEmpty then
    if MensagemConfirmacao('Excluir a marca deste Cash Back') = smbOk then
      dtmCadastroTabelasEstoques.qryCashBackmarcas.delete;

end;

function TdtmCadastroTabelasEstoques.IncluirAtributos_Produtos: Boolean;
begin
  qryAtributos_Produtos.Append;
  result := true;
end;

function TdtmCadastroTabelasEstoques.ExcluirAtributos_Produtos: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o ATRIBUTO'])) = smbOk then
  begin
    if not qryAtributos_Produtos.IsEmpty then
         qryAtributos_Produtos.Delete
    else qryAtributos_Produtos.Cancel;

    LimparTabela(qryAtributos_Produtos_Items);

    result := Perpetrar([qryAtributos_Produtos]);
  end

end;

function TdtmCadastroTabelasEstoques.GravarAtributos_Produtos: Boolean;
begin
  Result:= qryAtributos_Produtos.CheckRequiredFields;

  if result then
    result := qryAtributos_Produtos_Items.CheckRequiredFields(true, true, true, self.owner, true);

  if result then
  begin
    qryAtributos_Produtosatributos.asString := qryAtributos_Produtos_Items.ToJSON;
    if qryAtributos_Produtoscodigo.asInteger = 0 then
    begin
      spcAtributos_Produtos_Proximo.Open;
      qryAtributos_Produtoscodigo.asInteger := spcAtributos_Produtos_Proximocodigo.asInteger;
      spcAtributos_Produtos_Proximo.Close;
    end;

    qryAtributos_Produtos.Post;
    result := Perpetrar([qryAtributos_Produtos]);

    if result then
    begin
      qryAtributos_Produtos_Items.GuardarRegistroAtual(true, false);
      qryAtributos_Produtos_Items.first;
      while not qryAtributos_Produtos_Items.eof do
      begin
        qryAtributos_Produtos_Items.edit;
        qryAtributos_Produtos_Itemsnome_anterior.asString := qryAtributos_Produtos_Itemsnome.asString;
        qryAtributos_Produtos_Items.next;
      end;
      qryAtributos_Produtos_Items.VoltarRegistro;
    end;

    if (qryAtributos_Produtos.state = dsEdit) then
      qryAtributos_Produtos.Post;

  end

end;

procedure TdtmCadastroTabelasEstoques.qryAtributos_ProdutosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryAtributos_Produtos_Items, ['atributo'],
    [qryAtributos_Produtoscodigo.asinteger]);
end;

procedure TdtmCadastroTabelasEstoques.ExcluirAtributos_Produtos_Items;
begin
  if not qryAtributos_Produtos_Items.IsEmpty then
    if MensagemConfirmacao('Excluir o item deste atributo') = smbOk then
      qryAtributos_Produtos_Items.delete;

end;

procedure TdtmCadastroTabelasEstoques.qryAtributos_Produtos_ItemsAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryAtributos_Produtos.edit;
end;

procedure TdtmCadastroTabelasEstoques.qryAtributos_Produtos_ItemsAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryAtributos_Produtos.edit;
end;

procedure TdtmCadastroTabelasEstoques.qryCashBackCargosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBackCargoscashback.asinteger := qryCashBackcodigo.asinteger;

end;

procedure TdtmCadastroTabelasEstoques.qryCashBackFiliaisNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCashBackFiliaiscashback.asinteger := qryCashBackcodigo.asinteger;
end;

procedure TdtmCadastroTabelasEstoques.ExcluirCashBackCargos;
begin
  if not qryCashBackCargos.IsEmpty then
    if MensagemConfirmacao('Excluir o cargo deste Cash Back') = smbOk then
      dtmCadastroTabelasEstoques.qryCashBackCargos.delete;

end;

procedure TdtmCadastroTabelasEstoques.ExcluirCashBackFiliais;
begin
  if not qryCashBackFiliais.IsEmpty then
    if MensagemConfirmacao('Excluir a filial deste Cash Back') = smbOk then
      dtmCadastroTabelasEstoques.qryCashBackFiliais.delete;

end;

procedure TdtmCadastroTabelasEstoques.qryColunasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryColunasdisponivelfrentecaixa.asBoolean := True;
end;

procedure TdtmCadastroTabelasEstoques.qryICMSInterEstadualBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryICMSInterEstadual.ParamByName('EstadoFilialBase').asString :=
    EstadoFilialBase;
end;

procedure TdtmCadastroTabelasEstoques.qryICMSEstadosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  try
    qryICMSInterEstadual.AfterScroll := nil;
    if qryICMSInterEstadual.active then
      qryICMSInterEstadual.LOCATE('estado', qryICMSEstadosestado.asString, []);
  finally
    qryICMSInterEstadual.AfterScroll :=  qryICMSInterEstadualAfterScroll;
  end;
end;

procedure TdtmCadastroTabelasEstoques.qryICMSInterEstadualAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  try
    qryICMSEstados.AfterScroll := nil;
    if qryICMSEstados.active then
      qryICMSEstados.LOCATE('estado', qryICMSInterEstadualestado.asString, []);
  finally
    qryICMSEstados.AfterScroll := qryICMSEstadosAfterScroll;
  end;
end;

end.
