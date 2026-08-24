unit dmcancelamentopedidos;

interface

uses
  SysUtils, Classes, Variants, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ctconstantes, biblio, dmtecsoft, clparametrossistema,
  ZTransact;

type
  TdtmCancelamentoPedidos = class(TdtmBasico)
    qryFornecedores: TtecQuery;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedoresnome: TStringField;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryPedidos: TtecQuery;
    dsrPedidos: TtecDataSource;
    qryCancelarPedidos: TtecQuery;
    qryPedidosnumero: TIntegerField;
    qryPedidosemissao: TDateField;
    qryPedidosnomefornecedor: TStringField;
    qryCancelarPedidoscancelado: TDateField;
    qryCancelarPedidosmotivo: TIntegerField;
    qryConsultaFornecedoresnome: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryConsultaFornecedorespessoanumero: TStringField;
    qryMotivos: TtecQuery;
    qryConsultaMotivos: TtecQuery;
    dsrMotivos: TtecDataSource;
    qryMotivoscodigo: TIntegerField;
    qryMotivosdescricao: TStringField;
    qryConsultaMotivosdescricao: TStringField;
    qryConsultaMotivoscodigo: TIntegerField;
    qryPedidosfornecedor: TIntegerField;
    qryProdutosPedidos: TtecQuery;
    dsrProdutosPedidos: TtecDataSource;
    qryProdutosPedidospedido: TIntegerField;
    qryProdutosPedidosproduto: TLargeintField;
    qryProdutosPedidosquantidade: TFloatField;
    qryProdutosPedidosrecebido: TFloatField;
    qryProdutosPedidosdescricao: TStringField;
    qryPedidosvalor: TFloatField;
    qryPedidoscancelado: TDateField;
    qryPedidosmotivo: TIntegerField;
    qryCancelarPedidosnumero: TIntegerField;
    qryDocumentosPag: TtecQuery;
    qryDocumentosPagnumero: TIntegerField;
    qryDocumentosPagfornecedor: TIntegerField;
    qryDocumentosPagtipofornecedor: TStringField;
    qryDocumentosPagemissao: TDateField;
    qryDocumentosPagfilialemissao: TIntegerField;
    qryDocumentosPagprevisao: TBooleanField;
    qryDocumentosPagvalor: TFloatField;
    qryDocumentosPagpedido: TIntegerField;
    qryDuplicatas: TtecQuery;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryPedidossituacao: TStringField;
    qryCancelarPedidossituacao: TStringField;
    qryPedidoscancelar: TBooleanField;
    qryConsultaFornecedoresestado: TStringField;
    qryConsultaFornecedoresnomecidade: TStringField;
    qryProdutosPedidosvalorgrade1: TStringField;
    qryProdutosPedidosvalorgrade2: TStringField;
    qryProdutosPedidoslinha: TStringField;
    qryProdutosPedidoscoluna: TStringField;
    qryProdutosPedidosprodutovisual: TStringField;
    procedure qryPedidosAfterScroll(DataSet: TDataSet);
    procedure qryProdutosPedidosAfterScroll(DataSet: TDataSet);
  private
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    function GetSituacao: String;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
  protected
    FEmissaoFinal: String;
    FEmissaoInicial: String;
    function  GetConsultaMotivos: TtecQuery;
    procedure MontaDataEmissao;
    function  GetConsultaFornecedores: TtecQuery;
    procedure SetEmissaoFinal(const Value: String);
    procedure SetEmissaoInicial(const Value: String);
    procedure SetFornecedor(const Value: String);
    procedure SetPedido(const Value: String);
    procedure SetEntregues(const Value: Byte);
  public
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure CancelarPedidos;
    procedure ZerarConsultaPedidos;
    function  SelecionarPedidos: Boolean;
    function  ExisteFornecedores(Campo, Codigo: String): Boolean;
    function  ExisteMotivos(Campo, Codigo: String): Boolean;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecCancelamentoPedidos);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecCancelamentoPedidos);
    procedure Selecionar(TipoPesquisa: TtecCancelamentoPedidos);
    constructor Create(AOwner: TComponent); Override;

    property ConsultaFornecedores: TtecQuery read GetConsultaFornecedores;
    property ConsultaMotivos: TtecQuery read GetConsultaMotivos;
    property EmissaoInicial: String read FEmissaoInicial write SetEmissaoInicial;
    property EmissaoFinal: String read FEmissaoFinal write SetEmissaoFinal;
    property Fornecedor: String write SetFornecedor;
    property Pedido: String write SetPedido;
    property Entregues: Byte write SetEntregues;
    property Situacao: String read GetSituacao;
    property  OnScrollLinhaColunaGrade    : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;

  end;

implementation

const
      WhereBase = 17;
      WhereEmissao    = WhereBase + 1;
      WhereFornecedor = WhereBase + 2;
      WherePedido     = WhereBase + 3;
      WhereEntregues  = WhereBase + 4;

{$R *.dfm}

{ TdtmCancelamentoQuitacao }

procedure TdtmCancelamentoPedidos.AbreTabelaPesquisa(TipoPesquisa: TtecCancelamentoPedidos);
begin
  case TipoPesquisa of
    tcpFORNECEDORES: Abre(ctConsultaFornecedores);
    tcpMOTIVOS     : Abre(ctPedidosConsultaMotivo);
  end;
end;

procedure TdtmCancelamentoPedidos.CancelarPedidos;
begin
  try
    qryPedidos.DisableControls;
    qryPedidos.First;
    while not qryPedidos.Eof do begin
      if qryPedidoscancelar.AsBoolean then begin
        ReFazConsulta(qryCancelarPedidos,[0],[qryPedidosnumero.AsInteger]);
        if not qryCancelarPedidos.IsEmpty then begin
          qryCancelarPedidos.Edit;
          if qryCancelarPedidossituacao.AsString = 'P' then
            qryCancelarPedidossituacao.AsString := 'Q'
          else
            qryCancelarPedidossituacao.AsString   := 'C';
          qryCancelarPedidoscancelado.AsDateTime:= DataServidor;
          qryCancelarPedidosmotivo.AsInteger    := qryMotivoscodigo.AsInteger;
          qryCancelarPedidos.Post;

          ReFazConsulta(qryDocumentosPag,[0],[qryPedidosnumero.AsInteger]);
          if not qryDocumentosPag.IsEmpty then begin
            ReFazConsulta(qryDuplicatas,[0],[qryDocumentosPagnumero.AsInteger]);
            if not qryDuplicatas.IsEmpty then begin
              while not qryDuplicatas.Eof do
                qryDuplicatas.Delete;
            end;
            qryDocumentosPag.Delete;
          end;
          Perpetrar([qryDuplicatas, qryDocumentosPag, qryCancelarPedidos]);
        end;
      end;
      qryPedidos.Next;
    end;
  finally
    qryPedidos.EnableControls;
    SelecionarPedidos;
  end;
end;

constructor TdtmCancelamentoPedidos.Create(AOwner: TComponent);
begin
  inherited;
  qryFornecedores.Tag          := ctTabelas;
  qryMotivos.Tag               := ctTabelas;
  qryConsultaFornecedores.Tag  := ctConsultaFornecedores;
  qryConsultaMotivos.Tag       := ctPedidosConsultaMotivo;
  qryProdutosPedidosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosPedidosrecebido.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

function TdtmCancelamentoPedidos.ExisteFornecedores(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFornecedores, Campo, Codigo);
end;

procedure TdtmCancelamentoPedidos.FechaTabelaPesquisa(TipoPesquisa: TtecCancelamentoPedidos);
begin
  case TipoPesquisa of
    tcpFORNECEDORES: Fecha(ctConsultaFornecedores);
    tcpMOTIVOS     : Fecha(ctPedidosConsultaMotivo);
  end;  
end;

function TdtmCancelamentoPedidos.GetConsultaFornecedores: TtecQuery;
begin
  Result:= qryConsultaFornecedores;
end;

procedure TdtmCancelamentoPedidos.MontaDataEmissao;
const
  Data_1: String = 'and (p.emissao = ';
  Data_2: String = 'and (p.emissao between (';
begin
  if not DataEmBranco(FEmissaoInicial) then begin
    if DataEmBranco(FEmissaoFinal) then
         qryPedidos.Sql[WhereEmissao]:= Data_1 + '''' + FEmissaoInicial + ''')'
    else qryPedidos.Sql[WhereEmissao]:= Data_2 + '''' + FEmissaoInicial + ''') and (''' + FEmissaoFinal + '''))';
  end
  else begin
    if not DataEmBranco(FEmissaoFinal) then
         qryPedidos.Sql[WhereEmissao]:= Data_1 + '''' + FEmissaoFinal + ''')'
    else qryPedidos.Sql[WhereEmissao]:= '';
  end;
end;

procedure TdtmCancelamentoPedidos.Selecionar(TipoPesquisa: TtecCancelamentoPedidos);
begin
  case TipoPesquisa of
    tcpFORNECEDORES: ReFazConsulta(qryFornecedores,[0],[qryConsultaFornecedorescodigo.AsInteger]);
    tcpMOTIVOS     : ReFazConsulta(qryMotivos,[0],[qryConsultaMotivoscodigo.AsInteger]);
  end;
end;

function TdtmCancelamentoPedidos.SelecionarPedidos: Boolean;
begin
  QtdeMarcados := 0;
  qryPedidos.Close;
  qryPedidos.Open;
  Result:= qryPedidos.IsEmpty;
end;

procedure TdtmCancelamentoPedidos.SetFornecedor(const Value: String);
begin
  if (Value <> '') then
       qryPedidos.Sql[WhereFornecedor]:= 'and (p.fornecedor = ' + Value + ')'
  else qryPedidos.Sql[WhereFornecedor]:= '';
end;

procedure TdtmCancelamentoPedidos.SetEmissaoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FEmissaoFinal := Value
  else FEmissaoFinal := '';
  MontaDataEmissao;
end;

procedure TdtmCancelamentoPedidos.SetEmissaoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FEmissaoInicial := Value
  else FEmissaoInicial := '';
  MontaDataEmissao;
end;

procedure TdtmCancelamentoPedidos.ZerarConsultaPedidos;
begin
  qryPedidos.Close;
end;

procedure TdtmCancelamentoPedidos.qryPedidosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryProdutosPedidos,[0],[qryPedidosnumero.AsInteger]);
end;

procedure TdtmCancelamentoPedidos.SetPedido(const Value: String);
begin
  if (Value <> '') then
       qryPedidos.Sql[WherePedido]:= 'and (p.numero = ' + Value + ')'
  else qryPedidos.Sql[WherePedido]:= '';
end;

procedure TdtmCancelamentoPedidos.SetEntregues(const Value: Byte);
begin
  case Value of
    0: qryPedidos.Sql[WhereEntregues]:= 'and (p.situacao = ''A'')';
    1: qryPedidos.Sql[WhereEntregues]:= 'and (p.situacao = ''P'')';
    2: qryPedidos.Sql[WhereEntregues]:= 'and (p.situacao in (''A'',''P''))' ;
  end;
end;

procedure TdtmCancelamentoPedidos.MarcarSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryPedidos, qryPedidoscancelar, qryPedidosvalor, Marcando, Todos);
end;

function TdtmCancelamentoPedidos.ExisteMotivos(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaMotivos, Campo, Codigo);
end;

function TdtmCancelamentoPedidos.GetConsultaMotivos: TtecQuery;
begin
  Result:= qryConsultaMotivos;
end;

function TdtmCancelamentoPedidos.GetSituacao: String;
begin
  Result:= qryPedidossituacao.AsString;
end;

function TdtmCancelamentoPedidos.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosPedidoscoluna.AsString)
end;

function TdtmCancelamentoPedidos.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosPedidoslinha.AsString)
end;

procedure TdtmCancelamentoPedidos.qryProdutosPedidosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGrade) then
    FOnScrollLinhaColunaGrade(DataSet)
end;

end.
