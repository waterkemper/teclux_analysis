unit dmrelatorioduplicatas;
interface

uses
  SysUtils, Classes, DB,Graphics,
  // Constantes
  ctconstantes, biblio, clusuario,
  // Componentes
  cpdatasource, cpquery,
  // Terceiros
  FR_DSet, FR_DBSet, FR_Class, ZQuery, ZPgSqlQuery,
  // Repositorio
  dmtecsoft, dmbasico, clparametrossistema, fmpreviewpadrao,Dialogs,
  ZTransact, Variants, CheckLst, frxClass, frxDBSet, forms;

type
  TdtmRelatorioDuplicatas = class(TdtmBasico)
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaGrupoFiliais: TtecQuery;
    qryConsultaGrupoFiliaisdescricao: TStringField;
    qryConsultaGrupoFiliaiscodigo: TIntegerField;
    qryBancos: TtecQuery;
    qryBancoscodigo: TIntegerField;
    qryBancosnome: TStringField;
    dsrBanco: TtecDataSource;
    qryConsultaBancos: TtecQuery;
    qryConsultaBancosnome: TStringField;
    qryConsultaBancoscodigo: TIntegerField;
    qryDuplicatas: TtecQuery;
    qryFornecedores: TtecQuery;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedoresnome: TStringField;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaFornecedoresnome: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryConsultaFornecedorestipo: TStringField;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasfilialemissao: TIntegerField;
    qryDuplicatasnota: TIntegerField;
    qryDuplicatasfornecedor: TIntegerField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatasdatapagto: TDateField;
    qryDuplicatasvalorpagto: TFloatField;
    qryDuplicatasserie: TStringField;
    fdsDuplicatasPagar: TfrDBDataSet;
    frpPagamentosEfetuados: TfrReport;
    frpResumoPagamentosEfetuados: TfrReport;
    qryFornecedorestipo: TStringField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatasprevisao: TBooleanField;
    qryDuplicatastipofornecedor: TStringField;
    qryGruposFornecedores: TtecQuery;
    dsrGruposFornecedores: TtecDataSource;
    qryConsultaGruposFornecedores: TtecQuery;
    qryGruposFornecedorescodigo: TIntegerField;
    qryGruposFornecedoresnome: TStringField;
    qryConsultaGruposFornecedoresnome: TStringField;
    qryConsultaGruposFornecedorescodigo: TIntegerField;
    qryDuplicatasemissao: TDateField;
    qryDuplicatasnomefilialemissao: TStringField;
    qryDuplicatasgrupofilialemissao: TIntegerField;
    qryDuplicatasnomegrupofilialemissao: TStringField;
    qryDuplicatasnomefornecedor: TStringField;
    qryDuplicatasValorJurosPagos: TCurrencyField;
    qryDuplicatasValorDescReceb: TCurrencyField;
    qryConsultaFornecedorespessoanumero: TStringField;
    qryConsultaFornecedorestipocliente: TStringField;
    qryConsultaFornecedoresestado: TStringField;
    qryConsultaFornecedoresnomecidade: TStringField;
    qryDuplicatasobservacao: TStringField;
    qryTiposPagamentos: TtecQuery;
    dsrTiposPagamentos: TtecDataSource;
    qryConsultaTiposPagamentos: TtecQuery;
    qryTiposPagamentoscodigo: TIntegerField;
    qryTiposPagamentosdescricao: TStringField;
    qryConsultaTiposPagamentosdescricao: TStringField;
    qryConsultaTiposPagamentoscodigo: TIntegerField;
    qryDuplicatasContaPagto: TIntegerField;
    qryDuplicatasdiferenciar: TBooleanField;
    qryDuplicatasbancocobranca: TIntegerField;
    qryConsultaBancossigla: TStringField;
    qryDuplicatassiglabancocobranca: TStringField;
    qryDuplicatassiglabancopagto: TStringField;
    qryDuplicatasobs: TStringField;
    qryDuplicatasevento: TIntegerField;
    qryDuplicatasdescricao_evento: TStringField;
    qryDuplicatascomplemento: TStringField;
    qryDuplicatasdocumento: TStringField;
    qryDuplicatasadiantamento: TBooleanField;
    qryDuplicatasdda: TBooleanField;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryGrupoFiliais: TtecQuery;
    qryGrupoFiliaiscodigo: TIntegerField;
    qryGrupoFiliaisdescricao: TStringField;
    qryDuplicatasdatalancto: TDateField;
    frxDBDataset1: TfrxDBDataset;
    frxDuplicatasporCompetencia: TfrxReport;
    tecQuery1: TtecQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    IntegerField4: TIntegerField;
    StringField2: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateField2: TDateField;
    FloatField3: TFloatField;
    IntegerField5: TIntegerField;
    BooleanField1: TBooleanField;
    DateField3: TDateField;
    StringField3: TStringField;
    IntegerField6: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    StringField6: TStringField;
    IntegerField7: TIntegerField;
    BooleanField2: TBooleanField;
    IntegerField8: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField9: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    BooleanField3: TBooleanField;
    BooleanField4: TBooleanField;
    DateField4: TDateField;
    qryDuplicatasmesano: TMemoField;
    frxDBDataset2: TfrxDBDataset;
    qryDuplicatasvalor: TFloatField;
    qryDuplicatasregimedecaixa: TBooleanField;
    qryDuplicatastotalvalorjurospagos: TFloatField;
    qryDuplicatastotalvalordescreceb: TFloatField;
    qryDuplicatastotalvalorpagto: TFloatField;
    frxResumoDuplicatasporCompetencia: TfrxReport;
    frxReport1: TfrxReport;
    tecQuery2: TtecQuery;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField13: TStringField;
    IntegerField13: TIntegerField;
    StringField14: TStringField;
    DateField5: TDateField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateField6: TDateField;
    FloatField6: TFloatField;
    IntegerField14: TIntegerField;
    BooleanField5: TBooleanField;
    DateField7: TDateField;
    StringField15: TStringField;
    IntegerField15: TIntegerField;
    StringField16: TStringField;
    StringField17: TStringField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    StringField18: TStringField;
    IntegerField16: TIntegerField;
    BooleanField6: TBooleanField;
    IntegerField17: TIntegerField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    IntegerField18: TIntegerField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    BooleanField7: TBooleanField;
    BooleanField8: TBooleanField;
    DateField8: TDateField;
    MemoField1: TMemoField;
    FloatField7: TFloatField;
    BooleanField9: TBooleanField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    qryDuplicatasqtparcelas: TLargeintField;
    qryDuplicatascomplementoduplicata: TStringField;
    frpDuplicatasPagar: TfrReport;
    frpResumoDuplicatasPagar: TfrReport;
    qryDuplicatascnpjfilial: TStringField;
    qryDuplicatascnpj_cpf_fornecedor: TStringField;
    qryDuplicatasEventoDescricao: TStringField;
    qryDuplicatasUsuarioLancamento: TStringField;
    qryDuplicatasUsuarioPagamento: TStringField;
    qryDuplicatasvalorliquido: TCurrencyField;
    procedure qryFornecedoresBeforeOpen(DataSet: TDataSet);
    procedure frpDuplicatasPagarBeforePrint(Memo: TStringList;
     View: TfrView);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure frpPagamentosEfetuadosBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpResumoPagamentosEfetuadosBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryDuplicatasAfterOpen(DataSet: TDataSet);
    procedure qryDuplicatasBeforeOpen(DataSet: TDataSet);
    procedure frxDuplicatasporCompetenciaGetValue(const VarName: String;
      var Value: Variant);
    procedure frpResumoDuplicatasPagarBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    FAgruparData: Boolean;
    fAdiantamentos: Integer;
    fDebito_Direto_Autorizado: Integer;
    fAgruparDocumentosPag: Boolean;
    fListaCondicionalDocumentosPag: String;
    FPeriodoInicialEmissao: String;
    FPeriodoFinalEmissao: String;
    procedure SetAgruparData(const Value: Boolean);
    procedure SetAdiantamentos(const Value: Integer);
    function GetListaFiliais: TLista;
    function GetListaGruposFiliais: TLista;
    procedure SetConta(const Value: String);
    procedure SetListaCondicionalDocumentosPag(const Value: String);
  protected

    FAgruparFornecedor: Boolean;
    FAgruparFilial: Boolean;
    FAgruparGrupoFilial: Boolean;
    FParametroCabecalho: String;
    FResumo: Integer;
    FTipoRelatorio: Integer;
    FPeriodoFinal: String;
    FPeriodoInicial: String;
    procedure MontaIntervaloPeriodo;
    procedure SetResumo(const Value: Integer);
    procedure SetBanco(const Value: String);
    procedure SetPeriodoFinal(const Value: String);
    procedure SetPeriodoInicial(const Value: String);
    procedure SetFornecedor(const Value: String);
    procedure SetGrupoFornecedor(const Value: String);
    procedure SetEvento(const Value: String);
    procedure SetPrevisao(const Value: Integer);
    procedure SetTipoRelatorio(const Value: Integer);
    procedure SetAutorizadas(const Value: Integer);
    procedure SetTipoFornecimento(const Value: String);
    procedure SetTipoPagamento(const Value: String);
    function GetTipoPessoa: String;
    function GetConsultarFornecedores: TtecQuery;
    function GetConsultaGrupoFornecedores: TtecQuery;
    function GetConsultaBancos: TtecQuery;
    function GetConsultaFiliais: TtecQuery;
    function GetConsultaGrupoFiliais: TtecQuery;
    function GetConsultaTiposPagamentos: TtecQuery;
  public
   FOrdenacaoDuplicatas: String;
   function  GerarRelatorio: Boolean;
   procedure ImprimirRelatorio;
   procedure AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioDuplicatas);
   procedure FechaTabelaPesquisa(TipoPesquisa: TtecRelatorioDuplicatas);
   procedure Selecionar(TipoPesquisa: TtecRelatorioDuplicatas);
   function ExisteFornecedores(Campo, Codigo: String): Boolean;
   function ExisteGrupoFornecedores(Campo, Codigo: String): Boolean;
   function ExisteFiliais(Campo, Codigo: string): Boolean;
   function ExisteGrupoFiliais(Campo, Codigo: String): Boolean;
   function ExisteBanco(Campo, Codigo: String): Boolean;
   function ExisteTipoPagamento(Campo, Codigo: String): Boolean;
   constructor Create(AOwner: TComponent); Override;
   property TipoPessoa: String read GetTipoPessoa;
   property ConsultaFiliais: TtecQuery read GetConsultaFiliais;
   property ConsultaGrupoFiliais: TtecQuery read GetConsultaGrupoFiliais;
   property ConsultarFornecedores: TtecQuery read GetConsultarFornecedores;
   property ConsultaGrupoFornecedores: TtecQuery read GetConsultaGrupoFornecedores;
   property ConsultaBancos: TtecQuery read GetConsultaBancos;
   property ConsultaTiposPagamentos: TtecQuery read GetConsultaTiposPagamentos;
   property TipoRelatorio: Integer read FTipoRelatorio write SetTipoRelatorio;

   property PeriodoInicial: String read FPeriodoInicial write SetPeriodoInicial;
   property PeriodoFinal: String read FPeriodoFinal write SetPeriodoFinal;

   property PeriodoInicialEmissao: String read  FPeriodoInicialEmissao     write FPeriodoInicialEmissao;
   property PeriodoFinalEmissao: String read  FPeriodoFinalEmissao       write FPeriodoFinalEmissao;



   property Banco: String write SetBanco;
   property Conta: String write SetConta;

   property Fornecedor: String write SetFornecedor;
   property GrupoFornecedor: String write SetGrupoFornecedor;
   property TipoPagamento: String write SetTipoPagamento;
   property Evento: String write SetEvento;
   property ListaCondicionalDocumentosPag: String read fListaCondicionalDocumentosPag write SetListaCondicionalDocumentosPag;
   property Previsao: Integer write SetPrevisao;
   property Adiantamentos: Integer read fAdiantamentos write SetAdiantamentos;
   property Resumo: Integer read FResumo write SetResumo;
   property AgruparGrupoFilial: Boolean read FAgruparGrupoFilial write FAgruparGrupoFilial;
   property AgruparFilial: Boolean read FAgruparFilial write FAgruparFilial;
   property AgruparFornecedor: Boolean read FAgruparFornecedor write FAgruparFornecedor;
   property AgruparData: Boolean read FAgruparData write SetAgruparData;
   property AgruparDocumentosPag: Boolean read fAgruparDocumentosPag write fAgruparDocumentosPag;
   procedure DefineOrdenacao;
   property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
   property Autorizadas: Integer write SetAutorizadas;
   property TipoFornecimento: String  write SetTipoFornecimento;
   property Debito_Direto_Autorizado: Integer read fDebito_Direto_Autorizado write fDebito_Direto_Autorizado;

   property ListaFiliais: TLista read GetListaFiliais;
   property ListaGruposFiliais: TLista read GetListaGruposFiliais;

   procedure MontarFiltroFiliais(Filiais: TCheckListBox);
   procedure MontarFiltroGruposFiliais(GruposFiliais: TCheckListBox);




  end;
  
var
  FListaFiliais : TLista;
  FListaGruposFiliais : TLista;

implementation


{$R *.dfm}

{ TdtmRelatorioChequesEmitidos }

procedure TdtmRelatorioDuplicatas.AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioDuplicatas);
begin
   case TipoPesquisa of
      rdpFILIAIS:           Abre(ctConsultaFiliais);
      rdpGRUPOFILIAIS:      Abre(ctConsultaGruposFiliais);
      rdpFORNECEDORES:      begin
                               qryConsultaFornecedores.Sql[08]:= 'Where (v.codigo = 0)';
                               Abre(ctConsultaFornecedores);
                            end;
      rdpGRUPOFORNECEDORES: Abre(ctConsultaGruposFornecedores);
      rdpBANCOS:            Abre(ctPagamentoConsultaBancos);
      rdpEVENTOS:           Abre(ctConsultaEventos);
      rdpTIPOSPAGAMENTOS:  Abre(ctConsultaTiposPagamentos);
   end;
end;

constructor TdtmRelatorioDuplicatas.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Tag                := ctTabelas;
  qryGrupoFiliais.Tag           := ctTabelas;

  qryBancos.              Tag:= ctTabelas;
  qryFornecedores.        Tag:= ctTabelas;
  qryGruposFornecedores.  Tag:= ctTabelas;
  qryTiposPagamentos.     Tag:= ctTabelas;

  qryConsultaFornecedores.      Tag:= ctConsultaFornecedores;
  qryConsultaFiliais.           Tag:= ctConsultaFiliais;
  qryConsultaGrupoFiliais.      Tag:= ctConsultaGruposFiliais;
  qryConsultaBancos.            Tag:= ctPagamentoConsultaBancos;
  qryConsultaGruposFornecedores.Tag:= ctConsultaGruposFornecedores;
  qryConsultaTiposPagamentos.   Tag:= ctConsultaTiposPagamentos;

  qryFornecedorestipo.AsString :='F';
end;


function TdtmRelatorioDuplicatas.ExisteBanco(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaBancos, Campo, Codigo);
end;

function TdtmRelatorioDuplicatas.ExisteFiliais(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmRelatorioDuplicatas.ExisteFornecedores(Campo, Codigo: String): Boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if Campo = 'nomecidade' then
    Campo:= 'c.nome'
  else if Campo = 'tipocliente' then
    Campo:= 'v.tipo'
  else
    Campo:= 'v.' + Campo;
  qryConsultaFornecedores.Sql[08] := Format(SQL, [Campo, Codigo, '%']);
  qryConsultaFornecedores.Open;
  Result := qryConsultaFornecedores.RecordCount > 0
end;

function TdtmRelatorioDuplicatas.ExisteGrupoFiliais(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupoFiliais, Campo, Codigo);
end;

function TdtmRelatorioDuplicatas.ExisteGrupoFornecedores(Campo, Codigo: String): Boolean;
begin
 Result:= ExisteCodigo(qryConsultaGruposFornecedores, Campo, Codigo);
end;


procedure TdtmRelatorioDuplicatas.FechaTabelaPesquisa(TipoPesquisa: TtecRelatorioDuplicatas);
begin
   case TipoPesquisa of
      rdpFILIAIS:           Fecha(ctConsultaFiliais);
      rdpGRUPOFILIAIS:      Fecha(ctConsultaGruposFiliais);
      rdpFORNECEDORES:      Fecha(ctConsultaFornecedores);
      rdpGRUPOFORNECEDORES: Fecha(ctConsultaGruposFornecedores);
      rdpBANCOS:            Fecha(ctPagamentoConsultaBancos);
      rdpEVENTOS:           Fecha(ctConsultaEventos);
      rdpTIPOSPAGAMENTOS:  Fecha(ctConsultaTiposPagamentos);
  end;
end;

function TdtmRelatorioDuplicatas.GerarRelatorio: Boolean;
begin
  RefazConsulta(qryDuplicatas,[],[]);
  Result:= qryDuplicatas.IsEmpty;
end;


function TdtmRelatorioDuplicatas.GetConsultaBancos: TtecQuery;
begin
  Result:= qryConsultaBancos;
end;

function TdtmRelatorioDuplicatas.GetConsultaFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmRelatorioDuplicatas.GetConsultaGrupoFiliais: TtecQuery;
begin
  Result:= qryConsultaGrupoFiliais;
end;

function TdtmRelatorioDuplicatas.GetConsultaGrupoFornecedores: TtecQuery;
begin
 Result:= qryConsultaGruposFornecedores;
end;


function TdtmRelatorioDuplicatas.GetConsultarFornecedores: TtecQuery;
begin
  Result:= qryConsultaFornecedores;
end;

function TdtmRelatorioDuplicatas.GetTipoPessoa: String;
begin
  if qryFornecedorestipo.AsString = '' then
       Result:= 'F'
  else
    Result:= qryFornecedorestipo.AsString;
end;



procedure TdtmRelatorioDuplicatas.ImprimirRelatorio;
var
  vRel: TfrxReport;
  PV: TfrxComponent;
  vStreamRel, vStreamRelResumo: TMemoryStream;
  arquivofast: String;


begin


 arquivofast := ExtractFilePath(Application.ExeName) + 'frxDuplicatasporCompetencia.fr3';
 if FileExists(arquivofast) then
   frxDuplicatasporCompetencia.LoadFromFile(arquivofast);  //WD Compensados não quer drill drown neste relatório (quer que apareça as duplicatas)

 arquivofast := ExtractFilePath(Application.ExeName) + 'frxResumoDuplicatasporCompetencia.fr3';
 if FileExists(arquivofast) then
   frxResumoDuplicatasporCompetencia.LoadFromFile(arquivofast);  //WD Compensados não quer drill drown neste relatório (quer que apareça as duplicatas)


  if FileExists(LogotipoFilialBase) then
  begin
    PV := frxDuplicatasporCompetencia.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);

    PV := frxResumoDuplicatasporCompetencia.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
  end;

  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['AgruparGrupoFilial']:=FAgruparGrupoFilial;
  frVariables['AgruparFilial']:=FAgruparFilial;
  frVariables['AgruparFornecedor']:=FAgruparFornecedor;
  frVariables['AgruparData']:=FAgruparData;
  frVariables['AgruparDocumentosPag']:=AgruparDocumentosPag;

  frVariables['Outras']:= FParametroCabecalho;
  frVariables['Titulo']:= 'CONTAS A PAGAR';

  with frxResumoDuplicatasporCompetencia do
  begin
    Variables['RAZAOFILIALBASE']  := quotedstr(RazaoFilialBase);
    Variables['ENDERECO_BAIRRO']   := quotedstr(RuaFilialBase+ ' - '+BairroFilialBase);
    Variables['CEP_CIDADE_UF']:= quotedstr(FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase);
    Variables['subtitulo']:= quotedstr(FParametroCabecalho);
    Variables['Titulo']:= quotedstr('RESUMO CONTAS POR DATA DE COMPETÊNCIA');
    Variables['AgruparGrupoFilial']:=FAgruparGrupoFilial;
    Variables['AgruparFilial']:=FAgruparFilial;
    Variables['AgruparFornecedor']:=FAgruparFornecedor;
    Variables['AgruparData']:=FAgruparData;
    Variables['AgruparDocumentosPag']:= AgruparDocumentosPag;

  end;


  with frxDuplicatasporCompetencia do
  begin
    Variables['RAZAOFILIALBASE']  := quotedstr(RazaoFilialBase);
    Variables['ENDERECO_BAIRRO']   := quotedstr(RuaFilialBase+ ' - '+BairroFilialBase);
    Variables['CEP_CIDADE_UF']:= quotedstr(FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase);
    Variables['subtitulo']:= quotedstr(FParametroCabecalho);

    Variables['Titulo']:= quotedstr('CONTAS POR DATA DE COMPETÊNCIA');
    Variables['AgruparGrupoFilial']:=FAgruparGrupoFilial;
    Variables['AgruparFilial']:=FAgruparFilial;
    Variables['AgruparFornecedor']:=FAgruparFornecedor;
    Variables['AgruparData']:=FAgruparData;
    Variables['AgruparDocumentosPag']:=AgruparDocumentosPag;


  end;


//  frxDuplicatasporCompetencia.designreport;
//  frxResumoDuplicatasporCompetencia.designreport;


//  frpDuplicatasPagar.DesignReport;
//  frpResumoDuplicatasPagar.designreport;

  case FResumo of
     0: case FTipoRelatorio of
          0: begin
              frVariables['Titulo']:= 'CONTAS A PAGAR';
              {
              if AgruparGrupoFilial or
                 AgruparFilial or
                 AgruparFornecedor or
                 AgruparData then}
                ImprimirRelatoriofast(null, null, MPadrao, FResumo, [frpDuplicatasPagar, frpResumoDuplicatasPagar], false, self);
{              else
                ImprimirRelatoriofast(null, null, MPadrao, 1, [frpDuplicatasPagar], false, self);}
             end;

          1: begin

               try
                 vRel := TfrxReport.Create(self);
                 vRel.OnGetValue := frxDuplicatasporCompetencia.OnGetValue;
                 vRel.Assign(frxDuplicatasporCompetencia);
                 vStreamRel := TMemoryStream.create;
                 vStreamRelResumo := TMemoryStream.create;

                 frxDuplicatasporCompetencia.SaveToStream(vStreamRel);
                 frxResumoDuplicatasporCompetencia.SaveToStream(vStreamRelResumo);

                 vStreamRel.position := 0;
                 vRel.LoadFromStream(vStreamRel);
                 vRel.PrepareReport;

                 vStreamRelREsumo.position := 0;
                 vRel.LoadFromStream(vStreamRelResumo);
                 vRel.PrepareReport(false);
                 vRel.ShowPreparedReport;
               finally
                 vRel.free;
                 vStreamRel.free;
                 vStreamRelResumo.free;
               end;


             end;

          2: begin
              frVariables['Titulo']:= 'PAGAMENTOS EFETUADOS';
//              frpPagamentosEfetuados.designreport;
              {
              if AgruparGrupoFilial or
                 AgruparFilial or
                 AgruparFornecedor or
                 AgruparData then
                 }
                ImprimirRelatoriofast(null, null, MPadrao, FResumo, [frpPagamentosEfetuados, frpResumoPagamentosEfetuados], false, self);
                {
              else
                ImprimirRelatoriofast(null, null, MPadrao, 1, [frpPagamentosEfetuados], false, self);
                }

             end;
        end;

     1: case FTipoRelatorio of
          0: begin
 //              frVariables['Titulo']:= 'CONTAS A PAGAR';
               frVariables['Titulo']:= 'CONTAS A PAGAR';
               ImprimirRelatoriofast(null, null, MPadrao, FResumo, [frpDuplicatasPagar], false, self);
             end;

          1: begin
               frxDuplicatasporCompetencia.showreport;
             end;


          2: begin
               frVariables['Titulo']:= 'PAGAMENTOS EFETUADOS';
//               frpPagamentosEfetuados.designreport;
               ImprimirRelatoriofast(null, null, MPadrao, FResumo, [frpPagamentosEfetuados], false, self);
             end;
        end;
     2: case FTipoRelatorio of
          0: begin
//               frpResumoDuplicatasPagar.DesignReport;
               frVariables['Titulo']:= 'CONTAS A PAGAR';
               ImprimirRelatoriofast(null, null, MSimples, FResumo, [frpResumoDuplicatasPagar], false, self);
             end;

          1: begin
               frxResumoDuplicatasporCompetencia.showreport;
             end;


          2: begin
               frVariables['Titulo']:= 'PAGAMENTOS EFETUADOS';
               ImprimirRelatoriofast(null, null, MSimples, FResumo, [frpResumoPagamentosEfetuados], false, self);

             end;
        end;
     end;
end;



procedure TdtmRelatorioDuplicatas.MontaIntervaloPeriodo;
var
  Data_1: String;
  Data_2: String;

  Data_Adiantamento_1: String;
  Data_Adiantamento_2: String;

  Data_Emissao_1: String;
  Data_Emissao_2: String;


begin

   Data_Adiantamento_1 := 'and (d.datalancto = ';
   Data_Adiantamento_2 := 'and (d.datalancto between (';

   Data_Emissao_1 := 'and (d.emissao = ';
   Data_Emissao_2 := 'and (d.emissao between (';


  case FTipoRelatorio of
    0: begin
         Data_1:= 'and (t.datavencto = ';
         Data_2:= 'and (t.datavencto between (';

       end;

    1: begin
         Data_1:= 'and (case when d.regimedecaixa then t.datavencto else d.datalancto end = ';
         Data_2:= 'and (case when d.regimedecaixa then t.datavencto else d.datalancto end between (';
       end;


    2: begin
         Data_1:= 'and (t.datapagto = ';
         Data_2:= 'and (t.datapagto between (';
       end;
  end;

  if not DataEmBranco(FPeriodoInicial) then
  begin
    if DataEmBranco(FPeriodoFinal) then
    begin
     qryDuplicatas.MacroByName('Periodo').AsString:= Data_1 + '''' + FPeriodoInicial + ''')';
     qryDuplicatas.MacroByName('Periodo_Adiantamento').AsString:= Data_Adiantamento_1 + '''' + FPeriodoInicial + ''')';

     FParametroCabecalho:=FParametroCabecalho+'ENTRE: '+FPeriodoInicial+' E '+FPeriodoInicial;
    end
    else
    begin
     qryDuplicatas.MacroByName('Periodo').AsString:= Data_2 + '''' + FPeriodoInicial + ''') and (''' + FPeriodoFinal + '''))';
     qryDuplicatas.MacroByName('Periodo_Adiantamento').AsString:= Data_Adiantamento_2 + '''' + FPeriodoInicial + ''') and (''' + FPeriodoFinal + '''))';

     FParametroCabecalho:=FParametroCabecalho+'ENTRE: '+FPeriodoInicial+' E '+FPeriodoFinal;
    end;
  end
  else begin
    if not DataEmBranco(FPeriodoFinal) then
    begin
     qryDuplicatas.MacroByName('Periodo').AsString:= Data_1 + '''' + FPeriodoFinal + ''')';
     qryDuplicatas.MacroByName('Periodo_Adiantamento').AsString:= Data_Adiantamento_1 + '''' + FPeriodoFinal + ''')';

     FParametroCabecalho:=FParametroCabecalho+'ENTRE: '+FPeriodoFinal+' E '+FPeriodoFinal;
    end
    else
    begin
      qryDuplicatas.MacroByName('Periodo').AsString:= '';
      qryDuplicatas.MacroByName('Periodo_Adiantamento').AsString := '';
    end;
  end;


  if not DataEmBranco(FPeriodoInicialEmissao) then
  begin
    if DataEmBranco(FPeriodoFinalEmissao) then
    begin
     qryDuplicatas.MacroByName('Periodo_Emissao').AsString:= Data_Emissao_1 + '''' + FPeriodoInicialEmissao + ''')';
     FParametroCabecalho:=FParametroCabecalho+'EMISSÃO ENTRE: '+FPeriodoInicialEmissao+' E '+FPeriodoInicialEmissao;
    end
    else
    begin
     qryDuplicatas.MacroByName('Periodo_Emissao').AsString:= Data_Emissao_2 + '''' + FPeriodoInicialEmissao + ''') and (''' + FPeriodoFinalEmissao + '''))';
     FParametroCabecalho:=FParametroCabecalho+'EMISSÃO ENTRE: '+FPeriodoInicialEmissao+' E '+FPeriodoFinalEmissao;
    end;
  end
  else
  begin
    if not DataEmBranco(FPeriodoFinalEmissao) then
    begin
     qryDuplicatas.MacroByName('Periodo_Emissao').AsString:= Data_Emissao_1 + '''' + FPeriodoFinalEmissao + ''')';
     FParametroCabecalho:=FParametroCabecalho+'EMISSAO ENTRE: '+FPeriodoFinalEmissao+' E '+FPeriodoFinalEmissao;
    end
    else
      qryDuplicatas.MacroByName('Periodo_Emissao').AsString := '';
  end;


end;


procedure TdtmRelatorioDuplicatas.qryFornecedoresBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryFornecedores.Params[0].AsString = '' then
    qryFornecedores.Params[0].AsString:= 'F';
end;

procedure TdtmRelatorioDuplicatas.Selecionar(TipoPesquisa: TtecRelatorioDuplicatas);
begin
   case TipoPesquisa of
      rdpFORNECEDORES:      ReFazConsulta(qryFornecedores,      [0, 1], [qryConsultaFornecedorestipo.AsString,
                                                                         qryConsultaFornecedorescodigo.AsInteger]);
      rdpGRUPOFORNECEDORES: ReFazConsulta(qryGruposFornecedores,[0],    [qryConsultaGruposFornecedorescodigo.AsInteger]);
      rdpBANCOS:            ReFazConsulta(qryBancos,            [0],    [qryConsultaBancoscodigo.AsInteger]);
      rdpTIPOSPAGAMENTOS:   ReFazConsulta(qryTiposPagamentos,   [0],    [qryConsultaTiposPagamentoscodigo.asInteger]);
   end;
end;


procedure TdtmRelatorioDuplicatas.SetBanco(const Value: String);
begin
  if (Value <> '') then
  begin

    FParametroCabecalho:=FParametroCabecalho+' BANCO: '+Value;

    case FTipoRelatorio of
      0: qryDuplicatas.MacroByName('Banco').AsString:= 'and (t.bancocobranca = ' + Value + ')';

      1: begin
           qryDuplicatas.MacroByName('Banco').AsString:= 'and (t.bancocobranca = ' + Value + ')';
           qryDuplicatas.MacroByName('Banco_Adiantamento').AsString:= 'and ((select ct.banco from contas ct where ct.conta = d.contapagto) = ' + Value + ')';
         end;

      2: begin
           qryDuplicatas.MacroByName('Banco').AsString:=
            'and ((select b.codigo '+
                  'from bancos b join contas c on c.banco = b.codigo '+
                  'where c.conta = t.contapagto) = ' + Value + ')';

           qryDuplicatas.MacroByName('Banco_Adiantamento').AsString:= 'and ((select ct.banco from contas ct where ct.conta = d.contapagto) = ' + Value + ')';
         end;
    end;

  end
  else
  begin
    qryDuplicatas.MacroByName('Banco').AsString:= '';
    qryDuplicatas.MacroByName('Banco_Adiantamento').AsString:='';
  end;
end;

procedure TdtmRelatorioDuplicatas.SetPeriodoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoFinal := Value
  else FPeriodoFinal := '';
  MontaIntervaloPeriodo;
end;

procedure TdtmRelatorioDuplicatas.SetPeriodoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoInicial := Value
  else FPeriodoInicial := '';
end;


procedure TdtmRelatorioDuplicatas.SetFornecedor(const Value: String);

begin

  if (Value <> '') then

       qryDuplicatas.MacroByName('Fornecedor').AsString:= 'and ((d.fornecedor = ' + Value + ')'+

                                            'and (d.tipofornecedor = ' + quotedstr(qryFornecedorestipo.AsString) + '))'

  else qryDuplicatas.MacroByName('Fornecedor').AsString:= '';

end;



procedure TdtmRelatorioDuplicatas.SetGrupoFornecedor(const Value: String);

begin
  if (Value <> '') then
  begin
   qryDuplicatas.MacroByName('GrupoFornecedor').AsString:= 'and (d.fornecedor in (Select codigo From fornecedores Where grupofornecedor = ' + Value + '))';

   FParametroCabecalho:=FParametroCabecalho+' GRUPO DE FORNECEDOR: '+Value;

  end

  else qryDuplicatas.MacroByName('GrupoFornecedor').AsString:= '';

end;

procedure TdtmRelatorioDuplicatas.SetEvento(const Value: String);

begin
  if (Value <> '') then
  begin
    qryDuplicatas.MacroByName('Evento').AsString:= 'and ( ' + Value + ')';
    FParametroCabecalho:=FParametroCabecalho+' EVENTO: '+Value;
  end
  else
    qryDuplicatas.MacroByName('Evento').AsString:= '';
end;



procedure TdtmRelatorioDuplicatas.SetPrevisao(const Value: Integer);

begin

  qryDuplicatas.MacroByName('Previsao').AsString:= '';

  if tiporelatorio = 0 then
    case Value of
      0: begin
          qryDuplicatas.MacroByName('Previsao').AsString:= '';
          FParametroCabecalho:=FParametroCabecalho+' COM PREVISÕES ';
         end;
      1: begin
          qryDuplicatas.MacroByName('Previsao').AsString:= 'and (d.previsao = false)';
          FParametroCabecalho:=FParametroCabecalho+' SEM PREVISÕES ';
         end;
      2: begin
          qryDuplicatas.MacroByName('Previsao').AsString:= 'and (d.previsao = true)';
          FParametroCabecalho:=FParametroCabecalho+' SÓ PREVISÕES ';
         end;
    end;
end;



procedure TdtmRelatorioDuplicatas.SetTipoRelatorio(const Value: Integer);

begin

//  0 = Duplicatas a pagar     1 = Duplicatas quitadas

  if FTipoRelatorio <> Value then
    FTipoRelatorio:= Value;

  case FTipoRelatorio of
    0: qryDuplicatas.MacroByName('TipoRelatorio').AsString:= 'and (t.datapagto is null)';
    1: qryDuplicatas.MacroByName('TipoRelatorio').AsString:= '';
    2: qryDuplicatas.MacroByName('TipoRelatorio').AsString:= 'and (t.datapagto is not null)';
  end;

end;



procedure TdtmRelatorioDuplicatas.SetResumo(const Value: Integer);

begin

  if FResumo <> Value Then

     FResumo:= Value;

end;



procedure TdtmRelatorioDuplicatas.DefineOrdenacao;
var
Ordenacao : String;
begin
 Ordenacao:='';

 if FAgruparGrupoFilial then
   Ordenacao:= Ordenacao + ', grupofilialemissao, nomegrupofilialemissao';
 if FAgruparFilial then
   Ordenacao:=Ordenacao + ', filialemissao, nomefilialemissao ';

 case FTipoRelatorio of

  0:begin
      if AgruparDocumentosPag then
      begin
        Ordenacao := Ordenacao + ', documentopag';
        if FOrdenacaoDuplicatas = 'D' then
          Ordenacao := Ordenacao + ', datavencto, nomefornecedor, fornecedor'
        else if FOrdenacaoDuplicatas = 'N' then
          Ordenacao := Ordenacao + ', nomefornecedor,fornecedor,datavencto'
        else
          Ordenacao := Ordenacao + ', nomefornecedor,fornecedor,datavencto';
      end
      else
      begin
        if FOrdenacaoDuplicatas = 'D' then
          Ordenacao := Ordenacao + ', datavencto, nomefornecedor, fornecedor'
        else if FOrdenacaoDuplicatas = 'N' then
          Ordenacao := Ordenacao + ', nomefornecedor,fornecedor,datavencto'
        else
          Ordenacao := Ordenacao + ', nomefornecedor,fornecedor,datavencto';
      end;
    end;

  1:begin

      if AgruparDocumentosPag then
      begin
        Ordenacao := Ordenacao + ', documentopag';
        if FOrdenacaoDuplicatas = 'D' then
          Ordenacao := Ordenacao + ', datalancto, documentopag, datavencto, nomefornecedor, fornecedor, tipofornecedor'
        else
        if FOrdenacaoDuplicatas = 'N' then
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datalancto, documentopag, datavencto'
        else
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datalancto, documentopag, datavencto';
      end
      else
      begin
        if FOrdenacaoDuplicatas = 'D' then
          Ordenacao := Ordenacao + ', datalancto, documentopag, datavencto, nomefornecedor, fornecedor, tipofornecedor'
        else
        if FOrdenacaoDuplicatas = 'N' then
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datalancto, documentopag, datavencto'
        else
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datalancto, documentopag, datavencto';
      end;
    end;

  2:
    begin

      if AgruparDocumentosPag then
      begin
        Ordenacao := Ordenacao + ', documentopag';
        if FOrdenacaoDuplicatas='D' then
          Ordenacao := Ordenacao + ', datapagto,nomefornecedor, fornecedor, tipofornecedor'
        else
        if FOrdenacaoDuplicatas='N' then
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datapagto'
        else
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datapagto';
      end
      else
      begin
        if FOrdenacaoDuplicatas='D' then
          Ordenacao := Ordenacao + ', datapagto,nomefornecedor, fornecedor, tipofornecedor'
        else
        if FOrdenacaoDuplicatas='N' then
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datapagto'
        else
          Ordenacao := Ordenacao + ', nomefornecedor, fornecedor, tipofornecedor, datapagto';
      end;
    end;

  end;
  qryDuplicatas.MacroByName('Ordenacao').AsString:='Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
end;


procedure TdtmRelatorioDuplicatas.SetAutorizadas(const Value: Integer);
begin
  if FTipoRelatorio = 2 then
    qryDuplicatas.MacroByName('Autorizado').AsString:= ''
  else
    case Value of
      0: qryDuplicatas.MacroByName('Autorizado').AsString:= 'and (t.autorizado = true)';
      1: qryDuplicatas.MacroByName('Autorizado').AsString:= 'and (t.autorizado = false)';
      2: qryDuplicatas.MacroByName('Autorizado').AsString:= '';
    end;
end;

procedure TdtmRelatorioDuplicatas.SetTipoFornecimento(const Value: String);
var
  valor: String;
begin
  if Value <> '' then
  begin
    valor := Value;
    if Copy(valor,length(valor),1) = ',' then
      valor := Copy(valor,1,length(valor)-1);

    qryDuplicatas.MacroByName('TipoFornecimento').AsString := ' and (select count(*)                                            '+
                                                              '      from listatipofornecimento((select f.tipofornecimento      '+
                                                              '                                  from fornecedores f            '+
                                                              '                                  where f.codigo = d.fornecedor  '+
                                                              '                                    and d.tipofornecedor=''F'')) '+
                                                              '      where tipo in ('+valor+'))<>0';

  end
  else qryDuplicatas.MacroByName('TipoFornecimento').AsString :='';
end;

procedure TdtmRelatorioDuplicatas.frpDuplicatasPagarBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpDuplicatasPagar, view);
end;

procedure TdtmRelatorioDuplicatas.qryDuplicatasCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  if (not qryDuplicatasserie.isnull) and
     (qryDuplicatasnota.asinteger <> 0) then
    qryDuplicatasdocumento.asString := qryDuplicatasserie.asString + ' / ' + qryDuplicatasnota.asString
  else
    qryDuplicatasdocumento.asString := qryDuplicatasComplemento.asString;

  if qryDuplicatasvalorpagto.AsCurrency >
     qryDuplicatasvalorvencto.AsCurrency then
    qryDuplicatasValorJurosPagos.AsCurrency := qryDuplicatasvalorpagto.AsCurrency-
                                              qryDuplicatasvalorvencto.AsCurrency

  else
  if (qryDuplicatasvalorpagto.AsCurrency<>0) and
     (qryDuplicatasvalorpagto.AsCurrency <
      qryDuplicatasvalorvencto.AsCurrency) then
    qryDuplicatasValorDescReceb.AsCurrency := qryDuplicatasvalorvencto.AsCurrency -
                                              qryDuplicatasvalorpagto.AsCurrency;


  qryDuplicatasEventoDescricao.asString :=
    qryDuplicatasEvento.asString + ' - ' +
    qryDuplicatasDescricao_Evento.asString;

end;


procedure TdtmRelatorioDuplicatas.DataModuleCreate(Sender: TObject);
begin
  inherited;
  // default -> ordenação das duplicatas pelo nome do fornecedor
  FOrdenacaoDuplicatas := 'N';
end;

procedure TdtmRelatorioDuplicatas.frpPagamentosEfetuadosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpPagamentosEfetuados, view);
end;

function TdtmRelatorioDuplicatas.ExisteTipoPagamento(Campo,
  Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaTiposPagamentos, Campo, Codigo);  
end;

function TdtmRelatorioDuplicatas.GetConsultaTiposPagamentos: TtecQuery;
begin
  Result := qryConsultaTiposPagamentos;
end;

procedure TdtmRelatorioDuplicatas.SetTipoPagamento(const Value: String);
begin
  if (Value <> '') and (TipoRelatorio in [1,2]) then
  begin
    qryDuplicatas.MacroByName('TipoPagamento').AsString:= 'and (t.tipopagamento = ' + Value + ')';
    qryDuplicatas.MacroByName('TipoPagamento_Adiantamento').AsString:= 'and (d.tipopagamento = ' + Value + ')';

    FParametroCabecalho:=FParametroCabecalho+' TIPO DE PAGAMENTO: '+Value;
  end
  else
  begin
    qryDuplicatas.MacroByName('TipoPagamento').AsString:= '';
    qryDuplicatas.MacroByName('TipoPagamento_Adiantamento').AsString:= '';
  end;
end;

procedure TdtmRelatorioDuplicatas.frpResumoPagamentosEfetuadosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpResumoPagamentosEfetuados, view);
end;

procedure TdtmRelatorioDuplicatas.qryDuplicatasAfterOpen(
  DataSet: TDataSet);
var
 Data, UltimaData : String;
 GrupodeFilial, FilialEmissao, FornecedorDuplicata: String;
begin
  inherited;
  if AgruparData then
  begin
    qryDuplicatas.First;
    Data := '';
    UltimaData := '';
    GrupodeFilial := '';
    FilialEmissao := '';
    FornecedorDuplicata := '';

    while not qryDuplicatas.Eof do
    begin
      case FTipoRelatorio of
      0: begin
           if (qryDuplicatasdatavencto.AsString = Data) and
              ((qryDuplicatasgrupofilialemissao.AsString = GrupodeFilial) or
               (not AgruparGrupoFilial)) and
              ((qryDuplicatasfilialemissao.AsString = FilialEmissao) or
               (not AgruparFilial)) and
              ((qryDuplicatasfornecedor.AsString = FornecedorDuplicata) or
               (not AgruparFornecedor)) then
           begin
            if (Data<>UltimaData) or
               (UltimaData='') then
            begin
              qryDuplicatas.Prior;
              qryDuplicatas.edit;
              qryDuplicatasdiferenciar.AsBoolean := false;
              qryDuplicatas.post;
              qryDuplicatas.Next;
            end;
            qryDuplicatas.edit;
            qryDuplicatasdiferenciar.AsBoolean := false;
            qryDuplicatas.post;

            if Data<>UltimaData then
              UltimaData := Data;
           end;
           Data := qryDuplicatasdatavencto.AsString;
           GrupodeFilial := qryDuplicatasgrupofilialemissao.AsString;
           FilialEmissao := qryDuplicatasfilialemissao.AsString;
           FornecedorDuplicata := qryDuplicatasfornecedor.AsString;
         end;

      1: begin
           if (qryDuplicatasdatalancto.AsString = Data) and
              ((qryDuplicatasgrupofilialemissao.AsString = GrupodeFilial) or
               (not AgruparGrupoFilial)) and
              ((qryDuplicatasfilialemissao.AsString = FilialEmissao) or
               (not AgruparFilial)) and
              ((qryDuplicatasfornecedor.AsString = FornecedorDuplicata) or
               (not AgruparFornecedor)) then
           begin
            if (Data<>UltimaData) or
               (UltimaData='') then
            begin
              qryDuplicatas.Prior;
              qryDuplicatas.edit;
              qryDuplicatasdiferenciar.AsBoolean := false;
              qryDuplicatas.post;
              qryDuplicatas.Next;
            end;
            qryDuplicatas.edit;
            qryDuplicatasdiferenciar.AsBoolean := false;
            qryDuplicatas.post;

            if Data<>UltimaData then
              UltimaData := Data;
           end;
           Data := qryDuplicatasdatalancto.AsString;
           GrupodeFilial := qryDuplicatasgrupofilialemissao.AsString;
           FilialEmissao := qryDuplicatasfilialemissao.AsString;
           FornecedorDuplicata := qryDuplicatasfornecedor.AsString;
         end;


      2: begin
           if (qryDuplicatasdatapagto.AsString = Data) and
              ((qryDuplicatasgrupofilialemissao.AsString = GrupodeFilial) or
               (not AgruparGrupoFilial)) and
              ((qryDuplicatasfilialemissao.AsString = FilialEmissao) or
               (not AgruparFilial)) and
              ((qryDuplicatasfornecedor.AsString = FornecedorDuplicata) or
               (not AgruparFornecedor)) then
           begin
            if (Data<>UltimaData) or
               (UltimaData='') then
            begin
              qryDuplicatas.Prior;
              qryDuplicatas.edit;
              qryDuplicatasdiferenciar.AsBoolean := false;
              qryDuplicatas.post;
              qryDuplicatas.Next;
            end;
            qryDuplicatas.edit;
            qryDuplicatasdiferenciar.AsBoolean := false;
            qryDuplicatas.post;

            if Data<>UltimaData then
              UltimaData := Data;
           end;
           Data := qryDuplicatasdatapagto.AsString;
           GrupodeFilial := qryDuplicatasgrupofilialemissao.AsString;
           FilialEmissao := qryDuplicatasfilialemissao.AsString;
           FornecedorDuplicata := qryDuplicatasfornecedor.AsString;
         end;
      end;
      qryDuplicatas.Next;
    end;
  end;
end;

procedure TdtmRelatorioDuplicatas.SetAgruparData(const Value: Boolean);
begin
  FAgruparData := Value;
  qryDuplicatas.ParamByName('AgruparData').AsBoolean := FAgruparData;
end;

procedure TdtmRelatorioDuplicatas.qryDuplicatasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not (UsuarioLogin.Administrador or UsuarioLogin.Suporte) then
    qryDuplicatas.MacroByName('Administrador').AsString:= 'and not d.administrador';

  case Debito_Direto_Autorizado of
  0 : begin
        qryDuplicatas.MacroByName('DDA').AsString := 'and coalesce(t.dda,false)';
        FParametroCabecalho := FParametroCabecalho+' Somente Débito Direto Autorizado (DDA) ';
      end;

  1 : begin
        qryDuplicatas.MacroByName('DDA').AsString := 'and not coalesce(t.dda,false)';
        FParametroCabecalho := FParametroCabecalho+' Sem Débito Direto Autorizado (DDA) ';
      end;

  2 : qryDuplicatas.MacroByName('DDA').AsString := '';

  end;

end;


procedure TdtmRelatorioDuplicatas.SetAdiantamentos(const Value: Integer);
begin
  fAdiantamentos := Value;
  case Value of
    0: begin
        qryDuplicatas.Parambyname('Condicao_incluir_duplicatas').asBoolean := true;
        qryDuplicatas.Parambyname('Condicao_incluir_Adiantamento').asBoolean := true;
        FParametroCabecalho:=FParametroCabecalho+' COM ADIANTAMENTOS ';
       end;
    1: begin
        qryDuplicatas.Parambyname('Condicao_incluir_duplicatas').asBoolean := true;
        qryDuplicatas.Parambyname('Condicao_incluir_Adiantamento').asBoolean := false;
        FParametroCabecalho:=FParametroCabecalho+' SEM ADIANTAMENTOS ';
       end;
    2: begin
        qryDuplicatas.Parambyname('Condicao_incluir_duplicatas').asBoolean := false;
        qryDuplicatas.Parambyname('Condicao_incluir_Adiantamento').asBoolean := true;
        FParametroCabecalho:=FParametroCabecalho+' SOMENTE ADIANTAMENTOS ';
       end;
  end;

end;

function TdtmRelatorioDuplicatas.GetListaFiliais: TLista;
Var
  Ind: Integer;
begin
  FillChar(FListaFiliais,SizeOf(FListaFiliais),0);
  SetLength(FListaFiliais, qryFiliais.RecordCount);
  Ind:= 0;
  while not qryFiliais.Eof do
  begin
    FListaFiliais[Ind].codigo   := qryFiliaiscodigo.AsString;
    FListaFiliais[Ind].descricao:= qryFiliaisnome.AsString;
    Inc(Ind);
    qryFiliais.Next;
  end;
  Result := FListaFiliais;
end;

function TdtmRelatorioDuplicatas.GetListaGruposFiliais: TLista;
Var
  Ind: Integer;
begin
  FillChar(FListaGruposFiliais,SizeOf(FListaGruposFiliais),0);
  SetLength(FListaGruposFiliais, qryGrupoFiliais.RecordCount);
  Ind:= 0;
  while not qryGrupoFiliais.Eof do
  begin
    FListaGruposFiliais[Ind].codigo   := qryGrupoFiliaiscodigo.AsString;
    FListaGruposFiliais[Ind].descricao:= qryGrupoFiliaisdescricao.AsString;
    Inc(Ind);
    qryGrupoFiliais.Next;
  end;
  Result := FListaGruposFiliais;
end;

procedure TdtmRelatorioDuplicatas.MontarFiltroFiliais(
  Filiais: TCheckListBox);
var
  STRFiliais: String;
  Ind: Integer;
begin
  STRFiliais := '';
  for Ind:= 0 to (Length(FListaFiliais) - 1) do
    if Filiais.Checked[Ind] then
      STRFiliais := STRFiliais + QuotedStr(FListaFiliais[Ind].codigo) + ',';
  STRFiliais := Copy(STRFiliais, 0, Length(STRFiliais) - 1);
  if STRFiliais <> '' then
  begin
    qryDuplicatas.MacroByName('Filial').AsString:= 'and (d.filialemissao in (' + STRFiliais + '))';
    FParametroCabecalho := FParametroCabecalho+' Filiais: '+STRFiliais;
  end
  else
    qryDuplicatas.MacroByName('Filial').AsString:= '';

end;

procedure TdtmRelatorioDuplicatas.MontarFiltroGruposFiliais(
  GruposFiliais: TCheckListBox);
const
  FiltroGrupoFilial_dp = ' AND ( d.filialemissao IN (SELECT filial '+#13#10+
                             'FROM filiaisgruposfiliais fgf '+#13#10+
                               'WHERE fgf.grupo IN (%s))) ';
var
  STRGruposFiliais: String;
  Ind: Integer;
begin

  STRGruposFiliais := '';
  for Ind:= 0 to (Length(FListaGruposFiliais) - 1) do
    if GruposFiliais.Checked[Ind] then
      STRGruposFiliais := STRGruposFiliais + QuotedStr(FListaGruposFiliais[Ind].codigo) + ',';
  STRGruposFiliais := Copy(STRGruposFiliais, 0, Length(STRGruposFiliais) - 1);

  if STRGruposFiliais <> '' then
  begin
    qryDuplicatas.MacroByName('GrupoFilial').AsString := format(FiltroGrupoFilial_dp,[STRGruposFiliais]);
    FParametroCabecalho:=FParametroCabecalho+' GRUPO DE FILIAL: '+STRGruposFiliais;
  end
  else
    qryDuplicatas.MacroByName('GrupoFilial').AsString:='';

end;

procedure TdtmRelatorioDuplicatas.frxDuplicatasporCompetenciaGetValue(
  const VarName: String; var Value: Variant);
begin
  inherited;
  if VarName = 'MascaraQuantidade' then
    Value := ParSistema.MascaraQuantidadeGrade
  else if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio)
  else if VarName = 'RAZAOFILIALBASE' then
    Value := RazaoFilialBase
  else if VarName = 'ENDERECO_BAIRRO' then
    Value :=  RuaFilialBase+ ' - '+BairroFilialBase
  else if VarName = 'CEP_CIDADE_UF' then
    Value :=  FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase
  else if VarName = 'SUBTITULO' then
    Value :=  parametrocabecalho;

end;

procedure TdtmRelatorioDuplicatas.SetConta(const Value: String);
begin
  if (Value <> '') then
  begin
    FParametroCabecalho:=FParametroCabecalho+' CONTA: '+Value;
    qryDuplicatas.MacroByName('Conta').AsString:= 'and (t.contapagto = ' + Value + ')';
    qryDuplicatas.MacroByName('Conta_Adiantamento').AsString:= 'and (d.contapagto = ' + Value + ')';
  end
  else
  begin
    qryDuplicatas.MacroByName('Conta').AsString:= '';
    qryDuplicatas.MacroByName('Conta_Adiantamento').AsString:='';
  end;

end;

procedure TdtmRelatorioDuplicatas.frpResumoDuplicatasPagarBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpResumoDuplicatasPagar, view);
end;

procedure TdtmRelatorioDuplicatas.SetListaCondicionalDocumentosPag(
  const Value: String);
begin
  fListaCondicionalDocumentosPag := Value;
  if (Value <> '') then
  begin
    qryDuplicatas.MacroByName('ListaCondicionalDocumentosPag_d').AsString:= 'and ( ' + trocar(Value, 'dp.', 'd.') + ')';
    FParametroCabecalho:=FParametroCabecalho+' DOCUMENTOS: '+Value;
  end
  else
  begin
    qryDuplicatas.MacroByName('ListaCondicionalDocumentosPag_d').AsString:= '';
  end;

end;

end.

