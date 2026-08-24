unit dmdre;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  FR_Class, FR_DSet, FR_DBSet, ctconstantes, biblio, cpdatasource,
  clparametrossistema, fmpreviewpadrao, FR_Desgn, ZTransact, frxClass,
  frxDBSet, frxExportXML, frxExportXLS, frxExportODF, frxExportTXT,
  frxExportMail, frxExportCSV, frxExportText, frxExportImage, frxExportRTF,
  frxExportHTML, frxExportPDF;

type
  Tdtmdre = class(TdtmBasico)
    frxDBReceita_Operacional_Bruta: TfrxDBDataset;
    frxDRE: TfrxReport;
    qryCustoMercadoria: TtecQuery;
    frxDBCustoMercadoria: TfrxDBDataset;
    qryDespesasOperacionais: TtecQuery;
    frxDBDespesasOperacionais: TfrxDBDataset;
    qryReceitasDespesasFinanceiras: TtecQuery;
    frxDBReceitasDespesasFinanceiras: TfrxDBDataset;
    qryReceita_Operacional_Bruta: TtecQuery;
    qryReceita_Operacional_Bruta_Regime_de_Caixa: TtecQuery;
    qryReceita_Operacional_Bruta_Regime_de_Competencia: TtecQuery;
    procedure frxDREGetValue(const VarName: String; var Value: Variant);
//    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FDataInicial: String;
    FDataFinal: String;
    FAgruparFilial: boolean;
    FAgruparGrupoFilial: boolean;
    FAgruparVendedor: Boolean;
    FParametroCabecalho: String;
    FDevolucoesPeriodoAnterior: Boolean;
    FRecebimentosporContrato: Boolean;
    FRecebimentosporFrenteCaixa: Boolean;
    fFiliais: String;
    fGrupoFiliais: String;
    fAgruparClasseProduto: Boolean;
    fAgruparGrupoProduto: Boolean;
    fRegime: integer;
    procedure SetDataFinal(const Value: String);
    function GetRegime: String;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    procedure ImprimirRelatorio(tipo: String);
    property DataInicial: String read FDataInicial write FDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property AgruparClasseProduto: Boolean read fAgruparClasseProduto write fAgruparClasseProduto;
    property AgruparGrupoProduto: Boolean read fAgruparGrupoProduto write fAgruparGrupoProduto;
    property Regime: integer read fRegime write fREgime;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    function AbrirRelatorio: Boolean;

  end;

var
  dtmdre: Tdtmdre;

implementation

{$R *.dfm}

{ Tdtmdre }

constructor Tdtmdre.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure Tdtmdre.ImprimirRelatorio(
  tipo: String);
var
  PV: TfrxComponent;
begin

    if FileExists(LogotipoFilialBase) then
    begin
      PV := frxDRE.FindObject('fpvLogo');
      if (PV is TfrxPictureView) then
        TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
    end;


//  frxDRE.DesignReport;
  frxDRE.ShowReport;


end;


procedure Tdtmdre.SetDataFinal(
  const Value: String);
begin
  if Value<>'' then
  begin
    FDataFinal := Value;
    if FDataInicial='' then
      FDataInicial:=FDataFinal;
  end
  else
    FDataFinal := FDataInicial;

  qryReceita_Operacional_Bruta.ParamByName('DataInicial').AsString:=FDataInicial;
  qryCustoMercadoria.ParamByName('DataInicial').AsString:=FDataInicial;
  qryDespesasOperacionais.ParamByName('DataInicial').AsString:=FDataInicial;
  qryReceitasDespesasFinanceiras.ParamByName('DataInicial').AsString:=FDataInicial;

  qryReceita_Operacional_Bruta.ParamByName('DataFinal').AsString:=FDataFinal;
  qryCustoMercadoria.ParamByName('DataFinal').AsString:=FDataFinal;
  qryDespesasOperacionais.ParamByName('DataFinal').AsString:=FDataFinal;
  qryReceitasDespesasFinanceiras.ParamByName('DataFinal').AsString:=FDataFinal;

  FParametroCabecalho:=FParametroCabecalho+'Entre: '+FDataInicial+' e '+FDataFinal;

end;

function Tdtmdre.AbrirRelatorio: Boolean;
begin
  case regime of
  0 : begin
        qryReceita_Operacional_Bruta.sql.text := qryReceita_Operacional_Bruta_Regime_de_Caixa.sql.text
      end;
  1 : begin
        qryReceita_Operacional_Bruta.sql.text := qryReceita_Operacional_Bruta_Regime_de_Competencia.sql.text
      end;
  end;

  refazconsultapornome(qryReceita_Operacional_Bruta,['AgruparGrupo','AgruparClasse'],[AgruparGrupoProduto, AgruparClasseProduto ]);
  refazconsultapornome(qryCustoMercadoria,['AgruparGrupo','AgruparClasse'],[AgruparGrupoProduto, AgruparClasseProduto]);
  refazconsultaPorNome(qryDespesasOperacionais,['Regime'],[GetRegime]);
  refazconsulta(qryReceitasDespesasFinanceiras,[],[]);

  result := not qryReceita_Operacional_Bruta.isempty or
            not qryCustoMercadoria.isempty or
            not qryDespesasOperacionais.isempty or
            not qryReceitasDespesasFinanceiras.isempty;

end;


procedure Tdtmdre.frxDREGetValue(const VarName: String;
  var Value: Variant);
begin
  inherited;
  if VarName = 'TITULO' then
    Value :=  'DRE' + CHR(13) + 'DEMONSTRATIVO DO RESULTADO'
  else if VarName = 'RAZAOFILIALBASE' then
    Value := RazaoFilialBase
  else if VarName = 'ENDERECO_BAIRRO' then
    Value :=  RuaFilialBase+ ' - '+BairroFilialBase
  else if VarName = 'CEP_CIDADE_UF' then
    Value :=  FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase
  else if VarName = 'OUTRAS' then
    Value :=  FParametroCabecalho
  else if VarName = 'DATA' then
    Value :=  FormatDateTime('DD/MM/YYYY',date())
    {
  else if VarName = 'DATASITUACAO' then
    Value :=  ANSIUpperCase(ctSITUACAOEM+' '+DataExtenso(strtodate(FDataSituacao)))}
  else if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio)
    {
  else if VarName = 'AgruparGrupoFilial' then
    Value :=  AgruparGrupoFilial
  else if VarName = 'AgruparFilial' then
    Value :=  AgruparFilial
  else if VarName = 'AgruparFornecedor' then
    Value :=  AgruparFornecedor
  else if VarName = 'AgruparLocalizacao' then
    Value :=  AgruparLocalizacao
    }
  else if VarName = 'AgruparClasseProduto' then
    Value :=  AgruparClasseProduto
  else if VarName = 'AgruparGrupoProduto' then
    Value :=  AgruparGrupoProduto;

end;

function Tdtmdre.GetRegime: String;
begin
  case regime of
  0: result := 'Caixa';
  1: result := 'Competência';
  2: result := 'Ocorrência/Vencimento';
  end;

end;

end.
