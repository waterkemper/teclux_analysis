unit dmcontroleemissaodeetiquetas;

interface

uses
  SysUtils, Classes, DB, ZQuery, ZPgSqlQuery, cpquery, dmbasico, ZTransact, dmtecsoft,
  frxClass, frxDBSet, biblio, clparametrossistema, frxChBox;

type
  TdtmControleEmissaodeEtiquetas = class(TDtmBasico)
    qryParametrosFormularios: TtecQuery;
    qryParametrosFormulariosnomeformulario: TStringField;
    qryParametrosFormulariosusename: TStringField;
    qryParametrosFormularioschave: TStringField;
    qryParametrosFormulariosconteudo: TMemoField;
    qryParametrosFormulariosdatahora: TDateTimeField;
    qryParametrosFormulariosobjetivo: TStringField;
    qryParametrosFormulariosnomeusuario: TStringField;
    frxControleEmissaodeEtiquetas: TfrxReport;
    frxDBControleEmissaodeEtiquetas: TfrxDBDataset;
    qryParametrosFormulariosFilialProdutosExposicao: TIntegerField;
    qryParametrosFormulariosEmExposicao: TBooleanField;
    qryParametrosFormulariosQtdemEstoqueProdutosExposicao: TBooleanField;
    qryParametrosFormulariosQusntidadeLote: TBooleanField;
    qryParametrosFormulariosNrLote: TIntegerField;
    qryParametrosFormulariosQtdeZeradaProdutosExposicao: TBooleanField;
    qryParametrosFormulariosIntervaloInicialAlteracao: TDateTimeField;
    qryParametrosFormulariosIntervaloFinalAlteracao: TDateTimeField;
    qryParametrosFormulariosModeloEtiqueta: TIntegerField;
    qryParametrosFormulariosQuantidadeProdutosExposicao: TIntegerField;
    qryParametrosFormulariosselecionar: TBooleanField;
    qryParametrosFormularioscodigousuario: TIntegerField;
    frxDBControleEmissaodeEtiquetas_: TfrxDBDataset;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    procedure qryParametrosFormulariosCalcFields(DataSet: TDataSet);
    procedure frxControleEmissaodeEtiquetasGetValue(const VarName: String;
      var Value: Variant);
    procedure qryParametrosFormulariosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    FParametroCabecalho: String;
    { Private declarations }
  public
    { Public declarations }
    function ImprimirRelatorio(DataInicial, DataFinal, ListadeFiliais : String): boolean;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;

  end;

var
  dtmControleEmissaodeEtiquetas: TdtmControleEmissaodeEtiquetas;

implementation

{$R *.dfm}

function TdtmControleEmissaodeEtiquetas.ImprimirRelatorio(DataInicial,
  DataFinal, ListadeFiliais: String): boolean;

var
  vRel: TfrxReport;
  PV: TfrxComponent;
  vStreamRel, vStreamRelResumo: TMemoryStream;

begin

  ParametroCabecalho := '';

  if (dataInicial<>'')  and (datafinal<>'') then
  begin
    qryParametrosFormularios.MacrobyName('IntervaloDatas').asString := ' and cast(datahora as date) between :datainicial and :datafinal';
    ParametroCabecalho:=ParametroCabecalho+'Entre: '+DataInicial+' e '+DataFinal;
  end
  else
  if (dataInicial<>'')  and (datafinal='') then
  begin
    qryParametrosFormularios.MacrobyName('IntervaloDatas').asString := ' and cast(datahora as date) >= :datainicial';
    ParametroCabecalho:=ParametroCabecalho+'Maior ou igual a '+DataInicial;
  end
  else
  if (dataInicial='')  and (datafinal<>'') then
  begin
    qryParametrosFormularios.MacrobyName('IntervaloDatas').asString := ' and cast(datahora as date) <= :datafinal';
    ParametroCabecalho:=ParametroCabecalho+'Menor ou igual a '+DataFinal;
  end;

  if DataInicial<>'' then
    qryParametrosFormularios.parambyname('datainicial').asDateTime := strtodate(DataInicial);

  if DataFinal<>'' then
    qryParametrosFormularios.parambyname('datafinal').asDateTime := strtodate(DataFinal);

  qryParametrosFormularios.filtered := false;
  
  qryParametrosFormularios.close;
  qryParametrosFormularios.open;

  if ListadeFiliais<>'' then
  begin
    ParametroCabecalho := ParametroCabecalho + ' Filiais: ' + ListadeFiliais;

    qryParametrosFormularios.first;
    while not qryParametrosFormularios.eof do
    begin
      if pos(quotedstr(qryParametrosFormulariosFilialProdutosExposicao.asString),ListadeFiliais)<>0 then
      begin
        qryParametrosFormularios.edit;
        qryParametrosFormulariosselecionar.asBoolean := true;
        qryParametrosFormularios.post;
      end;
      qryParametrosFormularios.next;
    end;

    qryParametrosFormularios.filtered := true;

  end;

  if FileExists(LogotipoFilialBase) then
  begin
    PV := frxControleEmissaodeEtiquetas.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
  end;

  with frxControleEmissaodeEtiquetas do
  begin
    Variables['RAZAOFILIALBASE']  := quotedstr(RazaoFilialBase);
    Variables['ENDERECO_BAIRRO']   := quotedstr(RuaFilialBase+ ' - '+BairroFilialBase);
    Variables['CEP_CIDADE_UF']:= quotedstr(FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase);
  end;

//  frxControleEmissaodeEtiquetas.DesignReport;
  frxControleEmissaodeEtiquetas.ShowReport;

end;

procedure TdtmControleEmissaodeEtiquetas.qryParametrosFormulariosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryParametrosFormulariosFilialProdutosExposicao.isnull then
  begin
    qryParametrosFormulariosFilialProdutosExposicao.asVariant := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'fraConsultaFilialProdutosExposicao', 'edfcodigo.text',
                                                                qryParametrosFormulariosFilialProdutosExposicao.datatype, true );

    qryParametrosFormulariosEmExposicao.asBoolean := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'ckbEmExposicao', 'Checked',
                                                                qryParametrosFormulariosEmExposicao.datatype, true );

    qryParametrosFormulariosQtdemEstoqueProdutosExposicao.asBoolean :=  ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'ckbQtdemEstoqueProdutosExposicao', 'Checked',
                                                                qryParametrosFormulariosQtdemEstoqueProdutosExposicao.datatype, true );

    qryParametrosFormulariosQusntidadeLote.asBoolean :=  ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'ckbQusntidadeLote', 'Checked',
                                                                qryParametrosFormulariosQusntidadeLote.datatype, true );

    qryParametrosFormulariosNrLote.asVariant := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'edtNrLote', 'text',
                                                                qryParametrosFormulariosNrLote.datatype, true);

    qryParametrosFormulariosQtdeZeradaProdutosExposicao.asBoolean := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'ckbQtdeZeradaProdutosExposicao', 'Checked',
                                                                qryParametrosFormulariosQtdeZeradaProdutosExposicao.datatype, true);

    qryParametrosFormulariosQuantidadeProdutosExposicao.asVariant := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'edtQuantidadeProdutosExposicao', 'text',
                                                                qryParametrosFormulariosQuantidadeProdutosExposicao.datatype, true);

    qryParametrosFormulariosIntervaloInicialAlteracao.asVariant := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'edtIntervaloInicialAlteracaoProdutosExposicao', 'text',
                                                                qryParametrosFormulariosIntervaloInicialAlteracao.datatype, true);

    qryParametrosFormulariosIntervaloFinalAlteracao.asVariant := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'edtIntervaloFinalAlteracaoProdutosExposicao', 'text',
                                                                qryParametrosFormulariosIntervaloFinalAlteracao.datatype, true);

    qryParametrosFormulariosModeloEtiqueta.asinteger := ValorObjetoArquivoIni(qryParametrosFormulariosconteudo,
                                                                'edfModeloEtiqueta', 'text',
                                                                qryParametrosFormulariosModeloEtiqueta.datatype, false);
  end;


end;

procedure TdtmControleEmissaodeEtiquetas.frxControleEmissaodeEtiquetasGetValue(
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
    Value := FParametroCabecalho
  else  if VarName = 'TITULO' then
    Value := 'CONTROLE DE EMISSÃO DE ETIQUETAS';

end;

procedure TdtmControleEmissaodeEtiquetas.qryParametrosFormulariosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryParametrosFormularios.filtered then
    Accept := qryParametrosFormulariosselecionar.asBoolean;
end;

end.
