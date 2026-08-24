unit dmlivroapuracaoPisCofins;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, DateUtils,
  cpquery, FR_Class, ctconstantes, FR_DSet, FR_DBSet, cptable, clparametrossistema,
  fmpreviewpadrao, biblio, ZTransact, ExcelExport, frxClass, frxDBSet,
  Provider, DBClient, frxExportODF, frxExportTXT, frxExportMail,
  frxExportCSV, frxExportText, frxExportImage, frxExportRTF, frxExportXML,
  frxExportXLS, frxExportHTML, StdCtrls;
  
type
  TdtmLivroApuracaoPisCofins = class(TdtmBasico)
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
    qryLivroApuracaoPISCofins_Debitos: TtecQuery;
    fdsLivroApuracaoPISCofins_Debitos: TfrDBDataSet;
    frpLivroApuracaoPISCofins_Debitos: TfrReport;
    qryProcuraFiliaisjunta: TStringField;
    qryProcuraFiliaisjuntadata: TDateField;
    qryLivroApuracaoPISCofins_Debitosfilial: TIntegerField;
    qryLivroApuracaoPISCofins_Debitosdata: TDateField;
    qryLivroApuracaoPISCofins_Debitosespecie: TStringField;
    qryLivroApuracaoPISCofins_Debitosserie: TStringField;
    qryLivroApuracaoPISCofins_Debitosnumero: TIntegerField;
    qryLivroApuracaoPISCofins_Debitosvalortotal: TFloatField;
    qryLivroApuracaoPISCofins_Debitoscodigofiscal: TIntegerField;
    qryLivroApuracaoPISCofins_Debitospiscst: TStringField;
    qryLivroApuracaoPISCofins_Debitospisbasecalculo: TFloatField;
    qryLivroApuracaoPISCofins_Debitospisvalor: TFloatField;
    qryLivroApuracaoPISCofins_Debitospisaliquota: TFloatField;
    qryLivroApuracaoPISCofins_Debitoscofinscst: TStringField;
    qryLivroApuracaoPISCofins_Debitoscofinsbasecalculo: TFloatField;
    qryLivroApuracaoPISCofins_Debitoscofinsvalor: TFloatField;
    qryLivroApuracaoPISCofins_Debitosaliquotacofins: TFloatField;
    qryLivroApuracaoPISCofins_Debitoscod_inc_trib: TIntegerField;
    qryLivroApuracaoPISCofins_Debitosccs435: TStringField;
    qryLivroApuracaoPISCofins_Debitostipocontribuicao: TStringField;
    qryLivroApuracaoPISCofins_Debitosdescricaot435: TStringField;
    frpLivroApuracaoPISCofinsResumo_Debitos: TfrReport;
    qryLivroApuracaoPISCofins_Creditos: TtecQuery;
    fdsLivroApuracaoPISCofins_Creditos: TfrDBDataSet;
    qryLivroApuracaoPISCofins_Creditosfilialemissao: TIntegerField;
    qryLivroApuracaoPISCofins_Creditosdata: TDateField;
    qryLivroApuracaoPISCofins_Creditosespecie: TStringField;
    qryLivroApuracaoPISCofins_Creditosserie: TStringField;
    qryLivroApuracaoPISCofins_Creditosnumero: TIntegerField;
    qryLivroApuracaoPISCofins_Creditosmodelodocto: TStringField;
    qryLivroApuracaoPISCofins_Creditosvalortotal: TFloatField;
    qryLivroApuracaoPISCofins_Creditoscodigofiscal: TIntegerField;
    qryLivroApuracaoPISCofins_Creditospiscst: TStringField;
    qryLivroApuracaoPISCofins_Creditospisbasecalculo: TFloatField;
    qryLivroApuracaoPISCofins_Creditospisvalor: TFloatField;
    qryLivroApuracaoPISCofins_Creditospisaliquota: TFloatField;
    qryLivroApuracaoPISCofins_Creditoscofinscst: TStringField;
    qryLivroApuracaoPISCofins_Creditoscofinsbasecalculo: TFloatField;
    qryLivroApuracaoPISCofins_Creditoscofinsvalor: TFloatField;
    qryLivroApuracaoPISCofins_Creditoscofinsaliquota: TFloatField;
    qryLivroApuracaoPISCofins_Creditosctc436: TIntegerField;
    qryLivroApuracaoPISCofins_Creditosdescricaot437: TStringField;
    qryLivroApuracaoPISCofins_Creditoscbcc437: TStringField;
    qryLivroApuracaoPISCofins_Creditosdescricaot436: TStringField;
    frpLivroApuracaoPISCofinsResumo_Creditos: TfrReport;
    frpLivroApuracaoPISCofins_Creditos: TfrReport;
    qryLivroApuracaoPISCofins_Debitosdadofiscal: TIntegerField;
    qryLivroApuracaoPISCofins_Debitoscofinsretido: TFloatField;
    qryLivroApuracaoPISCofins_Debitospisretido: TFloatField;
    qryLivroApuracaoPISCofins_Creditosfornecedor: TIntegerField;
    qryLivroApuracaoPISCofins_Creditostipofornecedor: TStringField;
    qry_CFOP_PisCofins: TtecQuery;
    frxDB_CFOP_PisCofins: TfrxDBDataset;
    frx_CFOP_PisCofins: TfrxReport;
    qry_CFOP_PisCofinsfilial: TIntegerField;
    qry_CFOP_PisCofinsdata: TDateField;
    qry_CFOP_PisCofinsespecie: TStringField;
    qry_CFOP_PisCofinsserie: TStringField;
    qry_CFOP_PisCofinsnumero: TIntegerField;
    qry_CFOP_PisCofinssequencia: TLargeintField;
    qry_CFOP_PisCofinsvalortotal: TFloatField;
    qry_CFOP_PisCofinscodigofiscal: TIntegerField;
    qry_CFOP_PisCofinscstpiscofins: TStringField;
    qry_CFOP_PisCofinspisbasecalculo: TFloatField;
    qry_CFOP_PisCofinspisvalor: TFloatField;
    qry_CFOP_PisCofinscofinsbasecalculo: TFloatField;
    qry_CFOP_PisCofinscofinsvalor: TFloatField;
    CDS_CFOP_PisCofins_cst: TClientDataSet;
    DSP_CDS_CFOP_PisCofins_cst: TDataSetProvider;
    CDS_CFOP_PisCofins_cstfilial: TIntegerField;
    CDS_CFOP_PisCofins_cstdata: TDateField;
    CDS_CFOP_PisCofins_cstespecie: TStringField;
    CDS_CFOP_PisCofins_cstserie: TStringField;
    CDS_CFOP_PisCofins_cstnumero: TIntegerField;
    CDS_CFOP_PisCofins_cstsequencia: TLargeintField;
    CDS_CFOP_PisCofins_cstvalortotal: TFloatField;
    CDS_CFOP_PisCofins_cstcstpiscofins: TStringField;
    CDS_CFOP_PisCofins_cstpisbasecalculo: TFloatField;
    CDS_CFOP_PisCofins_cstpisvalor: TFloatField;
    CDS_CFOP_PisCofins_cstcofinsbasecalculo: TFloatField;
    CDS_CFOP_PisCofins_cstcofinsvalor: TFloatField;
    CDS_CFOP_PisCofins_cstTotalPisBaseCalculo: TAggregateField;
    frxDB_CST_PisCofins: TfrxDBDataset;
    CDS_CFOP_PisCofins_cstTotalPisBaseCalculo_: TFloatField;
    CDS_CFOP_PisCofins_cstcodigofiscal: TIntegerField;
    CDS_CFOP_PisCofins_cstTotalPisValor: TAggregateField;
    CDS_CFOP_PisCofins_cstTotalPisValor_: TFloatField;
    CDS_CFOP_PisCofins_cstTotalCofinsBaseCalculo: TAggregateField;
    CDS_CFOP_PisCofins_cstTotalCofinsValor: TAggregateField;
    CDS_CFOP_PisCofins_cstTotalCofinsBaseCalculo_: TFloatField;
    CDS_CFOP_PisCofins_cstTotalCofinsValor_: TFloatField;
    DataSource1: TDataSource;
    CDS_CFOP_PisCofins_cstTotalValorTotal_unico: TAggregateField;
    qry_CFOP_PisCofinsvalortotal_unico: TFloatField;
    CDS_CFOP_PisCofins_cstvalortotal_unico: TFloatField;
    CDS_CFOP_PisCofins_cstTotalValorTotal_Unico_: TFloatField;
    qry_CFOP_PisCofinsdescricaocodigofiscal: TStringField;
    qry_CFOP_PisCofinsdescricaopiscofins: TStringField;
    CDS_CFOP_PisCofins_cstdescricaocodigofiscal: TStringField;
    CDS_CFOP_PisCofins_cstdescricaopiscofins: TStringField;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxGIFExport1: TfrxGIFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxCSVExport1: TfrxCSVExport;
    frxMailExport1: TfrxMailExport;
    frxTXTExport1: TfrxTXTExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    CFOP_PisCofins: TfrxDBDataset;
    CST_PisCofins: TfrxDBDataset;
    qry_CFOP_PisCofinsorigem: TStringField;
    CDS_CFOP_PisCofins_cstorigem: TStringField;
    qry_CFOP_PisCofinsvalortotalprodutos: TFloatField;
    CDS_CFOP_PisCofins_cstvalortotalprodutos: TFloatField;
    CDS_CFOP_PisCofins_cstTotalValorTotalProdutos: TAggregateField;
    CDS_CFOP_PisCofins_cstTotalValorTotalProdutos_: TFloatField;
    procedure frpLivroApuracaoPisCofinsTermosGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroApuracaoPISCofins_DebitosBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroApuracaoPISCofinsResumo_CreditosBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure CDS_CFOP_PisCofins_cstCalcFields(DataSet: TDataSet);
    procedure qry_CFOP_PisCofinsBeforeOpen(DataSet: TDataSet);
    procedure frx_CFOP_PisCofinsGetValue(const VarName: String;
      var Value: Variant);
    procedure qryLivroApuracaoPISCofins_CreditosBeforeOpen(
      DataSet: TDataSet);
    procedure qryLivroApuracaoPISCofins_DebitosBeforeOpen(
      DataSet: TDataSet);
  Protected
  private
    FResumo: boolean;
    FLivrodeApuracaoPisCofins: boolean;
    FParametroMaximo: Integer;
    FParametroPagina: Integer;
    FParametroLivro: Integer;
    FParametrosRelatorio: Integer;
    FParametroCabecalho: String;
    FParametroFilial: String;
    FMesAno: String;
    fNotasdeTransferencia_e: Boolean;
    fNotasdeDevolucao_e: boolean;
    fNotasdeVenda: Boolean;
    fNotasdeCompra: Boolean;
    fNotasdeTransferencia_s: Boolean;
    fNotasdeDevolucao_s: Boolean;
    function GetCodigoFilial: Integer;
    function GetCodigoGrupoFilial: Integer;
    function GetConsultarFilial: TtecQuery;
    function GetConsultarGrupoFilial: TtecQuery;
    procedure SetParametroFilial(const Value: String);
    procedure SetMesAno(const Value: String);
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     function ExisteFilial(Campo, Codigo: string): Boolean;
     procedure AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure Selecionar(Pesquisa: TtecPesquisa);
     procedure ImprimirRelatorio;
     property ConsultarFilial: TtecQuery read GetConsultarFilial;
     property ConsultarGrupoFilial: TtecQuery read GetConsultarGrupoFilial;
     property CodigoFilial: Integer read GetCodigoFilial;
     property CodigoGrupoFilial: Integer read GetCodigoGrupoFilial;
     property ParametroFilial: String read FParametroFilial write SetParametroFilial;
     property MesAno: String read FMesAno write SetMesAno;
     property ParametroLivro: Integer read FParametroLivro write FParametroLivro;
     property ParametroPagina: Integer read FParametroPagina write FParametroPagina;
     property ParametroMaximo: Integer read FParametroMaximo write FParametroMaximo;
     property ParametrosRelatorio: Integer read FParametrosRelatorio write FParametrosRelatorio;
     property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
     property LivrodeApuracaoPisCofins: boolean read FLivrodeApuracaoPisCofins write FLivrodeApuracaoPisCofins;
     property Resumo: boolean read FResumo write FResumo ;
     function AbrirConsultaRelatorios: Boolean;
     procedure ExportarDadosPISCOFINS;

     property NotasdeVenda: Boolean read fNotasdeVenda write fNotasdeVenda;
     property NotasdeTransferencia_e: Boolean read fNotasdeTransferencia_e write fNotasdeTransferencia_e;
     property NotasdeDevolucao_e: boolean read fNotasdeDevolucao_e write fNotasdeDevolucao_e;

     property NotasdeCompra: Boolean read fNotasdeCompra write fNotasdeCompra;
     property NotasdeTransferencia_s: Boolean read fNotasdeTransferencia_s write fNotasdeTransferencia_s;
     property NotasdeDevolucao_s: Boolean read fNotasdeDevolucao_s write fNotasdeDevolucao_s;



  end;

var
  dtmLivroApuracaoPisCofins: TdtmLivroApuracaoPisCofins;

implementation

{$R *.dfm}

{ TdtmLivroApuracaoPisCofins }

procedure TdtmLivroApuracaoPisCofins.AbreTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Abre(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Abre(ctPesquisaGrupoFilial);
  end;
end;

constructor TdtmLivroApuracaoPisCofins.Create(AOwner: TComponent);
begin
  inherited;
  qry_CFOP_PisCofins.macrobyname('WhereTemp').asString := 'where false';
  qryConsultaFiliais.Tag:= ctPesquisaFilial;
  qryProcuraFiliais.Params[0].AsInteger := FilialBase;
  qryProcuraFiliais.Tag:= ctTabelas;
end;

function TdtmLivroApuracaoPisCofins.ExisteFilial(Campo,
 Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

procedure TdtmLivroApuracaoPisCofins.FechaTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Fecha(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Fecha(ctPesquisaGrupoFilial);
  end;
end;

function TdtmLivroApuracaoPisCofins.GetCodigoFilial: Integer;
begin
  Result := qryConsultaFiliaiscodigo.AsInteger;
end;

function TdtmLivroApuracaoPisCofins.GetCodigoGrupoFilial: Integer;
begin
end;

function TdtmLivroApuracaoPisCofins.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmLivroApuracaoPisCofins.GetConsultarGrupoFilial: TtecQuery;
begin
end;

procedure TdtmLivroApuracaoPisCofins.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  PV: TfrxComponent;

begin
  if LivrodeApuracaoPisCofins or resumo then
  begin

    AtribuirParametrosBaseRelatorio(qryprocurafiliaiscodigo.asstring);
    frVariables['Razao']  := qryProcuraFiliaisrazao.AsString;
    frVariables['CNPJ']   := FormatarCPFouCGC(qryProcuraFiliaiscnpj.AsString);
    frVariables['InscricaoEstadual']:= qryProcuraFiliaisinscricaoestadual.AsString;
    frVariables['Junta']:= qryProcuraFiliaisjunta.AsString;
    frVariables['JuntaData']:= qryProcuraFiliaisjuntadata.AsString;
    frVariables['Titulo']  := 'LIVRO DE APURA√á√ÉO DO PIS/COFINS';

    frVariables['SubTitulo']:=ANSIUpperCase(NomeMeses[strtoint(copy(FMesAno,1,2))]+' de '+copy(FMesAno,4,4));

    frVariables['Livro'] := FParametroLivro;
    frVariables['Pagina']:=FParametroPagina;
    frVariables['Maximo']:=FParametroMaximo;
    frVariables['Outras']:=FParametroCabecalho;

    frmPreview := TfrmPreviewPadrao.create(self);
    frmpreview.frPreviewPadrao.OnExportLinear := ExportarDadosPISCOFINS;
    frmPreview.cmbZoom.ItemIndex := 3; //125
    try
     Relatorio := frmPreview.frCompositeReport;
     frmPreview.frCompositeReport.Reports.Clear;
     frmPreview.frCompositeReport.DoublePass:= True;

     with frmPreview do
     begin
        if LivrodeApuracaoPisCofins and resumo then
        begin
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofins_Debitos);
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofinsResumo_Debitos);
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofins_Creditos);
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofinsResumo_Creditos);
        end
        else
        if LivrodeApuracaoPisCofins then
        begin
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofins_Debitos);
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofins_Creditos);
        end
        else
        if resumo then
        begin
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofinsResumo_Debitos);
          frCompositeReport.Reports.Add(frpLivroApuracaoPISCofinsResumo_Creditos);
        end;
     end;

     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.PrepareReport;
     Relatorio.ShowReport;

     frmPreview.ShowModal;

    finally
     frmPreview.Free;
     AtribuirParametrosBaseRelatorio;
    end;
  end
  else
  begin

    if FileExists(LogotipoFilialBase) then
    begin
      PV := frx_CFOP_PisCofins.FindObject('fpvLogo');
      if (PV is TfrxPictureView) then
        TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
    end;

    if FileExists(LogotipoFilialBase) then
    begin
      PV := frx_CFOP_PisCofins.FindObject('fpvLogo2');
      if (PV is TfrxPictureView) then
        TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
    end;


//    frx_CFOP_PisCofins.DesignReport;
    frx_CFOP_PisCofins.showreport(true);
  end;

end;

procedure TdtmLivroApuracaoPisCofins.Selecionar(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesFILIAIS      : RefazConsulta(qryProcuraFiliais,[0],[CodigoFilial]);
  end;
end;

procedure TdtmLivroApuracaoPisCofins.SetMesAno(const Value: String);
begin
  FMesAno := Value;
  qryLivroApuracaoPISCofins_Debitos.ParamByName('MesAno').AsString := Value;
  qryLivroApuracaoPISCofins_Creditos.ParamByName('MesAno').AsString := Value;

  qry_CFOP_PisCofins.ParamByName('MesAno').AsString := Value;


end;

procedure TdtmLivroApuracaoPisCofins.SetParametroFilial(const Value: String);
begin
  FParametroFilial := value;
  qryLivroApuracaoPISCofins_Debitos.paramByName('FilialConsolidadora').AsString := Value;
  qryLivroApuracaoPISCofins_Creditos.paramByName('FilialConsolidadora').AsString := Value;

  qry_CFOP_PisCofins.paramByName('FilialConsolidadora').AsString := Value;
end;

procedure TdtmLivroApuracaoPisCofins.frpLivroApuracaoPisCofinsTermosGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  Parvalue := ParametroRelatorio(ParName);
end;

function TdtmLivroApuracaoPisCofins.AbrirConsultaRelatorios: Boolean;
begin
  result := true;
  if LivrodeApuracaoPisCofins or resumo then
  begin

    qryLivroApuracaoPISCofins_Creditos.ParamByName('NotasdeCompra').asBoolean := NotasdeCompra;
    qryLivroApuracaoPISCofins_Creditos.ParamByName('NotasdeDevolucao_e').asBoolean := NotasdeDevolucao_e;
    qryLivroApuracaoPISCofins_Creditos.ParamByName('NotasdeTransferencia_e').asBoolean := NotasdeTransferencia_e;

    RefazConsulta(qryLivroApuracaoPISCofins_Creditos, [], []);

    qryLivroApuracaoPISCofins_Debitos.ParamByName('NotasdeVenda').asBoolean := NotasdeVenda;
    qryLivroApuracaoPISCofins_Debitos.ParamByName('NotasdeDevolucao_s').asBoolean := NotasdeDevolucao_s;
    qryLivroApuracaoPISCofins_Debitos.ParamByName('NotasdeTransferencia_s').asBoolean := NotasdeTransferencia_s;

    RefazConsulta(qryLivroApuracaoPISCofins_Debitos, [], []);


    result := not qryLivroApuracaoPISCofins_Debitos.isempty or
              not qryLivroApuracaoPISCofins_Creditos.isempty;
  end
  else
  begin

    qry_CFOP_PisCofins.ParamByName('NotasdeCompra').asBoolean := NotasdeCompra;
    qry_CFOP_PisCofins.ParamByName('NotasdeDevolucao_e').asBoolean := NotasdeDevolucao_e;
    qry_CFOP_PisCofins.ParamByName('NotasdeTransferencia_e').asBoolean := NotasdeTransferencia_e;

    qry_CFOP_PisCofins.ParamByName('NotasdeVenda').asBoolean := NotasdeVenda;
    qry_CFOP_PisCofins.ParamByName('NotasdeDevolucao_s').asBoolean := NotasdeDevolucao_s;
    qry_CFOP_PisCofins.ParamByName('NotasdeTransferencia_s').asBoolean := NotasdeTransferencia_s;

    qry_CFOP_PisCofins.macrobyname('WhereTemp').asString := 'where true';

    DSP_CDS_CFOP_PisCofins_cst.dataset := qry_CFOP_PisCofins;
    CDS_CFOP_PisCofins_cst.providername := 'DSP_CDS_CFOP_PisCofins_cst';


    qry_CFOP_PisCofins.close;
    qry_CFOP_PisCofins.open;

    CDS_CFOP_PisCofins_cst.close;
    CDS_CFOP_PisCofins_cst.open;
    CDS_CFOP_PisCofins_cst.aggregatesactive := true;

  end;

end;

destructor TdtmLivroApuracaoPisCofins.Destroy;
begin
  inherited;
end;

procedure TdtmLivroApuracaoPisCofins.frpLivroApuracaoPISCofins_DebitosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroApuracaoPISCofins_Debitos, view);
end;

procedure TdtmLivroApuracaoPisCofins.frpLivroApuracaoPISCofinsResumo_CreditosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroApuracaoPISCofins_Creditos, view);
end;

procedure TdtmLivroApuracaoPisCofins.ExportarDadosPISCOFINS;
begin
{
  LivroApuracaoPISCofins_Debitos.ExportDataset;
  LivroApuracaoPISCofins_Creditos.ExportDataset;
  }
end;

procedure TdtmLivroApuracaoPisCofins.CDS_CFOP_PisCofins_cstCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qry_CFOP_PisCofins.active then
  begin
      CDS_CFOP_PisCofins_cstTotalValorTotal_Unico_.asVariant := CDS_CFOP_PisCofins_cstTotalValorTotal_Unico.asVariant;
      CDS_CFOP_PisCofins_cstTotalPisBaseCalculo_.asVariant := CDS_CFOP_PisCofins_cstTotalPisBaseCalculo.asVariant;
      CDS_CFOP_PisCofins_cstTotalPisValor_.asVariant := CDS_CFOP_PisCofins_cstTotalPisValor.asVariant;
      CDS_CFOP_PisCofins_cstTotalCofinsBaseCalculo_.asVariant := CDS_CFOP_PisCofins_cstTotalCofinsBaseCalculo.asVariant;
      CDS_CFOP_PisCofins_cstTotalCofinsValor_.asVariant := CDS_CFOP_PisCofins_cstTotalCofinsValor.asVariant;

      CDS_CFOP_PisCofins_cstTotalValorTotalProdutos_.asVariant := CDS_CFOP_PisCofins_cstTotalValorTotalProdutos.asVariant;
  end;  

end;

procedure TdtmLivroApuracaoPisCofins.qry_CFOP_PisCofinsBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qry_CFOP_PisCofins.parambyname('SelecaoPelaDatadeEmissao').asBoolean :=
  TCheckBox(self.owner.FindComponent('ckbSelecaoPelaDatadeEmissao')).checked;
end;

procedure TdtmLivroApuracaoPisCofins.frx_CFOP_PisCofinsGetValue(
  const VarName: String; var Value: Variant);
begin
  inherited;
  if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio)
  else if VarName = 'RAZAOFILIALBASE' then
    Value := RazaoFilialBase
  else if VarName = 'ENDERECO_BAIRRO' then
    Value :=  RuaFilialBase+ ' - '+BairroFilialBase
  else if VarName = 'CEP_CIDADE_UF' then
    Value :=  FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase
  else if VarName = 'TITULO' then
    Value := 'RELAT”RIO DE CONFER NCIA - PIS/COFINS - '+ MesAno

end;

procedure TdtmLivroApuracaoPisCofins.qryLivroApuracaoPISCofins_CreditosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryLivroApuracaoPISCofins_Creditos.parambyname('SelecaoPelaDatadeEmissao').asBoolean :=
  TCheckBox(self.owner.FindComponent('ckbSelecaoPelaDatadeEmissao')).checked;

end;

procedure TdtmLivroApuracaoPisCofins.qryLivroApuracaoPISCofins_DebitosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryLivroApuracaoPISCofins_Debitos.parambyname('SelecaoPelaDatadeEmissao').asBoolean :=
  TCheckBox(self.owner.FindComponent('ckbSelecaoPelaDatadeEmissao')).checked;

end;

end.
