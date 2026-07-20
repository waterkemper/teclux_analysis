unit dmcancelamentoreservas;

interface

uses
  SysUtils, Classes, DB, Forms,
  // Constantes
  ctconstantes, biblio, clusuario,
  // Componentes
  cpquery, cpdatasource,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Repositorio
  dmbasico, dmtecsoft;

type
  TdtmCancelamentoReservas = class(TdtmBasico)
    qryVendedores: TtecQuery;
    dsrVendedores: TtecDataSource;
    qryConsultaVendedores: TtecQuery;
    qryReservas: TtecQuery;
    dsrReservas: TtecDataSource;
    qryVendedorescodigo: TIntegerField;
    qryVendedoresnome: TStringField;
    qryConsultaVendedorescodigo: TIntegerField;
    qryConsultaVendedoresnome: TStringField;
    qryMovimentos: TtecQuery;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosreferencia: TStringField;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentosdata: TDateField;
    qryEstoqueBloqueio: TtecQuery;
    qryEstoqueBloqueioproduto: TLargeintField;
    qryEstoqueBloqueiofilial: TIntegerField;
    qryEstoqueBloqueioemestoque: TFloatField;
    qryEstoqueBloqueioreservado: TFloatField;
    qryEstoqueBloqueiofuturo: TFloatField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
    qryProdutosReservas: TtecQuery;
    qryProdutosReservasnumero: TIntegerField;
    qryProdutosReservasquantidade: TFloatField;
    qryProdutosReservasreserva: TIntegerField;
    qryReservasnumero: TIntegerField;
    qryReservasfilial: TIntegerField;
    qryReservasdata: TDateTimeField;
    qryReservascliente: TStringField;
    qryReservasvalidade: TDateTimeField;
    qryReservasnomevendedor: TStringField;
    qryReservasselecionar: TBooleanField;
    qryProdutosReservasfilial: TIntegerField;
    qryProdutosReservasfuturo: TFloatField;
    qryReservascancelado: TDateTimeField;
    qryReservasvaloraux: TFloatField;
    qryProdutosReservasproduto: TLargeintField;
    qryReservasusuario: TIntegerField;
    qryEstoques: TtecQuery;
    qryEstoquesemestoque: TFloatField;
    qryEstoquesreservado: TFloatField;
    qryEstoquesfuturo: TFloatField;
    qryEstoquesreservaprevia: TFloatField;
    qryProdutosReservascomposto: TBooleanField;
  protected
    procedure CancelarReservas;
    function  GetConsultarVendedor: TtecQuery;
    function  GetQtdeReservas: Integer;
    procedure SetDataEmissao(const Value: String);
    procedure SetVendedor(const Value: String);
  public
    procedure AbreTabelaConsulta;
    function  AbrirConsultaContratos: Boolean;
    procedure ConfirmaOperacao;
    constructor Create(AOwner: TComponent); Override;
    function  ExisteVendedor(Campo, Codigo: string): Boolean;
    procedure FecharConsultaReservas;
    procedure FechaTabelaConsulta;
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure Selecionar;

    property  ConsultarVendedor: TtecQuery read GetConsultarVendedor;
    property  DataEmissao: String write SetDataEmissao;
    property  QtdeReservas: integer read GetQtdeReservas;
    property  Vendedor: String write SetVendedor;
  end;

const
  WhereBase = 13;
  WhereVendedor = WhereBase + 1;
  WhereEmissao  = WhereBase + 2;

implementation

{$R *.dfm}

procedure TdtmCancelamentoReservas.AbreTabelaConsulta;
begin
  Abre(ctVendaTabelaConsultaVendedores);
end;

function TdtmCancelamentoReservas.AbrirConsultaContratos: Boolean;
begin
  if qryReservas.Active then
    qryReservas.Close;
  QtdeMarcados := 0;
  TotalMarcados:= 0;
  qryReservas.Open;
  Result:= qryReservas.IsEmpty;
end;

procedure TdtmCancelamentoReservas.CancelarReservas;
var
  SituacaoProduto : TtecComposicao;
  Pos: TBookmark;
  procedure BloquearEstoque;
  var WhereSQL: String;
  begin
    qryProdutosReservas.DisableControls;
    try
      if qryProdutosReservas.RecordCount = 0 then
        WhereSQL := 'false'
      else begin
        WhereSQL := '';
        qryProdutosReservas.First;

        while not qryProdutosReservas.Eof do begin
          WhereSQL := WhereSQL +
          '((e.produto = ' + qryProdutosReservasproduto.AsString + ')and' +
          '(e.filial = '   + qryProdutosReservasfilial.AsString  + '))or';
          qryProdutosReservas.Next
        end;

        Delete(WhereSQL, Length(WhereSQL) - 1, 2);
      end
    finally
      qryProdutosReservas.EnableControls
    end;

    qryEstoqueBloqueio.Sql[07]:= WhereSQL;
    qryEstoqueBloqueio.Open;
  end;

  procedure GerarMovimento(tipo:String; quantidade:Currency);
  begin
    if not qryMovimentos.Active then
      qryMovimentos.Open;

    qryMovimentos.Append;
    spcMovimentosProximo.Open;
    qryMovimentosnumero.AsInteger  := spcMovimentosProximonumero.AsInteger;
    spcMovimentosProximo.Close;
    qryMovimentosproduto.AsLargeInt := qryProdutosReservasproduto.AsLargeInt;
    qryMovimentosfilial.AsInteger  := qryProdutosReservasfilial.Value;
    qryMovimentosdata.AsDateTime := DataHoraLocal;
    qryMovimentostipomovimento.AsString := tipo;
    qryMovimentosquantidade.AsCurrency := quantidade;
    qryMovimentosreferencia.AsString := 'RS ' + qryReservasnumero.AsString + ' CANCELADO';
    qryMovimentos.Post;
  end;

  function Autorizado(usuarioreserva:Integer): Boolean;
  var
    UsrAut: TtecUsuarios;
    Complemento: String;
  begin
    Result:=False;
    if ((UsuarioLogin.CodigoUsuario=UsuarioReserva) or (UsuarioLogin.PermiteExcluirReserva)) then
      Result:=True
    else
    begin
      Complemento := '';
      UsrAut := ObterAutorizacao(taLOGIN, 'Para o cancelamento da reserva', 'USUARIO AUTORIZADO', Complemento);
      Result := Assigned(UsrAut) and UsrAut.PermiteExcluirReserva;
      if Assigned(UsrAut) and Not UsrAut.PermiteExcluirReserva then
      begin
        MensagemAviso(ctUSUARIOSEMPERMISSAO);
        Result := False
      end
      else
        Result := True
    end;
  end;

begin
  if MensagemConfirmacao(Format(ctOPERACOESRESERVAS,['o CANCELAMENTO'])) = smbOk then
  begin
    try
      qryReservas.DisableControls;
      qryReservas.First;
      while not qryReservas.Eof do
      begin
        if (qryReservasselecionar.AsBoolean and Autorizado(qryReservasusuario.AsInteger)) then
        begin
          Pos:= qryReservas.GetBookmark;
          try
            RefazConsulta(qryProdutosReservas,[0],[qryReservasnumero.AsInteger]);
            if not qryProdutosReservas.IsEmpty then
            begin
              BloquearEstoque;
              for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do begin
                qryProdutosReservas.First;
                while not qryProdutosReservas.Eof do
                begin
                  if FiltrarComposto(qryProdutosReservascomposto.AsBoolean, SituacaoProduto) then
                  begin
                    GerarMovimento('TPE',qryProdutosReservasquantidade.AsCurrency);
                    RefazConsulta(qryEstoques,[0,1],[qryProdutosReservasproduto.AsLargeint, qryProdutosReservasfilial.AsInteger]);
                    if qryEstoquesfuturo.AsCurrency > 0 then
                    begin
                      if qryProdutosReservasquantidade.AsCurrency <= qryEstoquesfuturo.AsCurrency then
                        GerarMovimento('TFR',qryProdutosReservasquantidade.AsCurrency)
                      else
                        GerarMovimento('TFR',qryEstoquesfuturo.AsCurrency);
                    end;
                  end;
                  qryProdutosReservas.Next;
                end;
              end;
              qryReservas.Edit;
              qryReservascancelado.AsDateTime:= DataServidor;
              qryReservas.Post;
              Perpetrar([qryReservas, qryMovimentos]);
            end;
          finally
            qryReservas.GotoBookmark(Pos);
            qryReservas.FreeBookmark(Pos);
          end;
        end;
        qryReservas.Next;
      end;
    finally
      qryReservas.EnableControls;
      AbrirConsultaContratos;
    end;
  end;
end;

procedure TdtmCancelamentoReservas.ConfirmaOperacao;
//var Usuario: TtecUsuarios;
begin
  {Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
  try
    if Assigned(Usuario) and Usuario.PermiteExcluirReserva then
       CancelarReservas
    else
       MensagemAviso(format(ctUSUARIONAOAUTORIZADO,['cancelamento de reservas.']));
  finally
    Usuario.Free;
  end;}
  CancelarReservas;
end;

constructor TdtmCancelamentoReservas.Create(AOwner: TComponent);
begin
  inherited;
  qryVendedores.Tag         := ctTabelas;
  qryConsultaVendedores.Tag := ctVendaTabelaConsultaVendedores;

  qryVendedores.ParamByName('dataemissao').asdatetime:=DataServidor - 10;
  qryConsultaVendedores.ParamByName('dataemissao').asdatetime:=DataServidor - 10;

end;

function TdtmCancelamentoReservas.ExisteVendedor(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaVendedores,Campo,Codigo);
end;

procedure TdtmCancelamentoReservas.FecharConsultaReservas;
begin
  qryReservas.Close;
  QtdeMarcados := 0;
  TotalMarcados:= 0;
end;

procedure TdtmCancelamentoReservas.FechaTabelaConsulta;
begin
  Fecha(ctVendaTabelaConsultaVendedores);
end;

function TdtmCancelamentoReservas.GetConsultarVendedor: TtecQuery;
begin
  Result := qryConsultaVendedores;
end;

function TdtmCancelamentoReservas.GetQtdeReservas: Integer;
begin
  Result:= qryReservas.RecordCount;
end;

procedure TdtmCancelamentoReservas.MarcarSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryReservas,
                  qryReservasselecionar,
                  qryReservasvaloraux,
                  Marcando,
                  Todos);
end;

procedure TdtmCancelamentoReservas.Selecionar;
begin
  ReFazConsulta(qryVendedores,[0],[qryConsultaVendedorescodigo.AsInteger]);
end;

procedure TdtmCancelamentoReservas.SetDataEmissao(const Value: String);
begin
  if Value <> '' then qryReservas.Sql[WhereEmissao] := 'and (cast(r.data as date) <= ''' + Value + ''')'
  else                qryReservas.Sql[WhereEmissao] := '';
end;

procedure TdtmCancelamentoReservas.SetVendedor(const Value: String);
begin
  if Value <> '' then qryReservas.Sql[WhereVendedor] := 'and (r.usuario = ' + Value + ')'
                 else qryReservas.Sql[WhereVendedor] := '';
end;

end.
