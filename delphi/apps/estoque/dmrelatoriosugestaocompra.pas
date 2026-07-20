unit dmrelatoriosugestaocompra;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, CheckLst, Dialogs,
    // Constantes
  Biblio, ctConstantes, fr_dset, fr_dbset, fr_class, fr_desgn, ZTransact;

type
  TdtmRelatorioSugestaoCompra = class(TdtmBasico)
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaGruposFiliais: TtecQuery;
    qryConsultaGruposFiliaisdescricao: TStringField;
    qryConsultaGruposFiliaiscodigo: TIntegerField;
    qryConsultaGrupoProdutos: TtecQuery;
    qryConsultaGrupoProdutosdescricao: TStringField;
    qryConsultaGrupoProdutoscodigo: TStringField;
    qryProcuraGrupoProdutosInicial: TtecQuery;
    dsrProcuraGrupoProdutosInicial: TtecDataSource;
    qryConsultaClasses: TtecQuery;
    qryConsultaClassesdescricao: TStringField;
    qryConsultaClassescodigo: TStringField;
    qryProcuraClassesInicial: TtecQuery;
    dsrProcuraClassesInicial: TtecDataSource;
    qryProcuraProdutosInicial: TtecQuery;
    dsrProcuraProdutosInicial: TtecDataSource;
    qryConsultaProdutos: TtecQuery;
    qryConsultaProdutosdescricao: TStringField;
    qryConsultaProdutoscodigo: TLargeintField;
    qrySugestaoCompra: TtecQuery;
    frpSugestaoCompra: TfrReport;
    fdsSugestaoCompra: TfrDBDataSet;
    qryFornecedores: TtecQuery;
    qryFornecedoresnome: TStringField;
    qryFornecedoresreferencia: TStringField;
    fdsFornecedores: TfrDBDataSet;
    qrySugestaoCompranomegrupofilial: TStringField;
    qrySugestaoCompracodigogrupofilial: TIntegerField;
    qrySugestaoCompranomefilial: TStringField;
    qrySugestaoCompracodigofilial: TIntegerField;
    qrySugestaoCompraclassegrupo: TStringField;
    qrySugestaoCompracodigoclasse: TStringField;
    qrySugestaoCompragrupoproduto: TStringField;
    qrySugestaoCompracodigogrupo: TStringField;
    qrySugestaoCompraproduto: TStringField;
    qrySugestaoCompracodigoproduto: TLargeintField;
    qrySugestaoCompraitem: TStringField;
    qrySugestaoCompracodigoitem: TLargeintField;
    qrySugestaoCompramarca: TStringField;
    qrySugestaoCompraunidade: TStringField;
    qrySugestaoCompraemestoque: TFloatField;
    qrySugestaoComprareservado: TFloatField;
    qrySugestaoCompratransito: TFloatField;
    qrySugestaoComprademonstracao: TFloatField;
    qrySugestaoCompraconserto: TFloatField;
    qrySugestaoComprafuturo: TFloatField;
    qrySugestaoCompradanificada: TFloatField;
    qrySugestaoCompraestoquevenda: TFloatField;
    qrySugestaoCompraestoquetotal: TFloatField;
    qrySugestaoCompraQtdepedido: TFloatField;
    qrySugestaoCompraminimo: TFloatField;
    qrySugestaoCompracustomedio: TFloatField;
    qrySugestaoCompracusto_ultimaentrada: TFloatField;
    qryFornecedorespendente: TFloatField;
    frpSugestaoCompraDetalhes: TfrReport;
    qrySugestaoCompramaximo: TFloatField;
    qrySugestaoComprasugestaocompramin: TFloatField;
    qrySugestaoComprasugestaocompramax: TFloatField;
    qrySugestaoComprasaldo: TFloatField;
    qryProcuraProdutosFinal: TtecQuery;
    dsrProcuraProdutosFinal: TtecDataSource;
    qryProcuraGrupoProdutosFinal: TtecQuery;
    dsrProcuraGrupoProdutosFinal: TtecDataSource;
    qryProcuraClassesFinal: TtecQuery;
    dsrProcuraClassesFinal: TtecDataSource;
    qryProcuraProdutosInicialcodigo: TLargeintField;
    qryProcuraProdutosInicialdescricao: TStringField;
    qryProcuraGrupoProdutosInicialcodigo: TStringField;
    qryProcuraGrupoProdutosInicialdescricao: TStringField;
    qryProcuraClassesInicialcodigo: TStringField;
    qryProcuraClassesInicialdescricao: TStringField;
    qryProcuraProdutosFinalcodigo: TLargeintField;
    qryProcuraProdutosFinaldescricao: TStringField;
    qryProcuraGrupoProdutosFinalcodigo: TStringField;
    qryProcuraGrupoProdutosFinaldescricao: TStringField;
    qryProcuraClassesFinalcodigo: TStringField;
    qryProcuraClassesFinaldescricao: TStringField;
    procedure frpSugestaoCompraBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qrySugestaoCompraAfterScroll(DataSet: TDataSet);
  private
    FListaFiliais: TStringList;
    FListaGruposFiliais: TStringList;
    FAgruparGrupoProduto: Boolean;
    FAgruparClasseGrupo: Boolean;
    FAgruparProduto: Boolean;
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FParametroOrdenacao: Integer;
    FParametroSemMovEstoque: boolean;
    FParametroSemEstoqueMin: boolean;
    FParametroPercentual: String;
    FParametroSemSugestaoCompra: boolean;
    FParametroEstoque: string;
    FParametroImprimirDetalhes: Boolean;
    FParametroCabecalho: String;
    FParametroCodigoInicial: String;
    FParametroCodigoFinal: String;
    FParametroSelecao: Integer;
    FParametroGrupoInicial: String;
    FParametroGrupoFinal: String;
    FParametroClasseInicial: String;
    FParametroClasseFinal: String;
    FCabecalhoSaldoEstoque: String;
    function GetCodigoClasse: String;
    function GetCodigoFilial: Integer;
    function GetCodigoGrupo: String;
    function GetCodigoGrupoFilial: Integer;
    function GetCodigoProduto: String;
    function GetConsultarClasse: TtecQuery;
    function GetConsultarFilial: TtecQuery;
    function GetConsultarGrupo: TtecQuery;
    function GetConsultarGrupoFilial: TtecQuery;
    function GetConsultarProduto: TtecQuery;
    procedure SetParametroSemMovEstoque(const Value: boolean);
    procedure SetParametroSemEstoqueMin(const Value: boolean);
    procedure SetParametroPercentual(const Value: string);
    procedure SetParametroSemSugestaoCompra(const Value: boolean);
    procedure SetParametroEstoque(const Value: string);
    function GetListaFiliais: TStrings;
    function GetListaGruposFiliais: TStrings;
    procedure SetFilial(const Value: String);
    procedure SetGrupoFilial(const Value: String);
    procedure SetParametroCodigoFinal(const Value: String);
    function GetDescricaoProdutoInicial: String;
    function GetDescricaoProdutoFinal: String;
    procedure SetParametroGrupoFinal(const Value: String);
    function GetDescricaoGrupoFinal: String;
    function GetDescricaoGrupoInicial: String;
    procedure SetParametroClasseFinal(const Value: String);
    function GetDescricaoClasseFinal: String;
    function GetDescricaoClasseInicial: String;
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     function ExisteFilial(Campo, Codigo: string): Boolean;
     function ExisteGrupoFilial(Campo, Codigo: string): Boolean;
     function ExisteProduto(Campo, Codigo: string): Boolean;
     function ExisteGrupo(Campo, Codigo: string): Boolean;
     function ExisteClasse(Campo, Codigo: string): Boolean;
     procedure AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
     procedure Selecionar(Pesquisa: TtecPesquisa);
     procedure ImprimirRelatorio;
     property ConsultarFilial: TtecQuery read GetConsultarFilial;
     property ConsultarGrupoFilial: TtecQuery read GetConsultarGrupoFilial;
     property ConsultarProduto: TtecQuery read GetConsultarProduto;
     property ConsultarGrupo: TtecQuery read GetConsultarGrupo;
     property ConsultarClasse: TtecQuery read GetConsultarClasse;
     property CodigoFilial: Integer read GetCodigoFilial;
     property CodigoGrupoFilial: Integer read GetCodigoGrupoFilial;
     property CodigoProduto: String read GetCodigoProduto;
     property CodigoClasse: String read GetCodigoClasse;
     property CodigoGrupo: String read GetCodigoGrupo;
     property DescricaoProdutoInicial : String read GetDescricaoProdutoInicial;
     property DescricaoProdutoFinal : String read GetDescricaoProdutoFinal;
     property DescricaoGrupoInicial : String read GetDescricaoGrupoInicial;
     property DescricaoGrupoFinal : String read GetDescricaoGrupoFinal;
     property DescricaoClasseInicial : String read GetDescricaoClasseInicial;
     property DescricaoClasseFinal : String read GetDescricaoClasseFinal;
     property Filial: String write  SetFilial;
     property GrupoFilial: String write SetGrupoFilial;
     property ParametroCodigoInicial: String read FParametroCodigoInicial write FParametroCodigoInicial;
     property ParametroCodigoFinal: String read FParametroCodigoFinal write SetParametroCodigoFinal;
     property ParametroGrupoInicial: String read FParametroGrupoInicial write FParametroGrupoInicial;
     property ParametroGrupoFinal: String read FParametroGrupoFinal write SetParametroGrupoFinal;
     property ParametroClasseInicial: String read FParametroClasseInicial write FParametroClasseInicial;
     property ParametroClasseFinal: String read FParametroClasseFinal write SetParametroClasseFinal;
     property ParametroOrdenacao: Integer read FParametroOrdenacao write FParametroOrdenacao;
     property ParametroSemMovEstoque: boolean read FParametroSemMovEstoque write SetParametroSemMovEstoque;
     property ParametroSemEstoqueMin: boolean read FParametroSemEstoqueMin write SetParametroSemEstoqueMin;
     property ParametroSemSugestaoCompra: boolean read FParametroSemSugestaoCompra write SetParametroSemSugestaoCompra;
     property ParametroPercentual: string read FParametroPercentual write SetParametroPercentual;
     property ParametroEstoque: string read FParametroEstoque write SetParametroEstoque;
     property ParametroImprimirDetalhes: Boolean read FParametroImprimirDetalhes write FParametroImprimirDetalhes;
     property ListaFiliais: TStrings read GetListaFiliais;
     property ListaGruposFiliais: TStrings read GetListaGruposFiliais;
     property AgruparProduto: Boolean read FAgruparProduto write FAgruparProduto;
     property AgruparGrupoProduto: Boolean read FAgruparGrupoProduto write FAgruparGrupoProduto;
     property AgruparClasseGrupo: Boolean read FAgruparClasseGrupo write FAgruparClasseGrupo;
     property AgruparGrupoFilial: Boolean read FAgruparGrupoFilial write FAgruparGrupoFilial;
     property AgruparFilial: Boolean read FAgruparFilial write FAgruparFilial;
     procedure DefineOrdenacao;
     procedure MontarFiltroFiliais(Usar: TCheckListBox);
     procedure MontarFiltroGrupoFiliais(Usar: TCheckListBox);
     property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
     property CabecalhoSaldoEstoque: String read FCabecalhoSaldoEstoque write FCabecalhoSaldoEstoque;
     property ParametroSelecao: Integer read FParametroSelecao write FParametroSelecao;
  end;

var
  dtmRelatorioSugestaoCompra: TdtmRelatorioSugestaoCompra;

implementation
uses fmpreviewpadrao;

const
EstoqueSaldo           = 33;
WhereEstoqueSugestao   = 69;
WhereFiliais           = 72;
WhereProdutos          = 73;
WhereSemMovEstoque     = 74;
WhereSemEstoqueMin     = 75;
whereSemSugestaoCompra = 77;
whereOrdenacao         = 78;

FiltroFilial      = ' AND ( e.filial IN (%s)) ' +#13#10;
FiltroGrupoFilial = ' AND ( e.filial IN (SELECT filial '+#13#10+
                                         'FROM filiaisgruposfiliais fgf '+#13#10+
                                         'WHERE fgf.grupo IN (%s))) ';
{$R *.dfm}

{ TdtmRelatorioSugestaoCompra }

function TdtmRelatorioSugestaoCompra.ExisteFilial(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmRelatorioSugestaoCompra.ExisteGrupoFilial(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGruposFiliais, Campo, Codigo);
end;

function TdtmRelatorioSugestaoCompra.ExisteGrupo(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGrupoProdutos, Campo, Codigo);
end;

function TdtmRelatorioSugestaoCompra.ExisteClasse(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaClasses, Campo, Codigo);
end;

function TdtmRelatorioSugestaoCompra.GetCodigoFilial: Integer;
begin
  Result := qryConsultaFiliaiscodigo.AsInteger;
end;

function TdtmRelatorioSugestaoCompra.GetCodigoGrupoFilial: Integer;
begin
  Result := qryConsultaGruposFiliaiscodigo.AsInteger;
end;

function TdtmRelatorioSugestaoCompra.GetCodigoClasse: String;
begin
  Result := qryConsultaClassescodigo.AsString;
end;

function TdtmRelatorioSugestaoCompra.GetCodigoGrupo: String;
begin
  Result := qryConsultaGrupoProdutoscodigo.AsString;
end;

function TdtmRelatorioSugestaoCompra.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmRelatorioSugestaoCompra.GetConsultarGrupoFilial: TtecQuery;
begin
  Result:= qryConsultaGruposFiliais;
end;

function TdtmRelatorioSugestaoCompra.GetConsultarGrupo: TtecQuery;
begin
  Result:= qryConsultaGrupoProdutos;
end;

function TdtmRelatorioSugestaoCompra.GetConsultarClasse: TtecQuery;
begin
  Result:= qryConsultaClasses;
end;

procedure TdtmRelatorioSugestaoCompra.AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesPRODUTOSINICIAL,
    pesPRODUTOSFINAL     : begin
                             qryConsultaProdutos.Sql[03]:= 'Where (c.codigo = 0)';
                             Abre(ctPesquisaProdutos);
                           end;
    pesGRUPOSINICIAL,
    pesGRUPOSFINAL       : Abre(ctPesquisaGrupo);
    pesCLASSESINICIAL,
    pesCLASSESFINAL      : Abre(ctPesquisaClasse);
  end;
end;

procedure TdtmRelatorioSugestaoCompra.FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesPRODUTOSINICIAL,
    pesPRODUTOSFINAL     : Fecha(ctPesquisaProdutos);
    pesGRUPOSINICIAL,
    pesGRUPOSFINAL       : Fecha(ctPesquisaGrupo);
    pesCLASSESINICIAL,
    pesCLASSESFINAL      : Fecha(ctPesquisaClasse);
  end;
end;

procedure TdtmRelatorioSugestaoCompra.Selecionar(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesPRODUTOSINICIAL : RefazConsulta(qryProcuraProdutosInicial,[0],[CodigoProduto]);
    pesPRODUTOSFINAL   : RefazConsulta(qryProcuraProdutosFinal,[0],[CodigoProduto]);
    pesGRUPOSINICIAL   : RefazConsulta(qryProcuraGrupoProdutosInicial,[0],[CodigoGrupo]);
    pesGRUPOSFINAL     : RefazConsulta(qryProcuraGrupoProdutosFinal,[0],[CodigoGrupo]);
    pesCLASSESINICIAL  : RefazConsulta(qryProcuraClassesInicial,[0],[CodigoClasse]);
    pesCLASSESFINAL    : RefazConsulta(qryProcuraClassesFinal,[0],[CodigoClasse]);
  end;
end;

function TdtmRelatorioSugestaoCompra.GetCodigoProduto: String;
begin
  Result := qryConsultaProdutoscodigo.AsString;
end;

function TdtmRelatorioSugestaoCompra.ExisteProduto(Campo, Codigo: string): Boolean;
const
  SQL = 'Where (to_ascii(c.%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  qryConsultaProdutos.Sql[03]:= Format(SQL, [Campo, Codigo, '%']);
  qryConsultaProdutos.Open;
  Result := (qryConsultaProdutos.RecordCount > 0);
end;

function TdtmRelatorioSugestaoCompra.GetConsultarProduto: TtecQuery;
begin
  result := qryConsultaProdutos
end;

procedure TdtmRelatorioSugestaoCompra.ImprimirRelatorio;
var
 Relatorio: TfrReport;
 frmPreview: TfrmPreviewPadrao;
begin
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= FParametroCabecalho;
  frVariables['SaldoEstoque']:= FCabecalhoSaldoEstoque;
  frVariables['AgruparGrupoFilial']:=AgruparGrupoFilial;
  frVariables['AgruparFilial']:=AgruparFilial;
  frVariables['AgruparClasseGrupo']:=AgruparClasseGrupo;
  frVariables['AgruparGrupoProduto']:=AgruparGrupoProduto;
  frVariables['AgruparProduto']:=AgruparProduto;
//  frpSugestaoCompra.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    if FParametroImprimirDetalhes then
      frCompositeReport.Reports.Add(frpSugestaoCompraDetalhes)
    else
      frCompositeReport.Reports.Add(frpSugestaoCompra);
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;

end;

procedure TdtmRelatorioSugestaoCompra.DefineOrdenacao;
var
 Ordenacao : String;
begin
  ordenacao:='';
  if AgruparGrupoFilial then
    Ordenacao:=Ordenacao+', nomegrupofilial, codigogrupofilial ';
  if AgruparFilial then
    Ordenacao:=Ordenacao+', nomefilial, codigofilial ';
  if AgruparClasseGrupo then
    Ordenacao:=Ordenacao+', classegrupo, codigoclasse';
  if AgruparGrupoProduto then
    Ordenacao:=Ordenacao+', GrupoProduto, CodigoGrupo';
  if AgruparProduto then
    Ordenacao:=Ordenacao+', Produto, CodigoProduto';
  case FParametroOrdenacao of
  0: Ordenacao:=Ordenacao+', codigoitem, item';
  1: Ordenacao:=Ordenacao+', item, codigoitem';
  end;
  qrySugestaoCompra.sql[WhereOrdenacao]:='Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
end;

procedure TdtmRelatorioSugestaoCompra.frpSugestaoCompraBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
end;

constructor TdtmRelatorioSugestaoCompra.Create(AOwner: TComponent);
begin
  inherited;
  try
    qryConsultaFiliais.Tag:= ctPesquisaFilial;
    qryConsultaGruposFiliais.Tag:= ctPesquisaGrupoFilial;
    qryConsultaProdutos.Tag:= ctPesquisaProdutos;
    qryConsultaGrupoProdutos.Tag:= ctPesquisaGrupo;
    qryConsultaClasses.Tag:= ctPesquisaClasse;
    qrySugestaoCompra.Tag:= ctSugestaoCompra;
    qryProcuraProdutosInicial.Tag:= ctTabelas;
    qryProcuraProdutosFinal.Tag:= ctTabelas;
    qryProcuraClassesInicial.Tag:= ctTabelas;
    qryProcuraClassesFinal.Tag:= ctTabelas;
    qryProcuraGrupoProdutosInicial.Tag:= ctTabelas;
    qryProcuraGrupoProdutosFinal.Tag:= ctTabelas;
  except
     on E: Exception do ShowMessage(E.Message);
  end;

end;

procedure TdtmRelatorioSugestaoCompra.qrySugestaoCompraAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryFornecedores, [0,1,2],
   [qrySugestaoCompracodigoproduto.AsVariant,
    qrySugestaoCompracodigofilial.AsVariant,
    qrySugestaoCompracodigoitem.AsVariant]);
  if qryFornecedores.IsEmpty then
  begin
   qryFornecedores.insert;
   qryfornecedores.Post;
  end;
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroSemMovEstoque(
  const Value: boolean);
const
 WhereExisteMovimento =
   ' and exists (select m1.numero '+
              ' from movimentos m1 '+
              ' where m1.produto = e.produto and '+
	            ' m1.filial = e.filial and '+
                    ' m1.operacao<>''********************'')';
begin
  FParametroSemMovEstoque := Value;
  if Value then
    qrySugestaoCompra.sql[WhereSemMovEstoque] := ''
  else qrySugestaoCompra.sql[WhereSemMovEstoque] := WhereExisteMovimento;
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroSemEstoqueMin(
  const Value: boolean);
begin
  FParametroSemEstoqueMin := Value;
  if value then
    qrySugestaoCompra.sql[WhereSemEstoqueMin] := ''
  else qrySugestaoCompra.sql[WhereSemEstoqueMin] := ' and (coalesce(e.minimo,0)<>0)';
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroPercentual(
  const Value: string);
begin
  FParametroPercentual := Value;
  qrySugestaoCompra.ParamByName('percentual').AsString:=Value;
  if (FParametroPercentual<>'0') and
     (FParametroPercentual<>'') then
   FParametroCabecalho:=FParametroCabecalho+'  '+FParametroPercentual+'% acima do minimo ';
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroSemSugestaoCompra(
  const Value: boolean);
begin
  FParametroSemSugestaoCompra := Value;
  if value then
    qrySugestaoCompra.sql[whereSemSugestaoCompra] := ''
  else qrySugestaoCompra.sql[whereSemSugestaoCompra] :=
  ' Where ((minimo-saldo)<>0)';
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroEstoque(
  const Value: string);
begin
  FParametroEstoque := Value;
  qrySugestaoCompra.sql[EstoqueSaldo]         := Value;
  qrySugestaoCompra.sql[WhereEstoqueSugestao] := Value;
end;

function TdtmRelatorioSugestaoCompra.GetListaFiliais: TStrings;
begin
  FListaFiliais:= TStringList.Create;
  qryConsultaFiliais.Open;
  while not qryConsultaFiliais.Eof do
  begin
    FListaFiliais.AddObject(qryConsultaFiliaisnome.AsString, Pointer(qryConsultaFiliaiscodigo.AsInteger));
    qryConsultaFiliais.Next;
  end;
  qryConsultaFiliais.Close;
  Result := FListaFiliais;
end;

function TdtmRelatorioSugestaoCompra.GetListaGruposFiliais: TStrings;
begin
  FListaGruposFiliais:= TStringList.Create;
  qryConsultaGruposFiliais.Open;
  while not qryConsultaGruposFiliais.Eof do
  begin
    FListaGruposFiliais.AddObject(qryConsultaGruposFiliaisdescricao.AsString, Pointer(qryConsultaGruposFiliaiscodigo.AsInteger));
    qryConsultaGruposFiliais.Next;
  end;
  qryConsultaGruposFiliais.Close;
  Result := FListaGruposFiliais;
end;

procedure TdtmRelatorioSugestaoCompra.MontarFiltroFiliais(
  Usar: TCheckListBox);
var
  STRFiliais: String;
  TodasFiliais: Boolean;
  cnt: Integer;
begin
  TodasFiliais := True;
  STRFiliais := '';
  for cnt := 0 to FListaFiliais.Count - 1 do
    if Usar.Checked[cnt] then
      STRFiliais := STRFiliais + '''' + IntToStr(Integer(FListaFiliais.Objects[cnt])) + ''','
    else
      TodasFiliais := False;

  STRFiliais := Copy(STRFiliais, 0, Length(STrFiliais) - 1);
  Filial:=STRFiliais;
  if Trim(STRFiliais) <> '' then
    if not TodasFiliais then
      FParametroCabecalho:=FParametroCabecalho+' Filiais: '+STRFiliais
    else Filial:='';
end;

procedure TdtmRelatorioSugestaoCompra.SetFilial(const Value: String);
begin
  if (Value <> '') then
   qrySugestaoCompra.Sql[WhereFiliais]:=Format(FiltroFilial,[Value])
  else
   qrySugestaoCompra.Sql[WhereFiliais]:='';
end;

procedure TdtmRelatorioSugestaoCompra.SetGrupoFilial(const Value: String);
begin
  if (Value <> '') then
   qrySugestaoCompra.Sql[WhereFiliais]:=Format(FiltroGrupoFilial,[Value])
end;

procedure TdtmRelatorioSugestaoCompra.MontarFiltroGrupoFiliais(
  Usar: TCheckListBox);
var
  STRGruposFiliais: String;
  TodosGrupos: Boolean;
  cnt: Integer;
begin
  STRGruposFiliais := '';
  TodosGrupos := True;
  for cnt := 0 to FListaGruposFiliais.Count - 1 do
    if Usar.Checked[cnt] then
      STRGruposFiliais := STRGruposFiliais + '''' + IntToStr(Integer(FListaGruposFiliais.Objects[cnt])) + ''','
    else
      TodosGrupos := False;

  STRGruposFiliais := Copy(STRGruposFiliais, 0, Length(STrGruposFiliais) - 1);
  GrupoFilial:=STRGruposFiliais;
  if Trim(STRGruposFiliais) <> '' then
    if not TodosGrupos then
     FParametroCabecalho:=FParametroCabecalho+' Grupo de Filiais: '+STRGruposFiliais
    else
     GrupoFilial:='';
end;


procedure TdtmRelatorioSugestaoCompra.SetParametroCodigoFinal(
  const Value: String);
const
 SQLProduto =
  ' and (e.produto in (Select p.codigo '+
               ' from produtos p join caracteristicas c'+
               ' on p.caracteristica=c.codigo '+
               ' Where (%s)))';
begin
 FParametroCodigoFinal := Value;
 case FParametroSelecao of
  0: begin
      if (FParametroCodigoInicial<>'') and
       (FParametroCodigoFinal<>'') then
      begin
       qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' c.codigo >= '+quotedstr(FParametroCodigoInicial)+
               ' and c.codigo <= '+quotedstr(FParametroCodigoFinal)]);
       FParametroCabecalho:=FParametroCabecalho+
       ' Produto Inicial: '+FParametroCodigoInicial+
       ' Final: '+FParametroCodigoFinal;
      end
      else
       if (FParametroCodigoInicial<>'') and
         (FParametroCodigoFinal='') then
       begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' c.codigo >= '+quotedstr(FParametroCodigoInicial)]);
         FParametroCabecalho:=FParametroCabecalho+
         ' Produto Inicial: '+FParametroCodigoInicial;
       end
       else
        if (FParametroCodigoInicial='') and
           (FParametroCodigoFinal<>'') then
        begin
           qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' c.codigo <= '+quotedstr(FParametroCodigoFinal)]);
           FParametroCabecalho:=FParametroCabecalho+
           ' Produto Final: '+FParametroCodigoFinal;
        end
        else
         qrySugestaoCompra.sql[WhereProdutos]:='';
     end;
  1: begin
      if (DescricaoProdutoInicial<>'') and
         (DescricaoProdutoFinal<>'') then
      begin
        qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' c.descricao >= '+quotedstr(DescricaoProdutoInicial)+
               ' and c.descricao <= '+quotedstr(DescricaoProdutoFinal)]);
       FParametroCabecalho:=FParametroCabecalho+
       ' Produto Inicial: '+DescricaoProdutoInicial+
       ' Final: '+DescricaoProdutoFinal;
      end
      else
       if (DescricaoProdutoInicial<>'') and
         (DescricaoProdutoFinal='') then
         begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' c.descricao >= '+quotedstr(DescricaoProdutoInicial)]);
          FParametroCabecalho:=FParametroCabecalho+
          ' Produto Inicial: '+DescricaoProdutoInicial;
         end
       else
        if (DescricaoProdutoInicial='') and
           (DescricaoProdutoFinal<>'') then
        begin
           qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' c.descricao <= '+quotedstr(DescricaoProdutoFinal)]);
           FParametroCabecalho:=FParametroCabecalho+
           ' Produto Final: '+DescricaoProdutoFinal;
        end
        else
         qrySugestaoCompra.sql[WhereProdutos]:='';
     end;
 end;
end;

function TdtmRelatorioSugestaoCompra.GetDescricaoProdutoInicial: String;
begin
  result := qryProcuraProdutosInicialdescricao.AsString
end;

function TdtmRelatorioSugestaoCompra.GetDescricaoProdutoFinal: String;
begin
  result := qryProcuraProdutosFinaldescricao.AsString
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroGrupoFinal(
  const Value: String);
const
 SQLProduto =
  ' and (e.produto in (Select p.codigo '+
               ' from (produtos p join (caracteristicas c'+
               ' join grupos g on c.grupo=g.codigo) '+
               ' on p.caracteristica=c.codigo) '+
               ' where (%s)))';
begin
 FParametroGrupoFinal := Value;
 case FParametroSelecao of
  0: begin
      if (FParametroGrupoInicial<>'') and
       (FParametroGrupoFinal<>'') then
      begin
        qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' g.codigo >= '+quotedstr(FParametroGrupoInicial)+
               ' and g.codigo <= '+quotedstr(FParametroGrupoFinal)]);
       FParametroCabecalho:=FParametroCabecalho+
       ' Grupo Inicial: '+FParametroGrupoInicial+
       ' Final: '+FParametroGrupoFinal;
      end
      else
       if (FParametroGrupoInicial<>'') and
         (FParametroGrupoFinal='') then
       begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' g.codigo >= '+quotedstr(FParametroGrupoInicial)]);
          FParametroCabecalho:=FParametroCabecalho+
          ' Grupo Inicial: '+FParametroGrupoInicial;
       end
       else
        if (FParametroGrupoInicial='') and
           (FParametroGrupoFinal<>'') then
        begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' g.codigo <= '+quotedstr(FParametroGrupoFinal)]);
          FParametroCabecalho:=FParametroCabecalho+
          ' Grupo Final: '+FParametroGrupoFinal;
        end;
     end;
  1: begin
      if (DescricaoGrupoInicial<>'') and
         (DescricaoGrupoFinal<>'') then
      begin
        qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' g.descricao >= '+quotedstr(DescricaoGrupoInicial)+
               ' and g.descricao <= '+quotedstr(DescricaoGrupoFinal)]);
        FParametroCabecalho:=FParametroCabecalho+
        ' Grupo Inicial: '+DescricaoGrupoInicial+
        ' Final: '+DescricaoGrupoFinal;
      end
      else
       if (DescricaoGrupoInicial<>'') and
         (DescricaoGrupoFinal='') then
       begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' g.descricao >= '+quotedstr(DescricaoGrupoInicial)]);
          FParametroCabecalho:=FParametroCabecalho+
          ' Grupo Inicial: '+DescricaoGrupoInicial;
       end
       else
        if (DescricaoGrupoInicial='') and
           (DescricaoGrupoFinal<>'') then
        begin
           qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' g.descricao <= '+quotedstr(DescricaoGrupoFinal)]);
           FParametroCabecalho:=FParametroCabecalho+
           ' Grupo Final: '+DescricaoGrupoFinal;
        end;
     end;
 end;
end;

function TdtmRelatorioSugestaoCompra.GetDescricaoGrupoFinal: String;
begin
  result := qryProcuraGrupoProdutosFinaldescricao.AsString
end;

function TdtmRelatorioSugestaoCompra.GetDescricaoGrupoInicial: String;
begin
  result := qryProcuraGrupoProdutosInicialdescricao.AsString
end;

procedure TdtmRelatorioSugestaoCompra.SetParametroClasseFinal(
  const Value: String);
const
 SQLProduto =
  ' and (e.produto in (Select p.codigo '+
               ' from (produtos p join ((caracteristicas c'+
               ' join grupos g on c.grupo = g.codigo) '+
               ' join classes cl on c.classe=cl.codigo) '+
               ' on p.caracteristica=c.codigo) '+
               ' where (%s)))';
begin
 FParametroClasseFinal := Value;
 case FParametroSelecao of
  0: begin
      if (FParametroClasseInicial<>'') and
       (FParametroClasseFinal<>'') then
      begin
        qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' cl.codigo >= '+quotedstr(FParametroClasseInicial)+
               ' and cl.codigo <= '+quotedstr(FParametroClasseFinal)]);
        FParametroCabecalho:=FParametroCabecalho+
        ' Classe Inicial: '+FParametroClasseInicial+
        ' Final: '+FParametroClasseFinal;
      end
      else
       if (FParametroClasseInicial<>'') and
         (FParametroClasseFinal='') then
       begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' cl.codigo >= '+quotedstr(FParametroClasseInicial)]);
          FParametroCabecalho:=FParametroCabecalho+
          ' Classe Inicial: '+FParametroClasseInicial;
       end
       else
        if (FParametroClasseInicial='') and
           (FParametroClasseFinal<>'') then
        begin
           qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' cl.codigo <= '+quotedstr(FParametroClasseFinal)]);
           FParametroCabecalho:=FParametroCabecalho+
           ' Classe Final: '+FParametroClasseFinal;
        end;
     end;
  1: begin
      if (DescricaoClasseInicial<>'') and
         (DescricaoClasseFinal<>'') then
      begin
        qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' cl.descricao >= '+quotedstr(DescricaoClasseInicial)+
               ' and cl.descricao <= '+quotedstr(DescricaoClasseFinal)]);
        FParametroCabecalho:=FParametroCabecalho+
        ' Classe Inicial: '+DescricaoClasseInicial+
        ' Final: '+DescricaoClasseFinal;
      end
      else
       if (DescricaoClasseInicial<>'') and
         (DescricaoClasseFinal='') then
       begin
          qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' cl.descricao >= '+quotedstr(DescricaoClasseInicial)]);
          FParametroCabecalho:=FParametroCabecalho+
          ' Classe Inicial: '+DescricaoClasseInicial;
       end
       else
        if (DescricaoClasseInicial='') and
           (DescricaoClasseFinal<>'') then
        begin
           qrySugestaoCompra.sql[WhereProdutos]:= format(SQLProduto,[
               ' cl.descricao <= '+quotedstr(DescricaoClasseFinal)]);
           FParametroCabecalho:=FParametroCabecalho+
           ' Classe Final: '+DescricaoClasseFinal;
        end;
     end;
 end;
end;


function TdtmRelatorioSugestaoCompra.GetDescricaoClasseFinal: String;
begin
  result := qryProcuraClassesFinaldescricao.AsString
end;

function TdtmRelatorioSugestaoCompra.GetDescricaoClasseInicial: String;
begin
  result := qryProcuraClassesInicialdescricao.AsString
end;


end.
