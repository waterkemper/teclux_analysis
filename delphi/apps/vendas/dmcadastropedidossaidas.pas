unit dmcadastropedidossaidas;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, clparametrossistema, biblio, ctconstantes, Forms, DateUtils,
  ZTransact, clUsuario;

type
  Tdtmcadastropedidossaidas = class(TdtmBasico)
    qryProdutosPedidosSaida: TtecQuery;
    qryPedidosSaida: TtecQuery;
    dsrPedidosSaida: TtecDataSource;
    dsrProdutosPedidosSaida: TtecDataSource;
    qryPedidosSaidanumero: TIntegerField;
    qryPedidosSaidadata: TDateField;
    qryPedidosSaidapedidocliente: TStringField;
    qryPedidosSaidacliente: TIntegerField;
    qryProdutosPedidosSaidapedidosaida: TIntegerField;
    qryProdutosPedidosSaidaproduto: TLargeintField;
    qryProdutosPedidosSaidadescricao: TStringField;
    qryProdutosPedidosSaidaunidade: TStringField;
    qryProdutosPedidosSaidaosp: TIntegerField;
    qryProdutosPedidosSaidanumero: TIntegerField;
    qryProdutosPedidosSaidaquantidade: TFloatField;
    qryProdutosPedidosSaidapreco: TFloatField;
    qryProdutosPedidosSaidaqtdeentregue: TFloatField;
    qryProdutosPedidosSaidasaldo: TCurrencyField;
    spcPedidosSaidaProximo: TtecQuery;
    spcPedidosSaidaProximonumero: TIntegerField;
    qryProdutosPedidosSaidaprodutovisual: TStringField;
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto: TLargeintField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutosorigem: TStringField;
    dsrClientesProdutos: TtecDataSource;
    qryPedidosSaidanome: TStringField;
    qryProdutosPedidosSaidaprodutovalidado: TBooleanField;
    procedure qryPedidosSaidaAfterScroll(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryProdutosPedidosSaidaAfterOpen(DataSet: TDataSet);
    procedure qryProdutosPedidosSaidaAfterInsert(DataSet: TDataSet);
    procedure qryProdutosPedidosSaidaNewRecord(DataSet: TDataSet);
    procedure qryPedidosSaidaNewRecord(DataSet: TDataSet);
    procedure qryProdutosPedidosSaidaCalcFields(DataSet: TDataSet);
    procedure dsrPedidosSaidaDataChange(Sender: TObject; Field: TField);
    procedure qryProdutosPedidosSaidaAfterPost(DataSet: TDataSet);
    procedure qryProdutosPedidosSaidaAfterScroll(DataSet: TDataSet);
    procedure qryProdutosPedidosSaidaAfterEdit(DataSet: TDataSet);
    procedure qryClientesProdutosAfterPost(DataSet: TDataSet);
    procedure qryProdutosPedidosSaidaAfterDelete(DataSet: TDataSet);
  private
    FListaProdutosSelecionados: String;
    FNrSequenciaProduto: integer;
    FOnProdutosPedidosSaidaNewRecord: TNotifyEvent;
    FProdutosPedidosSaidaAfterPost: TNotifyEvent;
    { Private declarations }
  protected
    procedure AtualizaListaItemProdutos;

  public
    { Public declarations }
    Percorrendo : Boolean;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    property ListaProdutosSelecionados: String read FListaProdutosSelecionados write FListaProdutosSelecionados;
    procedure ExcluirOSP;
    procedure ExcluirProdutosPedidosSaida;
    procedure IncluirPedidoSaida;
    function GravarOSP: Boolean;
    property NrSequenciaProduto: integer read FNrSequenciaProduto write FNrSequenciaProduto;
    procedure SalvarProdutoProdutosPedidos;
    function SalvarProdutosPedidos: boolean;
    procedure CancelarProdutosPedidos;
    property onProdutosPedidosSaidaNewRecord : TNotifyEvent read FOnProdutosPedidosSaidaNewRecord write FOnProdutosPedidosSaidaNewRecord;
    property ProdutosPedidosSaidaAfterPost:  TNotifyEvent read FProdutosPedidosSaidaAfterPost write FProdutosPedidosSaidaAfterPost;
    function ExisteProdutonoCliente: boolean;
    procedure IncluirProdutoCliente;
    procedure LimparProdutosPedidosSaida;
    function RegistrodeProdutosInCompletos: boolean;
    function TodosRegistrodeProdutosInCompletos: boolean;
    procedure EditarPedido;
    procedure EditarProdutosPedidos;

  end;

var
  dtmcadastropedidossaidas: Tdtmcadastropedidossaidas;

implementation

{$R *.dfm}

{ Tdtmcadastropedidossaidas }

constructor Tdtmcadastropedidossaidas.Create(AOwner: TComponent);
begin
  inherited;
  qryPedidosSaida.Tag := ctTabelas;
  qryProdutosPedidosSaida.Tag := ctTabelas;
//  refazconsulta(qryOSP,[0], [0]);
  qryProdutosPedidosSaidaquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosPedidosSaidaqtdeentregue.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosPedidosSaidasaldo.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  Percorrendo := False;
  ListaProdutosSelecionados := '0';
end;

destructor Tdtmcadastropedidossaidas.Destroy;
begin

  inherited;
end;

procedure Tdtmcadastropedidossaidas.ExcluirOSP;
begin
  if not qryPedidosSaida.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o PEDIDO'])) = smbOk) then
    begin
       qryPedidosSaida.Delete;
       Perpetrar([qryPedidosSaida]);
    end;
end;

function Tdtmcadastropedidossaidas.GravarOSP: Boolean;
var
  NumeroOSPGerado : integer;
  ProdutoVinculado: Boolean;

  function AtribuirNumeroPedidonoProduto: Boolean;
  begin
    result := true;
    if qryPedidosSaidanumero.IsNull then
    begin
      spcPedidosSaidaProximo.Open;
      qryPedidosSaidanumero.AsString := spcPedidosSaidaProximonumero.AsString;
      spcPedidosSaidaProximo.Close;
    end;

    GuardarRegistroAtual(qryProdutosPedidosSaida,true);
    qryProdutosPedidosSaida.First;
    while not qryProdutosPedidosSaida.Eof do
    begin
      if qryProdutosPedidosSaidapedidosaida.IsNull then
      begin
        qryProdutosPedidosSaida.Edit;
        qryProdutosPedidosSaidapedidosaida.AsString := qryPedidosSaidanumero.AsString;
        qryProdutosPedidosSaida.Post;
      end;
      result := qryProdutosPedidosSaida.CheckRequiredFields;
      if not result then
        break;
      qryProdutosPedidosSaida.Next;
    end;
    VoltarRegistroAtual(qryProdutosPedidosSaida);
  end;

begin
  result := false;
  ProdutoVinculado := false;
  if (qryPedidosSaida.CheckRequiredFields) then
  begin
    if salvarProdutosPedidos then
    begin
      if not qryProdutosPedidosSaida.IsEmpty then
      begin
        if AtribuirNumeroPedidonoProduto then
        begin
          qryPedidosSaida.Post;
          result := Perpetrar([qryPedidosSaida, qryProdutosPedidosSaida, qryClientesProdutos]);
        end;
      end
      else
        MensagemAviso(ctNAOEXISTEMITENSCADASTRADOS)
    end;
  end;
end;

procedure Tdtmcadastropedidossaidas.IncluirPedidoSaida;
begin
  qryPedidosSaida.Insert;
end;


procedure Tdtmcadastropedidossaidas.qryPedidosSaidaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryPedidosSaidadata.ReadOnly :=  not qryPedidosSaidanumero.isnull;
  qryPedidosSaidacliente.ReadOnly :=  not qryPedidosSaidanumero.isnull;
  qryPedidosSaidapedidocliente.ReadOnly :=  not qryPedidosSaidanumero.isnull;

  ReFazConsulta(qryProdutosPedidosSaida,[0],[qryPedidosSaidanumero.AsVariant]);
  ReFazConsulta(qryClientesProdutos,[0],[qryPedidosSaidacliente.Asinteger]);

end;

procedure Tdtmcadastropedidossaidas.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\osp.sql') then
    Listar.loadfromfile('c:\osp.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\osp.sql');
  listar.free;
end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AtualizaListaItemProdutos;

end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if qryPedidosSaidacliente.IsNull then
  begin
    MensagemAviso(ctCLIENTENAOINFORMADO);
    qryProdutosPedidosSaida.Cancel;
  end;
end;


procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryProdutosPedidosSaidanumero.AsInteger := NrSequenciaProduto;
  qryProdutosPedidosSaidaprodutovalidado.AsBoolean := false;

  if not qryPedidosSaidanumero.IsNull then
    qryProdutosPedidosSaidapedidosaida.AsString := qryPedidosSaidanumero.AsString;

  if Assigned(OnProdutosPedidosSaidaNewRecord) then
    OnProdutosPedidosSaidaNewRecord(qryProdutosPedidosSaida);

end;

function Tdtmcadastropedidossaidas.SalvarProdutosPedidos: boolean;
begin
  result := true;
  if (qryProdutosPedidosSaida.State in [dsedit, dsinsert]) then
  begin
    if qryProdutosPedidosSaida.CheckRequiredFields then
      qryProdutosPedidosSaida.Post
    else
      result := false;
  end;
end;

procedure Tdtmcadastropedidossaidas.SalvarProdutoProdutosPedidos;
begin
  if (qryProdutosPedidosSaida.State in [dsedit, dsinsert]) then
     qryProdutosPedidosSaida.Post;
end;


procedure Tdtmcadastropedidossaidas.CancelarProdutosPedidos;
begin
  qryProdutosPedidosSaida.Cancel;
  if not qryProdutosPedidosSaidaprodutovalidado.AsBoolean then
    if not qryProdutosPedidosSaida.IsEmpty then
       qryProdutosPedidosSaida.Delete;
end;

procedure Tdtmcadastropedidossaidas.qryPedidosSaidaNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryPedidosSaidadata.AsDateTime := DataServidor;
end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not qryProdutosPedidosSaidaqtdeentregue.IsNull then
    qryProdutosPedidosSaidasaldo.AsCurrency := qryProdutosPedidosSaidaquantidade.AsCurrency -
                                         qryProdutosPedidosSaidaqtdeentregue.AsCurrency
  else
    qryProdutosPedidosSaidasaldo.AsCurrency := qryProdutosPedidosSaidaquantidade.AsCurrency;
end;

procedure Tdtmcadastropedidossaidas.dsrPedidosSaidaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryPedidosSaidacliente then
    ReFazConsulta(qryClientesProdutos,[0],[qryPedidosSaidacliente.Asinteger]);

end;

function Tdtmcadastropedidossaidas.ExisteProdutonoCliente: boolean;
begin
  if qryProdutosPedidosSaidaprodutovisual.AsString<>'' then
    result := qryClientesProdutos.Locate('produto',qryProdutosPedidosSaidaproduto.AsString,[])
  else
    result := true;  
end;

procedure Tdtmcadastropedidossaidas.IncluirProdutoCliente;
begin
  qryClientesProdutos.Append;
  qryClientesProdutoscliente.AsInteger := qryPedidosSaidacliente.AsInteger;
  qryClientesProdutostipocliente.AsString := 'C';
  qryClientesProdutosproduto.AsString := qryProdutosPedidosSaidaproduto.AsString;
end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarPedido;
  AtualizaListaItemProdutos;
end;

procedure Tdtmcadastropedidossaidas.LimparProdutosPedidosSaida;
begin
   if not (qryProdutosPedidosSaida.State in [dsedit, dsinsert]) then
     qryProdutosPedidosSaida.Edit;
   qryProdutosPedidosSaidaproduto.Clear;
   qryProdutosPedidosSaidaprodutovisual.Clear;
   qryProdutosPedidosSaidadescricao.Clear;
   qryProdutosPedidosSaidaunidade.Clear;
end;

function Tdtmcadastropedidossaidas.RegistrodeProdutosinCompletos: boolean;
begin
  result := qryProdutosPedidosSaidaproduto.IsNull or
            qryProdutosPedidosSaidaprodutovisual.IsNull or
            qryProdutosPedidosSaidadescricao.IsNull or
            qryProdutosPedidosSaidaunidade.IsNull or
            qryProdutosPedidosSaidaquantidade.IsNull or
            qryProdutosPedidosSaidapreco.IsNull or
            qryProdutosPedidosSaidaquantidade.IsNull;
end;


function Tdtmcadastropedidossaidas.TodosRegistrodeProdutosInCompletos: boolean;
begin
  if (qryProdutosPedidosSaida.recordcount=0) then
    result := false
  else
    result := qryProdutosPedidosSaidaproduto.IsNull and
              qryProdutosPedidosSaidaprodutovisual.IsNull and
              qryProdutosPedidosSaidadescricao.IsNull and
              qryProdutosPedidosSaidaunidade.IsNull and
              qryProdutosPedidosSaidaquantidade.IsNull and
              qryProdutosPedidosSaidapreco.IsNull and
              qryProdutosPedidosSaidaquantidade.IsNull;
end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaAfterScroll(
  DataSet: TDataSet);
var
 i: integer;
begin
  inherited;
  if not qryProdutosPedidosSaida.IsEmpty then
    for i:=0 to qryProdutosPedidosSaida.FieldCount-1 do
      qryProdutosPedidosSaida.Fields[i].ReadOnly :=
          (qryProdutosPedidosSaidaosp.AsInteger <> 0) or
          (qryProdutosPedidosSaidaqtdeentregue.AsCurrency <> 0);
end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  if qryPedidosSaidacliente.IsNull then
  begin
    MensagemAviso(ctCLIENTENAOINFORMADO);
    qryProdutosPedidosSaida.Cancel;
  end;
end;

procedure Tdtmcadastropedidossaidas.EditarPedido;
begin
  if not (qryPedidosSaida.State in [dsedit, dsinsert]) then
    qryPedidosSaida.Edit;
end;

procedure Tdtmcadastropedidossaidas.qryClientesProdutosAfterPost(DataSet: TDataSet);
begin
  inherited;
  EditarPedido;
end;

procedure Tdtmcadastropedidossaidas.EditarProdutosPedidos;
begin
  if not (qryProdutosPedidosSaida.State in [dsedit, dsinsert]) then
    qryProdutosPedidosSaida.Edit;
end;

procedure Tdtmcadastropedidossaidas.AtualizaListaItemProdutos;
var
  Pos: TBookmark;
  Prod: Int64;
begin
  Pos := qryProdutosPedidosSaida.GetBookmark;
  qryProdutosPedidosSaida.DisableControls;
  try
    ListaProdutosSelecionados := '';
    NrSequenciaProduto := 0;
    Prod := qryProdutosPedidosSaidaproduto.AsLargeint;
    qryProdutosPedidosSaida.First;
    while Not qryProdutosPedidosSaida.Eof do
    begin
      if qryProdutosPedidosSaidanumero.AsInteger <> qryProdutosPedidosSaida.RecNo then
      begin
        qryProdutosPedidosSaida.Edit;
        qryProdutosPedidosSaidanumero.AsInteger := qryProdutosPedidosSaida.RecNo;
        qryProdutosPedidosSaida.Post;
      end;
      if qryProdutosPedidosSaidaproduto.AsString<>'' then
        ListaProdutosSelecionados := ListaProdutosSelecionados +
                                     qryProdutosPedidosSaidaproduto.AsString + ',';
      if qryProdutosPedidosSaidanumero.AsInteger > NrSequenciaProduto then
        NrSequenciaProduto := qryProdutosPedidosSaidanumero.AsInteger;
      qryProdutosPedidosSaida.Next
    end;

    NrSequenciaProduto := NrSequenciaProduto + 1;

    if ListaProdutosSelecionados <> '' then
      ListaProdutosSelecionados := copy(ListaProdutosSelecionados,0, Length(ListaProdutosSelecionados)-1)
    else
      ListaProdutosSelecionados := '0';

  finally
    qryProdutosPedidosSaida.GotoBookmark(Pos);
    qryProdutosPedidosSaida.FreeBookmark(Pos);
    qryProdutosPedidosSaida.EnableControls;
  end

end;

procedure Tdtmcadastropedidossaidas.qryProdutosPedidosSaidaAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarPedido;
  AtualizaListaItemProdutos;
end;

procedure Tdtmcadastropedidossaidas.ExcluirProdutosPedidosSaida;
begin
  if not qryProdutosPedidosSaida.IsEmpty then
    if not qryProdutosPedidosSaida.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a item de produto do pedido'])) = smbOk) then
         qryProdutosPedidosSaida.Delete;
end;

end.
