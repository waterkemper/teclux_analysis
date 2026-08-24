unit dmanaliseeconomicacompras;

interface

uses
  SysUtils, Classes, dmtecsoft, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  ZTransact, frxClass, frxDBSet, cpdatasource, biblio, ctconstantes, clparametrossistema,
  frxExportODF, frxExportTXT, frxExportMail, frxExportCSV, frxExportText,
  frxExportImage, frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML,
  frxExportPDF;

type
  TdtmAnaliseEconomicaCompras = class(TdtmBasico)
    qryAnaliseCompras: TtecQuery;
    qryAnaliseComprasanomes: TStringField;
    qryAnaliseComprasprodutovisual: TStringField;
    qryAnaliseComprasdescricaoproduto: TStringField;
    qryAnaliseComprasgrupo: TStringField;
    qryAnaliseComprasdescricaogrupo: TStringField;
    qryAnaliseComprasmprod_quantidadeprodutos: TFloatField;
    qryAnaliseComprasvalor_precoproduto: TFloatField;
    qryAnaliseComprasvuni_mediaprecoproduto: TFloatField;
    qryAnaliseComprasecon: TFloatField;
    dsrAnaliseCompras: TtecDataSource;
    frxAnaliseEconomicaCompras: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryAnaliseCompras_: TtecQuery;
    frxDBDataset2: TfrxDBDataset;
    tecDataSource1: TtecDataSource;
    qryAnaliseCompras_anomes: TStringField;
    qryAnaliseComprasfilial: TIntegerField;
    qryAnaliseComprasnomefilial: TStringField;
    qryAnaliseCompras_MesAnoExtenso: TStringField;
    frxDBEconomiaCompras: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
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
    procedure frxAnaliseEconomicaComprasGetValue(const VarName: String;
      var Value: Variant);
    procedure qryAnaliseCompras_CalcFields(DataSet: TDataSet);
  private
    fParametroCabecalho: String;
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRelatorio(DataInicial, DataFinal: TDateTime;
          ListadeFiliais, ListadeItemProdutos, ListadeProdutos,
          ListadeGrupos, ListadeClasses, ListadeMarcas,
          ListadeFornecedores, ListaGruposFornecedores, ListaCondicionalPromocoes: String);

    property ParametroCabecalho: String read fParametroCabecalho write fParametroCabecalho;
  end;

var
  dtmAnaliseEconomicaCompras: TdtmAnaliseEconomicaCompras;

implementation

{$R *.dfm}

procedure TdtmAnaliseEconomicaCompras.frxAnaliseEconomicaComprasGetValue(
  const VarName: String; var Value: Variant);
begin
  inherited;
  if VarName = 'TITULO' then
    Value :=  'ANÁLISE ECONÔMICA DE COMPRAS DE PRODUTOS'
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
  else if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio);

end;

procedure TdtmAnaliseEconomicaCompras.ImprimirRelatorio(DataInicial,
  DataFinal: TDateTime; ListadeFiliais, ListadeItemProdutos,
  ListadeProdutos, ListadeGrupos, ListadeClasses, ListadeMarcas,
  ListadeFornecedores, ListaGruposFornecedores, ListaCondicionalPromocoes: String);
var
    PV: TfrxComponent;
const
  FiltroFilial       = 'AND np.filial in (%s)';
  FiltroGruposFornecedores = ' (p.caracteristica in (select fp.caracteristica from fornecedoresprodutos fp where fp.fornecedor in (select f.codigo from fornecedores f join gruposfornecedores gf on f.grupofornecedor = gf.codigo where %s)))';

begin

  ParametroCabecalho := 'Entre '+datetostr(DataInicial)+' e '+datetostr(datafinal);

  qryAnaliseCompras.ParambyName('DataInicial').asDateTime := DataInicial;
  qryAnaliseCompras.ParambyName('DataFinal').asDateTime := DataFinal;

  qryAnaliseCompras_.ParambyName('DataInicial').asDateTime := DataInicial;
  qryAnaliseCompras_.ParambyName('DataFinal').asDateTime := DataFinal;

  if ListadeFiliais <> '' then
  begin
    qryAnaliseCompras.MacroByName('ListadeFiliais').AsString:= Format(FiltroFilial,[ListadeFiliais]);
    ParametroCabecalho := ParametroCabecalho + 'FILIAL: ' + ListadeFiliais;
  end
  else qryAnaliseCompras.MacroByName('ListadeFiliais').AsString:= '';

  if ListadeFornecedores<>'' then
  begin
    qryAnaliseCompras.macrobyName('ListadeFornecedores').asString := 'and ('+ListadeFornecedores+')';
    ParametroCabecalho := ParametroCabecalho + ' Fornecedcores :'+ListadeFornecedores;
  end
  else
    qryAnaliseCompras.macrobyName('ListadeFornecedores').asString := '';

  if ListaGruposFornecedores<>'' then
  begin
    qryAnaliseCompras.macrobyName('ListaGruposFornecedores').asString := ' and ' + format(FiltroGruposFornecedores, [ListaGruposFornecedores]);
    ParametroCabecalho := ParametroCabecalho + ' Grupo Fornecedcores :'+ListaGruposFornecedores;
  end
  else
    qryAnaliseCompras.macrobyName('ListaGruposFornecedores').asString := '';

  if ListadeItemProdutos<>'' then
  begin
    qryAnaliseCompras.MacroByName('ListadeItemProdutos').AsString :=  'and ('+ListadeItemProdutos+')';
    ParametroCabecalho := ParametroCabecalho + ' Item de Produtos :'+ListadeItemProdutos;
  end
  else
    qryAnaliseCompras.MacroByName('ListadeItemProdutos').AsString := '';

  if ListadeProdutos<>'' then
  begin
    qryAnaliseCompras.MacroByName('ListadeProdutos').AsString :=  'and ('+ListadeProdutos+')';
    ParametroCabecalho := ParametroCabecalho + ' Produtos :'+ListadeProdutos;
  end
  else
    qryAnaliseCompras.MacroByName('ListadeProdutos').AsString := '';

  if ListadeGrupos<>'' then
  begin
    qryAnaliseCompras.MacroByName('ListadeGrupos').AsString :=  'and ('+ListadeGrupos+')';
    ParametroCabecalho := ParametroCabecalho + ' Grupos :'+ListadeGrupos;
  end
  else
    qryAnaliseCompras.MacroByName('ListadeGrupos').AsString := '';

  if ListadeClasses<>'' then
  begin
    qryAnaliseCompras.MacroByName('ListadeClasses').AsString := 'and ('+ListadeClasses+')';
    ParametroCabecalho := ParametroCabecalho + ' Classes :'+ListadeClasses;
  end
  else
    qryAnaliseCompras.MacroByName('ListadeClasses').AsString := '';

  if ListadeMarcas<>'' then
  begin
    qryAnaliseCompras.MacroByName('ListadeMarcas').AsString := 'and ('+ListadeMarcas+')';
    ParametroCabecalho := ParametroCabecalho + ' Marcas :'+ListadeMarcas;
  end
  else
    qryAnaliseCompras.MacroByName('ListadeMarcas').AsString := '';

  if ListaCondicionalPromocoes<>'' then
  begin
    qryAnaliseCompras.MacroByName('ListaCondicionalPromocoes').AsString := 'and ('+ListaCondicionalPromocoes+')';
    ParametroCabecalho := ParametroCabecalho + ' Promoções :'+ListaCondicionalPromocoes;
  end
  else
    qryAnaliseCompras.MacroByName('ListaCondicionalPromocoes').AsString := '';


  qryAnaliseCompras.close;
  qryAnaliseCompras.open;

  qryAnaliseCompras_.close;
  qryAnaliseCompras_.open;


  if FileExists(LogotipoFilialBase) then
  begin
    PV := frxAnaliseEconomicaCompras.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
  end;

//  frxAnaliseEconomicaCompras.DesignReport(true,false);
  frxAnaliseEconomicaCompras.ShowReport(true);
end;

procedure TdtmAnaliseEconomicaCompras.qryAnaliseCompras_CalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryAnaliseCompras_MesAnoExtenso.asString := NomeMeses[strtoint(copy(qryAnaliseCompras_anomes.asString,6,2))] + ' / '+ copy(qryAnaliseCompras_anomes.asString,1,4);
end;

end.
