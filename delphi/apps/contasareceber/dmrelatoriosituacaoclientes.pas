unit dmrelatoriosituacaoclientes;

interface

uses
  SysUtils, Classes, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft, dmbasico, fr_dset,
  fr_dbset, fr_class, frxClass, frxDBSet, ZTransact, ctconstantes, clparametrossistema, biblio,
  frxExportODF, frxExportTXT, frxExportMail, frxExportCSV, frxExportText,
  frxExportImage, frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML,
  frxExportPDF;

type
  TdtmRelatorioSituacaoClientes = class(TdtmBasico)
    qryDadosFiscaisParcelas: TtecQuery;
    qryDadosFiscaisParcelasnomecliente: TStringField;
    qryDadosFiscaisParcelasmaquina: TIntegerField;
    qryDadosFiscaisParcelasintervensao: TIntegerField;
    qryDadosFiscaisParcelasnumerocupom: TIntegerField;
    qryDadosFiscaisParcelasfilial: TIntegerField;
    qryDadosFiscaisParcelasserie: TStringField;
    qryDadosFiscaisParcelasnumeronota: TIntegerField;
    qryDadosFiscaisParcelasdadofiscal: TIntegerField;
    qryDadosFiscaisParcelascontrato: TStringField;
    qryDadosFiscaisParcelasdata: TDateField;
    qryDadosFiscaisParcelasdatasaida: TDateField;
    qryDadosFiscaisParcelascliente: TIntegerField;
    qryDadosFiscaisParcelassaldodevedor: TFloatField;
    qryDadosFiscaisParcelasdatavencto: TDateField;
    qryDadosFiscaisParcelasvalorvencto: TFloatField;
    qryDadosFiscaisParcelasdatapagto: TDateField;
    qryDadosFiscaisParcelasvalorpagto: TFloatField;
    qryDadosFiscaisParcelasjuros: TFloatField;
    qryDadosFiscaisParcelasdesconto: TFloatField;
    qryDadosFiscaisParcelasndias: TIntegerField;
    qryDadosFiscaisParcelasnregistro: TIntegerField;
    frxRelatorioSituacaoClientes: TfrxReport;
    frxDBDadosFiscaisParcelas: TfrxDBDataset;
    qryDadosFiscaisParcelasgrupofilial: TIntegerField;
    qryDadosFiscaisParcelasnomegrupofilial: TStringField;
    qryDadosFiscaisParcelasfilialemissao: TIntegerField;
    qryDadosFiscaisParcelasnomefilial: TStringField;
    qryDadosFiscaisParcelasJurosDesconto: TFloatField;
    qryDadosFiscaisParcelastipocliente: TStringField;
    qryDadosFiscaisParcelascgc_cnpj: TStringField;
    qryDadosFiscaisParcelasparcelaorigem: TStringField;
    qryDadosFiscaisParcelasvalornota: TFloatField;
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
    frxReport1: TfrxReport;
    frxDBDadosFiscaisParcelas_: TfrxDBDataset;
    qryDadosFiscaisParcelasTipoPagto: TStringField;
    procedure qryDadosFiscaisParcelasCalcFields(DataSet: TDataSet);
    procedure frxRelatorioSituacaoClientesGetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRelatorio(ListaFiliais, ListaGrupoFiliais, ListaSeries: String; Cliente: integer; TipoCliente: String;
              DataInicial, DataFinalSituacao: String;
              ListarDuplicataemAberto, QuebrarPaginaporCliente,
              AgruparGrupoFilial, Nao_incluir_duplicatas_estornadas, AgruparFilial : boolean;
              Resumo: integer);
  end;

var
  dtmRelatorioSituacaoClientes: TdtmRelatorioSituacaoClientes;

implementation

{$R *.dfm}

procedure TdtmRelatorioSituacaoClientes.ImprimirRelatorio(ListaFiliais,
  ListaGrupoFiliais, ListaSeries: String; Cliente: integer; TipoCliente: String;
  DataInicial, DataFinalSituacao: String; ListarDuplicataemAberto,
  QuebrarPaginaporCliente, AgruparGrupoFilial,
  Nao_incluir_duplicatas_estornadas, AgruparFilial: boolean;
  Resumo: integer);

var
  PV: TfrxComponent;
  vAGrupar, vOutras : String;
begin
    vOutras := '';
    if ListaFiliais <> '' then
      vOutras := 'FILIAIS: '+ListaFiliais+' ';

    if ListaGrupoFiliais <> '' then
      vOutras := vOutras + 'GRUPO DE FILIAIS: '+ListaGrupoFiliais + ' ';

    if ListaSeries <> '' then
    begin
      vOutras := vOutras + 'SÉRIES: '+ListaSeries + ' ';
      qryDadosFiscaisParcelas.macrobyname('ListaSeries').asString := ' and n.serie in (' + ListaSeries + ')';
    end
    else
      qryDadosFiscaisParcelas.macrobyname('ListaSeries').asString := '';


    if cliente<>0 then
    begin
      vOutras := vOutras + 'CLIENTE :' + tipocliente+inttostr(cliente) + ' ';
      qryDadosFiscaisParcelas.macrobyname('cliente').asstring := ' and df.cliente = '+inttostr(cliente) + ' and df.tipocliente = '+quotedstr(tipocliente);
    end
    else
      qryDadosFiscaisParcelas.macrobyname('cliente').asstring := '';


    if ListarDuplicataemAberto then
      vOutras := vOutras + 'Somente parcelas em aberto ';

    if Nao_incluir_duplicatas_estornadas then
    begin
      vOutras := vOutras + 'Sem estornos ';
      qryDadosFiscaisParcelas.MacroByName('Nao_incluir_duplicatas_estornadas').asString :=
      ' and coalesce(p.tipopagto,'''')<>''E'''
    end
    else
    begin
      vOutras := vOutras + 'Com estornos ';
      qryDadosFiscaisParcelas.MacroByName('Nao_incluir_duplicatas_estornadas').asString := '';
    end;

    qryDadosFiscaisParcelas.close;
    qryDadosFiscaisParcelas.parambyname('ListaFiliais').asString := ListaFiliais;
    qryDadosFiscaisParcelas.parambyname('ListaGrupoFiliais').asString := ListaGrupoFiliais;

//    qryDadosFiscaisParcelas.parambyname('ListaSeries').asString := ListaSeries;


//    qryDadosFiscaisParcelas.parambyname('cliente').asInteger := cliente;
//    qryDadosFiscaisParcelas.parambyname('tipocliente').asString := quotedstr(TipoCliente);
    qryDadosFiscaisParcelas.parambyname('DataInicial').asDateTime := strtodate(DataInicial);
    qryDadosFiscaisParcelas.parambyname('DataFinalSituacao').asDateTime := strtodate(DataFinalSituacao);
    qryDadosFiscaisParcelas.parambyname('ListarDuplicataemAberto').asBoolean := ListarDuplicataemAberto;



    if AgruparGrupoFilial then
      vAgrupar := 'df.grupofilial, df.nomegrupofilial';

    if AgruparFilial then
    begin
      if vAgrupar <> '' then
        vAgrupar := vAgrupar + ', ';
      vAgrupar := vAgrupar + 'df.filialemissao, df.nomefilial';
    end;

    if vAgrupar <> '' then
      vAgrupar := vAgrupar + ', ';

    vAgrupar := 'order by ' + vAgrupar + 'df.nomecliente, df.cliente, df.tipocliente, df.data, df.dadofiscal, p.datavencto, p.parcelaorigem, p.nregistro';
    qryDadosFiscaisParcelas.macrobyname('ordenacao').asString := vAgrupar;


    qryDadosFiscaisParcelas.open;

//    frxRelatorioSituacaoClientes.Variables['RAZAOFILIALBASE']  := RazaoFilialBase;
//    frxGlobalVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
{
    frxRelatorioSituacaoClientes.Variables['QuebrarPaginaporCliente']  := QuebrarPaginaporCliente;
    frxRelatorioSituacaoClientes.Variables['AgruparGrupoFilial']  := AgruparGrupoFilial;
    frxRelatorioSituacaoClientes.Variables['AgruparFilial'] := AgruparFilial;
    frxRelatorioSituacaoClientes.Variables['TITULO']  := quotedstr('SITUAÇÃO DOS RECEBIMENTOS EM ' + DataFinalSituacao + ' DESDE ' + DataInicial );
    frxRelatorioSituacaoClientes.Variables['DATASITUACAO'] := quotedstr(DataFinalSituacao);
    frxRelatorioSituacaoClientes.Variables['OUTRAS']  := quotedstr(vOutras);
}


    frxRelatorioSituacaoClientes.Variables['QuebrarPaginaporCliente']  := QuebrarPaginaporCliente;
    frxRelatorioSituacaoClientes.Variables['AgruparGrupoFilial']  := AgruparGrupoFilial;
    frxRelatorioSituacaoClientes.Variables['AgruparFilial'] := AgruparFilial;
    frxRelatorioSituacaoClientes.Variables['TITULO']  := quotedstr('SITUAÇÃO DOS RECEBIMENTOS EM ' + DataFinalSituacao + ' DESDE ' + DataInicial );
    frxRelatorioSituacaoClientes.Variables['DATASITUACAO'] := quotedstr(DataFinalSituacao);
//    frxGlobalVariables.Variables['SUBTITULO']  := '['+quotedstr(trocar(voutras, ':',''))+']';

//    frxGlobalVariables.Variables['SUBTITULO']  := quotedstr(voutras);
    frxRelatorioSituacaoClientes.Variables['SUBTITULO']  := quotedstr(vOutras);

    if (resumo=0) then
    begin
      PV := frxRelatorioSituacaoClientes.FindObject('Page1');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;

      PV := frxRelatorioSituacaoClientes.FindObject('Page2');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;


//      frxGlobalVariables.Variables['Pagina1']  := True;
//      frxGlobalVariables.Variables['Pagina2']  := True;
    end
    else
    if (resumo=1) then
    begin

      PV := frxRelatorioSituacaoClientes.FindObject('Page1');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;

      PV := frxRelatorioSituacaoClientes.FindObject('Page2');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := False;
{
      frxGlobalVariables.Variables['Pagina1']  := True;
      frxGlobalVariables.Variables['Pagina2']  := False;
      }
    end
    else
    begin
      PV := frxRelatorioSituacaoClientes.FindObject('Page1');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := false;

      PV := frxRelatorioSituacaoClientes.FindObject('Page2');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;

{
      frxGlobalVariables.Variables['Pagina1']  := False;
      frxGlobalVariables.Variables['Pagina2']  := True;
      }
    end;


//  frxGlobalVariables['TITULO']  := 'SITUAÇÃO DOS CLIENTES EM '+quotedstr(DataFinalSituacao);

    if FileExists(LogotipoFilialBase) then
    begin
      PV := frxRelatorioSituacaoClientes.FindObject('fpvLogo');
      if (PV is TfrxPictureView) then
        TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
    end;

// frxRelatorioSituacaoClientes.DesignReport(true,true);

    frxRelatorioSituacaoClientes.ShowReport(true);

end;

procedure TdtmRelatorioSituacaoClientes.qryDadosFiscaisParcelasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryDadosFiscaisParcelasJurosDesconto.ascurrency := qryDadosFiscaisParcelasJuros.asCurrency - qryDadosFiscaisParcelasDesconto.asCurrency;
end;

procedure TdtmRelatorioSituacaoClientes.frxRelatorioSituacaoClientesGetValue(
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

end;

end.
