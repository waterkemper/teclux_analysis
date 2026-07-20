unit dmconsultadadoscliente;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes,
  //Repositorio
  dmbasico, dmtecsoft, biblio, clusuario,
  //Componentes
  cpquery, cpdatasource, clparametrossistema, ZTransact, ACBrBase, ACBrDFe,
  ACBrNFSe, Provider, DBClient;

type
  TdtmConsultaDadosCliente = class(TdtmBasico)
    qryCartasCliente: TtecQuery;
    qryAtendimentosCliente: TtecQuery;
    qryCliente: TtecQuery;
    qryAtendimentosClientedata: TDateField;
    qryAtendimentosClientelembrar: TDateField;
    qryAtendimentosClientesemspc: TDateField;
    qryAtendimentosClientesemaviso: TDateField;
    dsrCliente: TtecDataSource;
    dsrCartasCliente: TtecDataSource;
    dsrAtendimentosCliente: TtecDataSource;
    dsrSPCCliente: TtecDataSource;
    qryClientecodigo: TIntegerField;
    qryClientenome: TStringField;
    qryClientenascto: TDateField;
    qryClienteiddocumento: TStringField;
    qryClientenomepessoanumero: TStringField;
    qryClientesexo: TStringField;
    qryClientenaturalcidade: TIntegerField;
    qryClientenaturalestado: TStringField;
    qryClienteempresa: TStringField;
    qryClienterua: TStringField;
    qryClientebairro: TIntegerField;
    qryClientecidade: TIntegerField;
    qryClienteestado: TStringField;
    qryClientecep: TIntegerField;
    qryClientenomecidade: TStringField;
    qryClientenomebairro: TStringField;
    qryClientenomenaturalcidade: TStringField;
    qryClientepessoanumero: TStringField;
    qryClientepessoatipo: TStringField;
    qryCheques: TtecQuery;
    qryChequesnumero: TStringField;
    qryChequesdata: TDateField;
    qryChequesvencto: TDateField;
    qryChequesvalor: TFloatField;
    qryChequestitular: TStringField;
    qryChequesfilial: TIntegerField;
    qryChequessituacao: TStringField;
    dsrCheques: TtecDataSource;
    qryParcelasCheques: TtecQuery;
    qryParcelasChequescheque: TStringField;
    qryParcelasChequesnumero: TIntegerField;
    qryParcelasChequesdatavencto: TDateField;
    qryParcelasChequesvalorvencto: TFloatField;
    qryParcelasChequesvalorpagto: TFloatField;
    qryParcelasChequestipopagto: TStringField;
    dsrParcelasCheques: TtecDataSource;
    qryParcelasCartas: TtecQuery;
    dsrParcelasCartas: TtecDataSource;
    qryParcelasCartascontratoparcela: TStringField;
    qryParcelasCartasparcela: TStringField;
    qryCartasOcorrencia: TtecQuery;
    qryCartasOcorrenciasemaviso: TDateField;
    qryCartasClientecliente: TIntegerField;
    qryCartasClientetipocliente: TStringField;
    qryCartasClienteavalista: TIntegerField;
    qryCartasClienteeavalista: TBooleanField;
    qryCartasClientetipocarta: TIntegerField;
    qryCartasClientedescricao: TStringField;
    qryCartasClientebloqueada: TStringField;
    qryCartasClienteenviada: TDateTimeField;
    qryCartasClientevoltou: TDateField;
    qryCartasClienteconfirmacao: TDateField;
    qryCartasClientesituacao: TStringField;
    qryCartasClientedata: TDateTimeField;
    qrySPCCliente: TtecQuery;
    qrySPCOcorrencia: TtecQuery;
    qrySPCOcorrenciasemspc: TDateField;
    qryParcelasSPC: TtecQuery;
    dsrParcelasSPC: TtecDataSource;
    qryParcelasSPCcontratoparcela: TStringField;
    qryParcelasSPCparcela: TStringField;
    qryClienteenderecoalterado: TDateField;
    qrySPCClientespc: TIntegerField;
    qrySPCClientedatainclusao: TDateTimeField;
    qrySPCClientedataexclusao: TDateTimeField;
    qrySPCClienteregistrado: TBooleanField;
    qrySPCClientevalordebito: TFloatField;
    qrySPCClientedatavencto: TDateField;
    qrySPCClienteeavalista: TBooleanField;
    qrySPCClientedata: TDateTimeField;
    qrySPCClientecliente: TIntegerField;
    qrySPCClientetipocliente: TStringField;
    qrySPCClientenome_avalista_ou_avalizado: TStringField;
    qrySPCClientebloqueada: TStringField;
    qrySPCClientesituacao: TStringField;
    qrySPCClientecarta: TIntegerField;
    qrySPCClientecartanumero: TIntegerField;
    qryCartasClientecarta: TIntegerField;
    qryCartasClientenumero: TIntegerField;
    qryClientenomecargo: TStringField;
    qryParcelasChequesdatapagto: TDateField;
    qrySaldoAtual: TtecQuery;
    qrySaldoAtualvalor: TFloatField;
    qryProdutosTrocados: TtecQuery;
    qryProdutosTrocadosnumero: TIntegerField;
    qryProdutosTrocadostipo: TStringField;
    qryProdutosTrocadosdata: TDateTimeField;
    qryProdutosTrocadoscliente: TIntegerField;
    qryProdutosTrocadostipocliente: TStringField;
    qryProdutosTrocadosproduto: TLargeintField;
    qryProdutosTrocadosfilial: TIntegerField;
    qryProdutosTrocadoscontrato: TStringField;
    qryProdutosTrocadosfilialsaida: TIntegerField;
    qryProdutosTrocadosquantidade: TFloatField;
    qryProdutosTrocadosprecotabela: TFloatField;
    qryProdutosTrocadosprecoavaliado: TFloatField;
    qryProdutosTrocadosvalor: TFloatField;
    qryProdutosTrocadossaldo: TFloatField;
    qryProdutosTrocadosnovocontrato: TStringField;
    qryProdutosTrocadosdefeito: TBooleanField;
    qryProdutosTrocadosusuario: TIntegerField;
    qryProdutosTrocadosreferencia: TStringField;
    qryProdutosTrocadosevento: TIntegerField;
    dsrProdutosTrocados: TtecDataSource;
    spcProdutosTrocadosProximo: TtecQuery;
    spcProdutosTrocadosProximonumero: TIntegerField;
    qryProcuraEventos: TtecQuery;
    qryProcuraEventoscodigo: TIntegerField;
    qryProcuraEventosdescricao: TStringField;
    qryProcuraEventostipodocumento: TMemoField;
    dsrProcuraEventos: TtecDataSource;
    qryConsultaEventos: TtecQuery;
    qryConsultaEventosdescricao: TStringField;
    qryConsultaEventoscodigo: TIntegerField;
    qryConsultaEventosssaida: TStringField;
    dsrSaldoAtual: TtecDataSource;
    qryProdutosTrocadosDescricao: TStringField;
    qryProdutosTrocadosdescricaoproduto: TStringField;
    qryClientefoneddd: TIntegerField;
    qryClientefonenumero: TIntegerField;
    qryClientefoneramal: TStringField;
    qryLimitesCredito: TtecQuery;
    dsrLimitesCredito: TtecDataSource;
    qryLimitesCreditorendacliente: TFloatField;
    qryLimitesCreditorendabaseconjuge: TIntegerField;
    qryLimitesCreditorendaconjuge: TFloatField;
    qryLimitesCreditooutrasrendas: TFloatField;
    qryLimitesCreditoonus: TFloatField;
    qryLimitesCreditototalrenda: TFloatField;
    qryLimitesCreditopontos: TIntegerField;
    qryLimitesCreditobasepontos: TIntegerField;
    qryLimitesCreditodisponivel: TFloatField;
    qryLimitesCreditolimitetotal: TFloatField;
    qryLimitesCreditoporparcela: TFloatField;
    qryLimitesCreditoatrasomedio: TFloatField;
    qryLimitesCreditomaioratraso: TIntegerField;
    qryLimitesCreditovalormaioratraso: TFloatField;
    qryLimitesCreditodatamaioratraso: TStringField;
    qryLimitesCreditoatrasohoje: TIntegerField;
    qryLimitesCreditoultimoatraso: TIntegerField;
    qryLimitesCreditovalorultimoatraso: TFloatField;
    qryLimitesCreditodataultimoatraso: TStringField;
    qryLimitesCreditoate30diasematraso: TFloatField;
    qryLimitesCreditode31diasematraso: TFloatField;
    qryLimitesCreditomais60diasematraso: TFloatField;
    qryLimitesCreditoate30diasavencer: TFloatField;
    qryLimitesCreditode31diasavencer: TFloatField;
    qryLimitesCreditomais60diasavencer: TFloatField;
    qryLimitesCreditoc61: TFloatField;
    qryLimitesCreditototalematraso: TFloatField;
    qryLimitesCreditototalavencer: TFloatField;
    qryLimitesCreditototalemaberto: TFloatField;
    qryClientenumero: TIntegerField;
    qryClientecomplemento: TStringField;
    qryProdutosTrocadosusuarioautorizacao: TIntegerField;
    qryProcuraEventostipomovimentacao: TStringField;
    qryChequesnome_situacao: TStringField;
    qryAtendimentosClienteinformes: TMemoField;
    cdsChequesDevolvidos_aVencer: TClientDataSet;
    cdsChequesDevolvidos_aVencerTotalDevolvido: TAggregateField;
    cdsChequesDevolvidos_aVencerTotalaVencer: TAggregateField;
    dspChequesDevolvidos_aVencer: TDataSetProvider;
    qryChequesvalordevolvido: TFloatField;
    qryChequesvaloravencer: TFloatField;
    qrycashback_saldos: TtecQuery;
    qrycashback_saldoscodigo: TIntegerField;
    qrycashback_saldoscashback: TIntegerField;
    qrycashback_saldosdata_hora: TDateTimeField;
    qrycashback_saldoscliente: TIntegerField;
    qrycashback_saldostipo_cliente: TStringField;
    qrycashback_saldosvalor: TFloatField;
    qrycashback_saldosvalidade: TDateTimeField;
    qrycashback_saldosstatus: TStringField;
    qrycashback_saldoscontrato: TStringField;
    qrycashback_saldosparcela: TIntegerField;
    qrycashback_saldossaldo: TFloatField;
    qrycashback_saldosdescricao: TStringField;
    qrycashback_saldosproduto: TLargeintField;
    qrycashback_saldoscancelamento: TIntegerField;
    qrycashback_saldoscodigovisual: TStringField;
    qrycashback_saldossaldofinal: TFloatField;
    dsrcashback_saldos: TtecDataSource;
    qrycashback_saldosusuarioautorizacao: TIntegerField;
    qrycashback_saldosreferencia: TStringField;
    qrycashback_saldosProximo: TtecQuery;
    qrycashback_saldosProximocodigo: TLargeintField;
    qrycashback_saldostipo: TStringField;
    qrycashback_saldossaldofinalcalc: TFloatField;
    qryIncluirCashBack: TtecQuery;
    qrycashback_saldosdisponibilidade: TDateField;
    qrycashback_saldosdata_hora_lancamento: TDateTimeField;
    procedure dsrClienteDataChange(Sender: TObject; Field: TField);
    procedure qryChequesAfterScroll(DataSet: TDataSet);
    procedure qryCartasClienteAfterScroll(DataSet: TDataSet);
    procedure qryCartasClienteCalcFields(DataSet: TDataSet);
    procedure qrySPCClienteCalcFields(DataSet: TDataSet);
    procedure qrySPCClienteAfterScroll(DataSet: TDataSet);
    procedure dsrProdutosTrocadosDataChange(Sender: TObject;
      Field: TField);
    procedure qryProdutosTrocadosCalcFields(DataSet: TDataSet);
    procedure qryChequesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qrycashback_saldosAfterOpen(DataSet: TDataSet);
    procedure dsrcashback_saldosDataChange(Sender: TObject; Field: TField);
  private
    FUsuarioAutorizacao: Integer;
    function GetRegistradoSPC: Boolean;
    function GeteAvalista: Boolean;
    function GetNome_Avalista_ou_Avalizado: String;
    function GetTabelaProdutosTrocados: TZDataSet;
    procedure SetProdutosTrocadosEvento(const Value: integer);
    function GetConsultaEventos: TZDataSet;
    function GetProdutosTrocadosValor: Currency;
    function GetProdutosTrocadosSaldo: Currency;
  protected
    FResumoCobranca: String;
    function  GetValorSPC: Currency;
    function  GetDataSPC: String;
    function  GetResumoCobranca: String;
    function  GetCartaDevolvida: Boolean;
    procedure MontarResumoCobranca;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbrirDadosCliente(Cliente: Integer; TipoCliente: String);
    procedure FecharDadosCliente(Cliente: Integer);
    property ResumoCobranca: string read GetResumoCobranca;
    property CartaDevolvida: boolean read GetCartaDevolvida;
    property DataSPC: string read GetDataSPC;
    property ValorSPC: Currency read GetValorSPC;
    property RegistradoSPC: Boolean read GetRegistradoSPC;
    property eAvalista: Boolean read GeteAvalista;
    property Nome_Avalista_ou_Avalizado: String read GetNome_Avalista_ou_Avalizado;
    procedure PosicionarSPCUltimoRegistro;
    property TabelaProdutosTrocados: TZDataSet read GetTabelaProdutosTrocados;
    function ExisteEvento(NomeCampo: String; Value: Variant): Boolean;
    function GravarProdutosTrocados:Boolean;
    function GravarCashBack(pOwner: TComponent):Boolean;

    function IncluirSaldoCliente: boolean;
    function IncluirSaldoCashBack: boolean;

    procedure AbreTabelaPesquisa(TipoConsulta: TtecSaldoCliente);
    procedure FechaTabelaPesquisa(TipoConsulta: TtecSaldoCliente);
    procedure Selecionar(TipoConsulta: TtecSaldoCliente);
    property ProdutosTrocadosEvento: integer write SetProdutosTrocadosEvento;
    property ConsultaEventos: TZDataSet read GetConsultaEventos;
    property ProdutosTrocadosValor: Currency read GetProdutosTrocadosValor;
    property ProdutosTrocadosSaldo: Currency read GetProdutosTrocadosSaldo;
    property UsuarioAutorizacao : Integer read FUsuarioAutorizacao write FUsuarioAutorizacao;
    procedure FiltrarChequesDevolvidoseaVencer(Filtrar: Boolean);
    procedure AbrirValoresCashBack;
  end;

{var
  dtmConsultaDadosCliente: TdtmConsultaDadosCliente;}

implementation

{$R *.dfm}

{ TdtmConsultaDadosCliente }

constructor TdtmConsultaDadosCliente.Create(AOwner: TComponent);
begin
  inherited;
  qryCliente.Tag             := ctTabelas;
  qryCartasCliente.Tag       := ctTabelas;
  qryAtendimentosCliente.Tag := ctTabelas;
  qrySPCCLiente.Tag          := ctTabelas;
  qryCheques.Tag             := ctTabelas;
  qryProdutosTrocados.Tag    := ctTabelas;
  qryProcuraEventos.Tag      := ctTabelas;
  qryConsultaEventos.Tag     := ctVendaTabelaConsultaEventos;
  qryProdutosTrocadosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

procedure TdtmConsultaDadosCliente.AbrirDadosCliente(Cliente: Integer; TipoCliente: String);
begin
  RefazConsulta(qryCliente,            [0,1],[Cliente, TipoCliente]);
  RefazConsulta(qryCartasCliente,      [0,1],[Cliente, TipoCliente]);
  RefazConsulta(qrySPCCliente,         [0,1],[Cliente, TipoCliente]);
  PosicionarSPCUltimoRegistro;
  RefazConsulta(qryAtendimentosCliente,[0,1],[Cliente, TipoCliente]);
  ReFazConsulta(qryCheques,            [0,1],[Cliente, TipoCliente]);
  if parsistema.utilizarcreditotrocacontrato then
  begin
    ReFazConsulta(qryProdutosTrocados,[0,1], [Cliente,TipoCliente]);
    qryProdutosTrocados.Last;
    ReFazConsulta(qrySaldoAtual,[],[]);
    qrysaldoatual.Edit;
    qrySaldoAtualvalor.AsCurrency := qryProdutosTrocadossaldo.AsCurrency;
    qrysaldoatual.Post;
  end;
  MontarResumoCobranca;

//  if ParSistema.VerificarLimiteCreditoPontuacao then
    ReFazConsulta(qryLimitesCredito,[0,1,2,3],[Cliente,TipoCliente,0,DataServidor]);

  AbrirValoresCashBack;

end;

procedure TdtmConsultaDadosCliente.FecharDadosCliente(Cliente: Integer);
begin
  RefazConsulta(qryCliente,            [0,1],[0,0]);
  RefazConsulta(qryCartasCliente,      [0,1],[0,0]);
  RefazConsulta(qryAtendimentosCliente,[0,1],[0,0]);
  RefazConsulta(qrySPCCliente,         [0,1],[0,0]);
  ReFazConsulta(qryCheques,            [0,1],[0,0]);
  MontarResumoCobranca;
end;

function TdtmConsultaDadosCliente.GetCartaDevolvida: boolean;
begin
  Result := false;
  if not qryCartasCliente.IsEmpty then
    Result := (qryCartasClientevoltou.AsString <> '') and
               ((qryClienteenderecoalterado.AsString = '') or
                (qryCartasClientevoltou.AsDateTime >
                 qryClienteenderecoalterado.AsDateTime));
end;

function TdtmConsultaDadosCliente.GetValorSPC: Currency;
begin
  Result := 0;
  if not qrySPCCliente.isEmpty then
   if qrySPCClientedataexclusao.AsString='' then
    Result := qrySPCClientevalordebito.AsCurrency;
end;

function TdtmConsultaDadosCliente.GetDataSPC: string;
begin
  Result := '';
  if not qrySPCCliente.isEmpty then
   if qrySPCClientedataexclusao.AsString='' then
     Result := datetostr(qrySPCClientedatainclusao.asdatetime);
end;

function TdtmConsultaDadosCliente.GetResumoCobranca: string;
begin
  Result := FResumoCobranca;
end;

procedure TdtmConsultaDadosCliente.MontarResumoCobranca;
begin
  FResumoCobranca := '';
  if (not qryAtendimentosCliente.IsEmpty) and (qryAtendimentosClientelembrar.AsString <> '') then
    FResumoCobranca := qryAtendimentosClientedata.AsString    + ' - ' +
                       qryAtendimentosClientelembrar.AsString + ' - ' +
                       qryAtendimentosClienteinformes.AsString;
end;

procedure TdtmConsultaDadosCliente.dsrClienteDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryClientepessoanumero then begin
    if qryClientepessoatipo.AsString = 'F' then
      Field.EditMask:= '999.999.999-99;0;_'
    else if qryClientepessoatipo.AsString = 'J' then
      Field.EditMask:= '99.999.999/9999-99;0;_';
  end;
end;

procedure TdtmConsultaDadosCliente.qryChequesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryParcelasCheques,[0],[qryChequesnumero.AsString]);
end;

procedure TdtmConsultaDadosCliente.qryCartasClienteAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryParcelasCartas, [0,1],[qryCartasClientecarta.asvariant,
                                          qrycartasclientenumero.asvariant]);
end;

procedure TdtmConsultaDadosCliente.qryCartasClienteCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryCartasClientesituacao.AsString := '';

  if (pos('1',qryCartasClientebloqueada.AsString)<>0) then
    qryCartasClienteSituacao.AsString := ctENDERECOINCOMPLETO;

  if (pos('2',qryCartasClientebloqueada.AsString)<>0) then
  begin
   if (qryCartasClienteSituacao.AsString<>'') then
     qryCartasClienteSituacao.AsString := qryCartasClienteSituacao.AsString+', '+ctCARTADEVOLVIDA
   else qryCartasClienteSituacao.AsString := ctCARTADEVOLVIDA;
  end;

  if (pos('3',qryCartasClientebloqueada.AsString)<>0) then
  begin
   ReFazConsulta(qryCartasOcorrencia,[0,1,2], [qryCartasClientedata.AsVariant,
                                               qryCartasClientecliente.AsVariant,
                                               qryCartasClientetipocliente.AsVariant]);
   if (qryCartasClienteSituacao.AsString<>'') then
    qryCartasClienteSituacao.AsString := qryCartasClienteSituacao.AsString+', '+format(ctSEMAVISOATE, [FormatDateTime('dd/mm/yy', qryCartasOcorrenciasemaviso.AsDateTime)])
   else
    qryCartasClienteSituacao.AsString := format(ctSEMAVISOATE, [FormatDateTime('dd/mm/yy', qryCartasOcorrenciasemaviso.AsDateTime)]);
  end;

end;

procedure TdtmConsultaDadosCliente.qrySPCClienteCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qrySPCClientesituacao.AsString := '';

  if (pos('3',qrySPCClientebloqueada.AsString)<>0) then
  begin
   ReFazConsulta(qrySPCOcorrencia,[0,1,2], [qrySPCClientedata.AsVariant,
                                            qrySPCClientecliente.AsVariant,
                                               qrySPCClientetipocliente.AsVariant]);
   if (qrySPCClientesituacao.AsString<>'') then
    qrySPCClientesituacao.AsString := qrySPCClientesituacao.AsString+', '+format(ctSEMSPCATE, [FormatDateTime('dd/mm/yy', qrySPCOcorrenciasemspc.AsDateTime)])
   else
    qrySPCClientesituacao.AsString := format(ctSEMSPCATE, [FormatDateTime('dd/mm/yy', qrySPCOcorrenciasemspc.AsDateTime)]);
  end;

end;

procedure TdtmConsultaDadosCliente.qrySPCClienteAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryParcelasSPC, [0,1],[qrySPCClientecarta.asvariant,
                                       qrySPCClientecartanumero.AsVariant]);
end;

function TdtmConsultaDadosCliente.GetRegistradoSPC: Boolean;
begin
  result := false;
  if not qrySPCCliente.isEmpty then
   if qrySPCClientedataexclusao.AsString='' then
     Result := qrySPCClienteregistrado.AsBoolean;
end;

function TdtmConsultaDadosCliente.GeteAvalista: Boolean;
begin
  result := false;
  if not qrySPCCliente.isEmpty then
   if qrySPCClientedataexclusao.AsString='' then
     result := qrySPCClienteeavalista.AsBoolean;
end;

function TdtmConsultaDadosCliente.GetNome_Avalista_ou_Avalizado: String;
begin
  if not qrySPCCliente.isEmpty then
   if qrySPCClientedataexclusao.AsString='' then
     result := qrySPCClientenome_avalista_ou_avalizado.AsString;
end;


procedure TdtmConsultaDadosCliente.PosicionarSPCUltimoRegistro;
  function PosicionarSPC: boolean;
  begin
    result := false;
    qrySPCCliente.First;
    while not qrySPCCliente.Eof do
    begin
      if (qrySPCClienteregistrado.AsBoolean) and
         (qrySPCClientedataexclusao.AsString = '') then
      begin
        result := true;
        break;
      end;
      qrySPCCliente.Next;
    end;
  end;

  function PosicionarSPCInterno: Boolean;
  begin
    result := false;
    qrySPCCliente.First;
    while not qrySPCCliente.Eof do
    begin
      if (not qrySPCClienteregistrado.AsBoolean) and
         (qrySPCClientedataexclusao.AsString = '') then
      begin
        result := true;
        break;
      end;
      qrySPCCliente.Next;
    end;
  end;
begin
  qrySPCCliente.AfterScroll := nil;
  if not PosicionarSPC then
    if not PosicionarSPCInterno then
      qrySPCCliente.First;
  qrySPCCliente.AfterScroll := qrySPCClienteAfterScroll;
  qrySPCClienteAfterScroll(qrySPCCliente);
end;

function TdtmConsultaDadosCliente.GetTabelaProdutosTrocados: TZDataSet;
begin
  result := qryProdutosTrocados;
end;

function TdtmConsultaDadosCliente.ExisteEvento(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaEventos, Nomecampo, Value);
end;

function TdtmConsultaDadosCliente.GravarProdutosTrocados: Boolean;
begin
  result := qryProdutosTrocados.CheckRequiredFields;
  if result then
    if qryProdutosTrocadossaldo.AsCurrency < 0 then
      result := false;

  if result then
    if qryProdutosTrocadosvalor.AsCurrency = 0 then
      result := false;

  if result then
  begin
   if qryProdutosTrocados.State = dsinsert then
   begin
     spcProdutosTrocadosProximo.Open;
     qryProdutosTrocadosnumero.Value:=spcProdutosTrocadosProximonumero.Value;
     spcProdutosTrocadosProximo.Close;
   end;
   qryProdutosTrocadosusuarioautorizacao.AsInteger:= UsuarioAutorizacao;
   qryProdutosTrocadosdata.Value:=DataHoraLocal;
   qryProdutosTrocadosfilial.Value:= FilialBase;
   qryProdutosTrocados.Post;
   qrysaldoatual.Edit;
   qrySaldoAtualvalor.AsCurrency := qryProdutosTrocadossaldo.AsCurrency;
   qrysaldoatual.Post;
   Result:= Perpetrar([qryprodutostrocados]);
  end
  else
    result:=false;
end;

function TdtmConsultaDadosCliente.IncluirSaldoCliente: boolean;
begin
  qryProdutosTrocados.Append;
  qryProdutosTrocadosdata.Value:= DataHoraLocal;
  qryProdutosTrocadostipo.asstring:= 'E';
  qryProdutosTrocadoscliente.Asinteger := qryProdutosTrocados.Params[0].AsInteger;
  qryProdutosTrocadostipocliente.AsString := qryprodutostrocados.Params[1].AsString;
  qryProdutosTrocadosdefeito.AsBoolean := false;
  qryProdutosTrocadosusuario.AsInteger := UsuarioLogin.CodigoUsuario;
  Result:= true;
end;

procedure TdtmConsultaDadosCliente.AbreTabelaPesquisa(
  TipoConsulta: TtecSaldoCliente);
begin
  case TipoConsulta of
   ctscEVENTO   :abre(ctVendaTabelaConsultaEventos);
  end;
end;

procedure TdtmConsultaDadosCliente.FechaTabelaPesquisa(
  TipoConsulta: TtecSaldoCliente);
begin
  case TipoConsulta of
   ctscEVENTO   :fecha(ctVendaTabelaConsultaEventos);
  end;
end;

procedure TdtmConsultaDadosCliente.Selecionar(
  TipoConsulta: TtecSaldoCliente);
begin
 case TipoConsulta of
  ctscEVENTO  : ProdutosTrocadosEvento := qryConsultaEventoscodigo.AsInteger;
 end
end;

procedure TdtmConsultaDadosCliente.SetProdutosTrocadosEvento(
  const Value: integer);
begin
  if not (qryprodutosTrocados.State in [dsedit,dsinsert]) then
    qryProdutosTrocados.Edit;
  qryProdutosTrocadosevento.AsInteger := qryConsultaEventoscodigo.AsInteger;
end;

function TdtmConsultaDadosCliente.GetConsultaEventos: TZDataSet;
begin
 result := qryConsultaEventos;
end;

procedure TdtmConsultaDadosCliente.dsrProdutosTrocadosDataChange(
  Sender: TObject; Field: TField);
  procedure CalcularSaldo;
  begin
    if qryprodutostrocadostipo.AsString = 'E' then
      qryProdutosTrocadossaldo.AsCurrency := qryProdutosTrocadosvalor.AsCurrency + qrySaldoAtualvalor.AsCurrency
    else
    if qryprodutostrocadostipo.AsString = 'S' then
      qryProdutosTrocadossaldo.AsCurrency := qrySaldoAtualvalor.AsCurrency - qryProdutosTrocadosvalor.AsCurrency;
  end;
begin
  inherited;
  if (field = qryProdutosTrocadosvalor) or
     (field = qryProdutosTrocadostipo) then
    CalcularSaldo
  else
  if (field = qryProdutosTrocadosevento) then
   if qryProcuraEventos.Active then
     if qryProcuraEventos.RecordCount = 1 then
       qryProdutosTrocadostipo.AsString := copy(qryProcuraEventostipodocumento.AsString,1,1);
end;

function TdtmConsultaDadosCliente.GetProdutosTrocadosValor: Currency;
begin
 result := qryProdutosTrocadosvalor.AsCurrency;
end;

function TdtmConsultaDadosCliente.GetProdutosTrocadosSaldo: Currency;
begin
 result := qryProdutosTrocadossaldo.AsCurrency;
end;

procedure TdtmConsultaDadosCliente.qryProdutosTrocadosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutosTrocadosreferencia.AsString<>'' then
    qryProdutosTrocadosDescricao.AsString := qryProdutosTrocadosreferencia.AsString
  else
  if qryProdutosTrocadostipo.AsString = 'E' then
  begin
   if qryProdutosTrocadosproduto.AsString <> '' then
     qryProdutosTrocadosDescricao.AsString := qryProdutosTrocadosDescricaoProduto.asstring
   else
     if qryprodutostrocadoscontrato.asstring<>'' then
       qryProdutosTrocadosDescricao.AsString := 'ENTRADA CANCELAMENTO CONTRATO '+qryprodutostrocadoscontrato.asstring;
  end
  else
  begin
   if qryProdutosTrocadosproduto.AsString <> '' then
     qryProdutosTrocadosDescricao.AsString := qryProdutosTrocadosDescricaoProduto.asstring
   else
     if qryprodutostrocadoscontrato.asstring<>'' then
       qryProdutosTrocadosDescricao.AsString := 'SAIDA NO CONTRATO '+qryprodutostrocadoscontrato.asstring;
  end;
end;

procedure TdtmConsultaDadosCliente.FiltrarChequesDevolvidoseaVencer(
  Filtrar: Boolean);
begin
  qryCheques.Filtered := Filtrar;

//  vTotalChequesDevolvidos := 0;
//  vTotalChequesaVencer    := 0;
                 {
  qryCheques.first;
  while not qryCheques.Eof do
  begin

    if qryChequessituacao.asString = 'D' then
      vTotalChequesDevolvidos := vTotalChequesDevolvidos + qryChequesvalor.asCurrency
    else
    if qryChequesvencto.AsDateTime >= DataServidor then
      vTotalChequesaVencer    := vTotalChequesaVencer + qryChequesvalor.asCurrency;

    qryCheques.next;

  end;
  }
end;

procedure TdtmConsultaDadosCliente.qryChequesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryCheques.Filtered then
    Accept := (qryChequessituacao.asString = 'D') or (qryChequesvencto.AsDateTime >= dataservidor)
  else
    Accept := true;  
end;

procedure TdtmConsultaDadosCliente.qrycashback_saldosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  perpetrar([]);
end;

function TdtmConsultaDadosCliente.IncluirSaldoCashBack: boolean;
var
  vSaldo : Currency;
begin

  vSaldo := qrycashback_saldossaldofinal.asCurrency;

  qrycashback_saldos.Append;

  qrycashback_saldosdata_hora.Value := DataHoraLocal;
  qrycashback_saldosdata_hora_lancamento.Value := qrycashback_saldosdata_hora.Value;
  qrycashback_saldostipo.asstring:= 'E';
  qrycashback_saldoscliente.Asinteger := qryClientecodigo.asinteger;
  qrycashback_saldostipo_cliente.AsString := qryCliente.parambyname('tipocliente').asString;
  qrycashback_saldosusuarioautorizacao.Asinteger := UsuarioAutorizacao;

  qrycashback_saldossaldofinal.asCurrency := vSaldo;
  qrycashback_saldossaldofinalcalc.asCurrency := vSaldo;


  Result:= true;




end;

function TdtmConsultaDadosCliente.GravarCashBack(pOwner: TComponent): Boolean;
begin
  result := qrycashback_saldos.CheckRequiredFields(false, false, true, pOwner);

  if result then
    if qrycashback_saldosvalor.AsCurrency = 0 then
      result := false;

  if result then
  begin
   if qrycashback_saldos.State = dsinsert then
   begin
     qrycashback_saldosProximo.open;
     qrycashback_saldoscodigo.asinteger := qrycashback_saldosProximocodigo.asinteger;
     qrycashback_saldosProximo.close;
   end;

   qryProdutosTrocadosusuarioautorizacao.AsInteger := UsuarioAutorizacao;
   qrycashback_saldosdata_hora.Value := DataHoraLocal;
   qrycashback_saldosdata_hora_lancamento.Value := qrycashback_saldosdata_hora.Value;

   qrycashback_saldos.Post;

   qryIncluirCashBack.ParamByname('codigo').value := qrycashback_saldoscodigo.value;
   qryIncluirCashBack.ParamByName('data_hora').value := qrycashback_saldosdata_hora.value;
   qryIncluirCashBack.ParamByName('cliente').value := qrycashback_saldoscliente.value;
   qryIncluirCashBack.ParamByName('tipo_cliente').value := qrycashback_saldostipo_cliente.value;

   if qrycashback_saldostipo.asString = 'E' then
   begin
     qryIncluirCashBack.ParamByName('status').value := 'ENTRADA MANUAL';
     qryIncluirCashBack.ParamByName('valor').value := qrycashback_saldosvalor.value;
   end
   else
   begin
     qryIncluirCashBack.ParamByName('status').value := 'SAÍDA MANUAL';
     qryIncluirCashBack.ParamByName('valor').value := - qrycashback_saldosvalor.value;
   end;

   qryIncluirCashBack.ParamByName('contrato').clear;
   qryIncluirCashBack.ParamByName('parcela').value := 0;
   qryIncluirCashBack.ParamByName('cancelamento').value := 0;
   qryIncluirCashBack.ParamByName('codigo_apropriacao_devolvida').clear;
   qryIncluirCashBack.ParamByName('usuarioautorizacao').value := qrycashback_saldosusuarioautorizacao.value;
   qryIncluirCashBack.ParamByName('referencia').value := qrycashback_saldosreferencia.value;
   qryIncluirCashBack.ParamByName('codigo_saldo').value := qrycashback_saldoscodigo.value;
   qryIncluirCashBack.ParamByName('codigo_saldo_origem').value := qrycashback_saldoscodigo.value;
   qryIncluirCashBack.ParamByName('cashback').value := qrycashback_saldoscashback.value;
   qryIncluirCashBack.ParamByName('validade').value := qrycashback_saldosvalidade.value;
   qryIncluirCashBack.ParamByName('produto').value := qrycashback_saldosproduto.value;
   qryIncluirCashBack.ParamByName('quantidade').value := 1;
   qryIncluirCashBack.execSql;

   Result:= Perpetrar([qryIncluirCashBack]);

  end
  else
    result:=false;

end;

procedure TdtmConsultaDadosCliente.dsrcashback_saldosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if (field = qrycashback_saldostipo) or
     (field = qrycashback_saldosvalor) then
  begin
    if qrycashback_saldostipo.asString = 'E' then
      qrycashback_saldossaldofinalCalc.asCurrency :=
        qrycashback_saldossaldofinal.asCurrency +
        qrycashback_saldosvalor.asCurrency
    else
      qrycashback_saldossaldofinalCalc.asCurrency :=
        qrycashback_saldossaldofinal.asCurrency -
        qrycashback_saldosvalor.asCurrency;
  end;
end;

procedure TdtmConsultaDadosCliente.AbrirValoresCashBack;
begin
  RefazConsultaPorNome(qrycashback_saldos, ['cliente','tipocliente'],
   [qryClientecodigo.asinteger,
    qryCliente.parambyname('tipocliente').assTring]);

  qrycashback_saldos.last;  
end;

end.
