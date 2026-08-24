unit dmManutencaoObservacoesVenda;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, biblio, ctconstantes;

type
  TdtmManutencaoObservacoesVenda = class(TdtmBasico)
    qryProdutos: TtecQuery;
    dsrProdutos: TtecDataSource;
    qryProdutoscodigo: TLargeintField;
    qryProdutoscaracodigovisual: TStringField;
    qryProdutosdescricao: TStringField;
    qryProdutosobservacoesvenda: TStringField;
    qryProdutosgrupo: TStringField;
    qryProdutosclasse: TStringField;
    qryProdutosmarca: TIntegerField;
    qryProdutosorigem: TStringField;
    qryProdutosincluido: TBooleanField;
    qryProdutosalterado: TBooleanField;
    qryGrupos: TtecQuery;
    dsrGrupos: TtecDataSource;
    qryGruposcodigo: TStringField;
    qryGruposdescricao: TStringField;
    qryGruposobservacoesvenda: TStringField;
    qryClasses: TtecQuery;
    dsrClasses: TtecDataSource;
    qryMarcas: TtecQuery;
    dsrMarcas: TtecDataSource;
    qryMarcascodigo: TIntegerField;
    qryMarcasdescricao: TStringField;
    qryMarcasobservacoesvenda: TStringField;
    qryClassescodigo: TStringField;
    qryClassesdescricao: TStringField;
    qryClassesobservacoesvenda: TStringField;
    qryProdutosAux: TtecQuery;
    qryProdutosAuxcodigo: TLargeintField;
    qryProdutosAuxcaracodigovisual: TStringField;
    qryProdutosAuxdescricao: TStringField;
    qryProdutosAuxobservacoesvenda: TStringField;
    qryProdutosAuxgrupo: TStringField;
    qryProdutosAuxclasse: TStringField;
    qryProdutosAuxmarca: TIntegerField;
    qryProdutosAuxorigem: TStringField;
    qryProdutosAuxincluido: TBooleanField;
    qryProdutosAuxalterado: TBooleanField;
    qryGruposAux: TtecQuery;
    qryGruposAuxcodigo: TStringField;
    qryGruposAuxdescricao: TStringField;
    qryGruposAuxobservacoesvenda: TStringField;
    qryClassesAux: TtecQuery;
    qryClassesAuxcodigo: TStringField;
    qryClassesAuxdescricao: TStringField;
    qryClassesAuxobservacoesvenda: TStringField;
    qryMarcasAux: TtecQuery;
    qryMarcasAuxcodigo: TIntegerField;
    qryMarcasAuxdescricao: TStringField;
    qryMarcasAuxobservacoesvenda: TStringField;
    qryGravarProdutos: TtecQuery;
    qryProdutosObservacoesGerais: TtecQuery;
    dsrProdutosObservacoesGerais: TtecDataSource;
    qryProdutosObservacoesGeraiscodigo: TLargeintField;
    qryProdutosObservacoesGeraiscodigovisual: TStringField;
    qryProdutosObservacoesGeraisdescricao: TStringField;
    qryProdutosObservacoesGeraisobservacao: TStringField;
    qryProdutosObservacoesGeraisgrupo: TStringField;
    qryProdutosObservacoesGeraisclasse: TStringField;
    qryProdutosObservacoesGeraismarca: TIntegerField;
    qryProdutosObservacoesGeraisincluido: TBooleanField;
    qryProdutosObservacoesGeraisalterado: TBooleanField;
    procedure qryProdutosBeforePost(DataSet: TDataSet);
    procedure qryProdutosAfterScroll(DataSet: TDataSet);
    procedure qryProdutosAfterPost(DataSet: TDataSet);
    procedure qryProdutosAfterDelete(DataSet: TDataSet);
    procedure qryGruposAfterScroll(DataSet: TDataSet);
    procedure qryGruposAfterPost(DataSet: TDataSet);
    procedure qryGruposAfterInsert(DataSet: TDataSet);
    procedure qryGruposAfterDelete(DataSet: TDataSet);
    procedure qryClassesAfterScroll(DataSet: TDataSet);
    procedure qryClassesAfterPost(DataSet: TDataSet);
    procedure qryClassesAfterInsert(DataSet: TDataSet);
    procedure qryClassesAfterDelete(DataSet: TDataSet);
    procedure qryMarcasAfterScroll(DataSet: TDataSet);
    procedure qryMarcasAfterPost(DataSet: TDataSet);
    procedure qryMarcasAfterInsert(DataSet: TDataSet);
    procedure qryMarcasAfterDelete(DataSet: TDataSet);
    procedure qryProdutosObservacoesGeraisAfterDelete(DataSet: TDataSet);
    procedure qryProdutosObservacoesGeraisAfterPost(DataSet: TDataSet);
    procedure qryProdutosObservacoesGeraisAfterScroll(DataSet: TDataSet);
    procedure qryProdutosObservacoesGeraisBeforePost(DataSet: TDataSet);
    procedure qryMarcasBeforePost(DataSet: TDataSet);
    procedure qryClassesBeforePost(DataSet: TDataSet);
    procedure qryGruposBeforePost(DataSet: TDataSet);
  private
    fNotificarAlteracao: TNotifyEvent;
    fNotificarInsertGrupo: TNotifyEvent;
    fNotificarInsertMarcas: TNotifyEvent;
    fNotificarScroll: TNotifyEvent;
    fNotificarInsertClasses: TNotifyEvent;
    { Private declarations }

  public
    { Public declarations }
    OrdenacaoProdutos, OrdenacaoGrupos : String;

    property NotificarAlteracao: TNotifyEvent read fNotificarAlteracao write fNotificarAlteracao;
    property NotificarScroll: TNotifyEvent read fNotificarScroll write fNotificarScroll;
    property NotificarInsertGrupo: TNotifyEvent read fNotificarInsertGrupo write fNotificarInsertGrupo;
    property NotificarInsertClasses: TNotifyEvent read fNotificarInsertClasses write fNotificarInsertClasses;
    property NotificarInsertMarcas: TNotifyEvent read fNotificarInsertMarcas write fNotificarInsertMarcas;


    Function AbrirConsulta(
          SelecionarSomenteProdutosComObservacoesVenda,
          SelecionarSomenteGruposComObservacoesVenda,
          SelecionarSomenteClassesComObservacoesVenda,
          SelecionarSomenteMarcasComObservacoesVenda : Boolean;
          ListaCondicaoProduto,
          ListaCondicaoGrupo,
          ListaCondicaoClasse,
          ListaCondicaoMarca,
          ListaCondicaoPromocoes: String): Boolean;

    function SalvarManutencao: Boolean;

    procedure GravarProdutos;
    procedure GravarProdutosObservacoesGerais;

    procedure GravarGrupos;
    procedure GravarClasses;
    procedure GravarMarcas;
    

  end;

var
  dtmManutencaoObservacoesVenda: TdtmManutencaoObservacoesVenda;

implementation

{$R *.dfm}

{ TdtmManutencaoObservacoesVenda }

function TdtmManutencaoObservacoesVenda.AbrirConsulta(
  SelecionarSomenteProdutosComObservacoesVenda,
  SelecionarSomenteGruposComObservacoesVenda,
  SelecionarSomenteClassesComObservacoesVenda,
  SelecionarSomenteMarcasComObservacoesVenda: Boolean;
  ListaCondicaoProduto, ListaCondicaoGrupo, ListaCondicaoClasse,
  ListaCondicaoMarca, ListaCondicaoPromocoes: String): Boolean;
var
  i: integer;

begin
  qryProdutos.close;
  qryProdutosObservacoesGerais.close;
  qryGrupos.close;
  qryClasses.close;
  qryMarcas.close;

  for i:=0 to  qryProdutos.Macros.count-1 do
    qryProdutos.Macros[i].Clear;

  for i:=0 to  qryProdutosObservacoesGerais.Macros.count-1 do
    qryProdutosObservacoesGerais.Macros[i].Clear;

  for i:=0 to  qryGrupos.Macros.count-1 do
    qryGrupos.Macros[i].Clear;

  for i:=0 to  qryClasses.Macros.count-1 do
    qryClasses.Macros[i].Clear;

  for i:=0 to  qryMarcas.Macros.count-1 do
    qryMarcas.Macros[i].Clear;

  result := true;

  if SelecionarSomenteProdutosComObservacoesVenda then
  begin
    qryProdutos.macrobyname('SelecionarSomenteProdutosComObservacoesVenda').asString := 'and nullif(c.observacoesvenda,'''') is not null';
    qryProdutosObservacoesGerais.macrobyname('SelecionarSomenteProdutosComObservacoesGerais').asString := 'and nullif(c.observacao,'''') is not null';
  end
  else
  begin
    qryProdutos.macrobyname('SelecionarSomenteProdutosComObservacoesVenda').asString := '';
    qryProdutosObservacoesGerais.macrobyname('SelecionarSomenteProdutosComObservacoesGerais').asString := '';
  end;

  if SelecionarSomenteGruposComObservacoesVenda then
    qryProdutos.macrobyname('SelecionarSomenteGruposComObservacoesVenda').asString := 'and nullif(g.observacoesvenda,'''') is not null'
  else
    qryProdutos.macrobyname('SelecionarSomenteGruposComObservacoesVenda').asString := '';

  if SelecionarSomenteClassesComObservacoesVenda then
    qryProdutos.macrobyname('SelecionarSomenteClassesComObservacoesVenda').asString := 'and nullif(cl.observacoesvenda,'''') is not null'
  else
    qryProdutos.macrobyname('SelecionarSomenteClassesComObservacoesVenda').asString := '';

  if SelecionarSomenteMarcasComObservacoesVenda then
    qryProdutos.macrobyname('SelecionarSomenteMarcasComObservacoesVenda').asString := 'and nullif(m.observacoesvenda,'''') is not null'
  else
    qryProdutos.macrobyname('SelecionarSomenteMarcasComObservacoesVenda').asString := '';

  if ListaCondicaoProduto<>'' then
  begin
    qryProdutos.macrobyname('ListaCondicaoProduto').asString := ' and (' +ListaCondicaoProduto + ')';
    qryProdutosObservacoesGerais.macrobyname('ListaCondicaoProduto').asString := ' and (' +ListaCondicaoProduto + ')';
  end;

  if ListaCondicaoGrupo<>'' then
  begin
    qryProdutos.macrobyname('ListaCondicaoGrupo').asString := ' and ('+ ListaCondicaoGrupo + ')';
    qryProdutosObservacoesGerais.macrobyname('ListaCondicaoGrupo').asString := ' and ('+ ListaCondicaoGrupo + ')';
  end;

  if ListaCondicaoClasse<>'' then
  begin
    qryProdutos.macrobyname('ListaCondicaoClasse').asString := ' and ('+ ListaCondicaoClasse + ')';
    qryProdutosObservacoesGerais.macrobyname('ListaCondicaoClasse').asString := ' and ('+ ListaCondicaoClasse + ')';
  end;

  if ListaCondicaoMarca<>'' then
  begin
    qryProdutos.macrobyname('ListaCondicaoMarca').asString := ' and ('+ ListaCondicaoMarca + ')';
    qryProdutosObservacoesGerais.macrobyname('ListaCondicaoMarca').asString := ' and ('+ ListaCondicaoMarca + ')';
  end;

  if ListaCondicaoPromocoes<>'' then
  begin
    qryProdutos.macrobyname('ListaCondicaoPromocoes').asString := ' and ('+ ListaCondicaoPromocoes + ')';
    qryProdutosObservacoesGerais.macrobyname('ListaCondicaoPromocoes').asString := ' and ('+ ListaCondicaoPromocoes + ')';
  end;

  qryProdutos.open;
  qryProdutosObservacoesGerais.open;

  if SelecionarSomenteGruposComObservacoesVenda then
    qryGrupos.macrobyname('SelecionarSomenteGruposComObservacoesVenda').asString := 'and nullif(g.observacoesvenda,'''') is not null'
  else
    qryGrupos.macrobyname('SelecionarSomenteGruposComAgendamento').asString := '';

  if ListaCondicaoGrupo<>'' then
    qryGrupos.macrobyname('ListaCondicaoGrupo').asString := ' and ('+ ListaCondicaoGrupo + ')';
  qryGrupos.open;


  if SelecionarSomenteClassesComObservacoesVenda then
    qryClasses.macrobyname('SelecionarSomenteClassesComObservacoesVenda').asString := 'and nullif(cl.observacoesvenda,'''') is not null'
  else
    qryClasses.macrobyname('SelecionarSomenteClassesComObservacoesVenda').asString := '';

  if ListaCondicaoClasse<>'' then
    qryClasses.macrobyname('ListaCondicaoClasse').asString := ' and ('+ ListaCondicaoClasse + ')';
  qryClasses.open;

  if SelecionarSomenteMarcasComObservacoesVenda then
    qryMarcas.macrobyname('SelecionarSomenteMarcasComObservacoesVenda').asString := 'and nullif(m.observacoesvenda,'''') is not null'
  else
    qryMarcas.macrobyname('SelecionarSomenteMarcasComObservacoesVenda').asString := '';

  if ListaCondicaoMarca<>'' then
    qryMarcas.macrobyname('ListaCondicaoMarca').asString := ' and ('+ ListaCondicaoMarca + ')';
  qryMarcas.open;

  if (qryProdutos.recordcount <> 0) or
     (qryProdutosObservacoesGerais.recordcount <> 0) or
     (qryGrupos.recordcount <> 0) or
     (qryClasses.recordcount <> 0) or
     (qryMarcas.recordcount <> 0) then
    result := true
  else
  begin
    result := false;
    MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
  end;

end;

function TdtmManutencaoObservacoesVenda.SalvarManutencao: Boolean;
begin

  try
    qryGravarProdutos.Sql.clear;

    qryProdutos.DisableControls;

    qryProdutos.first;
    while not qryProdutos.eof do
    begin
      if qryProdutosorigem.asString = 'PRODUTOS' then
      begin

        if qryProdutosincluido.asBoolean OR qryProdutosalterado.asBoolean then
        begin
          if trim(qryProdutosobservacoesvenda.asstring)='' then
            qryGravarProdutos.Sql.Append('update caracteristicas set observacoesvenda = null where codigo = ' + qryProdutoscodigo.asSTring + ';')
          else
            qryGravarProdutos.Sql.Append('update caracteristicas set observacoesvenda = '+
                  quotedstr(qryProdutosobservacoesvenda.asString) +' where codigo = ' + qryProdutoscodigo.asSTring + ';');

        end;
      end;
      qryProdutos.next;
    end;

  finally
    qryProdutos.enablecontrols;
  end;

  if qryGravarProdutos.Sql.Count <> 0 then
    qryGravarProdutos.ExecSql;

  result := perpetrar([qryMarcas, qryClasses, qryGrupos, qryGravarProdutos, qryProdutosObservacoesGerais]);


end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutos.state = dsinsert then
    qryProdutosincluido.asBoolean := true;

  if qryProdutos.state = dsedit then
    qryProdutosalterado.asBoolean := true;

  if trim(qryProdutosobservacoesvenda.asString) = '' then
    qryProdutosobservacoesvenda.clear;

end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  NotificarScroll(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
  GravarProdutos;
end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryGruposAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  NotificarScroll(DataSet);
  qryGruposcodigo.readonly := (qryGrupos.state <> dsinsert)
end;

procedure TdtmManutencaoObservacoesVenda.qryGruposAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
  GravarGrupos;
end;

procedure TdtmManutencaoObservacoesVenda.qryGruposAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryGrupos.readonly := false;
  NotificarInsertGrupo(DataSet);
  qryGruposcodigo.readonly := false;
end;

procedure TdtmManutencaoObservacoesVenda.qryGruposAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryClassesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  NotificarScroll(DataSet);
  qryClassescodigo.readonly := (qryClasses.state <> dsinsert)
end;

procedure TdtmManutencaoObservacoesVenda.qryClassesAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
  GravarClasses;
end;

procedure TdtmManutencaoObservacoesVenda.qryClassesAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryClassescodigo.readonly := false;
  NotificarInsertClasses(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryClassesAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryMarcasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  NotificarScroll(DataSet);
  qryMarcascodigo.readonly := (qryMarcas.state <> dsinsert)
end;

procedure TdtmManutencaoObservacoesVenda.qryMarcasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
  GravarMarcas;
end;

procedure TdtmManutencaoObservacoesVenda.qryMarcasAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryMarcascodigo.readonly := false;
  NotificarInsertMarcas(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryMarcasAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.GravarClasses;
begin
  try
    qryProdutos.AfterPost := nil;
    qryProdutos.AfterScroll := nil;

    qryClasses.AfterPost := nil;
    GuardarRegistroAtual(qryProdutos, true);

    AtribuirDados(qryProdutos,
                  [qryProdutosobservacoesvenda],
                  [qryClassesobservacoesvenda.asString],

                  [qryProdutosclasse,
                   qryProdutosorigem,
                   qryProdutosobservacoesvenda],

                  [qryClassescodigo.asSTring,
                   'CLASSE', qryClassesobservacoesvenda.asString],
                  ['=','=','<>']);

  finally
    qryProdutos.AfterPost := qryProdutosAfterPost;
    qryProdutos.AfterScroll := qryProdutosAfterScroll;
    qryclasses.AfterPost := qryclassesAfterPost;
    VoltarRegistroAtual(qryProdutos);
  end;

end;

procedure TdtmManutencaoObservacoesVenda.GravarGrupos;
begin
  try
    qryProdutos.AfterPost := nil;
    qryProdutos.AfterScroll := nil;

    qryGrupos.AfterPost := nil;
    GuardarRegistroAtual(qryProdutos, true);

    AtribuirDados(qryProdutos,
                  [qryProdutosobservacoesvenda],
                  [qryGruposobservacoesvenda.asString],

                  [qryProdutosgrupo,
                   qryProdutosorigem,
                   qryProdutosobservacoesvenda],

                  [qrygruposcodigo.asString,
                   'GRUPO', qryGruposobservacoesvenda.asString],
                  ['=','=','<>']);

  finally
    qryProdutos.AfterPost := qryProdutosAfterPost;
    qryProdutos.AfterScroll := qryProdutosAfterScroll;
    qryGrupos.AfterPost := qryGruposAfterPost;
    VoltarRegistroAtual(qryProdutos);
  end;

end;

procedure TdtmManutencaoObservacoesVenda.GravarMarcas;
begin

  try
    qryProdutos.AfterPost := nil;
    qryProdutos.AfterScroll := nil;

    qryMarcas.AfterPost := nil;
    GuardarRegistroAtual(qryProdutos, true);

    AtribuirDados(qryProdutos,
                  [qryProdutosobservacoesvenda],
                  [qryMarcasobservacoesvenda.asString],

                  [qryProdutosclasse,
                   qryProdutosorigem,
                   qryProdutosobservacoesvenda],

                  [qryMarcascodigo.asString,
                   'MARCA', qryMarcasobservacoesvenda.asString],
                  ['=','=','<>']);

  finally
    qryProdutos.AfterPost := qryProdutosAfterPost;
    qryProdutos.AfterScroll := qryProdutosAfterScroll;
    qryMarcas.AfterPost := qryMarcasAfterPost;
    VoltarRegistroAtual(qryProdutos);
  end;

end;

procedure TdtmManutencaoObservacoesVenda.GravarProdutos;
var
 vObservacoes : String;
begin

  try

    qryProdutos.AfterPost := nil;
    qryGrupos.AfterPost := nil;
    qryClasses.AfterPost := nil;
    qryMarcas.AfterPost := nil;

    qryProdutos.DesativarOrdenacao;
    qryProdutos.GuardarRegistroAtual(true);

    vObservacoes := qryProdutosobservacoesvenda.asString;

    if qryProdutosorigem.asString = 'GRUPO' then
    begin

      if qryGrupos.locate('codigo', qryProdutosgrupo.asString, []) then
      begin

        if (vObservacoes <> qryGruposobservacoesvenda.asString) then
        begin
          qryGrupos.edit;
          qryGruposobservacoesvenda.asString :=  vObservacoes;
          qryGrupos.post;
        end;

        AtribuirDados(qryProdutos,
                      [qryProdutosobservacoesvenda],
                      [vObservacoes],

                      [qryProdutosgrupo,
                       qryProdutosorigem,
                       qryProdutosobservacoesvenda],

                      [qryProdutosgrupo.asString,
                       'GRUPO', vObservacoes],
                      ['=','=','<>']);

      end;
    end
    else
    if qryProdutosorigem.asString = 'CLASSE' then
    begin
      if qryClasses.locate('codigo', qryProdutosclasse.asString, []) then
      begin

        if (vObservacoes <> qryClassesobservacoesvenda.asString) then
        begin
          qryclasses.edit;
          qryClassesobservacoesvenda.asString :=  vObservacoes;
          qryclasses.post;
        end;

        AtribuirDados(qryProdutos,
                      [qryProdutosobservacoesvenda],
                      [vObservacoes],

                      [qryProdutosclasse,
                       qryProdutosorigem,
                       qryProdutosobservacoesvenda],

                      [qryProdutosclasse.asString,
                       'CLASSE', vObservacoes],
                      ['=','=','<>']);

      end;
    end
    else
    if qryProdutosorigem.asString = 'MARCA' then
    begin
      if qryMarcas.locate('codigo', qryProdutosmarca.asString, []) then
      begin
        if (vObservacoes <> qryMarcasobservacoesvenda.asString) then
        begin
          qryMarcas.edit;
          qryMarcasobservacoesvenda.asString :=  vObservacoes;
          qryMarcas.post;
        end;

        AtribuirDados(qryProdutos,
                      [qryProdutosobservacoesvenda],
                      [vObservacoes],

                      [qryProdutosmarca,
                       qryProdutosorigem,
                       qryProdutosobservacoesvenda],

                      [qryProdutosmarca.asString,
                       'CLASSE', vObservacoes],
                      ['=','=','<>']);

      end;
    end;

  finally
    qryProdutos.AfterPost := qryProdutosAfterPost;
    qryGrupos.AfterPost := qryGruposAfterPost;
    qryClasses.AfterPost := qryClassesAfterPost;
    qryMarcas.AfterPost := qryMarcasAfterPost;

    qryProdutos.VoltarRegistro;
    qryProdutos.ativarOrdenacao;
  end;

end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  NotificarAlteracao(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.GravarProdutosObservacoesGerais;
begin

end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  NotificarScroll(DataSet);
end;

procedure TdtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if trim(qryProdutosObservacoesGeraisobservacao.asstring) = '' then
    qryProdutosObservacoesGeraisobservacao.clear;

  if qryProdutos.state = dsinsert then
    qryProdutosincluido.asBoolean := true;

  if qryProdutos.state = dsedit then
    qryProdutosalterado.asBoolean := true;

end;

procedure TdtmManutencaoObservacoesVenda.qryMarcasBeforePost(
  DataSet: TDataSet);
begin
  inherited;

  if trim(qryMarcasobservacoesvenda.AsString) = '' then
    qryMarcasobservacoesvenda.clear;

end;

procedure TdtmManutencaoObservacoesVenda.qryClassesBeforePost(
  DataSet: TDataSet);
begin
  inherited;

  if trim(qryClassesobservacoesvenda.AsString) = '' then
    qryClassesobservacoesvenda.clear;

end;

procedure TdtmManutencaoObservacoesVenda.qryGruposBeforePost(
  DataSet: TDataSet);
begin
  inherited;

  if trim(qryGruposobservacoesvenda.AsString) = '' then
    qryGruposobservacoesvenda.clear;

end;

end.
