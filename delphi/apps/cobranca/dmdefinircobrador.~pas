unit dmdefinircobrador;
interface
uses  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB,
  Math, DateUtils, Variants,
  // Componentes
  cpquery,
  // Constantes
  ctConstantes, biblio, clfinanceira, cpdatasource, clusuario, clparametrossistema,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Repositorio
  dmtecsoft, dmbasico, dmimprimefichacobranca, ZTransact;

type
 TdtmDefinirCobrador = class(TdtmBasico)    qryConsultaClientes: TtecQuery;
    qryParcelas: TtecQuery;
    dsrParcelas: TtecDataSource;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryParcelascontrato: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelasdatapagto: TDateField;
    qryParcelasvalorpagto: TFloatField;
    qryParcelasfilialpagto: TIntegerField;
    qryParcelastipopagto: TStringField;
    qryParcelasdeventrada: TDateField;
    qryParcelasdevcaixa: TDateField;
    qryParcelasdevfilial: TIntegerField;
    qryParcelasincobravel: TDateField;
    qryParcelascopiapagto: TIntegerField;
    qryProcuraCobrador: TtecQuery;
    dsrProcuraCobrador: TtecDataSource;
    qryClientes: TtecQuery;
    dsrClientes: TtecDataSource;
    qryContratosPorCliente: TtecQuery;

   dsrContratosPorCliente: TtecDataSource;    qryClientescodigo: TIntegerField;
    qryClientesnome: TStringField;
    dsrProdutosContratos: TtecDataSource;
    qryProdutosContratos: TtecQuery;
    qryClientestipo: TStringField;
    qryConsultaClientestipo: TStringField;
    qryConsultaClientesdescricaotipo: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryProdutosContratosproduto: TLargeintField;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosquantidade: TFloatField;
    qryProdutosContratosnumero: TIntegerField;
    qryProdutosContratosprecovenda: TFloatField;
    qryProdutosContratosprecotabela: TFloatField;
    qryProdutosContratoscontrato: TStringField;
    qryProdutosContratosmontagem: TStringField;
    qryProdutosContratosentrega: TStringField;
    qryProdutosContratosnota: TBooleanField;
    qryProdutosContratoscancelado: TFloatField;
    qryProdutosContratosfuturo: TFloatField;
    qryProdutosContratosreserva: TIntegerField;
    qryProdutosContratosmovimento: TIntegerField;
    qryProdutosContratosbrinde: TBooleanField;
    qryProdutosContratosdescricaoprecovenda: TStringField;
    qryProdutosContratosnotasimplesremessa: TBooleanField;
    qryProdutosContratosprodutolista: TBooleanField;
    qryProdutosContratosvendedor: TIntegerField;
    qryProdutosContratosdescricao: TStringField;
    qryServicosContratos: TtecQuery;
    dsrServicosContratos: TtecDataSource;
    qryServicosContratoscontrato: TStringField;
    qryServicosContratosservico: TIntegerField;
    qryServicosContratosaliquotaissqn: TFloatField;
    qryServicosContratosvalorservico: TFloatField;
    qryServicosContratoscomplementoservico: TStringField;
    qryServicosContratosquantidade: TIntegerField;
    qryServicosContratosdescricaoservico: TStringField;
    qryServicosContratosdescricaoequipamento: TStringField;
    qryParcelasparcelaorigem: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryConsultaClientesestado: TStringField;
    qryParcelasparcelaadicional: TBooleanField;
    qryParcelaspagamentoextracaixa: TBooleanField;
    qryCobrancas: TtecQuery;
    dsrCobrancas: TtecDataSource;
    qryCobrancascontrato: TStringField;
    qryCobrancasdata: TDateField;
    qryCobrancasretorno: TDateField;
    qryCobrancasobservacao: TStringField;
    qryCobrancasusuario: TIntegerField;
    qryCobrancasnome: TStringField;
    qryContratosPorClientedata: TDateField;
    qryContratosPorClientefaturamento: TDateField;
    qryContratosPorClientefilialvenda: TIntegerField;
    qryContratosPorClientevendedor: TIntegerField;
    qryContratosPorClientevalorvista: TFloatField;
    qryContratosPorClientevalorprazo: TFloatField;
    qryContratosPorClienteorigem: TStringField;
    qryContratosPorClienterenegociado: TStringField;
    qryContratosPorClientenomeusuario: TStringField;
    qryContratosPorClientenomefilial: TStringField;
    qryContratosPorClienteplano: TStringField;
    qryContratosPorClientesituacao: TStringField;
    qryContratosPorClientenumero: TStringField;
    qryContratosPorClientesituacaocontrato: TStringField;
    qryConsultaCobrador: TtecQuery;
    qryConsultaCobradornome: TStringField;
    qryConsultaCobradorcodigo: TIntegerField;
    qryProcuraCobradornome: TStringField;
    qryProcuraCobradorcodigo: TIntegerField;
    qryProdutosContratoslinha: TStringField;
    qryProdutosContratoscoluna: TStringField;
    qryProdutosContratosvalorgrade1: TStringField;
    qryProdutosContratosvalorgrade2: TStringField;
    qryServicosContratosEquipamento: TStringField;
    procedure qryContratosPorClienteAfterScroll(DataSet: TDataSet);
    procedure qryClientesAfterClose(DataSet: TDataSet);
    procedure qryProcuraCobradorAfterOpen(DataSet: TDataSet);
    procedure qryProdutosContratosAfterScroll(DataSet: TDataSet);
  private
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
  protected
    FichaCobranca: TdtmImprimeFichaCobranca;
    FOperacao: TtecTipoOperacao;
    procedure AcertarNumeroParcelas;
    function  GetPodeImprimir: Boolean;
    function  GetConsultaCliente: TtecQuery;
    function  GetTipoCliente: String;
    function  GetTabelaCobranca: TtecQuery;
    function  GetConsultaCobrador: TtecQuery;
  public
    procedure AbrirTabelas(Procura: TtecCobranca);
    procedure FecharTabelas(Procura: TtecCobranca);
    procedure Selecionar(Procura: TtecCobranca);
    constructor Create(AOwner: TComponent); override;
    function  ExcluirContrato: Boolean;
    function  ExcluirParcelas: Boolean;
    function  ExisteCliente(NomeCampo, Value: Variant): Boolean;
    function  ExisteCobrador(NomeCampo, Value: Variant): Boolean;
    function  GravarRenegociacao: Boolean;
    function  GravarCobranca: Boolean;
    function  IncluirCobranca(Editando: Boolean): Boolean;
    function  ExcluirCobranca: Boolean;
    procedure ImprimirFichaCobranca;
    procedure LimparTabelas;
    procedure ReFazConsultaContratos;
    function  ReFazConsultaContratosPorCliente: Boolean;

    property ConsultaCliente: TtecQuery read GetConsultaCliente;
    property TipoCliente: String read GetTipoCliente;
    property TabelaCobranca: TtecQuery read GetTabelaCobranca;

    property ConsultaCobrador: TtecQuery read GetConsultaCobrador;    property PodeImprimir: Boolean read GetPodeImprimir;

    property  OnScrollLinhaColunaGrade    : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
 end;
implementation

{$R *.dfm}

{ TdtmDefinirCobrador }

procedure TdtmDefinirCobrador.AbrirTabelas(Procura: TtecCobranca);
begin
  case Procura of
    cobCLIENTES: begin
                   qryConsultaClientes.Sql[12]:= '(v.codigo = 0)';
                   qryConsultaClientes.Open;
                 end;
    cobCOBRADOR: qryConsultaCobrador.Open;
  end;
end;

constructor TdtmDefinirCobrador.Create(AOwner: TComponent);
begin
  inherited;
  qryClientes.Tag               := ctTabelas;
  qryConsultaClientes.Tag       := ctCrediarioConsultaClientes;
  qryClientes.Params[1].AsString:= 'C';
  qryProdutosContratosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

function TdtmDefinirCobrador.ExcluirContrato;
var
  Usuario: TtecUsuarios;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o CONTRATO'])) = smbok then begin
    try
      if UsuarioLogin.AnalistaCredito then
           Usuario:= ObterAutorizacao(taSENHA)
      else Usuario:= ObterAutorizacao(taLOGIN);
      if Assigned(Usuario) and Usuario.AnalistaCredito then begin
        qryParcelas.First;
        while not qryParcelas.Eof do
          qryParcelas.Delete;

        qryProdutosContratos.First;
        while not qryProdutosContratos.Eof do
          qryProdutosContratos.Delete;

        qryServicosContratos.First;
        while not qryServicosContratos.Eof do
          qryServicosContratos.Delete;

        Perpetrar([]);
        ReFazConsulta(qryContratosPorCliente,[0,1],
                     [qryClientesCodigo.AsInteger,qryClientestipo.AsVariant]);
        Result:= True;
      end
      else
        MensagemAviso(Format(ctUSUARIONAOAUTORIZADO,['a Exclusão do Contrato.']));
    except
    end;
  end;
end;

function TdtmDefinirCobrador.ExcluirParcelas: Boolean;
begin
  Result:= False;
  if (FOperacao in [tpTRANSFERENCIA, tpRENEGOCIACAO]) then begin
    if (qryParcelasdatapagto.AsDateTime = 0) then begin
      if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a PARCELA'])) = smbOk then begin
        qryParcelas.Delete;
        Result:= True;
      end
    end;
  end
  else
    MensagemAviso(ctPARCELANAOPODESEREXCLUIDA);
end;

function TdtmDefinirCobrador.ExisteCliente(NomeCampo, Value: Variant): boolean;
const
  SQL = '(to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
 if NomeCampo = 'nomecidade' then
   NomeCampo:= 'c.nome'
  else if NomeCampo = 'descricaotipo' then
    NomeCampo := 'v.tipo'
  else NomeCampo:= 'v.' + NomeCampo;
  qryConsultaClientes.Sql[12]:= Format(SQL, [NomeCampo, ANSIUpperCase(Value), '%']);
  qryConsultaClientes.Open;
  Result := Not qryConsultaClientes.IsEmpty
end;
procedure TdtmDefinirCobrador.FecharTabelas(Procura: TtecCobranca);
begin  case Procura of
    cobCLIENTES: Fecha(ctCrediarioConsultaClientes);
    cobCOBRADOR: qryConsultaCobrador.Close;
  end;
end;

function TdtmDefinirCobrador.GetConsultaCliente: TtecQuery;
begin
 Result:= qryConsultaClientes;
end;

function TdtmDefinirCobrador.GravarRenegociacao: Boolean;
var
  Usuario: TtecUsuarios;
begin
  Result:= False;
    try
      if UsuarioLogin.AnalistaCredito then
           Usuario:= ObterAutorizacao(taSENHA)
      else Usuario:= ObterAutorizacao(taLOGIN, ctPARARENEGOCIACAOCONTRATO, ctANALISTACREDITO);

      if Assigned(Usuario) then begin
        if Usuario.AnalistaCredito then begin
          Perpetrar([]);
          ReFazConsulta(qryContratosPorCliente,[0,1],
                       [qryClientesCodigo.AsInteger,qryClientestipo.AsVariant]);
          Result:= True;
        end
        else
          MensagemAviso(Format(ctUSUARIONAOAUTORIZADO,['a Renegociação.']));
      end;
    except
    end;
end;

procedure TdtmDefinirCobrador.LimparTabelas;

begin  qryParcelas.Close;
  qryProdutosContratos.Close;
  qryServicosContratos.Close;
  qryCobrancas.Close;
  qryContratosPorCliente.Close;
end;

procedure TdtmDefinirCobrador.qryContratosPorClienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryContratosPorCliente.IsEmpty then begin
    ReFazConsulta(qryParcelas,         [0],[qryContratosPorClienteNumero.AsString]);
    ReFazConsulta(qryProdutosContratos,[0],[qryContratosPorClienteNumero.AsString]);
    ReFazConsulta(qryServicosContratos,[0],[qryContratosPorClienteNumero.AsString]);
    ReFazConsulta(qryCobrancas,        [0],[qryContratosPorClienteNumero.AsString]);
  end;
end;

function TdtmDefinirCobrador.ReFazConsultaContratosPorCliente: Boolean;
begin
  ReFazConsulta(qryContratosPorCliente,[0,1],[qryClientesCodigo.AsInteger,qryClientestipo.AsString]);
  Result:= qryContratosPorCliente.IsEmpty;
  if Result then
    LimparTabelas;
end;

procedure TdtmDefinirCobrador.Selecionar(Procura: TtecCobranca);
begin
  case Procura of
    cobCLIENTES : begin
                    if qryClientes.Active then
                      qryClientes.Close;
                    qryClientes.Params[0].AsInteger:= qryConsultaClientesCodigo.AsInteger;
                    qryClientes.Params[1].AsString := qryConsultaClientestipo.AsString;
                    qryClientes.Open;
                  end;
    cobCOBRADOR : begin
                    qryCobrancas.Edit;
                    qryCobrancasusuario.AsInteger:= qryConsultaCobradorcodigo.AsInteger;
                  end;
  end;
end;

procedure TdtmDefinirCobrador.AcertarNumeroParcelas;
var
 I: Integer;
begin
 qryParcelas.DisableControls;
  try    I:= 1;
    qryParcelas.First;
    while not qryParcelas.Eof do begin
      qryParcelas.Edit;
      qryParcelasnumero.AsInteger := I;
      qryParcelas.Post;
      qryParcelas.Next;
     Inc(I);

   end;  finally
    qryParcelas.EnableControls;
  end;
end;
function TdtmDefinirCobrador.GetTipoCliente: String;
begin
  if qryClientes.Active then
       Result:= qryClientestipo.AsString
  else Result:= 'C';
end;

procedure TdtmDefinirCobrador.ReFazConsultaContratos;
begin
  ReFazConsulta(qryParcelas,         [0],[qryContratosPorClienteNumero.AsString]);
  ReFazConsulta(qryProdutosContratos,[0],[qryContratosPorClienteNumero.AsString]);  ReFazConsulta(qryServicosContratos,[0],[qryContratosPorClienteNumero.AsString]);
end;

procedure TdtmDefinirCobrador.qryClientesAfterClose(DataSet: TDataSet);
begin
  inherited;
  LimparTabelas;
end;

function TdtmDefinirCobrador.GetTabelaCobranca: TtecQuery;
begin
  Result:= qryCobrancas;
end;

function TdtmDefinirCobrador.ExcluirCobranca: Boolean;
begin
  Result:= False;
  if not qryCobrancas.IsEmpty then    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a COBRANÇA'])) = smbOk then begin
      qryCobrancas.Delete;
      Perpetrar([qryCobrancas]);
      Result:= True;
    end
end;


function TdtmDefinirCobrador.GravarCobranca: Boolean;
begin
  Result:= False;
  if qryCobrancas.CheckRequiredFields then begin
    qryCobrancas.Post;
    Perpetrar([qryCobrancas]);
    Result:= True;
  end;
end;

function TdtmDefinirCobrador.IncluirCobranca(Editando: Boolean): Boolean;
begin
  Result:= False;
  if not Editando or qryCobrancas.IsEmpty then begin
    qryCobrancas.Insert;
    qryCobrancascontrato.AsString:= qryContratosPorClientenumero.AsString;
    qryCobrancasdata.AsDateTime  := DataServidor;
    Result:= True;
  end
  else begin
    qryCobrancas.Edit;
    qryCobrancas.Cancel;
  end;
end;

function TdtmDefinirCobrador.ExisteCobrador(NomeCampo, Value: Variant): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaCobrador,NomeCampo, Value);
end;function TdtmDefinirCobrador.GetConsultaCobrador: TtecQuery;
begin
  Result:= qryConsultaCobrador;
end;
procedure TdtmDefinirCobrador.qryProcuraCobradorAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qryCobrancas.State = dsInsert then
    qryCobrancasnome.AsString:= qryProcuraCobradornome.AsString;
end;

procedure TdtmDefinirCobrador.ImprimirFichaCobranca;
begin
  FichaCobranca := TdtmImprimeFichaCobranca.Create(Self);
  try
    FichaCobranca.ImprimirFichaFinanceira(QuotedStr(qryContratosPorClientenumero.AsString));
  finally
    FichaCobranca.Free;
    FichaCobranca := nil;
  end;
end;

function TdtmDefinirCobrador.GetPodeImprimir: Boolean;
begin
  Result:= qryCobrancas.RecordCount > 0;
end;

function TdtmDefinirCobrador.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosContratoscoluna.AsString)
end;

function TdtmDefinirCobrador.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosContratoslinha.AsString)
end;

procedure TdtmDefinirCobrador.qryProdutosContratosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGrade) then
  FOnScrollLinhaColunaGrade(DataSet)
end;

end.
