unit dmexportacaodados;

interface

uses
  SysUtils, Classes, DB, ZQuery, ZPgSqlQuery, cptable, dmtecsoft, cpquery,
  dmbasico, cpdatasource, ctconstantes, ZTransact, Variants, biblio, Forms;

type
  TipoMovimento = (ParaCima, ParaBaixo);
type
  TdtmExportacaoDados = class(TdtmBasico)
    qryExportacaoTabelas: TtecQuery;
    qryExportacaoTabelascodigo: TIntegerField;
    qryExportacaoTabelasdescricao: TStringField;
    qryExportacao: TtecQuery;
    qryExportacaocodigo: TIntegerField;
    qryExportacaodescricao: TStringField;
    dsrExportacao: TtecDataSource;
    qryExportacaoModelos: TtecQuery;
    qryExportacaoModeloscodigoexportacao: TIntegerField;
    qryExportacaoModeloscodigotabela: TIntegerField;
    qryExportacaoModelosseparadorcampos: TStringField;
    qryExportacaoModelosnomearquivo: TStringField;
    dsrExportacaoModelos: TtecDataSource;
    qryExportacaoProximo: TtecQuery;
    qryExportacaoProximocodigo: TIntegerField;
    dsrExportacaoTabelas: TtecDataSource;
    qryExportacaoTabelasmarcar: TBooleanField;
    qryExportacaoTabelasConsulta: TtecQuery;
    qryExportacaoTabelassql: TStringField;
    qryExportacaoTabelaCampos: TtecQuery;
    qryExportacaoTabelaCamposnomecampo: TStringField;
    qryExportacaoTabelaCamposmascara: TStringField;
    qryExportacaoTabelaCamposdelimitador: TStringField;
    dsrExportacaoTabelaCampos: TtecDataSource;
    qryExportacaoCampos: TtecQuery;
    dsrExportacaoCampos: TtecDataSource;
    qryExportacaoCamposcodigoexportacao: TIntegerField;
    qryExportacaoCamposcodigotabela: TIntegerField;
    qryExportacaoCamposcampo: TStringField;
    qryExportacaoCamposmascara: TStringField;
    qryExportacaoCamposdelimitador: TStringField;
    qryExportacaoTabelaCampossequencia: TIntegerField;
    qryExportacaoCampostipo: TStringField;
    qryExportacaoCampostamanho: TIntegerField;
    qryExportacaoCamposdecimais: TIntegerField;
    qryExportacaoCamposcampocriado: TBooleanField;
    qryExportacaoTabelaCampostipo: TStringField;
    qryExportacaoTabelaCampostamanho: TIntegerField;
    qryExportacaoTabelaCamposdecimais: TIntegerField;
    qryExportacaoFiltros: TtecQuery;
    dsrExportacaoFiltros: TtecDataSource;
    qryExportacaoFiltroscodigoexportacao: TIntegerField;
    qryExportacaoFiltroscodigotabela: TIntegerField;
    qryExportacaoFiltroscodigofiltro: TIntegerField;
    qryExportacaoFiltrosdescricao: TStringField;
    qryFiltros: TtecQuery;
    dsrFiltros: TtecDataSource;
    qryFiltroscodigo: TIntegerField;
    qryFiltrosdescricao: TStringField;
    qryFiltrosmacro: TStringField;
    qryFiltrosexibir: TBooleanField;
    dsrExportacaoTabelasConsulta: TtecDataSource;
    qryExportacaoFiltrosmacro: TStringField;
    qryExportacaoDados: TtecQuery;
    dsrExportacaoDados: TtecDataSource;
    qryExportacaoModelosseparadordecimal: TStringField;
    qryExportacaoModelosseparadormilhar: TStringField;
    qrySeparadorCampos: TtecQuery;
    qrySeparadorCamposseparador: TStringField;
    qrySeparadorDecimal: TtecQuery;
    qrySeparadorDecimalseparador: TStringField;
    qrySeparadorMilhar: TtecQuery;
    qrySeparadorMilharseparador: TStringField;
    dsrSeparadorCampos: TtecDataSource;
    dsrSeparadorDecimal: TtecDataSource;
    dsrSeparadorMilhar: TtecDataSource;
    qryExportacaoCamposvalorpadrao: TStringField;
    qryParametrosSelecao: TtecQuery;
    qryFiltrossqlpadrao: TStringField;
    qryExportacaoFiltrossqldescricao: TStringField;
    qryExportacaoFiltrossql: TStringField;
    qryParametrosSelecaoformulario: TStringField;
    qryParametrosSelecaodata: TDateTimeField;
    qryParametrosSelecaochaveacesso_1: TStringField;
    qryParametrosSelecaochaveacesso_2: TStringField;
    qryParametrosSelecaointervalodatasformaselecao: TIntegerField;
    qryParametrosSelecaointervalodatasdatainicial: TDateField;
    qryParametrosSelecaointervalodatasdatafinal: TDateField;
    qryParametrosSelecaolistadefiliais: TStringField;
    qryParametrosSelecaolistadenaturezas: TStringField;
    qryParametrosSelecaolistadeseries: TStringField;
    qryParametrosSelecaolistadecodigosfiscais: TStringField;
    dsrParametrosSelecao: TtecDataSource;
    qryParametrosSelecaoextensao: TStringField;
    qryExportacaoCampossequencia: TIntegerField;
    qryParametrosSelecaogerararquivoporfilial: TBooleanField;
    procedure qryExportacaoAfterScroll(DataSet: TDataSet);
    procedure qryExportacaoTabelasAfterScroll(DataSet: TDataSet);
    procedure qryExportacaoCamposAfterScroll(DataSet: TDataSet);
    procedure qryExportacaoCamposBeforeInsert(DataSet: TDataSet);
    procedure qryExportacaoCamposNewRecord(DataSet: TDataSet);
    procedure qryExportacaoCamposAfterPost(DataSet: TDataSet);
    procedure qryExportacaoCamposAfterDelete(DataSet: TDataSet);
    procedure qryFiltrosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryExportacaoTabelasBeforeScroll(DataSet: TDataSet);
    procedure qryParametrosSelecaoCalcFields(DataSet: TDataSet);
    procedure qryExportacaoFiltrosBeforeDelete(DataSet: TDataSet);
    procedure qryExportacaoModelosNewRecord(DataSet: TDataSet);
    procedure qryExportacaoDadosProgress(Sender: TObject;
      Stage: TZProgressStage; Proc: TZProgressProc; Position, Max: Integer;
      var Cancel: Boolean);
  private
    FExtensao: String;
    function GetExtensao: String;
  private
    NroUltimaSequencia: integer;
    FExportacaoTabelasAfterScroll: TNotifyEvent;
    FExportacaoTabelasBeforeScroll: TNotifyEvent;
    fGerandoArquivoTexto: Boolean;
    FListadeFiliais: TStringList;
    FMostraProgresso: Boolean;
    FAbrirTodos: Boolean;
    function GetListaTabelas: TLista;
    function CodigoExportacao: Integer;
    procedure MarcarExportacaoTabelas;

    procedure FormatarCampo(Sender: TField;
      var Text: String; DisplayText: Boolean);
    property Extensao: String read GetExtensao write FExtensao;


    { Private declarations }
  public
    { Public declarations }
    FSalvarParametros : Boolean;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    property ExportacaoTabelasAfterScroll : TNotifyEvent read FExportacaoTabelasAfterScroll write FExportacaoTabelasAfterScroll;
    property ExportacaoTabelasBeforeScroll : TNotifyEvent read FExportacaoTabelasBeforeScroll write FExportacaoTabelasBeforeScroll;
    property ListaTabelas: TLista read GetListaTabelas;
    procedure IncluirExportacaoDados;
    procedure MoverCampos(Adicionar, Todos: Boolean); overload;
    procedure MoverCampos(Movimento : TipoMovimento); overload;
    procedure MoverFiltros(Adicionar, Todos: Boolean); overload;
    procedure MoverFiltros(Movimento : TipoMovimento); overload;
    procedure GravarExportacaoCampos;
    procedure CancelarExportacaoCampos;
    procedure MontarDados;
    procedure AbrirConsulta;
    procedure LimparParametrosSelecao;
    procedure SalvarIntervaloDatas(Tipo: Integer; DataInicial, DataFinal: tDateTime);
    procedure SalvarListadeCodigosFiscais(Lista: String);
    procedure SalvarListadeFiliais(Lista: String);
    procedure SalvarListaSeriesFiliais(Lista: String);
    procedure SalvarListaNaturezas(Lista: String);
    function GravarExportacao: boolean;
    procedure EditarExportacao;
    function ExcluirExportacao: Boolean;
    property ListadeFiliais: TStringList read FListadeFiliais write FListadeFiliais;
    property GerandoArquivoTexto: Boolean read fGerandoArquivoTexto write fGerandoArquivoTexto;
    procedure GerarArquivoTexto(Filial: String);
    property MostraProgresso: Boolean read FMostraProgresso write FMostraProgresso;
    property AbrirTodos: Boolean read FAbrirTodos write FAbrirTodos;

  end;

var
  dtmExportacaoDados: TdtmExportacaoDados;
  FLista  : TLista;

{const
    sql_Intervalo_de_Datas = ' and (DadosFiscais.data between (%s) and (%s))';
    sql_Lista_de_Codigos_Fiscais_inclusao = ' and codigofiscal in (%s)';
    sql_Lista_de_Codigos_Fiscais_exclusao = ' and codigofiscal not in (%s)';
    sql_Lista_de_Filiais_inclusao = ' and filialemissao in (%s)';
    sql_Lista_de_Filiais_exclusao = ' and filialemissao not in (%s)';
    sql_Lista_de_Series_inclusao = ' and serie in (%s)';
    sql_Lista_de_Series_exclusao = ' and serie not in (%s)';
    sql_Lista_de_Naturezas_inclusao = ' and natureza in (%s)';
    sql_Lista_de_Naturezas_exclusao = ' and natureza not in (%s)';
 }

implementation

{$R *.dfm}

{ TdtmExportacaoContabil }

function TdtmExportacaoDados.CodigoExportacao: Integer;
begin
  qryExportacaoProximo.Open;
  result := qryExportacaoProximocodigo.AsInteger;
  qryExportacaoProximo.Close;
end;

constructor TdtmExportacaoDados.Create(AOwner: TComponent);
begin
  inherited;
  qryExportacao.Tag := ctTabelas;
  qryExportacaoTabelas.Tag := ctTabelas;
  qryfiltros.Tag := cttabelas;
  qrySeparadorCampos.Tag := cttabelas;
  qrySeparadorDecimal.Tag := cttabelas;
  qrySeparadorMilhar.Tag := cttabelas;
  ListadeFiliais := TStringList.Create;
end;

function TdtmExportacaoDados.GetListaTabelas: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryExportacaoTabelas.Open;
  SetLength(FLista, qryExportacaoTabelas.RecordCount);
  Ind:= 0;
  while not qryExportacaoTabelas.Eof do begin
    FLista[Ind].codigo   := qryExportacaoTabelascodigo.AsString;
    FLista[Ind].descricao:= qryExportacaoTabelasdescricao.AsString;
    Inc(Ind);
    qryExportacaoTabelas.Next;
  end;
  qryExportacaoTabelas.Close;
  Result := FLista;
end;

procedure TdtmExportacaoDados.IncluirExportacaoDados;
begin
  qryExportacao.Insert;
  qryExportacaocodigo.AsInteger := CodigoExportacao;
end;

procedure TdtmExportacaoDados.MoverCampos(Adicionar, Todos: Boolean);
  procedure AdicionarCampos;
  begin
    qryExportacaoCamposcodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
    qryExportacaoCamposcodigotabela.AsInteger := qryExportacaoTabelascodigo.AsInteger;
    qryExportacaoCamposcampo.AsString := qryExportacaoTabelaCamposnomecampo.AsString;
    qryExportacaoCamposmascara.AsString := qryExportacaoTabelaCamposmascara.AsString;
    qryExportacaoCamposdelimitador.AsString := qryExportacaoTabelaCamposdelimitador.AsString;
//    qryExportacaoCampossequencia.AsInteger := NroUltimaSequencia;
    qryExportacaoCampostipo.AsString := qryExportacaoTabelaCampostipo.AsString;
    qryExportacaoCampostamanho.AsInteger := qryExportacaoTabelaCampostamanho.AsInteger;
    qryExportacaoCamposdecimais.AsInteger := qryExportacaoTabelaCamposdecimais.AsInteger;
    qryExportacaoCamposcampocriado.AsBoolean := false;
  end;

  procedure RetornarCampos;
  begin
    qryExportacaoTabelaCamposnomecampo.AsString := qryExportacaoCamposcampo.AsString;
    qryExportacaoTabelaCamposmascara.AsString := qryExportacaoCamposmascara.AsString;
    qryExportacaoTabelaCamposdelimitador.AsString := qryExportacaoCamposdelimitador.AsString;
    qryExportacaoTabelaCampostipo.AsString := qryExportacaoCampostipo.AsString;
    qryExportacaoTabelaCampostamanho.AsInteger := qryExportacaoCampostamanho.AsInteger;
    qryExportacaoTabelaCamposdecimais.AsInteger := qryExportacaoCamposdecimais.AsInteger;
  end;

  procedure RecalcularSequencia;
  begin
    GuardarRegistroAtual(qryExportacaoCampos, true);
    qryExportacaoCampos.First;
    while not qryExportacaoCampos.Eof do
    begin
      qryExportacaoCampos.Edit;
      qryExportacaoCampossequencia.AsInteger := qryExportacaoCampos.RecNo;
      qryExportacaoCampos.Post;
      qryExportacaoCampos.Next;
    end;
    VoltarRegistroAtual(qryExportacaoCampos);

  end;

begin
  if Adicionar then
  begin
    if not todos then
    begin
      qryExportacaoCampos.append;
      AdicionarCampos;
      qryExportacaoCampos.Post;
      qryExportacaoTabelaCampos.Delete;
    end
    else
    begin
      qryExportacaoTabelaCampos.First;
      while not qryExportacaoTabelaCampos.Eof do
      begin
        qryExportacaoCampos.append;
        AdicionarCampos;
        qryExportacaoCampos.Post;
        qryExportacaoTabelaCampos.Delete;
      end;
    end;
  end
  else
  begin
    if not todos then
    begin
      if not qryExportacaoCamposcampocriado.AsBoolean then
      begin
        qryExportacaoTabelaCampos.append;
        RetornarCampos;
        qryExportacaoTabelaCampos.Post;
        qryExportacaoCampos.Delete;
      end;
    end
    else
    begin
      qryExportacaoCampos.First;
      while not qryExportacaoCampos.Eof do
      begin
        if not qryExportacaoCamposcampocriado.AsBoolean then
        begin
          qryExportacaoTabelaCampos.append;
          RetornarCampos;
          qryExportacaoTabelaCampos.Post;
          qryExportacaoCampos.Delete;
        end
        else
          qryExportacaoCampos.Next;
      end;
    end;
    RecalcularSequencia;
  end;
end;

procedure TdtmExportacaoDados.MoverCampos(Movimento: TipoMovimento);
var
  RegistroAtual: TBookMark;
  codigoexportacao,
  codigotabela,
  sequencia,
  sequenciaatual, tamanho, decimais : integer;
  campo,
  mascara,
  delimitador,
  tipo,
  valorpadrao: String;
  CampoCriado: Boolean;

  procedure AdicionarCampos;
  begin
    qryExportacaoCamposcodigoexportacao.AsInteger := codigoexportacao;
    qryExportacaoCamposcodigotabela.AsInteger := codigotabela;
    qryExportacaoCamposcampo.AsString := campo;
    qryExportacaoCamposmascara.AsString := mascara;
    qryExportacaoCamposdelimitador.AsString := delimitador;
    qryExportacaoCampossequencia.AsInteger := sequenciaatual;
    qryExportacaoCampostipo.AsString := tipo;
    qryExportacaoCampostamanho.AsInteger := tamanho;
    qryExportacaoCamposdecimais.AsInteger := decimais;
    qryExportacaoCamposcampocriado.AsBoolean := CampoCriado;
    qryExportacaoCamposvalorpadrao.AsString := valorpadrao;
  end;

begin
  if qryExportacaoCampos.RecordCount > 1 then
  begin

    qryExportacaoCampos.BeforeInsert := nil;
    qryExportacaoCampos.OnNewRecord := nil;

    codigoexportacao := qryExportacaoCamposcodigoexportacao.AsInteger;
    codigotabela := qryExportacaoCamposcodigotabela.AsInteger;
    sequencia := qryExportacaoCampossequencia.AsInteger;
    campo := qryExportacaoCamposcampo.AsString;
    mascara := qryExportacaoCamposmascara.AsString;
    delimitador := qryExportacaoCamposdelimitador.AsString;
    CampoCriado := qryExportacaoCamposcampocriado.AsBoolean;
    tipo := qryExportacaoCampostipo.AsString;
    tamanho := qryExportacaoCampostamanho.AsInteger;
    decimais := qryExportacaoCamposdecimais.AsInteger;
    valorpadrao := qryExportacaoCamposvalorpadrao.AsString;

    case Movimento of
      ParaCima :
      begin
        if qryExportacaoCampos.RecNo <> 1 then
        begin
          GuardarRegistroAtual(qryExportacaoCampos,true);
          qryExportacaoCampos.Prior;
          sequenciaatual := qryExportacaoCampossequencia.AsInteger;
          qryExportacaoCampos.Edit;
          qryExportacaoCampossequencia.AsInteger := sequencia;
          qryExportacaoCampos.Post;
          qryExportacaoCampos.Insert;
          AdicionarCampos;
          qryExportacaoCampos.Post;
          RegistroAtual := qryExportacaoCampos.GetBookmark;
          VoltarRegistroAtual(qryExportacaoCampos);
          qryExportacaoCampos.Delete;
          qryExportacaoCampos.GotoBookmark(RegistroAtual);
          qryExportacaoCampos.FreeBookmark(RegistroAtual);
        end;
      end;
      ParaBaixo:
      begin
        if qryExportacaoCampos.RecNo <>
           qryExportacaoCampos.RecordCount then
        begin
          GuardarRegistroAtual(qryExportacaoCampos,true);
          qryExportacaoCampos.next;
          sequenciaatual := qryExportacaoCampossequencia.AsInteger;
          qryExportacaoCampos.Edit;
          qryExportacaoCampossequencia.AsInteger := sequencia;
          qryExportacaoCampos.Post;

          qryExportacaoCampos.next;
          if qryExportacaoCampos.Eof then
            qryExportacaoCampos.Append
          else
            qryExportacaoCampos.Insert;
          AdicionarCampos;
          qryExportacaoCampos.Post;
          RegistroAtual := qryExportacaoCampos.GetBookmark;
          VoltarRegistroAtual(qryExportacaoCampos);
          qryExportacaoCampos.Delete;
          qryExportacaoCampos.GotoBookmark(RegistroAtual);
          qryExportacaoCampos.FreeBookmark(RegistroAtual);
        end;
      end;
    end;
    qryExportacaoCampos.BeforeInsert := qryExportacaoCamposBeforeInsert;
    qryExportacaoCampos.OnNewRecord := qryExportacaoCamposNewRecord;
  end;
end;

procedure TdtmExportacaoDados.qryExportacaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  FSalvarParametros := false;
  ReFazConsulta(qryExportacaoModelos,[0],[qryExportacaocodigo.AsVariant]);
  ReFazConsulta(qryExportacaoCampos,[0],[qryExportacaocodigo.AsVariant]);
  RefazConsulta(qryExportacaoFiltros,[0],[qryExportacaocodigo.AsVariant]);
  RefazConsulta(qryParametrosSelecao,[0,1],[self.name,qryExportacaocodigo.AsVariant]);

  GuardarRegistroAtual(qryExportacaoTabelas,true);
  qryExportacaoTabelas.AfterScroll := nil;
  qryExportacaoTabelas.BeforeScroll := nil;

  qryExportacaoModelos.masterSource := nil;
  qryExportacaoTabelas.First;
  while not qryExportacaoTabelas.Eof do
  begin
    qryExportacaoTabelas.Edit;
    if qryExportacaoModelos.Locate('codigotabela',qryExportacaoTabelascodigo.AsInteger,[]) then
      qryExportacaoTabelasmarcar.AsBoolean := true
    else
      qryExportacaoTabelasmarcar.AsBoolean := false;
    qryExportacaoTabelas.post;
    qryExportacaoTabelas.Next
  end;
  qryExportacaoTabelas.AfterScroll := qryExportacaoTabelasAfterScroll;
  qryExportacaoTabelas.BeforeScroll := qryExportacaoTabelasBeforeScroll;
  qryExportacaoModelos.masterSource := dsrExportacaoTabelas;

  VoltarRegistroAtual(qryExportacaoTabelas);
end;

procedure TdtmExportacaoDados.qryExportacaoTabelasAfterScroll(
  DataSet: TDataSet);
var
  i: integer;
  procedure ExibirFiltro(Valor: Boolean);
  begin
    qryfiltros.Edit;
    qryFiltrosexibir.AsBoolean := Valor;
    qryfiltros.Post;
  end;

begin
  inherited;
  if qryExportacaoModelos.Active then
  begin
    qryExportacaoTabelasConsulta.Sql.Text := qryExportacaoTabelassql.Text;
//    qryExportacaoDados.sql.text := qryExportacaoTabelassql.Text;
    qryfiltros.Filtered := false;

    qryfiltros.First;
    while not qryfiltros.Eof do
    begin
      if qryFiltrosexibir.AsBoolean then
        ExibirFiltro(false);
      qryfiltros.Next;
    end;

    for i:=0 to qryExportacaoTabelasConsulta.MacroCount-1 do
    begin
      if qryExportacaoTabelasConsulta.Macros[i].name = 'sql_Intervalo_de_Datas' then
      begin
        if not qryExportacaoFiltros.Locate('descricao','INTERVALO DE DATAS',[]) then
          if qryfiltros.Locate('macro',qryExportacaoTabelasConsulta.Macros[i].Name,[]) then
            ExibirFiltro(true);
      end
      else
      if qryExportacaoTabelasConsulta.Macros[i].name = 'sql_Lista_de_Codigos_Fiscais' then
      begin
        if not qryExportacaoFiltros.Locate('descricao','LISTA DE CÓDIGOS FISCAIS',[]) then
          if qryfiltros.Locate('macro',qryExportacaoTabelasConsulta.Macros[i].Name,[]) then
            ExibirFiltro(true);
      end
      else
      if qryExportacaoTabelasConsulta.Macros[i].Name = 'sql_Lista_de_Filiais' then
      begin
        if not qryExportacaoFiltros.Locate('descricao','LISTA DE FILIAIS',[]) then
          if qryfiltros.Locate('macro',qryExportacaoTabelasConsulta.Macros[i].Name,[]) then
            ExibirFiltro(true);
      end
      else
      if qryExportacaoTabelasConsulta.Macros[i].Name = 'sql_Lista_de_Series' then
      begin
        if not qryExportacaoFiltros.Locate('descricao','LISTA DE SÉRIES',[]) then
          if qryfiltros.Locate('macro',qryExportacaoTabelasConsulta.Macros[i].Name,[]) then
            ExibirFiltro(true);
      end
      else
      if qryExportacaoTabelasConsulta.Macros[i].Name = 'sql_Lista_de_Naturezas' then
      begin
        if not qryExportacaoFiltros.Locate('descricao','LISTA DE NATUREZAS',[]) then
          if qryfiltros.Locate('macro',qryExportacaoTabelasConsulta.Macros[i].Name,[]) then
            ExibirFiltro(true);
      end
    end;
    qryfiltros.Filtered := true;


    qryExportacaoTabelasConsulta.MacroByName('sql_Where_False').AsString := 'Where False';
//    qryExportacaoDados.MacroByName('sql_Where_False').AsString := 'Where False';


    qryExportacaoTabelasConsulta.Open;
    qryExportacaoTabelaCampos.Close;
    qryExportacaoTabelaCampos.open;
    qryExportacaoTabelaCampos.delete;

    for i:=0 to qryExportacaoTabelasConsulta.FieldCount-1 do
    begin
      if not qryExportacaoCampos.Locate('codigoexportacao;codigotabela,campo',
            VarArrayof([qryExportacaocodigo.AsString,
                        qryExportacaoTabelascodigo.AsString,
                        qryExportacaoTabelasConsulta.Fields[i].FieldName]),[]) then
      begin
        qryExportacaoTabelaCampos.Append;
        qryExportacaoTabelaCampossequencia.AsInteger := i+1;
        qryExportacaoTabelaCamposnomecampo.AsString := qryExportacaoTabelasConsulta.Fields[i].FieldName;
        case qryExportacaoTabelasConsulta.Fields[i].DataType of
          ftString:
          begin
            qryExportacaoTabelaCampostipo.AsString := 'CARACTER';
            qryExportacaoTabelaCampostamanho.AsInteger := qryExportacaoTabelasConsulta.Fields[i].Size;
            qryExportacaoTabelaCamposdelimitador.AsString := '"';
          end;
          ftBoolean :
          begin
            qryExportacaoTabelaCamposmascara.AsString := 'S/N';
            qryExportacaoTabelaCampostipo.AsString := 'LÓGICO';
            qryExportacaoTabelaCampostamanho.AsInteger := 1;
            qryExportacaoTabelaCamposdelimitador.AsString := '"';
          end;
          ftFloat, ftCurrency:
          begin
            qryExportacaoTabelaCamposmascara.AsString := '0.00';
            qryExportacaoTabelaCampostipo.AsString := 'NUMÉRICO';
            qryExportacaoTabelaCampostamanho.AsInteger := 15;
            qryExportacaoTabelaCamposdecimais.AsInteger := 2;
            qryExportacaoTabelaCamposdelimitador.clear;
          end;
          ftInteger:
          begin
            qryExportacaoTabelaCampostipo.AsString := 'INTEIRO';
            qryExportacaoTabelaCampostamanho.AsInteger := qryExportacaoTabelasConsulta.Fields[i].Size;
            qryExportacaoTabelaCamposdelimitador.clear;
          end;
          ftDate:
          begin
            qryExportacaoTabelaCamposmascara.AsString := 'dd/mm/yyyy';
            qryExportacaoTabelaCampostipo.AsString := 'DATA';
            qryExportacaoTabelaCampostamanho.AsInteger := 10;
            qryExportacaoTabelaCamposdelimitador.AsString := '"';
          end;
          ftTime:
          begin
            qryExportacaoTabelaCamposmascara.AsString := 'hh:mm:ss';
            qryExportacaoTabelaCampostipo.AsString := 'HORA';
            qryExportacaoTabelaCampostamanho.AsInteger := 8;
            qryExportacaoTabelaCamposdelimitador.AsString := '"';
          end;
          ftDateTime:
          begin
            qryExportacaoTabelaCamposmascara.AsString := 'dd/mm/yyyy hh:mm:ss';
            qryExportacaoTabelaCampostipo.AsString := 'DATA/HORA';
            qryExportacaoTabelaCampostamanho.AsInteger := 19;
            qryExportacaoTabelaCamposdelimitador.AsString := '"';
          end;
        end;
      end;
    end;
    qryExportacaoTabelasConsulta.close;
    if Assigned(ExportacaoTabelasAfterScroll) then
      ExportacaoTabelasAfterScroll(qryexportacaoTabelasConsulta)
  end;
end;


procedure TdtmExportacaoDados.qryExportacaoCamposAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryExportacaoCamposcampocriado.AsBoolean then
  begin
    qryExportacaoCamposcampo.ReadOnly := true;
    qryExportacaoCampostipo.ReadOnly := true;
    qryExportacaoCamposvalorpadrao.ReadOnly := true;
  end
  else
  begin
    qryExportacaoCamposcampo.ReadOnly := false;
    qryExportacaoCampostipo.ReadOnly := false;
    qryExportacaoCamposvalorpadrao.ReadOnly := false;
  end;
end;

procedure TdtmExportacaoDados.qryExportacaoCamposBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryExportacaoCampos.Last;
  NroUltimaSequencia := qryExportacaoCampossequencia.AsInteger;
end;

procedure TdtmExportacaoDados.qryExportacaoCamposNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryExportacaoCamposcodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
  qryExportacaoCamposcodigotabela.AsInteger     := qryExportacaoTabelascodigo.AsInteger;
  qryExportacaoCampossequencia.AsInteger        := NroUltimaSequencia + 1;
  qryExportacaoCamposcampo.AsString             := 'Campo_'+qryExportacaoCampossequencia.Asstring;
  qryExportacaoCamposcampocriado.AsBoolean      := true;
  qryExportacaoCampostipo.AsString              := 'CARACTER';
  qryExportacaoCampostamanho.AsInteger          := 10;
  qryExportacaoCamposdelimitador.AsString       := '"';
end;

procedure TdtmExportacaoDados.GravarExportacaoCampos;
begin
  if qryExportacaoCampos.State in [dsedit,dsinsert] then
    if qryExportacaoCampos.CheckRequiredFields then
      qryExportacaoCampos.Post;
end;

procedure TdtmExportacaoDados.CancelarExportacaoCampos;
begin
  if qryExportacaoCampos.State in [dsedit,dsinsert] then
      qryExportacaoCampos.Cancel;
end;

procedure TdtmExportacaoDados.qryExportacaoCamposAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  MarcarExportacaoTabelas;
//  EditarExportacao;
end;

procedure TdtmExportacaoDados.MarcarExportacaoTabelas;
begin
  if qryExportacaoCampos.RecordCount<>0 then
  begin
    if not qryExportacaoTabelasmarcar.AsBoolean then
    begin
      qryExportacaoTabelas.Edit;
      qryExportacaoTabelasmarcar.AsBoolean := true;
      qryExportacaoTabelas.post;
    end;
  end
  else
  begin
    if qryExportacaoTabelasmarcar.AsBoolean then
    begin
      qryExportacaoTabelas.Edit;
      qryExportacaoTabelasmarcar.AsBoolean := false;
      qryExportacaoTabelas.post;
    end;
  end;

  if not qryExportacaoCampos.IsEmpty then
  begin
    if qryExportacaoModelos.IsEmpty then
      qryExportacaoModelos.Append;
  end
  else
    qryExportacaoModelos.Delete;
end;

procedure TdtmExportacaoDados.qryExportacaoCamposAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  MarcarExportacaoTabelas;
end;

procedure TdtmExportacaoDados.MoverFiltros(Adicionar, Todos: Boolean);
  procedure AdicionarFiltros;
  begin
    qryExportacaoFiltroscodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
    qryExportacaoFiltroscodigotabela.AsInteger := qryExportacaoTabelascodigo.AsInteger;
    qryExportacaoFiltroscodigofiltro.AsInteger := qryFiltroscodigo.AsInteger;
    qryExportacaoFiltrosdescricao.AsString := qryFiltrosdescricao.AsString;
    qryExportacaoFiltrosmacro.AsString := qryFiltrosmacro.AsString;
    qryExportacaoFiltrossql.AsString := qryFiltrossqlpadrao.AsString;
  end;

  procedure RetornarFiltros;
  begin
    if qryFiltros.Locate('codigo',qryExportacaoFiltroscodigofiltro.AsInteger,[]) then
    begin
      qryFiltros.edit;
      qryFiltrosexibir.AsBoolean := true;
      qryfiltros.Post;
    end;
  end;

begin
  if Adicionar then
  begin
    if not todos then
    begin
      qryExportacaoFiltros.append;
      AdicionarFiltros;
      qryExportacaoFiltros.Post;
      qryFiltros.edit;
      qryFiltrosexibir.AsBoolean := false;
      qryfiltros.Post;
    end
    else
    begin
      qryFiltros.First;
      while not qryFiltros.Eof do
      begin
        qryExportacaoFiltros.append;
        AdicionarFiltros;
        qryExportacaoFiltros.Post;
        qryFiltros.edit;
        qryFiltrosexibir.AsBoolean := false;
        qryfiltros.Post;
      end;
    end;
  end
  else
  begin
    qryfiltros.Filtered := false;
    if not todos then
    begin
      RetornarFiltros;
      qryExportacaoFiltros.Delete;
    end
    else
    begin
      qryExportacaoFiltros.First;
      while not qryExportacaoFiltros.Eof do
      begin
        RetornarFiltros;
        qryExportacaoFiltros.Delete;
      end;
    end;
    qryfiltros.Filtered := true;
  end;

  if qryParametrosSelecao.IsEmpty then
  begin
    if not qryExportacaoFiltros.IsEmpty then
    begin
      qryParametrosSelecao.Append;
      qryParametrosSelecaoformulario.AsString := self.Name;
      qryParametrosSelecaochaveacesso_1.AsString := qryExportacaocodigo.AsString;
      qryParametrosSelecaochaveacesso_2.AsString := qryExportacaoTabelascodigo.AsString;
      qryParametrosSelecao.Post;
    end
  end
  else
    if qryExportacaoFiltros.IsEmpty then
      qryParametrosSelecao.Delete;

end;

procedure TdtmExportacaoDados.MoverFiltros(Movimento: TipoMovimento);
var
  RegistroAtual: TBookMark;
  codigoexportacao,
  codigotabela,
  codigofiltro : integer;
  descricao,
  macro,
  sql: String;

  procedure AdicionarFiltros;
  begin
    qryExportacaoFiltroscodigoexportacao.AsInteger := codigoexportacao;
    qryExportacaoFiltroscodigotabela.AsInteger := codigotabela;
    qryExportacaoFiltroscodigofiltro.AsInteger := codigofiltro;
    qryExportacaoFiltrosdescricao.AsString := descricao;
    qryExportacaoFiltrosmacro.AsString := macro;
    qryExportacaoFiltrossql.AsString := sql;
  end;

begin
  if qryExportacaoFiltros.RecordCount > 1 then
  begin
    codigoexportacao := qryExportacaoFiltroscodigoexportacao.AsInteger;
    codigotabela := qryExportacaoFiltroscodigotabela.AsInteger;
    codigofiltro := qryExportacaoFiltroscodigofiltro.AsInteger;
    descricao := qryExportacaoFiltrosdescricao.AsString;
    macro := qryExportacaoFiltrosmacro.AsString;
    sql := qryExportacaoFiltrossql.AsString;
    case Movimento of
      ParaCima :
      begin
        if qryExportacaoFiltros.RecNo <> 1 then
        begin
          GuardarRegistroAtual(qryExportacaoFiltros,true);
          qryExportacaoFiltros.Prior;
          qryExportacaoFiltros.Insert;
          AdicionarFiltros;
          qryExportacaoFiltros.Post;
          RegistroAtual := qryExportacaoFiltros.GetBookmark;
          VoltarRegistroAtual(qryExportacaoFiltros);
          qryExportacaoFiltros.Delete;
          qryExportacaoFiltros.GotoBookmark(RegistroAtual);
          qryExportacaoFiltros.FreeBookmark(RegistroAtual);
        end;
      end;
      ParaBaixo:
      begin
        if qryExportacaoFiltros.RecNo <>
           qryExportacaoFiltros.RecordCount then
        begin
          GuardarRegistroAtual(qryExportacaoFiltros,true);
          qryExportacaoFiltros.next;
          qryExportacaoFiltros.next;
          if qryExportacaoFiltros.Eof then
            qryExportacaoFiltros.Append
          else
            qryExportacaoFiltros.Insert;
          AdicionarFiltros;
          qryExportacaoFiltros.Post;
          RegistroAtual := qryExportacaoFiltros.GetBookmark;
          VoltarRegistroAtual(qryExportacaoFiltros);
          qryExportacaoFiltros.Delete;
          qryExportacaoFiltros.GotoBookmark(RegistroAtual);
          qryExportacaoFiltros.FreeBookmark(RegistroAtual);
        end;
      end;
    end;
  end;
end;

procedure TdtmExportacaoDados.qryFiltrosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := qryFiltrosexibir.AsBoolean;
end;

procedure TdtmExportacaoDados.MontarDados;
var
 i: integer;
 CamposAdicionais : vString;
 ValorPadrao : Variant;
 SQLAnterior : String;
begin
  if GerandoArquivoTexto then
  begin
    if qryParametrosSelecaogerararquivoporfilial.AsBoolean and
       qryExportacaoFiltros.Locate('descricao','LISTA DE FILIAIS',[]) then
    begin
      SQLAnterior := qryExportacaoFiltrossqldescricao.AsString;
      for i:=0 to ListadeFiliais.Count -1 do
      begin
        qryExportacaoFiltros.Edit;
        qryExportacaoFiltrossqldescricao.AsString := format(qryExportacaoFiltrossql.AsString, [
                                                             quotedstr(ListadeFiliais[i])]);
        qryExportacaoFiltros.Post;
        AbrirConsulta;
        GerarArquivoTexto(ListadeFiliais[i]);
      end;
    end
    else
    begin
      AbrirConsulta;
      GerarArquivoTexto('');
    end;
  end
  else
    AbrirConsulta;
end;

procedure TdtmExportacaoDados.FormatarCampo(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not sender.IsNull then
    if qryExportacaoCampos.Locate('campo',Sender.FieldName,[locaseinsensitive]) then
    begin
      ThousandSeparator := qryExportacaoModelosseparadormilhar.asstring[1];
      DecimalSeparator := qryExportacaoModelosseparadordecimal.asstring[1];
      Text := FormatFloat(qryExportacaoCamposmascara.AsString,sender.Value);
      ThousandSeparator := '.';
      DecimalSeparator := ',';
    end;
end;

procedure TdtmExportacaoDados.LimparParametrosSelecao;
var
  i: integer;
begin
  if not qryParametrosSelecao.IsEmpty then
  begin
    qryParametrosSelecao.edit;
    for i:=4 to qryParametrosSelecao.FieldCount-1 do
      qryParametrosSelecao.Fields[i].Clear;
  end;
end;

procedure TdtmExportacaoDados.SalvarIntervaloDatas(Tipo: Integer; DataInicial, Datafinal: tDateTime);
begin
  with qryParametrosSelecao do
  begin
    if (qryParametrosSelecaointervalodatasformaselecao.AsInteger <> Tipo) or
       (qryParametrosSelecaointervalodatasdatainicial.AsDateTime <> DataInicial) or
       (qryParametrosSelecaointervalodatasdatafinal.AsDateTime <> DataFinal) then
    begin
      Edit;
      if tipo = 3 then  // qdo retirado
      begin
        qryParametrosSelecaointervalodatasformaselecao.clear;
        qryParametrosSelecaointervalodatasdatainicial.clear;
        qryParametrosSelecaointervalodatasdatafinal.clear;
      end
      else
      begin
        qryParametrosSelecaointervalodatasformaselecao.value := Tipo;
        qryParametrosSelecaointervalodatasdatainicial.AsDateTime := DataInicial;
        qryParametrosSelecaointervalodatasdatafinal.AsDateTime := DataFinal;
      end;
      Post;
      EditarExportacao;
    end;
  end;
end;

procedure TdtmExportacaoDados.SalvarListadeCodigosFiscais(Lista: String);
begin
  with qryParametrosSelecao do
  begin
    if qryParametrosSelecaolistadecodigosfiscais.AsString <> Lista then
    begin
      Edit;
      if lista<>'' then
        qryParametrosSelecaolistadecodigosfiscais.AsString := Lista
      else
        qryParametrosSelecaolistadecodigosfiscais.clear;
      Post;
      EditarExportacao;
    end;
  end;
end;

procedure TdtmExportacaoDados.SalvarListadeFiliais(Lista: String);
begin
  with qryParametrosSelecao do
  begin
    if qryParametrosSelecaolistadefiliais.AsString <> Lista then
    begin
      Edit;
      if lista<>'' then
        qryParametrosSelecaolistadefiliais.AsString := Lista
      else
        qryParametrosSelecaolistadefiliais.clear;
      Post;
      EditarExportacao;
    end;
  end;
end;

procedure TdtmExportacaoDados.SalvarListaNaturezas(Lista: String);
begin
  with qryParametrosSelecao do
  begin
    if qryParametrosSelecaolistadenaturezas.AsString <> Lista then
    begin
      Edit;
      if Lista<>'' then
        qryParametrosSelecaolistadenaturezas.AsString := Lista
      else
        qryParametrosSelecaolistadenaturezas.clear;
      Post;
    end;
  end;
end;

procedure TdtmExportacaoDados.SalvarListaSeriesFiliais(Lista: String);
begin
  with qryParametrosSelecao do
  begin
    if qryParametrosSelecaolistadeseries.AsString <> Lista then
    begin
      Edit;
      if Lista<>'' then
        qryParametrosSelecaolistadeseries.AsString := Lista
      else
        qryParametrosSelecaolistadeseries.clear;
      Post;
    end;
  end;
end;

procedure TdtmExportacaoDados.qryExportacaoTabelasBeforeScroll(
  DataSet: TDataSet);
begin
  inherited;
    if Assigned(ExportacaoTabelasBeforeScroll) then
      ExportacaoTabelasBeforeScroll(qryexportacaoTabelas)
end;

function TdtmExportacaoDados.GravarExportacao: Boolean;
//var
//  data: TDateTime;
begin
//  data := DataHoraLocal;

  if qryExportacao.State = dsinsert then
  begin
    qryExportacaoProximo.Close;
    qryExportacaoProximo.Open;
    qryExportacaocodigo.AsInteger := qryExportacaoProximocodigo.AsInteger;
    qryExportacao.Post;

    qryExportacaoTabelas.AfterScroll := nil;
    qryExportacaoTabelas.BeforeScroll := nil;
    GuardarRegistroAtual(qryExportacaoTabelas, true);

    qryParametrosSelecao.MasterSource := nil;
    qryExportacaoModelos.masterSource := nil;
    qryExportacaoCampos.masterSource := nil;
    qryExportacaoFiltros.MasterSource := nil;

    qryParametrosSelecao.First;
    while not qryParametrosSelecao.Eof do
    begin
      qryParametrosSelecao.Edit;
      qryParametrosSelecaodata.AsDateTime := DataHoraLocal;
      qryParametrosSelecaochaveacesso_1.AsString := qryExportacaocodigo.AsString;
      qryParametrosSelecao.Post;
      qryParametrosSelecao.Next;
    end;

    qryExportacaoModelos.First;
    while not qryExportacaoModelos.Eof do
    begin
      qryExportacaoModelos.Edit;
      qryExportacaoModeloscodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
      qryExportacaoModelos.Post;
      qryExportacaoModelos.Next;
    end;

    qryExportacaoCampos.DisableControls;
    qryExportacaoCampos.First;
    while not qryExportacaoCampos.Eof do
    begin
      qryExportacaoCampos.Edit;
      qryExportacaoCamposcodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
      qryExportacaoCampos.Post;
      qryExportacaoCampos.Next;
    end;
    qryExportacaoModelos.EnableControls;

    qryExportacaoFiltros.First;
    while not qryExportacaoFiltros.Eof do
    begin
      qryExportacaoFiltros.Edit;
      qryExportacaoFiltroscodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
      qryExportacaoFiltros.Post;
      qryExportacaoFiltros.Next;
    end;

    qryExportacaoTabelas.AfterScroll := qryExportacaoTabelasAfterScroll;
    qryExportacaoTabelas.BeforeScroll := qryExportacaoTabelasBeforeScroll;
    VoltarRegistroAtual(qryExportacaoTabelas);

    qryParametrosSelecao.MasterSource := dsrExportacaoTabelas;
    qryExportacaoModelos.masterSource := dsrExportacaoTabelas;
    qryExportacaoCampos.masterSource  := dsrExportacaoTabelas;
    qryExportacaoFiltros.MasterSource := dsrExportacaoTabelas;
  end;
  result := Perpetrar([qryExportacao,qryParametrosSelecao,qryExportacaoModelos,
                       qryExportacaoCampos,qryExportacaoFiltros]);


end;

procedure TdtmExportacaoDados.qryParametrosSelecaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qryParametrosSelecaointervalodatasdatainicial.AsString<>'') and
     (qryParametrosSelecaointervalodatasdatafinal.AsString<>'') then
    qryParametrosSelecaoextensao.AsString :=
       FormatDateTime('dd-mm-yyyy', strtodate(qryParametrosSelecaointervalodatasdatainicial.AsString))+'_a_'+
       FormatDateTime('dd-mm-yyyy', strtodate(qryParametrosSelecaointervalodatasdatafinal.AsString))+'.txt'
  else
    qryParametrosSelecaoextensao.AsString := '.txt';
end;

procedure TdtmExportacaoDados.EditarExportacao;
begin
  if not (qryExportacao.State in [dsedit, dsinsert]) then
    qryExportacao.edit;
end;

procedure TdtmExportacaoDados.qryExportacaoFiltrosBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  if qryExportacaoFiltrosdescricao.AsString = 'INTERVALO DE DATAS' then
    SalvarIntervaloDatas(3,date,date)
  else
  if qryExportacaoFiltrosdescricao.AsString = 'LISTA DE CÓDIGOS FISCAIS' then
    SalvarListadeCodigosFiscais('')
  else
  if qryExportacaoFiltrosdescricao.AsString = 'LISTA DE FILIAIS' then
    SalvarListadeFiliais('')
  else
  if qryExportacaoFiltrosdescricao.AsString = 'LISTA DE SÉRIES' then
    SalvarListaSeriesFiliais('')
  else
  if qryExportacaoFiltrosdescricao.AsString = 'LISTA DE NATUREZAS' then
    SalvarListaNaturezas('');
end;

procedure TdtmExportacaoDados.qryExportacaoModelosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryExportacaoModeloscodigoexportacao.AsInteger := qryExportacaocodigo.AsInteger;
  qryExportacaoModeloscodigotabela.AsInteger     := qryExportacaoTabelascodigo.AsInteger;
  qryExportacaoModelosseparadorcampos.AsString   := ',';
  qryExportacaoModelosseparadordecimal.AsString  := ',';
  qryExportacaoModelosseparadormilhar.AsString   := '.';
  qryExportacaoModelosnomearquivo.AsString       := trocar(qryExportacaoTabelasdescricao.AsString,' ','_');
  qryExportacaoModelos.Post;
  qryExportacaoTabelas.Edit;
  qryExportacaoTabelasmarcar.AsBoolean := true;
  qryExportacaoTabelas.post;
  EditarExportacao;

end;

function TdtmExportacaoDados.ExcluirExportacao: Boolean;
begin
  Result:= False;
  if not qryExportacao.IsEmpty then begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a exportação'])) = smbok then begin
      qryExportacao.Delete;
      Perpetrar([qryExportacao]);
      Result:= True;
    end
  end;
end;

procedure TdtmExportacaoDados.GerarArquivoTexto(Filial: String);
var
  i:integer;
  Arq: TextFile;
  NomeArquivo, Linha, Barra : String;

  procedure GravarLinha_String(str : String);
  begin
  {$IFDEF LINUX}
   Writeln(Arq, str+#13);
  {$ELSE }
   Writeln(Arq, str);
  {$ENDIF}
  end;

begin
  if qryExportacaoModelosnomearquivo.asstring <> '' then
  begin
    NomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas';

    if not DirectoryExists(NomeArquivo) then
      if not CreateDir(NomeArquivo) then
      raise Exception.Create('Impossível criar o diretório '+NomeArquivo);

    {$IFDEF LINUX}
      Barra := '/';
    {$ELSE }
      Barra := '\';
    {$ENDIF }

    if filial<>'' then
      NomeArquivo := NomeArquivo + Barra +
                     qryExportacaoModelosnomearquivo.asstring + '_' +Filial+ '_'+
                     Extensao
    else
      NomeArquivo := NomeArquivo + Barra +
                     qryExportacaoModelosnomearquivo.asstring +
                     Extensao;

    try
      AssignFile(Arq, NomeArquivo);
      Rewrite(Arq);

      qryExportacaoDados.DisableControls;
      qryExportacaoDados.First;
      while not qryExportacaoDados.Eof do
      begin
       linha := '';
        for i:=0 to qryExportacaoDados.FieldCount-1 do
        begin
          if qryExportacaoDados.Fields[i].Visible then
          begin
            if qryExportacaoCampos.Locate('campo',qryExportacaoDados.Fields[i].FieldName,[locaseinsensitive]) then
            begin
              case qryExportacaoDados.Fields[i].DataType of
              ftFloat, ftCurrency:
              begin
                ThousandSeparator := qryExportacaoModelosseparadormilhar.asstring[1];
                DecimalSeparator := qryExportacaoModelosseparadordecimal.asstring[1];
                if qryExportacaoDados.Fields[i].IsNull then
                  Linha := Linha + qryExportacaoCamposdelimitador.AsString +
                           formatfloat(qryExportacaoCamposmascara.asstring,0) +
                           qryExportacaoCamposdelimitador.AsString
                else
                  Linha := Linha + qryExportacaoCamposdelimitador.AsString +
                           formatfloat(qryExportacaoCamposmascara.asstring,qryExportacaoDados.Fields[i].value) +
                           qryExportacaoCamposdelimitador.AsString;
                ThousandSeparator := '.';
                DecimalSeparator := ',';
              end
              else
                Linha := Linha + qryExportacaoCamposdelimitador.AsString +
                         qryExportacaoDados.Fields[i].asstring +
                         qryExportacaoCamposdelimitador.AsString;
              end;
              if i <> qryExportacaoDados.FieldCount-1 then
                linha := linha + qryExportacaoModelosseparadorcampos.AsString;
            end;
          end;
        end;
        GravarLinha_String(linha);
        qryExportacaoDados.Next;
      end;
      qryExportacaoDados.EnableControls;
    except
      on E:EFCreateError do
        MensagemErro(E.Message);
    end;
    closefile(arq);
  end;
end;

procedure TdtmExportacaoDados.AbrirConsulta;
var
 i: integer;
 CamposAdicionais : vString;
 ValorPadrao : Variant;
begin
  CamposAdicionais := nil;
  qryExportacaoDados.Close;
  qryExportacaoDados.sql.text := qryExportacaoTabelassql.Text;

  for i:=0 to qryExportacaoDados.Macros.Count -1 do
    qryExportacaoDados.Macros[i].AsString := '';

  if qryExportacaoFiltros.IsEmpty and not AbrirTodos then
    qryExportacaoDados.MacroByName('sql_Where_False').AsString := 'Where False'
  else
    qryExportacaoDados.MacroByName('sql_Where_False').AsString := 'Where True';

  qryExportacaoFiltros.First;
  while not qryExportacaoFiltros.Eof do
  begin
    qryExportacaoDados.MacroByName(qryExportacaoFiltrosmacro.AsString).AsString :=
      qryExportacaoFiltrossqldescricao.AsString;
    qryExportacaoFiltros.Next;
  end;

  i:=0;
  qryExportacaoCampos.First;
  while not qryExportacaoCampos.Eof do
  begin
    if qryExportacaoCamposcampocriado.AsBoolean then
    begin
      SetLength(CamposAdicionais, length(CamposAdicionais)+1);
      ValorPadrao := qryExportacaoCamposvalorpadrao.AsVariant;
      if qryExportacaoCampostipo.AsString = 'CARACTER' then
        CamposAdicionais[i] :='cast('+ quotedstr(ValorPadrao) +' as varchar(' +
                                      qryExportacaoCampostamanho.AsString +
                                 ')) as ' + qryExportacaoCamposcampo.AsString
      else
      if qryExportacaoCampostipo.AsString = 'LÓGICO' then
        CamposAdicionais[i] :='cast('+ ValorPadrao +' as Boolean) as ' +
                                   qryExportacaoCamposcampo.AsString
      else
      if qryExportacaoCampostipo.AsString = 'NUMÉRICO' then
        CamposAdicionais[i] :='cast('+ ValorPadrao +' as numeric(' +
                                      qryExportacaoCampostamanho.AsString +
                                      ','+inttostr(qryExportacaoCamposdecimais.Asinteger) +
                                 ')) as ' + qryExportacaoCamposcampo.AsString
      else
      if qryExportacaoCampostipo.AsString = 'INTEIRO' then
        CamposAdicionais[i] :='cast('+ ValorPadrao +' as integer) as ' +
                                   qryExportacaoCamposcampo.AsString
      else
      if qryExportacaoCampostipo.AsString = 'DATA' then
        CamposAdicionais[i] :='cast('+ quotedstr(FormatDateTime('yyyy-mm-dd',strtodate(ValorPadrao))) +' as date) as ' +
                                   qryExportacaoCamposcampo.AsString
      else
      if qryExportacaoCampostipo.AsString = 'HORA' then
        CamposAdicionais[i] :='cast('+ quotedstr(formatDateTime('hh:nn:ss', StrToTime(ValorPadrao))) +' as time) as ' +
                                   qryExportacaoCamposcampo.AsString
      else
      if qryExportacaoCampostipo.AsString = 'DATA/HORA' then
        CamposAdicionais[i] :='cast('+ quotedstr(formatDateTime('yyyy-mm-dd hh:nn:ss', StrToDateTime(ValorPadrao))) +' as timestamp) as ' +
                                   qryExportacaoCamposcampo.AsString;
      inc(i);
    end;
    qryExportacaoCampos.Next;
  end;

  qryExportacaoDados.MacroByName('CamposAdicionais').AsString := '';
  for i:=0 to length(CamposAdicionais)-1 do
  begin
    qryExportacaoDados.MacroByName('CamposAdicionais').AsString :=
      qryExportacaoDados.MacroByName('CamposAdicionais').AsString +
        CamposAdicionais[i]+','
  end;

  qryExportacaoDados.open;
  for i:=0 to qryExportacaoDados.FieldCount-1 do
     qryExportacaoDados.Fields[i].Visible := false;

  if qryExportacaoCampos.RecordCount <> 0 then
  begin
    qryExportacaoCampos.First;
    while not qryExportacaoCampos.Eof do
    begin
      for i:=0 to qryExportacaoDados.FieldCount-1 do
      begin
        if UpperCase(qryExportacaoDados.Fields[i].FieldName) =
           UpperCase(qryExportacaoCamposcampo.AsString) then
        begin
          qryExportacaoDados.Fields[i].Visible := true;
          if qryExportacaoCampostipo.AsString = 'NUMÉRICO' then
            qryExportacaoDados.Fields[i].OnGetText := FormatarCampo;
          qryExportacaoDados.fields[i].Index := qryExportacaoCampossequencia.AsInteger;
          break;
        end;
      end;
      qryExportacaoCampos.Next;
    end;
  end;

end;

destructor TdtmExportacaoDados.Destroy;
begin
  ListadeFiliais.Free;
  inherited;
end;

procedure TdtmExportacaoDados.qryExportacaoDadosProgress(Sender: TObject;
  Stage: TZProgressStage; Proc: TZProgressProc; Position, Max: Integer;
  var Cancel: Boolean);
begin
  inherited;
  if MostraProgresso then
    ShowProgress(Sender, Stage, Proc, Position, Max, Cancel);
end;

{
procedure TdtmExportacaoDados.SalvarData(Tipo: Integer;
  DataFinal: tDateTime);
begin
  with qryParametrosSelecao do
  begin
    if (qryParametrosSelecaointervalodatasformaselecao.AsInteger <> Tipo) or
       (qryParametrosSelecaointervalodatasdatafinal.AsDateTime <> DataFinal) then
    begin
      Edit;
      if tipo = 3 then  // qdo retirado
      begin
        qryParametrosSelecaointervalodatasformaselecao.clear;
        qryParametrosSelecaointervalodatasdatafinal.clear;
      end
      else
      begin
        qryParametrosSelecaointervalodatasformaselecao.value := Tipo;
        qryParametrosSelecaointervalodatasdatafinal.AsDateTime := DataFinal;
      end;
      Post;
      EditarExportacao;
    end;
  end;
end;


procedure TdtmExportacaoDados.qryExportacaoTabelasConsultaBeforeOpen(
  DataSet: TDataSet);
var
 i: integer;
begin
  inherited;
  for i:=0 to qryExportacaoTabelasConsulta.MacroCount-1 do
    if qryExportacaoTabelasConsulta.Macros[i].Name = 'param_data' then
      if qryExportacaoTabelasConsulta.MacroByName('param_data').AsString = '' then
      begin
         qryExportacaoTabelasConsulta.MacroByName('param_data').AsString := quotedstr('1980-01-01');
         break;
      end;
end;
}
function TdtmExportacaoDados.GetExtensao: String;
begin
  FExtensao := qryParametrosSelecaoextensao.AsString;
  if FExtensao='' then FExtensao := '.txt';
  Result := FExtensao;
end;

end.

