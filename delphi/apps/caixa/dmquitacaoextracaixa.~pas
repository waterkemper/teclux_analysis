unit dmquitacaoextracaixa;

interface

uses
  SysUtils, Classes, Forms, dmbasico, dmtecsoft,
  ZQuery, DB, ZPgSqlQuery, cpquery, cpdatasource, ctconstantes,
  biblio, clusuario,Dialogs, ZTransact;

type
  TdtmQuitacaoExtraCaixa = class(TdtmBasico)
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
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
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
    qryNotas: TtecQuery;
    qryNotasfilial: TIntegerField;
    qryNotasserie: TStringField;
    qryNotasnumero: TIntegerField;
    dsrNotas: TtecDataSource;
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
    qryParcelasusuarioextracaixa: TStringField;
    qryParcelasalterada: TBooleanField;
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
    qryParcelasContaBoleto: TIntegerField;
    qryEventos: TtecQuery;
    qryEventosCodigo: TIntegerField;
    qryEventosDescricao: TStringField;
    dsrEvento: TtecDataSource;
    qryConsultaEventos: TtecQuery;
    qryConsultaEventosDescricao: TStringField;
    qryConsultaEventosCodigo: TIntegerField;
    qryParcelasevento: TIntegerField;
    procedure qryClientesAfterOpen(DataSet: TDataSet);
    procedure qryContratosPorClienteAfterScroll(DataSet: TDataSet);
    procedure qryParcelasAfterScroll(DataSet: TDataSet);
    procedure qryParcelasBeforeScroll(DataSet: TDataSet);
    procedure qryContratosPorClienteAfterClose(DataSet: TDataSet);
    procedure dsrParcelasDataChange(Sender: TObject; Field: TField);
  private
    function GetParcelaAlterada: Boolean;
    procedure SetParcelaAlterada(const Value: Boolean);
    function GetConsultaContas: TtecQuery;
    function GetConsultaEventos: TtecQuery;
  protected
    function GetParcelaSPC: Boolean;
    function GetParcelaCarta: Boolean;
    function  GetDataContrato: TDateTime;
    function  GetPodeAlterarParcela: Boolean;
    function  GetTabelaParcelas: TtecQuery;
    function  GetParcelaQuitada: Boolean;
    function  GetParcelaQuitar: Boolean;
    function  GetConsultarCliente: TtecQuery;
    procedure SetarParcelaDevolver;
    procedure PosicionarPrimeiraAberta;
    procedure ZerarParcela;
    function  TotalParcelas: Currency;
//    function  ParcelaAnteriorRecebida: Boolean;
//    function  ParcelaPosteriorRecebida: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbrirTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
    procedure Selecionar(TipoConsulta: TtecQuitacaoExtraCaixa);
    procedure FecharTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
    procedure AtribuirValorPagto;
    function  ProcessarPagamento: Boolean;
    function  ExcluirParcela: Boolean;
    function  GravarParcela(Parcial: Boolean): Boolean;
    function  IncluirParcela: Boolean;
    function  ExisteCliente(campo, codigo: string): boolean;
    function  ExisteConta(campo, codigo: string): boolean;
    function  ExisteEvento(campo, codigo: String): boolean;
    property  ConsultarCliente: TtecQuery read GetConsultarCliente;
    property  ParcelaQuitada: Boolean read GetParcelaQuitada;
    property  ParcelaQuitar: Boolean read GetParcelaQuitar;
    property  TabelaParcelas: TtecQuery read GetTabelaParcelas;
    property  PodeAlterarParcela: Boolean read GetPodeAlterarParcela;
    property  DataContrato: TDateTime read GetDataContrato;
    property  ParcelaCarta: Boolean read GetParcelaCarta;
    property  ParcelaSPC: Boolean read GetParcelaSPC;
    property  ParcelaAlterada :Boolean read GetParcelaAlterada write SetParcelaAlterada;
    property  ConsultaContas: TtecQuery read GetConsultaContas;
    property  ConsultaEventos: TtecQuery read GetConsultaEventos;
  end;

var
  dtmQuitacaoExtraCaixa: TdtmQuitacaoExtraCaixa;

implementation

{$R *.dfm}

{ TdtmQuitacaoExtraCaixa }

procedure TdtmQuitacaoExtraCaixa.AbrirTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
begin
   case TipoConsulta of
      qecCLIENTE: begin
                     qryConsultaClientes.MacroByName('ClausulaWHERE').AsString:= 'WHERE False';
                     RefazConsulta(qryConsultaClientes, [], []);
                  end;
      qecCONTA:   Abre(ctConsultaContas);
      qecEVENTO:  Abre(ctConsultaEventos);
   end;
end;


constructor TdtmQuitacaoExtraCaixa.Create(AOwner: TComponent);
begin
   inherited;
   qryClientes        .Tag := ctTabelas;
   qryContas          .Tag := ctTabelas;
   qryEventos         .Tag := ctTabelas;
   qryConsultaClientes.Tag := ctCaixaConsultaCliente;
   qryConsultaContas  .Tag := ctConsultaContas;
   qryConsultaEventos .Tag := ctConsultaEventos;

   qryClientes.Params[01].AsString:= 'C';
end;

function TdtmQuitacaoExtraCaixa.ExisteCliente(campo, codigo: string): boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
        if Campo = 'nomecidade'  then Campo:= 'c.nome'
   else if Campo = 'tipocliente' then Campo:= 'v.tipo'
                                 else Campo:= 'v.' + Campo;

   qryConsultaClientes.MacroByName('ClausulaWHERE').AsString:= Format(SQL, [Campo, Codigo, '%']);
   RefazConsulta(qryConsultaClientes, [], []);
   Result := qryConsultaClientes.RecordCount > 0
end;

procedure TdtmQuitacaoExtraCaixa.FecharTabelasConsulta(TipoConsulta: TtecQuitacaoExtraCaixa);
begin
   case TipoConsulta of
      qecCLIENTE: Fecha(ctCaixaConsultaCliente);
      qecCONTA:   Fecha(ctConsultaContas);
      qecEVENTO:  Fecha(ctConsultaEventos);
   end;
end;

function TdtmQuitacaoExtraCaixa.GetConsultarCliente: TtecQuery;
begin
  Result:= qryConsultaClientes;
end;

procedure TdtmQuitacaoExtraCaixa.Selecionar(TipoConsulta: TtecQuitacaoExtraCaixa);
begin
   case TipoConsulta of
      qecCLIENTE: ReFazConsulta(qryClientes, [0, 1],
                               [qryConsultaClientesCodigo.AsInteger,
                                qryConsultaClientesTipo.  AsString]);
      qecCONTA:   begin
                     qryParcelas.Edit;
                     qryParcelasContaBoleto.AsInteger:= qryConsultaContasConta. AsInteger;
                     RefazConsulta(qryContas, [0], [qryParcelasContaBoleto.AsVariant]);
                  end;
      qecEVENTO:  begin
                    qryParcelas.Edit;
                    qryParcelasevento.AsInteger := qryConsultaEventosCodigo.AsInteger;
                    RefazConsulta(qryEventos, [0], [qryParcelasevento.AsInteger]);
                  end;
  end;
end;

procedure TdtmQuitacaoExtraCaixa.qryClientesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryContratosPorCliente,[0,1],[qryClientesCodigo.AsInteger,
                                              qryClientestipo.AsString]);
end;

procedure TdtmQuitacaoExtraCaixa.qryContratosPorClienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryParcelas,[0],[qryContratosPorClientenumero.AsString]);
  ReFazConsulta(qryNotas,[0],[qryContratosPorClientenumero.AsString]);
  PosicionarPrimeiraAberta
end;

function TdtmQuitacaoExtraCaixa.GetParcelaQuitada: Boolean;
begin
  Result:= qryParcelasquitado.AsBoolean;
end;

function TdtmQuitacaoExtraCaixa.GetParcelaQuitar: Boolean;
begin
  Result:= not qryParcelasquitado.AsBoolean and qryParcelaspodequitar.AsBoolean;
end;

procedure TdtmQuitacaoExtraCaixa.qryParcelasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryParcelasquitado.AsBoolean and not (qryParcelas.State = dsInsert) then
    SetarParcelaDevolver;
end;

procedure TdtmQuitacaoExtraCaixa.SetarParcelaDevolver;
begin
  qryParcelas.Edit;
  qryParcelaspodequitar.AsBoolean:= True;
  qryParcelas.Post;
end;

procedure TdtmQuitacaoExtraCaixa.qryParcelasBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryParcelasquitado.AsBoolean   and
         qryParcelasdatapagto.IsNull    and
         qryParcelasvalorpagto.IsNull   and
     not (qryParcelas.State = dsInsert) then
    ZerarParcela;
end;

procedure TdtmQuitacaoExtraCaixa.ZerarParcela;
begin
  qryParcelas.Edit;
  qryParcelasdatapagto.Clear;
  qryParcelasvalorpagto.Clear;
  qryParcelaspagamentoextracaixa.AsBoolean := False;
//  qryParcelastipopagto.Clear;
  qryParcelasContaBoleto.Clear;
  qryParcelasObservacaoBoleto.Clear;
  qryParcelasQuitado.AsBoolean:= False;
  qryParcelasPodeQuitar.AsBoolean:= False;
  qryParcelas.Post;
end;

function TdtmQuitacaoExtraCaixa.ProcessarPagamento: Boolean;
var
  Usuario: TtecUsuarios;
  ValorContrato: Currency;

  procedure AtribuirUsuarioExtraCaixa;
  begin
    qryParcelas.First;
    while not qryParcelas.Eof do
    begin
      if qryParcelasalterada.AsBoolean then
      begin
        qryParcelas.Edit;
        qryParcelasusuarioextracaixa.AsString :=  Usuario.NomeUsuario;
        qryParcelas.Post;
      end;
      qryParcelas.Next;
    end;
  end;


begin
  Result:= False;
//  if not ParcelaAnteriorRecebida then
//    MensagemAviso(ctEXISTEPARCELAANTERORQUITADA)
//  else if ParcelaPosteriorRecebida then
//    MensagemAviso(ctEXISTEPARCELAPOSTERIORQUITADA);

  if MensagemConfirmacao(ctCONFIRMAALTERACOESPARCELAS) = smbOk then begin
    Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
    try
      if UsuarioLogin.Caixa then
           Usuario:= ObterAutorizacao(taSENHA)
      else Usuario:= ObterAutorizacao(taLOGIN, ctAUTORIZACAORECEBIMENTO, ctAUTORIZADO);
      if Assigned(Usuario) and Usuario.Caixa then begin
        qryParcelas.AfterScroll  := nil;
        qryParcelas.BeforeScroll := nil;
        ValorContrato:= qryContratosPorClientevalor.AsCurrency;
        if (ValorContrato = TotalParcelas) then begin
          AtribuirUsuarioExtraCaixa;
          Perpetrar([qryParcelas]);
          ReFazConsulta(qryParcelas,[0],[qryContratosPorClientenumero.AsString]);
          PosicionarPrimeiraAberta;
          Result:= True;
        end
        else MensagemAviso(ctTOTALPARCELASDIFERECONTRATO);
        qryParcelas.AfterScroll  := qryParcelasAfterScroll;
        qryParcelas.BeforeScroll := qryParcelasBeforeScroll;
      end
      else MensagemAviso(format(ctUSUARIONAOAUTORIZADO,[ctAUTORIZARRECEBIMENTOPARCELA]));
    finally
      Usuario.Free;
    end;
  end;
end;

function TdtmQuitacaoExtraCaixa.TotalParcelas: Currency;
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

procedure TdtmQuitacaoExtraCaixa.PosicionarPrimeiraAberta;
begin
  qryParcelas.First;
  while not qryParcelas.Eof do begin
    if not qryParcelasquitado.AsBoolean then
      break;
    qryParcelas.Next;
  end;
end;

function TdtmQuitacaoExtraCaixa.GetTabelaParcelas: TtecQuery;
begin
  Result:= qryParcelas;
end;

function TdtmQuitacaoExtraCaixa.ExcluirParcela: Boolean;
begin
  Result:= False;
  if PodeAlterarParcela and not ParcelaCarta and not ParcelaSPC then
  begin
    if MensagemConfirmacao(format(ctCONFIRMECANCELAR,['a PARCELA'])) = smbOk then
    begin
      if qryParcelas.State <> dsEdit then
        qryParcelas.Edit;
      qryParcelasfilialpagto.AsInteger := FilialBase;
      qryParcelasdatapagto.AsDateTime  := DataServidor;
      qryParcelasvalorpagto.AsCurrency := qryParcelasvalorvencto.AsCurrency;
      qryParcelastipopagto.AsString    := 'E';
      qryParcelasjurosdesctos.Clear;
      qryParcelas.Post;
      Result:= True;
    end;
  end
  else
    MensagemAviso(ctNAOPODEEXCLUIRPARCELA);
end;

function TdtmQuitacaoExtraCaixa.GravarParcela(Parcial: Boolean): Boolean;

  procedure GerenciaPagamentoParcial;
  var
    A: Integer;
    CParcelas: Array of Variant;
    Dif, Total: Currency;
    Pos: TBookmark;
  begin
    if MensagemConfirmacao(ctPAGAMENTOPARCIALPARCELA) = smbOk then begin
      Pos:= qryParcelas.GetBookmark;
      qryParcelas.DisableControls;
      try
        FillChar(CParcelas,SizeOf(CParcelas),0);

        SetLength(CParcelas,qryParcelas.FieldCount);
        for A:= 0 to qryParcelas.FieldCount - 1 do
          CParcelas[A]:= qryParcelas.Fields[A].AsVariant;

        qryParcelasvalorvencto.AsCurrency:= qryParcelasvalorpagto.AsCurrency;
        qryParcelaspagamentoextracaixa.AsBoolean := True;
        qryParcelasfilialpagto.AsInteger := FilialBase;
        qryParcelas.Post;

        qryParcelas.Append;
        for A:= 0 to qryParcelas.FieldCount - 1 do
          qryParcelas.Fields[A].AsVariant:= CParcelas[A];

        qryParcelasvalorvencto.AsCurrency:= (qryParcelasvalorvencto.AsCurrency - qryParcelasvalorpagto.AsCurrency);
        qryParcelasnumero.Clear;
        qryParcelasdatapagto.Clear;
        qryParcelasvalorpagto.Clear;
        qryParcelaspodequitar.AsBoolean:= False;
        qryParcelasquitado.AsBoolean   := False;
        qryParcelas.Post;

        Total:= 0;
        qryParcelas.DisableControls;
        try
          qryParcelas.First;
          while not qryParcelas.Eof do begin
           if ((qryParcelastipopagto.AsString   <> 'P')  and
              (qryParcelastipopagto.AsString   <> 'X')  and
              (not qryParcelasparcelaadicional.AsBoolean)) then
            Total := Total + qryParcelasvalorvencto.AsCurrency;
            qryParcelas.Next;
           end;
        finally
          qryParcelas.EnableControls;
        end;

        Dif:= qryContratosPorClientevalor.AsCurrency - Total;
        if (Dif <> 0) then begin
          qryParcelas.Last;
          qryParcelas.Edit;
          qryParcelasvalorvencto.AsCurrency:= qryParcelasvalorvencto.AsCurrency + Dif;
          qryParcelas.Post;
        end;
      finally
        qryParcelas.GotoBookmark(Pos);
        qryParcelas.FreeBookmark(Pos);
        qryParcelas.EnableControls;
      end;
    end;
  end;

begin
  Result:= False;
  if qryParcelas.CheckRequiredFields then begin
    qryParcelas.AfterScroll  := nil;
    qryParcelas.BeforeScroll := nil;
    if Parcial then
         GerenciaPagamentoParcial
    else begin
      if qryParcelasvalorpagto.IsNull or qryParcelasdatapagto.IsNull then begin
        qryParcelasdatapagto.Clear;
        qryParcelasvalorpagto.Clear;
        qryParcelastipopagto.Clear;
        if not qryParcelasContaBoleto.IsNull then
          qryParcelasContaBoleto.Clear;
        if not qryParcelasobservacaoboleto.IsNull then
          qryParcelasobservacaoboleto.Clear;
      end
      else begin
        qryParcelaspagamentoextracaixa.AsBoolean := True;
        qryParcelasfilialpagto.AsInteger := filialbase;
      end;
      qryParcelasquitado.AsBoolean := False;
      qryParcelas.Post;
    end;
    Result:= True;
    qryParcelas.AfterScroll  := qryParcelasAfterScroll;
    qryParcelas.BeforeScroll := qryParcelasBeforeScroll;
  end;
end;

function TdtmQuitacaoExtraCaixa.IncluirParcela: Boolean;
begin
  Result:= False;
  qryParcelas.Append;
  qryParcelascontrato.AsString             := qryContratosPorClientenumero.AsString;
  qryParcelasparcelaadicional.AsBoolean    := False;
  qryParcelaspagamentoextracaixa.AsBoolean := False;
end;



procedure TdtmQuitacaoExtraCaixa.qryContratosPorClienteAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryParcelas.Close;
  qryNotas.Close;
end;

function TdtmQuitacaoExtraCaixa.GetPodeAlterarParcela: Boolean;
begin
  Result:= (qryParcelaspagamentoextracaixa.AsBoolean or
           (qryParcelastipopagto.IsNull and qryParcelasdatapagto.IsNull));

end;

function TdtmQuitacaoExtraCaixa.GetDataContrato: TDateTime;
begin
  Result:= qryContratosPorClientedata.AsDateTime;
end;


(*function TdtmQuitacaoExtraCaixa.ParcelaAnteriorRecebida: Boolean;
Var
  Pos, Pos1: TBookmark;
begin
  if qryParcelas.RecordCount = 1 then
    Result := True
  else begin
    Pos := qryParcelas.GetBookmark;
    qryParcelas.DisableControls;
    qryParcelas.AfterScroll  := nil;
    qryParcelas.BeforeScroll := nil;
    try
      qryParcelas.Prior;
      Pos1 := qryParcelas.GetBookmark;
      Result := qryParcelasquitado.AsBoolean;
//      Result := (qryParcelasquitado.AsBoolean or (qryParcelas.CompareBookmarks(Pos, Pos1) = 0));
      qryParcelas.FreeBookmark(Pos1);
    finally
      qryParcelas.GotoBookmark(Pos);
      qryParcelas.FreeBookmark(Pos);
      qryParcelas.EnableControls;
      qryParcelas.AfterScroll  := qryParcelasAfterScroll;
      qryParcelas.BeforeScroll := qryParcelasBeforeScroll;
    end
  end;
//  Result:= Result and qryParcelasvalorpagto.IsNull);
end;

function TdtmQuitacaoExtraCaixa.ParcelaPosteriorRecebida: Boolean;
Var
  Pos, Pos1: TBookmark;
begin
  if qryParcelas.RecordCount = 1 then
    Result := False
  else begin
    Pos := qryParcelas.GetBookmark;
    qryParcelas.DisableControls;
    qryParcelas.AfterScroll  := nil;
    qryParcelas.BeforeScroll := nil;
    try
      qryParcelas.Next;
      Pos1 := qryParcelas.GetBookmark;
      Result := qryParcelasquitado.AsBoolean;
      Result := (qryParcelasquitado.AsBoolean or (qryParcelas.CompareBookmarks(Pos, Pos1) = 0));
      qryParcelas.FreeBookmark(Pos1);
    finally
      qryParcelas.GotoBookmark(Pos);
      qryParcelas.FreeBookmark(Pos);
      qryParcelas.EnableControls;
      qryParcelas.AfterScroll  := qryParcelasAfterScroll;
      qryParcelas.BeforeScroll := qryParcelasBeforeScroll;
    end
  end;
//  Result:= Result and not qryParcelasvalorpagto.IsNull;
end;  *)

function TdtmQuitacaoExtraCaixa.GetParcelaCarta: Boolean;
begin
  Result:= (not qryParcelascartacliente.IsNull or not qryParcelascartaavalista.IsNull);
end;

function TdtmQuitacaoExtraCaixa.GetParcelaSPC: Boolean;
begin
  Result:= (not qryParcelasspccliente.IsNull or not qryParcelasspcavalista.IsNull);
end;

procedure TdtmQuitacaoExtraCaixa.AtribuirValorPagto;
begin
  if not qryParcelasdatapagto.IsNull then
       qryParcelasvalorpagto.AsCurrency:= (qryParcelasvalorvencto.AsCurrency -
                                                    qryParcelasdescontosugerido.AsCurrency)
  else qryParcelasvalorpagto.AsCurrency:= 0;
end;

procedure TdtmQuitacaoExtraCaixa.dsrParcelasDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryParcelasdescontosugerido then begin
    qryParcelasliquido.AsCurrency:= (qryParcelasvalorvencto.AsCurrency -
                                     qryParcelasdescontosugerido.AsCurrency);
  end;
end;

function TdtmQuitacaoExtraCaixa.GetParcelaAlterada: Boolean;
begin
  Result := qryParcelasalterada.AsBoolean;
end;

procedure TdtmQuitacaoExtraCaixa.SetParcelaAlterada(const Value: Boolean);
begin
  qryParcelas.Edit;
  qryParcelasalterada.AsBoolean := Value;
  qryParcelas.Post;
end;

function TdtmQuitacaoExtraCaixa.ExisteConta(campo,
  codigo: string): boolean;
begin
   Result:= ExisteCodigo(qryConsultaContas, Campo, Codigo)
end;

function TdtmQuitacaoExtraCaixa.GetConsultaContas: TtecQuery;
begin
   Result:= qryConsultaContas;
end;

function TdtmQuitacaoExtraCaixa.ExisteEvento(campo,
  codigo: String): boolean;
begin
  Result:= ExisteCodigo(qryConsultaContas, Campo, Codigo)
end;

function TdtmQuitacaoExtraCaixa.GetConsultaEventos: TtecQuery;
begin
  Result := qryConsultaEventos
end;

end.
