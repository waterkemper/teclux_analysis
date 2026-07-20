unit dmcomissaovendedorespagtoparcelas;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_dset, fr_dbset, fr_class, Biblio, fmpreviewpadrao,
  ZTransact, variants, frxClass, frxDBSet, clparametrossistema,
  frxExportODF, frxExportTXT, frxExportMail, frxExportCSV, frxExportText,
  frxExportImage, frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML;

type
  Tdtmcomissaovendedorespagtoparcelas = class(TdtmBasico)
    qryComissoesRecebimentos: TtecQuery;
    dsrComissoesRecebimentos: TtecDataSource;
    frxDBDatasetComissoesRecebimentos: TfrxDBDataset;
    frxReportComissoesRecebimentos: TfrxReport;
    qryComissoesRecebimentosfilialvenda2: TIntegerField;
    qryComissoesRecebimentosnomefilialvenda: TStringField;
    qryComissoesRecebimentosvendedor: TIntegerField;
    qryComissoesRecebimentosnomevendedor: TStringField;
    qryComissoesRecebimentosdatavencto: TDateField;
    qryComissoesRecebimentosdatapagto: TDateField;
    qryComissoesRecebimentosvalorpagto: TFloatField;
    qryComissoesRecebimentosperccomissao: TFloatField;
    qryComissoesRecebimentoscontrato: TStringField;
    qryComissoesRecebimentosnomecliente: TStringField;
    qryComissoesRecebimentoslicitacao: TIntegerField;
    qryComissoesRecebimentosnrproposta: TStringField;
    qryComissoesRecebimentosobservacoes: TStringField;
    qryComissoesRecebimentosnotasfiscais: TMemoField;
    qryComissoesRecebimentosvalorcomissao: TFloatField;
    frxDBDatasetComissoesRecebimentos_: TfrxDBDataset;
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
    procedure frxReportComissoesRecebimentosGetValue(const VarName: String;
      var Value: Variant);
  private
    AfterRodapeMestre : Boolean;
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FAgruparCliente: Boolean;
    FAgruparData: Boolean;
    FResumo: Integer;
    FPeriodoFinal: String;
    FTipoRelatorio: Integer;
    FParametroCabecalho: String;
    FTipoCliente: String;
    FFilial: String;
    FPeriodoInicialVencto: String;
    FPeriodoFinalRecebimento: String;
    FPeriodoInicialRecebimento: String;
    FPeriodoFinalEmissao: String;
    FPeriodoFinalVencto: String;
    FPeriodoInicialEmissao: String;
    fVisualizarValoresPISeCOFINS: Boolean;
    fListaCondicionalVendedores: String;
    FAgruparVendedor: Boolean;
    FFilialSelecao: Integer;
    FFilialExibicao: Integer;
    procedure SetAgruparData(const Value: Boolean);
    procedure SetBanco(const Value: String);
    procedure SetFilial(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetResumo(const Value: Integer);
    procedure SetTiporecebimento(const Value: String);
    procedure SetTipoRelatorio(const Value: Integer);
    procedure SetCliente(const Value: String);
    procedure SetTipoCliente(const Value: String);
    procedure SetParametroCabecalho(const Value: String);
    procedure SetListaCondicionalVendedores(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Filial            : String  read  FFilial             write SetFilial;
    property GrupoFiliais      : String  write SetGrupoFiliais;
    property TipoRelatorio     : Integer read  FTipoRelatorio      write SetTipoRelatorio;
    property Banco             : String  write SetBanco;
    property Cliente           : String  write SetCliente;
    property TipoCliente       : String  read  FTipoCliente        write SetTipoCliente;
    property Tiporecebimento   : String  write SetTiporecebimento;
    property Resumo            : Integer read  FResumo             write SetResumo;
    property AgruparGrupoFilial: Boolean read  FAgruparGrupoFilial write FAgruparGrupoFilial;
    property AgruparFilial     : Boolean read  FAgruparFilial      write FAgruparFilial;
    property AgruparCliente    : Boolean read  FAgruparCliente     write FAgruparCliente;
    property AgruparData       : Boolean read  FAgruparData        write SetAgruparData;
    property AgruparVendedor   : Boolean read  FAgruparVendedor    write fAgruparVendedor;

    property ParametroCabecalho: String  read  FParametroCabecalho write SetParametroCabecalho;
    property PeriodoInicialEmissao    : String read  FPeriodoInicialEmissao     write FPeriodoInicialEmissao;
    property PeriodoFinalEmissao      : String read  FPeriodoFinalEmissao       write FPeriodoFinalEmissao;

    property PeriodoInicialVencto    : String read  FPeriodoInicialVencto     write FPeriodoInicialVencto;
    property PeriodoFinalVencto      : String read  FPeriodoFinalVencto       write FPeriodoFinalVencto;

    property PeriodoInicialRecebimento    : String read  FPeriodoInicialRecebimento     write FPeriodoInicialRecebimento;
    property PeriodoFinalRecebimento      : String read  FPeriodoFinalRecebimento       write FPeriodoFinalRecebimento;

    property ListaCondicionalVendedores: String read fListaCondicionalVendedores write SetListaCondicionalVendedores;

    procedure MontaIntervaloPeriodoRecebimento;

    function  GerarRelatorio: Boolean;
    procedure ImprimirRelatorio;
  end;

var
  dtmcomissaovendedorespagtoparcelas: Tdtmcomissaovendedorespagtoparcelas;

implementation

{$R *.dfm}

{ Tdtmcomissaovendedorespagtoparcelas }


function Tdtmcomissaovendedorespagtoparcelas.GerarRelatorio: Boolean;
begin
  qryComissoesRecebimentos.Close;
  qryComissoesRecebimentos.Open;
end;

procedure Tdtmcomissaovendedorespagtoparcelas.ImprimirRelatorio;
var
  PV: TfrxComponent;
  vAGrupar, vOutras : String;

begin
  frxReportComissoesRecebimentos.Variables['TITULO']  := quotedstr('COMISSÃO DE VENDEDORES POR RECEBIMENTOS');
  frxReportComissoesRecebimentos.Variables['SUBTITULO']  := quotedstr(ParametroCabecalho);

    if (resumo=0) then
    begin
      PV := frxReportComissoesRecebimentos.FindObject('Page1');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;

      PV := frxReportComissoesRecebimentos.FindObject('Page2');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;


//      frxGlobalVariables.Variables['Pagina1']  := True;
//      frxGlobalVariables.Variables['Pagina2']  := True;
    end
    else
    if (resumo=1) then
    begin

      PV := frxReportComissoesRecebimentos.FindObject('Page1');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := True;

      PV := frxReportComissoesRecebimentos.FindObject('Page2');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := False;
{
      frxGlobalVariables.Variables['Pagina1']  := True;
      frxGlobalVariables.Variables['Pagina2']  := False;
      }
    end
    else
    begin
      PV := frxReportComissoesRecebimentos.FindObject('Page1');
      if (PV is TfrxReportPage) then
        TfrxReportPage(PV).visible := false;

      PV := frxReportComissoesRecebimentos.FindObject('Page2');
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
      PV := frxReportComissoesRecebimentos.FindObject('fpvLogo');
      if (PV is TfrxPictureView) then
        TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
      PV := frxReportComissoesRecebimentos.FindObject('fpvLogo2');
      if (PV is TfrxPictureView) then
        TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
    end;

//    frxReportComissoesRecebimentos.DesignReport;

    frxReportComissoesRecebimentos.ShowReport(true);
end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetAgruparData(const Value: Boolean);
begin
  FAgruparData := Value;
end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetBanco(const Value: String);
begin

end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetCliente(const Value: String);
begin

end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetFilial(const Value: String);
begin

end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetGrupoFiliais(const Value: String);
begin

end;


procedure Tdtmcomissaovendedorespagtoparcelas.SetResumo(const Value: Integer);
begin
  if FResumo <> Value Then
    FResumo:= Value;
end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetTipoCliente(const Value: String);
begin

end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetTiporecebimento(const Value: String);
begin

end;

procedure Tdtmcomissaovendedorespagtoparcelas.SetTipoRelatorio(const Value: Integer);
begin
  //  0 = Recebimentos em Aberto     1 = Recebimentos quitadas
end;



procedure Tdtmcomissaovendedorespagtoparcelas.MontaIntervaloPeriodoRecebimento;
begin
  if not DataEmBranco(FPeriodoInicialRecebimento) then
  begin
    if DataEmBranco(FPeriodoFinalRecebimento) then
    begin
      qryComissoesRecebimentos.macrobyname('SQLContratoDataRecebimento').asstring :=
       ' and coalesce(p.formapagamento,'''') not in (''T'',''E'') and p.datapagto >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialRecebimento)));
      ParametroCabecalho := 'RECEBIMENTOS A PARTIR DE : '+FPeriodoInicialRecebimento;
    end
    else
    begin
      qryComissoesRecebimentos.macrobyname('SQLContratoDataRecebimento').asstring :=
       ' and coalesce(p.formapagamento,'''') not in (''T'',''E'') and p.datapagto between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialRecebimento))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalRecebimento)));

      ParametroCabecalho:='RECEBIMENTOS ENTRE: '+FPeriodoInicialRecebimento+' E '+FPeriodoFinalRecebimento;
    end;
  end
  else
  begin
    if not DataEmBranco(FPeriodoFinalRecebimento) then
    begin
      qryComissoesRecebimentos.macrobyname('SQLContratoDataRecebimento').asstring :=
        ' and coalesce(p.formapagamento,'''') not in (''T'',''E'') and p.datapagto <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalRecebimento)));

      ParametroCabecalho := 'RECEBIMENTOS ATÉ: '+FPeriodoFinalRecebimento;
    end
    else
    begin
      qryComissoesRecebimentos.MacroByName('SQLContratoDataRecebimento').AsString:= 'and coalesce(p.formapagamento,'''') not in (''T'',''E'')';
      ParametroCabecalho := 'TODOS RECEBIMENTOS';
    end;
  end;
end;


procedure Tdtmcomissaovendedorespagtoparcelas.SetParametroCabecalho(
  const Value: String);
begin
  if Value = '' then
    FParametroCabecalho := Value
  else
  begin
    if fparametroCabecalho <> '' then
      FParametroCabecalho := FParametroCabecalho + ' - ' + value
    else
      FParametroCabecalho := value;
  end;
end;



procedure Tdtmcomissaovendedorespagtoparcelas.SetListaCondicionalVendedores(
  const Value: String);
begin
  fListaCondicionalVendedores := Value;
  if value <> '' then
  begin
    qryComissoesRecebimentos.MacroByName('ListaCondicionalVendedores').AsString := ' and (' + ListaCondicionalVendedores +')';
    ParametroCabecalho :=' VENDEDORES: ' + ListaCondicionalVendedores;
  end;
end;

procedure Tdtmcomissaovendedorespagtoparcelas.frxReportComissoesRecebimentosGetValue(
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
