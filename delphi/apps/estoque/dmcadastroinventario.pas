unit dmcadastroinventario;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, biblio, ctconstantes, Windows, Forms, clparametrossistema, ZTransact,
  clusuario, FR_DSet, FR_DBSet, FR_Class, fmpreviewpadrao, dmtecsoft, frconsulta,
  variants, cpdbgrid, Provider, DBClient, frxClass, frxDBSet;

type
  TdtmCadastroInventario = class(TdtmBasico)
    qryInventario: TtecQuery;
    qryInventarionumero: TIntegerField;
    qryInventariofilial: TIntegerField;
    qryInventariosituacao: TStringField;
    dsrInventario: TtecDataSource;
    qryInventarioProduto: TtecQuery;
    qryInventarioProdutoinventario: TIntegerField;
    qryInventarioProdutoSequencia: TIntegerField;
    qryInventarioProdutoproduto: TLargeintField;
    qryInventarioProdutoquantidade: TFloatField;
    qryInventarioProdutodescricao: TStringField;
    qryInventarioProdutovalorgrade1: TStringField;
    qryInventarioProdutovalorgrade2: TStringField;
    dsrInventarioProduto: TtecDataSource;
    qryInventarioProximo: TtecQuery;
    qryInventarioProximonumero: TIntegerField;
    qryInventarioProdutolinha: TStringField;
    qryInventarioProdutocoluna: TStringField;
    qryInventarioDescricaoSituacao: TStringField;
    qryInventarioProdutoemestoque: TFloatField;
    qryInventarioProdutoreservado: TFloatField;
    qryInventarioProdutotransito: TFloatField;
    qryInventarioProdutodemonstracao: TFloatField;
    qryInventarioProdutoconserto: TFloatField;
    qryInventarioProdutodanificada: TFloatField;
    qryInventarioProdutoreservaprevia: TFloatField;
    qryProdutoEstoque: TtecQuery;
    qryProdutoEstoqueemestoque: TFloatField;
    qryProdutoEstoquereservado: TFloatField;
    qryProdutoEstoquetransito: TFloatField;
    qryProdutoEstoquedemonstracao: TFloatField;
    qryProdutoEstoqueconserto: TFloatField;
    qryProdutoEstoquedanificada: TFloatField;
    qryProdutoEstoquereservaprevia: TFloatField;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentosdata: TDateField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosoperacao: TStringField;
    qryMovimentosemestoque: TFloatField;
    qryMovimentosreservado: TFloatField;
    qryMovimentostransito: TFloatField;
    qryMovimentosdemonstracao: TFloatField;
    qryMovimentosconserto: TFloatField;
    qryMovimentosfuturo: TFloatField;
    qryMovimentosdanificada: TFloatField;
    qryMovimentosestoquefisico: TFloatField;
    qryMovimentosfinanceiro: TFloatField;
    qryMovimentosvalor: TFloatField;
    qryMovimentosprecocomicms: TFloatField;
    qryMovimentosprecosemicms: TFloatField;
    qryMovimentosaliquotaipi: TFloatField;
    qryMovimentosreferencia: TStringField;
    qryMovimentostrfproduto: TLargeintField;
    qryMovimentostrffilial: TIntegerField;
    qryMovimentostrfmovimento: TIntegerField;
    qryMovimentoscodigonota: TIntegerField;
    qryEstoques_Anterior: TtecQuery;
    qryEstoques_Atual: TtecQuery;
    qryEstoques: TtecQuery;
    qryInventarioProdutoSelecionadosistema: TBooleanField;
    fdsInventario: TfrDBDataSet;
    frpInventario: TfrReport;
    fdsProdutosInventario: TfrDBDataSet;
    qryInventarionomefilial: TStringField;
    qryInventarioProdutodescricaolc: TStringField;
    qryInventariogruposfornecedores: TStringField;
    qryInventariolocalizacao: TStringField;
    qryInventariofornecedor: TIntegerField;
    qryInventariotipofornecedor: TStringField;
    qryInventarioProdutoprodutovisual: TStringField;
    qryApagarProdutosNaoInventariados: TtecQuery;
    qryInventarioProdutomovimentado: TFloatField;
    qryProdutoEstoquemovimentado: TFloatField;
    qryInventarioProdutoSaldoaposprocessamento: TFloatField;
    qryMovimentoscomexcecaosenegativo: TBooleanField;
    qryMovimentosNegativoPosteriores: TtecQuery;
    dsrMovimentosNegativoPosteriores: TtecDataSource;
    qryMovimentosNegativoPosterioresproduto: TLargeintField;
    qryMovimentosNegativoPosterioresdata: TDateField;
    qryMovimentosNegativoPosterioresemestoque: TFloatField;
    qryInventarioProdutopossuisaldonegativoposteriormente: TBooleanField;
    qryNovoInventario: TtecQuery;
    qryNovoInventarionumero: TIntegerField;
    qryNovoInventariofilial: TIntegerField;
    qryNovoInventariodata: TDateField;
    qryNovoInventariosituacao: TStringField;
    qryNovoInventariogrupos: TStringField;
    qryNovoInventarioclasses: TStringField;
    qryNovoInventariomarcas: TStringField;
    qryNovoInventariogruposfornecedores: TStringField;
    qryNovoInventariolocalizacao: TStringField;
    qryNovoInventariofornecedor: TIntegerField;
    qryNovoInventariotipofornecedor: TStringField;
    qryNovoInventarioprocessamento: TDateField;
    qryNovoInventarioProduto: TtecQuery;
    qryNovoInventarioProdutoinventario: TIntegerField;
    qryNovoInventarioProdutosequencia: TIntegerField;
    qryNovoInventarioProdutoproduto: TLargeintField;
    qryNovoInventarioProdutoquantidade: TFloatField;
    qryNovoInventarioProdutoselecionadosistema: TBooleanField;
    qryInventarioTransferido: TtecQuery;
    dsrInventarioTransferido: TtecDataSource;
    qryInventarioTransferidonumero: TIntegerField;
    qryInventarioTransferidofilial: TIntegerField;
    qryInventarioTransferidodata: TDateField;
    qryInventariotransferidopara: TIntegerField;
    qryInventarioAberto: TtecQuery;
    dsrInventarioAberto: TtecDataSource;
    qryInventarioAbertonumero: TIntegerField;
    qryInventarioAbertodata: TDateField;
    qryInventarioAbertosituacao: TStringField;
    qryInventarioAbertotransferidopara: TIntegerField;
    qryInventarioAbertoselecionar: TBooleanField;
    qryInventarioProdutoTransferencia: TtecQuery;
    dsrInventarioProdutoTransferencia: TtecDataSource;
    qryInventarioProdutoTransferenciaproduto: TLargeintField;
    qryInventarioProdutoTransferenciaquantidade: TFloatField;
    qryInventarioProdutoTransferenciaprodutovisual: TStringField;
    qryInventarioProdutoTransferenciadescricao: TStringField;
    qryInventarioProdutoTransferenciavalorgrade1: TStringField;
    qryInventarioProdutoTransferenciavalorgrade2: TStringField;
    qryInventarioProdutoTransferencialinha: TStringField;
    qryInventarioProdutoTransferenciacoluna: TStringField;
    qryInventarioProdutocodigobarras: TStringField;
    qryInventarioProdutovalorcusto: TFloatField;
    qryInventariodescricaodeprodutos: TStringField;
    qryArquivoImportacao: TtecQuery;
    qryArquivoImportacaoproduto: TStringField;
    qryArquivoImportacaoquantidade: TFloatField;
    qryInventarioProdutoprodutodigitado: TStringField;
    qryInventarioProdutoTransferenciaprodutodigitado: TStringField;
    qryInventarioinvforalinhal: TBooleanField;
    qryInventarioinvinativol: TBooleanField;
    qryInventarioinvemlinhal: TBooleanField;
    qryInventarioinvativol: TBooleanField;
    qryInventarioProdutocustomedio: TFloatField;
    qryInventarioProdutofinanceiro: TFloatField;
    qryMovimentosNegativoPosterioresreservado: TFloatField;
    qryMovimentosNegativoPosterioresreservaprevia: TFloatField;
    qryInventarioProdutodiferenca: TFloatField;
    qryInventariodata: TDateField;
    qryInventarioprocessamento: TDateField;
    qryAtualizaInventarioAposProcessamento: TtecQuery;
    qryTemp: TtecQuery;
    qryInventarioProdutofinanceiroprocessamento: TFloatField;
    qryMovimentosinventario: TIntegerField;
    qryAtualizaInventarioAntesProcessamento: TtecQuery;
    qryQuantidadeNaoInventariada: TtecQuery;
    qryQuantidadeNaoInventariadaqt: TLargeintField;
    qryInventarioProdutolocalizacao: TStringField;
    qryInventarioProdutoTransferencialocalizacao: TStringField;
    qryProdutoEstoquelocalizacao: TStringField;
    qryApagarMovimentosInventario: TtecQuery;
    qryInventarioProdutoalterado: TBooleanField;
    qryInventarioProdutodatahoraalteracao: TDateTimeField;
    qryExisteMovimentacaoPosterior: TtecQuery;
    qryProdutoEstoquesublocalizacao: TStringField;
    qryInventarioProdutosublocalizacao: TStringField;
    qryInventarioProdutoTransferenciasublocalizacao: TStringField;
    qryInventarioProdutoLotes: TtecQuery;
    dsrInventarioProdutoLotes: TtecDataSource;
    qryInventarioProdutoLotesprodutovisual: TStringField;
    qryInventarioProdutoLotescodigobarras: TStringField;
    qryInventarioProdutoLotesdescricao: TStringField;
    qryInventarioProdutoLotesvalorgrade1: TStringField;
    qryInventarioProdutoLotesvalorgrade2: TStringField;
    qryInventarioProdutoLoteslote: TLargeintField;
    qryInventarioProdutoLotesnrlote: TStringField;
    qryInventarioProdutoLoteslocalizacao: TStringField;
    qryInventarioProdutoLotessublocalizacao: TStringField;
    qryInventarioProdutoLoteslinha: TStringField;
    qryInventarioProdutoLotescoluna: TStringField;
    qryInventarioProdutoLotesemestoque: TFloatField;
    qryInventarioProdutoLotesreservado: TFloatField;
    qryInventarioProdutoLotesreservaprevia: TFloatField;
    qryInventarioProdutoLotestransito: TFloatField;
    qryInventarioProdutoLotessaldoaposprocessamento: TFloatField;
    qryInventarioProdutoLotesmovimentado: TFloatField;
    qryInventarioProdutoLotesdemonstracao: TFloatField;
    qryInventarioProdutoLotesconserto: TFloatField;
    qryInventarioProdutoLotesdanificada: TFloatField;
    qryInventarioProdutoLotescustomedio: TFloatField;
    qryInventarioProdutoLotesfinanceiro: TFloatField;
    qryInventarioProdutoLotesfinanceiroprocessamento: TFloatField;
    qryInventarioProdutoLotespossuisaldonegativoposteriormen: TBooleanField;
    qryInventarioProdutoLotesvalorcusto: TFloatField;
    qryInventarioProdutoLotesdiferenca: TFloatField;
    qryInventarioProdutoLotesinventario: TIntegerField;
    qryInventarioProdutoLotessequencia: TIntegerField;
    qryInventarioProdutoLotesproduto: TLargeintField;
    qryInventarioProdutoLotesquantidade: TFloatField;
    qryInventarioProdutoLotesselecionadosistema: TBooleanField;
    qryInventarioProdutoLotesprodutodigitado: TStringField;
    qryInventarioProdutoLotesdatahoraalteracao: TDateTimeField;
    qryInventarioProdutoLotesalterado: TBooleanField;
    qryInventarioProdutoLotesdescricaolc: TStringField;
    qryInventarioProdutogerenciarloteevalidade: TBooleanField;
    qryInventarioProdutoLotessaldoestoque: TFloatField;
    qryIncluirInventarioProdutosLotes: TtecQuery;
    qryMovimentosloteproduto: TLargeintField;
    qryProdutoEstoqueLotes: TtecQuery;
    qryProdutoEstoqueLotesproduto: TLargeintField;
    qryProdutoEstoqueLotesfilial: TIntegerField;
    qryProdutoEstoqueLotesloteproduto: TLargeintField;
    qryProdutoEstoqueLotesdata: TDateField;
    qryProdutoEstoqueLoteslancto: TIntegerField;
    qryProdutoEstoqueLotesemestoque: TFloatField;
    qryProdutoEstoqueLotesreservado: TFloatField;
    qryProdutoEstoqueLotestransito: TFloatField;
    qryProdutoEstoqueLotesdemonstracao: TFloatField;
    qryProdutoEstoqueLotesconserto: TFloatField;
    qryProdutoEstoqueLotesdanificada: TFloatField;
    qryProdutoEstoqueLotesreservaprevia: TFloatField;
    qryProdutoEstoqueLotesmovimentado: TFloatField;
    qryProdutoEstoqueLoteslocalizacao: TStringField;
    qryProdutoEstoqueLotessublocalizacao: TStringField;
    qryProdutoEstoqueLotesnrlote: TStringField;
    qryInventarioProdutoLotesTotais: TtecQuery;
    qryInventarioProdutoLotesTotaisproduto: TLargeintField;
    qryInventarioProdutoLotesTotaisquantidade: TFloatField;
    qryInventarioProdutoLotesTotaisemestoque: TFloatField;
    qryInventarioProdutoLotesTotaisreservado: TFloatField;
    qryInventarioProdutoLotesTotaistransito: TFloatField;
    qryInventarioProdutoLotesTotaismovimentado: TFloatField;
    qryInventarioProdutoLotesTotaisdemonstracao: TFloatField;
    qryInventarioProdutoLotesTotaisconserto: TFloatField;
    qryInventarioProdutoLotesTotaisreservaprevia: TFloatField;
    qryInventarioProdutoLotesTotaisdanificada: TFloatField;
    fdsProdutosInventarioLotes: TfrDBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    qryInventarioProdutoLotesinicio: TDateField;
    procedure qryInventarioAfterOpen(DataSet: TDataSet);
    procedure qryInventarioAfterInsert(DataSet: TDataSet);
    procedure qryInventarioNewRecord(DataSet: TDataSet);
    procedure qryInventarioProdutoAfterScroll(DataSet: TDataSet);
    procedure qryInventarioProdutoAfterOpen(DataSet: TDataSet);
    procedure qryInventarioProdutoAfterPost(DataSet: TDataSet);
    procedure qryInventarioProdutoAfterDelete(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryInventarioProdutoNewRecord(DataSet: TDataSet);
    procedure qryInventarioCalcFields(DataSet: TDataSet);
    procedure qryInventarioProdutoCalcFields(DataSet: TDataSet);
    procedure qryInventarioAfterScroll(DataSet: TDataSet);
    procedure dsrInventarioDataChange(Sender: TObject; Field: TField);
    procedure qryInventarioProdutoBeforePost(DataSet: TDataSet);
    procedure frpInventarioBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryEstoquesProgress(Sender: TObject; Stage: TZProgressStage;
      Proc: TZProgressProc; Position, Max: Integer; var Cancel: Boolean);
    procedure qryMovimentosNewRecord(DataSet: TDataSet);
    procedure qryMovimentosNegativoPosterioresAfterOpen(DataSet: TDataSet);
    procedure qryMovimentosNegativoPosterioresAfterClose(
      DataSet: TDataSet);
    procedure qryInventarioProdutoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryInventarioProdutoLotesCalcFields(DataSet: TDataSet);
    procedure qryInventarioProdutoLotesAfterDelete(DataSet: TDataSet);
    procedure qryInventarioProdutoLotesBeforePost(DataSet: TDataSet);
    procedure qryInventarioProdutoLotesNewRecord(DataSet: TDataSet);
    procedure qryInventarioProdutoLotesAfterPost(DataSet: TDataSet);
    procedure fdsProdutosInventarioNext(Sender: TObject);
    procedure frpInventarioGetValue(const ParName: String;
      var ParValue: Variant);
  private
{    GerandoProdutosNaoIdentificados : Boolean;}
    FOnScrollLinhaColunaGrade: TNotifyEvent;
{    FListaProdutosSelecionados: String;}
    FNrSequenciaProduto: integer;
    FSomenteLeitura: Boolean;
    FOnScrollInventario: TNotifyEvent;
    FAfterOpenCloseMovimentosNegativoPosteriores: TNotifyEvent;
    FOnScrollInventario2: TNotifyEvent;
    fVisualizarImagem: TNotifyEvent;
    FAfterChangeqryInventarioProdutoLotes: TNotifyEvent;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
    procedure SetSomenteLeitura(const Value: Boolean);
    function GetLocalizacao: String;
    function ValidarTotaisLotes: Boolean;
    { Private declarations }
  protected
    procedure AbrirInventarioprodutos;
    procedure ReatualizarInventarioprodutos;
    procedure AtualizaListaItemProdutos;
//    procedure AtualizaListaItemProdutosLotes;

    procedure EditarInventario;
    function NumeroInventario: Integer;


  public
    { Public declarations }
    fExisteDiferencaAposProcessado: Boolean;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure IncluirInventario;
    procedure ExcluirInventario;
    procedure CopiarItensNegativos;
    function ExcluirItensNegativos: boolean;
    function GravarInventario: Boolean;
    procedure IncluirProdutosInventario(editar: Boolean);
    procedure ExcluirProdutosInventario;
    procedure ExcluirProdutosnaoInventariados;
    function GravarProdutosInventario(Owner: TComponent): Boolean;
    property OnScrollLinhaColunaGrade : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property OnScrollInventario : TNotifyEvent read FOnScrollInventario write FOnScrollInventario;
    property OnScrollInventario2 : TNotifyEvent read FOnScrollInventario2 write FOnScrollInventario2;

    property VisualizarImagem: TNotifyEvent read fVisualizarImagem write fVisualizarImagem;

    property AfterOpenCloseMovimentosNegativoPosteriores: TNotifyEvent read FAfterOpenCloseMovimentosNegativoPosteriores write FAfterOpenCloseMovimentosNegativoPosteriores;
    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
{    property ListaProdutosSelecionados: String read FListaProdutosSelecionados write FListaProdutosSelecionados;}
    property NrSequenciaProduto: integer read FNrSequenciaProduto write FNrSequenciaProduto;
    procedure AtribuirQuantidades;
    procedure AtribuirQuantidadesLotes(TodosLotes: Boolean = true);

    function GerarMovimentos: boolean;

    procedure GerarProdutosNaoIdentificados(SomenteComEstoque: Boolean);

    property SomenteLeitura: Boolean read FSomenteLeitura write SetSomenteLeitura;
    procedure ImprimirInventario;
    property Localizacao: String read GetLocalizacao;
    function ExisteDiferencaAposProcessado: boolean;
    procedure FiltrarItensNegativos(VisualizarItensNegativos: boolean);
    function HaInventarioCopiarSelecionado: Boolean;
    procedure SelecionarInventarioCopiar(Marcar, Todos: Boolean);
    procedure IncluirProdutosInventarioCopia;
    function AbrirInventarioAberto: boolean;
    function ProcessarArquivoImportacao(Arquivo: String): boolean;

    function GetProduto: String;

    property AfterChangeqryInventarioProdutoLotes: TNotifyEvent read FAfterChangeqryInventarioProdutoLotes write FAfterChangeqryInventarioProdutoLotes;


  end;

var
  dtmCadastroInventario: TdtmCadastroInventario;
  ListadeItemProdutos, ListadeProdutos, ListadeGrupos, ListadeClasses, ListadeMarcas, ListaCondicionalPromocoes: String;


implementation

uses DateUtils;

{$R *.dfm}

{ TdtmCadastroInventario }

procedure TdtmCadastroInventario.AbrirInventarioprodutos;
begin
  if (qryInventario.State = dsinsert) or
     (not qryinventario.IsEmpty) then
  begin

    if (qryInventarioProduto.Parambyname('filial').AsInteger <> qryInventariofilial.Asinteger) or
       (qryInventarioProduto.Parambyname('data').AsDateTime <> qryInventariodata.AsDateTime) or
       (qryInventarioProduto.Parambyname('MovimentoProcessado').AsBoolean <> (qryInventariosituacao.AsString = 'P')) or
       (qryInventarioProduto.Parambyname('processamento').AsDateTime <> qryInventarioprocessamento.AsDateTime) or
       (qryInventarioProduto.ParambyName('inventario').AsInteger <> qryInventarionumero.AsInteger) then
      ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                [qryInventariofilial.Asinteger,
                                                 qryInventariodata.AsDateTime,
                                                 (qryInventariosituacao.AsString = 'P'),
                                                 qryInventarioprocessamento.AsDateTime,
                                                 qryInventarionumero.asinteger]);


    if (qryInventarioProdutoLotes.Parambyname('filial').AsInteger <> qryInventariofilial.Asinteger) or
       (qryInventarioProdutoLotes.Parambyname('data').AsDateTime <> qryInventariodata.AsDateTime) or
       (qryInventarioProdutoLotes.Parambyname('MovimentoProcessado').AsBoolean <> (qryInventariosituacao.AsString = 'P')) or
       (qryInventarioProdutoLotes.Parambyname('processamento').AsDateTime <> qryInventarioprocessamento.AsDateTime) or
       (qryInventarioProdutoLotes.ParambyName('inventario').AsInteger <> qryInventarionumero.AsInteger) then
      ReFazConsultaporNome(qryInventarioProdutoLotes,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                [qryInventariofilial.Asinteger,
                                                 qryInventariodata.AsDateTime,
                                                 (qryInventariosituacao.AsString = 'P'),
                                                 qryInventarioprocessamento.AsDateTime,
                                                 qryInventarionumero.asinteger]);


    SomenteLeitura := (qryInventariosituacao.AsString = 'P');
  end
  else
  if qryInventarionumero.AsInteger = 0 then
  begin
    qryInventarioProduto.Params[0].Clear;
    qryInventarioProduto.Params[1].Clear;
    qryInventarioProduto.Params[2].Clear;
    qryInventarioProduto.Params[3].Clear;
    qryInventarioProduto.Params[4].Clear;
    qryInventarioProduto.Close;

    qryInventarioProdutoLotes.Params[0].Clear;
    qryInventarioProdutoLotes.Params[1].Clear;
    qryInventarioProdutoLotes.Params[2].Clear;
    qryInventarioProdutoLotes.Params[3].Clear;
    qryInventarioProdutoLotes.Params[4].Clear;
    qryInventarioProdutoLotes.Close;

  end;
end;

constructor TdtmCadastroInventario.Create(AOwner: TComponent);
begin
  inherited;
  refazconsultapornome(qryInventario,['numero'], [0]);

  qryInventarioProdutoquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoreservado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutotransito.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutomovimentado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutodiferenca.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutodemonstracao.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoconserto.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutodanificada.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoreservaprevia.DisplayFormat := ParSistema.MascaraQuantidadeGrade;

  

  qryInventarioProdutoLotesquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesreservado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotestransito.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesmovimentado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesdiferenca.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesdemonstracao.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesconserto.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesdanificada.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryInventarioProdutoLotesreservaprevia.DisplayFormat := ParSistema.MascaraQuantidadeGrade;




{  ListaProdutosSelecionados := ' and p.codigo <> 0 ';}
end;

destructor TdtmCadastroInventario.Destroy;
begin

  inherited;
end;

procedure TdtmCadastroInventario.ExcluirInventario;
begin
  if not qryInventario.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o INVENTÁRIO'])) = smbOk) then
    begin
      qryApagarMovimentosInventario.parambyname('inventario').asinteger :=
        qryInventarionumero.asinteger;

      qryApagarMovimentosInventario.execsql;
      qryInventario.Delete;

      Perpetrar([qryApagarMovimentosInventario, qryInventario]);
    end;
end;

function TdtmCadastroInventario.GravarInventario: Boolean;
begin
  result := false;
  if qryInventario.CheckRequiredFields(false, true, true, self.Owner, false, true) then
  begin
    {if not qryInventarioProduto.IsEmpty then
    begin}
      if qryInventario.State = dsinsert then
          qryInventarionumero.AsInteger := NumeroInventario;
      //Desligar verificação para produto incluido pelo sistema qdo na geração
      // dos produtos que não estão no inventário
      qryInventarioProduto.BeforePost := nil;

      qryInventarioProduto.AfterScroll := nil;
      qryInventarioProduto.AfterPost := nil;


      GuardarRegistroAtual(qryInventarioProduto,true);
      qryInventarioProduto.First;
      while not qryInventarioProduto.Eof do
      begin
        if (qryInventarioProdutoinventario.IsNull) {or
           (qryInventarioProdutoSequencia.AsInteger <> qryInventarioProduto.RecNo)} then
        begin
          qryInventarioProduto.Edit;
          qryInventarioProdutoinventario.AsInteger := qryInventarionumero.AsInteger;
//          qryInventarioProdutoSequencia.AsInteger := qryInventarioProduto.RecNo;
          qryInventarioProduto.Post;
        end;
        qryInventarioProduto.Next;
      end;
      VoltarRegistroAtual(qryInventarioProduto);
      //Religar verificação para produto incluido pelo sistema qdo na geração
      // dos produtos que não estão no inventário
      qryInventarioProduto.BeforePost := qryInventarioProdutoBeforePost;
      qryInventarioProduto.AfterScroll := qryInventarioProdutoAfterScroll;
      qryInventarioProduto.AfterPost := qryInventarioProdutoAfterPost;

      if (qryInventario.State in [dsinsert, dsedit]) then
        qryInventario.Post;

      result := Perpetrar([qryinventario, qryInventarioProduto, qryInventarioProdutoLotes, qryInventarioAberto]);
    {end
    else
      MensagemAviso(ctNAOEXISTEMITENSCADASTRADOS)}
  end;
end;

procedure TdtmCadastroInventario.IncluirInventario;
begin
  qryInventario.Insert;
  qryInventarionumero.AsInteger := NumeroInventario;
end;

procedure TdtmCadastroInventario.qryInventarioAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AbrirInventarioProdutos;
  if qryinventario.State<>dsinsert then
    if Assigned(OnScrollInventario) then
      OnScrollInventario(qryInventario);

end;

procedure TdtmCadastroInventario.qryInventarioAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  AbrirInventarioprodutos;
end;

procedure TdtmCadastroInventario.qryInventarioNewRecord(DataSet: TDataSet);
begin
  inherited;
  {A: Aberto
   B: Processado}
  qryInventariosituacao.AsString := 'A';
  qryInventariodata.AsDateTime := DataLocal;
  qryInventarioprocessamento.AsDateTime := qryInventariodata.AsDateTime;
  qryInventarionumero.AsInteger := NumeroInventario;


end;

procedure TdtmCadastroInventario.ExcluirProdutosInventario;
begin
  if not qryInventarioProduto.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o PRODUTO DO INVENTÁRIO'])) = smbOk) then
    begin
      qryInventarioProdutoLotes.first;
      while not qryInventarioProdutoLotes.eof do
        qryInventarioProdutoLotes.delete;
        
      qryInventarioProduto.Delete;
      gravarInventario;
{      EditarInventario;}
    end;
end;

function TdtmCadastroInventario.GravarProdutosInventario(Owner: TComponent): Boolean;
begin
  result := qryInventarioProduto.CheckRequiredFields(False, false, True, Owner, true, true);
  if result   then
  begin
    qryInventarioProdutolotes.first;
    while not qryInventarioProdutolotes.eof do
    begin
      result := qryInventarioProdutolotes.CheckRequiredFields(false, qryInventarioProdutogerenciarloteevalidade.asBoolean, True, Owner, true, true);
      if not result then
        break
      else
      qryInventarioProdutolotes.next;
    end;

    if result then
    begin
      result := true;
      qryInventarioProduto.Post;
      result := GravarInventario;
    end;

  end;
end;

procedure TdtmCadastroInventario.IncluirProdutosInventario(editar: Boolean);
begin
  if not editar or qryInventarioProduto.IsEmpty then
    qryInventarioProduto.Append;
end;

procedure TdtmCadastroInventario.AtualizaListaItemProdutos;
var
  Pos: TBookmark;
begin


  Pos := qryInventarioProduto.GetBookmark;
  qryInventarioProduto.DisableControls;


  try

    qryInventarioProduto.SortClear;
    qryInventarioProduto.SortDescByField('sequencia');
    qryInventarioProduto.first;
    NrSequenciaProduto := qryInventarioProdutoSequencia.AsInteger + 1;

    {
    qryInventarioProduto.First;
    while Not qryInventarioProduto.Eof do
    begin
      if qryInventarioProdutoSequencia.AsInteger > NrSequenciaProduto then
        NrSequenciaProduto := qryInventarioProdutoSequencia.AsInteger;
      qryInventarioProduto.Next
    end;

    NrSequenciaProduto := NrSequenciaProduto + 1;
    }

  finally
    qryInventarioProduto.GotoBookmark(Pos);
    qryInventarioProduto.FreeBookmark(Pos);
    qryInventarioProduto.EnableControls;
    TtecDBGrid(self.Owner.FindComponent('dbgProdutosInventario')).RefazerOrdenacao(nil);
    {
    if TtecDBGrid(self.Owner.FindComponent('dbgProdutosInventario')).Ordenacao <> '' then
    begin
      case TtecDBGrid(self.Owner.FindComponent('dbgProdutosInventario')).TipoOrdenacao of
      TipoOrdenacao
      qryInventarioProduto.
      }

  end
end;

procedure TdtmCadastroInventario.qryInventarioProdutoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if not qryInventarioProduto.controlsdisabled then
  begin

    if Assigned(OnScrollLinhaColunaGrade) then
      OnScrollLinhaColunaGrade(qryInventarioProduto);

    if Assigned(VisualizarImagem) then
      VisualizarImagem(qryInventarioProduto);

    if assigned(AfterChangeqryInventarioProdutoLotes)  then
      AfterChangeqryInventarioProdutoLotes(DataSet);
  end;


end;

function TdtmCadastroInventario.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryInventarioProdutocoluna.AsString)
end;

function TdtmCadastroInventario.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryInventarioProdutolinha.AsString)
end;

procedure TdtmCadastroInventario.qryInventarioProdutoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryInventarioProduto.Filtered := false;
  qryInventarioProdutovalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryInventarioProdutovalorgrade2.Visible := ParSistema.UsarGradesProdutos;
  AtualizaListaItemProdutos;
end;

procedure TdtmCadastroInventario.qryInventarioProdutoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaListaItemProdutos;
{  editarInventario;}
end;

procedure TdtmCadastroInventario.qryInventarioProdutoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaListaItemProdutos
end;


procedure TdtmCadastroInventario.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\acessos.sql') then
    Listar.loadfromfile('c:\acessos.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\acessos.sql');
  listar.free;
end;

procedure TdtmCadastroInventario.qryInventarioProdutoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryInventarioProdutoinventario.AsInteger := qryInventarionumero.AsInteger;
  qryInventarioProdutoSequencia.AsInteger := NrSequenciaProduto;
//  qryInventarioProdutoquantidade.AsCurrency := ParSistema.ValordaQuantidade;

end;

procedure TdtmCadastroInventario.qryInventarioCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryInventariosituacao.AsString = 'A' then
    qryInventarioDescricaoSituacao.AsString := 'ABERTO'
  else
  if qryInventariosituacao.AsString = 'P' then
    qryInventarioDescricaoSituacao.AsString := 'PROCESSADO'
  else
  if qryInventariosituacao.AsString = 'T' then
    qryInventarioDescricaoSituacao.AsString := 'TRANSFERIDO P/ INVENTÁRIO Nº '+qryInventariotransferidopara.AsString;
end;

procedure TdtmCadastroInventario.qryInventarioProdutoCalcFields(
  DataSet: TDataSet);
var
  QtAbatida, QtAbatidaTotal : Currency;

begin
  inherited;
    qryInventarioProdutodiferenca.AsCurrency :=
      qryInventarioProdutoquantidade.AsCurrency -
      ((qryInventarioProdutoemestoque.AsCurrency +
        qryInventarioProdutoreservado.AsCurrency +
        qryInventarioProdutoreservaprevia.AsCurrency) +
        qryInventarioProdutomovimentado.AsCurrency);

  qryInventarioProdutodescricaolc.AsString :=
    qryInventarioProdutodescricao.AsString +
    qryInventarioProdutovalorgrade1.AsString +
    qryInventarioProdutovalorgrade2.AsString;

                       {
  if qryInventarioProdutoquantidade.asCurrency <> 0 then
    qryInventarioProdutofinanceiroaposinventario.asCurrency := qryInventarioProdutofinanceiro.asCurrency / qryInventarioProdutoquantidade.asCurrency
  else
    qryInventarioProdutofinanceiroaposinventario.asCurrency := 0;
    }

end;

procedure TdtmCadastroInventario.AtribuirQuantidades;
begin
  ReFazConsultaporNome(qryProdutoEstoque,['produto','filial','MovimentoProcessado','data','processamento'],
                [qryInventarioProdutoproduto.AsVariant,
                 qryInventariofilial.AsVariant,
                 (qryInventariosituacao.asString='P'),
                 qryInventariodata.AsVariant,
                 qryInventarioprocessamento.AsVariant]);

  qryInventarioProdutoemestoque.AsCurrency := qryProdutoEstoqueemestoque.AsCurrency;
  qryInventarioProdutoreservado.AsCurrency := qryProdutoEstoquereservado.AsCurrency;
  qryInventarioProdutotransito.AsCurrency := qryProdutoEstoquetransito.AsCurrency;
  qryInventarioProdutomovimentado.AsCurrency := qryProdutoEstoquemovimentado.AsCurrency;
  qryInventarioProdutodemonstracao.AsCurrency := qryProdutoEstoquedemonstracao.AsCurrency;
  qryInventarioProdutoconserto.AsCurrency := qryProdutoEstoqueconserto.AsCurrency;
  qryInventarioProdutodanificada.AsCurrency := qryProdutoEstoquedanificada.AsCurrency;
  qryInventarioProdutoreservaprevia.AsCurrency := qryProdutoEstoquereservaprevia.AsCurrency;
  qryInventarioProdutolocalizacao.AsString := qryProdutoEstoquelocalizacao.AsString;
  qryInventarioProdutoSublocalizacao.AsString := qryProdutoEstoqueSublocalizacao.AsString;



end;

procedure TdtmCadastroInventario.EditarInventario;
begin
  if not (qryinventario.state in [dsedit, dsinsert]) then
    qryinventario.edit;
end;

procedure TdtmCadastroInventario.qryInventarioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryMovimentosNegativoPosteriores.Close;
  AbrirInventarioAberto;
  AbrirInventarioProdutos;
  if qryinventario.State<>dsinsert then
    if Assigned(OnScrollInventario) then
      OnScrollInventario(qryInventario);

  if Assigned(OnScrollInventario2) then
    if qryInventarioNumero.asstring<>'' then
      OnScrollInventario2(qryInventario);

end;

function TdtmCadastroInventario.GerarMovimentos: Boolean;
var
  Usuario: TtecUsuarios;
  QtAbatida, QtAbatidaTotal : Currency;
begin
  result := false;

  if (DaysBetween(DataServidor, qryInventariodata.asDatetime) > parsistema.LimitedeDiasParaProcessamentoInventario) and
      (parsistema.LimitedeDiasParaProcessamentoInventario <> 0) then

    MensagemErro(format('Este inventário ultrapassou o limite de dias parametrizado para o processamento.'+chr(13)+
                 'Limite de dias parametrizado %d '+chr(13)+
                 'Dias desde a abertura do inventário %d',
                 [parsistema.LimitedeDiasParaProcessamentoInventario,
                  DaysBetween(DataServidor, qryInventariodata.asDatetime)]))
  else                
  begin


    QtAbatida := 0;


    refazConsultaPorNome(qryExisteMovimentacaoPosterior, ['inventario'], [qryInventarionumero.AsInteger]);

    if qryExisteMovimentacaoPosterior.recordcount <> 0  then
    begin
      result := false;
      MensagemAviso('Existem produtos movimentados após a inclusão ou alteração que devem ser revistos.');
      ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'],
                                    [qryInventariofilial.Asinteger,
                                     qryInventariodata.AsDateTime,
                                     (qryInventariosituacao.AsString = 'P'),
                                     qryInventarioprocessamento.AsDateTime,
                                     qryInventarionumero.asinteger]);

      ReFazConsultaporNome(qryInventarioProdutoLotes,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                [qryInventariofilial.Asinteger,
                                                 qryInventariodata.AsDateTime,
                                                 (qryInventariosituacao.AsString = 'P'),
                                                 qryInventarioprocessamento.AsDateTime,
                                                 qryInventarionumero.asinteger]);



    end
    else
    begin

      refazConsultaPorNome(qryQuantidadeNaoInventariada, ['inventario'], [qryInventarionumero.AsInteger]);

      if qryQuantidadeNaoInventariadaqt.AsInteger <> 0 then
        result := MensagemConfirmacao(format('Ao processar este inventário o estoque de %s itens será zerado, confirma?', [qryQuantidadeNaoInventariadaqt.AsString])) = smbOk
      else
        result :=true;

      if result then
      begin
        result := false;
        Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
        try
          if UsuarioLogin.GerenteEstoque then
            Usuario:= ObterAutorizacao(taSENHA)
          else
            Usuario:= ObterAutorizacao(taLOGIN, ctGERENTEESTOQUE, ctAUTORIZADO);

          if Assigned(Usuario) then
          begin
            if Usuario.GerenteEstoque then
            begin
              result := true;	
              qryInventarioProduto.AfterScroll := nil;
  //            TtecDBGrid(self.Owner.FindComponent('dbgProdutosInventario')).visible := false;
  //            qryInventarioProduto.DisableControls;
              try

                ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                               [qryInventariofilial.Asinteger,
                                                                 qryInventariodata.AsDateTime,
                                                                 (qryInventariosituacao.AsString = 'P'),
                                                                 qryInventarioprocessamento.AsDateTime,
                                                                 qryInventarionumero.asinteger]);


                ReFazConsultaporNome(qryInventarioProdutoLotes,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                          [qryInventariofilial.Asinteger,
                                                           qryInventariodata.AsDateTime,
                                                           (qryInventariosituacao.AsString = 'P'),
                                                           qryInventarioprocessamento.AsDateTime,
                                                           qryInventarionumero.asinteger]);

                ReFazConsultaporNome(qryInventarioProdutoLotesTotais,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                          [qryInventariofilial.Asinteger,
                                                           qryInventariodata.AsDateTime,
                                                           (qryInventariosituacao.AsString = 'P'),
                                                           qryInventarioprocessamento.AsDateTime,
                                                           qryInventarionumero.asinteger]);

                qrymovimentos.close;
                qryMovimentos.Open;
                qryInventarioProduto.First;
                while Not qryInventarioProduto.Eof do
                begin
                  if not qryInventarioProdutogerenciarloteevalidade.asBoolean then
                  begin

                    if qryInventarioProdutodiferenca.AsCurrency <> 0 then
                    begin
                      if qryInventarioProdutodiferenca.AsCurrency > 0 then
                      begin
                        qryMovimentos.Append;
                        qryMovimentosnumero.clear;
                        qryMovimentosproduto.AsLargeInt     := qryInventarioProdutoproduto.AsLargeInt;
                        qryMovimentosfilial.AsInteger       := qryInventariofilial.AsInteger;
                        qryMovimentosdata.AsDateTime        := qryInventariodata.AsDateTime;
                        qryMovimentosquantidade.AsCurrency  := abs(qryInventarioProdutodiferenca.AsCurrency);
                        qryMovimentosvalor.AsCurrency       := qryInventarioProdutovalorcusto.AsCurrency * qryMovimentosquantidade.AsCurrency;
                        qryMovimentostipomovimento.AsString := 'IE+';
                        qryMovimentosreferencia.AsString    := 'INVENTÁRIO '+qryInventarionumero.AsString;
                        qryMovimentos.Post;
                      end
                      else
                      begin
                        QtAbatidaTotal := 0;
                        QtAbatida := 0;

                        {1 - RETIRANDO QUANTIDADE EM ESTOQUE}
                        if (qryInventarioProdutoemestoque.AsCurrency<>0) and
                           (abs(qryInventarioProdutodiferenca.AsCurrency)<>QtAbatidaTotal) then
                        begin
                          if (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal) >=
                                 qryInventarioProdutoemestoque.AsCurrency then
                            QtAbatida := qryInventarioProdutoemestoque.AsCurrency
                          else
                            QtAbatida := (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal);

                          qryMovimentos.Append;
                          qryMovimentosnumero.clear;
                          qryMovimentosproduto.AsLargeInt    := qryInventarioProdutoproduto.AsLargeInt;
                          qryMovimentosfilial.AsInteger      := qryInventariofilial.AsInteger;
                          qryMovimentosdata.AsDateTime       := qryInventariodata.AsDateTime;
                          qryMovimentosquantidade.AsCurrency := QtAbatida;
                          qryMovimentosvalor.AsCurrency       := qryInventarioProdutovalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                          qryMovimentostipomovimento.AsString := 'IE-';
                          qryMovimentosreferencia.AsString   := 'INVENTÁRIO '+qryInventarionumero.AsString;
                          qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                          qryMovimentos.Post;
                          QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                        end;

                        {2 - RETIRANDO QUANTIDADE EM TRANSITO}
                        {if (qryInventarioProdutotransito.AsCurrency<>0) and
                           (abs(qryInventarioProdutodiferenca.AsCurrency)<>QtAbatidaTotal) then
                        begin
                          if (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal) >=
                                 qryInventarioProdutotransito.AsCurrency then
                            QtAbatida := qryInventarioProdutotransito.AsCurrency
                          else
                            QtAbatida := (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal);

                          qryMovimentos.Append;
                          qryMovimentosnumero.clear;
                          qryMovimentosproduto.AsLargeInt    := qryInventarioProdutoproduto.AsLargeInt;
                          qryMovimentosfilial.AsInteger      := qryInventariofilial.AsInteger;
                          qryMovimentosdata.AsDateTime       := qryInventariodata.AsDateTime;
                          qryMovimentosquantidade.AsCurrency := QtAbatida;
                          qryMovimentosvalor.AsCurrency       := qryInventarioProdutovalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                          qryMovimentostipomovimento.AsString := 'IT-';
                          qryMovimentosreferencia.AsString   := 'INVENTÁRIO '+qryInventarionumero.AsString;
                          qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                          qryMovimentos.Post;
                          QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                        end;}

                        {3 - RETIRANDO QUANTIDADE EM RESERVA}
                        if (qryInventarioProdutoreservado.AsCurrency<>0) and
                           (abs(qryInventarioProdutodiferenca.AsCurrency)<>QtAbatidaTotal) then
                        begin
                          if (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal) >=
                                 qryInventarioProdutoreservado.AsCurrency then
                            QtAbatida := qryInventarioProdutoreservado.AsCurrency
                          else
                            QtAbatida := (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal);

                          qryMovimentos.Append;
                          qryMovimentosnumero.clear;
                          qryMovimentosproduto.AsLargeInt    := qryInventarioProdutoproduto.AsLargeInt;
                          qryMovimentosfilial.AsInteger      := qryInventariofilial.AsInteger;
                          qryMovimentosdata.AsDateTime       := qryInventariodata.AsDateTime;
                          qryMovimentosquantidade.AsCurrency := QtAbatida;
                          qryMovimentosvalor.AsCurrency       := qryInventarioProdutovalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                          qryMovimentostipomovimento.AsString := 'IR-';
                          qryMovimentosreferencia.AsString   := 'INVENTÁRIO '+qryInventarionumero.AsString;
                          qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                          qryMovimentos.Post;
                          QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                        end;

                        {4 - RETIRANDO QUANTIDADE EM RESERVA PREVIA}
                        if (qryInventarioProdutoreservaprevia.AsCurrency<>0) and
                           (abs(qryInventarioProdutodiferenca.AsCurrency)<>QtAbatidaTotal) then
                        begin
                          if (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal) >=
                                 qryInventarioProdutoreservaprevia.AsCurrency then
                            QtAbatida := qryInventarioProdutoreservaprevia.AsCurrency
                          else
                            QtAbatida := (abs(qryInventarioProdutodiferenca.AsCurrency)-QtAbatidaTotal);

                          qryMovimentos.Append;
                          qryMovimentosnumero.clear;
                          qryMovimentosproduto.AsLargeInt     := qryInventarioProdutoproduto.AsLargeInt;
                          qryMovimentosfilial.AsInteger       := qryInventariofilial.AsInteger;
                          qryMovimentosdata.AsDateTime        := qryInventariodata.AsDateTime;
                          qryMovimentosquantidade.AsCurrency  := QtAbatida;
                          qryMovimentosvalor.AsCurrency       := qryInventarioProdutovalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                          qryMovimentostipomovimento.AsString := 'IP-';
                          qryMovimentosreferencia.AsString    := 'INVENTÁRIO '+qryInventarionumero.AsString;
                          qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                          qryMovimentos.Post;
                          QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                        end;

                      end;
                    end;

                  end
                  else
                  begin
                    qryInventarioProdutoLotes.first;
                    qryInventarioProdutoLotesTotais.first;
                    result := ValidarTotaisLotes;
                    if result then
                    begin
                      qryInventarioProdutoLotes.first;
                      while not qryInventarioProdutoLotes.eof do
                      begin

                        if qryInventarioProdutoLotesdiferenca.AsCurrency <> 0 then
                        begin
                          if qryInventarioProdutoLotesdiferenca.AsCurrency > 0 then
                          begin
                            qryMovimentos.Append;
                            qryMovimentosnumero.clear;
                            qryMovimentosproduto.AsLargeInt     := qryInventarioProdutoLotesproduto.AsLargeInt;
                            qryMovimentosfilial.AsInteger       := qryInventariofilial.AsInteger;
                            qryMovimentosdata.AsDateTime        := qryInventariodata.AsDateTime;
                            qryMovimentosquantidade.AsCurrency  := abs(qryInventarioProdutoLotesdiferenca.AsCurrency);
                            qryMovimentosvalor.AsCurrency       := qryInventarioProdutoLotesvalorcusto.AsCurrency * qryMovimentosquantidade.AsCurrency;
                            qryMovimentostipomovimento.AsString := 'IE+';
                            qryMovimentosreferencia.AsString    := 'INVENTÁRIO '+qryInventarionumero.AsString;

                            qryMovimentosloteproduto.asLargeint := qryInventarioProdutoLoteslote.AsLargeInt;

                            qryMovimentos.Post;
                          end
                          else
                          begin
                            QtAbatidaTotal := 0;
                            QtAbatida := 0;

                            {1 - RETIRANDO QUANTIDADE EM ESTOQUE}
                            if (qryInventarioProdutoLotesemestoque.AsCurrency<>0) and
                               (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)<>QtAbatidaTotal) then
                            begin
                              if (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal) >=
                                     qryInventarioProdutoLotesemestoque.AsCurrency then
                                QtAbatida := qryInventarioProdutoLotesemestoque.AsCurrency
                              else
                                QtAbatida := (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal);

                              qryMovimentos.Append;
                              qryMovimentosnumero.clear;
                              qryMovimentosproduto.AsLargeInt    := qryInventarioProdutoLotesproduto.AsLargeInt;
                              qryMovimentosfilial.AsInteger      := qryInventariofilial.AsInteger;
                              qryMovimentosdata.AsDateTime       := qryInventariodata.AsDateTime;
                              qryMovimentosquantidade.AsCurrency := QtAbatida;
                              qryMovimentosvalor.AsCurrency       := qryInventarioProdutoLotesvalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                              qryMovimentostipomovimento.AsString := 'IE-';
                              qryMovimentosreferencia.AsString   := 'INVENTÁRIO '+qryInventarionumero.AsString;
                              qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                              qryMovimentosloteproduto.asLargeint := qryInventarioProdutoLoteslote.AsLargeInt;

                              qryMovimentos.Post;
                              QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                            end;

                            {2 - RETIRANDO QUANTIDADE EM TRANSITO}
                            {if (qryInventarioProdutoLotestransito.AsCurrency<>0) and
                               (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)<>QtAbatidaTotal) then
                            begin
                              if (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal) >=
                                     qryInventarioProdutoLotestransito.AsCurrency then
                                QtAbatida := qryInventarioProdutoLotestransito.AsCurrency
                              else
                                QtAbatida := (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal);

                              qryMovimentos.Append;
                              qryMovimentosnumero.clear;
                              qryMovimentosproduto.AsLargeInt    := qryInventarioProdutoLotesproduto.AsLargeInt;
                              qryMovimentosfilial.AsInteger      := qryInventariofilial.AsInteger;
                              qryMovimentosdata.AsDateTime       := qryInventariodata.AsDateTime;
                              qryMovimentosquantidade.AsCurrency := QtAbatida;
                              qryMovimentosvalor.AsCurrency       := qryInventarioProdutoLotesvalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                              qryMovimentostipomovimento.AsString := 'IT-';
                              qryMovimentosreferencia.AsString   := 'INVENTÁRIO '+qryInventarionumero.AsString;
                              qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                              qryMovimentos.Post;
                              QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                            end;}

                            {3 - RETIRANDO QUANTIDADE EM RESERVA}
                            if (qryInventarioProdutoLotesreservado.AsCurrency<>0) and
                               (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)<>QtAbatidaTotal) then
                            begin
                              if (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal) >=
                                     qryInventarioProdutoLotesreservado.AsCurrency then
                                QtAbatida := qryInventarioProdutoLotesreservado.AsCurrency
                              else
                                QtAbatida := (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal);

                              qryMovimentos.Append;
                              qryMovimentosnumero.clear;
                              qryMovimentosproduto.AsLargeInt    := qryInventarioProdutoLotesproduto.AsLargeInt;
                              qryMovimentosfilial.AsInteger      := qryInventariofilial.AsInteger;
                              qryMovimentosdata.AsDateTime       := qryInventariodata.AsDateTime;
                              qryMovimentosquantidade.AsCurrency := QtAbatida;
                              qryMovimentosvalor.AsCurrency       := qryInventarioProdutoLotesvalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                              qryMovimentostipomovimento.AsString := 'IR-';
                              qryMovimentosreferencia.AsString   := 'INVENTÁRIO '+qryInventarionumero.AsString;
                              qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                              qryMovimentosloteproduto.asLargeint := qryInventarioProdutoLoteslote.AsLargeInt;

                              qryMovimentos.Post;
                              QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                            end;

                            {4 - RETIRANDO QUANTIDADE EM RESERVA PREVIA}
                            if (qryInventarioProdutoLotesreservaprevia.AsCurrency<>0) and
                               (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)<>QtAbatidaTotal) then
                            begin
                              if (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal) >=
                                     qryInventarioProdutoLotesreservaprevia.AsCurrency then
                                QtAbatida := qryInventarioProdutoLotesreservaprevia.AsCurrency
                              else
                                QtAbatida := (abs(qryInventarioProdutoLotesdiferenca.AsCurrency)-QtAbatidaTotal);

                              qryMovimentos.Append;
                              qryMovimentosnumero.clear;
                              qryMovimentosproduto.AsLargeInt     := qryInventarioProdutoLotesproduto.AsLargeInt;
                              qryMovimentosfilial.AsInteger       := qryInventariofilial.AsInteger;
                              qryMovimentosdata.AsDateTime        := qryInventariodata.AsDateTime;
                              qryMovimentosquantidade.AsCurrency  := QtAbatida;
                              qryMovimentosvalor.AsCurrency       := qryInventarioProdutoLotesvalorcusto.AsCurrency  * qryMovimentosquantidade.AsCurrency;
                              qryMovimentostipomovimento.AsString := 'IP-';
                              qryMovimentosreferencia.AsString    := 'INVENTÁRIO '+qryInventarionumero.AsString;
                              qryMovimentoscomexcecaosenegativo.AsBoolean := false;

                              qryMovimentosloteproduto.asLargeint := qryInventarioProdutoLoteslote.AsLargeInt;

                              qryMovimentos.Post;
                              QtAbatidaTotal := QtAbatidaTotal + QtAbatida;
                            end;

                          end;
                        end;
                        qryInventarioProdutoLotes.next;

                      end;
                    end;
                  end;
                  if not result then
                    break
                  else
                  qryInventarioProduto.Next;

                end;
              finally
  //              qryInventarioProduto.EnableControls;
                qryInventarioProduto.AfterScroll := qryInventarioProdutoAfterScroll;
              end;
            end
            else
             MensagemAviso(ctUSUARIOSEMPERMISSAO);
          end
          else
            result := False;

        finally
  //        TtecDBGrid(self.Owner.FindComponent('dbgProdutosInventario')).visible := true;
          Usuario.Free;
        end;

        if result then
        begin
          qryAtualizaInventarioAntesProcessamento.parambyname('inventario').asinteger := qryinventarionumero.asinteger;
          qryAtualizaInventarioAntesProcessamento.execsql;

          qryInventario.Edit;
          qryInventariosituacao.AsString := 'P';
          qryInventario.Post;

          try
            result := perpetrar([qryAtualizaInventarioAntesProcessamento, qryinventario, qryMovimentos], AguardareTerminarDentroDm);
          finally
      //      refazconsultapornome(qryInventario,['numero'], [qryInventarionumero.AsInteger]);
      //       qryInventarioAfterScroll(qryInventario);

            if ExisteDiferencaAposProcessado then
            begin

              MensagemErro('Existem diferenças entre o saldo inventariado e o saldo após o processamento.'+#10#13+
                           'Verifique os ítens em negrito.');
              result := false;
              Rollback([qryAtualizaInventarioAntesProcessamento, qryinventario,qryMovimentos]);
              qryInventario.Edit;
              qryInventariosituacao.AsString := 'A';
              qryInventario.Post;

            end
            else
            begin

              result := perpetrar([qryAtualizaInventarioAntesProcessamento, qryinventario,qryMovimentos]);

              if result then
              begin
                qryAtualizaInventarioAposProcessamento.parambyname('inventario').asinteger := qryinventarionumero.asinteger;
                qryAtualizaInventarioAposProcessamento.execsql;
                result := perpetrar([qryAtualizaInventarioAposProcessamento]);
              end;

              if result then
                SomenteLeitura := true;

              ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                          [qryInventariofilial.Asinteger,
                                                               qryInventariodata.AsDateTime,
                                                               (qryInventariosituacao.AsString = 'P'),
                                                               qryInventarioprocessamento.AsDateTime,
                                                               qryInventarionumero.asinteger]);

              ReFazConsultaporNome(qryInventarioProdutoLotes,['filial','data','MovimentoProcessado','processamento','inventario'],
                                                          [qryInventariofilial.Asinteger,
                                                           qryInventariodata.AsDateTime,
                                                           (qryInventariosituacao.AsString = 'P'),
                                                           qryInventarioprocessamento.AsDateTime,
                                                           qryInventarionumero.asinteger]);
            end;

      //      qryInventarioAfterScroll(qryInventario);

          end;

        end;

      end;
    end;
  end;

end;

procedure TdtmCadastroInventario.dsrInventarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (field = qryInventariofilial) or
     (field = qryInventariodata) or
     (field = qryInventarioprocessamento) then
    ReatualizarInventarioProdutos
  else
  if (field = qryInventarioNumero) then
  begin
    if Assigned(OnScrollInventario2) then
      OnScrollInventario2(qryInventario);
  end;
end;

procedure TdtmCadastroInventario.ReatualizarInventarioprodutos;
begin
  if qryInventarioProduto.Active then
    if ((qryInventariofilial.AsInteger <>
         qryProdutoEstoque.ParamByName('filial').AsInteger) or
        (qryInventariodata.AsDateTime <>
         qryProdutoEstoque.ParamByName('data').AsDateTime) or
        (qryInventarioprocessamento.AsDateTime <>
         qryProdutoEstoque.ParamByName('processamento').AsDateTime)) and
       not qryInventariofilial.IsNull   and
       not qryInventariodata.IsNull and
       not qryInventarioprocessamento.IsNull then
    begin
      GuardarRegistroAtual(qryInventarioProduto, true);
      qryInventarioProduto.First;
      while not qryInventarioProduto.eof do
      begin
        qryInventarioProduto.Edit;
        AtribuirQuantidades;
        qryInventarioProduto.Next;
      end;
      VoltarRegistroAtual(qryInventarioProduto);
    end;
end;


procedure TdtmCadastroInventario.SetSomenteLeitura(const Value: Boolean);
begin
  FSomenteLeitura := Value;
  if (qryInventario.State = dsinsert) or
     (qryInventariosituacao.AsString = 'A') then
  begin
    qryInventariofilial.ReadOnly := false;
    qryInventariodata.ReadOnly := false;
    qryInventarioprocessamento.ReadOnly := false;

    qryInventariosituacao.ReadOnly := false;
//    qryInventario.RequestLive := true;
    qryInventarioProduto.RequestLive := true;
    qryInventarioProdutoLotes.RequestLive := true;
  end
  else
  begin
    qryInventariofilial.ReadOnly := value;
    qryInventariodata.ReadOnly := value;
    qryInventarioprocessamento.ReadOnly := value;

    qryInventariosituacao.ReadOnly :=value;
//    qryInventario.RequestLive := not value;
    qryInventarioProduto.RequestLive := value;

    qryInventarioProdutoLotes.RequestLive := value;

  end;
end;


procedure TdtmCadastroInventario.GerarProdutosNaoIdentificados(SomenteComEstoque: Boolean);
var
 SoAtivos, SoForaLinha : String;

const
  SQL = 'and e.produto not in (select ip.produto from inventarioprodutos ip where ip.inventario = %s)';
  SQLGrupos = 'and (c.grupo in (%s))';
  SQLClasses = 'and (c.classe in (%s))';
  SQLMarcas = 'and (c.marca in (%s))';
  SQLGruposFornecedor = 'and (c.codigo in (select distinct fp.caracteristica '+
                                          'from fornecedoresprodutos fp join '+
                                              ' fornecedores f on fp.fornecedor = f.codigo '+
                                          'where f.grupofornecedor in (%s) '+
                                          'order by fp.caracteristica))';

  SQLFornecedor = 'and (c.codigo in (select fp.caracteristica '+
                                    'from fornecedoresprodutos fp '+
                                    'where fp.fornecedor = %s '+
                                    'order by fp.caracteristica))';
  SQLLocalizacao = 'and (e.localizacao in (%s))';
  SQLFiltroDescricaoProduto = 'and to_ascii(p.descricao, ''latin1'') ilike to_ascii(%s,''latin1'')';
begin

  AtualizaListaItemProdutos;
  if qryInventariodata.AsDateTime = DataLocal then
  begin
    qryEstoques.Sql.text := qryEstoques_Atual.Sql.text;
    if SomenteComEstoque then
    begin
      qryEstoques.MacroByName('SQLCondicaoQuantidade').AsString := 'and (e.emestoque+e.reservado+e.transito)<>0';
      qryEstoques.MacroByName('SQLCondicaoQuantidadeLotes').AsString := 'and (el.emestoque+el.reservado+el.transito)<>0';
    end
    else
    begin
      qryEstoques.MacroByName('SQLCondicaoQuantidade').AsString := '';
      qryEstoques.MacroByName('SQLCondicaoQuantidadeLotes').AsString := '';

    end;
  end
  else
  begin
    qryEstoques.sql.text := qryEstoques_Anterior.Sql.text;
    qryEstoques.ParamByName('data').AsDateTime := qryInventariodata.AsDateTime;
    if SomenteComEstoque then
    begin
      qryEstoques.MacroByName('SQLCondicaoQuantidade').AsString := 'and (m1.emestoque+m1.reservado+m1.transito)<>0';
      qryEstoques.MacroByName('SQLCondicaoQuantidadeLotes').AsString := 'and (ml1.emestoque+ml1.reservado+ml1.transito)<>0';
    end
    else
    begin
      qryEstoques.MacroByName('SQLCondicaoQuantidade').AsString := '';
      qryEstoques.MacroByName('SQLCondicaoQuantidadeLotes').AsString := '';
    end;
  end;

  qryEstoques.ParamByName('filial').AsInteger := qryInventariofilial.AsInteger;
  qryEstoques.MacroByName('produtosdoinventario').AsString := format(SQL,[inttostr(qryInventarionumero.AsInteger)]);

  if ListadeItemProdutos<>'' then
    qryEstoques.MacroByName('SQLFiltroItemProdutos').AsString :=  'and ('+ListadeItemProdutos+')'
  else
    qryEstoques.MacroByName('SQLFiltroItemProdutos').AsString := '';

  if ListadeProdutos<>'' then
    qryEstoques.MacroByName('SQLFiltroProdutos').AsString := ' and (' + ListadeProdutos + ')'
  else
    qryEstoques.MacroByName('SQLFiltroProdutos').AsString := '';

  if ListadeGrupos<>'' then
    qryEstoques.MacroByName('SQLFiltroGrupos').AsString := ' and (' + ListadeGrupos + ')'
  else
    qryEstoques.MacroByName('SQLFiltroGrupos').AsString := '';

  if ListadeClasses<>'' then
    qryEstoques.MacroByName('SQLFiltroClasses').AsString := ' and ('+ ListadeClasses + ')'
  else
    qryEstoques.MacroByName('SQLFiltroClasses').AsString := '';

  if ListadeMarcas<>'' then
    qryEstoques.MacroByName('SQLFiltroMarcas').AsString := ' and ('+ ListadeMarcas + ')'
  else
    qryEstoques.MacroByName('SQLFiltroMarcas').AsString := '';

  if ListaCondicionalPromocoes<>'' then
    qryEstoques.MacroByName('ListaCondicionalPromocoes').AsString := ' and ('+ ListaCondicionalPromocoes + ')'
  else
    qryEstoques.MacroByName('ListaCondicionalPromocoes').AsString := '';


  if qryInventariogruposfornecedores.AsString<>'' then
    qryEstoques.MacroByName('SQLFiltroGruposFornecedores').AsString :=
      format(SQLGruposFornecedor,[qryInventariogruposfornecedores.AsString])
  else
    qryEstoques.MacroByName('SQLFiltroGruposFornecedores').AsString := '';

  if qryInventariofornecedor.AsString<>'' then
    qryEstoques.MacroByName('SQLFiltroFornecedor').AsString :=
      format(SQLFornecedor,[qryInventariofornecedor.AsString])
  else
    qryEstoques.MacroByName('SQLFiltroFornecedor').AsString := '';

  if qryInventariolocalizacao.AsString<>'' then
    qryEstoques.MacroByName('SQLFiltroLocalizacao').AsString :=
      format(SQLLocalizacao,[Localizacao])
  else
    qryEstoques.MacroByName('SQLFiltroLocalizacao').AsString := '';

  if qryInventariodescricaodeprodutos.AsString<>'' then
    qryEstoques.MacroByName('SQLFiltroDescricaoProduto').AsString :=
      format(SQLFiltroDescricaoProduto,[quotedstr(qryInventariodescricaodeprodutos.AsString)])
  else
    qryEstoques.MacroByName('SQLFiltroDescricaoProduto').AsString := '';

  if qryInventarioprocessamento.AsDateTime <> DataLocal then
     SoForaLinha:= 'or (p.foralinha>'''+qryInventarioprocessamento.AsString+''')'
  else
     SoForaLinha:='';

  qryEstoques.MacroByName('SQLEmLinha_ForadeLinha').AsString := '';
  if qryInventarioinvemlinhal.AsBoolean and not qryInventarioinvforalinhal.asBoolean then
    qryEstoques.MacroByName('SQLEmLinha_ForadeLinha').AsString := ' and  (not (p.foralinhal) '+SoForaLinha+') and (not c.foralinhal)'
  else
  if qryInventarioinvforalinhal.asBoolean and not qryInventarioinvemlinhal.AsBoolean then
    qryEstoques.MacroByName('SQLEmLinha_ForadeLinha').AsString := ' and  (p.foralinhal or c.foralinhal)';


  if qryInventarioprocessamento.AsDateTime <> DataLocal then
    SoForaLinha:= 'or (p.foralinha>'''+qryInventarioprocessamento.AsString+''')'
  else
    SoForaLinha:='';

  qryEstoques.MacroByName('SQLEmLinha_ForadeLinha').AsString := '';
  if qryInventarioinvemlinhal.AsBoolean and not qryInventarioinvforalinhal.asBoolean then
    qryEstoques.MacroByName('SQLEmLinha_ForadeLinha').AsString := ' and  (not (p.foralinhal) '+SoForaLinha+') and (not c.foralinhal)'
  else
  if qryInventarioinvforalinhal.asBoolean and not qryInventarioinvemlinhal.AsBoolean then
    qryEstoques.MacroByName('SQLEmLinha_ForadeLinha').AsString := ' and  (p.foralinhal or c.foralinhal)';

  if qryInventarioprocessamento.AsDateTime <> DataLocal then
    SoAtivos:= 'or (p.inativo>'''+qryInventarioprocessamento.AsString+''')'
  else
    SoAtivos:='';

  if qryInventarioinvativol.AsBoolean and not qryInventarioinvinativol.asBoolean then
    qryEstoques.MacroByName('SQLAtivo_Inativo').AsString := ' and  (not (p.inativo is not null) '+ SoAtivos+ ')'
  else
  if qryInventarioinvinativol.asBoolean and not qryInventarioinvativol.AsBoolean then
    qryEstoques.MacroByName('SQLAtivo_Inativo').AsString := ' and  (p.inativo is not null)';

  if not parsistema.Inventariar_Produtos_Compostos then
    qryEstoques.MacroByName('SQLCondicaoCompostos').AsString :=  ' and not (coalesce(c.composto,false)) '
  else
    qryEstoques.MacroByName('SQLCondicaoCompostos').AsString :=  '';

  gravarInventario;
  qryestoques.ParamByName('sequencia').AsInteger := NrSequenciaProduto;
  qryestoques.ParamByName('inventario').AsInteger := qryInventarionumero.AsInteger;


  qryEstoques.ExecSql;
  perpetrar([qryestoques]);


  ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'], [qryInventariofilial.Asinteger,
                                                   qryInventariodata.AsDateTime,
                                                   (qryInventariosituacao.AsString = 'P'),
                                                   qryInventarioprocessamento.AsDateTime,
                                                   qryInventarionumero.asinteger]);

  ReFazConsultaporNome(qryInventarioProdutoLotes,['filial','data','MovimentoProcessado','processamento','inventario'], [qryInventariofilial.Asinteger,
                                                   qryInventariodata.AsDateTime,
                                                   (qryInventariosituacao.AsString = 'P'),
                                                   qryInventarioprocessamento.AsDateTime,
                                                   qryInventarionumero.asinteger]);


  AtualizaListaItemProdutos;


{
  qryInventarioProduto.AfterScroll := nil;
  qryInventarioProduto.AfterPost := nil;
  qryInventarioProduto.BeforePost := nil;
  qryInventarioProduto.OnCalcFields := nil;

  while not qryEstoques.Eof do
  begin
    if not qryInventarioProduto.Locate('produto',qryEstoquescodigoitem.AsString,[]) then
    begin
     qryInventarioProduto.Append;
     qryInventarioProdutoproduto.AsLargeInt := qryEstoquescodigoitem.AsLargeInt;
     qryInventarioProdutoprodutovisual.AsString := qryEstoquescodigoitemvisual.AsString;
     qryInventarioProdutoquantidade.AsCurrency := 0;
     qryInventarioProdutodescricao.AsString := qryEstoquesdescricaoproduto.AsString;
     qryInventarioProdutovalorgrade1.AsString := qryEstoquesvalorgrade1.AsString;
     qryInventarioProdutovalorgrade2.AsString := qryEstoquesvalorgrade2.AsString;
     qryInventarioProdutolinha.AsString := qryEstoqueslinha.AsString;
     qryInventarioProdutocoluna.AsString := qryEstoquescoluna.AsString;
     qryInventarioProdutolinha.AsString := qryEstoqueslinha.AsString;
     qryInventarioProdutoemestoque.AsCurrency := qryEstoquesemestoque.AsCurrency;
     qryInventarioProdutoreservado.AsCurrency := qryEstoquesreservado.AsCurrency;
     qryInventarioProdutotransito.AsCurrency := qryEstoquestransito.AsCurrency;
     qryInventarioProdutodemonstracao.AsCurrency := qryEstoquesdemonstracao.AsCurrency;
     qryInventarioProdutoconserto.AsCurrency := qryEstoquesconserto.AsCurrency;
     qryInventarioProdutodanificada.AsCurrency := qryEstoquesdanificada.AsCurrency;
     qryInventarioProdutoreservaprevia.AsCurrency := qryEstoquesreservaprevia.AsCurrency;
     qryInventarioProdutoSelecionadosistema.AsBoolean := true;
     qryInventarioProdutoSequencia.AsInteger := NrSequenciaProduto;
     NrSequenciaProduto := NrSequenciaProduto + 1;
     qryInventarioProduto.Post;
    end;
    qryEstoques.Next;
  end;
  GerandoProdutosNaoIdentificados := false;

  qryInventarioProduto.AfterScroll := qryInventarioProdutoAfterScroll;
  qryInventarioProduto.AfterPost := qryInventarioProdutoAfterPost;
  qryInventarioProduto.BeforePost := qryInventarioProdutoBeforePost;
  qryInventarioProduto.OnCalcFields := qryInventarioProdutoCalcFields;

  VoltarRegistroAtual(qryInventarioProduto);
  AtualizaListaItemProdutos;
  GravarInventario;
  editarInventario;}

end;

procedure TdtmCadastroInventario.qryInventarioProdutoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
{  if not GerandoProdutosNaoIdentificados then
}
    qryInventarioProdutoSelecionadosistema.AsBoolean := false;
    qryInventarioProdutodatahoraalteracao.asDateTime := DataHoraServidor;
    qryInventarioProdutoalterado.asBoolean := False;

    if qryInventarioProdutoprodutodigitado.isnull then
      qryInventarioProdutoprodutodigitado.AsString :=
        qryInventarioProdutoprodutovisual.asString;
    {
  else
    qryInventarioProdutoSelecionadosistema.AsBoolean := true;
    }
end;

procedure TdtmCadastroInventario.ImprimirInventario;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  try

    frVariables['titulo']:= 'LEVANTAMENTO DE INVENTÁRIO';
  //  frpInventario.DesignReport;
    frmPreview := TfrmPreviewPadrao.create(self);

    ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'], [qryInventariofilial.Asinteger,
                                                     qryInventariodata.AsDateTime,
                                                     (qryInventariosituacao.AsString = 'P'),
                                                      qryInventarioprocessamento.AsDateTime,
                                                      qryInventarionumero.asinteger]);

    ReFazConsultaporNome(qryInventarioProdutoLotes,['filial','data','MovimentoProcessado','processamento','inventario'],
                                              [qryInventariofilial.Asinteger,
                                               qryInventariodata.AsDateTime,
                                               (qryInventariosituacao.AsString = 'P'),
                                               qryInventarioprocessamento.AsDateTime,
                                               qryInventarionumero.asinteger]);


  //  GuardarRegistroAtual(qryInventarioProduto, false);
    qryInventarioProduto.AfterScroll := nil;

    try
     Relatorio := frmPreview.frCompositeReport;
     with frmPreview do
     begin
       frCompositeReport.Reports.Clear;
       frCompositeReport.Reports.Add(frpInventario);
       Relatorio.Preview := frmPreview.frPreviewPadrao;

//       frpInventario.designreport;

       Relatorio.ShowReport;
     end;
     frmPreview.ShowModal;
    finally
     frmPreview.Free;
  //   VoltarRegistroAtual(qryInventarioProduto);
     qryInventarioProduto.AfterScroll := qryInventarioProdutoAfterScroll;
    end;

  finally

  end;

end;

procedure TdtmCadastroInventario.frpInventarioBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpInventario, view );
end;

function TdtmCadastroInventario.NumeroInventario: Integer;
begin
  qryInventarioProximo.Open;
  result := qryInventarioProximonumero.AsInteger;
  qryInventarioProximo.Close;
end;

procedure TdtmCadastroInventario.ExcluirProdutosnaoInventariados;
begin
  if not qryInventarioProduto.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['os PRODUTOS NÃO INVENTARIADOS E COM ESTOQUE'])) = smbOk) then
    begin
      qryApagarProdutosNaoInventariados.ParamByName('inventario').AsInteger := qryInventarionumero.AsInteger;
      qryApagarProdutosNaoInventariados.ExecSql;
      perpetrar([qryApagarProdutosNaoInventariados]);

      ReFazConsultaporNome(qryInventarioProduto,['filial','data','MovimentoProcessado','processamento','inventario'], [qryInventariofilial.Asinteger,
                                                       qryInventariodata.AsDateTime,
                                                       (qryInventariosituacao.AsString = 'P'),
                                                       qryInventarioprocessamento.AsDateTime,
                                                       qryInventarionumero.asinteger]);

      AtualizaListaItemProdutos;

{
      qryInventarioProduto.DisableControls;

      qryInventarioProduto.AfterDelete := nil;
      qryInventarioProduto.AfterScroll := nil;
      qryInventarioProduto.AfterPost := nil;
      qryInventarioProduto.BeforePost := nil;
      qryInventarioProduto.OnCalcFields := nil;

      qryInventarioProduto.First;
      while not qryInventarioProduto.Eof do
      begin
        if qryInventarioProdutoSelecionadosistema.AsBoolean then
          qryInventarioProduto.Delete
        else
          qryInventarioProduto.Next;

      end;

      qryInventarioProduto.AfterScroll := qryInventarioProdutoAfterScroll;
      qryInventarioProduto.AfterPost := qryInventarioProdutoAfterPost;
      qryInventarioProduto.BeforePost := qryInventarioProdutoBeforePost;
      qryInventarioProduto.OnCalcFields := qryInventarioProdutoCalcFields;
      qryInventarioProduto.AfterDelete := qryInventarioProdutoAfterDelete;

      AtualizaListaItemProdutos;
      editarInventario;
      qryInventarioProduto.EnableControls;
}
    end;
end;

function TdtmCadastroInventario.GetLocalizacao: String;
var
  i: integer;
  lista, auxlocalizacao, local : String;
begin
 lista := '';
 auxlocalizacao := qryInventariolocalizacao.AsString;
 local := '';
 if auxlocalizacao<>'' then
 begin
   for i:=1 to length(auxlocalizacao) do
   begin
     if auxlocalizacao[i]=',' then
     begin
       lista := lista + quotedstr(local)+',';
       local := '';
     end
     else
       local := local + auxlocalizacao[i];
   end;

   if local<>'' then
     lista := lista + quotedstr(local);
 end;
 result := lista;
end;

procedure TdtmCadastroInventario.qryEstoquesProgress(Sender: TObject;
  Stage: TZProgressStage; Proc: TZProgressProc; Position, Max: Integer;
  var Cancel: Boolean);
begin
  inherited;
  ShowProgress(Sender, Stage, Proc, Position, max, Cancel);
end;

function TdtmCadastroInventario.ExisteDiferencaAposProcessado: boolean;
begin
  result := false;
  fExisteDiferencaAposProcessado := false;


  qryMovimentosNegativoPosteriores.MasterSource := nil;

  RefazConsultaPorNome(qryMovimentosNegativoPosteriores,
                       ['filial','processamento'],
                       [qryInventariofilial.Asinteger,qryInventarioprocessamento.AsDateTime]);

  result := qryMovimentosNegativoPosteriores.RecordCount<>0;
  fExisteDiferencaAposProcessado := result;

  qryInventarioProduto.BeforePost := nil;

  GuardarRegistroAtual(qryInventarioProduto,true);

  qryMovimentosNegativoPosteriores.First;
  while not qryMovimentosNegativoPosteriores.Eof do
  begin
    if qryInventarioProduto.Locate('produto',qryMovimentosNegativoPosterioresproduto.AsString,[]) then
    begin
      qryInventarioProduto.Edit;
      qryInventarioProdutopossuisaldonegativoposteriormente.AsBoolean := true;
      qryInventarioProduto.post;
    end;
    qryMovimentosNegativoPosteriores.Next;
  end;

  if Assigned(AfterOpenCloseMovimentosNegativoPosteriores) then
    AfterOpenCloseMovimentosNegativoPosteriores(qryMovimentosNegativoPosteriores);


  qryMovimentosNegativoPosteriores.MasterSource := dsrInventarioProduto;

  VoltarRegistroAtual(qryInventarioProduto);

  qryInventarioProduto.BeforePost := qryInventarioProdutoBeforePost;  


  {
  GuardarRegistroAtual(qryInventarioProduto,true);
  qryInventarioProduto.First;
  while not qryInventarioProduto.Eof do
  begin
    if (qryInventarioProdutoSaldoaposprocessamento.AsCurrency <>
        qryInventarioProdutoquantidade.AsCurrency) or
       (qryMovimentosNegativoPosteriores.RecordCount<>0) then
    begin
      fExisteDiferencaAposProcessado := true;
      result := true;
      break;
    end;
    qryInventarioProduto.Next;
  end;
  VoltarRegistroAtual(qryInventarioProduto);
  }
end;

procedure TdtmCadastroInventario.qryMovimentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryMovimentoscomexcecaosenegativo.AsBoolean := true;
  qryMovimentosinventario.asInteger := qryInventarionumero.asInteger;
end;

procedure TdtmCadastroInventario.qryMovimentosNegativoPosterioresAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
    if Assigned(AfterOpenCloseMovimentosNegativoPosteriores) then
      AfterOpenCloseMovimentosNegativoPosteriores(qryMovimentosNegativoPosteriores);
end;

procedure TdtmCadastroInventario.qryMovimentosNegativoPosterioresAfterClose(
  DataSet: TDataSet);
begin
  inherited;
    fExisteDiferencaAposProcessado := false;
    if Assigned(AfterOpenCloseMovimentosNegativoPosteriores) then
      AfterOpenCloseMovimentosNegativoPosteriores(qryMovimentosNegativoPosteriores);
end;

procedure TdtmCadastroInventario.FiltrarItensNegativos(VisualizarItensNegativos: boolean);
begin
  qryInventarioProduto.Filtered := VisualizarItensNegativos ;
end;

procedure TdtmCadastroInventario.qryInventarioProdutoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := qryInventarioProdutopossuisaldonegativoposteriormente.AsBoolean;
end;

procedure TdtmCadastroInventario.CopiarItensNegativos;
var
 i: integer;
begin
  if not qryInventario.IsEmpty then
    if (MensagemConfirmacao('Confirma a copia dos itens negativos para um novo inventário') = smbOk) then
    begin
      qryNovoInventario.Close;
      qryNovoInventario.Open;
      qryNovoInventario.Append;
      qryNovoInventarionumero.AsInteger := NumeroInventario;
      qryNovoInventariofilial.AsString := qryInventariofilial.AsString;
      qryNovoInventariodata.AsDateTime  := qryInventariodata.AsDateTime;
      qryNovoInventariosituacao.AsString := 'A';
//      qryNovoInventariogrupos.asstring := qryInventariogrupos.AsString;
//      qryNovoInventarioclasses.AsString := qryInventarioclasses.AsString;
//      qryNovoInventariomarcas.AsString := qryInventariomarcas.AsString;
      qryNovoInventariogruposfornecedores.AsString := qryInventariogruposfornecedores.AsString;
      qryNovoInventariolocalizacao.AsString := qryInventariolocalizacao.AsString;

      qryNovoInventariofornecedor.AsString := qryInventariofornecedor.AsString;
      qryNovoInventariotipofornecedor.AsString := qryInventariotipofornecedor.AsString;
      qryNovoInventarioprocessamento.AsDateTime := qryInventarioprocessamento.AsDateTime;
      qryNovoInventario.Post;


      qryNovoInventarioProduto.Close;
      qryNovoInventarioProduto.Open;

      GuardarRegistroAtual(qryInventarioProduto,true);
      qryInventarioProduto.First;
      i:=1;
      while not qryInventarioProduto.Eof do
      begin
        qryNovoInventarioProduto.Append;
        qryNovoInventarioProdutoinventario.AsInteger  := qryNovoInventarionumero.AsInteger;
        qryNovoInventarioProdutosequencia.AsInteger   := i;
        qryNovoInventarioProdutoproduto.AsString      := qryInventarioProdutoproduto.AsString ;
        qryNovoInventarioProdutoquantidade.AsCurrency := qryInventarioProdutoquantidade.AsCurrency;
        qryNovoInventarioProdutoselecionadosistema.AsBoolean := qryInventarioProdutoSelecionadosistema.AsBoolean;
        qryNovoInventarioProduto.post;
        qryInventarioProduto.Next;
        I:=I+1;
      end;
      VoltarRegistroAtual(qryInventarioProduto);
      Perpetrar([qryNovoInventario, qryNovoInventarioProduto]);

      MensagemAviso('Os produtos com saldo negativo foram copiados para o inventário n. '+qryNovoInventarionumero.AsString);

      qryNovoInventario.close;
      qryNovoInventarioProduto.close;
    end;
end;

function TdtmCadastroInventario.ExcluirItensNegativos: Boolean;
begin
  result := false;
  if not qryInventario.IsEmpty then
    if (MensagemConfirmacao('Confirma a exclusão dos itens negativos') = smbOk) then
    begin
      qryMovimentosNegativoPosteriores.close;

      qryInventarioProduto.Filtered := false;
      qryInventarioProduto.First;
      while not qryInventarioProduto.Eof do
      begin
        if qryInventarioProdutopossuisaldonegativoposteriormente.AsBoolean then
          qryInventarioProduto.Delete
        else
          qryInventarioProduto.next;
      end;
      MensagemAviso('Os produtos com saldo negativo foram excluidos. ');

      gravarinventario;

      result := true;
    end;

end;

function TdtmCadastroInventario.HaInventarioCopiarSelecionado: Boolean;
begin
  Result := False;
  if qryInventarioAberto.Active then
  begin
    try
      GuardarRegistroAtual(qryInventarioAberto,true);
      qryInventarioAberto.First;
      while not qryInventarioAberto.Eof do
      begin
        if qryInventarioAbertoselecionar.AsBoolean then
        begin
          Result := True;
          Break;
        end;
        qryInventarioAberto.Next;
      end;
      if not Result then
        Result := MensagemConfirmacao('Não existe inventário selecionado') = smbOK;
    finally
      VoltarRegistroAtual(qryInventarioAberto);
    end;
  end;

end;

procedure TdtmCadastroInventario.SelecionarInventarioCopiar(Marcar,
  Todos: Boolean);
begin
  if Todos then
  begin
    try
      GuardarRegistroAtual(qryInventarioAberto,True);
      qryInventarioAberto.First;
      while not qryInventarioAberto.Eof do
      begin
        qryInventarioAberto.Edit;
        qryInventarioAbertoselecionar.AsBoolean := Marcar;
        qryInventarioAberto.Post;
        qryInventarioAberto.Next;
      end;
    finally
      VoltarRegistroAtual(qryInventarioAberto);
    end;
  end
  else
  begin
    qryInventarioAberto.Edit;
    qryInventarioAbertoselecionar.AsBoolean := not qryInventarioAbertoselecionar.AsBoolean;
    qryInventarioAberto.Post;
  end;
end;

procedure TdtmCadastroInventario.IncluirProdutosInventarioCopia;
begin

  qryInventarioAberto.First;
  while not qryInventarioAberto.Eof do
  begin
    if qryInventarioAbertoselecionar.AsBoolean then
    begin
      RefazConsultaPorNome(qryInventarioProdutoTransferencia,['inventario'],[qryInventarioAbertonumero.AsVariant]);
      qryInventarioProdutoTransferencia.First;
      while not qryInventarioProdutoTransferencia.Eof do
      begin
        if qryInventarioProduto.Locate('produto', qryInventarioProdutoTransferenciaproduto.AsString, []) then
        begin
          qryInventarioProduto.Edit;
          qryInventarioProdutoquantidade.AsCurrency := qryInventarioProdutoquantidade.AsCurrency +
                                                       qryInventarioProdutoTransferenciaquantidade.AsCurrency;
          qryInventarioProdutoSelecionadosistema.AsBoolean := false;
          qryInventarioProduto.Post;
        end
        else
        begin
          qryInventarioProduto.Append;
          qryInventarioProdutoproduto.AsString := qryInventarioProdutoTransferenciaproduto.AsString;
          qryInventarioProdutoquantidade.AsCurrency := qryInventarioProdutoTransferenciaquantidade.AsCurrency;
          qryInventarioProdutoprodutovisual.AsString := qryInventarioProdutoTransferenciaprodutovisual.AsString;
          qryInventarioProdutoprodutodigitado.AsString := qryInventarioProdutoTransferenciaprodutodigitado.AsString;
          qryInventarioProdutodescricao.AsString := qryInventarioProdutoTransferenciadescricao.AsString;
          qryInventarioProdutovalorgrade1.AsString := qryInventarioProdutoTransferenciavalorgrade1.AsString;
          qryInventarioProdutovalorgrade2.AsString := qryInventarioProdutoTransferenciavalorgrade2.AsString;
          qryInventarioProdutolocalizacao.AsString := qryInventarioProdutoTransferencialocalizacao.AsString;
          qryInventarioProdutoSublocalizacao.AsString := qryInventarioProdutoTransferenciaSublocalizacao.AsString;


          qryInventarioProdutolinha.AsString := qryInventarioProdutoTransferencialinha.AsString;
          qryInventarioProdutocoluna.AsString :=  qryInventarioProdutoTransferenciacoluna.AsString;
          qryInventarioProdutoSelecionadosistema.AsBoolean := false;
          AtribuirQuantidades;
          qryInventarioProduto.Post;
        end;
        qryInventarioProdutoTransferencia.Next;
      end;
      qryInventarioAberto.Edit;
      qryInventarioAbertosituacao.AsString := 'T';
      qryInventarioAbertotransferidopara.AsString := qryInventarionumero.AsString;
      qryInventarioAberto.Post;
      gravarInventario;
    end;
    qryInventarioAberto.Next;
  end;

end;

function TdtmCadastroInventario.AbrirInventarioAberto: boolean;
begin
  RefazConsultaPorNome(qryInventarioAberto,['filial','inventario'],
                       [qryInventariofilial.AsVariant,
                        qryInventarionumero.AsVariant]);

  result := not qryInventarioAberto.IsEmpty;
end;

function TdtmCadastroInventario.ProcessarArquivoImportacao(
  Arquivo: String): boolean;
var
 vArquivo : TStringList;
 vRegistro: TStringList;

 i, j : integer;
 vCodigo: String;
 vQuantidade : Currency;
 vProsseguir : Boolean;

begin
  result := true;

  qryArquivoImportacao.close;
  qryArquivoImportacao.Open;
  qryArquivoImportacao.Delete;

  vArquivo := tStringlist.create;
  vArquivo.Delimiter := ',';

  vRegistro := tStringlist.create;
  vREgistro.Delimiter := ',';


//  vArquivo.strictdelimiter := true;
//  vArquivo.QuoteChar := '|';


  if fileexists(Arquivo) then
    vArquivo.loadfromfile(Arquivo);

  for i:=0 to vArquivo.Count-1 do
  begin
    vRegistro.clear;
    ExtractStrings([','], [','], pchar(trocar(vArquivo[i],',,',','+quotedstr('')+',')), vRegistro);

    vCodigo := '0';
    {
    if parsistema.PesquisaPadraoProdutoCodigoBarras then
      vCodigo := vRegistro[0]
    else
    }
    if parsistema.PermitirProdutoAlfanumerico then
      vCodigo := vRegistro[0]
    else
    if PossuiSomenteNumero(vRegistro[0]) then
      vCodigo := vRegistro[0]
    else
    begin
      result := false;
      MensagemErro('O Código do Produto - '+vRegistro[0]+ ' linha '+inttostr(i)+' não possui somente números');
      break;
    end;

    if result then
    begin
      if somentenumero(vRegistro[1])='' then
      begin
        MensagemErro('Quantidade do produto inválido - '+vRegistro[1]+ ' linha '+inttostr(i));
        result := false;
        break;
      end
      else
      begin
        vQuantidade := StrToFloat(somentenumero(vRegistro[1]));
        if qryArquivoImportacao.Locate('produto', vcodigo, []) then
        begin
          qryArquivoImportacao.Edit;
          qryArquivoImportacaoquantidade.AsFloat := qryArquivoImportacaoquantidade.AsFloat + vQuantidade;
          qryArquivoImportacao.Post;
        end
        else
        begin
          qryArquivoImportacao.Append;
          qryArquivoImportacaoproduto.AsString := vCodigo;
          qryArquivoImportacaoquantidade.AsFloat := vQuantidade;
          qryArquivoImportacao.Post;
        end;
      end;
    end;
  end;

  if result then
  begin
    qryArquivoImportacao.first;
    while not qryArquivoImportacao.Eof do
    begin
      vCodigo := qryArquivoImportacaoproduto.AsString;
      if not assigned(fraconsulta) then
        fraConsulta := TfraConsulta.Create(fraConsulta);

      if not assigned(fraconsulta) then
        fraConsulta := TfraConsulta.Create(fraConsulta);
{
      if (Parsistema.PesquisaPadraoProdutoCodigoBarras and (fraConsulta.qryProcuraItemProdutos.parambyname('codigobarras').Value <> vCodigo)) then
         RefazConsultaPorNome(fraConsulta.qryProcuraItemProdutos, ['produto','produtovisual','codigobarras'], [0,null,vCodigo])
      else
      if (Parsistema.PermitirProdutoAlfanumerico and (fraConsulta.qryProcuraItemProdutos.parambyname('produtovisual').Value <> vCodigo)) then
         RefazConsultaPorNome(fraConsulta.qryProcuraItemProdutos, ['produto','produtovisual','codigobarras'], [0,vCodigo,null])
      else
         RefazConsultaPorNome(fraConsulta.qryProcuraItemProdutos, ['produto','produtovisual','codigobarras'], [vCodigo,null,null]);
         }

      RefazConsultaPorNome(fraConsulta.qryProcuraItemProdutos, ['produtovisual'], [vCodigo]);

      if fraConsulta.qryProcuraItemProdutos.RecordCount = 0 then
        MensagemErro(format('Produto %s não cadastrado',[vCodigo]))
      else
      if qryInventarioProduto.Locate('produto',fraConsulta.qryProcuraItemProdutos.fieldbyname('produto').AsString,[]) then
      begin
        qryInventarioProduto.edit;
        qryInventarioProdutoquantidade.AsFloat := qryInventarioProdutoquantidade.AsFloat + qryArquivoImportacaoQuantidade.AsCurrency;
        qryInventarioProduto.post;
        EditarInventario;
      end
      else
      begin
        IncluirProdutosInventario(false);
        qryInventarioProdutoproduto.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('produto').AsString;
        qryInventarioProdutoquantidade.AsCurrency := qryArquivoImportacaoQuantidade.AsCurrency;
        qryInventarioProdutoprodutovisual.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('produtovisual').AsString;
        qryInventarioProdutoprodutodigitado.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('produtovisual').AsString;
        qryInventarioProdutodescricao.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('descricao').AsString;
        qryInventarioProdutovalorgrade1.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('valorgrade1').AsString;
        qryInventarioProdutovalorgrade2.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('valorgrade2').AsString;

        qryInventarioProdutolinha.AsString := fraConsulta.qryProcuraItemProdutos.fieldbyname('linha').AsString;
        qryInventarioProdutocoluna.AsString :=  fraConsulta.qryProcuraItemProdutos.fieldbyname('coluna').AsString;
        AtribuirQuantidades;
        qryInventarioProduto.Post;
        EditarInventario;
      end;
      qryArquivoImportacao.next;
    end;
  end;

  varquivo.free;
  vRegistro.free;

end;


function TdtmCadastroInventario.GetProduto: String;
begin
  result := qryInventarioProdutoproduto.asString;
end;

procedure TdtmCadastroInventario.qryInventarioProdutoLotesCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    qryInventarioProdutoLotesdiferenca.AsCurrency :=
      qryInventarioProdutoLotesquantidade.AsCurrency -
      ((qryInventarioProdutoLotesemestoque.AsCurrency +
        qryInventarioProdutoLotesreservado.AsCurrency +
        qryInventarioProdutoLotesreservaprevia.AsCurrency) +
        qryInventarioProdutoLotesmovimentado.AsCurrency);

  qryInventarioProdutoLotesdescricaolc.AsString :=
    qryInventarioProdutoLotesdescricao.AsString +
    qryInventarioProdutoLotesvalorgrade1.AsString +
    qryInventarioProdutoLotesvalorgrade2.AsString;

end;

procedure TdtmCadastroInventario.qryInventarioProdutoLotesAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  if assigned(AfterChangeqryInventarioProdutoLotes)  then
    AfterChangeqryInventarioProdutoLotes(DataSet);

  qryInventarioProduto.edit;
  
end;

{
procedure TdtmCadastroInventario.AtualizaListaItemProdutosLotes;
var
  Pos: TBookmark;
  Prod: Int64;

begin
  Pos := qryInventarioProdutoLotes.GetBookmark;
  qryInventarioProdutoLotes.DisableControls;
  try
    NrSequenciaProduto := 0;
    Prod := qryInventarioProdutoLotesproduto.AsLargeint;
    qryInventarioProdutoLotes.First;
    while Not qryInventarioProdutoLotes.Eof do
    begin
      if qryInventarioProdutoLotesSequencia.AsInteger > NrSequenciaProduto then
        NrSequenciaProduto := qryInventarioProdutoLotesSequencia.AsInteger;
      qryInventarioProdutoLotes.Next
    end;

    NrSequenciaProduto := NrSequenciaProduto + 1;

  finally
    qryInventarioProdutoLotes.GotoBookmark(Pos);
    qryInventarioProdutoLotes.FreeBookmark(Pos);
    qryInventarioProdutoLotes.EnableControls;
  end
end;
}

procedure TdtmCadastroInventario.qryInventarioProdutoLotesBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryInventarioProdutoLotesSelecionadosistema.AsBoolean := false;
  qryInventarioProdutoLotesdatahoraalteracao.asDateTime := DataHoraServidor;
  qryInventarioProdutoLotesalterado.asBoolean := False;

  if qryInventarioProdutoLotesquantidade.isnull then
    qryInventarioProdutoLotesquantidade.asCurrency := 0.00;
end;

procedure TdtmCadastroInventario.qryInventarioProdutoLotesNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryInventarioProdutoLotesinventario.AsInteger := qryInventarioProdutoinventario.AsInteger;
  qryInventarioProdutoLotesproduto.AsString := qryInventarioProdutoproduto.AsString;
  qryInventarioProdutoLotesSequencia.AsInteger := qryInventarioProdutoSequencia.AsInteger;
  qryInventarioProdutoLotesquantidade.asCurrency := 0.00;

end;

procedure TdtmCadastroInventario.qryInventarioProdutoLotesAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  if assigned(AfterChangeqryInventarioProdutoLotes)  then
    AfterChangeqryInventarioProdutoLotes(DataSet);

  qryInventarioProduto.edit;

end;

function TdtmCadastroInventario.ValidarTotaisLotes: Boolean;
begin
  result := true;
  if (qryInventarioProdutoquantidade.AsFloat <>
      qryInventarioProdutoLotesTotaisquantidade.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''inventariada'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'Quantidade: %f'+char(13)+
                 'Quantidade nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutoquantidade.AsFloat,
     qryInventarioProdutoLotesTotaisquantidade.asFloat]));
  end
  else
  if (qryInventarioProdutoemestoque.AsFloat <>
      qryInventarioProdutoLotesTotaisemestoque.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''em estoque'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'em Estoque: %f'+char(13)+
                 'em Estoque nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutoemestoque.AsFloat,
      qryInventarioProdutoLotesTotaisemestoque.asFloat]));
  end
  else
  if (qryInventarioProdutoreservado.AsFloat <>
      qryInventarioProdutoLotesTotaisreservado.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''Reservada'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'Reservada: %f'+char(13)+
                 'Reservada nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutoreservado.AsFloat,
      qryInventarioProdutoLotesTotaisreservado.asFloat]));
  end
  else
  if (qryInventarioProdutotransito.AsFloat <>
      qryInventarioProdutoLotesTotaistransito.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''em Trânsito'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'em Trânsito: %f'+char(13)+
                 'em Trânsito nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutotransito.AsFloat,
      qryInventarioProdutoLotesTotaistransito.asFloat]));
  end
  else
  if (qryInventarioProdutomovimentado.AsFloat <>
      qryInventarioProdutoLotesTotaismovimentado.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''Movimentada'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'Movimentada: %f'+char(13)+
                 'Movimentada nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutomovimentado.AsFloat,
      qryInventarioProdutoLotesTotaismovimentado.asFloat]));
  end
  else
  if (qryInventarioProdutodemonstracao.AsFloat <>
      qryInventarioProdutoLotesTotaisdemonstracao.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''em Demonstração'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'em Demonstração: %f'+char(13)+
                 'em Demonstração nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutodemonstracao.AsFloat,
      qryInventarioProdutoLotesTotaisdemonstracao.asFloat]));
  end
  else
  if (qryInventarioProdutoconserto.AsFloat <>
      qryInventarioProdutoLotesTotaisconserto.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''em Conserto'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'em Conserto: %f'+char(13)+
                 'em Conserto nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutoconserto.AsFloat,
      qryInventarioProdutoLotesTotaisconserto.asFloat]));
  end
  else
  if (qryInventarioProdutodanificada.AsFloat <>
      qryInventarioProdutoLotesTotaisdanificada.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''Danificada'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'Danificada: %f'+char(13)+
                 'Danificada nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutodanificada.AsFloat,
      qryInventarioProdutoLotesTotaisdanificada.asFloat]));
  end
  else
  if (qryInventarioProdutoreservaprevia.AsFloat <>
      qryInventarioProdutoLotesTotaisreservaprevia.asFloat) then
  begin
    result := false;
    MensagemErro(format('A quantidade ''em Reseva Prévia'' para o produto %s não esta fechando como os lotes'+chr(13)+
                 'em Reseva Prévia: %f'+char(13)+
                 'em Reseva Prévia nos lotes: %f',
    [qryInventarioProdutoprodutovisual.asString,
     qryInventarioProdutoreservaprevia.AsFloat,
      qryInventarioProdutoLotesTotaisreservaprevia.asFloat]));
  end;
end;

procedure TdtmCadastroInventario.AtribuirQuantidadesLotes(TodosLotes: Boolean = true);
begin
  ReFazConsultaporNome(qryProdutoEstoqueLotes,['produto','filial','lote','MovimentoProcessado','data','processamento'],
                [qryInventarioProdutoproduto.AsVariant,
                 qryInventariofilial.AsVariant,
                 ifthen_(TodosLotes, Null, qryInventarioProdutoLoteslote.asVariant),
                 (qryInventariosituacao.asString='P'),
                 qryInventariodata.AsVariant,
                 qryInventarioprocessamento.AsVariant]);

  try
    qryInventarioProdutoLotes.AfterPost := nil;
    qryInventarioProdutoLotes.BeforePost := nil;

    qryProdutoEstoqueLotes.First;
    while not qryProdutoEstoqueLotes.eof do
    begin
      if not qryInventarioProdutoLotes.Locate('produto;lote',
            VarArrayOf([qryProdutoEstoqueLotesproduto.aslargeint,
                       qryProdutoEstoqueLotesloteproduto.aslargeint]), []) then
         qryInventarioProdutoLotes.append
      else
         qryInventarioProdutoLotes.edit;

      qryInventarioProdutoLotesproduto.asLargeint := qryProdutoEstoqueLotesproduto.aslargeint;
      qryInventarioProdutoLoteslote.asLargeint := qryProdutoEstoqueLotesloteproduto.aslargeint;
      qryInventarioProdutoLotesnrlote.asString := qryProdutoEstoqueLotesnrlote.asString;

      qryInventarioProdutoLotesemestoque.AsCurrency := qryProdutoEstoqueLotesemestoque.AsCurrency;
      qryInventarioProdutoLotesreservado.AsCurrency := qryProdutoEstoqueLotesreservado.AsCurrency;
      qryInventarioProdutoLotestransito.AsCurrency := qryProdutoEstoqueLotestransito.AsCurrency;
      qryInventarioProdutoLotesmovimentado.AsCurrency := qryProdutoEstoqueLotesmovimentado.AsCurrency;
      qryInventarioProdutoLotesdemonstracao.AsCurrency := qryProdutoEstoqueLotesdemonstracao.AsCurrency;
      qryInventarioProdutoLotesconserto.AsCurrency := qryProdutoEstoqueLotesconserto.AsCurrency;
      qryInventarioProdutoLotesdanificada.AsCurrency := qryProdutoEstoqueLotesdanificada.AsCurrency;
      qryInventarioProdutoLotesreservaprevia.AsCurrency := qryProdutoEstoqueLotesreservaprevia.AsCurrency;
      qryInventarioProdutoLoteslocalizacao.AsString := qryProdutoEstoqueLoteslocalizacao.AsString;
      qryInventarioProdutoLotesSublocalizacao.AsString := qryProdutoEstoqueLotesSublocalizacao.AsString;

      if (qryInventarioProduto.state = dsinsert) then
      begin
        qryInventarioProduto.post;
        qryInventarioProduto.edit;
      end;

      if (qryInventarioProdutolotes.state in [dsinsert,dsedit]) then
        qryInventarioProdutoLotes.Post;

      qryProdutoEstoqueLotes.next;
    end;

  finally
    qryInventarioProdutoLotes.AfterPost := qryInventarioProdutoLotesAfterPost;
    qryInventarioProdutoLotes.BeforePost := qryInventarioProdutoLotesBeforePost;

    qryInventarioProduto.edit;

  end
end;

procedure TdtmCadastroInventario.fdsProdutosInventarioNext(
  Sender: TObject);
begin
  inherited;
  qryInventarioProdutoLotes.First;
end;

procedure TdtmCadastroInventario.frpInventarioGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if ParName = 'MascaraQuantidade' then
    ParValue := parsistema.MascaraQuantidadeGrade;

end;

end.
