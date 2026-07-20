unit dmlivroapuracaoicms;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, DateUtils,
  cpquery, FR_Class, ctconstantes, FR_DSet, FR_DBSet, cptable, clparametrossistema,
  fmpreviewpadrao, dmimprimetermos, dmgerardimeemarquivo, biblio, ZTransact;

type
  TdtmLivroApuracaoIcms = class(TdtmBasico)
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
    qryResumoSinteticoEntradas: TtecQuery;
    qryResumoSinteticoEntradasfilial: TIntegerField;
    qryResumoSinteticoEntradasnomefilial: TStringField;
    qryResumoSinteticoEntradasvalornota: TFloatField;
    qryResumoSinteticoEntradasbase: TFloatField;
    qryResumoSinteticoEntradasvalor: TFloatField;
    qryResumoSinteticoEntradasisentas: TFloatField;
    qryResumoSinteticoEntradasoutras: TFloatField;
    qryResumoSinteticoEntradastitulo: TIntegerField;
    qryResumoSinteticoEntradasdescricaotitulo: TStringField;
    qryResumoSinteticoEntradassubtitulo: TIntegerField;
    qryResumoSinteticoEntradasdescricaosubtitulo: TStringField;
    qryResumoSinteticoEntradascodigofiscal: TIntegerField;
    qryResumoSinteticoEntradasdescricao: TStringField;
    fdsResumoSinteticoEntradas: TfrDBDataSet;
    frpResumoSinteticoEntradas: TfrReport;
    qryResumoSinteticoSaidas: TtecQuery;
    frpResumoSinteticoSaidasApuracao: TfrReport;
    qryQuadrosGIA: TtecQuery;
    fdsResumoSinteticoSaidas: TfrDBDataSet;
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
    frpQuadrosGIA: TfrReport;
    fdsQuadrosGIA: TfrDBDataSet;
    qryQuadrosGIAgrupofilial: TIntegerField;
    qryQuadrosGIAnomegrupofilial: TStringField;
    qryQuadrosGIAfilial: TIntegerField;
    qryQuadrosGIAnomefilial: TStringField;
    qryQuadrosGIAperiodo: TStringField;
    qryQuadrosGIAdebitopelassaidas: TFloatField;
    qryQuadrosGIAdebdiferencialaliquota: TFloatField;
    qryQuadrosGIAdebtransferencia: TFloatField;
    qryQuadrosGIAdebestornocredito: TFloatField;
    qryQuadrosGIAdebestornoativoimobilizado: TFloatField;
    qryQuadrosGIAoutrosdebitos: TFloatField;
    qryQuadrosGIAdebapuracaoconsolidada: TFloatField;
    qryQuadrosGIAsubtotaldebitoanterior: TFloatField;
    qryQuadrosGIAsubtotalcreditoanterior: TFloatField;
    qryQuadrosGIAcreditopelasentradas: TFloatField;
    qryQuadrosGIAcreddifaliquotaativoimobil: TFloatField;
    qryQuadrosGIAcreddifaliquotamaterialconsumo: TFloatField;
    qryQuadrosGIAcredtransferencia: TFloatField;
    qryQuadrosGIAcredpresumidos: TFloatField;
    qryQuadrosGIAcredincetivosfiscais: TFloatField;
    qryQuadrosGIAcredpagtoocasiaofatogerador: TFloatField;
    qryQuadrosGIAoutroscreditos: TFloatField;
    qryQuadrosGIAcredapuracaoconsolidada: TFloatField;
    qryQuadrosGIAsaldoperiodoanterior: TCurrencyField;
    qryQuadrosGIAsubtotaldebitos: TCurrencyField;
    qryQuadrosGIAsubtotalcreditos: TCurrencyField;
    qryQuadrosGIAsaldocredorparaperiodoseguinte: TCurrencyField;
    qryQuadrosGIAimpostorecolher: TCurrencyField;
    qryQuadrosGIAtotaldebitos: TCurrencyField;
    qryQuadrosGIAtotalcreditos: TCurrencyField;
    qryQuadrosGIAObservacao: TtecQuery;
    qryQuadrosGIAObservacaoobservacao: TStringField;
    fdsQuadrosGIAObservacao: TfrDBDataSet;
    qryQuadrosGIAGuias: TtecQuery;
    fdsQuadrosGIAGuias: TfrDBDataSet;
    qryQuadrosGIAGuiasnumeroguia1: TStringField;
    qryQuadrosGIAGuiasdataguia1: TDateField;
    qryQuadrosGIAGuiasvalorguia1: TFloatField;
    qryQuadrosGIAGuiasorgaoguia1: TStringField;
    qryQuadrosGIAGuiasnumeroguia2: TStringField;
    qryQuadrosGIAGuiasdataguia2: TDateField;
    qryQuadrosGIAGuiasvalorguia2: TFloatField;
    qryQuadrosGIAGuiasorgaoguia2: TStringField;
    qryQuadrosGIAGuiasnumeroguia3: TStringField;
    qryQuadrosGIAGuiasdataguia3: TDateField;
    qryQuadrosGIAGuiasvalorguia3: TFloatField;
    qryQuadrosGIAGuiasorgaoguia3: TStringField;
    qryQuadrosGIAGuiasnumeroguia4: TStringField;
    qryQuadrosGIAGuiasdataguia4: TDateField;
    qryQuadrosGIAGuiasvalorguia4: TFloatField;
    qryQuadrosGIAGuiasorgaoguia4: TStringField;
    qryProcuraFiliaisjunta: TStringField;
    qryProcuraFiliaisjuntadata: TDateField;
    frpQuadrosDime: TfrReport;
    fdsQuadrosDime: TfrDBDataSet;
    fdsRecolhimentoICMS: TfrDBDataSet;
    procedure qryQuadrosGIACalcFields(DataSet: TDataSet);
    procedure frpLivroApuracaoICMSTermosGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpResumoSinteticoEntradasBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpResumoSinteticoSaidasApuracaoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpQuadrosDimeBeforePrint(Memo: TStringList; View: TfrView);
  Protected
    ImpressaoTermos: TdtmImprimeTermos;
  private
    FResumo: boolean;
    FLivrodeApuracaoICMS: boolean;
    FParametroMaximo: Integer;
    FParametroPagina: Integer;
    FParametroLivro: Integer;
    FParametrosRelatorio: Integer;
    FParametroCabecalho: String;
    FParametroFilial: String;
    FMesAno: String;
    FDataInicial: String;
    FDataFinal: String;
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
     function ExisteGrupoFilial(Campo, Codigo: string): Boolean;
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
     property DataInicial: String read FDataInicial write FDataInicial;
     property DataFinal: String read FDataFinal write FDataFinal;
     property ParametroLivro: Integer read FParametroLivro write FParametroLivro;
     property ParametroPagina: Integer read FParametroPagina write FParametroPagina;
     property ParametroMaximo: Integer read FParametroMaximo write FParametroMaximo;
     property ParametrosRelatorio: Integer read FParametrosRelatorio write FParametrosRelatorio;
     property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
     property LivrodeApuracaoICMS: boolean read FLivrodeApuracaoICMS write FLivrodeApuracaoICMS;
     property Resumo: boolean read FResumo write FResumo ;
     function AbrirConsultaRelatorios: Boolean;
  end;

var
  dtmLivroApuracaoIcms: TdtmLivroApuracaoIcms;

implementation

{$R *.dfm}

{ TdtmLivroApuracaoIcms }

procedure TdtmLivroApuracaoIcms.AbreTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Abre(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Abre(ctPesquisaGrupoFilial);
  end;
end;

constructor TdtmLivroApuracaoIcms.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaFiliais.Tag:= ctPesquisaFilial;
  qryConsultaGruposFiliais.Tag:= ctPesquisaGrupoFilial;
  qryProcuraFiliais.Params[0].AsInteger := FilialBase;
  qryProcuraFiliais.Tag:= ctTabelas;
  qryProcuraGruposFiliais.Tag:= ctTabelas;
end;

function TdtmLivroApuracaoIcms.ExisteFilial(Campo,
 Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmLivroApuracaoIcms.ExisteGrupoFilial(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGruposFiliais, Campo, Codigo);
end;

procedure TdtmLivroApuracaoIcms.FechaTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Fecha(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Fecha(ctPesquisaGrupoFilial);
  end;
end;

function TdtmLivroApuracaoIcms.GetCodigoFilial: Integer;
begin
  Result := qryConsultaFiliaiscodigo.AsInteger;
end;

function TdtmLivroApuracaoIcms.GetCodigoGrupoFilial: Integer;
begin
  Result := qryConsultaGruposFiliaiscodigo.AsInteger;
end;

function TdtmLivroApuracaoIcms.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmLivroApuracaoIcms.GetConsultarGrupoFilial: TtecQuery;
begin
  Result:= qryConsultaGruposFiliais;
end;

procedure TdtmLivroApuracaoIcms.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio(qryprocurafiliaiscodigo.asstring);
  frVariables['Razao']  := qryProcuraFiliaisrazao.AsString;
  frVariables['CNPJ']   := FormatarCPFouCGC(qryProcuraFiliaiscnpj.AsString);
  frVariables['InscricaoEstadual']:= qryProcuraFiliaisinscricaoestadual.AsString;
  frVariables['Junta']:= qryProcuraFiliaisjunta.AsString;
  frVariables['JuntaData']:= qryProcuraFiliaisjuntadata.AsString;
  frVariables['DataExtensoInicial']:= DataExtenso(strtodatetime(FDataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodatetime(FDataFinal));
  frVariables['DataInicial']:= FDataInicial;
  frVariables['DataFinal']:= FDataFinal;
  frVariables['Titulo']  := 'LIVRO DE APURAÇÃO DO ICMS';
  frVariables['SubTitulo']:=ANSIUpperCase(NomeMeses[strtoint(copy(FMesAno,1,2))]+' de '+copy(FMesAno,4,4));
  frVariables['Livro'] := FParametroLivro;
  frVariables['Pagina']:=FParametroPagina;
  frVariables['Maximo']:=FParametroMaximo;
  frVariables['Outras']:=FParametroCabecalho;

//  frpResumoSinteticoEntradas.DesignReport;
//  frpResumoSinteticoSaidas.DesignReport;
//  frpQuadrosDime.DesignReport;

  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   with frmPreview do
   begin
    case FParametrosRelatorio of
     0: begin
         if FLivrodeApuracaoICMS then
         begin
          frCompositeReport.Reports.Add(frpResumoSinteticoEntradas);
          frCompositeReport.Reports.Add(frpResumoSinteticoSaidasApuracao);
         end;
         if FResumo then
         begin
           if not dtmGerarDIMEEmArquivo.TabelaQuadrosDime.IsEmpty then
             frCompositeReport.Reports.Add(frpQuadrosDime);
         end;
        end;
    1:  begin
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

procedure TdtmLivroApuracaoIcms.Selecionar(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesFILIAIS      : RefazConsulta(qryProcuraFiliais,[0],[CodigoFilial]);
    pesGRUPOSFILIAIS: RefazConsulta(qryProcuraGruposFiliais,[0],[CodigoGrupoFilial]);
  end;
end;



procedure TdtmLivroApuracaoIcms.SetMesAno(const Value: String);
begin
  FMesAno := Value;
  qryResumoSinteticoEntradas.ParamByName('MesAno').AsString:=Value;
  qryResumoSinteticoSaidas.ParamByName('MesAno').AsString:=Value;
end;

procedure TdtmLivroApuracaoIcms.SetParametroFilial(const Value: String);
var
 SQLEntradas, SQLSaidas: String;
begin
  FParametroFilial := value;
  SQLEntradas:='';
  SQLSaidas:='';
  if Value<>'' then
  begin
   SQLEntradas:=' and (np.filial = ' + Value + ')';
   SQLSaidas:=' and (df.filialemissao = ' + Value + ')';
   FParametroCabecalho:=FParametroCabecalho+' Filial: '+Value;
  end;
  qryResumoSinteticoEntradas.MacroByName('WhereFiliais').AsString := SQLEntradas;
  qryResumoSinteticoSaidas.ParamByName('filialemissao').AsString := fParametroFilial;
end;

procedure TdtmLivroApuracaoIcms.qryQuadrosGIACalcFields(DataSet: TDataSet);
var
  ImpostoRecolher, SaldoCredor: Real;
begin
  inherited;
  qryQuadrosGIAsubtotaldebitos.AsFloat  := qryQuadrosGIAdebitopelassaidas.AsFloat +
                                           qryQuadrosGIAdebdiferencialaliquota.AsFloat +
                                           qryQuadrosGIAdebtransferencia.AsFloat +
                                           qryQuadrosGIAdebestornocredito.AsFloat +
                                           qryQuadrosGIAdebestornoativoimobilizado.AsFloat +
                                           qryQuadrosGIAoutrosdebitos.AsFloat;

  if qryQuadrosGIAsubtotalcreditoanterior.Value >
     qryQuadrosGIAsubtotaldebitoanterior.Value then
    qryQuadrosGIAsaldoperiodoanterior.AsFloat :=
     qryQuadrosGIAsubtotalcreditoanterior.Value -
     qryQuadrosGIAsubtotaldebitoanterior.Value
  else
    qryQuadrosGIAsaldoperiodoanterior.AsFloat := 0;

  qryQuadrosGIAsubtotalcreditos.AsFloat := qryQuadrosGIAsaldoperiodoanterior.AsFloat +
                                           qryQuadrosGIAcreditopelasentradas.AsFloat +
                                           qryQuadrosGIAcreddifaliquotaativoimobil.AsFloat +
                                           qryQuadrosGIAcreddifaliquotamaterialconsumo.AsFloat +
                                           qryQuadrosGIAcredtransferencia.AsFloat +
                                           qryQuadrosGIAcredpresumidos.AsFloat +
                                           qryQuadrosGIAcredincetivosfiscais.AsFloat +
                                           qryQuadrosGIAoutroscreditos.AsFloat +
                                           qryQuadrosGIAcredpagtoocasiaofatogerador.AsFloat;

  SaldoCredor     := qryQuadrosGIAsubtotaldebitos.AsFloat + qryQuadrosGIAdebapuracaoconsolidada.AsFloat;
  ImpostoRecolher := qryQuadrosGIAsubtotalcreditos.AsFloat + qryQuadrosGIAcredapuracaoconsolidada.AsFloat;
  if ImpostoRecolher > SaldoCredor then begin
    qryQuadrosGIAsaldocredorparaperiodoseguinte.AsFloat := ImpostoRecolher - SaldoCredor;
    qryQuadrosGIAimpostorecolher.AsFloat               := 0;
  end else begin
    qryQuadrosGIAsaldocredorparaperiodoseguinte.AsFloat := 0;
    qryQuadrosGIAimpostorecolher.AsFloat               := SaldoCredor - ImpostoRecolher;
  end;
  qryQuadrosGIAtotaldebitos.AsFloat     := qryQuadrosGIAsubtotaldebitos.AsFloat +
                                           qryQuadrosGIAdebapuracaoconsolidada.AsFloat +
                                           qryQuadrosGIAsaldocredorparaperiodoseguinte.AsFloat;
  qryQuadrosGIAtotalcreditos.AsFloat    := qryQuadrosGIAsubtotalcreditos.AsFloat +
                                           qryQuadrosGIAcredapuracaoconsolidada.AsFloat +
                                           qryQuadrosGIAimpostorecolher.AsFloat;


end;

procedure TdtmLivroApuracaoIcms.frpLivroApuracaoICMSTermosGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  Parvalue := ParametroRelatorio(ParName);
end;

function TdtmLivroApuracaoIcms.AbrirConsultaRelatorios: Boolean;
begin
   result := true;
   if (ParametrosRelatorio=0) then
   begin
    if LivrodeApuracaoICMS    then
    begin
     RefazConsulta(qryResumoSinteticoEntradas, [], []);
     RefazConsulta(qryResumoSinteticoSaidas, [], []);
    end;
    if Resumo then
    begin
      if not (Assigned(dtmGerarDIMEEmArquivo)) then
        dtmGerarDIMEEmArquivo := TdtmGerarDIMEEmArquivo.Create(Self);
      with dtmGerarDIMEEmArquivo do
      begin
        MesInicial := MesAno;
        MesFinal   := MesAno;
        Filiais := ParametroFilial;
        if not AbrirQuadrosDime then
          MensagemAviso(ctRESUMONAOSERAIMPRESSO+#10#13+format(ctNAOEXISTEDIME,[MesAno, ParametroFilial]))
      end;
    end;
   end;

   {
   if LivrodeApuracaoICMS then
     result :=   (not (qryResumoSinteticoEntradas.IsEmpty and
                   qryResumoSinteticoSaidas.IsEmpty)) or
                  (ParametroRelatorio=1)
   else
     if Resumo then
       result := result or (ParametroRelatorio=1);
   }
end;

destructor TdtmLivroApuracaoIcms.Destroy;
begin
  if Assigned(dtmGerarDIMEEmArquivo) then
  begin
   dtmGerarDIMEEmArquivo.Free;
   dtmGerarDIMEEmArquivo := nil;
  end;
  inherited;
end;

procedure TdtmLivroApuracaoIcms.frpResumoSinteticoEntradasBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpResumoSinteticoEntradas, view);
end;

procedure TdtmLivroApuracaoIcms.frpResumoSinteticoSaidasApuracaoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpResumoSinteticoSaidasApuracao, view);
end;

procedure TdtmLivroApuracaoIcms.frpQuadrosDimeBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpQuadrosDime, view);
end;

end.