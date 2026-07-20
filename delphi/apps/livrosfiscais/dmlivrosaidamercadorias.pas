{
 ATENÇÃO: A propriedade autoredimensionaraltura foi alterada nos valores da nota e dos calculos sendo setada para false, permanecendo
          somente nas observações da nota, devido ao fato de apresentar erro de cálculo no momento de uma quebra de página onde o registro
          possui informações no campo observações (ele avança um registro e soma duas vezes o primeiro valor da próxima página)
}
unit dmlivrosaidamercadorias;
interface
uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, biblio,
  cpquery, FR_DSet, FR_DBSet, FR_Class, ctconstantes, Graphics,
  fmpreviewpadrao, FR_Desgn, clparametrossistema, dmimprimetermos, CheckLst,
  ZTransact, StdCtrls;

type
  TdtmLivroSaidaMercadorias = class(TdtmBasico)
    qryProcuraFiliais: TtecQuery;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryProcuraFiliaisrazao: TStringField;
    qryProcuraFiliaiscnpj: TStringField;
    qryProcuraFiliaisinscricaoestadual: TStringField;
    qryProcuraFiliaisrua: TStringField;
    qryProcuraFiliaisestado: TStringField;
    qryProcuraFiliaisnomecidade: TStringField;
    qryProcuraFiliaisnomebairro: TStringField;
    qryProcuraFiliaiscep: TIntegerField;
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryProcuraGruposFiliais: TtecQuery;
    qryProcuraGruposFiliaiscodigo: TIntegerField;
    qryProcuraGruposFiliaisdescricao: TStringField;
    dsrProcuraGruposFiliais: TtecDataSource;
    qryConsultaGruposFiliais: TtecQuery;
    qryConsultaGruposFiliaisdescricao: TStringField;
    qryConsultaGruposFiliaiscodigo: TIntegerField;
    qryCodigosFiscais: TtecQuery;
    qryCodigosFiscaismenorcodigo: TIntegerField;
    qryCodigosFiscaismaiorcodigo: TIntegerField;
    frpLivroSaidaMercadorias: TfrReport;
    fdsDadosFiscais: TfrDBDataSet;
    fdsResumoSinteticoSaidas: TfrDBDataSet;
    frpResumoSinteticoSaidas: TfrReport;
    fdsResumoDiario: TfrDBDataSet;
    frpResumoDiario: TfrReport;
    qryCalculosDadosFiscais: TtecQuery;
    fdsCalculosDadosFiscais: TfrDBDataSet;
    qryResumoSinteticoSaidas: TtecQuery;
    qryResumoSintetico_Aux: TtecQuery;
    qryCalculosDadosFiscais_Notas_e_Cupons: TtecQuery;
    qryCalculosDadosFiscais_Notas_e_CuponsMapasECFCalculos: TtecQuery;
    qryCalculosDadosFiscaisbase: TFloatField;
    qryCalculosDadosFiscaisaliquota: TFloatField;
    qryCalculosDadosFiscaisvalor: TFloatField;
    qryCalculosDadosFiscaisisentas: TFloatField;
    qryCalculosDadosFiscaisoutras: TFloatField;
    qryCalculosDadosFiscaisobservacao: TStringField;
    qryResumoSinteticoSaidasvalortotal: TFloatField;
    qryResumoSinteticoSaidasbase: TFloatField;
    qryResumoSinteticoSaidasvalor: TFloatField;
    qryResumoSinteticoSaidasisentas: TFloatField;
    qryResumoSinteticoSaidasoutras: TFloatField;
    qryResumoSinteticoSaidastitulo: TIntegerField;
    qryResumoSinteticoSaidasdescricaotitulo: TStringField;
    qryResumoSinteticoSaidassubtitulo: TIntegerField;
    qryResumoSinteticoSaidasdescricaosubtitulo: TStringField;
    qryResumoSinteticoSaidascodigofiscal: TIntegerField;
    qryResumoSinteticoSaidasdescricao: TStringField;
    qryResumoDiario: TtecQuery;
    qryProcuraFiliaisjunta: TStringField;
    qryProcuraFiliaisjuntadata: TDateField;
    qrySeries: TtecQuery;
    qrySeriesserie: TStringField;
    qryResumoDiariodata: TDateField;
    qryResumoDiariooutrasvalortotal: TFloatField;
    qryResumoDiariooutrasbase: TFloatField;
    qryResumoDiariooutrasvalor: TFloatField;
    qryResumoDiarioavistavalortotal: TFloatField;
    qryResumoDiarioavistabase: TFloatField;
    qryResumoDiarioavistavalor: TFloatField;

    qryResumoDiarioaprazovalortotal: TFloatField;
    qryResumoDiarioaprazobase: TFloatField;
    qryResumoDiarioaprazovalor: TFloatField;
    qryDadosFiscaisNotas: TtecQuery;
    qryDadosFiscaisNotassituacao: TStringField;
    qryDadosFiscaisNotasdadofiscal: TIntegerField;
    qryDadosFiscaisNotasestadocfo: TStringField;
    qryDadosFiscaisNotasvalortotal: TFloatField;
    qryDadosFiscaisNotasserie: TStringField;
    qryDadosFiscaisNotasnumeroinicial: TIntegerField;
    qryDadosFiscaisNotasnumerofinal: TIntegerField;
    qryDadosFiscaisNotasfilial: TIntegerField;
    qryDadosFiscaisNotasdata: TDateField;
    qryDadosFiscaisNotas_ICMS: TtecQuery;
    qryDadosFiscaisNotas_ICMSdadofiscal: TIntegerField;
    qryDadosFiscaisNotas_ICMStipo: TIntegerField;
    qryDadosFiscaisNotas_ICMSaliquota: TFloatField;
    qryDadosFiscaisNotas_ICMSbase: TFloatField;
    qryDadosFiscaisNotas_ICMSvalor: TFloatField;
    qryDadosFiscaisNotas_IPI: TtecQuery;
    qryDadosFiscaisNotas_IPIdadofiscal: TIntegerField;
    qryDadosFiscaisNotas_IPItipo: TIntegerField;
    qryDadosFiscaisNotas_IPIaliquota: TFloatField;
    qryDadosFiscaisNotas_IPIbase: TFloatField;
    qryDadosFiscaisNotas_IPIvalor: TFloatField;
    dsrDadosFiscaisNotas: TtecDataSource;
    qryResumoDadosFiscaisNotas_ICMS_: TtecQuery;
    frpLivroSaidaMercadoriasICMS_IPI: TfrReport;
    fdsDadosFiscaisNotas: TfrDBDataSet;
    fdsDadosFiscaisNotas_ICMS: TfrDBDataSet;
    fdsDadosFiscaisNotas_IPI: TfrDBDataSet;
    qryDadosFiscaisNotasvalortotal_icms: TFloatField;
    qryDadosFiscaisNotasvalortotal_ipi: TFloatField;
    qryDadosFiscaisNotasdifvalortotal_icms: TBooleanField;
    qryDadosFiscaisNotasdifvalortotal_ipi: TBooleanField;
    qryDadosFiscaisNotasoperacao: TMemoField;
    qryDadosFiscaisNotasobservacao: TMemoField;
    qryResumoDadosFiscaisNotas_IPI: TtecQuery;
    frpResumoDadosFiscaisNotas_ICMS_: TfrReport;
    fdsResumoDadosFiscaisNotas_ICMS_: TfrDBDataSet;
    fdsResumoDadosFiscaisNotas_IPI: TfrDBDataSet;
    frpResumoDadosFiscaisNotas_IPI: TfrReport;
    qryResumoDadosFiscaisNotas_ICMS_valortotal: TFloatField;
    qryResumoDadosFiscaisNotas_ICMS_base: TFloatField;
    qryResumoDadosFiscaisNotas_ICMS_valor: TFloatField;
    qryResumoDadosFiscaisNotas_ICMS_isentas: TFloatField;
    qryResumoDadosFiscaisNotas_ICMS_outras: TFloatField;
    qryResumoDadosFiscaisNotas_ICMS_codigofiscal: TIntegerField;
    qryResumoDadosFiscaisNotas_ICMS_descricao: TStringField;
    qryResumoDadosFiscaisNotas_ICMS_titulo: TIntegerField;
    qryResumoDadosFiscaisNotas_ICMS_descricaotitulo: TStringField;
    qryResumoDadosFiscaisNotas_ICMS_subtitulo: TIntegerField;
    qryResumoDadosFiscaisNotas_ICMS_descricaosubtitulo: TStringField;
    qryResumoDadosFiscaisNotas_IPIvalortotal: TFloatField;
    qryResumoDadosFiscaisNotas_IPIbase: TFloatField;
    qryResumoDadosFiscaisNotas_IPIvalor: TFloatField;
    qryResumoDadosFiscaisNotas_IPIisentas: TFloatField;
    qryResumoDadosFiscaisNotas_IPIoutras: TFloatField;
    qryResumoDadosFiscaisNotas_IPIcodigofiscal: TIntegerField;
    qryResumoDadosFiscaisNotas_IPIdescricao: TStringField;
    qryResumoDadosFiscaisNotas_IPItitulo: TIntegerField;
    qryResumoDadosFiscaisNotas_IPIdescricaotitulo: TStringField;
    qryResumoDadosFiscaisNotas_IPIsubtitulo: TIntegerField;
    qryResumoDadosFiscaisNotas_IPIdescricaosubtitulo: TStringField;
    dsrCodigosFiscais: TtecDataSource;
    qryDadosFiscaisNotas_ICMScodigofiscal: TIntegerField;
    qryDadosFiscaisNotas_IPIcodigofiscal: TIntegerField;
    qryDadosFiscais_Notas_e_Cupons: TtecQuery;
    qryDadosFiscais_Notas_e_CuponsAgrupados: TtecQuery;
    qryDadosFiscais_Notas_e_CuponsMapasECF: TtecQuery;
    qryResumoDiario_Aux: TtecQuery;
    qryDadosFiscais: TtecQuery;
    qryDadosFiscaissituacao: TStringField;
    qryDadosFiscaisestadocfo: TStringField;
    qryDadosFiscaisvalortotal: TFloatField;
    qryDadosFiscaisserie: TStringField;
    qryDadosFiscaisnumeroinicial: TIntegerField;
    qryDadosFiscaisnumerofinal: TIntegerField;
    qryDadosFiscaisdata: TDateField;
    qryDadosFiscaisoperacao: TMemoField;
    qryDadosFiscaisdiferente: TBooleanField;
    qryCalculosDadosFiscais_Notas_e_CuponsAgrupados: TtecQuery;
    dsrDadosFiscais: TtecDataSource;
    qryCalculosDadosFiscaiscodigofiscal: TIntegerField;
    qryDadosFiscaisnumero: TStringField;
    qryCalculosDadosFiscaisnumero: TStringField;
    dsrDadosFiscaisNotas_ICMS: TtecDataSource;
    fdsCalculosDadosFiscaisOBS: TfrDBDataSet;
    qryCalculosDadosFiscaisOBS: TtecQuery;
    qryCalculosDadosFiscaisOBSnumero: TStringField;
    qryCalculosDadosFiscaisOBSobservacao: TStringField;
    qrySeriesativa: TBooleanField;
    qryDadosFiscaisehnotafiscalsaidasimplesfaturam: TBooleanField;
    procedure frpLivroSaidaMercadoriasTermosBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroSaidaMercadoriasTermosGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpResumoSinteticoSaidasBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpResumoDiarioBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryDadosFiscaisNotasCalcFields(DataSet: TDataSet);
    procedure qryDadosFiscaisBeforeOpen(DataSet: TDataSet);
    procedure frpLivroSaidaMercadoriasICMS_IPIBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure qryProcuraFiliaisAfterOpen(DataSet: TDataSet);
    procedure ZMonitorMonitorEvent(Sql, Result: String);
    procedure qryDadosFiscaisFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryResumoDiarioBeforeOpen(DataSet: TDataSet);
    procedure qryResumoSinteticoSaidasBeforeOpen(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisBeforeOpen(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisOBSBeforeOpen(DataSet: TDataSet);
    procedure qryResumoDadosFiscaisNotas_IPIBeforeOpen(DataSet: TDataSet);
    procedure qryDadosFiscaisNotas_ICMSBeforeOpen(DataSet: TDataSet);
    procedure qryDadosFiscaisNotas_IPIBeforeOpen(DataSet: TDataSet);
    procedure qryDadosFiscaisNotasBeforeOpen(DataSet: TDataSet);
    procedure qryResumoDadosFiscaisNotas_ICMS_BeforeOpen(
      DataSet: TDataSet);
  Protected
    ImpressaoTermos: TdtmImprimeTermos;
  private
    FCodigosEmitentes: boolean;
    FResumoDiario: boolean;
    FLivrodeSaida: boolean;
    FResumoSintetico: boolean;
    FParametroPagina: Integer;
    FParametroMaximo: Integer;
    FParametroLivro: Integer;
    FParametroRelatorio: Integer;
    FCodigoFiscalFinal: String;
    FDataFinal: String;
    FDataInicial: String;
    FCodigoFiscalInicial: String;
    FParametroCabecalho: String;
    FCuponsPorMapa: Boolean;
    FSeries: String;
    FCuponsAgrupados: Boolean;
    fIncluirNFCopiaECF: Boolean;
    FProcuraFiliaisAfterOpen: TNotifyEvent;
    fVerificarErros: Boolean;
    function GetCodigoFilial: Integer;
    function GetCodigoGrupoFilial: Integer;
    function GetConsultarFilial: TtecQuery;
    function GetConsultarGrupoFilial: TtecQuery;
    procedure SetCodigoFiscalFinal(const Value: String);
    procedure SetDataFinal(const Value: String);
    procedure SetParametroFilial(const Value: String);
    procedure SetParametroGrupoFilial(const Value: String);
    procedure SetParametroLivro(const Value: Integer);
    procedure SetParametroMaximo(const Value: Integer);
    procedure SetParametroPagina(const Value: Integer);
    procedure SetParametroRelatorio(const Value: Integer);
    function GetListaSeries: TLista;
    procedure SetCuponsAgrupados(const Value: Boolean);
    procedure SetIncluirNFCopiaECF(const Value: Boolean);
    procedure SetVerificarErros(const Value: Boolean);
    procedure AtribuirParametroSelecaoPelaDatadeEmissao(DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     function ExisteFilial(Campo, Codigo: string): Boolean;
     function ExisteGrupoFilial(Campo, Codigo: string): Boolean;
     procedure AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure Selecionar(Pesquisa: TtecPesquisa);
     procedure ImprimirRelatorio;
     property ConsultarFilial: TtecQuery read GetConsultarFilial;
     property ConsultarGrupoFilial: TtecQuery read GetConsultarGrupoFilial;
     property CodigoFilial: Integer read GetCodigoFilial;
     property CodigoGrupoFilial: Integer read GetCodigoGrupoFilial;
     property ParametroFilial: String write SetParametroFilial;
     property ParametroGrupoFilial: String write SetParametroGrupoFilial;
     property DataInicial: String read FDataInicial write FDataInicial;
     property DataFinal: String read FDataFinal write SetDataFinal;
     property CodigoFiscalInicial: String read FCodigoFiscalInicial write FCodigoFiscalInicial ;
     property CodigoFiscalFinal: String read FCodigoFiscalFinal write SetCodigoFiscalFinal;
     property ParametroLivro: Integer read FParametroLivro write SetParametroLivro;
     property ParametroPagina: Integer read FParametroPagina write SetParametroPagina;
     property ParametroMaximo: Integer read FParametroMaximo write SetParametroMaximo;
     property ParametroRelatorio: Integer read FParametroRelatorio write SetParametroRelatorio;
     property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
     property LivrodeSaida: boolean read FLivrodeSaida write FLivrodeSaida;
     property CodigosEmitentes: boolean read FCodigosEmitentes write FCodigosEmitentes;
     property ResumoSintetico: boolean read FResumoSintetico write FResumoSintetico ;
     property ResumoDiario: boolean read FResumoDiario write FResumoDiario;
     property CuponsPorMapa: Boolean read FCuponsPorMapa write FCuponsPorMapa;
     property CuponsAgrupados: Boolean read FCuponsAgrupados write SetCuponsAgrupados;
     property ListaSeries: TLista read GetListaSeries;
     procedure MontarFiltroSeries(Serie: TCheckListBox);
     procedure AbrirTabelas(LivroSaidas, ResumoSintetico, ResumoDiario: Boolean; relatorio: integer);
     property IncluirNFCopiaECF: Boolean read fIncluirNFCopiaECF write SetIncluirNFCopiaECF;

     property ProcuraFiliaisAfterOpen: TNotifyEvent
             read FProcuraFiliaisAfterOpen
             write FProcuraFiliaisAfterOpen;

     property VerificarErros : Boolean read fVerificarErros write SetVerificarErros;


  end;

var
  dtmLivroSaidaMercadorias: TdtmLivroSaidaMercadorias;
  FListaSeries  : TLista;

implementation
Const
 WhereFiliais  = 38;
 WhereFiliaisECF = 81;

{$R *.dfm}

{ TdtmLivroSaidaMercadorias }

procedure TdtmLivroSaidaMercadorias.AbreTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Abre(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Abre(ctPesquisaGrupoFilial);
  end;
end;

constructor TdtmLivroSaidaMercadorias.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaFiliais.Tag:= ctPesquisaFilial;
  qryConsultaGruposFiliais.Tag:= ctPesquisaGrupoFilial;
  qryProcuraFiliais.Tag:= ctTabelas;
  qryProcuraFiliais.Params[0].AsInteger := FilialBase;
  qryProcuraGruposFiliais.Tag:= ctTabelas;
  qryCodigosFiscais.Tag:=ctTabelas;
  qrySeries.ParamByName('filial').AsInteger := filialbase; 
end;


function TdtmLivroSaidaMercadorias.ExisteFilial(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmLivroSaidaMercadorias.ExisteGrupoFilial(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGruposFiliais, Campo, Codigo);
end;

procedure TdtmLivroSaidaMercadorias.FechaTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Fecha(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Fecha(ctPesquisaGrupoFilial);
  end;
end;

function TdtmLivroSaidaMercadorias.GetCodigoFilial: Integer;
begin
  Result := qryConsultaFiliaiscodigo.AsInteger;
end;

function TdtmLivroSaidaMercadorias.GetCodigoGrupoFilial: Integer;
begin
  Result := qryConsultaGruposFiliaiscodigo.AsInteger;
end;

function TdtmLivroSaidaMercadorias.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmLivroSaidaMercadorias.GetConsultarGrupoFilial: TtecQuery;
begin
  Result:= qryConsultaGruposFiliais;
end;

procedure TdtmLivroSaidaMercadorias.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio(qryprocurafiliaiscodigo.asstring);
  frVariables['DataExtensoInicial']:= DataExtenso(strtodate(FDataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodate(FDataFinal));
  frVariables['DataInicial']:= FDataInicial;
  frVariables['DataFinal']:= FDataFinal;
  frVariables['Titulo']  := 'LIVRO DE SAÍDAS DE MERCADORIA';
  frVariables['Livro']:= FParametroLivro;
  frVariables['Pagina']:=FParametroPagina;
  frVariables['Maximo']:=FParametroMaximo;
  frVariables['Outras']:=FParametroCabecalho;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3;


//  frpResumoDadosFiscaisNotas_IPI.DesignReport;
//  frpResumoDadosFiscaisNotas_ICMS.DesignReport;
//  frpLivroSaidaMercadoriasICMS_IPI.DesignReport;

  //frpLivroSaidaMercadorias.DesignReport;
  //frpResumoSinteticoSaidas.DesignReport;

//  frpResumoSinteticoSaidasApuracao.DesignReport;
  //frpResumoDiario.DesignReport;

  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   with frmPreview do
   begin
    case FParametroRelatorio of
    0: begin
         if FLivrodeSaida then
         begin
          if contribipi then
            frCompositeReport.Reports.Add(frpLivroSaidaMercadoriasICMS_IPI)
          else
            frCompositeReport.Reports.Add(frpLivroSaidaMercadorias);
         end;

         if FResumoSintetico then
         begin
          if contribipi then
          begin
            frCompositeReport.Reports.Add(frpResumoSinteticoSaidas);
            frCompositeReport.Reports.Add(frpResumoDadosFiscaisNotas_IPI);
          end
          else
            frCompositeReport.Reports.Add(frpResumoSinteticoSaidas);
         end;

         if FResumoDiario then
         begin
          if contribipi then
            frCompositeReport.Reports.Add(frpResumoDiario)
          else
            frCompositeReport.Reports.Add(frpResumoDiario);
         end
     end;
    1: begin
        if not Assigned(ImpressaoTermos) then
          ImpressaoTermos := TdtmImprimeTermos.Create(Self);
//        ImpressaoTermos.frpTermos_R.DesignReport;
        frCompositeReport.Reports.Add(ImpressaoTermos.frpTermos_R);
       end;
    end;
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;

   frmPreview.ShowModal;

  finally

   frmPreview.Free;
   AtribuirParametrosBaseRelatorio;

  end;

end;


procedure TdtmLivroSaidaMercadorias.Selecionar(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesFILIAIS      : RefazConsulta(qryProcuraFiliais,[0],[CodigoFilial]);
    pesGRUPOSFILIAIS: RefazConsulta(qryProcuraGruposFiliais,[0],[CodigoGrupoFilial]);
  end;
end;

procedure TdtmLivroSaidaMercadorias.SetCodigoFiscalFinal(
  const Value: String);
begin
 if Value<>'' then
 begin
   FCodigoFiscalFinal:=Value;
   if FCodigoFiscalInicial='' then
    FCodigoFiscalInicial:=FCodigoFiscalFinal;
 end
 else
  FCodigoFiscalFinal:=FCodigoFiscalInicial;

 if contribipi then
 begin
    qryDadosFiscaisNotas.ParamByName('CodigoFiscalInicial').AsString      := FCodigoFiscalInicial;
    qryDadosFiscaisNotas.ParamByName('CodigoFiscalFinal').AsString      := FCodigoFiscalFinal;

    qryDadosFiscaisNotas_ICMS.ParamByName('CodigoFiscalInicial').AsString := FCodigoFiscalInicial;
    qryDadosFiscaisNotas_ICMS.ParamByName('CodigoFiscalFinal').AsString := FCodigoFiscalFinal;

    qryDadosFiscaisNotas_IPI.ParamByName('CodigoFiscalInicial').AsString  := FCodigoFiscalInicial;
    qryDadosFiscaisNotas_IPI.ParamByName('CodigoFiscalFinal').AsString  := FCodigoFiscalFinal;

    qryResumoSinteticoSaidas.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
    qryResumoSinteticoSaidas.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;

    qryResumoDadosFiscaisNotas_IPI.ParamByName('CodigoFiscalInicial').AsString:= FCodigoFiscalInicial;
    qryResumoDadosFiscaisNotas_IPI.ParamByName('CodigoFiscalFinal').AsString:= FCodigoFiscalFinal;

    qryResumoDiario.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
    qryResumoDiario.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;
 end
 else
 begin
   qrydadosfiscais.ParamByName('EstadoFilialBase').AsString:=EstadoFilialBase;

   qrydadosfiscais.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
   qryDadosFiscais.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;

   qryCalculosDadosFiscais.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
   qryCalculosDadosFiscais.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;

   if qryCalculosDadosFiscaisOBS.paramcount <> 0 then
   begin
     qryCalculosDadosFiscaisOBS.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
     qryCalculosDadosFiscaisOBS.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;
   end;

   qryResumoSinteticoSaidas.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
   qryResumoSinteticoSaidas.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;

   qryResumoDiario.ParamByName('CodigoFiscalInicial').AsString:=FCodigoFiscalInicial;
   qryResumoDiario.ParamByName('CodigoFiscalFinal').AsString:=FCodigoFiscalFinal;

 end;

 if (FCodigoFiscalInicial <> qryCodigosFiscaismenorcodigo.AsString) or
    (FCodigoFiscalFinal <> qryCodigosFiscaismaiorcodigo.AsString) then
  FParametroCabecalho:=FParametroCabecalho+' CÓDIGO FISCAL ENTRE '+FCodigoFiscalInicial+' E '+FCodigoFiscalFinal;
end;

procedure TdtmLivroSaidaMercadorias.SetDataFinal(const Value: String);
begin
  if Value<>'' then
  begin
   FDataFinal := Value;
   if FDataInicial='' then
    FDataInicial:=FDataFinal;
  end
  else
   FDataFinal:=FDataInicial;

  //CONTRIBUINTE DE IPI

  if contribipi then
  begin
    qryDadosFiscaisNotas.ParamByName('DataInicial').AsString:=FDataInicial;
    qryDadosFiscaisNotas.ParamByName('DataFinal').AsString:=FDataFinal;

    qryDadosFiscaisNotas_ICMS.ParamByName('DataInicial').AsString:=FDataInicial;
    qryDadosFiscaisNotas_ICMS.ParamByName('DataFinal').AsString:=FDataFinal;

    qryDadosFiscaisNotas_IPI.ParamByName('DataInicial').AsString:=FDataInicial;
    qryDadosFiscaisNotas_IPI.ParamByName('DataFinal').AsString:=FDataFinal;

    qryResumoSinteticoSaidas.ParamByName('DataInicial').AsString:=FDataInicial;
    qryResumoSinteticoSaidas.ParamByName('DataFinal').AsString:=FDataFinal;

    qryResumoDadosFiscaisNotas_IPI.ParamByName('DataInicial').AsString:=FDataInicial;
    qryResumoDadosFiscaisNotas_IPI.ParamByName('DataFinal').AsString:=FDataFinal;

    qryResumoDiario.ParamByName('DataInicial').AsString:=FDataInicial;
    qryResumoDiario.ParamByName('DataFinal').AsString:=FDataFinal;
  end
  else
  begin
    qryDadosFiscais.ParamByName('DataInicial').AsString:=FDataInicial;
    qryDadosFiscais.ParamByName('DataFinal').AsString:=FDataFinal;

    qryCalculosDadosFiscais.ParamByName('DataInicial').AsString:=FDataInicial;
    qryCalculosDadosFiscais.ParamByName('DataFinal').AsString:=FDataFinal;

    if qryCalculosDadosFiscaisOBS.ParamCount <> 0 then
    begin
      qryCalculosDadosFiscaisOBS.ParamByName('DataInicial').AsString:=FDataInicial;
      qryCalculosDadosFiscaisOBS.ParamByName('DataFinal').AsString:=FDataFinal;
    end;

    qryResumoSinteticoSaidas.ParamByName('DataInicial').AsString:=FDataInicial;
    qryResumoSinteticoSaidas.ParamByName('DataFinal').AsString:=FDataFinal;

    qryResumoDiario.ParamByName('DataInicial').AsString:=FDataInicial;
    qryResumoDiario.ParamByName('DataFinal').AsString:=FDataFinal;
  end;

  FParametroCabecalho:='DE '+FDataInicial+' A '+FDataFinal;
end;

procedure TdtmLivroSaidaMercadorias.SetParametroFilial(
  const Value: String);
var
 SQL: String;
begin
 if Value<>'' then
 begin
   {SQL:=' and (df.filialemissao = ' + Value + ')';}
   SQL:=' and (df.filialemissao  = ' + Value + ' or df.filialemissao in (select f.codigo from filiais f where f.filialconsolidadoradime  = '+Value+'))';
 end
 else
   SQL:='';

 if contribipi then
 begin
    qryDadosFiscaisNotas.MacroByName('FiltroFiliais').AsString:=SQL;
    qryDadosFiscaisNotas_ICMS.MacroByName('FiltroFiliais').AsString:=SQL;
    qryDadosFiscaisNotas_IPI.MacroByName('FiltroFiliais').AsString:=SQL;
    qryResumoSinteticoSaidas.MacroByName('FiltroFiliais').AsString := SQL;
    qryResumoDadosFiscaisNotas_IPI.MacroByName('FiltroFiliais').AsString:=SQL;
    qryResumoDiario.MacroByName('FiltroFiliais').AsString := SQL;
 end
 else
 begin
   qryDadosFiscais.paramByName('filialemissao').AsString := Value;
   qryCalculosDadosFiscais.paramByName('filialemissao').AsString := Value;

   if qryCalculosDadosFiscaisOBS.paramCount <> 0 then
     qryCalculosDadosFiscaisOBS.paramByName('filialemissao').AsString := Value;

   qryResumoSinteticoSaidas.paramByName('filialemissao').AsString := Value;
   qryResumoDiario.paramByName('filialemissao').AsString := Value;

 end;
end;

procedure TdtmLivroSaidaMercadorias.SetParametroGrupoFilial(
  const Value: String);
var
SQL : String;
begin
 SQL:='';
 if (Value <> '') then
 begin
  SQL:=' and (df.filialemissao in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
 end;
end;

procedure TdtmLivroSaidaMercadorias.SetParametroLivro(
  const Value: Integer);
begin
  FParametroLivro := Value;
end;

procedure TdtmLivroSaidaMercadorias.SetParametroMaximo(
  const Value: Integer);
begin
  FParametroMaximo := Value;
end;

procedure TdtmLivroSaidaMercadorias.SetParametroPagina(
  const Value: Integer);
begin
  FParametroPagina := Value;
end;

procedure TdtmLivroSaidaMercadorias.SetParametroRelatorio(
  const Value: Integer);
begin
  FParametroRelatorio := Value;
end;

procedure TdtmLivroSaidaMercadorias.frpLivroSaidaMercadoriasTermosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroSaidaMercadorias, view);
  if (view.Name = 'mmoRODAPEHORA') or (view.Name = 'mmoRODAPETECSOFT') then
    view.BandAlign := baBottom;
end;

procedure TdtmLivroSaidaMercadorias.frpLivroSaidaMercadoriasTermosGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if ParName = 'NOMECONTADOR' then ParValue := ParSistema.NomeContador
  else if ParName = 'CRCCONTADOR' then ParValue := ParSistema.CRCContador
  else if ParName = 'RESPONSAVEL1' then ParValue := ParSistema.ResponsavelLivros1
  else if ParName = 'RESPONSAVEL2' then ParValue := ParSistema.ResponsavelLivros2
  else if Parname = 'FOLHA_OU_PAGINA' then
       case ParSistema.LivrosFiscaisFolhaouPagina of
        0: ParValue := ctFOLHA;
        1: ParValue := ctPAGINA;
       end;

end;

function TdtmLivroSaidaMercadorias.GetListaSeries: TLista;
Var
Ind: Integer;
begin
  FillChar(FListaSeries,SizeOf(FListaSeries),0);
  qrySeries.Open;
  SetLength(FListaSeries, qrySeries.RecordCount);
  Ind:= 0;
  while not qrySeries.Eof do
  begin
    FListaSeries[Ind].codigo   := qrySeriesserie.AsString;
    FListaSeries[Ind].descricao := qrySeriesserie.AsString;
    FListaSeries[Ind].ativa := qrySeriesativa.AsBoolean;
    Inc(Ind);
    qrySeries.Next;
  end;
  qrySeries.Close;
  Result := FListaSeries;
end;

procedure TdtmLivroSaidaMercadorias.MontarFiltroSeries(
  Serie: TCheckListBox);
var
  STRSeries: String;
  Ind: Integer;
begin
  STRSeries := '';
  for Ind:= 0 to (Length(FListaSeries) - 1) do
    if Serie.Checked[Ind] then
      STRSeries := STRSeries + QuotedStr(FListaSeries[Ind].codigo) + ',';
  STRSeries := Copy(STRSeries, 0, Length(STRSeries) - 1);
  if STRSeries <> '' then
       FSeries:= 'and ( n.serie in (' + STRSeries + '))'
  else
       FSeries:= '';

  if contribipi then
  begin
    qryDadosFiscaisNotas.MacroByName('FiltroSeries').AsString       := FSeries;
    qryDadosFiscaisNotas_ICMS.MacroByName('FiltroSeries').AsString  := FSeries;
    qryDadosFiscaisNotas_IPI.MacroByName('FiltroSeries').AsString   := FSeries;
    qryResumoSinteticoSaidas.MacroByName('FiltroSeries').AsString:=FSeries;
    qryResumoDadosFiscaisNotas_IPI.MacroByName('FiltroSeries').AsString := FSeries;
    qryResumoDiario.MacroByName('FiltroSeries').AsString:=FSeries;
  end
  else
  begin
    qryDadosFiscais.MacroByName('FiltroSeries').AsString:=FSeries;
    qryCalculosDadosFiscais.MacroByName('FiltroSeries').AsString:=FSeries;

    if qryCalculosDadosFiscaisOBS.macrocount <> 0 then
      qryCalculosDadosFiscaisOBS.MacroByName('FiltroSeries').AsString:=FSeries;

    qryResumoSinteticoSaidas.MacroByName('FiltroSeries').AsString:=FSeries;
    qryResumoDiario.MacroByName('FiltroSeries').AsString:=FSeries;
  end;
end;

procedure TdtmLivroSaidaMercadorias.frpResumoSinteticoSaidasBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpResumoSinteticoSaidas, view);
end;

procedure TdtmLivroSaidaMercadorias.frpResumoDiarioBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpResumoDiario, view);
end;

 procedure TdtmLivroSaidaMercadorias.qryDadosFiscaisNotasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if not qryDadosFiscaisNotas.ParamByName('ExisteFiltroCodigo').AsBoolean then
  begin
    qryDadosFiscaisNotasdifvalortotal_icms.AsBoolean :=
       qryDadosFiscaisNotasvalortotal_icms.AsCurrency <>
       qryDadosFiscaisNotasvalortotal.AsCurrency;
    qryDadosFiscaisNotasdifvalortotal_ipi.AsBoolean :=
       qryDadosFiscaisNotasvalortotal_ipi.AsCurrency <>
       qryDadosFiscaisNotasvalortotal.AsCurrency;
  end
  else
  begin
    qryDadosFiscaisNotasdifvalortotal_icms.AsBoolean := false;
    qryDadosFiscaisNotasdifvalortotal_ipi.AsBoolean := false;
  end;
end;

 procedure TdtmLivroSaidaMercadorias.qryDadosFiscaisBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
//  MensagemAviso('abrindo');
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;


procedure TdtmLivroSaidaMercadorias.frpLivroSaidaMercadoriasICMS_IPIBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroSaidaMercadoriasICMS_IPI, view);
end;

procedure TdtmLivroSaidaMercadorias.AbrirTabelas(
  LivroSaidas, ResumoSintetico, ResumoDiario: Boolean;
  relatorio: integer);
var
  i : integer;
begin

  qryDadosFiscais.ParamByName('ContribICMS').AsBoolean := ContribICMS;

  qryDadosFiscais.ParamByName('ExisteFiltroCodigo').AsBoolean :=
      (strtoint(CodigoFiscalInicial) <> qryCodigosFiscaismenorcodigo.AsInteger) or
      (strtoint(CodigoFiscalFinal)   <> qryCodigosFiscaismaiorcodigo.AsInteger);


  qryDadosFiscaisNotas.ParamByName('ExisteFiltroCodigo').AsBoolean :=
    qryDadosFiscais.ParamByName('ExisteFiltroCodigo').AsBoolean;

  if dtmLivroSaidaMercadorias.ContribIPI then
  begin
    if LivroSaidas then
    begin
      refazConsulta(qryDadosFiscaisNotas,[],[]);
      refazConsulta(qryDadosFiscaisNotas_ICMS,[],[]);
      refazConsulta(qryDadosFiscaisNotas_IPI,[],[]);
    end;

    if ResumoSintetico then
    begin
      refazConsulta(qryResumoSinteticoSaidas,[],[]);
      refazConsulta(qryResumoDadosFiscaisNotas_IPI,[],[]);
    end;

    if ResumoDiario then
      RefazConsulta(qryResumoDiario, [], []);

  end
  else
  begin
    if LivroSaidas then
    begin
      qryCalculosDadosFiscaisOBS.Sql.Text := qryCalculosDadosFiscais.Sql.Text;
      qryCalculosDadosFiscaisOBS.Sql.Insert(1,'SELECT distinct numero,  cast(observacao as varchar(350)) as observacao FROM (');
      qryCalculosDadosFiscaisOBS.Sql.Append(') as temp');

      for i:=0 to qryCalculosDadosFiscais.ParamCount-1 do
        qryCalculosDadosFiscaisOBS.Params[I].Value := qryCalculosDadosFiscais.Params[I].Value;


      for i:=0 to qryCalculosDadosFiscais.MacroCount-1 do
        qryCalculosDadosFiscaisOBS.Macros[I].Value := qryCalculosDadosFiscais.Macros[I].Value;

      refazConsulta(qryDadosFiscais,[],[]);
      refazconsulta(qryCalculosDadosFiscais,[],[]);
      refazconsulta(qryCalculosDadosFiscaisOBS,[],[]);

    end;

    if ResumoSintetico then
      refazConsulta(qryResumoSinteticoSaidas,[],[]);

    if ResumoDiario then
      RefazConsulta(qryResumoDiario, [], []);
  end;
end;

procedure TdtmLivroSaidaMercadorias.SetCuponsAgrupados(
  const Value: Boolean);
begin
  FCuponsAgrupados := Value;
  if FCuponsAgrupados then
  begin
    qryDadosFiscais.Sql.Text          := qryDadosFiscais_Notas_e_CuponsAgrupados.Sql.Text;
    qryCalculosDadosFiscais.Sql.Text  := qryCalculosDadosFiscais_Notas_e_CuponsAgrupados.Sql.Text;

//    qryCalculosDadosFiscaisOBS.Sql.Text  := qryCalculosDadosFiscais_Notas_e_CuponsAgrupados.Sql.Text;

    qryResumoSinteticoSaidas.Sql.Text := qryResumoSintetico_aux.sql.text;
    qryResumoDiario.Sql.Text          := qryResumoDiario_aux.Sql.Text;
  end
  else
  if FCuponsPorMapa then
  begin
    qryDadosFiscais.Sql.Text          := qryDadosFiscais_Notas_e_CuponsMapasECF.Sql.Text;
    qryCalculosDadosFiscais.Sql.Text  := qryCalculosDadosFiscais_Notas_e_CuponsMapasECFCalculos.Sql.Text;

//    qryCalculosDadosFiscaisOBS.Sql.Text  := qryCalculosDadosFiscais_Notas_e_CuponsMapasECFCalculos.Sql.Text;

    qryResumoSinteticoSaidas.Sql.Text := qryResumoSintetico_aux.sql.text;
    qryResumoDiario.Sql.Text          := qryResumoDiario_aux.Sql.Text;
  end
  else
  begin
    qryDadosFiscais.Sql.Text          := qryDadosFiscais_Notas_e_Cupons.Sql.Text;
    qryCalculosDadosFiscais.Sql.Text  := qryCalculosDadosFiscais_Notas_e_Cupons.Sql.Text;

//    qryCalculosDadosFiscaisOBS.Sql.Text  := qryCalculosDadosFiscais_Notas_e_Cupons.Sql.Text;

    qryResumoSinteticoSaidas.Sql.Text := qryResumoSintetico_aux.sql.text;
    qryResumoDiario.Sql.Text          := qryResumoDiario_aux.Sql.Text;
  end;
end;

procedure TdtmLivroSaidaMercadorias.SetIncluirNFCopiaECF(
  const Value: Boolean);
const
  SQL = ' and df.codigofiscal not in (5929,6929)';

begin
  fIncluirNFCopiaECF := Value;
  if not IncluirNFCopiaECF then
  begin
    qryDadosFiscaisNotas.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryDadosFiscaisNotas_ICMS.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryDadosFiscaisNotas_IPI.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryResumoSinteticoSaidas.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryResumoDadosFiscaisNotas_IPI.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryResumoDiario.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;

    qryDadosFiscais.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryCalculosDadosFiscais.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;

    if qryCalculosDadosFiscaisOBS.macrocount <> 0 then
      qryCalculosDadosFiscaisOBS.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;

    qryResumoSinteticoSaidas.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
    qryResumoDiario.MacroByName('FiltroIncluirNFCopiaECF').AsString := SQL;
  end
  else
  begin

    qryDadosFiscaisNotas.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';
    qryDadosFiscaisNotas_ICMS.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';
    qryDadosFiscaisNotas_IPI.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';
    qryResumoSinteticoSaidas.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';
    qryResumoDadosFiscaisNotas_IPI.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';
    qryResumoDiario.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';

    qryDadosFiscais.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';

    qryCalculosDadosFiscais.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';

    if qryCalculosDadosFiscaisOBS.macrocount <> 0 then
      qryCalculosDadosFiscaisOBS.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';


    qryResumoSinteticoSaidas.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';
    qryResumoDiario.MacroByName('FiltroIncluirNFCopiaECF').AsString := '';

  end;


end;

procedure TdtmLivroSaidaMercadorias.qryProcuraFiliaisAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if qryProcuraFiliaiscodigo.AsInteger <> 0 then
  begin
    if qrySeries.ParamByName('filial').AsInteger <> qryProcuraFiliaiscodigo.AsInteger then
    begin
      qrySeries.ParamByName('filial').AsInteger := qryProcuraFiliaiscodigo.AsInteger;
      qryseries.close;
      qryseries.open;
      if Assigned(FProcuraFiliaisAfterOpen) then
        FProcuraFiliaisAfterOpen(qryProcuraFiliais);
    end;
  end;
end;

procedure TdtmLivroSaidaMercadorias.ZMonitorMonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 arquivo : String;
begin
  inherited;
    arquivo := 'c:/tecsoft/log.sql';
    Listar := tStringlist.create;
    if fileexists(arquivo) then
      Listar.loadfromfile(arquivo);

    Listar.add('');
    Listar.add(sql);
    Listar.add(result);
    Listar.savetofile(arquivo);
    Listar.free;
end;

procedure TdtmLivroSaidaMercadorias.SetVerificarErros(
  const Value: Boolean);
begin
  fVerificarErros := Value;
  qryDadosFiscais.filtered := Value;
end;

procedure TdtmLivroSaidaMercadorias.qryDadosFiscaisFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryDadosFiscais.Filtered then
    Accept := qryDadosFiscaisdiferente.AsBoolean;
end;

procedure TdtmLivroSaidaMercadorias.qryResumoDiarioBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.AtribuirParametroSelecaoPelaDatadeEmissao(
  DataSet: TDataSet);
begin
  TtecQuery(DataSet).ParamByName('SelecaoPelaDatadeEmissao').AsBoolean :=
    TCheckBox(self.owner.FindComponent('ckbSelecaoPelaDatadeEmissao')).checked;
end;

procedure TdtmLivroSaidaMercadorias.qryResumoSinteticoSaidasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryCalculosDadosFiscaisBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryCalculosDadosFiscaisOBSBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryResumoDadosFiscaisNotas_IPIBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryDadosFiscaisNotas_ICMSBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryDadosFiscaisNotas_IPIBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryDadosFiscaisNotasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

procedure TdtmLivroSaidaMercadorias.qryResumoDadosFiscaisNotas_ICMS_BeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirParametroSelecaoPelaDatadeEmissao(DataSet);
end;

end.
