 unit dmlista;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms,
  Dialogs, DB, CheckLst,
  // Constantes
  ctconstantes,
  // Terceiros
  ZQuery, FR_Class, FR_DSet, FR_DBSet,
  // Componentes
  cpquery, cpdatasource,
  // Repositorio
  dmbasico, ZPgSqlQuery,
  clparametrossistema,
  fmpreviewpadrao, biblio, ZTransact, ExcelExport;

type
  TdtmListaPrecos = class(TdtmBasico)
    qryListaPrecos: TtecQuery;
    fdsListaPrecos: TfrDBDataSet;
    frpListaPrecos: TfrReport;
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
    qryProcuraFiliaisjunta: TStringField;
    qryProcuraFiliaisjuntadata: TDateField;
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryListaPrecosdescricaolc: TStringField;
    qryListaPrecoscodigoproduto: TLargeintField;
    qryListaPrecosdescricao: TStringField;
    qryListaPrecosvalorgrade1: TStringField;
    qryListaPrecosvalorgrade2: TStringField;
    qryListaPrecosproduto: TStringField;
    qryListaPrecosreferencia: TStringField;
    qryListaPrecoscodigomarca: TIntegerField;
    qryListaPrecosmarca: TStringField;
    qryListaPrecoscodigogrupo: TStringField;
    qryListaPrecosvalor: TFloatField;
    qryListaPrecostipopreco: TStringField;
    qryListaPrecosalteracao: TDateField;
    qryProcuraFiliaispreconormal: TIntegerField;
    qryProcuraFiliaisprecopromocao: TIntegerField;
    qryListaPrecosvalidade: TDateField;
    qryDatas: TtecQuery;
    qryDatasdatainicial: TDateField;
    qryDatasdatafinal: TDateField;
    qryListaPrecosnomefornecedor: TStringField;
    qryListaPrecosporCargo: TtecQuery;
    dsrListaPrecosporCargo: TtecDataSource;
    qryListaDescricao: TtecQuery;
    qryListaDescricaodescricaocargo: TStringField;
    ExcelExport1: TExcelExport;
    ExcelExportListaPrecos: TExcelExport;
    qryListaPrecoscodigobarras: TStringField;
    qryListaPrecoscodigovisual: TStringField;
    procedure qryListaPrecosvalorGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure frpListaPrecosBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryListaPrecosCalcFields(DataSet: TDataSet);
    procedure frpListaPrecosGetValue(const ParName: String;
      var ParValue: Variant);
  private
    FParametroGrupo: String;
    FParametroClasse: String;
    FParametroFornecedor: String;
    FPromocao: Boolean;
    FNormal: Boolean;
    FDataAlteracao: String;
    FParametroProduto: String;
    FParametroMarca: String;
    FParametroColuna: String;
    FParametroCabecalho: String;
    FDataInicial: String;
    FDataFinal: String;
    FDataValidade: String;
    FprodutoInativo: Boolean;
    FprodutoEmLinha: Boolean;
    FProdutoBrinde: Boolean;
    FProdutoNaoBrinde: Boolean;
    FprodutoForadeLinha: Boolean;
    FProdutoSemMontagem: Boolean;
    FprodutoAtivo: Boolean;
    FProdutoComMontagem: Boolean;
    FParametroOrdenacao: Integer;
    FParametroFilial: String;
    FAgruparMarca: Boolean;
    FAgruparFornecedor: Boolean;
    FTipoValidade: Integer;
    fAbrirExcel: Boolean;
    FSemEstoqueZero: Boolean;
    fListaCondicionalPromocoes: String;
    FImprimirCodigoDeBarras: Boolean;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
    function GetConsultaFilial: TtecQuery;
    function getPeriodoFinal: String;
    function getPeriodoInicial: String;
  protected
    function GetCodigoFilial: Integer;

  public
    constructor Create(AOwner: TComponent); override;
    function ExisteFilial(Campo, Codigo: String): Boolean;
    procedure AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
    procedure FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
    procedure Selecionar(TipoPesquisa: TtecPesquisa);
    function GerarRelatorio: boolean;
    property ConsultaFilial: TtecQuery read GetConsultaFilial;
    property CodigoFilial: Integer read GetCodigoFilial;
    property ParametroGrupo: String read FParametroGrupo write FParametroGrupo;
    property ParametroProduto: String read FParametroProduto write FParametroProduto;
    property ParametroMarca: String read FParametroMarca write FParametroMarca;

    property ListaCondicionalPromocoes: String read fListaCondicionalPromocoes write fListaCondicionalPromocoes;

    property ParametroClasse: String read FParametroClasse write FParametroClasse;
    property ParametroFornecedor: String read FParametroFornecedor write FParametroFornecedor;
    property ParametroColuna: String read FParametroColuna write FParametroColuna;
    property ParametroFilial: String read FParametroFilial write FParametroFilial;

    property Normal: Boolean read FNormal write FNormal;
    property Promocao: Boolean read FPromocao write FPromocao;

    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property DataAlteracao: String read FDataAlteracao write FDataAlteracao;
    property TipoValidade: Integer read FTipoValidade write FTipoValidade;
    property DataValidade: String read FDataValidade write FDataValidade;

    property ProdutoEmLinha: Boolean read FprodutoEmLinha write FProdutoEmLinha;
    Property ProdutoForadeLinha: Boolean read FprodutoForadeLinha write FProdutoForadeLinha;
    property ProdutoAtivo: Boolean read FprodutoAtivo write FProdutoAtivo;
    property ProdutoInativo: Boolean read FprodutoInativo write FProdutoInativo;
    property ProdutoComMontagem: Boolean read FProdutoComMontagem write FProdutoComMontagem;
    property ProdutoSemMontagem: Boolean read FProdutoSemMontagem write FProdutoSemMontagem;
    property ProdutoBrinde: Boolean read FProdutoBrinde write FProdutoBrinde;
    property ProdutoNaoBrinde: Boolean read FProdutoNaoBrinde write FProdutoNaoBrinde;

    procedure DefineOrdenacao;
    property ParametroOrdenacao: Integer read FParametroOrdenacao write FParametroOrdenacao;
    property AgruparMarca: Boolean read FAgruparMarca write FAgruparMarca;
    property AgruparFornecedor: Boolean read FAgruparFornecedor write FAgruparFornecedor;
    property periodoinicial: String read getPeriodoInicial;
    property periodoFinal: String read getPeriodoFinal;
    property AbrirExcel: Boolean read fAbrirExcel write fAbrirExcel;
    property SemEstoqueZero: Boolean read FSemEstoqueZero write FSemEstoqueZero;
    property ImprimirCodigoDeBarras: Boolean read FImprimirCodigoDeBarras write FImprimirCodigoDeBarras;


  end;

{var
  dtmLista: TdtmLista;}

implementation

{$R *.dfm}

{ TdtmLista }

constructor TdtmListaPrecos.Create(AOwner: TComponent);
begin
  inherited;
  qryProcuraFiliais.Tag          := ctTabelas;
  qryDatas.Tag                   := ctTabelas;
  qryConsultaFiliais.Tag         := ctPesquisaFilial;
  ReFazConsulta(qryProcuraFiliais, [0], [FilialBase]);
end;

procedure TdtmListaPrecos.AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesCARACTERISTICAS : Abre(ctPesquisaCaracteristica);
    pesMARCAS          : Abre(ctConsultaMarcas);
    pesCLASSES         : Abre(ctPesquisaClasse);
    pesGRUPOS          : Abre(ctPesquisaGrupo);
    pesCOLUNAS         : Abre(ctConsultaColunas);
    pesFILIAIS         : Abre(ctPesquisaFilial);
  end;
end;

procedure TdtmListaPrecos.FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesCARACTERISTICAS : Fecha(ctPesquisaCaracteristica);
    pesMARCAS          : Fecha(ctConsultaMarcas);
    pesCLASSES         : Fecha(ctPesquisaClasse);
    pesGRUPOS          : Fecha(ctPesquisaGrupo);
    pesCOLUNAS         : Fecha(ctConsultaColunas);
    pesFILIAIS         : Fecha(ctPesquisaFilial);
  end;
end;

function TdtmListaPrecos.GerarRelatorio: boolean;
var
  PrecodaPromocao, Preco,
  ParametroCabecalho, SQLSituacaoProdutos : String;
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  vListaCamposCargos: String;
  i: integer;

begin
  if qryProcuraFiliaisprecopromocao.AsString='' then
    PrecodaPromocao := '0'
  else
    PrecodaPromocao := qryProcuraFiliaisprecopromocao.AsString;

  ParametroCabecalho:='';
  if not FPromocao and not FNormal then
    Preco:= 'and (cp.coluna in (' + QuotedStr(qryProcuraFiliaispreconormal.AsString) + ',' +
                                    QuotedStr(PrecodaPromocao) + '))'
  else
  begin
    Preco:= 'and (cp.coluna in (';
    if FNormal then
      Preco:= Preco + QuotedStr(qryProcuraFiliaispreconormal.AsString) + ',';
    if FPromocao then
      Preco:= Preco + QuotedStr(PrecodaPromocao);
    if not FPromocao then
      Delete(Preco,length(preco),1);
    Preco:= Preco + '))';
  end;

  qryListaPrecos.macrobyname('WhereColuna').asString := Preco;

  {
  if FDataAlteracao <> '' then
       qryListaPrecos.Sql[WhereData] := 'and (coalesce(cp.alteracao,''01/01/1899'') >= ' + QuotedStr(FDataAlteracao) + ')'
  else qryListaPrecos.Sql[WhereData] := '';
  }

  if Trim(ParametroProduto) <> '' then
  begin
    qryListaPrecos.macrobyname('WhereProduto').asString := 'and ('+ ParametroProduto + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroProduto_1')+1] := 'and (' + trocar(ParametroProduto,'''','''''') + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroProduto_2')+1] := 'and (' + trocar(Parametroproduto,'''','''''') + ') ';
    qryListaDescricao.MacroByName('ParametroProduto_2').AsString := 'and (' + ParametroProduto + ') ';

    ParametroCabecalho:=FParametroCabecalho+' Caracteristica: '+ParametroProduto;
  end
  else
  begin
    qryListaPrecos.macrobyname('WhereProduto').AsString := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroProduto_1')+1] := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroProduto_2')+1] := '';
    qryListaDescricao.MacroByName('ParametroProduto_2').AsString := '';
  end;

  if Trim(FParametroMarca) <> '' then
  begin
    qryListaPrecos.macrobyname('WhereMarca').asString := 'and (' + FParametroMarca + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroMarca_1')+1] := 'and (' + trocar(FParametroMarca,'''','''''') + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroMarca_2')+1] := 'and (' + trocar(FParametroMarca,'''','''''') + ') ';
    qryListaDescricao.MacroByName('ParametroMarca_2').AsString := 'and (' + FParametroMarca + ') ';

    ParametroCabecalho:=FParametroCabecalho+' Marca: '+FParametroMarca;
  end
  else
  begin
    qryListaPrecos.macrobyname('WhereMarca').asString := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroMarca_1')+1] := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroMarca_2')+1] := '';
    qryListaDescricao.MacroByName('ParametroMarca_2').AsString := '';
  end;

  if Trim(ListaCondicionalPromocoes) <> '' then
  begin
    qryListaPrecos.macrobyname('ListaCondicionalPromocoes').asString := 'and (' + ListaCondicionalPromocoes + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroPromocoes_1')+1] := 'and (' + trocar(ListaCondicionalPromocoes,'''','''''') + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroPromocoes_2')+1] := 'and (' + trocar(ListaCondicionalPromocoes,'''','''''') + ') ';
    qryListaDescricao.MacroByName('ParametroPromocoes_2').AsString := 'and (' + ListaCondicionalPromocoes + ') ';

    ParametroCabecalho:=FParametroCabecalho+' Promoção: '+ListaCondicionalPromocoes;
  end
  else
  begin
    qryListaPrecos.macrobyname('ListaCondicionalPromocoes').asString := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroMarca_1')+1] := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroMarca_2')+1] := '';
    qryListaDescricao.MacroByName('ParametroMarca_2').AsString := '';
  end;


  if Trim(FParametroGrupo) <> '' then
  begin
    qryListaPrecos.macrobyname('WhereGrupo').asString := 'and (' + FParametroGrupo + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroGrupo_1')+1] := 'and (' + trocar(FParametroGrupo,'''','''''') + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroGrupo_2')+1] := 'and (' + trocar(FParametroGrupo,'''','''''') + ') ';
    qryListaDescricao.MacroByName('ParametroGrupo_2').AsString := 'and (' + FParametroGrupo + ') ';

    ParametroCabecalho:=FParametroCabecalho+' Grupo: '+FParametroGrupo;
  end
  else
  begin
    qryListaPrecos.macrobyname('WhereGrupo').AsString := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroGrupo_1')+1] := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroGrupo_2')+1] := '';
    qryListaDescricao.MacroByName('ParametroGrupo_2').AsString := '';
  end;

  if Trim(FParametroClasse) <> '' then
  begin
    qryListaPrecos.macrobyname('WhereClasse').AsString := ' and (' + FParametroClasse + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroClasse_1')+1] := 'and (' + trocar(FParametroClasse,'''','''''') + ') ';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroClasse_2')+1] := 'and (' + trocar(FParametroClasse,'''','''''') + ') ';
    qryListaDescricao.MacroByName('ParametroClasse_2').AsString := 'and (' + FParametroClasse + ') ';

    ParametroCabecalho:=FParametroCabecalho+' Classe: '+FParametroClasse;
  end
  else
  begin
    qryListaPrecos.macrobyname('WhereClasse').asString := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroClasse_1')+1] := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroClasse_2')+1] := '';
    qryListaDescricao.MacroByName('ParametroClasse_2').AsString := '';
  end;

  if Trim(FParametroFornecedor) <> '' then
  begin
    qryListaPrecos.macrobyname('WhereFornecedor').asString := 'and exists (Select fp.fornecedor From fornecedoresprodutos fp ' +
                                           '          Where fp.caracteristica = c.codigo and fp.fornecedor = ' + FParametroFornecedor + ')';

    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroFornecedor_1')+1] := 'and exists (Select fp.fornecedor From fornecedoresprodutos fp ' +
                                           '          Where fp.caracteristica = c.codigo and fp.fornecedor = ' + FParametroFornecedor + ')';

    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroFornecedor_2')+1] := qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroFornecedor_1')+1];
    qryListaDescricao.MacroByName('ParametroFornecedor_2').AsString := qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroFornecedor_1')+1];

    ParametroCabecalho:=FParametroCabecalho+' Fornecedor: '+FParametroFornecedor;
  end
  else
  begin
    qryListaPrecos.macrobyname('WhereFornecedor').AsString := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroFornecedor_1')+1] := '';
    qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'ParametroFornecedor_2')+1] := '';
    qryListaDescricao.MacroByName('ParametroFornecedor_2').AsString := '';
  end;

  if trim(FDataValidade)<>'' then
  begin
    //0-Em 1-Até
    if TipoValidade=0 then
      qryListaPrecos.macrobyname('WhereValidade').AsString := 'and (coalesce(cp.validade,''01/01/1899'') >= '+quotedstr(DataValidade)+' )'
    else
      qryListaPrecos.macrobyname('WhereValidade').AsString := 'and (coalesce(cp.validade,''01/01/1899'') = '+quotedstr(DataValidade)+' )';
    ParametroCabecalho:=ParametroCabecalho+' Válidos em: '+FDataValidade;
  end
  else
    qryListaPrecos.macrobyname('WhereValidade').asString := '';

  SQLSituacaoProdutos := '';
  if FProdutoEmLinha and not FprodutoForadeLinha then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                            ' and  (p.foralinha is null) and (c.foralinha is null)'
  else
  if FprodutoForadeLinha and not Fprodutoemlinha then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                           ' and  (p.foralinha is not null or c.foralinha is not null)';

  if FprodutoAtivo and not FprodutoInativo then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                            ' and  (p.inativo is null) and (c.inativo is null)'
  else
  if FprodutoInativo and not FprodutoAtivo then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                           ' and  (p.inativo is not null or c.inativo is not null)';

  if FProdutoComMontagem and not FProdutoSemMontagem then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                           ' and (c.montagem)'
  else
  if FProdutoSemMontagem and not FProdutoComMontagem then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
        ' and not (c.montagem)';

  if FProdutoBrinde and not FProdutoNaoBrinde then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
      ' and (c.brinde)'
  else
  if FProdutoNaoBrinde and not FProdutoBrinde then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
           ' and not (c.brinde)';

  if SemEstoqueZero then
    SQLSituacaoProdutos := SQLSituacaoProdutos + ' and coalesce(e.emestoque,0)>0 ';

  qryListaPrecos.macrobyname('WhereSituacoes').asString := SQLSituacaoProdutos;
  qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'SQLSituacaoProdutos_1')+1] := SQLSituacaoProdutos;
  qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'SQLSituacaoProdutos_2')+1] := SQLSituacaoProdutos;

//  qryListaDescricao.MacroByName('SQLSituacaoProdutos_2').AsString := ''; estranho não ter o filtro da situacao do produto, agora atribuido abaixo:;
  qryListaDescricao.MacroByName('SQLSituacaoProdutos_2').AsString := SQLSituacaoProdutos;

  DefineOrdenacao;

  qryListaPrecos.Params[0].AsInteger :=  strtoint(FParametroFilial);
  qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'%ParametroFilial_1')+1] := ' and e.filial = ' + FParametroFilial;
  qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'%ParametroFilial_2')+1] := ' and e.filial = ' + FParametroFilial;
  qryListaDescricao.MacroByName('ParametroFilial_2').AsString := ' and e.filial = ' + FParametroFilial;

  qryListaPrecos.Params[1].AsString := PrecodaPromocao;

  if DataAlteracao='' then
    qryListaPrecos.Params[2].Value := null
  else
    qryListaPrecos.Params[2].Value := DataAlteracao;

  qryListaPrecos.Params[3].AsString := DataInicial;
  qryListaPrecos.Params[4].AsString := DataFinal;

  if not ParSistema.PrecosporCargo  then
  begin

    qryListaPrecos.close;
    qryListaPrecos.Open;
    result := qryListaPrecos.recordcount <> 0;


    if result then
    begin
      if  AbrirExcel then
        ExcelExportListaPrecos.ExportDataset
      else
      begin
        frVariables['Razao'] := RazaoFilialBase;
        frVariables['Rua']   := RuaFilialBase;
        frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
        frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
        frVariables['Outras']:= ParametroCabecalho;
        frVariables['AgruparMarca']:= AgruparMarca;
        frVariables['AgruparFornecedor']:= AgruparFornecedor;
//        frVariables['ImprimirCodigoDeBarras']:=ImprimirCodigoDeBarras;

      //  frpListaPrecos.DesignReport;
        frmPreview := TfrmPreviewPadrao.create(self);
        try
          Relatorio := frmPreview.frCompositeReport;
          frmPreview.frCompositeReport.Reports.Clear;
          frmPreview.frCompositeReport.Reports.Add(frpListaPrecos);
          Relatorio.Preview := frmPreview.frPreviewPadrao;
          Relatorio.ShowReport;
          frmPreview.ShowModal;
        finally
          frmPreview.Free
        end;
      end;
    end;


  end
  else
  begin
    qryListaDescricao.close;
    qryListaDescricao.open;
    result := qryListaDescricao.RecordCount <> 0;

    if result then
    begin
      vListaCamposCargos := '';
      qryListaDescricao.first;
      while not qryListaDescricao.eof do
      begin
        vListaCamposCargos := vListaCamposCargos + uppercase(trocar(retiraacento(qryListaDescricaodescricaocargo.asstring),' ', '_')) + ' numeric(15,2)';
        qryListaDescricao.next;
        if not qryListaDescricao.eof then
          vListaCamposCargos := vListaCamposCargos + ', ';
      end;
      qryListaPrecosporCargo.macrobyname('CamposdeCargos').asstring := vListaCamposCargos;
      qryListaPrecosporCargo.close;
      qryListaPrecosporCargo.open;

      qryListaPrecosporCargo.fields[0].displaylabel := 'PRODUTO';
      qryListaPrecosporCargo.fields[1].displaylabel := 'DESCRIÇÃO DO PRODUTO';
      qryListaPrecosporCargo.fieldbyname('listacodigobarras').displaylabel := 'LISTA DE CÓDIGO DE BARRAS';

      for i:= 2 to qryListaPrecosporCargo.fieldcount -1 do
      begin

        qryListaDescricao.first;
        while not qryListaDescricao.eof do
        begin
          if  uppercase(qryListaPrecosporCargo.fields[i].FieldName) = uppercase(trocar(retiraacento(qryListaDescricaodescricaocargo.asstring),' ', '_')) then
          begin
            qryListaPrecosporCargo.fields[i].Displaylabel := uppercase(qryListaDescricaodescricaocargo.asstring);
            break;
          end;
          qryListaDescricao.next;
        end;

      end;

      ExcelExport1.ExportDataset;
    end;

  end;

end;

procedure TdtmListaPrecos.Selecionar(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS         : ReFazConsulta(qryProcuraFiliais, [0], [CodigoFilial]);
  end;
end;

procedure TdtmListaPrecos.qryListaPrecosvalorGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if TField(Sender).IsNull then Text := '0'
  else                          Text := TField(Sender).AsString;
end;

procedure TdtmListaPrecos.frpListaPrecosBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
  begin
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
  end
  else
  {
  if TColor(strtoint(parsistema.CorZebradoRelatorio))<>TColor(clnone) then
   if (View.Name = 'mmoZebrado') then
    if (frpListaPrecos.FindObject('mmoZebrado').FillColor = clnone) then
      frpListaPrecos.FindObject('mmoZebrado').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio))
    else
      frpListaPrecos.FindObject('mmoZebrado').FillColor := clnone;
   }
  if TColor(strtoint(parsistema.CorZebradoRelatorio))<>TColor(clnone) then
   if (View.Name = 'mmoZebrado') then
    if (frpListaPrecos.Dictionary.Variables.Variable['LINHA'] MOD 2)=0 then
      frpListaPrecos.FindObject('mmoZebrado').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio))
    else
      frpListaPrecos.FindObject('mmoZebrado').FillColor := clnone;
end;


procedure TdtmListaPrecos.SetDataFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
  begin
    FDataFinal := Value;
    if DataEmBranco(FDataInicial) then
      FDataInicial:=FDataFinal;
  end
  else
   FDataFinal := FDataInicial;
end;

procedure TdtmListaPrecos.SetDataInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
    FDataInicial := Value;
end;

procedure TdtmListaPrecos.DefineOrdenacao;
var
 Ordenacao, OrdenacaoPrecosporCargo : String;
begin
  ordenacao := '';
  if AgruparMarca and AgruparFornecedor then
   ordenacao:='m.descricao, nomefornecedor,'
  else if AgruparMarca then
   ordenacao:='m.descricao,'
  else if AgruparFornecedor then
   ordenacao:='nomefornecedor,';

  case ParametroOrdenacao of
   0: begin
        Ordenacao:=Ordenacao+' p.codigo, p.descricao, p.valorgrade1, p.valorgrade2,';
        OrdenacaoPrecosporCargo := 'order by 1, 2';
      end;
   1: begin
        Ordenacao:=Ordenacao+' p.descricao, p.valorgrade1, p.valorgrade2, p.codigo,';
        OrdenacaoPrecosporCargo := 'order by 2, 1';
      end;
  end;
  delete(ordenacao,length(ordenacao),1);
  insert('order by ',ordenacao,1);
  qryListaPrecos.macrobyname('WhereOrdenacao').asString:=Ordenacao;

  qryListaPrecosporCargo.sql[NumerodalinhanoTexto(qryListaPrecosporCargo.sql,'WhereOrdenacao')+1] := OrdenacaoPrecosporCargo;


end;

function TdtmListaPrecos.GetCodigoFilial: Integer;
begin
 result := qryConsultaFiliaiscodigo.AsInteger;
end;

function TdtmListaPrecos.ExisteFilial(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmListaPrecos.GetConsultaFilial: TtecQuery;
begin
  result := qryConsultaFiliais;
end;

procedure TdtmListaPrecos.qryListaPrecosCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryListaPrecosdescricaolc.AsString := qryListaPrecosdescricao.AsString +
                                        ' '+qryListaPrecosvalorgrade1.AsString +
                                        ' '+qryListaPrecosvalorgrade2.AsString;
end;

function TdtmListaPrecos.getPeriodoFinal: String;
begin
 result := qryDatasdatafinal.AsString;
end;

function TdtmListaPrecos.getPeriodoInicial: String;
begin
 result := qryDatasdatainicial.AsString;
end;

procedure TdtmListaPrecos.frpListaPrecosGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName = 'codigodoproduto' then
  begin
    if ImprimirCodigoDeBarras then
      Parvalue := qryListaPrecoscodigobarras.AsString
    else
      Parvalue := qryListaPrecoscodigovisual.AsString;
  end;

end;

end.
