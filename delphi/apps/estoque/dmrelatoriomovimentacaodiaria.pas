unit dmrelatoriomovimentacaodiaria;

interface

uses
  SysUtils, Classes, Forms, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, biblio, dmtecsoft, FR_DSet, FR_DBSet, FR_Class,
  clparametrossistema,fmpreviewpadrao,inifiles,Dialogs,CheckLst,Graphics,
  ZTransact, variants, frxClass, frx2xto30;

type
  ttecTiposMovimentacoes = (Todas, SomenteAvulsas, SemAvulsas);

type
  TdtmRelatorioMovimentacaoDiaria = class(TdtmBasico)
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryMovimentos: TtecQuery;
    qryMovimentosfilial: TIntegerField;
    qryMovimentosreferencia: TStringField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosemestoque: TFloatField;
    qryMovimentosdescricaoproduto: TStringField;
    qryMovimentoslocalizacao: TStringField;
    frpRelatorioMovimentacaoDiaria: TfrReport;
    fdsRelatorioMovimentacaoDiaria: TfrDBDataSet;
    qryMovimentosreferenciaproduto: TLargeintField;
    dsrProcuraMovimentacao: TtecDataSource;
    qryConsultaTiposMovimentos: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaTiposMovimentosdescricao: TStringField;
    qryConsultaTiposMovimentoscodigo: TStringField;
    qryGrupoFiliais: TtecQuery;
    qryGrupoFiliaiscodigo: TIntegerField;
    qryGrupoFiliaisdescricao: TStringField;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryMovimentosvalor: TFloatField;
    qryMovimentosfinanceiro: TFloatField;
    qryMovimentosprecocomicms: TFloatField;
    qryMovimentosclientefornecedor: TStringField;
    qryMovimentosdata: TDateField;
    qryMovimentosnomegrupofilial: TStringField;
    qryMovimentoscodigogrupofilial: TIntegerField;
    qryMovimentoscodigocaracteristica: TLargeintField;
    qryMovimentosdescricaocaracteristica: TStringField;
    qryMovimentosdescricaomovimento: TStringField;
    qryMovimentosResumo: TtecQuery;
    frpRelatorioMovimentacaoDiariaResumo: TfrReport;
    fdsRelatorioMovimentacaoDiariaResumo: TfrDBDataSet;
    qryMovimentosResumocodigogrupofilial: TIntegerField;
    qryMovimentosResumonomegrupofilial: TStringField;
    qryMovimentosResumofilial: TIntegerField;
    qryMovimentosResumotipomovimento: TStringField;
    qryMovimentosResumodescricaomovimento: TStringField;
    qryMovimentosResumoentradaousaida: TMemoField;
    qryMovimentosResumovalor: TFloatField;
    qryMovimentosResumoquantidade: TFloatField;
    qryMovimentosResumonomefilial: TStringField;
    qryMovimentosResumooperacao: TStringField;
    qryMovimentosResumoSaldoInicial: TtecQuery;
    qryMovimentosResumoRepositorio: TtecQuery;
    qryMovimentosnomefilial: TStringField;
    qryMovimentosgrupoproduto: TStringField;
    qryMovimentosdescricaogrupoproduto: TStringField;
    qryMovimentosdescricaopreco: TStringField;
    qryMovimentosreferenciaprodutovisual: TStringField;
    qryMovimentoscodigocaracteristicavisual: TStringField;
    qryMovimentosprocessamento: TDateTimeField;
    frxReport1: TfrxReport;
    procedure frpRelatorioMovimentacaoDiariaBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure DataModuleCreate(Sender: TObject);
    procedure frpRelatorioMovimentacaoDiariaResumoBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure CarregarModulos(NaoCarregar: array of string);
  private
    FDataInicial: String;
    FDataFinal: String;
    FParametroCabecalho: String;
    FTipoMovimento: String;
    FListaFiliais: TStringList;
    FListaGruposFiliais: TStringList;
    FListaMovimentos: TStringList;
    FListaIMovimentos: TStringList;
    FFilial: String;
    FGrupoFilial: String;
    FMovimentos: String;
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FAgruparProduto: Boolean;
    FAgruparData: Boolean;
    FAgruparMovimento: Boolean;
    FResumo: integer;
    FSaldoInicial: boolean;
    TodosMovimentos: boolean;
    FMovimentosaMarcar: TStringList;
    FGrupoProdutos: String;
    FAgruparGrupoProduto: Boolean;
    FNomedoPreco: boolean;
    fTiposMovimentacoes: ttecTiposMovimentacoes;
    FDataInicialProcessamento: String;
    FDataFinalProcessamento: String;
    function GetListaFiliais: TStrings;
    function GetListaGruposFiliais: TStringList;
    function GetListaMovimentos: TStringList;
    procedure SetDataFinalProcessamento(const Value: String);
  protected
    function  GetConsultarMovimento: TTecQuery;
    function  GetConsultarFilial: TtecQuery;
    procedure SetOrdenacao(const Value: Integer);
    procedure SetDataFinal(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecPesquisa);
    function  TodosMovimentosMarcados: Boolean;
    function  ExisteFilial(Campo, Codigo: string): Boolean;
    function  ExisteTipoMovimento(Campo, Codigo: string): Boolean;
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecPesquisa);
    function  GerarRelatorio: Boolean;
    procedure Selecionar(TipoPesquisa: TTecPesquisa);
    property ConsultarMovimento: TTecQuery read GetConsultarMovimento;
    property ConsultarFilial: TtecQuery read GetConsultarFilial;
    property DataInicial: String read FDataInicial write FDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;

    property DataInicialProcessamento: String read FDataInicialProcessamento write FDataInicialProcessamento;
    property DataFinalProcessamento: String read FDataFinalProcessamento write SetDataFinalProcessamento;


    property Ordenacao: Integer write SetOrdenacao;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property MovimentosaMarcar: TStringList read FMovimentosaMarcar write FMovimentosaMarcar;
    procedure ImprimirRelatorio;
    property ListaFiliais: TStrings read GetListaFiliais;
    property ListaGruposFiliais: TStringLIst read GetListaGruposFiliais;
    property ListaMovimentos: TStringList read GetListaMovimentos write FListaMovimentos;
    procedure MontarFiltroFiliais(Usar: TCheckListBox);
    procedure MontarFiltroGrupoFiliais(Usar: TCheckListBox);
    procedure MontarFiltroTiposMovimentos(Usar: TCheckListBox);
    property Filial: String read FFilial write  FFilial;
    property GrupoFilial: String read FGrupoFilial write FGrupoFilial;
    property GrupoProdutos: String read FGrupoProdutos write FGrupoProdutos;
    property Movimentos: String read FMovimentos write FMovimentos;
    property AgruparMovimento: Boolean read FAgruparMovimento write FAgruparMovimento;
    property AgruparData: Boolean read FAgruparData write FAgruparData;
    property AgruparGrupoProduto: Boolean read FAgruparGrupoProduto write FAgruparGrupoProduto;
    property AgruparProduto: Boolean read FAgruparProduto write FAgruparProduto;
    property AgruparGrupoFilial: Boolean read FAgruparGrupoFilial write FAgruparGrupoFilial;
    property AgruparFilial: Boolean read FAgruparFilial write FAgruparFilial;
    procedure DefineOrdenacao;
    property Resumo: integer read FResumo write FResumo;
    property SaldoInicial: boolean read FSaldoInicial write FSaldoInicial;
    property NomedoPreco: boolean read FNomedoPreco write FNomedoPreco;
    procedure MovimentosResumoSql;
    function LerArquivoCFG: Boolean;
    property TiposMovimentacoes: ttecTiposMovimentacoes read fTiposMovimentacoes write fTiposMovimentacoes;

    function CarregarMovimentos(Movimentos: TStringList): Boolean;
    function MarcarMovimentos: TStringList;
  end;

var
  dtmRelatorioMovimentacaoDiaria: TdtmRelatorioMovimentacaoDiaria;
  implementation

var
  ListarMovimentos: TStringList = nil;
  MovimentacaoCarregada: TStringList = nil;
  lstMov: TStringList = nil;
{$R *.dfm}

{ TdtmRelatorioMovimentacaoDiaria }


constructor TdtmRelatorioMovimentacaoDiaria.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaFiliais.Tag     := ctConsultaFiliais;
  qryConsultaTiposMovimentos.Tag  := ctConsultaTiposMovimentos;
end;

procedure TdtmRelatorioMovimentacaoDiaria.AbreTabelaPesquisa(
TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
   pesFILIAIS: Abre(ctConsultaFiliais);
   pesTIPOMOVIMENTOS : Abre(ctConsultaTiposMovimentos);
  end;
end;

function TdtmRelatorioMovimentacaoDiaria.ExisteFilial(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

procedure TdtmRelatorioMovimentacaoDiaria.FechaTabelaPesquisa(
TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
   pesFILIAIS: Fecha(ctConsultaFiliais);
   pesTIPOMOVIMENTOS : Fecha(ctConsultaTiposMovimentos);
  end;
end;

function TdtmRelatorioMovimentacaoDiaria.GerarRelatorio: Boolean;
var
i:integer;
Listar: TStringList;
begin

  if (FSaldoInicial and TodosMovimentosMarcados) then
  begin
    qryMovimentosResumo.Sql.Text:= ';('+Copy(qryMovimentosResumo.Sql.Text,2,length(qryMovimentosResumo.Sql.Text)-1)+') UNION ALL ('+qryMovimentosResumoSaldoInicial.Sql.Text+') ORDER BY codigogrupofilial,filial,entradaousaida,tipomovimento';
    qryMovimentosResumo.ParamByName('datainicial').AsString:=FDataInicial;
  end;

  if not TodosMovimentosMarcados then
  begin
    qryMovimentos.macrobyname('Movimentos').AsString := ' AND m.tipomovimento IN ('+FMovimentos+')';
    qryMovimentosResumo.macrobyname('Movimentos').AsString := ' AND m.tipomovimento IN ('+FMovimentos+')';
  end
  else
  begin
    qryMovimentos.macrobyname('Movimentos').AsString := '';
    qryMovimentosResumo.macrobyname('Movimentos').AsString := '';
  end;

  if (FFilial<>'') then
  begin
     qryMovimentos.macrobyname('Filiais').AsString := ' and m.filial IN ('+FFilial+')';
     qryMovimentosResumo.macrobyname('Filiais').AsString := ' and m.filial IN ('+FFilial+')';
  end
  else
  begin
     qryMovimentos.macrobyname('Filiais').AsString := '';
     qryMovimentosResumo.macrobyname('Filiais').AsString := '';
  end;

  if (GrupoProdutos<>'') then
  begin
     qryMovimentos.macrobyname('Grupos').AsString := ' and c.grupo IN ('+GrupoProdutos+')';
     qryMovimentosResumo.macrobyname('Grupos').AsString := ' and c.grupo IN ('+GrupoProdutos+')';
  end
  else
  begin
     qryMovimentos.macrobyname('Grupos').AsString := '';
     qryMovimentosResumo.macrobyname('Grupos').AsString := '';
  end;

  case TiposMovimentacoes of
    Todas:
    begin
      qryMovimentos.macrobyname('TiposMovimentos').AsString := '';
      qryMovimentosResumo.macrobyname('TiposMovimentos').AsString := '';
    end;
    SomenteAvulsas:
    begin
      qryMovimentos.macrobyname('TiposMovimentos').AsString := ' and not coalesce(tp.interno,false) ';
      qryMovimentosResumo.macrobyname('TiposMovimentos').AsString := ' and not coalesce(tp.interno,false) ';
      ParametroCabecalho := ParametroCabecalho + ' Somente Movimentações Internas ';
    end;
    SemAvulsas:
    begin
      qryMovimentos.macrobyname('TiposMovimentos').AsString := ' and coalesce(tp.interno,false) ';
      qryMovimentosResumo.macrobyname('TiposMovimentos').AsString := ' and coalesce(tp.interno,false) ';
      ParametroCabecalho := ParametroCabecalho + ' Sem Movimentações Internas ';
    end;
  end;

  //qryMovimentosResumo.Sql.SaveToFile('/home/jr/Desktop/Resumotec.sql');
  if (FResumo<>2) then //se não for só resumo
    ReFazConsulta(qryMovimentos,[],[]);
  if (FResumo<>0) then //se não for sem resumo
    RefazConsulta(qryMovimentosResumo,[],[]);

  Result:= not (qryMovimentos.IsEmpty and qryMovimentosResumo.IsEmpty);
end;

function TdtmRelatorioMovimentacaoDiaria.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

procedure TdtmRelatorioMovimentacaoDiaria.ImprimirRelatorio;
begin
  frVariables['ExibirDescricaoPreco']   := NomedoPreco;
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['outras']:= ParametroCabecalho;
  frVariables['Titulo']:= 'MOVIMENTACAO DIARIA DO ESTOQUE';
  frVariables['AgruparGrupoFilial']:=AgruparGrupoFilial;
  frVariables['AgruparFilial']:=AgruparFilial;
  frVariables['AgruparData']:=AgruparData;
  frVariables['AgruparMovimento']:=AgruparMovimento;
  frVariables['AgruparProduto']:=AgruparProduto;
  frVariables['AgruparGrupoProduto']:=AgruparGrupoProduto;

{
  frpRelatorioMovimentacaoDiaria.designreport;
  frxReport1.designreport;
  frpRelatorioMovimentacaoDiariaResumo.DesignReport;
  frxReport1.designreport;
  }  


  case FResumo of
    0: ImprimirRelatoriofast(null, null, MPadrao, FResumo, [frpRelatorioMovimentacaoDiaria, frpRelatorioMovimentacaoDiariaResumo], false, self);
    1: ImprimirRelatoriofast(null, null, MSimples, 0, [frpRelatorioMovimentacaoDiaria], false, self);
    2: ImprimirRelatoriofast(null, null, MSimples, 0, [frpRelatorioMovimentacaoDiariaResumo], false, self);
  end;
end;

procedure TdtmRelatorioMovimentacaoDiaria.Selecionar(
TipoPesquisa: TTecPesquisa);
begin

end;

procedure TdtmRelatorioMovimentacaoDiaria.SetOrdenacao(const Value: Integer);
var
 Ordenacao : String;
 OrdenacaoResumo: String;
begin
  ordenacao:='';
  if AgruparGrupoFilial then
    Ordenacao:=Ordenacao+', nomegrupofilial, codigogrupofilial ';

  if AgruparFilial then
    Ordenacao:=Ordenacao+', nomefilial, filial ';

  //RESUMO SO NAO TEM AGRUPAMENTO POR MOVIMENTOS, PRODUTO OU DATA
  OrdenacaoResumo:=Ordenacao + ', entradaousaida,tipomovimento';
  qryMovimentosResumo.macrobyname('Ordenacao').AsString := 'ORDER BY '+copy(OrdenacaoResumo,2,length(OrdenacaoResumo)-1);

  if AgruparData then
    Ordenacao := Ordenacao+', cast(data as date)';

  if AgruparGrupoProduto then
    Ordenacao := Ordenacao+', grupoproduto, descricaogrupoproduto';

  if AgruparMovimento then
    Ordenacao := Ordenacao+', tipomovimento';

  if AgruparProduto then
    Ordenacao:=Ordenacao+', descricaocaracteristica, codigocaracteristica';

  case Value of
    0: Ordenacao:= Ordenacao + ', referenciaproduto, descricaoproduto, m.data, m.tipomovimento';
    1: Ordenacao:= Ordenacao + ', descricaoproduto, referenciaproduto, m.data, m.tipomovimento';
    2: Ordenacao:= Ordenacao + ', m.tipomovimento, m.data, descricaoproduto, referenciaproduto';
    3: Ordenacao:= Ordenacao + ', e.localizacao, m.produto, m.numero';
  end;

  qryMovimentos.macrobyname('Ordenacao').asstring := 'Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
end;

procedure TdtmRelatorioMovimentacaoDiaria.SetDataFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
  begin
    FDataFinal := Value;
    if DataEmBranco(FDataInicial) then
     FDataInicial:=FDataFinal;
  end
  else FDataFinal := FDataInicial;

  if Value <> '' then
  begin
   qryMovimentos.MacroByName('Periodo').AsString := 'and (m.data  >= ' + quotedstr(FDataInicial) +
                                                    ') and (m.data < timestamp' + quotedstr(FDataFinal) + ' + ''1 day'')';

   qryMovimentosResumo.MacroByName('Periodo').AsString := 'WHERE (m.data  >= ' + quotedstr(FDataInicial) +
                                     ') and (m.data < timestamp' + quotedstr(FDataFinal) + ' + ''1 day'')';

   FParametroCabecalho := FParametroCabecalho+' Entre: '+FDataInicial+' e '+FDataFinal;
  end
  else
  begin
   qryMovimentos.MacroByName('Periodo').AsString := '';
   qryMovimentosResumo.MacroByName('Periodo').AsString :='';
  end;
end;

procedure TdtmRelatorioMovimentacaoDiaria.frpRelatorioMovimentacaoDiariaBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if View.Name = 'fpvLogo' then
  begin
   if FileExists(LogotipoFilialBase) then
     try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
  end
  else
  if TColor(strtoint(parsistema.CorZebradoRelatorio))<>TColor(clnone) then
   if (View.Name = 'mmoZebrado') then
    if (frpRelatorioMovimentacaoDiaria.Dictionary.Variables.Variable['LINHA'] MOD 2)=0 then
      frpRelatorioMovimentacaoDiaria.FindObject('mmoZebrado').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio))
    else
      frpRelatorioMovimentacaoDiaria.FindObject('mmoZebrado').FillColor := clnone;
end;

function TdtmRelatorioMovimentacaoDiaria.GetConsultarMovimento: TTecQuery;
begin
  Result := qryConsultaTiposMovimentos;
end;

procedure TdtmRelatorioMovimentacaoDiaria.DataModuleCreate(
  Sender: TObject);
begin
  inherited;
  FTipoMovimento := '';
end;

function TdtmRelatorioMovimentacaoDiaria.ExisteTipoMovimento(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaTiposMovimentos, Campo, Codigo);
end;

function TdtmRelatorioMovimentacaoDiaria.GetListaFiliais: TStrings;
begin
  FListaFiliais:= TStringList.Create;
  qryFiliais.Open;
  while not qryFiliais.Eof do
  begin
    FListaFiliais.AddObject(format('%3s',[qryFiliaiscodigo.AsString])+'.'+qryFiliaisnome.AsString, Pointer(qryFiliaiscodigo.AsInteger));
    qryFiliais.Next;
  end;
  qryFiliais.Close;
  Result := FListaFiliais;
end;

function TdtmRelatorioMovimentacaoDiaria.GetListaGruposFiliais: TStringList;
begin
  FListaGruposFiliais:= TStringList.Create;
  qryGrupoFiliais.Open;
  while not qryGrupoFiliais.Eof do
  begin
    FListaGruposFiliais.AddObject(format('%2s',[qryGrupoFiliaiscodigo.asstring])+'.'+qryGrupoFiliaisdescricao.AsString, Pointer(qryGrupoFiliaiscodigo.AsInteger));
    qryGrupoFiliais.Next;
  end;
  qryGrupoFiliais.Close;
  Result := FListaGruposFiliais;
end;

function TdtmRelatorioMovimentacaoDiaria.GetListaMovimentos: TStringLIst;
begin
  FListaMovimentos:= TStringList.Create;
  FListaIMovimentos:=TStringList.Create;
  qryConsultaTiposMovimentos.Open;
  while not qryConsultaTiposMovimentos.Eof do
  begin
    FListaMovimentos.Add(qryConsultaTiposMovimentoscodigo.AsString+' - '+qryConsultaTiposMovimentosdescricao.AsString);
    FListaIMovimentos.Add(qryConsultaTiposMovimentoscodigo.AsString);
    qryConsultaTiposMovimentos.Next;
  end;
  qryConsultaTiposMovimentos.Close;
  Result := FListaMovimentos;
end;

procedure TdtmRelatorioMovimentacaoDiaria.MontarFiltroFiliais(Usar: TCheckListBox);
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

procedure TdtmRelatorioMovimentacaoDiaria.MontarFiltroGrupoFiliais(Usar: TCheckListBox);
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

procedure TdtmRelatorioMovimentacaoDiaria.MontarFiltroTiposMovimentos(Usar: TCheckListBox);
var
  STRMovimentos: String;
  cnt: Integer;
begin
  STRMovimentos := '';
  TodosMovimentos := True;
  for cnt := 0 to FListaMovimentos.Count - 1 do
    if Usar.Checked[cnt] then
      STRMovimentos := STRMovimentos + '''' + FListaIMovimentos[cnt] + ''','
    else
      TodosMovimentos := False;
  STRMovimentos := Copy(STRMovimentos, 0, Length(STRMovimentos) - 1);
  Movimentos:=STRMovimentos;
end;

procedure TdtmRelatorioMovimentacaoDiaria.DefineOrdenacao;
begin

end;

procedure TdtmRelatorioMovimentacaoDiaria.frpRelatorioMovimentacaoDiariaResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if View.Name = 'fpvLogo' then
  begin
   if FileExists(LogotipoFilialBase) then
     try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
  end
  else
  if TColor(strtoint(parsistema.CorZebradoRelatorio))<>TColor(clnone) then
   if (View.Name = 'mmoZebrado') then
    if (frpRelatorioMovimentacaoDiariaResumo.Dictionary.Variables.Variable['LINHA'] MOD 2)=0 then
      frpRelatorioMovimentacaoDiariaResumo.FindObject('mmoZebrado').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio))
    else
      frpRelatorioMovimentacaoDiariaResumo.FindObject('mmoZebrado').FillColor := clnone;

end;

function TdtmRelatorioMovimentacaoDiaria.TodosMovimentosMarcados: Boolean;
begin
  Result:=(TodosMovimentos) or (FMovimentos='');
end;

procedure TdtmRelatorioMovimentacaoDiaria.MovimentosResumoSql;
begin
    qryMovimentosResumo.Sql.Text:=';'+qryMovimentosResumoRepositorio.Sql.Text;
end;


function TdtmRelatorioMovimentacaoDiaria.LerArquivoCFG: Boolean;
var
  ArquivoCFG: TIniFile;
  PosSeparador: Integer;
  Movimentos: TStringList;
  Barra: String;
begin
{$IFDEF LINUX}
  Barra := '/';
{$ELSE }
  Barra := '\';
{$ENDIF}
  if ParamCount >= 1 then
    NomeArquivoCFG := ParamStr(1) + Barra + ctNomeArquivoCFG
  else
    NomeArquivoCFG := ExtractFilePath(Application.ExeName)+ ctNomeArquivoCFG;

  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
{$IFDEF LINUX}
      ArquivoCFG.CaseSensitive := False;
{$ENDIF}
      Movimentos := TStringList.Create;
      try
        if not ArquivoCFG.SectionExists(MovimentacaoSection) then
        begin
          ArquivoCFG.WriteString(MovimentacaoSection,'Movimentos','');
          ArquivoCFG.UpdateFile;
        end;
        ArquivoCFG.ReadSectionValues(MovimentacaoSection, Movimentos);
        if Not CarregarMovimentos(Movimentos) then
          MensagemErro(Format(ctERROTECSOFTLOCAL, [ANSIUpperCase(NomeArquivoCFG)]));
      finally
        Movimentos.Free;
      end;
    finally
      ArquivoCFG.Free
    end;
  end
  else
  begin
    MensagemErro(Format(ctERRORARQUIVOCFGNAOENCONTRADO, [NomeArquivoCFG]));
    Result := False
  end;
end;


function TdtmRelatorioMovimentacaoDiaria.CarregarMovimentos(
  Movimentos: TStringList): Boolean;
var
  a, Poschar: Integer;
  Movimento, strMovimentos: String;
begin
  Result := True;
  ListarMovimentos := TStringList.Create;
  for a := 0 to Movimentos.Count - 1 do
  begin
    strMovimentos := Movimentos[a];
    Poschar := Pos('=', strMovimentos);
    Movimento := Copy(strMovimentos, 1, Poschar - 1);
    delete(strMovimentos, 1, Poschar);
    lstMov := TStringList.Create;
    while strMovimentos <> '' do
    begin
      Poschar := Pos(',', strMovimentos);
      if Poschar = 0 then
      begin
        lstMov.Add(strMovimentos);
        strMovimentos := ''
      end
      else
      begin
        lstMov.Add(Trim(Copy(strMovimentos, 1, Poschar - 1)));
        Delete(strMovimentos, 1, Poschar);
      end
    end;
    ListarMovimentos.AddObject(Movimento, lstMov)
  end;
  if ListarMovimentos.IndexOf(strMovimentacao) = -1 then
  begin
    Result := False;
    ListarMovimentos.AddObject(strMovimentacao, TStringList.Create)
  end;
end;
procedure TdtmRelatorioMovimentacaoDiaria.CarregarModulos(NaoCarregar: array of string);
var
  a: Integer;
  lstMovimentos: TStringList;
begin
  lstMovimentos := TStringList(ListarMovimentos.Objects[ListarMovimentos.IndexOf(strMovimentacao)]);
  MovimentacaoCarregada.Clear;
  for a:= 0 to lstMovimentos.Count -1 do
    MovimentacaoCarregada.Add(lstMovimentos[a]);
end;

function TdtmRelatorioMovimentacaoDiaria.MarcarMovimentos: TStringList;
var
  cnt,cnm: Integer;
begin
  FMovimentosaMarcar:= TStringList.Create;
  TodosMovimentos := True;
  for cnt:= 0 to lstMov.Count - 1 do
  begin
    for cnm:= 0 to FListaMovimentos.count -1 do
    begin
      if lstMov.Strings[cnt]= Copy(FListaMovimentos.Strings[cnm],1,3) then
      begin
        FMovimentosaMarcar.Add(inttostr(cnm));
      end
      else
      TodosMovimentos := False;
    end;
  end;
  Result:= FMovimentosaMarcar;
end;

procedure TdtmRelatorioMovimentacaoDiaria.SetDataFinalProcessamento(
  const Value: String);
begin
  FDataFinalProcessamento := Value;

  if not DataEmBranco(Value) then
  begin
    if DataEmBranco(FDataInicialProcessamento) then
     FDataInicialProcessamento:=FDataFinalProcessamento;
  end
  else FDataFinalProcessamento := FDataInicialProcessamento;

  if (FDataFinalProcessamento<>'') and
     (FDataInicialProcessamento<>'') then
  begin

   qryMovimentos.MacroByName('PeriodoProcessamento').AsString := 'and (cast(m.processamento as date)  >= ' + quotedstr(FDataInicialProcessamento) +
                                                    ') and (cast(m.processamento as date) < timestamp' + quotedstr(FDataFinalProcessamento) + ' + ''1 day'')';

   qryMovimentosResumo.MacroByName('PeriodoProcessamento').AsString := 'WHERE (cast(m.processamento as date)  >= ' + quotedstr(FDataInicialProcessamento) +
                                     ') and (cast(m.processamento as date) < timestamp' + quotedstr(FDataFinalProcessamento) + ' + ''1 day'')';

   FParametroCabecalho := FParametroCabecalho+' Processamento Entre: '+FDataInicialProcessamento+' e '+FDataFinalProcessamento;

  end
  else
  begin

   qryMovimentos.MacroByName('PeriodoProcessamento').AsString := '';
   qryMovimentosResumo.MacroByName('PeriodoProcessamento').AsString :='';

  end;

end;

end.
