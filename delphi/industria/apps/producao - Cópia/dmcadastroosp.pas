unit dmcadastroosp;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, clparametrossistema, biblio, ctconstantes, Forms, DateUtils,
  ZTransact, clUsuario, Windows, dmimprimeosp, Controls;

Const cmpcodigo        = 1;   PosicaoAtual = 0;
                              Primeiro     = 1;
                              Anterior     = 2;
                              Proximo      = 3;
                              Ultimo       = 4;


type
  TipoOperacao = (inclusao, alteracao, exclusao);

type
  TdtmCadastroOSP = class(TdtmBasico)
    qryOSP: TtecQuery;
    qryOSPnumero: TIntegerField;
    qryOSPentrega: TDateField;
    qryOSPsemana: TIntegerField;
    qryOSPprioridade: TIntegerField;
    dsrOSP: TtecDataSource;
    qryOSPProximo: TtecQuery;
    qryOSPProximonumero: TIntegerField;
    qryOSPano: TIntegerField;
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto: TLargeintField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutosorigem: TStringField;
    dsrClientesProdutos: TtecDataSource;
    qryOSPobservacoes: TStringField;
    qryOSPproduto: TLargeintField;
    qryOSPcomplementoproduto: TStringField;
    qryOSPdata: TDateField;
    qryOSPpedidocliente: TStringField;
    qryOSPcliente: TIntegerField;
    qryOSPquantidade: TFloatField;
    qryOSPpreco: TFloatField;
    qryOSPqtdeentregue: TFloatField;
    qryOSPsaldo: TCurrencyField;
    qryOSPtotal: TCurrencyField;
    qryOSPprodutovisual: TStringField;
    qryOSPUltimoPreco: TtecQuery;
    qryOSPUltimoPrecoorigem: TStringField;
    qryOSPUltimoPrecopreco: TFloatField;
    qryOSPUltimoPrecodata: TDateField;
    dsrOSPUltimoPreco: TtecDataSource;
    qryOSPcaracteristicavisual: TStringField;
    qryProdutos: TtecQuery;
    qryProdutoscodigo: TLargeintField;
    qryProdutosdescricao: TStringField;
    qryProdutoscaracteristica: TLargeintField;
    qryProdutospreco: TIntegerField;
    qryProdutoscodigovisual: TStringField;
    qryOSPcaracteristica: TLargeintField;
    qryProximoNumeroProdutoICE: TtecQuery;
    qryProximoNumeroProdutoICEnumero: TLargeintField;
    qryPrecoProximoCodigo: TtecQuery;
    qryPrecos: TtecQuery;
    qryPrecoscodigo: TIntegerField;
    qryPrecosdescricao: TStringField;
    qryPrecoscaracteristica: TLargeintField;
    dsrPrecos: TtecDataSource;
    qryColunasPrecos: TtecQuery;
    dsrColunasPrecos: TtecDataSource;
    qryColunasPrecoscaracteristica: TLargeintField;
    qryColunasPrecospreco: TIntegerField;
    qryColunasPrecoscoluna: TIntegerField;
    qryColunasPrecosdata: TDateField;
    qryColunasPrecosvalor: TFloatField;
    qryOSPunidade: TStringField;
    qryOSPapelido: TStringField;
    qryOSPentrega_anterior: TDateField;
    qryOSPquantidade_anterior: TFloatField;
    qryEstoques: TtecQuery;
    qryEstoquesproduto: TLargeintField;
    qryEstoquesfilial: TIntegerField;
    qryEstoqueslocalizacao: TStringField;
    qryEstoquesminimo: TFloatField;
    qryEstoquesmaximo: TFloatField;
    qryEstoquesdescricaofilial: TStringField;
    qryEstoquesemestoque: TFloatField;
    qryEstoquesreservado: TFloatField;
    qryEstoquestransito: TFloatField;
    qryEstoquesdemonstracao: TFloatField;
    qryEstoquesconserto: TFloatField;
    qryEstoquesfuturo: TFloatField;
    qryEstoquesdanificada: TFloatField;
    qryEstoquesestoquefisico: TFloatField;
    dsrEstoques: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaistipofilial: TStringField;
    qrypnproduto: TtecQuery;
    qrypnprodutopn: TStringField;
    qrypnFamilia: TtecQuery;
    qrypnFamiliapn: TStringField;
    qryPrecoProximoCodigonumero: TIntegerField;
    qryOSPLotes: TtecQuery;
    dsrOSPLotes: TtecDataSource;
    qryOSPLotesosp: TIntegerField;
    qryOSPLotesnumero: TIntegerField;
    qryOSPLotesquantidade: TFloatField;
    qryOSPLotesexcedente: TFloatField;
    qryOSPLotesproduzida: TFloatField;
    qryClientesProdutostamloteproducao: TIntegerField;
    qryClientesProdutosexcedentepermitido: TIntegerField;
    qryOSPquantidade_lote: TFloatField;
    qryOSPexcedente_lote: TFloatField;
    qryOSPproduzida_lote: TFloatField;
    qryOSPLotesimprimir: TBooleanField;
    qryOSPLotesjaimpresso: TBooleanField;
    qryOSPpcpiniciado: TBooleanField;
    qryOSPStatusCancelamento: TSmallintField;
    qryOSPcancelado: TBooleanField;
    qryClientesProdutosrevisao: TStringField;
    qrypnprodutoorigem: TStringField;
    qrypnprodutofinalidade: TStringField;
    qrypnprodutorevisao: TStringField;
    qrypnprodutotamloteproducao: TIntegerField;
    qrypnFamiliaorigem: TStringField;
    qrypnFamiliafinalidade: TStringField;
    qrypnFamiliarevisao: TStringField;
    qrypnFamiliatamloteproducao: TIntegerField;
    qryClientesProdutostipoexcedente: TStringField;
    qrypnprodutotipoexcedente: TStringField;
    qrypnFamiliatipoexcedente: TStringField;
    qryOSPsemiacabado: TBooleanField;
    qryOSPtipocliente: TStringField;
    qrySetoresProducao: TtecQuery;
    qrySetoresProducaocodigo: TStringField;
    qrySetoresProducaodescricao: TStringField;
    qrySetoresProducaonumeropedidoosp: TIntegerField;
    qryOSPsetorproducao: TStringField;
    qryOSPdescricaosetorproducao: TStringField;
    qryUltimaOSPProduto: TtecQuery;
    qryUltimaOSPProdutodata: TDateField;
    qryAndamentoProducao: TtecQuery;
    dsrAndamentoProducao: TtecDataSource;
    procedure dsrOSPDataChange(Sender: TObject; Field: TField);
    procedure qryOSPNewRecord(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryOSPCalcFields(DataSet: TDataSet);
    procedure qryOSPAfterScroll(DataSet: TDataSet);
    procedure qryClientesProdutosNewRecord(DataSet: TDataSet);
    procedure qryClientesProdutosAfterEdit(DataSet: TDataSet);
    procedure qryClientesProdutosAfterInsert(DataSet: TDataSet);
    procedure qryOSPAfterClose(DataSet: TDataSet);
    procedure qryEstoquesNewRecord(DataSet: TDataSet);
    procedure qryOSPLotesNewRecord(DataSet: TDataSet);
    procedure qryOSPLotesAfterScroll(DataSet: TDataSet);
    procedure qryOSPLotesAfterPost(DataSet: TDataSet);
    procedure qryOSPLotesAfterDelete(DataSet: TDataSet);
    procedure qryClientesProdutosAfterScroll(DataSet: TDataSet);
    procedure dsrClientesProdutosDataChange(Sender: TObject;
      Field: TField);
    procedure qryAndamentoProducaoAfterOpen(DataSet: TDataSet);
  private
    FListaProdutosSelecionados: String;
    FExisteProdutoaVincular: Boolean;
    FNrSequenciaProduto: integer;
    FExisteProdutoVinculadoaOSP: Boolean;
    FProdutoJaCadastrado: TNotifyEvent;
    FOSPAfterScroll: TNotifyEvent;
    FAlteracaoData: TNotifyEvent;
    fQuantidadePedidaemUnidade: Currency;
    fUltimaImpressoraSelecionada: String;
    procedure GerarArquivoExportacao(operacao: tipooperacao);
    Procedure ProdutoPadraoCobol(Geracao:     Char;
                                 CodAtual:    String;
                                  Var CodCobol:    String;
                                   Var Resistencia: String);
    function GetUltimaOSP: integer;
    function GetQuantidadePedidaemUnidade: Currency;

    { Private declarations }

  protected
    function NumeroOSP: Integer;
    procedure RecalcularQuantidadesLotes;




  public
    { Public declarations }
    Percorrendo : Boolean;
    FSemana: Integer;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    property ListaProdutosSelecionados: String read FListaProdutosSelecionados write FListaProdutosSelecionados;
    procedure ExcluirOSP;
    procedure IncluirOSP;
    procedure IncluirOSPSemiAcabado;

    function GravarOSP: Boolean;
    property ExisteProdutoaVincular:Boolean read FExisteProdutoaVincular write FExisteProdutoaVincular;
    property ExisteProdutoVinculadoaOSP:Boolean read FExisteProdutoVinculadoaOSP write FExisteProdutoVinculadoaOSP;

    property NrSequenciaProduto: integer read FNrSequenciaProduto write FNrSequenciaProduto;
    procedure EditarOSP;
    function ExisteProdutonoCliente: boolean;
    procedure LimparProdutosPedidosSaida;
    property ProdutoJaCadastrado : TNotifyEvent read FProdutoJaCadastrado write FProdutoJaCadastrado;
    property OSPAfterScroll: TNotifyEvent read FOSPAfterScroll write FOSPAfterScroll;
    property AlteracaoData : TNotifyEvent read FAlteracaoData write FAlteracaoData;
    procedure IncluirProduto;
    procedure AtribuirPNProdutoCliente;
    procedure AtribuirPNFamiliaCliente;
    procedure  Percorrer(Campo: Byte; Key: Word; Shift: TShiftState);
    property UltimaOSP: integer read GetUltimaOSP;
    function ImprimirOSP: boolean;
    procedure GerarLotesdeProducao;
    procedure MarcarLotesImpressao(Todos, Marcar : boolean);
    function ExistemLotesMarcados: boolean;
    property QuantidadePedidaemUnidade: Currency read GetQuantidadePedidaemUnidade write fQuantidadePedidaemUnidade;
    function CalcularNrPedidoSetor: boolean;
    property UltimaImpressoraSelecionada: String read fUltimaImpressoraSelecionada write fUltimaImpressoraSelecionada;
    procedure VisualizarProducao;
  end;

var
  dtmCadastroOSP: TdtmCadastroOSP;

implementation

uses fmAndamentoProducao;

{$R *.dfm}

{ TdtmCadastroOSP }

constructor TdtmCadastroOSP.Create(AOwner: TComponent);
begin
  inherited;
  ReFazConsulta(qryosp,[0,1,2],[0,0,0]);
  qryOSPAfterScroll(qryOSP);
  qryOSPProximo.Open;
  qryOSPquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryOSPqtdeentregue.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryOSPsaldo.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  Percorrendo := True;
  ListaProdutosSelecionados := '0';
end;

destructor TdtmCadastroOSP.Destroy;
begin

  inherited;
end;

procedure TdtmCadastroOSP.ExcluirOSP;
begin
  if not qryOSP.IsEmpty then
  begin
    case qryOSPStatusCancelamento.AsInteger of
    0: begin
          if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a OSP'])) = smbOk) then
          begin
             GerarArquivoExportacao(exclusao);
             qryOSP.Delete;
             Perpetrar([qryOSP]);
          end;
       end;
    1: begin
          if qryOSPcancelado.AsBoolean then
          begin
            if (MensagemConfirmacao('Esta OSP já esta cancelada. Desejas anular o cancelamento?') = smbOk) then
            begin
               qryOSP.Edit;
               qryOSPcancelado.AsBoolean := false;
               qryOSP.post;
               Perpetrar([qryOSP]);
            end;
          end
          else
          if (MensagemConfirmacao(format(ctCONFIRMECANCELAR, ['a OSP'])) = smbOk) then
          begin
             qryOSP.Edit;
             qryOSPcancelado.AsBoolean := true;
             qryOSP.post;
             Perpetrar([qryOSP]);
          end;
       end;
    end;
  end;
end;

function TdtmCadastroOSP.GravarOSP: Boolean;
var
   incluindo: Boolean;
begin
  incluindo := false;
  result := false;

  if qryOSPquantidade_lote.AsInteger <> QuantidadePedidaemUnidade then
  begin
    MensagemErro('O somatório dos lotes não pode ser diferente da quantidade pedida pelo cliente');
    result := false;
  end
  else
  if (qryOSP.CheckRequiredFields) then
  begin
    if qryOSP.State = dsinsert then
    begin
      qryOSPnumero.AsInteger := NumeroOSP;
      incluindo := true;
    end
    else
    begin
      qryOSPentrega_anterior.AsDateTime := qryOSPentrega.OldValue;
      qryOSPquantidade_anterior.AsCurrency := qryOSPquantidade.OldValue;
    end;

    if qryOSPLotesosp.AsInteger <> qryOSPnumero.AsInteger then
    begin
      qryOSPLotes.First;
      while not qryOSPLotes.Eof do
      begin
        qryosplotes.AfterPost := nil;
        qryOSPLotes.Edit;
        qryOSPLotesosp.AsInteger := qryOSPnumero.AsInteger;
        qryOSPLotes.post;
        qryosplotes.AfterPost := qryOSPLotesAfterPost;

        qryOSPLotes.Next;
      end;
    end;

    if incluindo then
    begin
      RefazConsultaPorNome(qryUltimaOSPProduto,['produto'],[qryOSPproduto.AsLargeInt]);
      {Exibir mensagem se a última osp do produto ultrapassar a dois anos)}
      if not qryUltimaOSPProduto.IsEmpty and ((DataLocal - qryUltimaOSPProdutodata.AsDateTime) > (365*2)) then
        MensagemAviso(format('REVISÃO DOS DADOS DA PRODUÇÃO:'+#10#13+'A última OSP deste produto é de %s.',[qryUltimaOSPProdutodata.AsString]))
    end;


    qryOSP.Post;
    if qryClientesProdutos.State in [dsinsert, dsedit] then
       qryClientesProdutos.Post;

    result := Perpetrar([qryPrecos, qryprodutos, qryColunasPrecos, qryprodutos,
                         qryestoques, qryosp, qryClientesProdutos, qryosplotes,
                         qrySetoresProducao]);
    if result then
    begin
      if incluindo then
        GerarArquivoExportacao(inclusao)
      else
        GerarArquivoExportacao(alteracao);
    end;
  end;
end;

procedure TdtmCadastroOSP.IncluirOSP;
begin
  qryOSP.append;
  qryOSPnumero.AsInteger := NumeroOSP;
  qryOSPsemiacabado.AsBoolean := false;
end;

function TdtmCadastroOSP.NumeroOSP: Integer;
begin
  qryOSPProximo.Open;
  result := qryOSPProximonumero.AsInteger;
  qryOSPProximo.Close;
end;

procedure TdtmCadastroOSP.dsrOSPDataChange(Sender: TObject; Field: TField);
var
  DataCalculada: TDateTime;
begin
  inherited;
  if (field = qryOSPcomplementoproduto) or
     (field = qryOSPcaracteristicavisual) then
  begin
    if qryOSPprodutovisual.isnull then
    begin
      ReFazConsulta(qryProdutos,[0],[trim(qryOSPcaracteristicavisual.asstring)+' '+
                                     trim(qryOSPcomplementoproduto.asString)]);
      if not qryprodutos.IsEmpty then
      begin
        MensagemAviso('O produto já está cadastrado.');
        qryOSPproduto.AsString := qryProdutoscodigo.AsString;
        qryOSPprodutovisual.AsString := qryProdutoscodigovisual.AsString;
        dsrOSP.OnDataChange := nil;
        qryOSPcaracteristica.Clear;
        qryOSPcaracteristicavisual.Clear;
        qryOSPcomplementoproduto.Clear;
        if Assigned(ProdutoJaCadastrado) then
          ProdutoJaCadastrado(qryOSP);
        dsrosp.OnDataChange := dsrOSPDataChange;
      end;
    end;
  end
  else
  if (field = qryOSPproduto) or
     (field = qryOSPcliente) then
  begin
    ReFazConsulta(qryClientesProdutos,[0,1,2],[qryOSPcliente.Asinteger, qryOSPtipocliente.AsString, qryOSPproduto.AsVariant]);
    GerarLotesdeProducao;
  end
  else
  if field = qryOSPdata then
  begin
    if Assigned(AlteracaoData) then
      AlteracaoData(qryOSP);
  end
  else
  if field = qryOSPentrega then
  begin
    if not qryOSPentrega.isnull then
    begin
      if not qryOSPentrega.IsNull then
      begin
        dsrOSP.OnDataChange := nil;
        qryOSPsemana.AsInteger := WeekOfTheYear(qryOSPentrega.AsDateTime);
        if (MonthOf(qryOSPentrega.AsDateTime)=12) and
           (qryOSPsemana.AsInteger=1) then
          qryOSPano.AsInteger := yearof(qryOSPentrega.AsDateTime)+1
        else
        if (MonthOf(qryOSPentrega.AsDateTime)=1) and
           (qryOSPsemana.AsInteger=52) then
          qryOSPano.AsInteger := yearof(qryOSPentrega.AsDateTime)-1
        else
          qryOSPano.AsInteger := yearof(qryOSPentrega.AsDateTime);
        dsrOSP.onDataChange := dsrOSPDataChange;
      end;
    end;
  end
  else
  if field = qryOSPsemana then
  begin
    if qryOSPsemana.asinteger<>0 then
    begin
      dsrOSP.OnDataChange := nil;
      if qryOSPentrega.IsNull then
      begin
        qryOSPentrega.AsDateTime := DataHoraLocal;
        DataCalculada := DataHoraLocal;
      end
      else
        DataCalculada := qryOSPentrega.AsDateTime;
      DataCalculada := StartOfAWeek(yearof(datacalculada),qryOSPsemana.AsInteger);
      if DataCalculada < qryOSPdata.AsDateTime then
        qryOSPsemana.AsInteger := FSemana
      else
      begin
//        FSemana := qryOSPsemana.AsInteger;
        qryOSPentrega.AsDateTime := DataCalculada;
        qryOSPano.AsInteger := yearof(DataCalculada);
      end;
//      qryOSPentrega.AsDateTime := StartOfAWeek(yearof(qryOSPentrega.Asdatetime),qryOSPsemana.AsInteger);
//      qryOSPentrega.AsDateTime := StartOfAWeek(qryospano.AsInteger,qryOSPsemana.AsInteger);
      dsrOSP.onDataChange := dsrOSPDataChange;
    end
    else
      dsrOSPDataChange(self, qryOSPentrega);

  end
  else
  if field = qryOSPano then
  begin
    if qryOSPano.AsInteger<>0 then
    begin
      dsrOSP.OnDataChange := nil;
      if qryOSPentrega.IsNull then
        qryOSPentrega.AsDateTime := DataHoraLocal;
      qryOSPsemana.AsInteger := WeekOfTheYear(qryOSPentrega.AsDateTime);
      qryOSPentrega.AsDateTime := StartOfAWeek(qryOSPano.AsInteger,qryOSPsemana.AsInteger);
      dsrOSP.onDataChange := dsrOSPDataChange;
    end
    else
      dsrOSPDataChange(self, qryOSPentrega)

  end
  else
  if field = qryOSPquantidade then
    GerarLotesdeProducao;

end;

procedure TdtmCadastroOSP.qryOSPNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryOSPdata.AsDateTime := DataServidor;
  qryOSPentrega.AsDateTime := DataServidor;
  qryOSPprioridade.AsInteger := 1;
  qryOSPcancelado.asboolean := false;
  qryOSPtipocliente.AsString := 'C';
end;

procedure TdtmCadastroOSP.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\osp12.sql') then
    Listar.loadfromfile('c:\osp12.sql');

  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\osp12.sql');

  listar.free;
end;

procedure TdtmCadastroOSP.EditarOSP;
begin
  if not (qryOSP.State in [dsedit, dsinsert]) then
    qryOSP.Edit;
end;

procedure TdtmCadastroOSP.qryOSPCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryOSPtotal.AsCurrency := qryOSPquantidade.AsCurrency * qryOSPpreco.AsCurrency;
  if not qryOSPqtdeentregue.IsNull then
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency -
                              qryOSPqtdeentregue.AsCurrency
  else
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency;

  if not qryOSPpcpiniciado.AsBoolean then
  begin
    if (qryOSPqtdeentregue.AsCurrency = 0) then
      qryOSPStatusCancelamento.AsInteger := 0         {PERMITE A EXCLUSÃO DA OSP}
    else
    if (qryOSPsaldo.AsCurrency > 0) then
      qryOSPStatusCancelamento.AsInteger := 1         {PERMITE O CANCELAMENTO DO SALDO PENDENTE DA OSP}
    else
      qryOSPStatusCancelamento.AsInteger := 2         {NÃO PERMITE A EXCLUSAO E O CANCELAMENTO}
  end
  else
  begin
    if (qryOSPqtdeentregue.AsCurrency <> 0) and
       (qryOSPsaldo.AsCurrency > 0) then
      qryOSPStatusCancelamento.AsInteger := 1         {PERMITE O CANCELAMENTO DO SALDO PENDENTE DA OSP}
    else
      qryOSPStatusCancelamento.AsInteger := 2         {NÃO PERMITE A EXCLUSAO E O CANCELAMENTO}
  end;

end;

function TdtmCadastroOSP.ExisteProdutonoCliente: boolean;
begin
  result := true;
  if qryOSPproduto.AsString<>'' then
    result := qryClientesProdutosproduto.AsString = qryOSPproduto.AsString;
end;

procedure TdtmCadastroOSP.LimparProdutosPedidosSaida;
begin
   if not (qryOSP.State in [dsedit, dsinsert]) then
     qryOSP.Edit;
   qryOSPproduto.Clear;
   qryOSPprodutovisual.Clear;
end;

procedure TdtmCadastroOSP.qryOSPAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryClientesProdutos,[0,1,2],[qryOSPcliente.Asinteger, qryOSPtipocliente.AsString, qryOSPproduto.AsVariant]);
  ReFazConsulta(qryOSPLotes,[0],[qryOSPnumero.AsVariant]);
  ReFazConsulta(qryPrecos,[0],[0]);
  ReFazConsulta(qryprodutos,[0],[0]);
  ReFazConsulta(qryColunasPrecos,[0,1],[0,0]);
  ReFazConsulta(qryEstoques,[0],[0]);


  ReFazConsulta(qryOSPUltimoPreco,[0,1,2],[qryOSPcliente.AsVariant,
                                         qryOSPProduto.asVariant,
                                         filialbase]);


  qryOSPcliente.ReadOnly := qryOSPqtdeentregue.AsCurrency<>0;
  qryOSPproduto.ReadOnly := qryOSPcliente.ReadOnly;
  qryOSPprodutovisual.ReadOnly := qryOSPcliente.ReadOnly;
  qryOSPcaracteristica.ReadOnly := qryOSPcliente.ReadOnly;
  qryOSPcaracteristicavisual.ReadOnly := qryOSPcliente.ReadOnly;

  if Assigned(OSPAfterScroll) then
     OSPAfterScroll(qryOSP);

  if Assigned(AlteracaoData) then
    AlteracaoData(qryOSP);

end;

procedure TdtmCadastroOSP.qryClientesProdutosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryClientesProdutosorigem.AsString := 'T';
end;

procedure TdtmCadastroOSP.qryClientesProdutosAfterEdit(DataSet: TDataSet);
begin
  inherited;
  EditarOSP;
end;

procedure TdtmCadastroOSP.qryClientesProdutosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  EditarOSP;
  qryClientesProdutoscliente.AsInteger := qryOSPcliente.AsInteger;
  qryClientesProdutostipocliente.AsString := qryOSPtipocliente.AsString;
  qryClientesProdutosproduto.AsString := qryOSPproduto.AsString;
end;

procedure TdtmCadastroOSP.qryOSPAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryOSPUltimoPreco.Close;
  qryClientesProdutos.Close;
  qryOSPLotes.Close;
end;

procedure TdtmCadastroOSP.IncluirProduto;
begin
  ReFazConsulta(qryPrecoProximoCodigo,[0],[qryOSPcaracteristica.asString]);
  ReFazConsulta(qryPrecos,[0],[qryOSPcaracteristica.AsString]);
  qryPrecos.Append;
  qryPrecoscodigo.AsInteger := qryPrecoProximoCodigonumero.AsInteger;
  qryPrecosdescricao.AsString := qryOSPcaracteristicavisual.AsString+' '+
                              qryOSPcomplementoproduto.AsString;
  qryPrecoscaracteristica.AsString := qryOSPcaracteristica.AsString;
  qryPrecos.Post;

  ReFazConsulta(qryprodutos,[0],[0]);
  ReFazConsulta(qryProximoNumeroProdutoICE,[0],[qryOSPcaracteristicavisual.asString]);

  qryProdutos.Append;
  qryProdutoscodigo.AsString := qryProximoNumeroProdutoICEnumero.AsString;
  qryProdutosdescricao.AsString := qryOSPcaracteristicavisual.asString+' '+
                                   qryOSPcomplementoproduto.AsString;
  qryProdutoscodigovisual.AsString := qryProdutosdescricao.AsString;
  qryProdutoscaracteristica.AsString := qryOSPcaracteristica.AsString;
  qryProdutospreco.AsInteger := qryPrecoscodigo.AsInteger;
  qryprodutos.Post;

  dsrOSP.OnDataChange := nil;
  qryOSPproduto.AsString := qryProdutoscodigo.AsString;
  qryOSPprodutovisual.AsString := qryProdutoscodigovisual.AsString;
  dsrOSP.OnDataChange := dsrOSPDataChange;

  if qryClientesProdutos.State in [dsedit, dsinsert] then
    qryClientesProdutosproduto.AsString := qryProdutoscodigo.AsString;

  ReFazConsulta(qryColunasPrecos,[0,1],[qryOSPcaracteristica.asString,qryprecoscodigo.asstring]);
  qryColunasPrecos.Append;
  qryColunasPrecoscaracteristica.AsString := qryOSPcaracteristica.AsString;
  qryColunasPrecospreco.AsInteger := qryPrecoscodigo.AsInteger;
  qryColunasPrecoscoluna.AsInteger := 1;
  qryColunasPrecosdata.AsDateTime := date();
  qryColunasPrecosvalor.AsCurrency := qryOSPpreco.AsCurrency;
  qryColunasPrecos.Post;

  if ParSistema.IncluirEstoqueAutomatico then
  begin
    ReFazConsulta(qryEstoques,[0],[0]);
    ReFazConsulta(qryConsultaFiliais,[],[]);
    if not qryConsultaFiliais.IsEmpty then begin
      qryConsultaFiliais.First;
      while not qryConsultaFiliais.Eof do begin
        if (qryConsultaFiliaistipofilial.AsString <> 'V') then begin // V = Virtual
          qryEstoques.Append;
          qryEstoquesproduto.AsLargeInt       := qryProdutoscodigo.AsLargeInt;
          qryEstoquesfilial.AsInteger         := qryConsultaFiliaiscodigo.AsInteger;
          qryEstoquesdescricaofilial.AsString := qryConsultaFiliaisnome.AsString;
          qryEstoques.Post;
        end;
        qryConsultaFiliais.Next;
      end;
    end;
    qryConsultaFiliais.Close;
  end;

end;

procedure TdtmCadastroOSP.GerarArquivoExportacao(operacao: tipooperacao);
var
  NomeArquivo, registro, valor : String;
  geracao: char;
  Listar : TStringList;
  quantidade: Currency;
  codigocobol, resistencia: String;
begin
  Listar := tStringlist.create;
  NomeArquivo := PCPDirExportacao;

  if not DirectoryExists(NomeArquivo) then
    if not CreateDir(NomeArquivo) then
    raise Exception.Create('Impossível criar o diretório '+NomeArquivo);

  case operacao of
    inclusao: NomeArquivo := NomeArquivo + '\'+ 'INCOSP.PCP';

    alteracao,
    exclusao : NomeArquivo := NomeArquivo + '\'+ 'ALTOSP.PCP';
  end;

  if fileexists(NomeArquivo) then
    Listar.loadfromfile(NomeArquivo);

  case operacao of
  inclusao:
  begin
    if qryOSPprodutovisual.AsString = qryOSPcaracteristicavisual.AsString then
      geracao := 'S'
    else
      geracao := 'N';

    ProdutoPadraoCobol(geracao,
                       qryOSPprodutovisual.AsString,
                       codigocobol, resistencia);

    registro := copy(qryOSPano.AsString,3,2)+
//                format('%2.2d',[qryOSPsemana.asinteger])+
//                format('%6.6d',[qryOSPnumero.asinteger])+
                FormatStringOut(qryOSPsemana.AsString,'R','0',2) +
                FormatStringOut(qryOSPnumero.AsString,'R','0',6) +
                codigocobol+
                geracao;

    Valor:= Format('%9.2f', [qryOSPpreco.Ascurrency]);
    Valor:= Trim(Trocar(Valor,',',''));
    registro := registro + FormatStringOut(valor,'R','0',9);

    if (qryOSPunidade.AsString = 'MIL') or
       (qryOSPunidade.AsString = 'ML') then
    begin
      quantidade := qryOSPquantidade.AsCurrency * 1000;
      Valor:= Format('%6.0f', [quantidade]);
      Valor:= Trim(Trocar(Valor,',',''));
      registro := registro + FormatStringOut(valor,'R','0',6);
    end
    else
    begin
      quantidade := qryOSPquantidade.AsCurrency;
      Valor:= Format('%6.0f', [quantidade]);
      Valor:= Trim(Trocar(Valor,',',''));
      registro := registro + FormatStringOut(valor,'R','0',6);
    end;

    registro := registro +
                FormatDateTime('yymmdd',qryOSPdata.AsDateTime)+
                qryOSPprioridade.AsString +
                FormatStringOut(qryOSPpedidocliente.AsString,'L',' ',15) +
                FormatStringOut(qryOSPnumero.AsString,'R','0',4) + '0' +
                FormatStringOut(qryOSPobservacoes.AsString,'L',' ',28) +
                resistencia +
                FormatStringOut(qryOSPapelido.AsString,'L',' ',15) +
                FormatStringOut(qryClientesProdutospn.AsString,'R','0',5) +
                qryClientesProdutosorigem.AsString +
                FormatStringOut(qryClientesProdutosproduto_cliente.AsString,'L',' ',30);
    listar.Append(registro);
  end;
  alteracao,
  exclusao:
  begin
    if operacao = alteracao then
    begin
      if (qryOSPentrega.AsDateTime<>qryOSPentrega_anterior.AsDateTime) and
         (qryOSPquantidade.AsCurrency<>qryOSPquantidade_anterior.AsCurrency) then
         valor := 'A' //ambos
      else
      if (qryOSPentrega.AsDateTime<>qryOSPentrega_anterior.AsDateTime) then
        valor := 'P' //prazo
      else
      if (qryOSPquantidade.AsCurrency<>qryOSPquantidade_anterior.AsCurrency) then
        valor := 'Q' //quantidade
      else
        valor :=  '';
    end
    else
      valor := 'R';

    if valor = 'R' then
      Registro := FormatStringOut(qryOSPnumero.AsString,'R','0',6) +
                  valor + '0000000000'
    else
    if valor <> '' then
    begin
      registro := FormatStringOut(qryOSPnumero.AsString,'R','0',6) +
                  valor +
                  copy(qryOSPano.AsString,3,2)+
                  FormatStringOut(qryOSPsemana.AsString,'R','0',2);

      if qryOSPunidade.AsString = 'MIL' then
      begin
        quantidade := qryOSPquantidade.AsCurrency * 1000;
        Valor:= Format('%6.0f', [quantidade]);
        Valor:= Trim(Trocar(Valor,',',''));
        registro := registro + FormatStringOut(valor,'R','0',6);
      end
      else
      begin
        quantidade := qryOSPquantidade.AsCurrency;
        Valor:= Format('%6.0f', [quantidade]);
        Valor:= Trim(Trocar(Valor,',',''));
        registro := registro + FormatStringOut(valor,'R','0',6);
      end;
    end;
    listar.Append(registro);
  end;
  end;
  Listar.SaveToFile(NomeArquivo);
end;


procedure TdtmCadastroOSP.AtribuirPNProdutoCliente;

begin
  if (qryOSPprodutovisual.AsString <> qryOSPcaracteristicavisual.AsString) then
  begin
    ReFazConsulta(qrypnproduto,[0],[qryospproduto.AslargeInt]);
    if not qrypnproduto.IsEmpty then
    begin
      qryClientesProdutos.Edit;
      qryClientesProdutospn.AsInteger := qrypnprodutopn.AsInteger;
      qryClientesProdutosorigem.AsString := qrypnprodutoorigem.AsString;
      qryClientesProdutosfinalidade.AsString := qrypnprodutofinalidade.AsString;
      qryClientesProdutosrevisao.AsString := qrypnprodutorevisao.AsString;
      qryClientesProdutostamloteproducao.AsString := qrypnprodutotamloteproducao.AsString;
      qryClientesProdutostipoexcedente.AsString := qrypnprodutotipoexcedente.AsString;

    end;
  end
end;



procedure TdtmCadastroOSP.AtribuirPNFamiliaCliente;
begin
  if qryClientesProdutos.IsEmpty then
  begin
    ReFazConsulta(qrypnFamilia,[0],[qryOSPcaracteristica.AsLargeInt]);
    if not qrypnFamilia.IsEmpty then
    begin
      qryClientesProdutos.Edit;
      qryClientesProdutospn.AsInteger := qrypnFamiliapn.AsInteger;
      qryClientesProdutosorigem.AsString := qrypnFamiliaorigem.AsString;
      qryClientesProdutosfinalidade.AsString := qrypnFamiliafinalidade.AsString;
      qryClientesProdutosrevisao.AsString := qrypnFamiliarevisao.AsString;
      qryClientesProdutostamloteproducao.AsString := qrypnFamiliatamloteproducao.AsString;
      qryClientesProdutostipoexcedente.AsString := qrypnFamiliatipoexcedente.AsString;
    end;
  end;
end;

Procedure TdtmCadastroOSP.ProdutoPadraoCobol(Geracao:     Char;
                                             CodAtual:    String;
                                         Var CodCobol:    String;
                                         Var Resistencia: String);


    Function ValorOHMs(OHMs: String): String;
    Var Digitos: String[09];
        Numeros: String[03];
        NC: Byte;
    Begin
       Digitos:= IncSt('0',9);
       OHMs   := FormatStringOut(OHMs,'L','0',4);

       Numeros:= '';
       For NC:= 1 to 4 do
           If not (OHMs[NC] in ['K', 'R'])
           Then Numeros:= Numeros + OHMs[NC];

       If Pos('R', OHMs) > 0
       Then If OHMs[1] = 'R' Then NC:= 7
       Else If OHMs[2] = 'R' Then NC:= 6
       Else If OHMs[3] = 'R' Then NC:= 5
                             Else NC:= 4

       Else If OHMs[2] = 'K' Then NC:= 3
       Else If OHMs[3] = 'K' Then NC:= 2
                             Else NC:= 1;
       Move(Numeros[1],Digitos[NC],3);
       ValorOHMs:= Digitos;
    End; {ValorOHMs}


Var Tipo:       String[04];
    Dimensao:   String[08];
    OHMs:       String[04];
    Tolerancia: String[02];
Begin
   If Geracao = 'S' Then Begin
      CodCobol   := FormatStringOut(CodAtual,'L',' ',30);
      Resistencia:= IncSt('0',9);
   End
   Else Begin
      Tipo      := Copy(CodAtual,1,PosOcor(' ',CodAtual,1)-1);

      Dimensao  := Copy(CodAtual,  PosOcor(' ',CodAtual,1)+1,
                                   PosOcor(' ',CodAtual,2)-
                                   posOcor(' ',CodAtual,1)-1);

      OHMs      := Copy(CodAtual,  PosOcor(' ',CodAtual,2)+1,
                                   PosOcor(' ',CodAtual,3)-
                                   PosOcor(' ',CodAtual,2)-1);

      Tolerancia:= Copy(CodAtual,  PosOcor(' ',CodAtual,3)+1,
                                   PosOcor('%',CodAtual,1)-
                                   PosOcor(' ',CodAtual,3)-1);

      CodCobol  := FormatStringOut(Tipo, 'L',' ',4) +
                   FormatStringOut(Dimensao,'L',' ',8) +
                   FormatStringOut(OHMs,'L',' ',4) +
                   FormatStringOut(Tolerancia,'R','0',2) +
		   FormatStringOut(' ','L',' ',12);
      Resistencia := ValorOHMs(OHMs);
   End;
End; {ProdutoPadraoCOBOL}


procedure TdtmCadastroOSP.qryEstoquesNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryEstoquesemestoque.AsInteger     := 0;
  qryEstoquesreservado.AsInteger     := 0;
  qryEstoquestransito.AsInteger      := 0;
  qryEstoquesdemonstracao.AsInteger  := 0;
  qryEstoquesconserto.AsInteger      := 0;
  qryEstoquesfuturo.AsInteger        := 0;
  qryEstoquesdanificada.AsInteger    := 0;
  qryEstoquesestoquefisico.AsInteger := 0;
end;

procedure TdtmCadastroOSP.Percorrer(Campo: Byte; Key: Word;
  Shift: TShiftState);
var Operacao: Byte;
    codigo: Integer;
begin
   Operacao := 0;
   with qryOSP do begin
      if ssCtrl in Shift
      then case Key of
             VK_Home:     Operacao:= Primeiro;
             VK_End:      Operacao:= Ultimo;
           end
      else case Key of
             VK_PRIOR:   Operacao:= Anterior;
             VK_next: Operacao:= Proximo;
           end;

      case Campo of
         cmpcodigo: case Operacao of
                            Primeiro,
                            Proximo:  MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY osp.numero LIMIT 1';
                            Anterior,
                            Ultimo:   MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY osp.numero DESC LIMIT 1';
                   end;
      end;

      codigo         := qryOSPnumero.         AsInteger;

      RefazConsultaPorNome(qryOSP, ['Campo','Operacao', 'numero'],
                    [Campo, Operacao, qryOSPnumero.AsInteger]);

      if qryOSP.RecordCount = 0 then
      begin
          RefazConsulta(qryOSP, [0,1,2],
                        [PosicaoAtual, PosicaoAtual, codigo]);

         case Operacao of
            Anterior,Primeiro: MensagemAviso('Esta é a 1ª OSP');
            Proximo, Ultimo  : MensagemAviso('Esta é a última OSP');
         end;
         case campo of
          1 : qryOSPnumero.FocusControl;
         end;
      end;
  //   EnableControls;
   end;
   qryOSP.Params[0].AsInteger := 0;
   qryOSP.Params[1].AsInteger := 0;
end;

function TdtmCadastroOSP.GetUltimaOSP: integer;
begin
  result := qryOSPProximonumero.AsInteger - 1;
end;

function TdtmCadastroOSP.ImprimirOSP: Boolean;
var
  vImprimiu, vExisteJaImpresso: Boolean;
  vImpressoraOSP, vImpressoraSetupProcesso, vImpressoraControlProcesso : String;
begin
  result := false;
  vImprimiu := false;
  GuardarRegistroAtual(qryOSPLotes, true);
  qryOSPLotes.AfterScroll := nil;
  qryOSPLotes.AfterPost := nil;

  dtmImprimeOsp:= TdtmImprimeOsp.Create(Self);
  try
    if MensagemSimNaoOpcaoCancelar(Format(ctMENSAGEMIMPRIMIR,['a OSP']),'',false) = mryes then
    begin
      if ParSistema.NomeImpressoraOSP<> '' then
         vImpressoraOSP := ParSistema.NomeImpressoraOSP
      else
      if UltimaImpressoraSelecionada<>'' then
        vImpressoraOSP := UltimaImpressoraSelecionada
      else
      begin
        vImpressoraOSP := SelecionarImpressora;
        UltimaImpressoraSelecionada := vImpressoraOSP;
      end;

      if vImpressoraOSP<>'' then
      begin
        qryOSPLotes.First;
        while not qryOSPLotes.Eof do
        begin
          if qryOSPLotesimprimir.AsBoolean then
          begin
            if dtmImprimeOsp.ImprimirOSP(qryOSPnumero.AsInteger, qryOSPLotesnumero.AsInteger, vImpressoraOSP) then
            begin
              result := true;
              vImprimiu := true;
            end
            else
            begin
              result := false;
              break;
            end;
          end;

          if not vExisteJaImpresso and
             qryOSPLotesjaimpresso.AsBoolean then
            vExisteJaImpresso := true;

          qryOSPLotes.next;
        end;
      end;
    end;

    if not vExisteJaImpresso then
    begin
      qryOSPLotes.First;
      while not qryOSPLotes.Eof do
      begin
        if not vExisteJaImpresso and
           qryOSPLotesjaimpresso.AsBoolean then
        begin
          vExisteJaImpresso := true;
          break;
        end;

        qryOSPLotes.next;
      end;
    end;

    if result or not VImprimiu then
    begin

      if MensagemSimNaoOpcaoCancelar(Format(ctMENSAGEMIMPRIMIR,['o SET-UP DE PROCESSO']),'',false ) = mryes then
      begin

        if ParSistema.NomeImpressoraSetupProcesso<> '' then
           vImpressoraSetupProcesso := ParSistema.NomeImpressoraSetupProcesso
        else
        if UltimaImpressoraSelecionada<>'' then
          vImpressoraSetupProcesso := UltimaImpressoraSelecionada
        else
        begin
          vImpressoraSetupProcesso := SelecionarImpressora;
          UltimaImpressoraSelecionada := vImpressoraSetupProcesso;
        end;

        if dtmImprimeOsp.ImpressaoSetup(qryOSPnumero.AsInteger, vImpressoraSetupProcesso, vExisteJaImpresso) then
        begin
          result := true;
          vImprimiu := true;
        end
        else
          result := false;
      end;
    end;

    if result or not VImprimiu then
    begin
      if MensagemSimNaoOpcaoCancelar(Format(ctMENSAGEMIMPRIMIR,['o CONTROLE DE PROCESSO']),'',false) = mryes then
      begin

        if ParSistema.NomeImpressoraControleProcesso<> '' then
           vImpressoraControlProcesso := ParSistema.NomeImpressoraControleProcesso
        else
        if UltimaImpressoraSelecionada<>'' then
          vImpressoraControlProcesso := UltimaImpressoraSelecionada
        else
        begin
          vImpressoraControlProcesso := SelecionarImpressora;
          UltimaImpressoraSelecionada := vImpressoraControlProcesso;
        end;

        if dtmImprimeOsp.ImpressaoControleProcesso(qryOSPnumero.AsInteger, vImpressoraControlProcesso, vExisteJaImpresso) then
        begin
          result := true;
          vImprimiu := true;
        end
        else
          result := false;
      end;
    end;

  finally
    dtmImprimeOsp.Free;
    dtmImprimeOsp:= nil;

    if result then
    begin
      if vImprimiu then
      begin
        qryOSPLotes.First;
        while not qryOSPLotes.Eof do
        begin
          if qryOSPLotesimprimir.AsBoolean then
          begin
            qryOSPLotes.edit;
            qryOSPLotesjaimpresso.AsBoolean := true;
            qryOSPLotesimprimir.AsBoolean := false;
            qryOSPLotes.post;
          end;
          qryOSPLotes.next;
        end;
        perpetrar([qryosplotes]);
      end;
    end;

    VoltarRegistroAtual(qryOSPLotes);
    qryOSPLotes.AfterPost := qryOSPLotesAfterPost;
    qryOSPLotes.AfterScroll := qryOSPLotesAfterScroll;

  end;
end;

procedure TdtmCadastroOSP.qryOSPLotesNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryOSPLotesnumero.AsInteger := qryOSPLotes.RecNo;
  qryOSPLotesimprimir.AsBoolean := false;
  qryOSPLotesjaimpresso.AsBoolean := false;
end;

procedure TdtmCadastroOSP.RecalcularQuantidadesLotes;
var
  vQuantidadeLote, vExcedenteLote, vProduzidaLote : Currency;
  vReadOnlyOSPLotes : Boolean;
begin
  vQuantidadeLote := 0;
  vExcedenteLote  := 0;
  vProduzidaLote  := 0;
  GuardarRegistroAtual(qryOSPLotes, true);
  qryOSPLotes.First;
  while not qryOSPLotes.Eof do
  begin
    if qryOSPLotesnumero.AsInteger <> qryOSPLotes.RecNo then
    begin
      qryOSPLotes.AfterPost := nil;
      vReadOnlyOSPLotes := qryospLotes.readonly;
      qryosplotes.readonly := false;
      qryosplotes.Edit;
      qryOSPLotesnumero.AsInteger := qryOSPLotes.RecNo;
      qryOSPLotes.Post;
      qryosplotes.readonly := vReadOnlyOSPLotes;
      qryOSPLotes.AfterPost := qryOSPLotesAfterScroll;
    end;
    vQuantidadeLote := vQuantidadeLote + qryOSPLotesquantidade.AsInteger;
    vExcedenteLote  := vExcedenteLote + qryOSPLotesexcedente.AsInteger;
    vProduzidaLote  := vProduzidaLote + qryOSPLotesproduzida.AsInteger;
    qryOSPLotes.Next;
  end;

  if (qryOSPquantidade_lote.AsInteger <> vQuantidadeLote) or
     (qryOSPexcedente_lote.AsInteger <> vExcedenteLote) or
     (qryOSPproduzida_lote.AsInteger <> vProduzidaLote) then
  begin
    dsrOSP.OnDataChange := nil;

    vReadOnlyOSPLotes := qryospLotes.readonly;
    qryosplotes.readonly := false;

    qryosp.Edit;
    qryOSPquantidade_lote.AsCurrency := vQuantidadeLote;
    qryOSPexcedente_lote.AsCurrency := vExcedenteLote;
    qryOSPproduzida_lote.AsCurrency := vProduzidaLote;
    dsrOSP.OnDataChange := dsrOSPDataChange;
    qryosplotes.readonly := vReadOnlyOSPLotes;
  end;
  VoltarRegistroAtual(qryOSPLotes);

end;

procedure TdtmCadastroOSP.GerarLotesdeProducao;
var
 vQuantidade,
 vTamLoteProducao,
 vExcedentePermitido : Currency;


begin
  vQuantidade := 0;

  qryOSPLotes.AfterPost := nil;
  qryOSPLotes.AfterDelete := nil;

  {
  if not qryospLotes.Active then
    qryOSPAfterScroll(qryOSP);
    }


  if qryOSP.State = dsinsert then
    ReFazConsulta(qryOSPLotes,[0],[qryOSPnumero.AsVariant])
  else
  begin
    qryOSPLotes.first;
    while not qryOSPLotes.Eof do
    begin
      if qryOSPLotesproduzida.AsCurrency = 0 then
        qryOSPLotes.delete
      else
        qryOSPLotes.next;
    end
  end;

  qryOSPLotes.first;
  while not qryOSPLotes.Eof do
  begin
    if qryOSPLotesproduzida.AsCurrency <> 0 then
      vQuantidade := vQuantidade + qryOSPLotesquantidade.AsCurrency;
    qryOSPLotes.next;
  end;

  vExcedentePermitido := 0;

  if qryClientesProdutostamloteproducao.AsInteger <> 0 then
  begin

    if QuantidadePedidaemUnidade < qryClientesProdutostamloteproducao.AsInteger then
    begin
      vTamLoteProducao := QuantidadePedidaemUnidade;
      if qryClientesProdutostipoexcedente.AsString = 'U' then // Unidade
        vExcedentePermitido := (vTamLoteProducao * qryClientesProdutosexcedentepermitido.AsInteger)/
                                qryClientesProdutostamloteproducao.AsInteger
      else//Percentual
        vExcedentePermitido := (vTamLoteProducao * qryClientesProdutosexcedentepermitido.AsInteger)/100;

    end
    else
    begin
      vTamLoteProducao := qryClientesProdutostamloteproducao.AsInteger;
      if qryClientesProdutostipoexcedente.AsString = 'U' then // Unidade
        vExcedentePermitido := qryClientesProdutosexcedentepermitido.AsInteger
      else
        vExcedentePermitido := (vTamLoteProducao * qryClientesProdutosexcedentepermitido.AsInteger)/100;
    end;
  end
  else
  begin
    vTamLoteProducao := QuantidadePedidaemUnidade;
    vExcedentePermitido := 0;
  end;


  while vQuantidade < QuantidadePedidaemUnidade do
  begin
    if vQuantidade <> 0 then
    begin
      if (vQuantidade + vTamLoteProducao) > QuantidadePedidaemUnidade then
      begin
        vExcedentePermitido := (QuantidadePedidaemUnidade - vQuantidade) * vExcedentePermitido / vTamLoteProducao;
        vTamLoteProducao := QuantidadePedidaemUnidade - vQuantidade;
      end;
    end;

    qryOSPLotes.ReadOnly := false;

    dsrOSP.OnDataChange := nil;
    qryOSPLotes.Append;
    qryOSPLotesosp.AsInteger := qryOSPnumero.AsInteger;
    qryOSPLotesnumero.AsInteger := qryOSPLotes.RecNo;
    qryOSPLotesquantidade.AsCurrency := vTamLoteProducao;
    qryOSPLotesexcedente.AsCurrency := vExcedentePermitido;
    qryOSPLotes.post;
    dsrOSP.OnDataChange := dsrOSPDataChange;

    vQuantidade := vQuantidade + qryOSPLotesquantidade.AsInteger;

  end;

  qryOSPLotes.AfterPost := qryOSPLotesAfterPost;
  qryOSPLotes.AfterDelete := qryOSPLotesAfterDelete;

  qryOSPLotesAfterScroll(nil);

  RecalcularQuantidadesLotes;
  EditarOSP;
end;


procedure TdtmCadastroOSP.qryOSPLotesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryOSPLotes.ReadOnly := qryOSPLotesproduzida.AsCurrency <> 0;
end;

procedure TdtmCadastroOSP.qryOSPLotesAfterPost(DataSet: TDataSet);
begin
  inherited;
  RecalcularQuantidadesLotes;
  EditarOSP;
end;

procedure TdtmCadastroOSP.qryOSPLotesAfterDelete(DataSet: TDataSet);
begin
  inherited;
  RecalcularQuantidadesLotes;
  EditarOSP;

end;

procedure TdtmCadastroOSP.MarcarLotesImpressao(Todos, Marcar : boolean);
begin
  qryOSPLotes.AfterScroll := nil;
  qryOSPLotes.AfterPost := nil;

  if Todos then
  begin
    GuardarRegistroAtual(qryOSPLotes, true);
    qryOSPLotes.First;
    while not qryOSPLotes.Eof do
    begin
      qryOSPLotes.edit;
      qryOSPLotesimprimir.AsBoolean := Marcar;
      qryOSPLotes.next;
    end;
    VoltarRegistroAtual(qryOSPLotes);
  end
  else
  begin
    qryOSPLotes.edit;
    qryOSPLotesimprimir.AsBoolean := Marcar;
    qryOSPLotes.Post;
  end;

  qryOSPLotes.AfterPost := qryOSPLotesAfterPost;
  qryOSPLotes.AfterScroll := qryOSPLotesAfterScroll;
end;

function TdtmCadastroOSP.ExistemLotesMarcados: boolean;
begin
  result := false;
  GuardarRegistroAtual(qryOSPLotes, true);
  qryOSPLotes.First;
  while not qryOSPLotes.Eof do
  begin
    if qryOSPLotesimprimir.AsBoolean then
    begin
      result := true;
      break;
    end;
    qryOSPLotes.Next;
  end;
  VoltarRegistroAtual(qryOSPLotes);
end;

procedure TdtmCadastroOSP.qryClientesProdutosAfterScroll(
  DataSet: TDataSet);
var
 vValor : Boolean;
begin
  inherited;
  qryClientesProdutosproduto_cliente.ReadOnly := false;
  if parsistema.ControlesVoltadosparaIndustria then
  begin
    vValor := (dtmCadastroOSP.qryClientesProdutos.State <> dsinsert)
                                                     and not UsuarioLogin.GerenteTecnico;
    qryClientesProdutosproduto_cliente.ReadOnly  := vValor;
  end;  
end;

procedure TdtmCadastroOSP.dsrClientesProdutosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryClientesProdutostamloteproducao then
    GerarLotesdeProducao;
end;

function TdtmCadastroOSP.GetQuantidadePedidaemUnidade: Currency;
begin
        if qryOSPunidade.AsString = 'MIL' then fQuantidadePedidaemUnidade := 1000 * qryOSPquantidade.AsCurrency
   else if qryOSPunidade.AsString = 'CT'  then fQuantidadePedidaemUnidade :=  100 * qryOSPquantidade.AsCurrency
                                          else fQuantidadePedidaemUnidade :=        qryOSPquantidade.AsCurrency;
                                          
  Result := fQuantidadePedidaemUnidade;
end;

procedure TdtmCadastroOSP.IncluirOSPSemiAcabado;
begin
  qryOSP.Insert;
  qryOSPnumero.AsInteger := NumeroOSP;
  qryOSPsemiacabado.AsBoolean := true;
  qryOSPtipocliente.AsString := 'L';
  qryOSPcliente.AsInteger := FilialBase;
end;

function TdtmCadastroOSP.CalcularNrPedidoSetor: boolean;
begin
  result := true;
  if qryOSPsemiacabado.AsBoolean then
  begin
    if trim(qryOSPsetorproducao.AsString)='' then
    begin
      result := false;
      MensagemErro(format('O produto %s não possui um setor de produção definido.', [qryOSPproduto.AsString]));
      qryOSPproduto.Clear;
      qryOSPproduto.FocusControl;
    end
    else
    begin
      RefazConsultaPorNome(qrySetoresProducao,['codigo'],[qryOSPsetorproducao.AsString]);
      qrySetoresProducao.Edit;
      qrySetoresProducaonumeropedidoosp.AsInteger := qrySetoresProducaonumeropedidoosp.AsInteger + 1;
      qrySetoresProducao.post;
      qryOSPpedidocliente.AsString := qrySetoresProducaonumeropedidoosp.AsString;
      qryOSPdescricaosetorproducao.AsString := qrySetoresProducaodescricao.AsString;
      result := true;
    end;
  end;  
end;

procedure TdtmCadastroOSP.VisualizarProducao;
var
  I: integer;
  vStringLotes: String;

begin
  vStringLotes := '';
  for i:= 1 to qryOSPLotes.RecordCount do
    vStringLotes :=  vStringLotes + 'LOTE_'+inttostr(i) + ' integer,';

//  if vStringLotes <> '' then
//    Delete(vStringLotes,length(vStringLotes),1);

  qryAndamentoProducao.MacroByName('Lotes').AsString := vStringLotes;
  qryAndamentoProducao.Sql[NumerodalinhanoTexto(qryAndamentoProducao.Sql, 'osp1')+1] :=  qryOSPnumero.AsString;
  qryAndamentoProducao.Sql[NumerodalinhanoTexto(qryAndamentoProducao.Sql, 'osp2')+1] :=  qryOSPnumero.AsString;
  qryAndamentoProducao.Sql[NumerodalinhanoTexto(qryAndamentoProducao.Sql, 'osp3')+1] :=  qryOSPnumero.AsString;


  qryAndamentoproducao.Close;
  qryAndamentoproducao.Open;

  frmAndamentoProducao := TfrmAndamentoProducao.Create(frmAndamentoProducao);
  frmAndamentoProducao.ShowModal;
  frmAndamentoProducao.Free;
  
end;

procedure TdtmCadastroOSP.qryAndamentoProducaoAfterOpen(DataSet: TDataSet);
var
  i: integer;
begin
  inherited;
  qryAndamentoProducao.FieldByName('sequencia').Visible := false;
  qryAndamentoProducao.FieldByName('Operacao').DisplayLabel := 'OPERAÇÃO';

  qryAndamentoProducao.FieldByName('C1').DisplayLabel := 'C1';
  qryAndamentoProducao.FieldByName('C2').DisplayLabel := 'C2';
  qryAndamentoProducao.FieldByName('C3').DisplayLabel := 'C3';


  for i:= 1 to qryOSPLotes.RecordCount do
  begin
    qryAndamentoProducao.Fields[i+4].DisplayLabel := 'LOTE '+ inttostr(i);
    TFloatField(qryAndamentoProducao.Fields[i+4]).displayformat := '###,###,##0';
  end;

  {
  for i:=0 to qryAndamentoProducao.FieldCount-1 do
  begin
    if copy(qryAndamentoProducao.Fields[i].FieldName,1,5)='Lote_' then
      qryAndamentoProducao.Fields[i].DisplayLabel := 'LOTE '+ copy(qryAndamentoProducao.Fields[i].AsString,6,length(qryAndamentoProducao.Fields[i].AsString));
  end;
  }

  qryAndamentoProducao.FieldByName('total').DisplayLabel := 'TOTAL';
  TFloatField(qryAndamentoProducao.Fieldbyname('total')).displayformat := '###,###,##0';


end;

end.

