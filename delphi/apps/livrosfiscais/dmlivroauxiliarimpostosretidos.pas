unit dmlivroauxiliarimpostosretidos;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, FR_DSet, FR_DBSet, FR_Class, ctconstantes, Graphics, biblio,
  fmpreviewpadrao, FR_Desgn, clparametrossistema, dmimprimetermos,CheckLst,
  ZTransact;

type
  TdtmLivroAuxiliarImpostosRetidos = class(TDtmBasico)
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
    qryProcuraFiliaisjunta: TStringField;
    qryProcuraFiliaisjuntadata: TDateField;
    qryAuxiliarImpostosRetidos: TtecQuery;
    dsrAuxiliarImpostosRetidos: TtecDataSource;
    fdsLivroAuxiliarImpostosRetidos: TfrDBDataSet;
    frpLivroAuxliarImpostosRetidos: TfrReport;
    qryAuxiliarImpostosRetidosserie: TStringField;
    qryAuxiliarImpostosRetidosnumero: TIntegerField;
    qryAuxiliarImpostosRetidosdatacontabil: TDateField;
    qryAuxiliarImpostosRetidoscliente: TIntegerField;
    qryAuxiliarImpostosRetidosnome: TStringField;
    qryAuxiliarImpostosRetidosdataemissao: TDateField;
    qryAuxiliarImpostosRetidoscofins: TFloatField;
    qryAuxiliarImpostosRetidoscsll: TFloatField;
    qryAuxiliarImpostosRetidosinss: TFloatField;
    qryAuxiliarImpostosRetidosirrf: TFloatField;
    qryAuxiliarImpostosRetidosiss: TFloatField;
    qryAuxiliarImpostosRetidospis: TFloatField;
    qryAuxiliarImpostosRetidosnvenctos: TLargeintField;
    qryAuxiliarImpostosRetidosvalortotal: TFloatField;
    qryAuxiliarImpostosRetidosposicao: TIntegerField;
    qryAuxiliarImpostosRetidostipo: TStringField;
    qryAuxiliarImpostosRetidosDescricaoPosicao: TStringField;
    procedure frpLivroAuxliarImpostosRetidosBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroApuracaoISSGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroAuxliarImpostosRetidosGetValue(const ParName: String;
      var ParValue: Variant);
    procedure qryAuxiliarImpostosRetidosCalcFields(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  Protected
    ImpressaoTermos: TdtmImprimeTermos;
  private
    FCodigosEmitentes: boolean;
    FResumoDiario: boolean;
    FParametroPagina: Integer;
    FParametroMaximo: Integer;
    FParametroLivro: Integer;
    FParametroRelatorio: Integer;
    FDataFinalPeriodo: String;
    FDiaInicial: String;
    FParametroCabecalho: String;
    FCuponsPorMapa: Boolean;
    FSeries: String;
    FParametroFilial: String;
    FDataInicial: String;
    FDataFinal: String;
    function GetCodigoFilial: Integer;
    function GetConsultarFilial: TtecQuery;
    procedure SetDataFinalPeriodo(const Value: String);
    procedure SetParametroFilial(const Value: String);
    procedure SetParametroGrupoFilial(const Value: String);
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     function ExisteFilial(Campo, Codigo: string): Boolean;
     procedure AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure Selecionar(Pesquisa: TtecPesquisa);
     procedure ImprimirRelatorio;
     property ConsultarFilial: TtecQuery read GetConsultarFilial;
     property CodigoFilial: Integer read GetCodigoFilial;
     property ParametroFilial: String read FParametroFilial write SetParametroFilial;
     property ParametroGrupoFilial: String write SetParametroGrupoFilial;
     property DiaInicial: String read FDiaInicial write FDiaInicial;
     property DataFinalPeriodo: String read FDataFinalPeriodo write SetDataFinalPeriodo;

     property DataInicial: String read FDataInicial write FDataInicial;
     property DataFinal: String read FDataFinal write FDataFinal;

     property ParametroLivro: Integer read FParametroLivro write FParametroLivro;
     property ParametroPagina: Integer read FParametroPagina write FParametroPagina;
     property ParametroMaximo: Integer read FParametroMaximo write FParametroMaximo;
     property ParametroRelatorio: Integer read FParametroRelatorio write FParametroRelatorio;
     property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
     property CodigosEmitentes: boolean read FCodigosEmitentes write FCodigosEmitentes;
     property ResumoDiario: boolean read FResumoDiario write FResumoDiario;
     property CuponsPorMapa: Boolean read FCuponsPorMapa write FCuponsPorMapa;
     function AbrirConsultasRelatorio: Boolean;
  end;

var
  dtmLivroAuxiliarImpostosRetidos: TdtmLivroAuxiliarImpostosRetidos;
  FListaSeries  : TLista;

implementation
Const
 WhereFiliais  = 38;
 WhereFiliaisECF = 81;

{$R *.dfm}

{ TdtmLivroAuxiliarImpostosRetidos }

procedure TdtmLivroAuxiliarImpostosRetidos.AbreTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Abre(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Abre(ctPesquisaGrupoFilial);
  end;
end;

constructor TdtmLivroAuxiliarImpostosRetidos.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaFiliais.Tag:= ctPesquisaFilial;
  qryProcuraFiliais.Tag:= ctTabelas;
  qryProcuraFiliais.Params[0].AsInteger := FilialBase;
end;


function TdtmLivroAuxiliarImpostosRetidos.ExisteFilial(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;


procedure TdtmLivroAuxiliarImpostosRetidos.FechaTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Fecha(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Fecha(ctPesquisaGrupoFilial);
  end;
end;

function TdtmLivroAuxiliarImpostosRetidos.GetCodigoFilial: Integer;
begin
  Result := qryConsultaFiliaiscodigo.AsInteger;
end;


function TdtmLivroAuxiliarImpostosRetidos.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;


procedure TdtmLivroAuxiliarImpostosRetidos.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio(qryprocurafiliaiscodigo.asstring);
  frVariables['DataExtensoInicial']:= DataExtenso(strtodate(FDataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodate(FDataFinal));
  frVariables['DataInicial']:= FDataInicial;
  frVariables['DataFinal']:= FDataFinal;

  frVariables['Titulo']  := 'LIVRO AUXILIAR DE IMPOSTOS RETIDOS';
  frVariables['Livro'] := FParametroLivro;
  frVariables['Pagina']:=FParametroPagina;
  frVariables['Maximo']:=FParametroMaximo;
  frVariables['Outras']:=FParametroCabecalho;

//  frpLivroAuxliarImpostosRetidos.DesignReport;

  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   with frmPreview do
   begin
    case FParametroRelatorio of
    0: frCompositeReport.Reports.Add(frpLivroAuxliarImpostosRetidos);
    1: begin
        if not Assigned(ImpressaoTermos) then
          ImpressaoTermos := TdtmImprimeTermos.Create(Self);
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


procedure TdtmLivroAuxiliarImpostosRetidos.Selecionar(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesFILIAIS      : RefazConsulta(qryProcuraFiliais,[0],[CodigoFilial]);
  end;
end;



procedure TdtmLivroAuxiliarImpostosRetidos.SetDataFinalPeriodo(const Value: String);
begin
  FDataFinalPeriodo := Value;
  qryAuxiliarImpostosRetidos.ParamByName('DataInicial').AsString:=FDiaInicial+formatdatetime('/mm/yyyy',strtodate(FDataFinalPeriodo));
  qryAuxiliarImpostosRetidos.ParamByName('DataFinal').AsString:=FDataFinalPeriodo;
  FParametroCabecalho:='PERÍODO DE '+FDiaInicial+' A '+FDataFinalPeriodo;
end;

procedure TdtmLivroAuxiliarImpostosRetidos.SetParametroFilial(
  const Value: String);
var
 SQL: String;
begin
 FParametroFilial := Value;
 if Value<>'' then
   SQL:=' and (df.filialemissao = ' + Value + ')'
 else
   SQL:='';
 qryAuxiliarImpostosRetidos.MacroByName('FiltroFiliais').asstring := SQL;
end;

procedure TdtmLivroAuxiliarImpostosRetidos.SetParametroGrupoFilial(
  const Value: String);
var
SQL : String;
begin
 SQL:='';
 if (Value <> '') then
 begin
  SQL:=' and (df.filialemissao in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
  qryAuxiliarImpostosRetidos.MacroByName('FiltroFiliais').AsString := SQL;
 end;
end;


function TdtmLivroAuxiliarImpostosRetidos.AbrirConsultasRelatorio: Boolean;
begin
  result := true;
  refazconsulta(qryAuxiliarImpostosRetidos,[],[]);
//  result := not qryAuxiliarImpostosRetidos.IsEmpty;
end;

procedure TdtmLivroAuxiliarImpostosRetidos.frpLivroAuxliarImpostosRetidosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroAuxliarImpostosRetidos, View);
end;

procedure TdtmLivroAuxiliarImpostosRetidos.frpLivroApuracaoISSGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if Parname = 'FOLHA_OU_PAGINA' then
   case ParSistema.LivrosFiscaisFolhaouPagina of
    0: ParValue := ctFOLHA;
    1: ParValue := ctPAGINA;
   end;
end;

procedure TdtmLivroAuxiliarImpostosRetidos.frpLivroAuxliarImpostosRetidosGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if Parname = 'FOLHA_OU_PAGINA' then
   case ParSistema.LivrosFiscaisFolhaouPagina of
    0: ParValue := ctFOLHA;
    1: ParValue := ctPAGINA;
   end;
end;

procedure TdtmLivroAuxiliarImpostosRetidos.qryAuxiliarImpostosRetidosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryAuxiliarImpostosRetidosposicao.AsInteger = 1 then
    qryAuxiliarImpostosRetidosDescricaoPosicao.AsString :=
    'RETENÇÕES POR REGIME DE COMPETÊNCIA'
  else
    qryAuxiliarImpostosRetidosDescricaoPosicao.AsString :=
    'RETENÇÕES POR REGIME DE CAIXA';
end;

procedure TdtmLivroAuxiliarImpostosRetidos.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\auxiliarimpostosretidos.sql') then
    Listar.loadfromfile('c:\auxiliarimpostosretidos.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\auxiliarimpostosretidos.sql');
  listar.free;
end;

end.
