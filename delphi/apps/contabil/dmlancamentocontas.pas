unit dmlancamentocontas;

interface

uses
  SysUtils, Classes, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  Forms, dmbasico, ctconstantes, clparametrossistema, biblio, Windows, {Qete,}
  ZTransact, variants, dmlancamentocontabilidade, DateUtils, StrUtils;

const
  cmpLancto     = 1;    PosicaoAtual = 0;
  cmpDiaMes     = 2;    Primeiro     = 1;
  cmpDebitar    = 3;    Anterior     = 2;
  cmpCreditar   = 4;    Proximo      = 3;
  cmpValor      = 5;    Ultimo       = 4;
  cmpHistorico  = 6;
  cmpNrOrigemLote  = 7;

type
  TipoLancamento = (DEBITO, CREDITO);
  TdtmLancamentoContas = class(TdtmBasico)
    qryLancamentos: TtecQuery;
    dsrLancamentos: TtecDataSource;
    qryConsultaLancamentos: TtecQuery;
    qryConsultaHistorico: TtecQuery;
    qryConsultaHistoricodescricao: TStringField;
    qryConsultaHistoricocodigo: TIntegerField;
    spcLancamentosProximo: TtecQuery;
    spcLancamentosProximocodigo: TIntegerField;
    qryLancamentosexercicio: TIntegerField;
    qryLancamentosnrlancto: TIntegerField;
    qryLancamentosdata: TDateField;
    qryLancamentosorigem: TStringField;
    qryLancamentosdebitar: TIntegerField;
    qryLancamentoscreditar: TIntegerField;
    qryLancamentoshistorico: TIntegerField;
    qryLancamentoscomplemento: TStringField;
    qryConsultaConta: TtecQuery;
    qryLancamentosdescricaoorigem: TStringField;
    qryLancamentosfilial: TIntegerField;
    qryConsultaContadescricaoedentada: TStringField;
    qryConsultaContadescricao: TStringField;
    qryConsultaContaclassificacao: TStringField;
    qryConsultaContacodigo: TIntegerField;
    qryConsultaContatipo: TStringField;
    qryProcuraHistorico: TtecQuery;
    qryProcuraHistoricodescricao: TStringField;
    qryProcuraHistoricocodigo: TIntegerField;
    dsrProcuraHistorico: TtecDataSource;
    qryProcuraDebitar: TtecQuery;
    dsrProcuraDebitar: TtecDataSource;
    qryProcuraCreditar: TtecQuery;
    dsrProcuraCreditar: TtecDataSource;
    dsrConsultaLancamentos: TtecDataSource;
    qryConsultaLancamentosnrlancto: TIntegerField;
    qryConsultaLancamentosdata: TDateField;
    qryConsultaLancamentosorigem: TStringField;
    qryConsultaLancamentosdebitar: TIntegerField;
    qryConsultaLancamentoscreditar: TIntegerField;
    qryConsultaLancamentosfilial: TIntegerField;
    qryProcuraPlanoConsulta: TtecQuery;
    dsrProcuraPlanoConsulta: TtecDataSource;
    qryProcuraPlanoConsultacodigo: TIntegerField;
    qryProcuraPlanoConsultaclassificacao: TStringField;
    qryProcuraPlanoConsultadescricao: TStringField;
    qryProcuraHistoricoConsulta: TtecQuery;
    dsrProcuraHistoricoConsulta: TtecDataSource;
    qryProcuraHistoricoConsultadescricao: TStringField;
    qryProcuraHistoricoConsultacodigo: TIntegerField;
    qryProcuraCreditarcodigo: TIntegerField;
    qryProcuraCreditarclassificacao: TStringField;
    qryProcuraCreditardescricao: TStringField;
    qryProcuraDebitarcodigo: TIntegerField;
    qryProcuraDebitarclassificacao: TStringField;
    qryProcuraDebitardescricao: TStringField;
    qryLancamentosvalor: TFloatField;
    qryConsultaLancamentosvalor: TFloatField;
    qryConsultaLancamentoscomplemento: TStringField;
    qryLancamentosnrorigem: TLargeintField;
    qryLancamentosLotes: TtecQuery;
    dsrLancamentosLotes: TtecDataSource;
    qryLancamentosLotesexercicio: TIntegerField;
    qryLancamentosLotesnrlancto: TIntegerField;
    qryLancamentosLotesfilial: TIntegerField;
    qryLancamentosLotesdata: TDateField;
    qryLancamentosLotesorigem: TStringField;
    qryLancamentosLotesdescricaoorigem: TStringField;
    qryLancamentosLotesnrorigem: TLargeintField;
    qryLancamentosLotesdebitar: TIntegerField;
    qryLancamentosLotescreditar: TIntegerField;
    qryLancamentosLotesvalor: TFloatField;
    qryLancamentosLoteshistorico: TIntegerField;
    qryLancamentosLotescomplemento: TStringField;
    qryTotais: TtecQuery;
    qryTotaistotaldebito: TFloatField;
    qryTotaistotalcredito: TFloatField;
    dsrTotais: TtecDataSource;
    qryLancamentosLotescontacontabil: TIntegerField;
    qryLancamentosLotesdescricaocontacontabil: TStringField;
    qryLancamentosLotesclassificacaocontacontabil: TStringField;
    qryLancamentosLotesvalordebito: TFloatField;
    qryLancamentosLotesvalorcredito: TFloatField;
    qryLancamentosnumerocriado: TBooleanField;
    spcLotesProximo: TtecQuery;
    spcLotesProximocodigo: TIntegerField;
    qryLancamentosnrorigemlote: TLargeintField;
    qryTotaisdatainicial: TDateField;
    qryTotaisdatafinal: TDateField;
    qryLancamentosdescricaoorigemstatus: TStringField;
    qryBloquearLancamentos: TtecQuery;
    qryLancamentosdebitoverificado: TStringField;
    qryLancamentoscreditoverificado: TStringField;
    procedure qryLancamentosNewRecord(DataSet: TDataSet);
    procedure dsrLancamentosDataChange(Sender: TObject; Field: TField);
    procedure qryConsultaLancamentosAfterClose(DataSet: TDataSet);
    procedure qryLancamentosBeforeClose(DataSet: TDataSet);
    procedure qryConsultaContaAfterClose(DataSet: TDataSet);
    procedure qryLancamentosAfterOpen(DataSet: TDataSet);
    procedure qryLancamentosAfterPost(DataSet: TDataSet);
    procedure qryLancamentosAfterDelete(DataSet: TDataSet);
    procedure qryLancamentosAfterScroll(DataSet: TDataSet);
    procedure qryProcuraDebitarBeforeOpen(DataSet: TDataSet);
    procedure qryProcuraCreditarBeforeOpen(DataSet: TDataSet);
    procedure qryLancamentosAfterCancel(DataSet: TDataSet);
    procedure qryLancamentosCalcFields(DataSet: TDataSet);
    procedure qryConsultaLancamentosBeforeOpen(DataSet: TDataSet);
  private
    FProximoNrLancto: integer;
    FDebitoAnterior: String;
    FCreditoAnterior: String;
    FNrLanctoAtual: integer;
    FNrLanctoOriginal: integer;
    FNrLote: integer;
    FLancamentosAfterOpen: TNotifyEvent;
    FFilialLancamento: integer;
    FExercicioLancamento: integer;
    FDataInicialAlteracao: String;
    FDataFinalAlteracao: String;
    fNomeorigemformulario: String;
    FHistoricoPadrao: Integer;
    function GetProximoNrLancto: integer;
    procedure SetProximoNrLancto(const Value: integer);
    procedure SetDataFinalAlteracao(const Value: String);
    procedure SetDataInicialAlteracao(const Value: String);
  private
    DataNovaInclusao : TDateTime;
    DebitarNovaInclusao: Integer;
    CreditarNovaInclusao: integer;
    HistoricoNovaInclusao: integer;
    FDataInicialConsulta: String;
    FDataFinalConsulta: String;
    forigem: String;
    fnrorigem: int64;
    fdescricaoorigem: string;
    fdataorigem: tDateTime;
    FListaContasContabeis: String;
    FPermiteAlterarContabilidade: Boolean;
    fdescricaohistorico: string;
    FLancamentoAlterado: Boolean;
    forigemformulario: String;
    function GetTabelaLancamentos: TZDataset;
    function GetConsultaLancamentos: TZDataset;
    function GetConsultaHistoricos: TZDataset;
    function GetConsultaConta: TZDataset;
    function GetOrigemLancamento: String;
    procedure SetHistoricoConsulta(const Value: String);
    procedure SetNrLanctoConsulta(const Value: String);
    procedure SetOrigemConsulta(const Value: String);
    procedure SetPlanoConsulta(const Value: String);
    procedure SetDataFinalConsulta(const Value: String);
    procedure SetDataInicialConsulta(const Value: String);
    function GetNumeroLancamentos: Integer;
    procedure AtribuirParametrosIniciais;
    procedure SetOrdenacaoConsulta(const Value: Integer);
    procedure SetValorFinalConsulta(const Value: String);
    procedure SetValorInicialConsulta(const Value: String);
    procedure AtribuirParametrosDebito;
    procedure AtribuirParametrosCredito;
    function getListaContasContabeis: String;

    { Private declarations }
  public
    LoteAlterado : Boolean;
    FSQLListaContaContabilContaDebito: String;
    FSQLListaContaContabilContaCredito: String;
    function  IncluirLancamentos(Editando: Boolean): Boolean; overload;
    function GravarLancamentos: Boolean;
    function GravarLancamentosLotes: Boolean;
    function ValidarTotaisDiariosLotes: Boolean;
    procedure AtualizarLancamentosLotesSimples;
    function  ExcluirLancamentos: Boolean;
    function  ExcluirLotes: Boolean;

    function  ExisteLancamento(Campo, Codigo: String): Boolean;
    function  ExisteHistorico(Campo, Codigo: String): Boolean;
    function  ExisteConta(Campo, Codigo: String): Boolean;
    function  AbrirConsultaLancamentos: Boolean;
    function  RefazConsultaLancamento: Boolean;
    procedure PercorrerLanctos(Campo: Byte; ValorCampo: Variant; Key: Word; Shift: TShiftState);
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaConsulta(TipoConsulta: TtecLancamentoContas);
    procedure Selecionar(TipoConsulta: TtecLancamentoContas);
    procedure FechaTabelaConsulta(TipoConsulta: TtecLancamentoContas);
    procedure LimparParametros;
    procedure LimparConsultaLancamentos;
    property  TabelaLancamentos: TZDataset read GetTabelaLancamentos;
    property  ConsultaLancamentos: TZDataset read GetConsultaLancamentos;
    property  ConsultaConta: TZDataset read GetConsultaConta;
    property  ConsultaHistoricos: TZDataset read GetConsultaHistoricos;
    property  OrigemLancamento: String read GetOrigemLancamento;
    property  NrLanctoConsulta: String write SetNrLanctoConsulta;
    property  PlanoConsulta: String write SetPlanoConsulta;
    property  HistoricoConsulta: String write SetHistoricoConsulta;
    property  ValorInicialConsulta: String write SetValorInicialConsulta;
    property  ValorFinalConsulta: String write SetValorFinalConsulta;
    property  OrigemConsulta: String write SetOrigemConsulta;
    property  DataInicialConsulta: String read FDataInicialConsulta write SetDataInicialConsulta;
    property  DataFinalConsulta: String read FDataFinalConsulta write SetDataFinalConsulta;
    property  DataInicialAlteracao: String read FDataInicialAlteracao write SetDataInicialAlteracao;
    property  DataFinalAlteracao: String read FDataFinalAlteracao write SetDataFinalAlteracao;
    property  OrdenacaoConsulta: Integer write SetOrdenacaoConsulta;
    property  NumeroLancamentos: Integer read GetNumeroLancamentos;
    property origem: String read forigem write forigem;
    property origemformulario: String read forigemformulario write forigemformulario;
    property Nomeorigemformulario: String read fNomeorigemformulario write fNomeorigemformulario;
    property FilialLancamento: integer read FFilialLancamento write FFilialLancamento;
    property HistoricoPadrao :Integer  read FHistoricoPadrao write FHistoricoPadrao;
    property ExercicioLancamento : integer read FExercicioLancamento write FExercicioLancamento;
    property descricaoorigem: string read fdescricaoorigem write fdescricaoorigem;
    property nrorigem: int64 read fnrorigem write fnrorigem;
    property dataorigem: tDateTime read fdataorigem write fdataorigem;
    property PermiteAlterarContabilidade: Boolean read FPermiteAlterarContabilidade write FPermiteAlterarContabilidade;
    property descricaohistorico: string read fdescricaohistorico write fdescricaohistorico;
    procedure GuardarParametrosExternos(Value: array of Variant);
    procedure AtribuirDadosExternos;
    procedure CancelarLancamentos;
    procedure AtualizarListaContaContabil; overload;
    procedure AtualizarListaContaContabil(EntranaLista: String; TipoLancto: TtecTipoLancamento); overload;
    Procedure LigarDesligarEventosLancamentos(Ligar: Boolean);
    procedure GravarLancamentosExternos;
    property  ListaContasContabeis: String read getListaContasContabeis write FListaContasContabeis;
    property LancamentoAlterado: Boolean read FLancamentoAlterado write FLancamentoAlterado;
    property DebitoAnterior: String read FDebitoAnterior write FDebitoAnterior;
    property CreditoAnterior: string read FCreditoAnterior write FCreditoAnterior;
    property NrLanctoAtual: integer read FNrLanctoAtual write FNrLanctoAtual;
    property NrLanctoOriginal: integer read FNrLanctoOriginal write FNrLanctoOriginal;
    property NrLote: integer read FNrLote write FNrLote;
    procedure AbrirLoteLancamentos;
    procedure LigarLancamentosemLote;
    procedure DesligarLancamentosemLote;
    property ProximoNrLancto: integer read GetProximoNrLancto write SetProximoNrLancto;
    property LancamentosAfterOpen: TNotifyEvent read FLancamentosAfterOpen write FLancamentosAfterOpen;
    procedure AbrirTotaisLotes;
    procedure GuardarValoresInclusao;
    procedure AtribuirValoresInclusao;
    { Public declarations }
  end;

var
  dtmLancamentoContas: TdtmLancamentoContas;
  OperacaoLancamento : TtecTipoOperacaoLancamentosContabeis;

const
  SQLListaContaContabil =   'and ((codigo = %s) or  true /* (codigo not in (%s))*/ )';

implementation


{$R *.dfm}

{ TdtmLancamentoContas }

procedure TdtmLancamentoContas.AbreTabelaConsulta(
  TipoConsulta: TtecLancamentoContas);
begin
  case TipoConsulta of
    lacLANCAMENTO       : begin
                            qryConsultaLancamentos.Params[0].AsInteger := ExercicioLancamento;
                            qryConsultaLancamentos.Params[1].AsInteger := FilialLancamento;
                            Abre(ctConsultaLancamentos);
                          end;
    lacDEBITAR          : begin
                           qryConsultaConta.Params[0].AsInteger := qryLancamentoscreditar.Asinteger;
                           case OperacaoLancamento of
                             tlcINSERIREXTERNO,
                             tlcEDITAREXTERNO,
                             tlcLOTESEXTERNO:
                               if qrylancamentosdebitar.asinteger <> 0 then
                                 qryConsultaConta.MacroByName('SQLListaContaContabil').AsString :=
                                   format(SQLListaContaContabil,
                                         [qrylancamentosdebitar.asstring, ListaContasContabeis])
                               else
                               if (qrylancamentosdebitar.oldvalue <> null) and
                                  (qrylancamentos.State <> dsinsert) then
                                 qryConsultaConta.MacroByName('SQLListaContaContabil').AsString :=
                                   format(SQLListaContaContabil,
                                         [qrylancamentosdebitar.oldvalue,ListaContasContabeis])
                               else
                                 qryConsultaConta.MacroByName('SQLListaContaContabil').AsString :=
                                   format(SQLListaContaContabil,
                                         ['0',ListaContasContabeis]);
                           end;
                           abre(ctConsultaContaContabil);
                          end;

    lacCREDITAR         : begin
                           qryConsultaConta.Params[0].AsInteger := qryLancamentosdebitar.Asinteger;
                           case OperacaoLancamento of
                             tlcINSERIREXTERNO,
                             tlcEDITAREXTERNO,
                             tlcLOTESEXTERNO :
                               if qrylancamentoscreditar.asinteger <> 0 then
                                 qryConsultaConta.MacroByName('SQLListaContaContabil').AsString :=
                                   format(SQLListaContaContabil,
                                         [qrylancamentoscreditar.asstring, ListaContasContabeis])
                               else
                               if (qrylancamentoscreditar.oldvalue <> null) and
                                  (qrylancamentos.State <> dsinsert) then
                                 qryConsultaConta.MacroByName('SQLListaContaContabil').AsString :=
                                   format(SQLListaContaContabil,
                                         [qrylancamentoscreditar.oldvalue,ListaContasContabeis])
                               else
                                 qryConsultaConta.MacroByName('SQLListaContaContabil').AsString :=
                                   format(SQLListaContaContabil,
                                         ['0',ListaContasContabeis]);
                           end;
                           abre(ctConsultaContaContabil);
                          end;
    lacHISTORICO,
    lacHISTORICOCONSULTA: Abre(ctConsultaHistoricos);

    lacCONTACONTABIL    : Abre(ctConsultaContaContabil);
  end;
end;

constructor TdtmLancamentoContas.Create(AOwner: TComponent);
begin
  inherited;
  FilialLancamento := filialbase;
  ExercicioLancamento := ParSistema.EXERCICIOCONTABILIDADE;
  qryLancamentos.Tag := ctTabelas;
  qryProcuraPlanoConsulta.Tag := ctTabelas;
  qryProcuraHistoricoConsulta.Tag := ctTabelas;

  qryConsultaLancamentos.Tag := ctConsultaLancamentos;
  qryConsultaConta.Tag := ctConsultaContaContabil;
  qryConsultaHistorico.Tag  := ctConsultaHistoricos;
  AtribuirParametrosIniciais;
  qryConsultaLancamentos.Params[0].AsInteger := ExercicioLancamento;
  qryConsultaLancamentos.Params[1].AsInteger := FilialLancamento;

  qryProcuraDebitar.Params[1].AsInteger  := 0;
//  qryProcuraDebitar.Params[2].AsInteger  := 0;
  qryProcuraCreditar.Params[1].AsInteger := 0;
//  qryProcuraCreditar.Params[2].AsInteger := 0;
//  qryConsultaConta.Params[0].AsInteger   := 0;
  OperacaoLancamento := tlcMANUAL;
  LancamentoAlterado := false;
end;

function TdtmLancamentoContas.ExcluirLancamentos: Boolean;
begin
  Result:= False;
  if (not qryLancamentos.IsEmpty) and
     ((qryLancamentosorigem.AsString = 'M') or
      (qryLancamentosorigem.AsString = 'L') or
      (OperacaoLancamento in [tlcINSERIREXTERNO, tlcEDITAREXTERNO, tlcLOTESEXTERNO])
     )
     then
  begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o Lançamento'])) = smbok then
    begin
      qryLancamentos.Delete;
      case OperacaoLancamento of
        tlcMANUAL : Perpetrar([qryLancamentos]);
        tlcLOTES,
        tlcINSERIREXTERNO,
        tlcEDITAREXTERNO,
        tlcLOTESEXTERNO  : AtualizarLancamentosLotesSimples;
      end;
      Result:= True;
    end
  end;
end;

function TdtmLancamentoContas.ExisteHistorico(Campo,
  Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaHistorico, campo, codigo);
end;

function TdtmLancamentoContas.ExisteLancamento(Campo,
  Codigo: String): Boolean;
const
  SQL = 'AND (UPPER(TO_ASCII(%s,''LATIN1'')) ILIKE UPPER(TO_ASCII(''%s%s'',''LATIN1''))';
begin
  qryConsultaLancamentos.MacroByName('consulta').AsString := Format(SQL, [Campo, Codigo, '%']);
  qryConsultaLancamentos.Close;
  qryConsultaLancamentos.Open;
  Result := (qryConsultaLancamentos.RecordCount > 0);
end;

procedure TdtmLancamentoContas.FechaTabelaConsulta(
  TipoConsulta: TtecLancamentoContas);
begin
  case TipoConsulta of
    lacLANCAMENTO       : Fecha(ctConsultaLancamentos);
    lacDEBITAR,
    lacCREDITAR,
    lacCONTACONTABIL    : Fecha(ctConsultaContaContabil);
    lacHISTORICO        : Fecha(ctConsultaHistoricos);
  end;
end;

function TdtmLancamentoContas.GetConsultaHistoricos: TZDataset;
begin
  Result := qryConsultaHistorico;
end;

function TdtmLancamentoContas.GetConsultaLancamentos: TZDataset;
begin
  Result := qryConsultaLancamentos;
end;

function TdtmLancamentoContas.GetTabelaLancamentos: TZDataset;
begin
  Result := qryLancamentos;
end;

function TdtmLancamentoContas.IncluirLancamentos(Editando: Boolean): Boolean;
begin
  if not editando then
    qryLancamentos.append;
  Result := True;
end;

procedure TdtmLancamentoContas.Selecionar(
  TipoConsulta: TtecLancamentoContas);
begin
  case TipoConsulta of
    lacLANCAMENTO       : ReFazConsulta(qryLancamentos,[1],[qryConsultaLancamentosnrlancto.AsInteger]);
    lacDEBITAR          : begin
                            if qryConsultaContatipo.AsString<>'S' then
                            begin
                              if not (qryLancamentos.state in [dsinsert, dsedit]) then
                                qryLancamentos.Edit;
                              qryLancamentosdebitar.AsInteger := qryConsultaContacodigo.AsInteger
                            end
                            else
                            begin
                              if not qryLancamentosdebitar.IsNull then
                              begin
                                if not (qryLancamentos.state in [dsinsert, dsedit]) then
                                  qryLancamentos.Edit;
                                qryLancamentosdebitar.Clear;
                              end;
                            end
                          end;
    lacCREDITAR         : begin
                            if qryConsultaContatipo.AsString<>'S' then
                            begin
                              if not (qryLancamentos.state in [dsinsert, dsedit]) then
                                qryLancamentos.Edit;
                              qryLancamentoscreditar.AsInteger := qryConsultaContacodigo.AsInteger
                            end
                            else
                            begin
                              if not qryLancamentoscreditar.IsNull then
                              begin
                                if not (qryLancamentos.state in [dsinsert, dsedit]) then
                                  qryLancamentos.Edit;
                                qryLancamentoscreditar.Clear;
                              end;
                            end
                          end;
    lacHISTORICO        : begin
                            qryLancamentos.Edit;
                            qryLancamentoshistorico.AsInteger := qryConsultaHistoricocodigo.AsInteger;
                          end;
    lacCONTACONTABIL    : RefazConsulta(qryProcuraPlanoConsulta,[0],[qryConsultaContacodigo.AsInteger]);
    lacHISTORICOCONSULTA: RefazConsulta(qryProcuraHistoricoConsulta,[0],[qryConsultaHistoricocodigo.AsInteger]);
  end;
end;

procedure TdtmLancamentoContas.qryLancamentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  case OperacaoLancamento of
    tlcMANUAL:
    begin
      qryLancamentosexercicio.AsInteger := ExercicioLancamento;
      qryLancamentosorigem.AsString     := 'M';
      qryLancamentosdescricaoorigem.AsString     := 'MANUAL';
    end;
    tlcINSERIREXTERNO,
    tlcEDITAREXTERNO,
    tlcLOTESEXTERNO: AtribuirDadosExternos;
    tlcLOTES :
    begin
      qryLancamentosexercicio.AsInteger := ExercicioLancamento;
      qryLancamentosorigem.AsString     := 'L';
      qryLancamentosdescricaoorigem.AsString     := 'LOTES';
      if NrLote<>0 then
      begin
        qryLancamentosnrorigem.AsLargeInt := NrLote;
        qryLancamentosnrorigemlote.AsInteger := NrLote;
      end
      else
      begin
        qryLancamentosnrorigem.Clear;
        qryLancamentosnrorigemlote.Clear;
      end;

      if not qryLancamentosLotesdata.isnull then
        qryLancamentosdata.AsDateTime := qryLancamentosLotesdata.AsDateTime
      else
        qrylancamentosdata.AsDateTime := DataServidor;
      if not qryLancamentosLoteshistorico.IsNull then
        qryLancamentoshistorico.AsInteger := qryLancamentosLoteshistorico.AsInteger;
    end;
  end;
  qryLancamentosfilial.AsInteger := FilialLancamento;
  qryLancamentosnumerocriado.AsBoolean := false;
end;

function TdtmLancamentoContas.GetConsultaConta: TZDataset;
begin
  Result := qryConsultaConta;
end;

function TdtmLancamentoContas.ExisteConta(Campo,
  Codigo: String): Boolean;
begin
  if campo = 'descricaoedentada' then
    Result:= ExisteCodigo(qryConsultaConta, 'descricao', codigo)
  else
    Result:= ExisteCodigo(qryConsultaConta, campo, codigo);
end;

function TdtmLancamentoContas.GravarLancamentos: Boolean;
begin
  if qryLancamentosvalor.AsCurrency=0 then
    qryLancamentosvalor.Clear;

  qryLancamentosdebitar.Required := OperacaoLancamento = tlcMANUAL;
  qryLancamentoscreditar.Required := OperacaoLancamento = tlcMANUAL;
  if (qryLancamentosdebitar.AsInteger <> qryLancamentoscreditar.AsInteger) or
     (qryLancamentosdebitar.IsNull) or
     (qryLancamentoscreditar.IsNull) then
  begin
    if qryLancamentos.CheckRequiredFields then
    begin
      if not ((qryLancamentosdebitar.IsNull) and (qryLancamentoscreditar.IsNull)) then
      begin
        case OperacaoLancamento of
          tlcMANUAL:
          begin
            if (qryLancamentos.State in [dsInsert]) and
               (qryLancamentosnrlancto.AsInteger=0) then
              qryLancamentosnrlancto.AsInteger := ProximoNrLancto;

            if (qryLancamentos.State in [dsEdit,dsInsert]) then
            begin
              qryLancamentosnrorigemlote.Clear;
              qrylancamentosnrorigem.Clear;
              qryLancamentos.Post;
              Perpetrar([qryLancamentos]);
            end;
          end;

          tlcINSERIREXTERNO,
          tlcEDITAREXTERNO,
          tlcLOTESEXTERNO,
          tlcLOTES:
          begin
            if (qryLancamentos.State in [dsInsert]) and
               (qryLancamentosnrlancto.AsInteger=0) then
            begin
                qryLancamentosnrlancto.AsInteger := ProximoNrLancto;
                qryLancamentosnumerocriado.AsBoolean := true;
            end;

            if (qryLancamentos.State in [dsEdit,dsInsert]) then
              qryLancamentos.Post;
            AtualizarLancamentosLotesSimples;
          end;

        end;
        Result := True;
      end
      else
      begin
        result := false;
        MensagemErro('As contas de débito ou crédito não foram lançadas.');
      end;
    end
    else
      Result := False
  end
  else
  begin
    Result := False;
    MensagemErro('Os planos de contas à debitar e à creditar devem ser diferentes.');
  end;
  qryLancamentosdebitar.Required := false;
  qryLancamentoscreditar.Required := false;
end;

procedure TdtmLancamentoContas.dsrLancamentosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryLancamentosdata then
  begin
    if trim(qryLancamentosdata.AsString) <> '' then
    begin
      dsrLancamentos.OnDataChange := nil;
      qryLancamentosdata.AsString := copy(qryLancamentosdata.AsString,0,6) + IntToStr(ExercicioLancamento);
      dsrLancamentos.OnDataChange := dsrLancamentosDataChange;
    end;
    qryProcuraDebitar.Close;
    qryProcuraCreditar.Close;
    qryConsultaConta.Close;
    qryProcuraDebitar.Open;
    qryProcuraCreditar.Open;
  end
  else
  if (field = qryLancamentosdebitar) then
  begin
    AtualizarListaContaContabil(field.asString, tlDEBITO);
    AtribuirParametrosDebito;
    AtribuirParametrosCredito;
  end
  else
  if (field = qryLancamentoscreditar) then
  begin
    AtualizarListaContaContabil(field.asString, tlCREDITO);
    AtribuirParametrosDebito;
    AtribuirParametrosCredito;
  end;
end;

procedure TdtmLancamentoContas.LimparParametros;
begin
  qryConsultaConta.MacroByName('SQLListaContaContabil').AsString := '';
  qryConsultaConta.MacroByName('inativo').AsString  := '';
end;

function TdtmLancamentoContas.GetOrigemLancamento: String;
begin
  Result := qryLancamentosorigem.AsString;
end;

procedure TdtmLancamentoContas.SetHistoricoConsulta(const Value: String);
begin
  if Value <> '' then
    qryConsultaLancamentos.MacroByName('historico').AsString := ' and l.historico = ' + Value
  else
    qryConsultaLancamentos.MacroByName('historico').AsString := '';
end;

procedure TdtmLancamentoContas.SetNrLanctoConsulta(const Value: String);
begin
  if Value <> '' then
    qryConsultaLancamentos.MacroByName('nrlancto').AsString := ' and l.nrlancto = ' + Value
  else
    qryConsultaLancamentos.MacroByName('nrlancto').AsString := '';
end;

procedure TdtmLancamentoContas.SetOrigemConsulta(const Value: String);
begin
  if Value <> '' then
    qryConsultaLancamentos.MacroByName('origem').AsString := ' and l.origem in (' + Value + ')'
  else
    qryConsultaLancamentos.MacroByName('origem').AsString := '';
end;

procedure TdtmLancamentoContas.SetPlanoConsulta(const Value: String);
begin
  if Value <> '' then
    qryConsultaLancamentos.MacroByName('plano').AsString := ' and (l.debitar = ' + Value +
                                                            ' or l.creditar = ' + Value + ')'
  else
    qryConsultaLancamentos.MacroByName('plano').AsString := '';
end;

procedure TdtmLancamentoContas.SetDataFinalConsulta(const Value: String);
begin
  FDataFinalConsulta:= Value;
  qryConsultaLancamentos.MacroByName('data').Value := MontarIntervaloData('l.data',FDataInicialConsulta,FDataFinalConsulta);
end;

procedure TdtmLancamentoContas.SetDataInicialConsulta(const Value: String);
begin
  FDataInicialConsulta:= Value;
  qryConsultaLancamentos.MacroByName('data').Value := MontarIntervaloData('l.data',FDataInicialConsulta,FDataFinalConsulta);
end;

function TdtmLancamentoContas.AbrirConsultaLancamentos: Boolean;
begin
  if qryConsultaLancamentos.Active then
    qryConsultaLancamentos.Close;
  qryConsultaLancamentos.Open;
  result := qryConsultaLancamentos.IsEmpty;
end;

function TdtmLancamentoContas.RefazConsultaLancamento: Boolean;
begin
  case OperacaoLancamento of
    tlcMANUAL : ReFazConsulta(qryLancamentos,[0,1,3],[0,0,qryConsultaLancamentosnrlancto.AsInteger]);
  end;
  result := qryLancamentos.IsEmpty;
end;

function TdtmLancamentoContas.GetNumeroLancamentos: Integer;
begin
  result := 0;
  case OperacaoLancamento of
    tlcMANUAL: result := qryConsultaLancamentos.RecordCount;
    tlcINSERIREXTERNO,
    tlcEDITAREXTERNO,
    tlcLOTESEXTERNO,
    tlcLOTES: result := qrylancamentos.recordcount;
  end;
end;

procedure TdtmLancamentoContas.LimparConsultaLancamentos;
begin
  if qryConsultaLancamentos.Active then
    qryConsultaLancamentos.Close;
end;

procedure TdtmLancamentoContas.PercorrerLanctos(Campo: Byte; ValorCampo: Variant; Key: Word;
  Shift: TShiftState);
var
  Operacao: Byte;
  Lancto, Debitar, Creditar, Historico, NrOrigemLote: Variant;
  DiaMes : Variant;
  Valor: String;
begin

  Operacao := 0;


  if ssCtrl in Shift
  then
       case Key of
         VK_HOME:     Operacao:= Primeiro;
         VK_END:      Operacao:= Ultimo;
       end
  else
       case Key of
         VK_PRIOR:   Operacao:= Anterior;
         VK_NEXT: Operacao:= Proximo;
       end;

  case OperacaoLancamento of
  tlcMANUAL:
    begin
      Lancto      := qryLancamentosnrlancto.AsVariant;
      DiaMes      := qryLancamentosdata.AsVariant;
      Debitar     := qryLancamentosdebitar.AsVariant;
      Creditar    := qryLancamentoscreditar.AsVariant;
      if qryLancamentosvalor.AsString <> '' then
        Valor     := Trocar(qryLancamentosvalor.AsString,',','.')
      else
        Valor     := '0';
      Historico   := qryLancamentoshistorico.AsVariant;
      NrOrigemLote := qryLancamentosnrorigemlote.AsVariant;

      with qryLancamentos do
      begin
        case Campo of
          cmpLancto  : begin
                         if ValorCampo<>'' then
                           Lancto := ValorCampo;
                         case Operacao of
                           Primeiro,
                           Proximo:  MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY nrlancto LIMIT 1';
                           Anterior,
                           Ultimo:   MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY nrlancto DESC LIMIT 1';
                         end;
                       end;
          cmpDiaMes  : begin
                         if ValorCampo<>'' then
                           DiaMes := strtodate(ValorCampo+'/'+inttostr(ExercicioLancamento));
                         case Operacao of
                           Primeiro,
                           Proximo:  MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY data, nrlancto LIMIT 1';
                           Anterior,
                           Ultimo:   MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY data DESC, nrlancto DESC LIMIT 1';
                         end;
                       end;
          cmpDebitar : begin
                         if ValorCampo<>'' then
                           Debitar := ValorCampo;
                         case Operacao of
                           Primeiro,
                           Proximo:  MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY debitar, data, nrlancto LIMIT 1';
                           Anterior,
                           Ultimo:   MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY debitar DESC, data DESC, nrlancto DESC LIMIT 1';
                          end;
                        end;
          cmpCreditar: begin
                         if ValorCampo<>'' then
                           Creditar := ValorCampo;
                         case Operacao of
                           Primeiro,
                           Proximo:  MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY creditar, data, nrlancto LIMIT 1';
                           Anterior,
                           Ultimo:   MacroByName('Ordenacao').AsString:=
                                                 'ORDER BY creditar DESC, data DESC, nrlancto DESC LIMIT 1';
                         end;
                       end;
          cmpValor   : begin
                         if ValorCampo<>'' then
                           Valor := Trocar(ValorCampo,',','.');
                         case Operacao of
                          Primeiro,
                          Proximo:  MacroByName('Ordenacao').AsString:=
                                                'ORDER BY valor, data, nrlancto LIMIT 1';
                          Anterior,
                          Ultimo:   MacroByName('Ordenacao').AsString:=
                                                'ORDER BY valor DESC, data DESC, nrlancto DESC LIMIT 1';
                         end;
                       end;
          cmpHistorico : begin
                           if ValorCampo<>'' then
                             Historico := ValorCampo;
                           case Operacao of
                             Primeiro,
                             Proximo:  MacroByName('Ordenacao').AsString:=
                                                   'ORDER BY historico, data, nrlancto LIMIT 1';
                             Anterior,
                             Ultimo:   MacroByName('Ordenacao').AsString:=
                                                   'ORDER BY historico DESC, data DESC, nrlancto DESC LIMIT 1';
                           end;
                         end;
          cmpNrOrigemLote  : begin
                           if ValorCampo<>'' then
                             NrOrigemLote := ValorCampo;
                           case Operacao of
                             Primeiro,
                             Proximo:  MacroByName('Ordenacao').AsString:=
                                                   'ORDER BY nrorigem LIMIT 1';
                             Anterior,
                             Ultimo:   MacroByName('Ordenacao').AsString:=
                                                   'ORDER BY nrorigem DESC LIMIT 1';
                           end;
                         end;
        end;

          RefazConsulta(qryLancamentos,[0,1,2,3,4,5,6,7,8,9,10],
                        [Campo,
                         Operacao,
                         exerciciolancamento,
                         Lancto,
                         FilialLancamento,
                         diaMes,
                         debitar,
                         creditar,
                         Valor,
                         historico,
                         NrOrigemLote]);

        if qryLancamentos.RecordCount = 0 then begin
          RefazConsulta(qryLancamentos, [0,1,2,3,4,5,6,7,8,9,10],
                        [PosicaoAtual, PosicaoAtual,
                         ExercicioLancamento, Lancto, FilialLancamento,
                         DiaMes, Debitar, Creditar, Valor, Historico, NrOrigemLote]);
           case Operacao of
             Anterior: MensagemAviso('Este é o 1º lançamento');
             Proximo:  MensagemAviso('Este é o último lançamento');
           end;
         end;
      end;
    //    EnableControls;
    end;
  tlcINSERIREXTERNO, tlcEDITAREXTERNO, tlcLOTES, tlcLOTESEXTERNO:
    begin
      if (qrylancamentos.State in [dsedit, dsinsert]) then
       qrylancamentos.Cancel;
      case Operacao of
        Primeiro: qrylancamentos.First;
        Proximo : qrylancamentos.Next;
        Anterior: qryLancamentos.Prior;
        Ultimo  : qryLancamentos.Last;
      end;

      if qryLancamentos.Bof then
        MensagemAviso('Este é o 1º lançamento')
      else
        if qrylancamentos.Eof then
          MensagemAviso('Este é o último lançamento');
    end;
  end;
end;

procedure TdtmLancamentoContas.qryConsultaLancamentosAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaLancamentos.Params[0].AsInteger := ExercicioLancamento;
  qryConsultaLancamentos.Params[1].AsInteger := FilialLancamento;
end;

procedure TdtmLancamentoContas.AtribuirParametrosIniciais;
begin
  qryLancamentos.Params[0].AsInteger    := 0;
  qryLancamentos.Params[1].AsInteger    := 0;
  qryLancamentos.Params[2].AsInteger    := ExercicioLancamento;
  qryLancamentos.Params[4].AsInteger    := FilialLancamento;
  qryLancamentos.Params[5].AsDateTime   := DataServidor;
  qryLancamentos.Params[6].AsInteger    := 0;
  qryLancamentos.Params[7].AsInteger    := 0;
  qryLancamentos.Params[8].AsInteger    := 0;
  qryLancamentos.Params[9].AsInteger    := 0;
  qryLancamentos.Params[10].AsInteger   := 0;
end;

procedure TdtmLancamentoContas.qryLancamentosBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametrosIniciais;
end;


procedure TdtmLancamentoContas.SetOrdenacaoConsulta(const Value: Integer);
begin
  case Value of
    0:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.nrlancto, l.data, l.debitar, l.creditar, l.valor, l.historico, l.origem';
    1:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.data, l.nrlancto, l.debitar, l.creditar, l.valor, l.historico, l.origem';
    2:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.debitar, l.data, l.nrlancto, l.creditar, l.valor, l.historico, l.origem';
    3:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.creditar, l.data, l.nrlancto, l.debitar, l.valor, l.historico, l.origem';
    4:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.valor, l.data, l.nrlancto, l.debitar, l.creditar, l.historico, l.origem';
    5:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.historico, l.data, l.nrlancto, l.debitar, l.creditar, l.valor, l.origem';
    6:  qryConsultaLancamentos.MacroByName('ordenacao').AsString := 'Order By l.origem, l.data, l.nrlancto, l.debitar, l.creditar, l.valor, l.historico';
  end;
end;

procedure TdtmLancamentoContas.SetValorFinalConsulta(const Value: String);
begin
    if Value <> '' then
    qryConsultaLancamentos.MacroByName('valorfinal').AsString := ' and l.valor <= ' + trocar(trocar(Value,'.',''),',','.')
  else
    qryConsultaLancamentos.MacroByName('valorfinal').AsString := '';
end;

procedure TdtmLancamentoContas.SetValorInicialConsulta(
  const Value: String);
begin
  if Value <> '' then
    qryConsultaLancamentos.MacroByName('valorinicial').AsString := ' and l.valor >= ' + trocar(trocar(Value,'.',''),',','.')
  else
    qryConsultaLancamentos.MacroByName('valorinicial').AsString := '';
end;

procedure TdtmLancamentoContas.qryConsultaContaAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  if qryLancamentosdata.AsString <> '' then
    qryConsultaConta.MacroByName('inativo').AsString := 'and ((p.inativo is null) or (p.inativo > ''' + qryLancamentosdata.AsString + '''))'
  else
    qryConsultaConta.MacroByName('inativo').AsString := 'and p.inativo is null';
end;

procedure TdtmLancamentoContas.qryLancamentosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if (qryLancamentos.State = dsBrowse) and (qryLancamentosdata.AsString <> '') then
  begin
    if qryProcuraDebitar.Active then
    begin
      qryProcuraDebitar.Close;
      qryProcuraCreditar.Close;
    end;
    qryProcuraDebitar.MacroByName('inativo').AsString := 'and ((inativo is null) or (inativo > ''' + qryLancamentosdata.AsString + '''))';
    qryProcuraCreditar.MacroByName('inativo').AsString := 'and ((inativo is null) or (inativo > ''' + qryLancamentosdata.AsString + '''))';
    qryProcuraDebitar.Open;
    qryProcuraCreditar.Open;
  end;
  if qryLancamentosnrlancto.AsInteger <> 0 then
    NrLanctoAtual := qryLancamentosnrlancto.AsInteger;

  if Assigned(FLancamentosAfterOpen) then
    FLancamentosAfterOpen(DataSet);
end;

procedure TdtmLancamentoContas.AtribuirDadosExternos;
begin
  qryLancamentosorigem.AsString := origem;
  if HistoricoPadrao > 0 then
    qryLancamentoshistorico.AsInteger:= HistoricoPadrao;
  qryLancamentosdescricaoorigem.AsString := descricaoorigem;
  qryLancamentosnrorigem.AsLargeInt := nrorigem;
  qryLancamentosdata.AsDateTime := dataorigem;
  qryLancamentoscomplemento.AsString := descricaohistorico;
  qryLancamentosexercicio.AsInteger := ExercicioLancamento;
end;

procedure TdtmLancamentoContas.CancelarLancamentos;
begin
  if qrylancamentos.State in [dsedit, dsinsert] then
    qrylancamentos.cancel;
end;

procedure TdtmLancamentoContas.GuardarParametrosExternos(Value: array of Variant);
var
  i,j,NRegistro: integer;
begin
  OperacaoLancamento := Value[0];
  origem          := Value[1];
  descricaoorigem := Value[2];
  nrorigem        := Value[3];
  dataorigem      := Value[4];
  FListaContasContabeis := Value[6];
  NRegistro       := Value[7];
  PermiteAlterarContabilidade := Value[8];
  descricaohistorico := Value[9];
  origemformulario := Value[10];
  FProximoNrLancto := value[11];
  FilialLancamento := value[12];
  try  NomeOrigemFormulario := Value[13] except end;
  HistoricoPadrao  := value[14];
  ExercicioLancamento := yearof(DataOrigem);
  LigarDesligarEventosLancamentos(false);
  ReFazConsulta(qryLancamentos,[3],[0]);

  if origemformulario='E' then
  begin
    dtmLancamentoContabilidade.qryLancamentosNotasEntradas.First;
    for j:=1 to dtmLancamentoContabilidade.qryLancamentosNotasEntradas.RecordCount do
    begin
      qrylancamentos.Append;
      for i:= 0 to qryLancamentos.fieldcount-2 do
      begin

        if dtmLancamentoContabilidade.qryLancamentosNotasEntradas.fieldbyname(qryLancamentos.Fields[i].FieldName).isnull then
          qryLancamentos.Fields[i].clear
        else
        begin
          case qryLancamentos.Fields[i].DataType of
          ftBoolean   : qryLancamentos.Fields[i].AsBoolean := dtmLancamentoContabilidade.qryLancamentosNotasEntradas.fieldbyname(qryLancamentos.Fields[i].FieldName).AsBoolean;

          ftinteger,
          ftlargeint,
          ftstring    : qryLancamentos.Fields[i].asstring := dtmLancamentoContabilidade.qryLancamentosNotasEntradas.fieldbyname(qryLancamentos.Fields[i].FieldName).asstring;
          
          ftCurrency  : qryLancamentos.Fields[i].AsCurrency := dtmLancamentoContabilidade.qryLancamentosNotasEntradas.fieldbyname(qryLancamentos.Fields[i].FieldName).AsCurrency;

          else
            qryLancamentos.Fields[i].value := dtmLancamentoContabilidade.qryLancamentosNotasEntradas.fieldbyname(qryLancamentos.Fields[i].FieldName).value;
          end;

        end;

      end;
      qrylancamentos.Post;

      if j=NRegistro then
        GuardarRegistroAtual(qryLancamentos,false);

      dtmLancamentoContabilidade.qryLancamentosNotasEntradas.Next;
    end;
  end
  else
  if (origemformulario = 'D') or
     (origemformulario = 'G') or
     (origemformulario = 'V') or
     (origemformulario = 'H') then
  begin
    dtmLancamentoContabilidade.qryLancamentosDocumentos.First;
    for j:=1 to dtmLancamentoContabilidade.qryLancamentosDocumentos.RecordCount do
    begin
      qrylancamentos.Append;
      for i:= 0 to qryLancamentos.fieldcount-2 do
      begin
        if dtmLancamentoContabilidade.qryLancamentosDocumentos.fieldbyname(qryLancamentos.Fields[i].FieldName).isnull then
          qryLancamentos.Fields[i].clear
        else
        begin
          case qryLancamentos.Fields[i].DataType of
          ftBoolean : qryLancamentos.Fields[i].AsBoolean := dtmLancamentoContabilidade.qryLancamentosDocumentos.fieldbyname(qryLancamentos.Fields[i].FieldName).AsBoolean;

          ftinteger,
          ftlargeint,
          ftString : qryLancamentos.Fields[i].asstring := dtmLancamentoContabilidade.qryLancamentosDocumentos.fieldbyname(qryLancamentos.Fields[i].FieldName).asstring;
          ftCurrency :qryLancamentos.Fields[i].AsCurrency := dtmLancamentoContabilidade.qryLancamentosDocumentos.fieldbyname(qryLancamentos.Fields[i].FieldName).AsCurrency;
          else
            qryLancamentos.Fields[i].value := dtmLancamentoContabilidade.qryLancamentosDocumentos.fieldbyname(qryLancamentos.Fields[i].FieldName).value;
          end;

        end;
      end;
      qrylancamentos.Post;
      if j=NRegistro then
        GuardarRegistroAtual(qryLancamentos,false);
      dtmLancamentoContabilidade.qryLancamentosDocumentos.Next;
    end;
  end
  else
  if origemformulario='S' then
  begin
    dtmLancamentoContabilidade.qryLancamentosNotasSaidas.First;
    for j:=1 to dtmLancamentoContabilidade.qryLancamentosNotasSaidas.RecordCount do
    begin
      qrylancamentos.Append;
      for i:= 0 to qryLancamentos.fieldcount-2 do
      begin
        if dtmLancamentoContabilidade.qryLancamentosNotasSaidas.fieldbyname(qryLancamentos.Fields[i].FieldName).isnull then
          qryLancamentos.Fields[i].clear
        else
        begin
          case qryLancamentos.Fields[i].DataType of
          ftBoolean : qryLancamentos.Fields[i].AsBoolean := dtmLancamentoContabilidade.qryLancamentosNotasSaidas.fieldbyname(qryLancamentos.Fields[i].FieldName).AsBoolean;
          ftinteger,
          ftlargeint,
          ftstring   : qryLancamentos.Fields[i].asstring := dtmLancamentoContabilidade.qryLancamentosNotasSaidas.fieldbyname(qryLancamentos.Fields[i].FieldName).asstring;
          ftCurrency : qryLancamentos.Fields[i].AsCurrency := dtmLancamentoContabilidade.qryLancamentosNotasSaidas.fieldbyname(qryLancamentos.Fields[i].FieldName).AsCurrency;
          else
            qryLancamentos.Fields[i].value := dtmLancamentoContabilidade.qryLancamentosNotasSaidas.fieldbyname(qryLancamentos.Fields[i].FieldName).value;
          end;
        end;
      end;
      qrylancamentos.Post;
      if j=NRegistro then
        GuardarRegistroAtual(qryLancamentos,false);

      dtmLancamentoContabilidade.qryLancamentosNotasSaidas.Next;
    end;
  end;

  VoltarRegistroAtual(qryLancamentos);
  AbrirLoteLancamentos;
  LigarDesligarEventosLancamentos(true);

end;

procedure TdtmLancamentoContas.AtualizarListaContaContabil;
begin
  FListaContasContabeis := '';
  GuardarRegistroAtual(qrylancamentos,true);
  LigarDesligarEventosLancamentos(false);
  qrylancamentos.First;
  While not qryLancamentos.Eof do
  begin
    if (pos(quotedstr(qryLancamentosdebitar.AsString),FListaContasContabeis)=0)  and
       (qryLancamentosdebitar.AsString<>'') then
      FListaContasContabeis := FlistaContasContabeis + quotedstr(qryLancamentosdebitar.AsString)+',';

    if (pos(quotedstr(qryLancamentoscreditar.AsString),FListaContasContabeis)=0)  and
       (qryLancamentoscreditar.AsString<>'') then
      FListaContasContabeis := FlistaContasContabeis + quotedstr(qryLancamentoscreditar.AsString)+',';
    qryLancamentos.Next;
  end;
  if copy(FListaContasContabeis,length(FListaContasContabeis),1)=',' then
    delete(FListaContasContabeis,length(FListaContasContabeis),1);
  VoltarRegistroAtual(qrylancamentos);
  LigarDesligarEventosLancamentos(true);
end;

procedure TdtmLancamentoContas.qryLancamentosAfterPost(DataSet: TDataSet);
begin
  inherited;
  AtualizarListaContaContabil;
  if not LancamentoAlterado then
   LancamentoAlterado := true;
end;

procedure TdtmLancamentoContas.qryLancamentosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  AtualizarListaContaContabil;
  if not LancamentoAlterado then
   LancamentoAlterado := true;
end;

procedure TdtmLancamentoContas.LigarDesligarEventosLancamentos(
  Ligar: Boolean);
begin
  if not Ligar then
  begin
    qrylancamentos.AfterScroll := nil;
    qrylancamentos.AfterDelete := nil;
    qrylancamentos.AfterOpen := nil;
    qryLancamentos.AfterPost := nil;
    qryLancamentos.Beforeclose := nil;
    qrylancamentos.OnNewRecord := nil;
    dsrLancamentos.OnDataChange := nil;
  end
  else
  begin
    qrylancamentos.AfterScroll := qryLancamentosAfterScroll;
    qrylancamentos.AfterDelete := qryLancamentosAfterDelete;
    qrylancamentos.AfterOpen   := qryLancamentosAfterOpen;
    qryLancamentos.AfterPost := qryLancamentosAfterPost;
    qrylancamentos.Beforeclose := qryLancamentosBeforeclose;
    qrylancamentos.OnNewRecord := qryLancamentosNewRecord;
    dsrLancamentos.OnDataChange := dsrLancamentosDataChange;
  end;

end;

procedure TdtmLancamentoContas.qryLancamentosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  case operacaoLancamento of
    tlcLOTES,
    tlcLOTESEXTERNO : qryLancamentosLotes.Locate('nrlancto',qryLancamentosnrlancto.AsInteger,[]);
  end;
end;

procedure TdtmLancamentoContas.AtribuirParametrosDebito;
begin
//  qryProcuraDebitar.Params[1].AsInteger := qryLancamentoscreditar.AsInteger;
  if qryLancamentosdata.AsString <> '' then
    qryProcuraDebitar.MacroByName('inativo').AsString := 'and ((inativo is null) or (inativo > ''' + qryLancamentosdata.AsString + '''))'
  else
    qryProcuraDebitar.MacroByName('inativo').AsString := 'and inativo is null';

  case OperacaoLancamento of
    tlcINSERIREXTERNO,
    tlcEDITAREXTERNO,
    tlcLOTESEXTERNO:
    begin
      if qrylancamentos.state = dsedit then
          qryProcuraDebitar.MacroByName('SQLListaContaContabil').AsString :=
             format(SQLListaContaContabil,[inttostr(qrylancamentosdebitar.asinteger), ListaContasContabeis])
      else
      if (qrylancamentosdebitar.oldvalue = null) then
        qryProcuraDebitar.MacroByName('SQLListaContaContabil').AsString :=
            format(SQLListaContaContabil,['0',ListaContasContabeis])
      else
        if qrylancamentosdebitar.oldvalue <> qrylancamentosdebitar.asinteger then
          qryProcuraDebitar.MacroByName('SQLListaContaContabil').AsString :=
             format(SQLListaContaContabil,[inttostr(qrylancamentosdebitar.asinteger), ListaContasContabeis])
        else
            qryProcuraDebitar.MacroByName('SQLListaContaContabil').AsString :=
               format(SQLListaContaContabil,[qrylancamentosdebitar.oldvalue, ListaContasContabeis]);
    end;
  end;
end;

procedure TdtmLancamentoContas.AtribuirParametrosCredito;
begin
//  qryProcuraCreditar.Params[1].AsInteger := qryLancamentosdebitar.AsInteger;
  if qryLancamentosdata.AsString <> '' then
    qryProcuraCreditar.MacroByName('inativo').AsString := 'and ((inativo is null) or (inativo > ''' + qryLancamentosdata.AsString + '''))'
  else
    qryProcuraCreditar.MacroByName('inativo').AsString := 'and inativo is null';

  case OperacaoLancamento of
    tlcINSERIREXTERNO,
    tlcEDITAREXTERNO,
    tlcLOTESEXTERNO:
    begin
      if qrylancamentos.state = dsedit then
          qryProcuraCreditar.MacroByName('SQLListaContaContabil').AsString :=
             format(SQLListaContaContabil,[inttostr(qrylancamentoscreditar.asinteger), ListaContasContabeis])
      else
      if qrylancamentoscreditar.oldvalue = null then
        qryProcuraCreditar.MacroByName('SQLListaContaContabil').AsString :=
            format(SQLListaContaContabil,['0',ListaContasContabeis])
      else
        if qrylancamentoscreditar.oldvalue <> qrylancamentoscreditar.asinteger then
          qryProcuraCreditar.MacroByName('SQLListaContaContabil').AsString :=
             format(SQLListaContaContabil,[inttostr(qrylancamentoscreditar.asinteger), ListaContasContabeis])
        else
          qryProcuraCreditar.MacroByName('SQLListaContaContabil').AsString :=
             format(SQLListaContaContabil,[qrylancamentoscreditar.oldvalue, ListaContasContabeis]);
    end;
  end;
end;

procedure TdtmLancamentoContas.qryProcuraDebitarBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametrosDebito;
end;

procedure TdtmLancamentoContas.qryProcuraCreditarBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametrosCredito;
end;

procedure TdtmLancamentoContas.GravarLancamentosExternos;
var
  i:integer;
begin
  dtmLancamentoContabilidade.GravarLancamento := LancamentoAlterado;
  if LancamentoAlterado then
  begin
    if origemformulario='E' then
    begin
      dtmLancamentoContabilidade.qryLancamentosNotasEntradas.First;
      while not dtmLancamentoContabilidade.qryLancamentosNotasEntradas.Eof do
        dtmLancamentoContabilidade.qryLancamentosNotasEntradas.Delete;
      dtmLancamentoContabilidade.fproximonrLancto := FProximoNrLancto;
      LigarDesligarEventosLancamentos(false);
      CancelarLancamentos;
      qrylancamentos.DisableControls;
      qryLancamentos.First;
      while not qryLancamentos.Eof do
      begin
        dtmLancamentoContabilidade.qryLancamentosNotasEntradas.Append;
        for i:= 0 to qryLancamentos.fieldcount-2 do
        begin
          if qryLancamentos.Fields[i].isnull then
            dtmLancamentoContabilidade.qryLancamentosNotasEntradas.FieldByName(qryLancamentos.Fields[i].FieldName).clear
          else
          begin
            case qryLancamentos.Fields[i].DataType of
              ftBoolean : dtmLancamentoContabilidade.qryLancamentosNotasEntradas.FieldByName(qryLancamentos.Fields[i].FieldName).AsBoolean := qryLancamentos.Fields[i].AsBoolean;
              ftinteger,
              ftlargeint,
              ftstring : dtmLancamentoContabilidade.qryLancamentosNotasEntradas.FieldByName(qryLancamentos.Fields[i].FieldName).asstring :=  qryLancamentos.Fields[i].asstring;
              ftcurrency : dtmLancamentoContabilidade.qryLancamentosNotasEntradas.FieldByName(qryLancamentos.Fields[i].FieldName).AsCurrency :=  qryLancamentos.Fields[i].AsCurrency;
            else
              dtmLancamentoContabilidade.qryLancamentosNotasEntradas.FieldByName(qryLancamentos.Fields[i].FieldName).Value :=  qryLancamentos.Fields[i].Value;
            end;  
          end;
        end;
        dtmLancamentoContabilidade.qryLancamentosNotasEntradas.Post;
        qryLancamentos.Next;
      end
    end
    else
    if (origemformulario = 'D') or
       (origemformulario = 'G') or
       (origemformulario = 'V') or
       (origemformulario = 'H') then
    begin
      dtmLancamentoContabilidade.qryLancamentosDocumentos.First;
      while not dtmLancamentoContabilidade.qryLancamentosDocumentos.Eof do
        dtmLancamentoContabilidade.qryLancamentosDocumentos.Delete;
      LigarDesligarEventosLancamentos(false);
      CancelarLancamentos;
      qrylancamentos.DisableControls;
      qryLancamentos.First;
      while not qryLancamentos.Eof do
      begin
        dtmLancamentoContabilidade.qryLancamentosDocumentos.Append;
        for i:= 0 to qryLancamentos.fieldcount-2 do
        begin
          if qrylancamentos.fieldbyname(qryLancamentos.Fields[i].FieldName).isnull then
            dtmLancamentoContabilidade.qryLancamentosDocumentos.FieldByName(qryLancamentos.Fields[i].fieldname).clear
          else
          begin
            case qryLancamentos.Fields[i].DataType of
              ftBoolean : dtmLancamentoContabilidade.qryLancamentosDocumentos.FieldByName(qryLancamentos.Fields[i].FieldName).AsBoolean := qryLancamentos.Fields[i].AsBoolean;
              ftinteger,
              ftlargeint,
              ftstring : dtmLancamentoContabilidade.qryLancamentosDocumentos.FieldByName(qryLancamentos.Fields[i].FieldName).AsString := qryLancamentos.Fields[i].AsString;
              ftCurrency : dtmLancamentoContabilidade.qryLancamentosDocumentos.FieldByName(qryLancamentos.Fields[i].FieldName).AsCurrency := qryLancamentos.Fields[i].AsCurrency;
            else
               dtmLancamentoContabilidade.qryLancamentosDocumentos.FieldByName(qryLancamentos.Fields[i].FieldName).Value := qryLancamentos.Fields[i].Value;
            end;   
          end;
        end;
        dtmLancamentoContabilidade.qryLancamentosDocumentos.Post;
        qryLancamentos.Next;
      end
    end
    else
    if origemformulario='S' then
    begin
      dtmLancamentoContabilidade.qryLancamentosNotasSaidas.First;
      while not dtmLancamentoContabilidade.qryLancamentosNotasSaidas.Eof do
        dtmLancamentoContabilidade.qryLancamentosNotasSaidas.Delete;
      dtmLancamentoContabilidade.fproximonrLancto := FProximoNrLancto;
      LigarDesligarEventosLancamentos(false);
      CancelarLancamentos;
      qrylancamentos.DisableControls;
      qryLancamentos.First;
      while not qryLancamentos.Eof do
      begin
        dtmLancamentoContabilidade.qryLancamentosNotasSaidas.Append;
        for i:= 0 to qryLancamentos.fieldcount-2 do
        begin
          if qrylancamentos.fieldbyname(qryLancamentos.Fields[i].FieldName).isnull then
            dtmLancamentoContabilidade.qryLancamentosNotasSaidas.FieldByName(qryLancamentos.Fields[i].FieldName).clear
          else
          begin
            case qryLancamentos.Fields[i].DataType of
              ftBoolean : dtmLancamentoContabilidade.qryLancamentosNotasSaidas.FieldByName(qryLancamentos.Fields[i].FieldName).AsBoolean := qryLancamentos.Fields[i].AsBoolean;
              ftinteger,
              ftlargeint,
              ftstring : dtmLancamentoContabilidade.qryLancamentosNotasSaidas.FieldByName(qryLancamentos.Fields[i].FieldName).asstring := qryLancamentos.Fields[i].asstring;
              ftcurrency : dtmLancamentoContabilidade.qryLancamentosNotasSaidas.FieldByName(qryLancamentos.Fields[i].FieldName).ascurrency := qryLancamentos.Fields[i].ascurrency;
            else
               dtmLancamentoContabilidade.qryLancamentosNotasSaidas.FieldByName(qryLancamentos.Fields[i].FieldName).Value := qryLancamentos.Fields[i].Value;
            end   
          end
        end;
        dtmLancamentoContabilidade.qryLancamentosNotasSaidas.Post;
        qryLancamentos.Next;
      end
    end;
    qrylancamentos.EnableControls;
    LigarDesligarEventosLancamentos(true);
  end;

end;

function TdtmLancamentoContas.getListaContasContabeis: String;
begin
  if FListaContasContabeis='' then
    Result := '0'
  else
    Result := FListaContasContabeis;
end;

procedure TdtmLancamentoContas.AtualizarListaContaContabil(EntranaLista: String;
TipoLancto: TtecTipoLancamento);
begin
  case TipoLancto of
  tlDEBITO : begin
               if DebitoAnterior<>'' then
                 if DebitoAnterior<>qryLancamentoscreditar.AsString then
                   Delete(FListaContasContabeis,
                         pos(quotedstr(DebitoAnterior),FListaContasContabeis), length(quotedstr(DebitoAnterior))+1);

               if copy(FListaContasContabeis,length(FListaContasContabeis),1)=',' then
                 delete(FListaContasContabeis,length(FListaContasContabeis),1);

               if EntranaLista<>'' then
                 if pos(quotedstr(EntranaLista),FListaContasContabeis)=0 then
                   if FListaContasContabeis='' then
                     FListaContasContabeis := quotedstr(EntranaLista)
                   else
                     FListaContasContabeis := FListaContasContabeis+','+quotedstr(EntranaLista);
             end;
  tlCREDITO: begin
               if CreditoAnterior<>'' then
                 if CreditoAnterior<>qryLancamentosdebitar.AsString then
                   Delete(FListaContasContabeis,
                         pos(quotedstr(CreditoAnterior),FListaContasContabeis), length(quotedstr(CreditoAnterior))+1);

               if copy(FListaContasContabeis,length(FListaContasContabeis),1)=',' then
                 delete(FListaContasContabeis,length(FListaContasContabeis),1);

               if EntranaLista<>'' then
                 if pos(quotedstr(EntranaLista),FListaContasContabeis)=0 then
                   if FListaContasContabeis='' then
                     FListaContasContabeis := quotedstr(EntranaLista)
                   else
                     FListaContasContabeis := FListaContasContabeis+','+quotedstr(EntranaLista);
             end;
  end;
end;

procedure TdtmLancamentoContas.AbrirLoteLancamentos;
begin
  case OperacaoLancamento of
  tlcLOTES :
    begin
      fProximoNrLancto := 0;
      LoteAlterado := false;
      if not qrylancamentos.IsEmpty then
      begin
        refazconsulta(qryLancamentosLotes,[0,1,2,3,4],
        [qryLancamentosorigem.AsVariant,
         qryLancamentosnrorigem.AsLargeInt,
         qryLancamentosnrlancto.Asinteger,
         qryLancamentosfilial.AsVariant,
         qryLancamentosexercicio.AsVariant]);
         qryLancamentosAfterScroll(qrylancamentos);
      end
      else
        refazconsulta(qryLancamentosLotes,[0,1,2,3,4],
        ['L',0,0,FilialLancamento,exerciciolancamento]);

      qrylancamentoslotes.ReadOnly := not ((qryLancamentosorigem.AsString='M') or
                                           (qryLancamentosorigem.AsString='L') or
                                           (qryLancamentosorigem.AsString='I') or
                                           (qryLancamentosorigem.AsString=''));
      NrLanctoOriginal := qryLancamentosnrlancto.Asinteger;
      NrLote := qryLancamentosnrorigem.AsLargeInt;
      LigarLancamentosemLote;
      if (qryLancamentosorigem.AsString='M') or
         (qryLancamentosorigem.AsString='') then
       AbrirTotaisLotes;
    end;
  tlcINSERIREXTERNO,
  tlcEDITAREXTERNO,
  tlcLOTESEXTERNO:
    begin
      if not qrylancamentoslotes.Active then
      begin
        refazconsulta(qryLancamentosLotes,[0,1,2,3,4],
         [origemformulario,0,0,FilialLancamento,exerciciolancamento]);
        ReFazConsulta(qrytotais,[0,1,2,3,4],[origem,0,0,0,0]);
        AtualizarLancamentosLotesSimples;
        LoteAlterado := false;
      end;
      if not qrylancamentos.IsEmpty then
        qryLancamentosAfterScroll(qrylancamentos);
      qrylancamentoslotes.ReadOnly := false;
      NrLanctoOriginal := qryLancamentosnrlancto.Asinteger;
      NrLote := qryLancamentosnrorigem.AsLargeInt;
    end;
  end;
end;

procedure TdtmLancamentoContas.LigarLancamentosemLote;
const
  SQL = ' or ((   (origem = %s and nrorigem = %s)'+
        '     or (nrlancto = %s and filial = %s)) and exercicio = %s)';
begin
  qrylancamentos.MacroByName('LancamentosPorLote').AsString :=
    format(SQL, [quotedstr(qryLancamentosLotes.params[0].Value),
                 ifthen(qryLancamentosLotes.params[1].asstring<>'',qryLancamentosLotes.params[1].asstring,'0'),
                 inttostr(qryLancamentosLotes.params[2].asinteger),
                 qryLancamentosLotes.params[3].Value,
                 qryLancamentosLotes.params[4].Value]);
  qrylancamentos.MacroByName('Ordenacao').AsString := 'order by nrlancto';
  LigarDesligarEventosLancamentos(false);
  ReFazConsulta(qryLancamentos,[0,1,3],[1,0,0]);
  if Assigned(FLancamentosAfterOpen) then
    FLancamentosAfterOpen(qryLancamentos);
  LigarDesligarEventosLancamentos(true);
end;

procedure TdtmLancamentoContas.DesligarLancamentosemLote;
begin
  qrylancamentos.MacroByName('LancamentosPorLote').AsString := '';
  NrLanctoAtual := qryLancamentosLotesnrlancto.asinteger;
end;

procedure TdtmLancamentoContas.AtualizarLancamentosLotesSimples;
var
    TotalDebito, TotalCredito : Currency;
    DataInicial, DataFinal : TDateTime;

 procedure Gravar(Tipo: TipoLancamento);
 begin
    qryLancamentosLotes.Append;
    qryLancamentosLotesexercicio.AsInteger := qryLancamentosexercicio.AsInteger;
    qryLancamentosLotesnrlancto.AsInteger  := qrylancamentosnrlancto.AsInteger;
    qryLancamentosLotesfilial.AsInteger    := qryLancamentosfilial.AsInteger;
    qryLancamentosLotesdata.AsDateTime     := qrylancamentosdata.AsDateTime;
    qryLancamentosLotesorigem.AsString     := 'L';
    qryLancamentosLotesnrorigem.AsLargeInt  := qryLancamentosnrorigem.AsLargeInt;
    case tipo of
      DEBITO : begin
                 qryLancamentosLotescontacontabil.AsInteger := qrylancamentosdebitar.AsInteger;
                 qryLancamentosLotesdebitar.AsInteger       := qrylancamentosdebitar.AsInteger;
                 qryLancamentosLotesvalordebito.AsCurrency  := qrylancamentosvalor.AsCurrency;
                 qryLancamentosLotesvalor.Ascurrency        := qryLancamentosvalor.AsCurrency;
                 ReFazConsulta(qryProcuraDebitar,[0,1],[qrylancamentosdebitar.AsInteger,0]);
                 qryLancamentosLotesdescricaocontacontabil.AsString := qryProcuraDebitardescricao.AsString;
                 qryLancamentosLotesclassificacaocontacontabil.AsString := qryProcuraDebitarclassificacao.asString;
                 totaldebito := totaldebito + qryLancamentosLotesvalor.Ascurrency;
               end;
      CREDITO: begin
                 qryLancamentosLotescontacontabil.AsInteger := qrylancamentoscreditar.AsInteger;
                 qryLancamentosLotescreditar.AsInteger      := qrylancamentoscreditar.AsInteger;
                 qryLancamentosLotesvalorcredito.AsCurrency := qrylancamentosValor.AsCurrency;
                 qryLancamentosLotesvalor.Ascurrency        := qrylancamentosValor.AsCurrency;
                 ReFazConsulta(qryProcuraCreditar,[0,1],[qryLancamentoscreditar.AsInteger,0]);
                 qryLancamentosLotesdescricaocontacontabil.AsString := qryProcuraCreditardescricao.AsString;
                 qryLancamentosLotesclassificacaocontacontabil.AsString := qryProcuraCreditarclassificacao.asString;
                 TotalCredito := TotalCredito + qryLancamentosLotesvalor.Ascurrency;
               end;
    end;
    qryLancamentosLoteshistorico.asvariant := qryLancamentoshistorico.asvariant;
    qryLancamentosLotescomplemento.AsString := qryLancamentoscomplemento.AsString;
    qryLancamentosLotes.Post;
 end;

begin
  LoteAlterado := true;
  TotalDebito := 0;
  totalcredito := 0;
  DataInicial := DataLocal;
  DataFinal := DataLocal;

  qryLancamentosLotes.DisableControls;
  qryLancamentosLotes.First;
  while not qryLancamentosLotes.Eof do
    qryLancamentosLotes.Delete;

  qryTotais.Edit;
  qryTotaistotaldebito.clear;
  qryTotaistotalcredito.clear;
  qryTotaisdatainicial.Clear;
  qryTotaisdatafinal.Clear;
  qrytotais.Post;

  GuardarRegistroAtual(qryLancamentos, true);
  qrylancamentos.First;
  while not qrylancamentos.Eof do
  begin
    if not qryLancamentosdebitar.IsNull then
      Gravar(debito);
    if not qrylancamentoscreditar.IsNull then
      Gravar(credito);
    if qryLancamentosdata.AsDateTime < DataInicial then
      DataInicial := qryLancamentosdata.AsDateTime;
    if qryLancamentosdata.AsDateTime > DataFinal then
      DataFinal := qryLancamentosdata.AsDateTime;
    qrylancamentos.Next;
  end;

  qryTotais.Edit;
  qryTotaistotaldebito.AsCurrency := TotalDebito;
  qryTotaistotalcredito.AsCurrency := TotalCredito;
  qryTotaisdatainicial.AsDateTime := DataInicial;
  qryTotaisdatafinal.AsDateTime := DataFinal;
  qrytotais.Post;

  VoltarRegistroAtual(qryLancamentos);
  qryLancamentosLotes.enableControls;
end;

function TdtmLancamentoContas.GravarLancamentosLotes: Boolean;
begin
  result := false;
  if ValidarTotaisDiariosLotes then
  begin
    LigarDesligarEventosLancamentos(false);
    GuardarRegistroAtual(qrylancamentos,true);
    try

      qryBloquearLancamentos.Open;

      if (NrLote=0) then
      begin
        spcLotesProximo.ParamByName('Exercicio').AsInteger:= Exerciciolancamento;
        spcLotesProximo.ParamByName('Filial').AsInteger:= FilialLancamento;
        spcLotesProximo.Open;
        NrLote := spcLotesProximocodigo.AsInteger;
        spcLotesProximo.Close;
      end;

      fProximoNrLancto := 0;
      qrylancamentos.first;
      while not qrylancamentos.Eof do
      begin
        qrylancamentos.Edit;
        if qrylancamentos.RecordCount > 1 then
        begin
          qryLancamentosnrorigem.AsLargeInt := NrLote;
          qryLancamentosnrorigemlote.AsInteger := NrLote;
          qrylancamentosorigem.asstring := 'L';
        end
        else
        begin
          qryLancamentosnrorigem.clear;
          qryLancamentosnrorigemlote.clear;
          qrylancamentosorigem.asstring := 'M';
        end;

        if qryLancamentosnumerocriado.AsBoolean then
          qryLancamentosnrlancto.AsInteger := ProximoNrLancto;

        qrylancamentos.Post;
        qrylancamentos.Next;
      end;
      VoltarRegistroAtual(qrylancamentos);
      LigarDesligarEventosLancamentos(true);
      result := Perpetrar([qryLancamentos]);
      if result then
         LoteAlterado := false;
    finally
      qryBloquearLancamentos.Close;
    end;
  end;
end;

function TdtmLancamentoContas.GetProximoNrLancto: integer;
begin
  if FProximoNrLancto=0 then
  begin
    spcLancamentosProximo.ParamByName('Exercicio').AsInteger:= ExercicioLancamento;
    spcLancamentosProximo.ParamByName('Filial').AsInteger:= FilialLancamento;
    spcLancamentosProximo.Open;
    FProximoNrLancto := spcLancamentosProximocodigo.AsInteger;
    spcLancamentosProximo.Close;
  end
  else
   FProximoNrLancto := FProximoNrLancto + 1;
  Result := FProximoNrLancto;
end;

procedure TdtmLancamentoContas.SetProximoNrLancto(const Value: integer);
begin
  FProximoNrLancto := value;
end;

procedure TdtmLancamentoContas.AbrirTotaisLotes;
begin
  case OperacaoLancamento of
    tlcLOTES, tlcMANUAL:  ReFazConsulta(qrytotais,[0,1,2,3,4],
                         [qryLancamentosorigem.AsVariant,
                         qryLancamentosnrorigem.AsLargeInt,
                         qryLancamentosnrlancto.Asinteger,
                         qryLancamentosfilial.AsVariant,
                         qryLancamentosexercicio.AsVariant]);
  end;
end;

procedure TdtmLancamentoContas.qryLancamentosAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FLancamentosAfterOpen) then
    FLancamentosAfterOpen(DataSet);

end;

procedure TdtmLancamentoContas.GuardarValoresInclusao;
begin
  DataNovaInclusao     := qryLancamentosdata.AsDateTime;
  DebitarNovaInclusao  := qryLancamentosdebitar.AsInteger;
  CreditarNovaInclusao := qryLancamentoscreditar.AsInteger;
  HistoricoNovaInclusao:= qryLancamentoshistorico.AsInteger;
end;

procedure TdtmLancamentoContas.AtribuirValoresInclusao;
begin
  qryLancamentosdata.AsDateTime := DataNovaInclusao;
  if DebitarNovaInclusao<>0 then
    qryLancamentosdebitar.AsInteger := DebitarNovaInclusao;
  if CreditarNovaInclusao<>0 then
    qryLancamentoscreditar.AsInteger := CreditarNovaInclusao;
  if HistoricoNovaInclusao<>0 then
    qryLancamentoshistorico.AsInteger := HistoricoNovaInclusao;
end;

function TdtmLancamentoContas.ValidarTotaisDiariosLotes: Boolean;

var
  Lotes: array of record
    Data: TDateTime;
    TotalDebito,
    TotalCredito: Currency;
  end;
  Pos, Qtdadedatas, a : Integer;

  function ProcuraData(Data: TDateTime): Integer;
  var
    a: integer;
  begin
    Result := -1;
    for a := 0 to Length(Lotes) - 1 do
      if Lotes[a].Data = Data then begin
        Result := a;
        break;
      end
  end;

begin
  result := true;
  Qtdadedatas := 0;
  GuardarRegistroAtual(qryLancamentosLotes, true);
  qryLancamentosLotes.First;
  while not qrylancamentoslotes.Eof do
  begin
    Pos := ProcuraData(qryLancamentosLotesdata.AsDateTime);
    if Pos = -1 then begin
      Pos := Qtdadedatas;
      Inc(Qtdadedatas);
      SetLength(Lotes, Qtdadedatas);
      lotes[Pos].Data := qryLancamentosLotesdata.AsDateTime;
      lotes[pos].TotalDebito := qryLancamentosLotesvalordebito.AsCurrency;
      lotes[pos].TotalCredito := qryLancamentosLotesvalorcredito.AsCurrency;
    end
    else
    begin
      lotes[pos].TotalDebito := lotes[pos].TotalDebito + qryLancamentosLotesvalordebito.AsCurrency;
      lotes[pos].TotalCredito := lotes[pos].TotalCredito + qryLancamentosLotesvalorcredito.AsCurrency;
    end;
    qryLancamentosLotes.Next;
  end;
  VoltarRegistroAtual(qryLancamentosLotes);

  for a := 0 to Length(Lotes) - 1 do
    if Lotes[a].TotalDebito <> lotes[a].TotalCredito then
    begin
      result := false;
      MensagemAviso(format(ctDIFERENCATOTALDEBITOCREDITOVALORDATA,[
            FormatarValor(Lotes[a].TotalDebito - lotes[a].TotalCredito, 2),
            DateTimeToStr(lotes[a].Data)]));
      break;
    end
end;

procedure TdtmLancamentoContas.SetDataFinalAlteracao(const Value: String);
begin
  FDataFinalAlteracao := Value;
  qryConsultaLancamentos.MacroByName('dataalteracao').Value := MontarIntervaloData('l.alteracao',FDataInicialAlteracao,FDataFinalAlteracao);
end;

procedure TdtmLancamentoContas.SetDataInicialAlteracao(
  const Value: String);
begin
  FDataInicialAlteracao := Value;
  qryConsultaLancamentos.MacroByName('dataalteracao').Value := MontarIntervaloData('l.alteracao',FDataInicialAlteracao,FDataFinalAlteracao);
end;

procedure TdtmLancamentoContas.qryLancamentosCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qrylancamentos.State = dsinsert then
    qryLancamentosdescricaoorigemstatus.AsString := 'INCLUINDO '+qryLancamentosdescricaoorigem.AsString
  else
  if qrylancamentos.State = dsedit then
    qryLancamentosdescricaoorigemstatus.AsString := 'EDITANDO '+qryLancamentosdescricaoorigem.AsString
  else
    qryLancamentosdescricaoorigemstatus.AsString := qryLancamentosdescricaoorigem.AsString;
end;

function TdtmLancamentoContas.ExcluirLotes: Boolean;
begin
  Result:= False;
  if (not qryLancamentos.IsEmpty) and
     ((qryLancamentosorigem.AsString = 'M') or
      (qryLancamentosorigem.AsString = 'L') or
      (qryLancamentosorigem.AsString = 'I') or
      (OperacaoLancamento in [tlcINSERIREXTERNO, tlcEDITAREXTERNO, tlcLOTESEXTERNO])
     )
     then
  begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o Lote'])) = smbok then
    begin
      qryLancamentos.First;
      while not qrylancamentos.Eof do
        qryLancamentos.Delete;
      AtualizarLancamentosLotesSimples;
      Result:= True;
    end
  end;
end;

procedure TdtmLancamentoContas.qryConsultaLancamentosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaLancamentos.Params[0].AsInteger := ExercicioLancamento;
end;

end.
