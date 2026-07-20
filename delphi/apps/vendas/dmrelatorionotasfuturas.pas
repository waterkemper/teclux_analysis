unit dmrelatorionotasfuturas;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmTecsoft,
  FR_Class, FR_DSet, FR_DBSet, ctconstantes, cpdatasource, CheckLst,
  clparametrossistema,
  fmpreviewpadrao, biblio, ZTransact;

type
  TdtmRelatorioNotasFuturas = class(TdtmBasico)
    frpNotasFuturas: TfrReport;
    qryNotasFuturas: TtecQuery;
    fdsNotasFuturas: TfrDBDataSet;
    qryFiliais: TtecQuery;
    qryGrupoFiliais: TtecQuery;
    qryItemProdutos: TtecQuery;
    qryItemProdutoscodigo: TLargeintField;
    qryItemProdutosdescricao: TStringField;
    dsrItemProdutos: TtecDataSource;
    qryConsultaItemProdutos: TtecQuery;
    qryConsultaItemProdutoscodigo: TLargeintField;
    qryConsultaItemProdutosdescricao: TStringField;
    qryProdutos: TtecQuery;
    qryProdutoscodigo: TLargeintField;
    qryProdutosdescricao: TStringField;
    dsrProdutos: TtecDataSource;
    qryConsultaProdutos: TtecQuery;
    qryConsultaProdutoscodigo: TLargeintField;
    qryConsultaProdutosdescricao: TStringField;
    qryGrupoProdutos: TtecQuery;
    qryGrupoProdutoscodigo: TStringField;
    qryGrupoProdutosdescricao: TStringField;
    dsrGrupoProdutos: TtecDataSource;
    qryConsultaGrupoProdutos: TtecQuery;
    qryConsultaGrupoProdutosdescricao: TStringField;
    qryConsultaGrupoProdutoscodigo: TStringField;
    qryClasses: TtecQuery;
    qryClassescodigo: TStringField;
    qryClassesdescricao: TStringField;
    dsrClasses: TtecDataSource;
    qryConsultaClasses: TtecQuery;
    qryConsultaClassescodigo: TStringField;
    qryConsultaClassesdescricao: TStringField;
    qryFornecedores: TtecQuery;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedoresrazao: TStringField;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaFornecedoresrazao: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryGrupoFiliaiscodigo: TIntegerField;
    qryGrupoFiliaisdescricao: TStringField;
    qryConsultaItemProdutosvalorgrade1: TStringField;
    qryConsultaItemProdutosvalorgrade2: TStringField;
    qryNotasFuturasserie: TStringField;
    qryNotasFuturasnota: TIntegerField;
    qryNotasFuturasmaquina: TIntegerField;
    qryNotasFuturasintervensao: TIntegerField;
    qryNotasFuturascupom: TIntegerField;
    qryNotasFuturascontrato: TStringField;
    qryNotasFuturasdata: TDateField;
    qryNotasFuturascliente: TIntegerField;
    qryNotasFuturasnomecliente: TStringField;
    qryNotasFuturasfilialvenda: TIntegerField;
    qryNotasFuturasnomefilialvenda: TStringField;
    qryNotasFuturasproduto: TLargeintField;
    qryNotasFuturasdescricao: TStringField;
    qryNotasFuturasprecovenda: TFloatField;
    qryNotasFuturasquantidade: TFloatField;
    qryNotasFuturasfilial: TIntegerField;
    qryNotasFuturasTotalVenda: TCurrencyField;
    procedure frpProdutosPendentesBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryConsultaItemProdutosAfterOpen(DataSet: TDataSet);
    procedure qryNotasFuturasCalcFields(DataSet: TDataSet);
  private
    FListaFiliais: TStringList;
    FListaGruposFiliais: TStringList;
    FParametroCabecalho: String;
    FDataInicial: String;
    FDataFinal: String;
    procedure SetClasseProdutos(const Value: String);
    procedure SetFiliais(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetGrupoProdutos(const Value: String);
    procedure SetItemProdutos(const Value: String);
    procedure SetProdutos(const Value: String);
    function GetConsultaClasses: TtecQuery;
    function GetConsultaFornecedores: TtecQuery;
    function GetConsultaGrupoProdutos: TtecQuery;
    function GetConsultaItemProdutos: TtecQuery;
    function GetConsultaProdutos: TtecQuery;
    function GetListaFiliais: TStrings;
    function GetListaGruposFiliais: TStrings;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioVendas);
    procedure Selecionar(TipoPesquisa: TtecRelatorioVendas);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecRElatorioVendas);
    property ConsultaItemProdutos: TtecQuery read GetConsultaItemProdutos;
    property ConsultaProdutos: TtecQuery read GetConsultaProdutos;
    property ConsultaGrupoProdutos: TtecQuery read GetConsultaGrupoProdutos;
    property ConsultaClasses: TtecQuery read GetConsultaClasses;
    property ConsultaFornecedores: TtecQuery read GetConsultaFornecedores;
    function ExisteItemProdutos(campo, codigo: string): boolean;
    function ExisteProdutos(campo, codigo: string): boolean;
    function ExisteGrupoProdutos(campo, codigo: string): boolean;
    function ExisteClasses(campo, codigo: string): boolean;
    function ExisteFornecedor(campo, codigo: string): boolean;
    procedure ImprimirRelatorio;
    property Filiais: String write SetFiliais;
    property GrupoFiliais: String write SetGrupoFiliais;
    property ItemProdutos: String write SetItemProdutos;
    property Produtos: String write SetProdutos;
    property GrupoProdutos: String write SetGrupoProdutos;
    property ClasseProdutos: String write SetClasseProdutos;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property ListaFiliais: TStrings read GetListaFiliais;
    property ListaGruposFiliais: TStrings read GetListaGruposFiliais;
    procedure MontarFiltroFiliais(Usar: TCheckListBox);
    procedure MontarFiltroGrupoFiliais(Usar: TCheckListBox);
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    function abrirconsultanotaspendentes: boolean;
  end;

var
  dtmRelatorioNotasFuturas: TdtmRelatorioNotasFuturas;

implementation

  Const
  // Filtros
  FiltroFilial      = ' and ( df.filialvenda in (%s)) ' + #13#10;
  FiltroGrupoFilial = ' and ( df.filialvenda in (Select filial ' + #13#10 +
                                               'From filiaisgruposfiliais fgf ' + #13#10 +
                                               'Where fgf.grupo in (%s))) ';

  WhereBaseCP          = 24;
  WhereCPFilial        = WhereBaseCP + 1;
  WhereCPGrupoFilial   = WhereBaseCP + 2;
  WhereCPItensProdutos = WhereBaseCP + 4;
  WhereCPProdutos      = WhereBaseCP + 5;
  WhereCPGrupos        = WhereBaseCP + 6;
  WhereCPClasse        = WhereBaseCP + 7;

{$R *.dfm}

procedure TdtmRelatorioNotasFuturas.AbreTabelaPesquisa(
  TipoPesquisa: TtecRelatorioVendas);
begin
  case TipoPesquisa of
    rvFILIAIS         : abre(ctVendaTabelaConsultaFiliais);
    rvGRUPOFILIAIS    : abre(ctVendaTabelaConsultaGrupoFiliais);
    rvITEMPRODUTOS    : begin
                          qryConsultaItemProdutos.Sql[03]:= 'Where (p.codigo = 0)';
                          qryConsultaItemProdutos.Open;
                        end;
    rvPRODUTOS        : begin
                          qryConsultaProdutos.Sql[03]:= 'Where (c.codigo = 0)';
                          qryConsultaProdutos.Open;
                        end;
    rvGRUPOPRODUTOS   : abre(ctVendaTabelaConsultaGrupoProdutos);
    rvCLASSES         : abre(ctVendaTabelaConsultaClasses);
    rvFORNECEDORES    : abre(ctVendaTabelaConsultaFornecedores)
  end;

end;

constructor TdtmRelatorioNotasFuturas.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Tag                :=ctTabelas;
  qryGrupoFiliais.Tag           :=ctTabelas;
  qryItemProdutos.Tag           :=ctTabelas;
  qryprodutos.Tag               :=ctTabelas;
  qryGrupoProdutos.Tag          :=ctTabelas;
  qryClasses.Tag                :=ctTabelas;
  qryFornecedores.Tag           :=ctTabelas;
  qryConsultaItemProdutos.Tag   :=ctVendaTabelaConsultaItemProdutos;
  qryConsultaProdutos.Tag       :=ctVendaTabelaConsultaProdutos;
  qryconsultaGrupoProdutos.Tag  :=ctVendaTabelaConsultaGrupoProdutos;
  qryConsultaClasses.Tag        :=ctVendaTabelaConsultaClasses;
  qryConsultaFornecedores.Tag   :=ctVendaTabelaConsultaFornecedores;
end;

function TdtmRelatorioNotasFuturas.ExisteClasses(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultaClasses, campo, codigo)
end;

function TdtmRelatorioNotasFuturas.ExisteFornecedor(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultaFornecedores, campo, codigo)
end;

function TdtmRelatorioNotasFuturas.ExisteGrupoProdutos(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultaGrupoProdutos, campo, codigo)
end;

function TdtmRelatorioNotasFuturas.ExisteItemProdutos(campo, codigo: string): boolean;
const
  SQL = 'Where (to_ascii(p.%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  qryConsultaItemProdutos.Sql[03]:= Format(SQL, [Campo, Codigo, '%']);
  qryConsultaItemProdutos.Open;
  Result := (qryConsultaItemProdutos.RecordCount > 0);
end;

function TdtmRelatorioNotasFuturas.ExisteProdutos(campo, codigo: string): boolean;
const
  SQL = 'Where (Maiusculo(c.%s) ilike Maiusculo(''%s%s''))';
begin
  qryConsultaProdutos.Sql[03]:= Format(SQL, [Campo, Codigo, '%']);
  qryConsultaProdutos.Open;
  Result := (qryConsultaProdutos.RecordCount > 0);
end;

procedure TdtmRelatorioNotasFuturas.FechaTabelaPesquisa(
  TipoPesquisa: TtecRElatorioVendas);
begin
  case TipoPesquisa of
    rvFILIAIS         : Fecha(ctVendaTabelaConsultaFiliais);
    rvGRUPOFILIAIS    : Fecha(ctVendaTabelaConsultaGrupoFiliais);
    rvITEMPRODUTOS    : Fecha(ctVendaTabelaConsultaItemProdutos);
    rvPRODUTOS        : Fecha(ctVendaTabelaConsultaProdutos);
    rvGRUPOPRODUTOS   : Fecha(ctVendaTabelaConsultaGrupoProdutos);
    rvCLASSES         : Fecha(ctVendaTabelaConsultaclasses);
    rvFORNECEDORES    : Fecha(ctVendaTabelaConsultaFornecedores);
  end;

end;

function TdtmRelatorioNotasFuturas.GetConsultaClasses: TtecQuery;
begin
  result := qryConsultaClasses;
end;

function TdtmRelatorioNotasFuturas.GetConsultaFornecedores: TtecQuery;
begin
    result := qryConsultaFornecedores;
end;

function TdtmRelatorioNotasFuturas.GetConsultaGrupoProdutos: TtecQuery;
begin
  result := qryConsultaGrupoProdutos;
end;

function TdtmRelatorioNotasFuturas.GetConsultaItemProdutos: TtecQuery;
begin
  result := qryConsultaItemProdutos;
end;

function TdtmRelatorioNotasFuturas.GetConsultaProdutos: TtecQuery;
begin
  result := qryConsultaProdutos;
end;

procedure TdtmRelatorioNotasFuturas.ImprimirRelatorio;
begin
  ImprimirRelatoriofast('RELATORIO DE NOTAS FISCAIS FUTURAS', FParametroCabecalho, MSimples, 0, [frpNotasFuturas], false, self);
end;

procedure TdtmRelatorioNotasFuturas.Selecionar(
  TipoPesquisa: TtecRelatorioVendas);
begin
  case TipoPesquisa of
  rvITEMPRODUTOS    : RefazConsulta(qryitemProdutos, [0], [qryConsultaItemProdutoscodigo.AsVariant]);
  rvPRODUTOS        : RefazConsulta(qryProdutos, [0], [qryConsultaProdutoscodigo.AsVariant]);
  rvGRUPOPRODUTOS   : RefazConsulta(qryGrupoProdutos, [0], [qryConsultaGrupoProdutoscodigo.AsVariant]);
  rvCLASSES         : RefazConsulta(qryClasses, [0], [qryConsultaClassescodigo.AsVariant]);
  rvFORNECEDORES    : RefazConsulta(qryFornecedores, [0],[qryConsultaFornecedorescodigo.AsVariant]);
  end;
end;

procedure TdtmRelatorioNotasFuturas.SetClasseProdutos(const Value: String);
begin
  if (value <> '') then begin
    qryNotasFuturas.Sql[WhereCPClasse]:= ' and pdf.produto in (select codigo '+
                                                              'from produtos p join caracteristicas c on p.caracteristica = c.codigo '+
                                                              'where c.classe = ' + QuotedStr(Value)+')';
    FParametroCabecalho:= FParametroCabecalho + ' Classe: ' + Value;
  end
  else qryNotasFuturas.Sql[WhereCPClasse]:= '';
end;

procedure TdtmRelatorioNotasFuturas.SetFiliais(const Value: String);
begin
  if value <> '' then  qrynotasfuturas.Sql[WhereCPFilial]:= Format(FiltroFilial,[Value])
  else                 qryNotasFuturas.Sql[WhereCPFilial]:= '';
end;

procedure TdtmRelatorioNotasFuturas.SetGrupoFiliais(const Value: String);
begin
  if value <> '' then qrynotasfuturas.Sql[WhereCPGrupoFilial]:= Format(FiltroGrupoFilial,[Value])
  else                qrynotasfuturas.Sql[WhereCPGrupoFilial]:= '';
end;

procedure TdtmRelatorioNotasFuturas.SetGrupoProdutos(const Value: String);
begin
  if (value <> '') then begin
    qryNotasFuturas.Sql[WhereCPGrupos]:= ' and pdf.produto in (select codigo '+
                                                              'from produtos p join caracteristicas c on p.caracteristica = c.codigo '+
                                                              'where c.grupo = ' + QuotedStr(Value)+')';
    FParametroCabecalho:= FParametroCabecalho + ' Grupo de Produto: ' + Value;
  end
  else qryNotasFuturas.Sql[WhereCPGrupos]:= '';
end;

procedure TdtmRelatorioNotasFuturas.SetItemProdutos(const Value: String);
begin
 if (Value <> '') then begin
   qryNotasFuturas.Sql[WhereCPItensProdutos]:= ' and (pdf.produto = ' + Value + ')';
   FParametroCabecalho:= FParametroCabecalho + ' Item de produto: ' + Value;
 end
 else qryNotasFuturas.Sql[WhereCPItensProdutos]:= '';
end;

procedure TdtmRelatorioNotasFuturas.SetProdutos(const Value: String);
begin
  if (value <> '') then begin
    qryNotasFuturas.Sql[WhereCPProdutos]:= ' and pdf.produto in (select p.codigo '+
                                                                'from produtos p join caracteristicas c on p.caracteristica = c.codigo '+
                                                                'where c.caracteristica = ' + Value +')';
    FParametroCabecalho:= FParametroCabecalho + ' Produto: ' + Value;
  end
  else qryNotasFuturas.Sql[WhereCPProdutos]:= '';
end;

procedure TdtmRelatorioNotasFuturas.frpProdutosPendentesBeforePrint(Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
    if FileExists(LogotipoFilialBase) then
      try
        TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase)
      except
      end;
end;

function TdtmRelatorioNotasFuturas.GetListaFiliais: TStrings;
begin
  FListaFiliais:= TStringList.Create;
  qryFiliais.Open;
  while not qryFiliais.Eof do
  begin
    FListaFiliais.AddObject(qryFiliaisnome.AsString, Pointer(qryFiliaiscodigo.AsInteger));
    qryFiliais.Next;
  end;
  qryFiliais.Close;
  Result := FListaFiliais;
end;

function TdtmRelatorioNotasFuturas.GetListaGruposFiliais: TStrings;
begin
  FListaGruposFiliais:= TStringList.Create;
  qryGrupoFiliais.Open;
  while not qryGrupoFiliais.Eof do
  begin
    FListaGruposFiliais.AddObject(qryGrupoFiliaisdescricao.AsString, Pointer(qryGrupoFiliaiscodigo.AsInteger));
    qryGrupoFiliais.Next;
  end;
  qryGrupoFiliais.Close;
  Result := FListaGruposFiliais;
end;

procedure TdtmRelatorioNotasFuturas.MontarFiltroFiliais(Usar: TCheckListBox);
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
  Filiais := STRFiliais;
  if Trim(STRFiliais) <> '' then
    if not TodasFiliais then
      FParametroCabecalho:=FParametroCabecalho+' Filiais: '+STRFiliais
    else
      Filiais := '';
end;

procedure TdtmRelatorioNotasFuturas.MontarFiltroGrupoFiliais(Usar: TCheckListBox);
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
  GrupoFiliais:=STRGruposFiliais;
  if Trim(STRGruposFiliais) <> '' then
   if not TodosGrupos then
    FParametroCabecalho:=FParametroCabecalho+' Grupo de Filiais: '+STRGruposFiliais
   else
    GrupoFiliais:='';
end;

procedure TdtmRelatorioNotasFuturas.qryConsultaItemProdutosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaItemProdutosvalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaItemProdutosvalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

procedure TdtmRelatorioNotasFuturas.SetDataFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
  begin
    FDataFinal := Value;
    if DataEmBranco(FDataInicial) then
      FDataInicial:=FDataFinal;
  end
  else
   FDataFinal := FDataInicial;
  FParametroCabecalho:='Entre: '+FDataInicial+' e '+FDataFinal;
end;

procedure TdtmRelatorioNotasFuturas.SetDataInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
    FDataInicial := Value;
end;

function TdtmRelatorioNotasFuturas.abrirconsultanotaspendentes: boolean;
begin
  ReFazConsulta(qryNotasFuturas,[0,1],[fdatainicial,fdatafinal]);
  result := not qrynotasfuturas.isempty;
end;

procedure TdtmRelatorioNotasFuturas.qryNotasFuturasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryNotasFuturasTotalVenda.AsCurrency := qryNotasFuturasquantidade.Ascurrency *
                                          qryNotasFuturasprecovenda.AsCurrency;
end;

end.
