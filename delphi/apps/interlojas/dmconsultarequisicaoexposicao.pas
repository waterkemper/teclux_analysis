unit dmconsultarequisicaoexposicao;

interface

uses
  SysUtils, Classes, Forms, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, biblio, ctconstantes, clparametrossistema, Variants,
  ZTransact, fr_class, fr_dset, fr_dbset, fmpreviewpadrao, fmmensagemsimnaoopcaocancelamotivo,
  controls;

type
  TdtmConsultaRequisicaoExposicao = class(TdtmBasico)
    qryPedidosConfirmados: TtecQuery;
    qryPedidosConfirmadoscodigo: TIntegerField;
    qryPedidosConfirmadosproduto: TLargeintField;
    qryPedidosConfirmadosdescricao: TStringField;
    qryPedidosConfirmadosgrupo: TStringField;
    dstPedidosConfirmados: TtecDataSource;
    qryPedidosConfirmadosdescsituacao: TStringField;
    qryPedidosConfirmadoslinha: TStringField;
    qryPedidosConfirmadoscoluna: TStringField;
    qryPedidosConfirmadosvalorgrade1: TStringField;
    qryPedidosConfirmadosvalorgrade2: TStringField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
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
    qryEstoqueBloqueio: TtecQuery;
    qryEstoqueBloqueioproduto: TLargeintField;
    qryEstoqueBloqueiofilial: TIntegerField;
    qryEstoqueBloqueioemestoque: TFloatField;
    qryEstoques: TtecQuery;
    qryEstoquesemestoque: TFloatField;
    qryEstoquesreservaprevia: TFloatField;
    dsrPedidosFiliais: TtecDataSource;
    qryPedidosFiliais: TtecQuery;
    qryPedidosFiliaiscodigo: TIntegerField;
    qryPedidosFiliaisproduto: TLargeintField;
    qryPedidosFiliaisdata: TStringField;
    qryPedidosFiliaisrequisitante: TIntegerField;
    qryPedidosFiliaisrequisitada: TIntegerField;
    qryPedidosFiliaisqtdepedida: TFloatField;
    qryPedidosFiliaisqtdepedidaantiga: TFloatField;
    qryPedidosFiliaisqtderecebida: TFloatField;
    qryPedidosFiliaissituacao: TStringField;
    qryPedidosFiliaisobservacao: TStringField;
    qryPedidosFiliaisdadofiscal: TIntegerField;
    qryPedidosFiliaisdescricao: TStringField;
    qryPedidosFiliaislinha: TStringField;
    qryPedidosFiliaiscoluna: TStringField;
    qryPedidosFiliaisvalorgrade1: TStringField;
    qryPedidosFiliaisvalorgrade2: TStringField;
    qryPedidosFiliaisnota_serie: TStringField;
    qryPedidosFiliaisestoquerequisitada: TFloatField;
    qryPedidosFiliaisreservaprevia: TFloatField;
    qryPedidosFiliaisestoquerequisitante: TFloatField;
    fdsPedidosFiliais: TfrDBDataSet;
    frpPedidosFiliais: TfrReport;
    qryPedidosFiliaisreferencia: TStringField;
    qryPedidosFiliaisfilial_estoque: TIntegerField;
    qryPedidosFiliaislotetransferencia: TIntegerField;
    qryPedidosFiliaisnomefilialrequisitada: TStringField;
    qryPedidosFiliaisresultadocurvaabc: TStringField;
    qryEstoqueBloqueiofuturo: TFloatField;
    qryPedidosFiliaismotivo: TIntegerField;
    procedure qryPedidosFiliaisAfterPost(DataSet: TDataSet);
    procedure qryPedidosFiliaisAfterScroll(DataSet: TDataSet);
    procedure qryPedidosFiliaisBeforeInsert(DataSet: TDataSet);
    procedure dsrPedidosFiliaisDataChange(Sender: TObject; Field: TField);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpPedidosFiliaisBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryPedidosFiliaisFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    FOnScrollLinhaColunaGradeConfirmados: TNotifyEvent;
    function GetColunadaGradeConfirmados: String;
    function GetLinhadaGradeConfirmados: String;
    function GetColunadaGradePedidos: String;
    function GetLinhadaGradePedidos: String;
  protected
    FSituacao: Integer;
    FDataInicial: String;
    FDataFinal: String;
    FRequisicaoAfterScroll: TNotifyEvent;
    AtualizandoEstoque: Boolean;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
    procedure MontaIntervaloData;
    procedure SetSituacao(const Value: Integer);
    function GetConfirmado: Boolean;
    function GetCancelado: Boolean;
    function GetFechado: Boolean;
    function GetTabelaRequisicao: TtecQuery;
    function GetPodeAlterar: Boolean;
    function GetPodeExcluir: Boolean;
    function GetNrRegistro: Integer;
    function PodeGravar: Boolean;
    function ReservaPreviaProduto(Cancelando: Boolean = False): Boolean;
    procedure BloquearEstoque;
//    procedure AtualizaEstoque;
    function GetSituacao: String;
  public
    function EditarRequisicao: Boolean;
    procedure FecharTabelaRequisicao;
    function GerarConsultaRequisicao: Boolean;
    function ExcluirRequisicao: Boolean;
    function GravarRequisicao: Boolean;
    constructor Create(AWoner: TComponent); override;
    procedure SelecionarPedidosConfirmados;
    property Cancelado: Boolean read GetCancelado;
    property Confirmado: Boolean read GetConfirmado;
    property Fechado: Boolean read GetFechado;
    property Situacao: Integer read FSituacao write SetSituacao;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property TabelaRequisicao: TtecQuery read GetTabelaRequisicao;
    property PodeAlterar: Boolean read GetPodeAlterar;
    property PodeExcluir: Boolean read GetPodeExcluir;
    property RequisicaoAfterScroll: TNotifyEvent read FRequisicaoAfterScroll write FRequisicaoAfterScroll;
    property NrRegistro: Integer read GetNrRegistro;
    property  OnScrollLinhaColunaGradeConfirmados    : TNotifyEvent read FOnScrollLinhaColunaGradeConfirmados write FOnScrollLinhaColunaGradeConfirmados;
    property LinhadaGradeConfirmados: String read GetLinhadaGradeConfirmados;
    property ColunadaGradeConfirmados: String read GetColunadaGradeConfirmados;
    property LinhadaGradePedidos: String read GetLinhadaGradePedidos;
    property ColunadaGradePedidos: String read GetColunadaGradePedidos;
    procedure ImprimirRequisicoes;


  end;

//var
//  dtmConsultaRequisicaoExposicao: TdtmConsultaRequisicaoExposicao;

const
  WhereBase = 24;
  WherePeriodo   = WhereBase + 1;
  WhereSituacao  = WhereBase + 2;

implementation

{$R *.dfm}

{ TdtmConsultaRequisicaoExposicao }

constructor TdtmConsultaRequisicaoExposicao.Create(AWoner: TComponent);
begin
  inherited;
  qryPedidosFiliais.Params[0].AsInteger:= FilialBase;
  qryPedidosFiliaisqtdepedida           .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisqtdepedida           .EditFormat := ParSistema.MascaraQuantidadeGrade;

  qryPedidosFiliaisqtderecebida         .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisestoquerequisitada   .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisestoquerequisitante  .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisreservaprevia        .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisqtdepedidaantiga     .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

function TdtmConsultaRequisicaoExposicao.EditarRequisicao: Boolean;
begin
  Result:= False;
  if qryPedidosFiliaissituacao.AsString = 'A' then begin
    qryPedidosFiliais.Edit;
    Result:= True;
  end
  else MensagemAviso(Format(ctREQUISICAONAOPODEEXCLUIR,['alterada']));
end;

function TdtmConsultaRequisicaoExposicao.GerarConsultaRequisicao: Boolean;
begin
  if qryPedidosFiliais.Active then
    qryPedidosFiliais.Close;
  qryPedidosFiliais.Open;
  Result:= qryPedidosFiliais.IsEmpty;
  if Result then
    qryPedidosFiliais.Close
  else
    qryPedidosFiliais.FieldByName('qtdepedida').FocusControl;;
end;

function TdtmConsultaRequisicaoExposicao.GetPodeAlterar: Boolean;
begin
  Result:= (qryPedidosFiliais.RecordCount > 0);
end;

function TdtmConsultaRequisicaoExposicao.GetTabelaRequisicao: TtecQuery;
begin
  Result:= qryPedidosFiliais;
end;

procedure TdtmConsultaRequisicaoExposicao.MontaIntervaloData;
const
  Data_1: String = 'and (cast(pf.data as date) = ';
  Data_2: String = 'and (cast(pf.data as date) between (';
begin
  if not DataEmBranco(FDataInicial) then
  begin
    if DataEmBranco(FDataFinal) then
         qryPedidosFiliais.MacroByName('Periodo').AsString:= Data_1 + '''' + FDataInicial + ''')'
    else
      qryPedidosFiliais.MacroByName('Periodo').AsString:= Data_2 + '''' + FDataInicial + ''') and (''' + FDataFinal + '''))';
  end
  else
  begin
    if not DataEmBranco(FDataFinal) then
      qryPedidosFiliais.MacroByName('Periodo').AsString:= Data_1 + '''' + FDataFinal + ''')'
    else
      qryPedidosFiliais.MacroByName('Periodo').AsString:= '';
  end;
end;

procedure TdtmConsultaRequisicaoExposicao.SetDataFinal(const Value: String);
begin
  if FDataFinal <> Value then
    FDataFinal:= Value;
  MontaIntervaloData;
end;

procedure TdtmConsultaRequisicaoExposicao.SetDataInicial(const Value: String);
begin
  if FDataInicial <> Value then
    FDataInicial:= Value;
  MontaIntervaloData;
end;

procedure TdtmConsultaRequisicaoExposicao.SetSituacao(const Value: Integer);
begin
  fSituacao := Value;
  case Value of
    0: qryPedidosFiliais.MacroByName('Situacao').AsString:= 'and (pf.situacao = ' + QuotedStr('A') + ')';
    1: qryPedidosFiliais.MacroByName('Situacao').AsString:= 'and (pf.situacao = ' + QuotedStr('F') + ')';
    2: qryPedidosFiliais.MacroByName('Situacao').AsString:= 'and (pf.situacao = ' + QuotedStr('D') + ')';
    3: qryPedidosFiliais.MacroByName('Situacao').AsString:= 'and (pf.situacao = ' + QuotedStr('C') + ')';
  end;
end;

function TdtmConsultaRequisicaoExposicao.ExcluirRequisicao: Boolean;
var
  vObservacaoAux : String;

begin
  Result:= true;
  if not qryPedidosFiliais.IsEmpty then
    if PodeExcluir then
    begin

      if MensagemSimNaoopcaocancelamotivo(self, 'Confirma o cancelamento da REQUISIÇÃO DO PRODUTO?', '', false, '&Sim', '&Não', '', True,
            parsistema.InformarMotivoCancelamentoPedido, 'P' ) = mrYes then
      begin
        if ParSistema.RequisicaoSubtraiEstoque then
        begin
          BloquearEstoque;
          result := ReservaPreviaProduto(True);
        end;

        if result then
        begin
          vObservacaoAux := TRIM(qryPedidosFiliaisobservacao.asString + ' ''Motivo do Cancelamento:''' + vTextoJanelaMensagem);

          qryPedidosFiliais.edit;
          qryPedidosFiliaisobservacao.asString := vObservacaoAux;
          qryPedidosFiliaisMotivo.asString := vMotivoJanelaMensagem;
          qryPedidosFiliaissituacao.asstring := 'C';
          qryPedidosFiliaisqtderecebida.clear;

          qryPedidosFiliais.post;

          if (ParSistema.RequisicaoSubtraiEstoque) then
            Perpetrar([qryPedidosFiliais,qryMovimentos])
          else
            Perpetrar([qryPedidosFiliais]);


        end;
      end;


    end
    else
      MensagemAviso(Format(ctREQUISICAONAOPODEEXCLUIR,['excluída']));

end;

function TdtmConsultaRequisicaoExposicao.GetPodeExcluir: Boolean;
begin
  Result:= (qryPedidosFiliaissituacao.AsString = 'A');
end;

procedure TdtmConsultaRequisicaoExposicao.qryPedidosFiliaisAfterPost(DataSet: TDataSet);
var
 produto: String;
 filial,filial_estoque : Integer;
begin
  inherited;
  if not AtualizandoEstoque then
  begin
//    GuardarRegistroAtual(qryPedidosFiliais, True);

    produto := qryPedidosFiliaisproduto.AsString;
    filial := qryPedidosFiliaisrequisitada.AsInteger;
    filial_estoque := qryPedidosFiliaisfilial_estoque.AsInteger;

    if ParSistema.RequisicaoSubtraiEstoque then
      Perpetrar([qryPedidosFiliais,qryMovimentos])
    else
      Perpetrar([qryPedidosFiliais]);

    AtualizandoEstoque:=true; //Para não entrar em loop no AfterPOst

    RefazConsulta(qryEstoques,[0,1],[produto,filial_estoque]);

    if qryPedidosFiliais.Locate('produto;requisitada', varArrayOf([produto,filial]),[]) then
    begin
      qryPedidosFiliais.Edit;
      qryPedidosFiliaisestoquerequisitada.AsCurrency:=qryEstoquesemestoque.AsCurrency;
      qryPedidosFiliaisreservaprevia.AsCurrency:=qryEstoquesreservaprevia.AsCurrency;
      qryPedidosFiliaisqtdepedidaantiga.AsCurrency := qryPedidosFiliaisqtdepedida.AsCurrency;
      qryPedidosFiliais.Post;
    end;
//    VoltarRegistroAtual(qryPedidosFiliais);

//    qryPedidosFiliaisqtdepedida.FocusControl;
  end;
end;

procedure TdtmConsultaRequisicaoExposicao.FecharTabelaRequisicao;
begin
  if qryPedidosFiliais.Active then
    qryPedidosFiliais.Close;
end;

procedure TdtmConsultaRequisicaoExposicao.qryPedidosFiliaisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Assigned(FRequisicaoAfterScroll) then
    FRequisicaoAfterScroll(qryPedidosFiliais);
end;

function TdtmConsultaRequisicaoExposicao.GravarRequisicao: Boolean;
begin
  Result:= True;
  qryPedidosFiliais.Post;
end;

function TdtmConsultaRequisicaoExposicao.GetNrRegistro: Integer;
begin
  Result:= qryPedidosFiliais.RecordCount;
end;

procedure TdtmConsultaRequisicaoExposicao.qryPedidosFiliaisBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

function TdtmConsultaRequisicaoExposicao.GetConfirmado: Boolean;
begin
  Result:= (qryPedidosFiliaissituacao.AsString = 'D');
end;


function TdtmConsultaRequisicaoExposicao.GetCancelado: Boolean;
begin
  Result:= (qryPedidosFiliaissituacao.AsString = 'C');
end;

function TdtmConsultaRequisicaoExposicao.GetFechado: Boolean;
begin
  Result:= (qryPedidosFiliaissituacao.AsString = 'F');
end;

procedure TdtmConsultaRequisicaoExposicao.SelecionarPedidosConfirmados;
begin
  ReFazConsulta(qryPedidosConfirmados,[0],[qryPedidosFiliaisdadofiscal.AsInteger]);
end;

function TdtmConsultaRequisicaoExposicao.GetColunadaGradeConfirmados: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryPedidosConfirmadoscoluna.AsString)
end;

function TdtmConsultaRequisicaoExposicao.GetLinhadaGradeConfirmados: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryPedidosConfirmadoslinha.AsString)
end;

function TdtmConsultaRequisicaoExposicao.GetColunadaGradePedidos: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryPedidosFiliaiscoluna.AsString)
end;

function TdtmConsultaRequisicaoExposicao.GetLinhadaGradePedidos: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryPedidosFiliaislinha.AsString)
end;

function TdtmConsultaRequisicaoExposicao.PodeGravar: Boolean;
begin
  Result:=false;
  if ParSistema.RequisicaoSubtraiEstoque then
  begin
    //LIMPA TABELA DE MOVIMENTOS
    qryMovimentos.Close;
    qryMovimentos.Open;
    if (qryPedidosFiliaisestoquerequisitada.AsCurrency < (qryPedidosFiliaisqtdepedida.AsCurrency-qryPedidosFiliaisqtdepedidaantiga.AsCurrency)-
                                                          qryPedidosFiliaisqtderecebida.AsCurrency) then
    begin
        MensagemAviso('A quantidade solicitada não pode ser maior do que a quantidade em estoque da filial requisitada!');
    end
    else
    begin
      BloquearEstoque;
      result := ReservaPreviaProduto;
    end;
  end
  else
    Result:=true;
end;

function TdtmConsultaRequisicaoExposicao.ReservaPreviaProduto(
  Cancelando: Boolean): Boolean;

  procedure NovoMovimento(Produto: int64; Filial: Integer);
  begin
    qryMovimentos.Append;
    spcMovimentosProximo.Open;
    qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
    spcMovimentosProximo.Close;
    qryMovimentosproduto.AsLargeInt   := Produto;
    qryMovimentosfilial.AsInteger     := Filial;
    qryMovimentosreferencia.AsString:='REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;
  end;

begin

  result := True;
  if qryPedidosFiliaiscodigo.Asinteger = 0 then
  begin
    result := false;
    Mensagemerro('Entre em contato com o suporte [ConsultaRequisicoesExposicao], o Número da requisição não esta preenchido')
  end
  else
  begin

    if qryMovimentos.State = dsInactive then
      qryMovimentos.Open;
    if qryPedidosFiliais.State = dsEdit then
    begin
      if qryPedidosFiliaisqtdepedida.AsCurrency<>qryPedidosFiliaisqtdepedidaantiga.AsCurrency then
      begin
        if qryPedidosFiliaisqtdepedida.AsCurrency < qryPedidosFiliaisqtdepedidaantiga.AsCurrency then
        begin
          NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
          qryMovimentostipomovimento.AsString:='TPE';
          qryMovimentosquantidade.AsCurrency:= qryPedidosFiliaisqtdepedidaantiga.AsCurrency - qryPedidosFiliaisqtdepedida.AsCurrency;
          qryMovimentos.Post;

          if qryEstoqueBloqueiofuturo.asCurrency<>0 then  //possui venda em futuro
          begin
             NovoMovimento(qryPedidosFiliaisproduto.AsLargeint,qryPedidosFiliaisfilial_estoque.AsInteger);
             qryMovimentostipomovimento.AsString := 'TFR';
             if qryEstoqueBloqueiofuturo.asCurrency > (qryPedidosFiliaisqtdepedidaantiga.AsCurrency - qryPedidosFiliaisqtdepedida.AsCurrency) then
                 // transfere para a reserva a quantidade do movimento
               qryMovimentosquantidade.AsCurrency   := (qryPedidosFiliaisqtdepedidaantiga.AsCurrency - qryPedidosFiliaisqtdepedida.AsCurrency)
             else
                 // transfere para a reserva a quantidade do futuro
               qryMovimentosquantidade.AsCurrency   := qryEstoqueBloqueiofuturo.asCurrency;

             qryMovimentosreferencia.AsString    := 'REQUISICAO '+qryPedidosFiliaiscodigo.AsString+' QTDE NAO CONFIRMADA';

             qryMovimentos.Post;
           end;
        end
        else
        begin
          NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
          qryMovimentostipomovimento.AsString:='TEP';
          qryMovimentosquantidade.AsCurrency:=qryPedidosFiliaisqtdepedida.AsCurrency - qryPedidosFiliaisqtdepedidaantiga.AsCurrency;
          qryMovimentos.Post;
        end;
      end;
    end
    else if Cancelando then
    begin

      NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
      qryMovimentostipomovimento.AsString:='TPE';
      qryMovimentosreferencia.AsString:='EXCLUSAO REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;
      qryMovimentosquantidade.Ascurrency:=qryPedidosFiliaisqtdepedida.AsCurrency{ - qryPedidosFiliaisqtderecebida.AsCurrency};
      qryMovimentos.Post;

      if qryEstoqueBloqueiofuturo.asCurrency<>0 then  //possui venda em futuro
      begin
         NovoMovimento(qryPedidosFiliaisproduto.AsLargeint,qryPedidosFiliaisfilial_estoque.AsInteger);
         qryMovimentostipomovimento.AsString := 'TFR';
         if qryEstoqueBloqueiofuturo.asCurrency > qryPedidosFiliaisqtdepedida.AsCurrency then
             // transfere para a reserva a quantidade do movimento
           qryMovimentosquantidade.AsCurrency   := qryPedidosFiliaisqtdepedida.AsCurrency
         else
             // transfere para a reserva a quantidade do futuro
           qryMovimentosquantidade.AsCurrency   := qryEstoqueBloqueiofuturo.asCurrency;

         qryMovimentosreferencia.AsString    := 'EXCLUSAO REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;

         qryMovimentos.Post;
       end;

    end;
  end;
end;

procedure TdtmConsultaRequisicaoExposicao.BloquearEstoque;
begin
  qryEstoqueBloqueio.Sql[05] := '((e.produto = ' + qryPedidosFiliaisproduto.AsString + ')and' +
                                '(e.filial = '   + qryPedidosFiliaisfilial_estoque.AsString  + '))';
  qryEstoqueBloqueio.Open;
end;

procedure TdtmConsultaRequisicaoExposicao.dsrPedidosFiliaisDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  dsrPedidosFiliais.OnDataChange:= nil;
  if Field = qryPedidosFiliaisqtdepedida then
  begin
    if not PodeGravar then
      qryPedidosFiliaisqtdepedida.AsCurrency:=qryPedidosFiliaisqtdepedidaantiga.AsCurrency;
    if qryPedidosFiliais.State=dsEdit then
    begin
      AtualizandoEstoque:=false;
      qryPedidosfiliais.DisableControls;
      qryPedidosFiliais.post;
      qryPedidosFiliais.EnableControls;
      qryPedidosFiliais.FieldByName('qtdepedida').FocusControl;
    end;
  end;
  dsrPedidosFiliais.OnDataChange:= dsrPedidosFiliaisDataChange;
end;
{
procedure TdtmConsultaRequisicaoExposicao.AtualizaEstoque;
begin
  //Para não entrar em loop no AfterPOst
  AtualizandoEstoque:=true;
  RefazConsulta(qryEstoques,[0,1],[qryPedidosFiliaisproduto.AsInteger,qryPedidosFiliaisrequisitada.AsInteger]);
  qryPedidosFiliais.Edit;
  qryPedidosFiliaisestoquerequisitada.AsCurrency:=qryEstoquesemestoque.AsCurrency;
  qryPedidosFiliaisreservaprevia.AsCurrency:=qryEstoquesreservaprevia.AsCurrency;
  qryPedidosFiliaisqtdepedidaantiga.AsCurrency := qryPedidosFiliaisqtdepedida.AsCurrency;
  qryPedidosFiliais.Post;
end;
 }
procedure TdtmConsultaRequisicaoExposicao.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\conreq.sql') then
    Listar.loadfromfile('c:\conreq.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\conreq.sql');
  listar.free;
end;

procedure TdtmConsultaRequisicaoExposicao.ImprimirRequisicoes;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= RazaoFilialBase;
//  frpPedidosFiliais.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try

   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   frmPreview.frCompositeReport.Reports.Add(frpPedidosFiliais);
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;

   frmPreview.ShowModal;

  finally
   frmPreview.Free;
  end;
end;

procedure TdtmConsultaRequisicaoExposicao.frpPedidosFiliaisBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpPedidosFiliais, view);
end;

procedure TdtmConsultaRequisicaoExposicao.qryPedidosFiliaisFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := (qryPedidosFiliaissituacao.asString = GetSituacao)
end;

function TdtmConsultaRequisicaoExposicao.GetSituacao: String;
begin
  case situacao of
    0: result := 'A';
    1: result := 'F';
    2: result := 'D';
    3: result := 'C';
  end;
end;

end.
