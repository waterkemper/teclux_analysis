unit dmrequisicaoexposicao;

interface

uses
  SysUtils, Classes, DateUtils, Forms, dmtecsoft, dmbasico, DB, ZQuery, Variants,
  ZPgSqlQuery, cpquery, cpdatasource, biblio, ctconstantes, clparametrossistema,
  ZTransact, fmmensagemsimnaoopcaocancelamotivo, Controls;

type
  TdtmRequisicaoExposicao = class(TdtmBasico)
    qryPedidosFiliais: TtecQuery;
    dsrPedidosFiliais: TtecDataSource;
    qryPedidosFiliaiscodigo: TIntegerField;
    qryPedidosFiliaisproduto: TLargeintField;
    qryPedidosFiliaisqtdepedida: TFloatField;
    qryPedidosFiliaisqtderecebida: TFloatField;
    qryPedidosFiliaisobservacao: TStringField;
    qryProcuraProdutos: TtecQuery;
    dsrProcuraProdutos: TtecDataSource;
    qryConsultaProdutos: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisDestino: TtecQuery;
    qryProcuraFiliaisDestinocodigo: TIntegerField;
    qryProcuraFiliaisDestinonome: TStringField;
    dsrProcuraFiliaisDestino: TtecDataSource;
    spcPedidosTransferenciaProximoCodigo: TtecQuery;
    spcPedidosTransferenciaProximoCodigonumero: TIntegerField;
    qryConsultaPedidosFiliais: TtecQuery;
    qryConsultaPedidosFiliaisdescricao: TStringField;
    qryConsultaPedidosFiliaiscodigo: TIntegerField;
    qryPedidosFiliaisnome: TStringField;
    qryPedidosFiliaissituacao: TStringField;
    qryPedidosFiliaisdata: TDateTimeField;
    qryProdutoJaRequisitado: TtecQuery;
    qryProdutoJaRequisitadocodigo: TIntegerField;
    qryProdutoJaRequisitadoproduto: TLargeintField;
    qryProcuraProdutosproduto: TLargeintField;
    qryProcuraProdutosfilial: TIntegerField;
    qryProcuraProdutosdescricao: TStringField;
    qryConsultaProdutosdescricao: TStringField;
    qryConsultaProdutosproduto: TLargeintField;
    qryConsultaProdutosfilial: TIntegerField;
    qryConsultaProdutosemestoque: TFloatField;
    qryPedidosFiliaisdescsituacao: TStringField;
    qryPedidosFiliaisrequisitante: TIntegerField;
    qryPedidosFiliaisrequisitada: TIntegerField;
    qryConsultaPedidosFiliaisrequisitada: TIntegerField;
    qryProcuraProdutosestoquerequisitante: TFloatField;
    qryProcuraProdutosestoquerequisitada: TFloatField;
    qryPedidosFiliaisdadofiscal: TIntegerField;
    qryPedidosFiliaisnumero: TIntegerField;
    qryPedidosFiliaisserie: TStringField;
    qryConsultaPedidosFiliaisdata: TStringField;
    qryProdutoJaRequisitadodata: TDateTimeField;
    qryConsultaPedidosFiliaisvalorgrade1: TStringField;
    qryConsultaPedidosFiliaisvalorgrade2: TStringField;
    qryConsultaProdutosvalorgrade1: TStringField;
    qryConsultaProdutosvalorgrade2: TStringField;
    qryEstoqueBloqueio: TtecQuery;
    qryEstoqueBloqueioproduto: TLargeintField;
    qryEstoqueBloqueiofilial: TIntegerField;
    qryEstoqueBloqueioemestoque: TFloatField;
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
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
    qryConsultaPedidosFiliaisproduto: TLargeintField;
    qryConsultaPedidosFiliaisreferencia: TStringField;
    qryConsultaProdutosreferencia: TStringField;
    qryProcuraProdutosunidade: TStringField;
    qryConsultaProdutosunidade: TStringField;
    qryPedidosFiliaisfilial_estoque: TIntegerField;
    qryProcuraProdutosfilial_estoque: TIntegerField;
    qryProcuraFiliaisDestinofilial_estoque: TIntegerField;
    qryConsultaFiliaisfilial_estoque: TIntegerField;
    qryProcuraProdutosprodutovisual: TStringField;
    qryConsultaProdutosprodutovisual: TStringField;
    qryPedidosFiliaisprodutovisual: TStringField;
    qryEstoqueBloqueiofuturo: TFloatField;
    qryPedidosFiliaismotivo: TIntegerField;
    qryPedidosFiliaiscodigoorigem: TIntegerField;
    qryConsultaPedidosFiliaisrequisitante: TIntegerField;
    procedure qryPedidosFiliaisNewRecord(DataSet: TDataSet);
    procedure qryPedidosFiliaisAfterScroll(DataSet: TDataSet);
    procedure dsrPedidosFiliaisDataChange(Sender: TObject; Field: TField);
    procedure qryProcuraFiliaisDestinoAfterOpen(DataSet: TDataSet);
    procedure qryPedidosFiliaisBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaPedidosFiliaisAfterOpen(DataSet: TDataSet);
    procedure qryConsultaProdutosAfterOpen(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryProcuraProdutosBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaProdutosBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryProcuraFiliaisDestinoBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaFiliaisBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaPedidosFiliaisBeforeOpen(DataSet: TDataSet);
  protected
    function GetTabelaPedidosTransferencia: TtecQuery;
    function GetConsultaFiliais: TtecQuery;
    function GetConsultaPedidosTransferencia: TtecQuery;
    function GetConsultaProdutos: TtecQuery;
    function GetEntregue: Boolean;
    procedure NovoMovimento(Produto: int64; Filial: Integer);
    function ReservaPreviaProduto(Cancelando: Boolean = False): boolean;
    procedure BloquearEstoque;
    procedure BloquearEstoqueOldValue;

  public
    constructor create(AOwner: TComponent); override;
    function  ExcluirPedidosTransferencia: Boolean;
    function  IncluirPedidosTransferencia: Boolean;
    function  GravarPedidosTransferencia: Boolean;
    function  ExistePedidosTranferencia(Campo, Codigo: String): boolean;
    function  ExisteFiliais(Campo, Codigo: String): Boolean;
    function  ExisteProdutos(Campo, Codigo: String): Boolean;
    procedure AbrirTabelas(TipoPesquisa: TtecPedidosTransferencia);
    procedure FecharTabelas(TipoPesquisa: TtecPedidosTransferencia);
    procedure Selecionar(TipoPesquisa: TtecPedidosTransferencia);

    property ConsultaPedidosTransferencia: TtecQuery  read GetConsultaPedidosTransferencia;
    property ConsultaFiliais: TtecQuery  read GetConsultaFiliais;
    property ConsultaProdutos: TtecQuery read GetConsultaProdutos;
    property TabelaPedidosTransferencia: TtecQuery read GetTabelaPedidosTransferencia;
    property Entregue: Boolean read GetEntregue;
  end;

{
var
  dtmRequisicaoExposicao: TdtmRequisicaoExposicao;
  }

implementation
uses fmRequisicaoExposicao;

{$R *.dfm}

{ TdtmPedidosTransferenciaEstoques }

procedure TdtmRequisicaoExposicao.AbrirTabelas(TipoPesquisa: TtecPedidosTransferencia);
begin
  case TipoPesquisa of
    tptPEDIDOS: Abre(ctLOJTabelaConsultaPedidosTransferencia);
    tptFILIAIS: Abre(ctLOJTabelaConsultaFiliais);
   tptPRODUTOS: begin
                  qryConsultaProdutos.Close;
                  qryConsultaProdutos.macrobyname('SQL').asstring := 'and (e.produto = 0)';
                  qryConsultaProdutos.Open;
                end;
  end;
end;

constructor TdtmRequisicaoExposicao.create(AOwner: TComponent);
begin
  inherited;
  qryPedidosFiliais.Tag        := ctTabelas;
  qryProcuraProdutos.Tag       := ctTabelas;
  qryProcuraFiliaisDestino.Tag := ctTabelas;

  qryConsultaPedidosFiliais.Tag:= ctLOJTabelaConsultaPedidosTransferencia;
  qryConsultaFiliais.Tag       := ctLOJTabelaConsultaFiliais;
  qryConsultaProdutos.Tag      := ctLOJTabelaConsultaProdutos;

//  qryProcuraFiliaisDestino.Params[1].AsInteger  := FilialBase;
//  qryConsultaFiliais.Params[0].AsInteger        := FilialBase;
//  qryConsultaPedidosFiliais.Params[0].AsInteger := FilialBase;
end;

function TdtmRequisicaoExposicao.ExcluirPedidosTransferencia: Boolean;
var
  vPedidosReadOnly : Boolean;
  vObservacaoAux : String;
begin
  Result:= False;
  if not qryPedidosFiliais.IsEmpty then
    if not Entregue then
    begin

      if MensagemSimNaoopcaocancelamotivo(self, 'Confirma o cancelamento da REQUISIÇÃO DO PRODUTO?', '', false, '&Sim', '&Não', '', True,
      parsistema.InformarMotivoCancelamentoPedido, 'P') = mrYes then
      begin
        try

          if ParSistema.RequisicaoSubtraiEstoque then
            result := ReservaPreviaProduto(True);

          vPedidosReadOnly := qryPedidosFiliais.readonly;

          vObservacaoAux := TRIM(qryPedidosFiliaisobservacao.asString + ' ''Motivo do Cancelamento:''' + vTextoJanelaMensagem);

          qryPedidosFiliais.ReadOnly:=false;
          qryPedidosFiliais.edit;
          qryPedidosFiliaisobservacao.asString := vObservacaoAux;
          qryPedidosFiliaisMotivo.asString := vMotivoJanelaMensagem;
          qryPedidosFiliaissituacao.asstring := 'C';
          qryPedidosFiliaisqtderecebida.clear;

          if qryPedidosFiliais.state = dsedit then
            qryPedidosFiliais.post;

          if (ParSistema.RequisicaoSubtraiEstoque) then
            result := Perpetrar([qryPedidosFiliais,qryMovimentos])
          else
            result := Perpetrar([qryPedidosFiliais]);

        finally
          qryPedidosFiliais.readonly := vPedidosReadOnly;
        end;

      end;
    end
    else
      MensagemAviso(Format(ctREQUISICAONAOPODEEXCLUIR,['excluída']));
end;

function TdtmRequisicaoExposicao.ExisteFiliais(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

function TdtmRequisicaoExposicao.ExistePedidosTranferencia(Campo, Codigo: String): boolean;
begin
  Result:= ExisteCodigo(qryConsultaPedidosFiliais, campo, codigo);
end;

function TdtmRequisicaoExposicao.ExisteProdutos(Campo, Codigo: String): Boolean;
const
  SQL = 'and (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
var
  vTabela : String;
begin
  if (Campo = 'descricao') or
     (Campo = 'valorgrade1') or
     (Campo = 'valorgrade2') or
     (Campo = 'referencia') then   vTabela := 'p.'
  else if (Campo = 'unidade') then vTabela := 'c.'
  else if (campo = 'produto') or
          (Campo = 'filial') or
          (Campo = 'emestoque') then vTabela := 'e.';

  qryConsultaProdutos.close;        
  qryConsultaProdutos.macrobyname('SQL').asstring := Format(SQL, [vTabela+Campo, Codigo, '%']);
  qryConsultaProdutos.Open;
  Result := (qryConsultaProdutos.RecordCount > 0);
end;

procedure TdtmRequisicaoExposicao.FecharTabelas(TipoPesquisa: TtecPedidosTransferencia);
begin
  case TipoPesquisa of
    tptPEDIDOS: Fecha(ctLOJTabelaConsultaPedidosTransferencia);
    tptFILIAIS: Fecha(ctLOJTabelaConsultaFiliais);
   tptPRODUTOS: Fecha(ctLOJTabelaConsultaProdutos);
  end;
end;

function TdtmRequisicaoExposicao.GetConsultaFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmRequisicaoExposicao.GetConsultaPedidosTransferencia: TtecQuery;
begin
  Result:= qryConsultaPedidosFiliais;
end;

function TdtmRequisicaoExposicao.GetConsultaProdutos: TtecQuery;
begin
  Result:= qryConsultaProdutos;
end;

function TdtmRequisicaoExposicao.GravarPedidosTransferencia: Boolean;
var
  QuantidadePedidaAntigo : currency;
begin
  Result:= False;

{ if ParSistema.RequisicaoSubtraiEstoque and (qryPedidosFiliaisproduto.AsVariant <> qryPedidosFiliaisproduto.OldValue) then
  begin
    qryMovimentos.Append;
    spcMovimentosProximo.Open;
    qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
    spcMovimentosProximo.Close;
    qryMovimentosproduto.AsLargeInt   := Produto;
    qryMovimentosfilial.AsInteger     := Filial;
    qryMovimentosreferencia.AsString:='REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;
  end;
 }


  if not parsistema.Permitir_Requisicoes_de_Produtos_Duplicadas and
     (self.owner is TfrmRequisicaoExposicao) {Quando a gravação ocorre pela chamada do dtmTransferenciaRequisicaoExposicao (reinclusão de saldo pendente)
      não existirá esta situação
      pois a situacao da requisicao não ficará mais aberta}
  then
  begin

    ReFazConsulta(qryProdutoJaRequisitado,[0,1,2],[qryPedidosFiliaisproduto.AsLargeInt,
                                                 qryPedidosFiliaisrequisitada.AsInteger,
                                                 qryPedidosFiliaisrequisitante.AsInteger]);

    if not qryProdutoJaRequisitado.IsEmpty and (qryPedidosFiliaiscodigo.AsInteger = 0) then
    begin

      Result:= False;

      if MensagemConfirmacao(Format(ctPRODUTOJAREQUISITADO + ctALTERARQUANTIDADE,[qryPedidosFiliaisproduto.AsString,
                                                                                qryPedidosFiliaisrequisitada.AsString,
                                                                                DateToStr(DateOf(qryProdutoJaRequisitadoData.AsDateTime))])) = smbOk then
      begin
        ReFazConsulta(qryPedidosFiliais,[0,1],
                   [{FilialBase} qryPedidosFiliaisRequisitante.asinteger,
                    qryProdutoJaRequisitadocodigo.AsInteger]);

        if ParSistema.RequisicaoSubtraiEstoque then
        begin
          qryMovimentos.Close;
          qryMovimentos.Open;
        end;
      end;

    end
    else
      result := true;
  end
  else
    result := true;


  if result then
  begin
    if qryPedidosFiliais.CheckRequiredFields then
    begin

      if (qryPedidosFiliais.State = dsInsert) or
         ((qryPedidosFiliaisrequisitada.AsVariant = qryPedidosFiliaisrequisitada.OldValue) and
          (qryPedidosFiliaisproduto.AsVariant = qryPedidosFiliaisproduto.OldValue)) then
      begin

        if qryPedidosFiliais.State = dsInsert then
          QuantidadePedidaAntigo:=0
        else
          QuantidadePedidaAntigo:=qryPedidosFiliaisqtdepedida.OldValue;

{
        if not (self.owner is TfrmRequisicaoExposicao) then
          RefazConsultapornome(qryProcuraProdutos,['requisitante','produtovisual','requisitada'],
                [qryPedidosFiliaisrequisitante.AsInteger,
                 qryPedidosFiliaisprodutovisual.AsString,
                 qryPedidosFiliaisrequisitada.AsInteger]);
}


        if (qryProcuraProdutosestoquerequisitada.AsCurrency < (qryPedidosFiliaisqtdepedida.AsCurrency-QuantidadePedidaAntigo)-
                                                              qryPedidosFiliaisqtderecebida.AsCurrency)
           and (ParSistema.RequisicaoSubtraiEstoque)
           AND (self.owner is TfrmRequisicaoExposicao) then

          MensagemAviso('A quantidade solicitada é maior do que o estoque da filial requisitada.')

        else
        begin
          if (qryPedidosFiliais.State = dsInsert) { AND (self.owner is TfrmRequisicaoExposicao) } then
          begin
            spcPedidosTransferenciaProximoCodigo.Open;
            qryPedidosFiliaiscodigo.AsInteger:= spcPedidosTransferenciaProximoCodigonumero.AsInteger;
            spcPedidosTransferenciaProximoCodigo.Close;
          end;

          if (ParSistema.RequisicaoSubtraiEstoque) then
          begin
            BloquearEstoque;
            result := ReservaPreviaProduto;
            if result then
            begin
              qryPedidosFiliais.Post;

              if self.owner is TfrmRequisicaoExposicao then
                Perpetrar([qryPedidosFiliais,qryMovimentos]);

            end;
          end
          else
          begin
            qryPedidosFiliais.Post;
            if self.owner is TfrmRequisicaoExposicao then
              Perpetrar([qryPedidosFiliais]);
          end;

          if self.owner is TfrmRequisicaoExposicao then
            RefazConsultapornome(qryProcuraProdutos,['requisitante','produtovisual','requisitada'],
                          [qryPedidosFiliaisrequisitante.AsInteger,
                           qryPedidosFiliaisprodutovisual.AsString,
                           qryPedidosFiliaisrequisitada.AsInteger]);

          Result:= True;
        end;

      end
      else
      begin

        if (ParSistema.RequisicaoSubtraiEstoque) then
        begin
          if qryPedidosFiliaiscodigo.asinteger = 0 then
          begin
            result := false;
            Mensagemerro('Entre em contato com o suporte [RequisicaoExposicao], o Número da requisição não esta preenchido')
          end
          else
          begin

            BloquearEstoqueOldValue;

            NovoMovimento(qryPedidosFiliaisproduto.OldValue, qryPedidosFiliaisfilial_estoque.OLdValue);

             {
            if not qryMovimentos.Active then
              qryMovimentos.Open;
            qryMovimentos.Append;
            spcMovimentosProximo.Open;
            qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
            spcMovimentosProximo.Close;

            qryMovimentosproduto.AsLargeInt   := qryPedidosFiliaisproduto.OldValue;
            qryMovimentosfilial.AsVariant    := qryPedidosFiliaisfilial_estoque.OldValue;
            qryMovimentosreferencia.AsString :='REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;
            }
            qryMovimentostipomovimento.AsString:='TPE';
            qryMovimentosquantidade.Ascurrency := qryPedidosFiliaisqtdepedida.OldValue;
            qryMovimentos.Post;

            if qryEstoqueBloqueiofuturo.asCurrency<>0 then  //possui venda em futuro
            begin
              NovoMovimento(qryPedidosFiliaisproduto.OldValue, qryPedidosFiliaisfilial_estoque.OLdValue);
              qryMovimentostipomovimento.AsString := 'TFR';
              if qryEstoqueBloqueiofuturo.asCurrency > qryPedidosFiliaisqtdepedida.OldValue then
                 // transfere para a reserva a quantidade do movimento
                qryMovimentosquantidade.AsCurrency   := qryPedidosFiliaisqtdepedida.OldValue
              else
                 // transfere para a reserva a quantidade do futuro
                qryMovimentosquantidade.AsCurrency   := qryEstoqueBloqueiofuturo.asCurrency;
              qryMovimentos.Post;
            end;

            BloquearEstoque;

            qryMovimentos.Append;

            if self.owner is TfrmRequisicaoExposicao then
            begin
              spcMovimentosProximo.Open;
              qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
              spcMovimentosProximo.Close;
            end;

            qryMovimentosproduto.AsLargeInt   := qryPedidosFiliaisproduto.AsLargeInt;
            qryMovimentosfilial.AsVariant    := qryPedidosFiliaisfilial_estoque.AsVariant;
            qryMovimentosreferencia.AsString :='REQUISIÇÃO ' + qryPedidosFiliaiscodigo.AsString;
            qryMovimentosquantidade.Ascurrency := qryPedidosFiliaisqtdepedida.AsVariant;
            qryMovimentostipomovimento.AsString:='TEP';
            qryMovimentos.Post;

            qryPedidosFiliais.Post;

            if self.owner is TfrmRequisicaoExposicao then
              result := Perpetrar([qryPedidosFiliais,qryMovimentos]);

          end;

        end
        else
        begin
          {Esta editando, trocando um produto ou filial e simplesmente grava? Sem fazer movimentações? }
          qryPedidosFiliais.Post;
          if self.owner is TfrmRequisicaoExposicao then
            Perpetrar([qryPedidosFiliais]);
        end;

      end;

    end;
  end;

end;

function TdtmRequisicaoExposicao.IncluirPedidosTransferencia: Boolean;
begin
  Result:= True;
  if not qryPedidosFiliais.Active then
    qryPedidosFiliais.Open;
  if qryPedidosFiliais.ReadOnly then
    qryPedidosFiliais.ReadOnly:= False;
  qryPedidosFiliais.Insert;
end;

procedure TdtmRequisicaoExposicao.Selecionar(TipoPesquisa: TtecPedidosTransferencia);
begin
  case TipoPesquisa of
    tptPEDIDOS: ReFazConsulta(qryPedidosFiliais,[0,1],
                                  [qryConsultaPedidosFiliaisRequisitante.AsInteger,
                                   qryConsultaPedidosFiliaiscodigo.AsInteger]);
    tptFILIAIS: begin
                  qryPedidosFiliais.Edit;
                  qryPedidosFiliaisrequisitada.AsInteger:= qryConsultaFiliaiscodigo.AsInteger;
                  qryPedidosFiliaisfilial_estoque.AsInteger:= qryConsultaFiliaisfilial_estoque.AsInteger;
                end;
   tptPRODUTOS: begin

                  qryProcuraProdutos.parambyname('produtovisual').asString := qryConsultaProdutosprodutovisual.asString;
                  qryProcuraProdutos.close;
                  qryProcuraProdutos.open;

                  qryPedidosFiliais.Edit;
                  qryPedidosFiliaisproduto.AsLargeInt := qryConsultaProdutosproduto.AsLargeInt;
                  qryPedidosFiliaisprodutovisual.AsString := qryConsultaProdutosprodutovisual.AsString;
                end;
  end;
end;

procedure TdtmRequisicaoExposicao.qryPedidosFiliaisNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryPedidosFiliaisdata.AsDateTime        := DataHoraLocal;
  qryPedidosFiliaisrequisitante.AsInteger := FilialBase;
  qryPedidosFiliaisnome.AsString          := NomeFilialBase;
  qryPedidosFiliaissituacao.AsString      := 'A';
  qryPedidosFiliaisdescsituacao.AsString  := 'ABERTO';

  qryProcuraProdutos.Parambyname('requisitante').AsInteger  := FilialBase;
  qryProcuraProdutos.Parambyname('requisitada').Clear;
  qryConsultaProdutos.Parambyname('requisitada').Clear;

end;

function TdtmRequisicaoExposicao.GetTabelaPedidosTransferencia: TtecQuery;
begin
  Result:= qryPedidosFiliais;
end;

procedure TdtmRequisicaoExposicao.qryPedidosFiliaisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryPedidosFiliais.ReadOnly:= (qryPedidosFiliaissituacao.AsString <> 'A');

  {
          RefazConsultapornome(qryProcuraProdutos,['requisitante','produtovisual','requisitada'],
                        [qryPedidosFiliaisrequisitante.AsInteger,
                         qryPedidosFiliaisprodutovisual.AsString,
                         qryPedidosFiliaisrequisitada.AsInteger]);
                         }
  
end;

function TdtmRequisicaoExposicao.GetEntregue: Boolean;
begin
  Result:= (qryPedidosFiliaissituacao.AsString <> 'A');
end;

procedure TdtmRequisicaoExposicao.dsrPedidosFiliaisDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  dsrPedidosfiliais.OnDataChange:= nil;
  if Field = qryPedidosFiliaisrequisitada then begin
    if qryPedidosFiliais.State in [dsEdit, dsInsert] then begin
      if qryPedidosFiliaisproduto.AsLargeInt > 0 then begin
        qryPedidosFiliaisproduto.Clear;
        qryPedidosFiliaisqtdepedida.Clear;
      end;
      qryProcuraProdutos.Parambyname('requisitada').AsInteger  := qryPedidosFiliaisrequisitada.AsInteger;
      qryConsultaProdutos.Parambyname('requisitada').AsInteger := qryPedidosFiliaisrequisitada.AsInteger;
    end;
  end
  else if Field = qryPedidosFiliaisproduto then begin
    if (qryPedidosFiliais.State in [dsEdit, dsInsert]) then
      qryPedidosFiliaisqtdepedida.Clear;
  end;
  dsrPedidosFiliais.OnDataChange:= dsrPedidosFiliaisDataChange;
end;

procedure TdtmRequisicaoExposicao.qryProcuraFiliaisDestinoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if (qryPedidosFiliaisrequisitada.AsInteger > 0) then begin
    qryProcuraProdutos.Parambyname('requisitada').AsInteger  := qryPedidosFiliaisrequisitada.AsInteger;
    qryConsultaProdutos.Parambyname('requisitada').AsInteger := qryPedidosFiliaisrequisitada.AsInteger;
  end;
  qryPedidosFiliaisfilial_estoque.AsInteger:=qryProcuraFiliaisDestinofilial_estoque.AsInteger;
end;

procedure TdtmRequisicaoExposicao.qryPedidosFiliaisBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  qryPedidosFiliais.Parambyname('requisitante').AsInteger := FilialBase;
end;

procedure TdtmRequisicaoExposicao.qryConsultaPedidosFiliaisAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaPedidosFiliaisvalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaPedidosFiliaisvalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

procedure TdtmRequisicaoExposicao.qryConsultaProdutosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaProdutosvalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaProdutosvalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

function TdtmRequisicaoExposicao.ReservaPreviaProduto(Cancelando:Boolean = False): boolean;

{
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
}

begin
  result := true;

  if qryPedidosFiliaiscodigo.asinteger = 0 then
  begin
    result := false;
    Mensagemerro('Entre em contato com o suporte [RequisicaoExposicao ReservaPreviaProduto], o Número da requisição não esta preenchido')
  end
  else
  begin

    if qryMovimentos.State = dsInactive then
      qryMovimentos.Open;
    //SE ESTA INSERINDO UMA REQUISIÇÃO ENTÃO GRAVA NOVO MOVIMENTO SE NÃO, SOMENTE ALTERA A QUANTIDADE
    if qryPedidosFiliais.State = dsInsert then
    begin
       BloquearEstoque;

       NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
       qryMovimentostipomovimento.AsString:='TEP';
       qryMovimentosquantidade.Ascurrency:=qryPedidosFiliaisqtdepedida.AsCurrency;
       //Gravar em movimentos o codigo da requisição?
       qryMovimentos.Post;
    end
    else if qryPedidosFiliais.State = dsEdit then
    begin
      if qryPedidosFiliaisqtdepedida.AsCurrency<>qryPedidosFiliaisqtdepedida.OldValue then
      begin

        if qryPedidosFiliaisqtdepedida.AsCurrency < qryPedidosFiliaisqtdepedida.OldValue then
        begin
          BloquearEstoque;

          NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
          qryMovimentostipomovimento.AsString:='TPE';
          qryMovimentosquantidade.Ascurrency:= qryPedidosFiliaisqtdepedida.OldValue - qryPedidosFiliaisqtdepedida.AsCurrency;
          qryMovimentos.Post;

          if qryEstoqueBloqueiofuturo.asCurrency<>0 then  //possui venda em futuro
          begin
            NovoMovimento(qryPedidosFiliaisproduto.AsLargeint,qryPedidosFiliaisfilial_estoque.AsInteger);
            qryMovimentostipomovimento.AsString := 'TFR';
            if qryEstoqueBloqueiofuturo.asCurrency > (qryPedidosFiliaisqtdepedida.OldValue - qryPedidosFiliaisqtdepedida.AsCurrency) then
               // transfere para a reserva a quantidade do movimento
              qryMovimentosquantidade.AsCurrency   := (qryPedidosFiliaisqtdepedida.OldValue - qryPedidosFiliaisqtdepedida.AsCurrency)
            else
               // transfere para a reserva a quantidade do futuro
              qryMovimentosquantidade.AsCurrency   := qryEstoqueBloqueiofuturo.asCurrency;
            qryMovimentos.Post;
          end;

        end
        else
        begin
          BloquearEstoque;

          NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
          qryMovimentostipomovimento.AsString:='TEP';
          qryMovimentosquantidade.Ascurrency:=qryPedidosFiliaisqtdepedida.AsCurrency - qryPedidosFiliaisqtdepedida.OldValue;
          qryMovimentos.Post;
        end;
      end;
    end
    else
    if Cancelando then
    begin
      BloquearEstoque;

      NovoMovimento(qryPedidosFiliaisproduto.AsLargeInt,qryPedidosFiliaisfilial_estoque.AsInteger);
      qryMovimentostipomovimento.AsString:='TPE';
      qryMovimentosreferencia.AsString:='EXCLUSAO REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;
      qryMovimentosquantidade.Ascurrency:=qryPedidosFiliaisqtdepedida.AsCurrency { - qryPedidosFiliaisqtderecebida.AsCurrency};
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
        qryMovimentos.Post;
      end;
    end;

  end;

end;
procedure TdtmRequisicaoExposicao.BloquearEstoque;
begin
  qryEstoqueBloqueio.Sql[06] := '((e.produto = ' + qryPedidosFiliaisproduto.AsString + ')and' +
                                '(e.filial = '   + qryPedidosFiliaisfilial_estoque.AsString  + '))';
  qryEstoqueBloqueio.Open;
end;

procedure TdtmRequisicaoExposicao.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\log.sql') then
    Listar.loadfromfile('c:\log.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\log.sql');
  listar.free;
end;

procedure TdtmRequisicaoExposicao.qryProcuraProdutosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraProdutos.parambyname('requisitante').asinteger := qryPedidosFiliaisrequisitante.AsInteger;
  qryProcuraProdutos.parambyname('requisitada').asinteger := qryPedidosFiliaisrequisitada.AsInteger;

  if not parsistema.Transferir_Produtos_Compostos then
    qryProcuraProdutos.MacroByName('SQLCondicaoCompostos').AsString :=  ' and not (coalesce(c.composto,false)) '
  else
    qryProcuraProdutos.MacroByName('SQLCondicaoCompostos').AsString :=  '';

end;

procedure TdtmRequisicaoExposicao.qryConsultaProdutosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not parsistema.Transferir_Produtos_Compostos then
    qryConsultaProdutos.MacroByName('SQLCondicaoCompostos').AsString :=  ' and not (coalesce(c.composto,false)) '
  else
    qryConsultaProdutos.MacroByName('SQLCondicaoCompostos').AsString :=  '';

end;

procedure TdtmRequisicaoExposicao.BloquearEstoqueOldValue;
begin
  qryEstoqueBloqueio.Sql[06] := '((e.produto = ' + VarToStr(qryPedidosFiliaisproduto.OldValue) + ')and' +
                                '(e.filial = '   + VarToStr(qryPedidosFiliaisfilial_estoque.OldValue)  + '))';

  qryEstoqueBloqueio.Open;
end;

procedure TdtmRequisicaoExposicao.NovoMovimento(Produto: int64;
  Filial: Integer);
begin
    qryMovimentos.Append;

    if self.owner is TfrmRequisicaoExposicao then
    begin
      spcMovimentosProximo.Open;
      qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
      spcMovimentosProximo.Close;
    end;

    qryMovimentosproduto.AsLargeInt   := Produto;
    qryMovimentosfilial.AsInteger     := Filial;
    qryMovimentosreferencia.AsString:='REQUISICAO ' + qryPedidosFiliaiscodigo.AsString;

end;

procedure TdtmRequisicaoExposicao.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
end;

procedure TdtmRequisicaoExposicao.qryProcuraFiliaisDestinoBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraFiliaisDestino.ParamByName('requisitante').AsInteger  :=
    qryPedidosFiliaisrequisitante.asInteger;
end;

procedure TdtmRequisicaoExposicao.qryConsultaFiliaisBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaFiliais.ParamByName('requisitante').AsInteger :=
    qryPedidosFiliaisrequisitante.asInteger;
end;

procedure TdtmRequisicaoExposicao.qryConsultaPedidosFiliaisBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if qryPedidosFiliaisrequisitante.asInteger<>0 then
    qryConsultaPedidosFiliais.ParamByName('requisitante').AsInteger :=
      qryPedidosFiliaisrequisitante.asInteger
  else
    qryConsultaPedidosFiliais.ParamByName('requisitante').AsInteger :=
      FilialBase;

end;

end.
