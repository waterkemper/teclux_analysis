unit dmGerarRemessasPagamentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  biblio,ctConstantes, FR_DSet, FR_DBSet, FR_Class,
  clparametrossistema,
  Variants, DateUtils, CheckLst,cltextprinter, FR_Desgn, dmimprimeboleto,
  clusuario, fmpreviewpadrao, ACBrBase, ACBrBoleto, ACBrUtil,
  ZTransact, DBClient, Provider, ACBrPagFor, ACBrPagForConversao;


type
  TdtmGerarRemessasPagamentos = class(TdtmBasico)
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisNome: TStringField;
    dsrFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisNome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryClientes: TtecQuery;
    dsrClientes: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryConsultaClientesNome: TStringField;
    qryConsultaClientesPessoaNumero: TStringField;
    qryConsultaClientesNomecidade: TStringField;
    qryConsultaClientesestado: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientestipocliente: TStringField;
    qryConsultaClientestipo: TStringField;
    qryFiliaisinscricaoestadual: TStringField;
    qryFiliaiscnpj: TStringField;
    qryContas: TtecQuery;
    qryContasBanco: TIntegerField;
    qryContasAgencia: TIntegerField;
    qryContasConta: TIntegerField;
    qryContasDigito: TStringField;
    qryContasSigla: TStringField;
    qryContasNome: TStringField;
    dsrContas: TtecDataSource;
    qryConsultaContas: TtecQuery;
    qryConsultaContasSigla: TStringField;
    qryConsultaContasNome: TStringField;
    qryConsultaContasConta: TIntegerField;
    qryConsultaContasDigito: TStringField;
    qryConsultaContasTitular: TStringField;
    qryConsultaContasAgencia: TIntegerField;
    qryConsultaContasBanco: TIntegerField;
    qryClientesNome: TStringField;
    qryClientesCodigo: TIntegerField;
    qryClientesTipo: TStringField;
    qryClientesPessoaNumero: TStringField;
    qryClientesTipoCliente: TStringField;
    qryClientesEstado: TStringField;
    qryClientesNomeCidade: TStringField;
    qryContasSequencialPagFor: TIntegerField;
    fdsDuplicatas: TfrDBDataSet;
    qryContasCarteira: TStringField;
    frpEspelhoRemessa: TfrReport;
    qryContasCedente: TStringField;
    qryContaslocalpagamento: TStringField;
    qryContasInstrucoesBoleto: TStringField;
    qryContasUsoDoBanco: TStringField;
    qryContasDigitoAgencia: TStringField;
    qryContasbancoreferencia: TStringField;
    qryContasagenciareferencia: TIntegerField;
    qryContasCNPJAgenciaReferencia: TStringField;
    qryContasCedenteNome: TStringField;
    qryContasCodigoSingular: TLargeintField;
    qryContasCodigoTransmissao: TStringField;
    qryContasIncluirInstrucoesArquivoBanco: TBooleanField;
    qryContasNrViasBoleto: TIntegerField;
    qryContasPadraoCNAB: TStringField;
    qryContasVariacao_Carteira: TStringField;
    qryContasEspecieDocto: TStringField;
    qryContasCodigoProtesto: TStringField;
    qryContasNrDiasProtesto: TIntegerField;
    qryContasconvenio: TLargeintField;
    qryContasdataultimaremessa: TDateField;
    qryContasndiasbaixaautomatica: TIntegerField;
    qryContascodigomora: TStringField;
    qryContasreiniciarsequencialnovadata: TBooleanField;
    qryContastipocobranca: TIntegerField;
    qryContasfilial: TIntegerField;
    qryDuplicatas: TtecQuery;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatascomplemento: TStringField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatascontapagto: TIntegerField;
    qryDuplicatasremessa: TStringField;
    qryDuplicatasselecionar: TBooleanField;
    qryDuplicatasfornecedor: TIntegerField;
    qryDuplicatastipofornecedor: TStringField;
    qryDuplicatasnome: TStringField;
    qryDuplicatasfilial: TIntegerField;
    qryDuplicatasemissao: TDateField;
    qryDuplicataspessoatipo: TStringField;
    qryDuplicatascnpjoucpf: TStringField;
    qryDuplicatasestado: TStringField;
    qryDuplicatasnomebairro: TStringField;
    qryDuplicatasnomecidade: TStringField;
    qryDuplicatasdocumento: TStringField;
    qryDuplicatasrua: TStringField;
    qryDuplicatasendnumero: TIntegerField;
    qryDuplicatasendcomplemento: TStringField;
    qryDuplicatascep: TIntegerField;
    qryDuplicatasnomefilial: TStringField;
    qryDuplicatascnpjfilial: TStringField;
    qryDuplicatascnpjformatado: TStringField;
    qryDuplicatascbpagamento: TStringField;
    dsrDuplicatas: TtecDataSource;
    ACBrPagFor: TACBrPagFor;
    qryFiliaisrazao: TStringField;
    qryFiliaisrua: TStringField;
    qryFiliaisnumero: TIntegerField;
    qryFiliaiscomplemento: TStringField;
    qryFiliaisnomecidade: TStringField;
    qryFiliaisestado: TStringField;
    qryFiliaiscep: TIntegerField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatasvaloracrescimo: TFloatField;
    qryDuplicatasvalorapagar: TCurrencyField;
    qryDuplicatasdatapagfor: TDateField;
//    qryContasndiasbaixaautomatica: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryDuplicatasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure frpEspelhoRemessa_BeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpEspelhoRemessaBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryContasAfterOpen(DataSet: TDataSet);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
  private
    fSituacao: String;
    fIntegracao_Nexxera: Boolean;
    fIncluirSimplesFaturamento: Boolean;
    fIncluirFaturados: Boolean;
    function getNrDocumentoEmpresa: String;
    procedure SetIntegracao_Nexxera(const Value: Boolean);

  protected
    FFiliais          : String;
    FClientes         : String;
    FDataVenctoInicial: String;
    FDataVenctoFinal  : String;
    FDataVendaInicial : String;
    FDataVendaFinal   : String;
    FNotaInicial      : String;
    FNotaFinal        : String;
    FDiaMes           : String;
    FNumero           : String;
    FJaGerados        : Boolean;
    FAutorizacao      : String;
    FCarteira         : String;
    FConvenio         : String;
    FVariacao         : String;

    Function  GetConsultarFiliais:  TTecQuery;
    Function  GetConsultarClientes: TTecQuery;
    Function  GetConsultarContas:   TTecQuery;
    Function  GetCodigoCliente: integer;

  public
    ModoIntermitente : Boolean;
    constructor Create(AOwner: TComponent); Override;
    procedure Selecionar(TipoPesquisa: TtecGerarRemessas);
    procedure AbreTabelaConsulta(TipoPesquisa: TtecGerarRemessas);
    procedure FechaTabelaConsulta(TipoPesquisa: TtecGerarRemessas);

    Function  ExisteFiliais (NomeCampo, Codigo: string): Boolean;
    Function  ExisteClientes(NomeCampo, Codigo: String): Boolean;
    Function  ExisteContas  (NomeCampo, Codigo: String): boolean;

    function GetQtdeLidas: Integer;
    function GetTotalLidas: Real;

    property ConsultarFiliais:  TTecQuery read GetConsultarFiliais;
    property ConsultarClientes: TTecQuery read GetConsultarClientes;
    property ConsultarContas:   TTecQuery read GetConsultarContas;
    property CodigoCliente:     integer   read GetCodigoCliente;
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure SetFiliais(const Value: string);
    procedure SetClientes(const Value: string);
    procedure SetDataVenctoInicial(const Value: String);
    procedure SetDataVenctoFinal(const Value: String);
    procedure SetDataVendaInicial(const Value: String);
    procedure SetDataVendaFinal(const Value: String);
    procedure SetDiaMes(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetJaGerados(const Value: Boolean);
    procedure SetAutorizacao(const Value: String);
    procedure SetCarteira(const Value: String);
    procedure SetConvenio(const Value: String);
    procedure SetVariacao(const Value: String);

    procedure MarcarRegistrosSelecionados(Marcando, Todos: Boolean);
    procedure GerarArquivoACBrCNAB(c240ou400:   TACBrLayoutRemessa;
                                   NomeArquivo: string);

    //---------------------------------------------------------------
    procedure MoveStr(Campo: string;  var PraOnde;  Tamanho: integer);
    procedure MoveNro(Numero: Currency;  Var PraOnde; Size: Integer);
    Procedure MoveVal(Numero: Currency;  Var PraOnde;  Size: Integer);
    function  TiraPonto(vValStr: String): String;
    procedure MoveCrLf(Campo: String;  Var PraOnde;  Size:  Integer);
    function  AbrirParcelas: Boolean;
    procedure AtualizarParcelas;

    property Filiais:  string write SetFiliais;
    property Clientes: string write SetClientes;
    property DataVenctoInicial: string write SetDataVenctoInicial;
    property DataVenctoFinal: string write SetDataVenctoFinal;
    property DataVendaInicial: string write SetDataVendaInicial;
    property DataVendaFinal: string write SetDataVendaFinal;
    property DiaMes: String read FDiaMes write SetDiaMes;
    property Numero: String read FNumero write SetNumero;
    property JaGerados: Boolean read FJaGerados write SetJaGerados;
    property Autorizacao: String read FAutorizacao write SetAutorizacao;
    property Carteira: String read FCarteira write SetCarteira;
    property Convenio: String read FConvenio write SetConvenio;
    property Variacao: String read FVariacao write SetVariacao;
    property QtdeLidas: Integer read GetQtdeLidas;
    property TotalLidas: Real read GetTotalLidas;
    procedure ImprimirEspelhoRemessa;

    property NrDocumentoEmpresa: String read getNrDocumentoEmpresa;

//    procedure ImprimirBoleto;
//    function ObterListaContratosParcelas: String;
    property Integracao_Nexxera: Boolean read fIntegracao_Nexxera write SetIntegracao_Nexxera;
    property IncluirFaturados: Boolean read fIncluirFaturados write fIncluirFaturados;
    property IncluirSimplesFaturamento: Boolean read fIncluirSimplesFaturamento write fIncluirSimplesFaturamento;



  end;


var
  dtmGerarRemessasPagamentos: TdtmGerarRemessasPagamentos;

implementation

uses dmtecsoft,Math;

{$R *.dfm}



procedure TdtmGerarRemessasPagamentos.SetDiaMes(const Value: String);
begin
  FDiaMes := Value;
  if FDiaMes = '' then begin
     MensagemAviso(ctDIAMESBRANCO);
     Exit;
  end;
end;

procedure TdtmGerarRemessasPagamentos.SetNumero(const Value: String);
begin
  FNumero:= Value;
  if FNumero = '' then begin
     MensagemAviso(ctNumeroSequencialBranco);
     Exit;
  end;
end;

procedure TdtmGerarRemessasPagamentos.SetAutorizacao(const Value: String);
begin
   if qryContasBanco.AsInteger = 237 then begin   {-- BRADESCO --}
      FAutorizacao:= Value;
      {if FAutorizacao = '' then begin
         MensagemAviso(ctAUTORIZACAOBRANCO);
         Exit;
      end;}
   end;
end;

procedure TdtmGerarRemessasPagamentos.SetCarteira(const Value: String);
begin
   if qryContasBanco.AsInteger = 1 then begin   {-- BANCO DO BRASIL --}
      FCarteira:= Value;
      {if FCarteira = '' then begin
         MensagemAviso(ctCARTEIRACONVENIONAOCADASTRADO);
         Exit;
      end}
   end;
end;


procedure TdtmGerarRemessasPagamentos.SetConvenio(const Value: String);
begin
  if qryContasBanco.AsInteger = 1 then begin   {-- BANCO DO BRASIL --}
     FConvenio:= Value;
     {if FConvenio = '' then begin
        MensagemAviso(ctCARTEIRAEMBRANCO);
        Exit;
     end}
  end;
end;

procedure TdtmGerarRemessasPagamentos.SetVariacao(const Value: String);
begin
  if qryContasBanco.AsInteger = 1 then begin    {-- BANCO DO BRASIL --}
     FVariacao := Value;
     {if FVariacao = '' then begin
        MensagemAviso(ctCARTEIRACONVENIONAOCADASTRADO);
        Exit;
     end}
  end;
end;


procedure TdtmGerarRemessasPagamentos.SetJaGerados(const Value: Boolean);
begin
  FJaGerados := Value;
  if FJaGerados then
     qryDuplicatas.MacroByName('Gerados').Clear //  := 'and ((p.remessa is null) or (p.remessa is not null))'
  else
     qryDuplicatas.MacroByName('Gerados').AsString  := 'and d.remessa is null' ;
end;

procedure TdtmGerarRemessasPagamentos.AbreTabelaConsulta(TipoPesquisa: TtecGerarRemessas);
begin
  case TipoPesquisa of
    grsFILIAIS  : Abre(ctConsultaFiliais);
    grsCLIENTES : begin
                     qryConsultaClientes.MacroByName('ClausulaWHERE').AsString:= 'WHERE False';
                     Abre(ctConsultaClientes);
                  end;
    grsCONTAS:    Abre(ctConsultaContas);
  end;
end;

constructor TdtmGerarRemessasPagamentos.Create(AOwner: TComponent);
begin
  inherited;
//  qryFiliais.Params[0].AsInteger := FilialBase;
  qryFiliais. Tag:= ctTabelas;
  qryClientes.Tag:= ctTabelas;
  qryContas.  Tag:= ctTabelas;

  qryConsultaFiliais. Tag:= ctConsultaFiliais;
  qryConsultaClientes.Tag:= ctConsultaClientes;
  qryConsultaContas.  Tag:= ctConsultaContas;

  qryClientes.Params[0].AsInteger:= 0;
  qryClientes.Params[1].AsString := 'C';

//  ACBrBoleto1 := TACBrBoleto.Create(Self);
end;

Function TdtmGerarRemessasPagamentos.ExisteFiliais(NomeCampo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais,NomeCampo,Codigo);
end;

Function TdtmGerarRemessasPagamentos.ExisteClientes(NomeCampo, Codigo: String): boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if NomeCampo = 'Nomecidade' then
    NomeCampo:= 'c.Nome'
  else if NomeCampo = 'tipocliente' then
    NomeCampo:= 'vf.tipo'
  else
    NomeCampo:= 'vf.' + NomeCampo;

  qryConsultaClientes.MacroByName('ClausulaWHERE').AsString:= Format(SQL, [NomeCampo, Codigo, '%']);
  qryConsultaClientes.close;
  qryConsultaClientes.Open;
  Result := Not qryConsultaClientes.IsEmpty;
end;

Function TdtmGerarRemessasPagamentos.ExisteContas(NomeCampo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaContas,NomeCampo,Codigo);
end;

procedure TdtmGerarRemessasPagamentos.FechaTabelaConsulta(TipoPesquisa: TtecGerarRemessas);
begin
   case TipoPesquisa of
      grsFILIAIS:  Fecha(ctConsultaFiliais);
      grsCLIENTES: Fecha(ctConsultaClientes);
      grsCONTAS:   Fecha(ctConsultaContas);
   end;
end;

Function TdtmGerarRemessasPagamentos.GetConsultarFiliais: TTecQuery;
begin
  Result:= qryConsultaFiliais;
end;

Function TdtmGerarRemessasPagamentos.GetConsultarClientes: TTecQuery;
begin
  Result:= qryConsultaClientes;
end;

Function TdtmGerarRemessasPagamentos.GetConsultarContas: TTecQuery;
begin
  Result:= qryConsultaContas;
end;


procedure TdtmGerarRemessasPagamentos.Selecionar(TipoPesquisa: TtecGerarRemessas);
begin
   case TipoPesquisa of
      grsFILIAIS:  RefazConsulta(qryFiliais,  [0], [qryConsultaFiliaisCodigo. AsInteger]);
      grsCLIENTES: RefazConsulta(qryClientes, [0,1], [qryConsultaClientesCodigo.AsInteger, qryConsultaClientestipo.AsString]);
      grsCONTAS:   RefazConsulta(qryContas,   [0], [qryConsultaContasConta.   AsInteger]);
   end;
end;

Function TdtmGerarRemessasPagamentos.GetCodigoCliente: integer;
begin
  Result := qryClientesCodigo.AsInteger;
end;


procedure TdtmGerarRemessasPagamentos.SetFiliais(const Value: string);
begin
  if (Value <> '') then
    qryDuplicatas.MacroByName('Filial').AsString  := 'and (f.codigo = ' + Value + ')'
  else
    qryDuplicatas.MacroByName('Filial').AsString  := '';
end;

procedure TdtmGerarRemessasPagamentos.SetClientes(const Value: string);
begin
  if (Value <> '') then
    qryDuplicatas.MacroByName('Cliente').AsString := 'and (dp.fornecedor = ' + Value + ')'
  else
    qryDuplicatas.MacroByName('Cliente').AsString  := '';
end;

procedure TdtmGerarRemessasPagamentos.SetDataVenctoInicial(const Value: string);
begin
  FDataVenctoInicial := Value;
  qryDuplicatas.ParamByName('venctoinicial').AsString := FDataVenctoInicial;
end;

procedure TdtmGerarRemessasPagamentos.SetDataVenctoFinal(const Value: string);
begin
  FDataVenctoFinal := Value;
  qryDuplicatas.ParamByName('venctofinal').AsString := FDataVenctoFinal;

  if (FDataVenctoInicial <> '') and (FDataVenctoFinal <> '')  then
    qryDuplicatas.MacroByName('DataVencto').AsString := 'and d.datavencto between :venctoinicial and :venctofinal'
  else
  if (FDataVenctoInicial <> '') and (FDataVenctoFinal = '')  then
    qryDuplicatas.MacroByName('DataVencto').AsString := 'and d.datavencto >= :venctoinicial'
  else
  if (FDataVenctoInicial = '') and (FDataVenctoFinal <> '')  then
    qryDuplicatas.MacroByName('DataVencto').AsString := 'and d.datavencto <= :venctofinal'
  else
    qryDuplicatas.MacroByName('DataVencto').AsString := '';

end;

procedure TdtmGerarRemessasPagamentos.SetDataVendaInicial(const Value: String);
begin
  FDataVendaInicial := Value;
end;

procedure TdtmGerarRemessasPagamentos.SetDataVendaFinal(const Value: String);
begin
  FDataVendaFinal := Value;
  if (FDataVendaInicial <> '') and (FDataVendaFinal <> '')  then
     qryDuplicatas.MacroByName('DataEmissao').AsString := format(' and dp.emissao between (%s) and (%s) ',
                                                       [quotedstr(FDataVendaInicial),
                                                        quotedstr(FDataVendaFinal)])
  else
  if (FDataVendaInicial <> '') and (FDataVendaFinal = '')  then
     qryDuplicatas.MacroByName('DataEmissao').AsString := format(' and dp.emissao >= %s ', [quotedstr(FDataVendaInicial)])
  else
  if (FDataVendaInicial = '') and (FDataVendaFinal <> '')  then
     qryDuplicatas.MacroByName('DataEmissao').AsString := format(' and dp.emissao <= %s ', [quotedstr(FDataVendaFinal)])
  else
     qryDuplicatas.MacroByName('DataEmissao').AsString := '';
end;


//------ Funcao tirar ponto dos valores -------------------------------
Function TdtmGerarRemessasPagamentos.TiraPonto(vValStr: String): String;
Var  I: Integer;
begin
  Result := '';
  for I := 1 to Length(vValStr) do begin
    if (Copy(vValStr,I,1) = '.') or (Copy(vValStr,I,1) = ',') then
       Result := Result + ''
    else
       Result := Result + Copy(vValStr,I,1);
  end;
end;

procedure TdtmGerarRemessasPagamentos.MoveStr(Campo: string; var PraOnde; Tamanho: integer);
begin
   Campo:= CenDirEsq(ANSIUpperCase(RetiraAcento(Campo)),Tamanho,' ','E');
   Move(Campo[1],PraOnde,Tamanho);
End; {MoveStr}


procedure TdtmGerarRemessasPagamentos.MoveCrLf(Campo: String;  Var PraOnde;  Size:  Integer);
begin
  Move(CrLf, PraOnde, Size);
End; {MoveCrlf}


Procedure TdtmGerarRemessasPagamentos.MoveNro(Numero: Currency;  Var PraOnde;  Size: Integer);
Var Campo: String;
Begin
  Campo := FloatToStr(Numero);
  While Length(Campo) < Size do
        Campo:= '0'+ Campo;

  Move(Campo[1],PraOnde,Size);
End; {MoveNro}

Procedure TdtmGerarRemessasPagamentos.MoveVal(Numero: Currency;  Var PraOnde;  Size: Integer);
Var Campo: String;
Begin
   Campo := TIRAPONTO(FormatFloat('00000000000.00', Numero));
   While Length(Campo) < Size do
         Campo:= '0'+Campo;

   Move(Campo[1], PraOnde, Size);
End; {MoveVal}



{--------------------------------------------------------------------- Padrão CNAB240 ou CNAB400 --}
procedure TdtmGerarRemessasPagamentos.GerarArquivoACBrCNAB(c240ou400:   TACBrLayoutRemessa;
                                                 NomeArquivo: string);
var {ACBrBoleto1:      TACBrBoleto;}
{    Titulo:           TACBrTitulo;}
    Gerou:            Boolean;
    NomeArq:          String;
    TotalVencimentos: Currency;
    StrGeral: string;

    TotalLote: Double;

begin
//  ACBrPagFor.Limpar;

  if qrycontas.state = dsedit then
    perpetrar([qrycontas]);


  Gerou  := False;
  NomeArq:= ChangeFileExt(ExtractFileName(NomeArquivo), EmptyStr);
  GuardarRegistroAtual(qryDuplicatas, true);
  TotalVencimentos := 0;

  try

    ACBrPagFor.Arquivos.Clear;

    with ACBrPagFor.Configuracoes.Geral do
    begin
      case qryContasBanco.AsInteger of
        001:             Banco := pagBancoDoBrasil;
        033, 008, 353:   Banco := pagSantander;
        104:             banco   := pagCaixaEconomica;
        237, 087:      	 banco   := pagBradesco;
        341     :     	 banco   := pagItau;
        041,056 : 	 banco   := pagBanrisul;
        748     :        banco   := pagSicredi;
      end;
    end;

    with ACBrPagFor do
    begin

      with Arquivos.New.PagFor do
      begin

        Geral.Banco := Configuracoes.Geral.Banco;
        // Utilizado Somente quando houver o segmento C
        Geral.SubstitutaBanco := Configuracoes.Geral.SubstitutaBanco;

        //////////////////////////////////////////////////////////////////////////
        // Registro 0
        //////////////////////////////////////////////////////////////////////////
        // TTipoInscricao   = (tiIsento, tiCPF, tiCNPJ, tiPISPASEP, tiOutros);
        Registro0.Empresa.Inscricao.Tipo := tiCNPJ;
        Registro0.Empresa.Inscricao.Numero := qryFiliaiscnpj.asString;
        Registro0.Empresa.Convenio := qryContasconvenio.asString ;
        Registro0.Empresa.ContaCorrente.Agencia.Codigo := qryContasAgencia.asinteger;
        Registro0.Empresa.ContaCorrente.Agencia.DV := qryContasDigitoAgencia.asString;
        Registro0.Empresa.ContaCorrente.Conta.Numero := qryContasConta.asinteger;
        Registro0.Empresa.ContaCorrente.Conta.DV := qryContasDigito.asString;
        Registro0.Empresa.ContaCorrente.DV := qryContasDigito.asString;
        Registro0.Empresa.ContaCorrente.Conta.TipoConta := 1;
        Registro0.Empresa.Nome := qryFiliaisrazao.asString;
        Registro0.NomeBanco := BancoToDesc(Configuracoes.Geral.Banco);
        Registro0.Arquivo.Codigo := taRemessa;
        Registro0.Arquivo.DataGeracao := DataServidor;
        Registro0.Arquivo.HoraGeracao := HoraServidor;
        Registro0.Arquivo.Sequencia := qryContasSequencialPagFor.asinteger;
        Registro0.Arquivo.Densidade := 01600;
        Registro0.ReservadoBanco := '';
        Registro0.ReservadoEmpresa := '';


        with Lote.New do
        begin
          ////////////////////////////////////////////////////////////////////////
          // Registro 1
          ////////////////////////////////////////////////////////////////////////
          TotalLote := 0.0;

          Registro1.Servico.Operacao := toCredito;
          Registro1.Servico.TipoServico := tsCobranca;
          Registro1.Servico.FormaLancamento := flLiquidacaoTitulosOutrosBancos; // Titulo Proprio Banco
          Registro1.Empresa.Inscricao.Tipo := tiCNPJ;
          Registro1.Empresa.Inscricao.Numero := qryFiliaiscnpj.asString; // CNPJ
          Registro1.Empresa.Convenio := qryContasconvenio.asString;
          Registro1.Empresa.ContaCorrente.Agencia.Codigo := qryContasAgencia.asinteger;
          Registro1.Empresa.ContaCorrente.Agencia.DV := qryContasDigitoAgencia.asString;
          Registro1.Empresa.ContaCorrente.Conta.Numero := qryContasConta.asinteger;
          Registro1.Empresa.ContaCorrente.Conta.DV := qryContasDigito.asString;
          Registro1.Empresa.ContaCorrente.DV := qryContasDigito.asString;
          Registro1.Empresa.ContaCorrente.Conta.TipoConta := 1;
          Registro1.Empresa.Nome := qryFiliaisrazao.asString;
          Registro1.Informacao1 := '';
          Registro1.Endereco.Logradouro := qryFiliaisrua.asString;
          Registro1.Endereco.Numero := qryFiliaisnumero.asinteger;
          Registro1.Endereco.Complemento := qryFiliaiscomplemento.asString;
          Registro1.Endereco.Cidade := qryFiliaisnomecidade.asString;
          Registro1.Endereco.CEP := StrToIntDef(qryFiliaiscep.asString, 0);
          Registro1.Endereco.Estado := qryFiliaisestado.asString;
          ////////////////////////////////////////////////////////////////////////
          // Segmento J
          ////////////////////////////////////////////////////////////////////////

          qryDuplicatas.First;
          while not qryDuplicatas.Eof do
          begin

            if qryDuplicatasSelecionar.AsBoolean then
            begin
              with SegmentoJ.New do
              begin

                CodMovimento := imInclusaoRegistroDetalheLiberado;
                CodigoBarras := qryDuplicatascbpagamento.asString;
                NomeCedente := qryDuplicatasnome.asString;
                DataVencimento := qryDuplicatasdatavencto.asDateTime;
                ValorTitulo := qryDuplicatasvalorvencto.AsCurrency;

                Desconto := qryDuplicatasvalordesconto.AsCurrency;;
                Acrescimo := qryDuplicatasvaloracrescimo.AsCurrency;;
                DataPagamento := qryDuplicatasdatapagfor.AsDateTime;
                ValorPagamento := qryDuplicatasvalorapagar.AsCurrency;;

                QtdeMoeda := 0.0;
                ReferenciaSacado := '';//FormatFloat('00000000000000000000', 1);
                CodigoMoeda := 09;

                TotalLote := TotalLote + ValorPagamento;

              end;

              qryDuplicatas.Edit;
              qryDuplicatasRemessa.    AsString := qryContasSequencialPagFor.asString;
              qryDuplicatascontapagto.AsString := qryContasConta.AsString;
//              qryDuplicatasdigverificadornossonumero.asString := ACBrBoleto.Banco.CalcularDigitoVerificador(titulo);
              qryDuplicatas.Post;

            end;

            qryDuplicatas.next;

          end;

          ////////////////////////////////////////////////////////////////////////
          // Registro 5
          ////////////////////////////////////////////////////////////////////////
          Registro5.Valor := TotalLote;
          Registro5.QtdeMoeda := 0.0;
          Registro5.NumAvisoDebito := 0;
        end;
      end;

      ACBrPagFor.GravarTXT(NomeArquivo);

      Gerou := True;

    end;

  finally
    VoltarRegistroAtual(qryDuplicatas);
  end;

  if Gerou then
  begin
    qryContas.Edit;
    qryContasSequencialPagFor.AsInteger:= qryContasSequencialPagFor.AsInteger + 1;
    qryContasdataultimaremessa.asdatetime := dataservidor;
    qryContas.Post;
    Perpetrar([qryDuplicatas,qryContas]);

    MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[NomeArquivo]));

  end
  else
  begin
    Rollback([qryDuplicatas,qryContas]);
    MensagemAviso(format(ctARQUIVOERRO,['de geração']));
  end;

end; {GerarArquivoACBrCNAB}


Function TdtmGerarRemessasPagamentos.AbrirParcelas: Boolean;
begin
  result := true;
  qryDuplicatas.DisableControls;
  try
    ReFazConsulta(qryDuplicatas,[],[]);
  except
    on E: Exception do
    begin
      result := false;
      if (pos('more than one row', E.Message)<>0) and Integracao_Nexxera then
        MensagemAviso('Erro de configuração em ''Bancos''. Existem mais de uma conta para uma mesma filial marcada para integração Nexxera')
      else
        ShowMessage(E.Message);
    end;
  end;

  if result then
  begin
    Result := not qryDuplicatas.IsEmpty;
    qryDuplicatas.EnableControls;

  end;

end;

procedure TdtmGerarRemessasPagamentos.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  qryContas.Close;
end;

procedure TdtmGerarRemessasPagamentos.MarcarRegistrosSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryDuplicatas,
                  qryDuplicatasSelecionar,
                  qryDuplicatasValorVencto,
                  Marcando,
                  Todos, 4, false);
end;


function TdtmGerarRemessasPagamentos.GetQtdeLidas: Integer;
begin
   Result:= qryDuplicatas.RecordCount;
end;

function TdtmGerarRemessasPagamentos.GetTotalLidas: Real;
begin
   Result:= TotalizarValores[qryDuplicatas, qryDuplicatasValorVencto, nil];
end;

procedure TdtmGerarRemessasPagamentos.MarcarSelecionados(Marcando, Todos: Boolean);
var Pos: TBookmark;
    I  : Integer;

    procedure AtualizarValores;
    begin
       if qryDuplicatasSelecionar.AsBoolean then begin
          FQtdeMarcados  := FQtdeMarcados  + 1;
          FTotalMarcados := FTotalMarcados + qryDuplicatasValorVencto.AsCurrency;
       end
       else begin
          FQtdeMarcados  := FQtdeMarcados  - 1;
          FTotalMarcados := FTotalMarcados - qryDuplicatasValorVencto.AsCurrency;
       end;
    end;

begin
   with qryDuplicatas do
      if not IsEmpty
      then if not Todos then begin
              Edit;
              qryDuplicatasSelecionar.AsBoolean:= not qryDuplicatasSelecionar.AsBoolean;
              Post;
              AtualizarValores;
           end
           else begin
              Pos:= GetBookmark;
              try
                 DisableControls;
                 First;
                 for I:= 1 to RecordCount do begin
                     Edit;
                     if Marcando then begin
                        if not qryDuplicatasSelecionar.AsBoolean then begin
                           qryDuplicatasSelecionar.AsBoolean := True;
                           AtualizarValores;
                        end
                     end
                     else begin
                        if qryDuplicatasSelecionar.AsBoolean then begin
                           qryDuplicatasSelecionar.AsBoolean:= False;
                           AtualizarValores;
                        end;
                     end;
                     Post;
                     Next;
                 end;
              finally
                 GotoBookmark(Pos);
                 FreeBookmark(Pos);
                 EnableControls;
              end;
           end;
end;


procedure TdtmGerarRemessasPagamentos.AtualizarParcelas;
var
  Flag : Boolean;
begin
  Flag := False;
  qryDuplicatas.DisableControls;
  qryDuplicatas.First;
  while not qryDuplicatas.Eof do begin
    if qryDuplicatasSelecionar.AsBoolean then begin
      Flag := True;

      qryDuplicatas.Edit;
      qryDuplicatascontapagto.AsString := qryContasConta.AsString;
      qryDuplicatas.Post;
{
      qryAtualizarParcelas.ParamByName('contaboleto').AsInteger := qryContasConta.AsInteger;
      qryAtualizarParcelas.ParamByName('Contrato').AsString     := qryDuplicatasContrato.AsString;
      qryAtualizarParcelas.ParamByName('Numero').AsInteger      := qryDuplicatasNumero.AsInteger;
      qryAtualizarParcelas.ExecSql;
}
    end;
    qryDuplicatas.Next;
  end;
  qryDuplicatas.EnableControls;

  if not Flag then begin
    MensagemAviso('Não foi selecionada nenhuma Parcela.');
    Exit;
  end
  else
  begin
   Perpetrar([qryDuplicatas]);
   MensagemAviso('Parcelas gravadas com sucesso.');
  end;
//  qryDuplicatas.Close;
end;




procedure TdtmGerarRemessasPagamentos.ImprimirEspelhoRemessa;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  CabecalhoDatas: String;
begin
 qryDuplicatas.Filter := 'selecionar';
 qryDuplicatas.Filtered := true;
 frVariables['RAZAOFILIALBASE']  := NomeFilialBase;
 frVariables['ENDERECO_Bairro']   := RuaFilialBase+ ' - '+BairroFilialBase;
 frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
 frVariables['titulo'] := 'REMESSA DE PAGAMENTO A FORNECEDORES'+sLineBreak+
                          qryContasSigla.AsString+' - '+
                          qryContasNome.AsString+' - C/C '+
                          qryContasConta.AsString+'-'+qryContasDigito.AsString;
 frVariables['ClienteUsaContrato'] := ParSistema.ClienteUsaContrato;
 
// frpEspelhoRemessa.DesignReport;
 frmPreview := TfrmPreviewPadrao.create(self);
 try
  Relatorio := frmPreview.frCompositeReport;
  with frmPreview do
  begin
   frCompositeReport.Reports.Clear;
   frCompositeReport.Reports.Add(frpEspelhoRemessa);
  end;
  Relatorio.Preview := frmPreview.frPreviewPadrao;
  Relatorio.ShowReport;
  frmPreview.ShowModal;

 finally

  frmPreview.Free;
  qryDuplicatas.Filtered := false;

 end;

end;

procedure TdtmGerarRemessasPagamentos.qryDuplicatasFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept := qryDuplicatasSelecionar.AsBoolean;
end;

procedure TdtmGerarRemessasPagamentos.frpEspelhoRemessa_BeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpEspelhoRemessa,view);
end;

function TdtmGerarRemessasPagamentos.getNrDocumentoEmpresa: String;
begin
  result := qryDuplicatasdocumentopag.AsString
end;

procedure TdtmGerarRemessasPagamentos.frpEspelhoRemessaBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpEspelhoRemessa,view);
end;

procedure TdtmGerarRemessasPagamentos.qryContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qryContas.recordcount<> 0 then
    if (qryContasreiniciarsequencialnovadata.AsBoolean and (qryContasdataultimaremessa.asDatetime <> dataServidor)) or (qryContasSequencialPagFor.asinteger = 0) then
    begin
      qryContas.edit;
      qryContasSequencialPagFor.asinteger := 1;
      qryContas.post;
      perpetrar([qryContas]);
    end;
end;

procedure TdtmGerarRemessasPagamentos.SetIntegracao_Nexxera(const Value: Boolean);
begin
  fIntegracao_Nexxera := Value;
//  qryDuplicatas.parambyname('Integracao_Nexxera').asBoolean := value;
//  qryDuplicatas.parambyname('conta').asinteger := qryContasConta.asinteger;


end;


procedure TdtmGerarRemessasPagamentos.qryDuplicatasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryDuplicatasvalorapagar.asCurrency := qryDuplicatasvalorvencto.asCurrency -
                                         qryDuplicatasvalordesconto.AsCurrency +
                                         qryDuplicatasvaloracrescimo.AsCurrency
end;

end.
