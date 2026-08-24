unit dmacertarcarnesrenegociado;

interface

uses
  SysUtils, Classes, Forms, dmbasico, dmtecsoft,
  ZQuery, DB, ZPgSqlQuery, cpquery, cpdatasource, ctconstantes,
  biblio, clusuario;

type
  TdtmAcertarCarnesRenegociado = class(TdtmBasico)
    qryParcelas: TtecQuery;
    dsrParcelas: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientestipo: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryConsultaClientesestado: TStringField;
    dsrClientes: TtecDataSource;
    qryClientes: TtecQuery;
    qryContratosPorCliente: TtecQuery;
    qryContratosPorClientenumero: TStringField;
    qryContratosPorClientedata: TDateField;
    dsrContratosPorCliente: TtecDataSource;
    qryParcelascontrato: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelasdatapagto: TDateField;
    qryParcelasvalorpagto: TFloatField;
    qryParcelastipopagto: TStringField;
    qryParcelasobservacaoboleto: TStringField;
    qryParcelasquitado: TBooleanField;
    qryClientescodigo: TIntegerField;
    qryClientesnome: TStringField;
    qryClientestipo: TStringField;
    qryContratosPorClientevalor: TFloatField;
    qryContratosPorClientesituacaocontrato: TStringField;
    qryContratosPorClientenome: TStringField;
    qryContratosPorClienteplano: TStringField;
    qryParcelaspodequitar: TBooleanField;
    qryParcelasparcelaorigem: TStringField;
    qryParcelascartacliente: TIntegerField;
    qryParcelasspccliente: TIntegerField;
    qryParcelascartaavalista: TIntegerField;
    qryParcelasspcavalista: TIntegerField;
    qryConsultaClientestipocliente: TStringField;
    qryParcelasdescontosugerido: TFloatField;
    qryParcelaspagamentoextracaixa: TBooleanField;
    qryParcelasfilialpagto: TIntegerField;
    qryParcelasparcelaadicional: TBooleanField;
    qryParcelasliquido: TFloatField;
    qryParcelasjurosdesctos: TFloatField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelasContaBoleto: TIntegerField;
    qryParcelasDigito: TStringField;
    qryParcelasSiglaBanco: TStringField;
    qryParcelasNomeAgencia: TStringField;
    qryContas: TtecQuery;
    qryContasBanco: TIntegerField;
    qryContasAgencia: TIntegerField;
    qryContasConta: TIntegerField;
    qryContasDigito: TStringField;
    qryContasTitular: TStringField;
    qryContasSigla: TStringField;
    qryContasNome: TStringField;
    qryContasModeloCheque: TIntegerField;
    dsrContas: TtecDataSource;
    qryConsultaContas: TtecQuery;
    qryConsultaContasSigla: TStringField;
    qryConsultaContasNome: TStringField;
    qryConsultaContasConta: TIntegerField;
    qryConsultaContasDigito: TStringField;
    qryConsultaContasTitular: TStringField;
    qryConsultaContasAgencia: TIntegerField;
    qryConsultaContasBanco: TIntegerField;
    procedure qryClientesAfterOpen(DataSet: TDataSet);
    procedure qryContratosPorClienteAfterScroll(DataSet: TDataSet);
    procedure qryContratosPorClienteAfterClose(DataSet: TDataSet);
    procedure qryParcelasNewRecord(DataSet: TDataSet);
  protected
    function  GetDataContrato: TDateTime;
    function  GetTabelaParcelas: TtecQuery;
    function  GetConsultarCliente: TtecQuery;
    function  TotalParcelas: Currency;
    procedure RecalcularParcelaOrigem;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbrirTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
    procedure Selecionar(TipoConsulta: TtecQuitacaoExtraCaixa);
    procedure FecharTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
    function  ProcessarPagamento: Boolean;
    function  ExcluirParcela: Boolean;
    function  IncluirParcela: Boolean;
    function  ExisteCliente(campo, codigo: string): boolean;
    function  ExisteConta(campo, codigo: String): Boolean;
    property  ConsultarCliente: TtecQuery read GetConsultarCliente;
    property  TabelaParcelas: TtecQuery read GetTabelaParcelas;
    property  DataContrato: TDateTime read GetDataContrato;
  end;

var
  dtmAcertarCarnesRenegociado: TdtmAcertarCarnesRenegociado;

implementation

{$R *.dfm}

{ TdtmQuitacaoExtraCaixa }

procedure TdtmAcertarCarnesRenegociado.AbrirTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
begin
  case TipoConsulta of
    qecCLIENTE: begin
                  qryConsultaClientes.Sql[08]:= 'Where false';
                  qryConsultaClientes.Open;
                end;
{      qecBANCO: Abre(ctCaixaConsultaBanco);
    qecAGENCIA: begin
                  qryConsultarAgencias.Params[0].AsInteger:= qryProcurarBancocodigo.AsInteger;
                  qryConsultarAgencias.Open;
                end;}
  end;
end;

constructor TdtmAcertarCarnesRenegociado.Create(AOwner: TComponent);
begin
  inherited;
  qryClientes.Tag:= ctTabelas;
  qryContas.  Tag:= ctTabelas;

  qryConsultaClientes.Tag:= ctCaixaConsultaCliente;
  qryConsultaContas.  Tag:= ctConsultaContas;

  qryClientes.Params[01].AsString:= 'C';
end;

function TdtmAcertarCarnesRenegociado.ExisteCliente(campo, codigo: string): boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if Campo = 'nomecidade' then
    Campo:= 'c.nome'
  else if Campo = 'tipocliente' then
    Campo:= 'v.tipo'
  else
    Campo:= 'v.' + Campo;
  qryConsultaClientes.Sql[08] := Format(SQL, [Campo, Codigo, '%']);
  qryConsultaClientes.Open;
  Result := qryConsultaClientes.RecordCount > 0
end;

procedure TdtmAcertarCarnesRenegociado.FecharTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
begin
   case TipoConsulta of
      qecCLIENTE: Fecha(ctCaixaConsultaCliente);
      qecCONTA:   Fecha(ctConsultaContas);
   end;
end;

function TdtmAcertarCarnesRenegociado.GetConsultarCliente: TtecQuery;
begin
  Result:= qryConsultaClientes;
end;

procedure TdtmAcertarCarnesRenegociado.Selecionar(TipoConsulta: TtecQuitacaoExtraCaixa);
begin
  case TipoConsulta of
    qecCLIENTE: ReFazConsulta(qryClientes,[0,1],[qryConsultaClientescodigo.AsInteger,
                                                 qryConsultaClientestipo.AsString]);
    qecCONTA:   begin
                  qryParcelas.Edit;
                  qryParcelasContaBoleto.AsInteger:= qryConsultaContasConta.AsInteger;
                end;
  end;
end;

procedure TdtmAcertarCarnesRenegociado.qryClientesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryContratosPorCliente,[0,1],[qryClientesCodigo.AsInteger,
                                              qryClientestipo.AsString]);
end;

procedure TdtmAcertarCarnesRenegociado.qryContratosPorClienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryParcelas,[0],[qryContratosPorClientenumero.AsString]);
end;

function TdtmAcertarCarnesRenegociado.ProcessarPagamento: Boolean;
var
  ValorContrato: Currency;
begin
  Result:= False;
  if MensagemConfirmacao(ctCONFIRMAALTERACOESPARCELAS) = smbOk then begin
    ValorContrato:= qryContratosPorClientevalor.AsCurrency;
    if (ValorContrato = TotalParcelas) then begin
      Perpetrar([qryParcelas]);
      ReFazConsulta(qryParcelas,[0],[qryContratosPorClientenumero.AsString]);
      RecalcularParcelaOrigem;
      Perpetrar([qryParcelas]);
      ReFazConsulta(qryParcelas,[0],[qryContratosPorClientenumero.AsString]);
      Result:= True;
    end
    else MensagemAviso(ctTOTALPARCELASDIFERECONTRATO);
  end;
end;

function TdtmAcertarCarnesRenegociado.TotalParcelas: Currency;
var
  Total: Currency;
begin
  Total:= 0;
  qryParcelas.DisableControls;
  qryParcelas.First;
  try
    while not qryParcelas.Eof do begin
      if ((qryParcelastipopagto.AsString   <> 'P')  and
          (qryParcelastipopagto.AsString   <> 'X')  and
          (not qryParcelasparcelaadicional.AsBoolean)) then
          Total:= Total + qryParcelasvalorvencto.AsCurrency;
      qryParcelas.Next;
    end;
  finally
    qryParcelas.EnableControls;
  end;
  Result:= Total;
end;

function TdtmAcertarCarnesRenegociado.GetTabelaParcelas: TtecQuery;
begin
  Result:= qryParcelas;
end;

function TdtmAcertarCarnesRenegociado.ExcluirParcela: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR,['a PARCELA'])) = smbOk then begin
    qryParcelas.Delete;
    Result:= True;
  end;
end;

function TdtmAcertarCarnesRenegociado.IncluirParcela: Boolean;
begin
  Result:= False;
end;


function TdtmAcertarCarnesRenegociado.ExisteConta(campo, codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaContas, Campo, Codigo);
end;


procedure TdtmAcertarCarnesRenegociado.qryContratosPorClienteAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryParcelas.Close;
end;

function TdtmAcertarCarnesRenegociado.GetDataContrato: TDateTime;
begin
  Result:= qryContratosPorClientedata.AsDateTime;
end;

procedure TdtmAcertarCarnesRenegociado.RecalcularParcelaOrigem;
const
 Numero = 1;
 Vencimento = 2;
var
 Pos: TBookmark;
 RegistroAtual: TBookmark;
 ParcelasAuxiliar: array[1..2] of TStringList;
 A,B, QTP, NP : integer;
 Vencto : STring;
begin
 RegistroAtual := qryParcelas.GetBookmark;
 ParcelasAuxiliar[Numero] := TStringList.Create;
 ParcelasAuxiliar[Vencimento] := TStringList.Create;

 Pos:= qryParcelas.GetBookmark;
 qryparcelas.DisableControls;
 try
   qryparcelas.First;
   while not qryparcelas.Eof do
   begin
    ParcelasAuxiliar[Vencimento].Append(qryParcelasdatavencto.AsString);
    ParcelasAuxiliar[Numero].Append(qryParcelasnumero.AsString);
    qryParcelas.Next;
   end;

   for A := 1 to ParcelasAuxiliar[Vencimento].Count - 1 do
   begin
    B := A;
    While strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B])<
          strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B-1]) do
    begin
     ParcelasAuxiliar[Vencimento].Move(B,B-1);
     ParcelasAuxiliar[Numero].Move(B,B-1);
     if B=1 then
       break
     else
       B := B-1;
    end;
   end;

   QTP:= 0;
   Vencto := '';
   for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do
   if ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto then
   begin
     QTP := QTP + 1;
     Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
   end;

   NP:= 0;
   Vencto := '';
   for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do
   begin
    if ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto then
    begin
     NP := NP + 1;
     Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
    end;
    if qryParcelas.Locate('numero', strtoint(ParcelasAuxiliar[Numero].Strings[A]), []) then
    begin
     qryparcelas.Edit;
     qryParcelasparcelaorigem.AsString := inttostr(NP)+'/'+inttostr(QTP);
     qryparcelas.Post;
    end;
   end;
   ParcelasAuxiliar[Vencimento].free;
   ParcelasAuxiliar[Numero].free;
   qryParcelas.GotoBookmark(RegistroAtual);
 finally
   qryParcelas.GotoBookmark(Pos);
   qryParcelas.FreeBookmark(Pos);
   qryparcelas.EnableControls;
 end;
end;

procedure TdtmAcertarCarnesRenegociado.qryParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryParcelascontrato.AsString:= qryContratosPorClientenumero.AsString;
  qryParcelasparcelaadicional.AsBoolean:= False;
  qryParcelaspagamentoextracaixa.AsBoolean:= False;
end;

end.
