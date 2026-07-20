unit dmconciliacaobancaria;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, dmtecsoft, biblio, Forms, ZTransact, {Qete,} Variants, clparametrossistema;

type
   TdtmConciliacaoBancaria = class(TdtmBasico)
      qryMovtosBancos: TtecQuery;
      dsrMovtosBancos: TtecDataSource;

      qryConsultaMovtosBancos: TtecQuery;

      qryConsultaContas: TtecQuery;
      qryConsultaContasBanco: TIntegerField;
      qryConsultaContasAgencia: TIntegerField;
      qryConsultaContasConta: TIntegerField;
      qryConsultaContasDigito: TStringField;
      qryConsultaContasTitular: TStringField;
      qryConsultaContasSigla: TStringField;
      qryConsultaContasNome: TStringField;
      qryConsultaContasSaldoLancado: TFloatField;

      qryProcuraContas: TtecQuery;
      qryProcuraContasBanco: TIntegerField;
      qryProcuraContasAgencia: TIntegerField;
      qryProcuraContasConta: TIntegerField;
      qryProcuraContasDigito: TStringField;
      qryProcuraContasTitular: TStringField;
      qryProcuraContasSigla: TStringField;
      qryProcuraContasNome: TStringField;
      qryProcuraContasSaldoLancado: TFloatField;
      dsrProcuraContas: TtecDataSource;

      qryLanctoAnterior: TtecQuery;
      dsrLanctoAnterior: TtecDataSource;
      qryLanctoAnteriorData: TDateField;
      qryLanctoAnteriorSaldo: TFloatField;

      qryUltimoLancto: TtecQuery;
      dsrUltimoLancto: TtecDataSource;
      qryUltimoLanctoData: TDateField;

      qryConsultaMovtosBancosConta: TIntegerField;
      qryConsultaMovtosBancosData: TDateField;
      qryConsultaMovtosBancosSequencia: TIntegerField;
      qryConsultaMovtosBancosValor: TFloatField;
      qryConsultaMovtosBancosDocumento: TStringField;
      qryConsultaMovtosBancosEvento: TIntegerField;
      qryMovtosBancosCompensacao: TDateField;
      qryMovtosBancosDocumento: TStringField;
      qryMovtosBancosObservacoes: TStringField;
      qryMovtosBancosEveDescricao: TStringField;
      qryMovtosBancosValor: TFloatField;
      qryMovtosBancosTipo: TStringField;
      qryMovtosBancosSaldo: TFloatField;
      qryMovtosBancosSeqCompensacao: TIntegerField;
    qryMovtosBancosData: TDateField;
    qryMovtosBancosSequencia: TIntegerField;
    qryMovtosBancosOrigem: TStringField;
    qryMovtosBancosSelecionado: TBooleanField;
    qryMovtosBancosEventos: TtecQuery;
    qryMovtosBancosEventosconta: TIntegerField;
    qryMovtosBancosEventosdata: TDateField;
    qryMovtosBancosEventossequencia: TIntegerField;
    qryMovtosBancosEventosevento: TIntegerField;
    qryMovtosBancosEventostipo: TStringField;
    qryMovtosBancosEventosdescricaoevento: TStringField;
    qryMovtosBancosEventoscontatransf: TIntegerField;
    qryMovtosBancosEventossigla: TStringField;
    qryMovtosBancosEventosnomeagencia: TStringField;
    qryMovtosBancosEventosvalor: TFloatField;
    qryMovtosBancosEventosdigito: TStringField;
    qryMovtosBancosEventosobservacoes: TStringField;
    dsrMovtosBancosEventos: TtecDataSource;
    qryMovtosBancosconta: TIntegerField;

      procedure qryMovtosBancosAfterPost(DataSet: TDataSet);
      procedure qryProcuraContasAfterScroll(DataSet: TDataSet);
    procedure qryMovtosBancosNewRecord(DataSet: TDataSet);
    procedure qryMovtosBancosBeforeOpen(DataSet: TDataSet);
    procedure qryMovtosBancosAfterScroll(DataSet: TDataSet);
    procedure qryMovtosBancosAfterInsert(DataSet: TDataSet);

  private
    FDataInicial: String;
    FDataFinal: String;
    FOnExibirSaldo: TNotifyEvent;
    FOrdenarporDocumento: Boolean;
    FOrdenarporValor: Boolean;
    function GetTabelaMovtosBancos:   TZDataset;
    function GetTabelaConsultaContas: TZDataset;
    function GetTabelaConsultaMovtos: TZDataset;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
    procedure SetOrdenarporDocumento(const Value: Boolean);
    procedure SetOrdenarporValor(const Value: Boolean);
    { Private declarations }


  public
    { Public declarations }
    Ajustar: Boolean;
    ExibindoEventos : Boolean;
    constructor Create(AOwner:     TComponent); override;
    property TabelaConsultaContas: TZDataset read GetTabelaConsultaContas;
    property TabelaConsultaMovtos:  TZDataset read GetTabelaConsultaMovtos;
    property TabelaMovtosBancos:   TZDataset read GetTabelaMovtosBancos;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal:   String read FDataFinal   write SetDataFinal;
    property OnExibirSaldo: TNotifyEvent read FOnExibirSaldo write FOnExibirSaldo;
    procedure SelecionarMovtosGrid(Marcar, Todos:Boolean);
    procedure SelecionarTodosMovtos(Marcar: Boolean);
    procedure SelecionarSempreMovtosGrid(DS: TDataSet; Marcar: Boolean);
    procedure AbrirTabelas(TipoPesquisa: TtecConciliacao);
    function  ContaEstaDefinida:    Boolean;
    function  ExcluirMovtosBancos:  Boolean;
    function  ExisteConta(campo, codigo: string): boolean;
    function  ExisteMovto(campo, codigo: string): boolean;
    procedure FecharTabelas(TipoPesquisa: TtecConciliacao);
    function  GravarMovtosBancos:   Boolean;
    function  IncluirMovtosBancos:  Boolean;
    function  Inserindo:            Boolean;
    function  Selecionados       :  Integer;
    procedure Selecionar(TipoPesquisa: TtecConciliacao);
    function  SelecionarMovtosBancos: Boolean;
    function  UltimaDataLancamento: Boolean;
    function  AcessarSaldoAnterior: Boolean;
    property OrdenarporDocumento: Boolean read FOrdenarporDocumento write SetOrdenarporDocumento;
    property OrdenarporValor: Boolean     read FOrdenarporValor     write SetOrdenarporValor;
    procedure MensagemForaIntervalo;
  end;

var
  dtmConciliacaoBancaria: TdtmConciliacaoBancaria;

implementation

{$R *.dfm}

procedure TdtmConciliacaoBancaria.AbrirTabelas(TipoPesquisa: TtecConciliacao);
begin
   Case TipoPesquisa of
      ccbCONTAS:  Abre(ctConsultaContas);
      ccbMOVTOS:  RefazConsulta(qryConsultaMovtosBancos, [0],
                               [qryProcuraContasConta.AsVariant]);
  end;

end;

constructor TdtmConciliacaoBancaria.Create(AOwner: TComponent);
begin
   inherited;
   OrdenarporDocumento := True;
   qryProcuraContas.       Tag:= ctTabelas;
//   qryMovtosBancos.        Tag:= ctTabelas;
   qryConsultaContas.      Tag:= ctConsultaContas;
   qryConsultaMovtosBancos.Tag:= ctConsultaMovtosBancos;
end;

procedure TdtmConciliacaoBancaria.FecharTabelas(TipoPesquisa: TtecConciliacao);
begin
   Case TipoPesquisa of
      ccbCONTAS:  Fecha(ctConsultaContas);
      ccbMOVTOS:  Fecha(ctConsultaMovtosBancos);
   end;
end;

function TdtmConciliacaoBancaria.GetTabelaMovtosBancos: TZDataset;
begin
   result:= qryMovtosBancos;
end;

procedure TdtmConciliacaoBancaria.Selecionar(TipoPesquisa: TtecConciliacao);
begin
   case TipoPesquisa of
      ccbCONTAS:  begin
                     RefazConsulta(qryProcuraContas, [0],
                                  [qryConsultaContasConta.AsVariant]);

                  end;
  end;

end;


function TdtmConciliacaoBancaria.ExisteConta(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaContas, campo, codigo);
end;

function TdtmConciliacaoBancaria.GetTabelaConsultaContas: TZDataset;
begin
   result:= qryConsultaContas;
end;


function TdtmConciliacaoBancaria.IncluirMovtosBancos: Boolean;
begin
   qryMovtosBancos.Insert;
   Result:= True;
end;


function TdtmConciliacaoBancaria.ExcluirMovtosBancos: Boolean;
begin
   Result:= False;
   if not qryMovtosBancos.IsEmpty then begin
      if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o lançamento'])) = smbok then begin
         qryMovtosBancos.Delete;
         Perpetrar([qryMovtosBancos]);

         RefazConsulta(qryProcuraContas, [0],                    {Exibir novo saldo}
                      [qryProcuraContasConta.AsVariant]);
                                                                          {Exibir o último lançto}
         Result:= True;
      end
   end;
end;

function TdtmConciliacaoBancaria.GravarMovtosBancos: Boolean;
var Data:    TDateTime;
    Posicao: Integer;
begin
   if (qryMovtosBancosCompensacao.AsDateTime >= ParSistema.BancoDataInicial) and
      (qryMovtosBancosCompensacao.AsDateTime <= ParSistema.BancoDataFinal)   then
   begin
     if qryMovtosBancos.CheckRequiredFields then
     begin
        if qryMovtosBancos.State in [dsEdit] then qryMovtosBancos.Post;
        if qryMovtosBancosCompensacao.OldValue <> qryMovtosBancosCompensacao.AsDateTime
        then qryMovtosBancos.Next;
        Data   := qryMovtosBancosCompensacao.AsDateTime;
        Posicao:= qryMovtosBancosSeqCompensacao.AsInteger;
        Perpetrar([qryMovtosBancos]);
        Result:= SelecionarMovtosBancos;
        qryMovtosBancos.Locate('Compensacao, SeqCompensacao', VarArrayOf([Data, Posicao]), [])
     end
     else Result:= False;
   end
   else
   begin
     MensagemForaIntervalo;
     qryMovtosBancosCompensacao.FocusControl;
     result := false;
   end;
end;

function TdtmConciliacaoBancaria.GetTabelaConsultaMovtos: TZDataset;
begin
   Result:= qryConsultaMovtosBancos;
end;


function TdtmConciliacaoBancaria.ContaEstaDefinida: Boolean;
begin
   Result:= qryProcuraContas.RecordCount > 0;
end;



function TdtmConciliacaoBancaria.Inserindo: Boolean;
begin
   Result:= qryMovtosBancos.State = dsInsert;
end;

function TdtmConciliacaoBancaria.ExisteMovto(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaMovtosBancos, campo, codigo);
end;

procedure TdtmConciliacaoBancaria.SetDataFinal(const Value: String);
begin
   FDataFinal:= Value;
end;

procedure TdtmConciliacaoBancaria.SetDataInicial(const Value: String);
begin
   FDataInicial:= Value;
end;

function TdtmConciliacaoBancaria.SelecionarMovtosBancos: Boolean;
begin
  if qryMovtosBancos.Active then qryMovtosBancos.Close;
  qryMovtosBancos.Open;
  Result:= not qryMovtosBancos.IsEmpty;
end;

procedure TdtmConciliacaoBancaria.qryMovtosBancosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  if not Ajustar then
    GravarMovtosBancos;
  ReFazConsulta(qryProcuraContas, [0],
               [qryProcuraContasConta.AsVariant]);
  if Assigned(FOnExibirSaldo) then
    FOnExibirSaldo(qryProcuraContas);
end;

procedure TdtmConciliacaoBancaria.qryProcuraContasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnExibirSaldo) then
    FOnExibirSaldo(qryProcuraContas);
end;

function TdtmConciliacaoBancaria.UltimaDataLancamento: Boolean;
begin
  if qryUltimoLancto.Active then qryUltimoLancto.Close;
  qryUltimoLancto.Open;
  Result:= not qryUltimoLancto.IsEmpty;
end;

function TdtmConciliacaoBancaria.AcessarSaldoAnterior: Boolean;
begin
   if qryLanctoAnterior.Active then qryLanctoAnterior.Close;
   qryLanctoAnterior.Open;
   Result:= not qryLanctoAnterior.IsEmpty;
end;

procedure TdtmConciliacaoBancaria.qryMovtosBancosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
   qryMovtosBancosTipo.       AsString  := 'B';
end;


procedure TdtmConciliacaoBancaria.qryMovtosBancosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if OrdenarporValor then
  begin
    qryMovtosBancos.MacroByName('CampoOrdenacao_1').AsString := 'ABS(Valor)';
    qryMovtosBancos.MacroByName('CampoOrdenacao_2').AsString := 'ABS(m.Valor)';
  end
  else
  begin
    qryMovtosBancos.MacroByName('CampoOrdenacao_1').AsString := 'coalesce(Documento,'''')';
    qryMovtosBancos.MacroByName('CampoOrdenacao_2').AsString := 'coalesce(m.Documento,'''')';
  end;
end;

procedure TdtmConciliacaoBancaria.SetOrdenarporDocumento(
  const Value: Boolean);
begin
  FOrdenarporDocumento := Value;
  if Value then
     FOrdenarporValor := false;

  qryMovtosBancos.Close;
  qryMovtosBancos.Open;
end;

procedure TdtmConciliacaoBancaria.SetOrdenarporValor(const Value: Boolean);
begin
  FOrdenarporValor := Value;
  if Value then
     FOrdenarporDocumento := false;

  qryMovtosBancos.Close;
  qryMovtosBancos.Open;
end;

procedure TdtmConciliacaoBancaria.SelecionarMovtosGrid(Marcar,Todos: Boolean);
begin
  qryMovtosBancos.AfterPost:= nil;
  if Todos then
  begin
    try
      Ajustar:= true;
      GuardarRegistroAtual(qryMovtosBancos, true);
      qryMovtosBancos.First;
      while not qryMovtosBancos.Eof do
      begin
        qryMovtosBancos.Edit;
        qryMovtosBancosSelecionado.AsBoolean:= not qryMovtosBancosSelecionado.AsBoolean;
        qryMovtosBancos.Post;
        qryMovtosBancos.Next;
      end;
    finally
      VoltarRegistroAtual(qryMovtosBancos);
    end;
  end
  else
  begin
    Ajustar:= True;
    qryMovtosBancos.Edit;
    qryMovtosBancosSelecionado.AsBoolean:= not qryMovtosBancosSelecionado.AsBoolean;
    qryMovtosBancos.Post;
  end;
  qryMovtosBancos.AfterPost:= qryMovtosBancosAfterPost;
  Ajustar:= False;
end;

function TdtmConciliacaoBancaria.Selecionados: Integer;
var a: integer;
    pos: TBookmark;
begin
  a:=0;
  Pos:= qryMovtosBancos.GetBookmark;
  qryMovtosBancos.DisableControls;
  qryMovtosBancos.First;
  while not qryMovtosBancos.Eof do
  begin
    if qryMovtosBancosSelecionado.AsBoolean then
      inc(a);
    qryMovtosBancos.Next;
  end;
  qryMovtosBancos.GotoBookmark(Pos);
  qryMovtosBancos.FreeBookmark(Pos);
  qryMovtosBancos.EnableControls;
  Result:= a;
end;

procedure TdtmConciliacaoBancaria.SelecionarSempreMovtosGrid(DS: TDataSet; Marcar: Boolean);
begin
    DS.AfterPost:= nil;
    Ajustar:= True;
    DS.Edit;
    DS.FieldByName('selecionado').AsBoolean:= Marcar;
    DS.Post;
    Ajustar:= False;
    ds.AfterPost:= ds.AfterPost;
end;

procedure TdtmConciliacaoBancaria.SelecionarTodosMovtos(Marcar: Boolean);
begin
    qryMovtosBancos.AfterPost:= nil;
    try
      Ajustar:= true;
      qryMOvtosBancos.DisableControls;
      qryMovtosBancos.First;
      while not qryMovtosBancos.Eof do
      begin
        qryMovtosBancos.Edit;
        qryMovtosBancosSelecionado.AsBoolean:= Marcar;
        qryMovtosBancos.Post;
        qryMovtosBancos.Next;
      end;
    finally
      qryMovtosBancos.EnableControls;
    end;
    qryMovtosBancos.AfterPost:= qryMovtosBancosAfterPost;
end;

procedure TdtmConciliacaoBancaria.MensagemForaIntervalo;
begin
  MensagemAviso('A data está fora do período de lançamentos');
end;

procedure TdtmConciliacaoBancaria.qryMovtosBancosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if ExibindoEventos then
       RefazConsultaPorNome(qryMovtosBancosEventos,
                        ['Conta', 'Data', 'Sequencia'],
                        [qryMovtosBancosConta.AsVariant,
                        FormatDateTime('yyyy-mm-dd',qryMovtosBancosData.AsDatetime),
                         qryMovtosBancosSequencia.AsVariant]);

end;

procedure TdtmConciliacaoBancaria.qryMovtosBancosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryMovtosBancos.Cancel;
end;

end.
