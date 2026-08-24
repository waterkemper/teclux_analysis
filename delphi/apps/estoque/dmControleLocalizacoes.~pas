unit dmControleLocalizacoes;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, variants, ctconstantes, biblio,  DBAdvGrid, frxClass,
  frxDBSet, forms;

type
  TdtmControleLocalizacoes = class(TdtmBasico)
    dsrProdutosLocalizacao: TtecDataSource;
    qryProdutosLocalizacao: TtecQuery;
    qryProdutosLocalizacaocodigo: TLargeintField;
    qryProdutosLocalizacaocodigovisual: TStringField;
    qryProdutosLocalizacaodescricao: TStringField;
    qryProdutosLocalizacaovalorgrade1: TStringField;
    qryProdutosLocalizacaovalorgrade2: TStringField;
    qryProdutosLocalizacaograde1: TIntegerField;
    qryProdutosLocalizacaograde2: TIntegerField;
    qryProdutosLocalizacaolinha: TStringField;
    qryProdutosLocalizacaocoluna: TStringField;
    qryProdutosLocalizacaolocalizacao: TStringField;
    qryProdutosLocalizacaosublocalizacao: TStringField;
    qryLocalizacao: TtecQuery;
    qryProcuraProdutosCodigoBarras: TtecQuery;
    qryProcuraProdutosCodigoBarrascodigo: TLargeintField;
    qryProcuraProdutosCodigoBarrascodigovisual: TStringField;
    qryProcuraProdutosCodigoBarrascodigobarras: TStringField;
    qryProcuraProdutosCodigoBarrasdescricao: TStringField;
    qryProcuraProdutosCodigoBarrasvalorgrade1: TStringField;
    qryProcuraProdutosCodigoBarraslinha: TStringField;
    qryProcuraProdutosCodigoBarrasvalorgrade2: TStringField;
    qryProcuraProdutosCodigoBarrascoluna: TStringField;
    qryProcuraProdutosCodigoBarraslocalizacao: TStringField;
    qryProcuraProdutosCodigoBarrassublocalizacao: TStringField;
    qryProcuraProdutos: TtecQuery;
    qryProcuraProdutoscodigo: TLargeintField;
    qryProcuraProdutoscodigovisual: TStringField;
    qryProcuraProdutosdescricao: TStringField;
    qryProcuraProdutosnomefoto: TStringField;
    qryProcuraProdutosnomethumb: TStringField;
    qryProcuraProdutosvalorgrade1: TStringField;
    qryProcuraProdutoslinha: TStringField;
    qryProcuraProdutosvalorgrade2: TStringField;
    qryProcuraProdutoscoluna: TStringField;
    qryProcuraProdutoslocalizacao: TStringField;
    qryProcuraProdutossublocalizacao: TStringField;
    qryProdutosLocalizacao_Gerar: TtecQuery;
    qryProdutosLocalizacao_Gerarcodigo: TLargeintField;
    qryProdutosLocalizacao_Gerarcodigovisual: TStringField;
    qryProdutosLocalizacao_Gerardescricao: TStringField;
    qryProdutosLocalizacao_Gerarvalorgrade1: TStringField;
    qryProdutosLocalizacao_Gerarvalorgrade2: TStringField;
    qryProdutosLocalizacao_Gerargrade1: TIntegerField;
    qryProdutosLocalizacao_Gerargrade2: TIntegerField;
    qryProdutosLocalizacao_Gerarlinha: TStringField;
    qryProdutosLocalizacao_Gerarcoluna: TStringField;
    qryProdutosLocalizacao_Gerarlocalizacao: TStringField;
    qryProdutosLocalizacao_Gerarsublocalizacao: TStringField;
    qryProdutosLocalizacaoretirar_localizacao: TBooleanField;
    qryProdutosLocalizacaoretirar_sublocalizacao: TBooleanField;
    qryAtualizarLocalizacoes: TtecQuery;
    qryLocalizacoes: TtecQuery;
    qryLocalizacoeslocalizacao: TStringField;
    qryLocalizacoessublocalizacao: TStringField;
    dsrLocalizacoes: TtecDataSource;
    qryLocalizacoesselecionar: TBooleanField;
    qryPesquisarLocalizacoes: TtecQuery;
    dsrPesquisarLocalizacoes: TtecDataSource;
    qryPesquisarLocalizacoeslocalizacao: TStringField;
    qryPesquisarLocalizacoessublocalizacao: TStringField;
    qryPesquisarLocalizacoesselecionar: TBooleanField;
    frxEtiquetas: TfrxReport;
    frxDBDatasetEtiquetas: TfrxDBDataset;
    qryPesquisarLocalizacoesqtmarcados: TIntegerField;
    qryLocalizacoesimploc: TBooleanField;
    qryLocalizacoesimpsubloc: TBooleanField;
    qryLocalizacoeslocsubloc: TStringField;
    qryPesquisarLocalizacoesimploc: TBooleanField;
    qryPesquisarLocalizacoesimpsubloc: TBooleanField;
    qryProdutosLocalizacao_Geraremestoque: TFloatField;
    qryProdutosLocalizacaoemestoque: TFloatField;
    qryProcuraProdutosCodigoBarrasemestoque: TFloatField;
    qryProcuraProdutosemestoque: TFloatField;
    procedure qryProdutosLocalizacaoAfterInsert(DataSet: TDataSet);
    procedure qryProdutosLocalizacaoAfterDelete(DataSet: TDataSet);
    procedure qryProdutosLocalizacaoAfterPost(DataSet: TDataSet);
    procedure dsrPesquisarLocalizacoesDataChange(Sender: TObject;
      Field: TField);
    procedure dsrLocalizacoesDataChange(Sender: TObject; Field: TField);
    procedure qryLocalizacoesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryLocalizacoesCalcFields(DataSet: TDataSet);
    procedure qryPesquisarLocalizacoesNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  protected

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure gerarConsultaLocalizacoes(filial, Localizacao, SubLocalizacao: String);
    procedure gravarProdutosLocalizacao(filial, Localizacao, SubLocalizacao: String);
    procedure LocalizarProduto(Filial, TextodePesquisa: String; TipoPesquisaProduto:TtecTipoPesquisaProduto);
    procedure RetirarProdutodaLista(RetirarTodos: Boolean);
    procedure MarcarLocalizacoes(SelecionarTodos: Boolean);
    procedure MarcarImpLocalizacoes(SelecionarTodos: Boolean);
    procedure MarcarImpSubLocalizacoes(SelecionarTodos: Boolean);


    function ImprimirEtiqueta(arquivofast: String): boolean;

  end;

var
  dtmControleLocalizacoes: TdtmControleLocalizacoes;

implementation

{$R *.dfm}

{ TdtmControleLocalizacoes }

constructor TdtmControleLocalizacoes.Create(AOwner: TComponent);
begin
  inherited;
  qryProdutosLocalizacao.tag := ctTabelas;
  qryLocalizacao.tag := ctTabelas;
end;

procedure TdtmControleLocalizacoes.gerarConsultaLocalizacoes(filial,
  Localizacao, SubLocalizacao: String);
begin
  qryProdutosLocalizacao_Gerar.ParamByName('filial').asSTring := filial;


  if Localizacao <> '' then
  begin
    qryProdutosLocalizacao_Gerar.MacroByName('CondicaoLocalizacao').asString :=
//      ' and coalesce(e.localizacao,'''') = coalesce(:localizacao,'''') ';
      ' and e.localizacao ilike ''%''||:localizacao||''%'' ';
    qryProdutosLocalizacao_Gerar.paramByName('localizacao').asString := Localizacao;
  end
  else
    qryProdutosLocalizacao_Gerar.MacroByName('CondicaoLocalizacao').asString := '';


  if SubLocalizacao <> '' then
  begin
    qryProdutosLocalizacao_Gerar.MacroByName('CondicaoSubLocalizacao').asString :=
//      ' and coalesce(e.sublocalizacao,'''') = coalesce(:sublocalizacao,'''') ';
      ' and e.sublocalizacao ilike ''%''||:sublocalizacao||''%'' ';
    qryProdutosLocalizacao_Gerar.paramByName('sublocalizacao').asString := SubLocalizacao;
  end
  else
    qryProdutosLocalizacao_Gerar.MacroByName('CondicaoSubLocalizacao').asString := '';


  qryProdutosLocalizacao_Gerar.close;
  qryProdutosLocalizacao_Gerar.open;

  qryProdutosLocalizacao.AfterInsert := nil;
  qryProdutosLocalizacao.AfterPost := nil;

  qryProdutosLocalizacao_Gerar.first;
  while not qryProdutosLocalizacao_Gerar.eof do
  begin
    if not qryProdutosLocalizacao.locate('codigo', qryProdutosLocalizacao_Gerarcodigo.AsString, []) then
      CopiarRegistros(qryProdutosLocalizacao_Gerar, qryProdutosLocalizacao, false, false, true, true, false, false);
    qryProdutosLocalizacao_Gerar.next;
  end;

  qryProdutosLocalizacao.AfterInsert := qryProdutosLocalizacaoAfterInsert;
  qryProdutosLocalizacao.AfterPost := qryProdutosLocalizacaoAfterPost;

end;

procedure TdtmControleLocalizacoes.LocalizarProduto(
  Filial, TextodePesquisa: String; TipoPesquisaProduto: TtecTipoPesquisaProduto);

  Procedure IncluirProduto;
  begin
    case TipoPesquisaProduto of

      pesCODIGOBARRAS:
      begin
        qryProdutosLocalizacao.disablecontrols;
        qryProdutosLocalizacao.append;
        qryProdutosLocalizacaocodigo.AsString := qryProcuraProdutosCodigoBarrascodigo.AsString;
        qryProdutosLocalizacaocodigovisual.asString := qryProcuraProdutosCodigoBarrascodigovisual.AsString;
        qryProdutosLocalizacaodescricao.asString := qryProcuraProdutosCodigoBarrasdescricao.asString;
        qryProdutosLocalizacaovalorgrade1.asString := qryProcuraProdutosCodigoBarrasvalorgrade1.asString;
        qryProdutosLocalizacaovalorgrade2.asString := qryProcuraProdutosCodigoBarrasvalorgrade2.asString;
        qryProdutosLocalizacaolinha.asString := qryProcuraProdutosCodigoBarraslinha.asString;
        qryProdutosLocalizacaocoluna.asString := qryProcuraProdutosCodigoBarrascoluna.asString;
        qryProdutosLocalizacaolocalizacao.value := qryProcuraProdutosCodigoBarraslocalizacao.value;
        qryProdutosLocalizacaosublocalizacao.value := qryProcuraProdutosCodigoBarrassublocalizacao.value;
        qryProdutosLocalizacaoemestoque.value := qryProcuraProdutosCodigoBarrasemestoque.value;
        qryProdutosLocalizacao.Post;
        qryProdutosLocalizacao.enablecontrols;
      end;

      pesPRODUTO:
      begin
        qryProdutosLocalizacao.disablecontrols;
        qryProdutosLocalizacao.Append;
        qryProdutosLocalizacaocodigo.AsString := qryProcuraProdutoscodigo.AsString;
        qryProdutosLocalizacaocodigovisual.asString := qryProcuraProdutoscodigovisual.AsString;
        qryProdutosLocalizacaodescricao.asString := qryProcuraProdutosdescricao.asString;
        qryProdutosLocalizacaovalorgrade1.asString := qryProcuraProdutosvalorgrade1.asString;
        qryProdutosLocalizacaovalorgrade2.asString := qryProcuraProdutosvalorgrade2.asString;
        qryProdutosLocalizacaolinha.asString := qryProcuraProdutoslinha.asString;
        qryProdutosLocalizacaocoluna.asString := qryProcuraProdutoscoluna.asString;
        qryProdutosLocalizacaolocalizacao.value := qryProcuraProdutoslocalizacao.value;
        qryProdutosLocalizacaosublocalizacao.value := qryProcuraProdutossublocalizacao.value;
        qryProdutosLocalizacaoemestoque.value := qryProcuraProdutosemestoque.value;
        qryProdutosLocalizacao.Post;
        qryProdutosLocalizacao.enablecontrols;
      end;

    end;
  end;


begin
  case TipoPesquisaProduto of
    pesCODIGOBARRAS:
    begin
      RefazConsultaPorNome(qryProcuraProdutosCodigoBarras,['filial','codigobarras'], [Filial, TextodePesquisa]);

      if qryProcuraProdutosCodigoBarras.IsEmpty then
        MensagemAviso(format('O produto com o Código de Barras ''%s'' não está cadastrado',[TextodePesquisa]), false)
      else
      if not qryProdutosLocalizacao.Locate('codigovisual', qryProcuraProdutosCodigoBarrascodigo.AsString,[]) then
        incluirproduto;
    end;

    pesPRODUTO:
    begin

      if not qryProdutosLocalizacao.Locate('codigovisual',TextodePesquisa,[]) then
      begin

        RefazConsultaPorNome(qryProcuraProdutos,['filial','codigo','codigovisual'], [filial, '0',TextodePesquisa]);

        if qryProcuraProdutos.IsEmpty then
          MensagemAviso(format('O produto com o Código ''%s'' não está cadastrado',[TextodePesquisa]), false)
        else
          IncluirProduto;

      end;

    end;
  end;
end;

procedure TdtmControleLocalizacoes.qryProdutosLocalizacaoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryLocalizacao.edit;
end;

procedure TdtmControleLocalizacoes.qryProdutosLocalizacaoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryLocalizacao.edit;
end;

procedure TdtmControleLocalizacoes.RetirarProdutodaLista(
  RetirarTodos: Boolean);
begin
  if retirartodos then
  begin
    if MensagemConfirmacao('Retirar todos os produtos da lista?')=smbOK then
    begin
      qryProdutosLocalizacao.close;
      qryProdutosLocalizacao.open;
    end;
  end
  else
  begin
    if MensagemConfirmacao('Retira este produto da lista?')=smbOK then
      qryProdutosLocalizacao.delete;
  end;
end;

procedure TdtmControleLocalizacoes.gravarProdutosLocalizacao(filial,
  Localizacao, SubLocalizacao: String);
var
  vMensagem : String;
begin
  if (Localizacao <> '') and (SubLocalizacao <> '') then
    vMensagem := format('Atualizar a localização e sublocalização dos produtos para '+chr(13)+
                 '''%s'' e ''%s'' e remover as localizações marcadas?',
                 [Localizacao, SubLocalizacao])
  else
  if (Localizacao = '') and (SubLocalizacao <> '') then
    vMensagem := format('Atualizar a sublocalização dos produtos para '+chr(13)+
                 '''%s'' e remover as localizações marcadas?',
                 [SubLocalizacao])

  else
  if (Localizacao <> '') and (SubLocalizacao = '') then
    vMensagem := format('Atualizar a localização dos produtos para '+chr(13)+
                 '''%s'' e remover as localizações marcadas?',
                 [Localizacao])
  else
  if (Localizacao = '') and (SubLocalizacao = '') then
    vMensagem := 'Atualizar os produtos e remover as localizações marcadas?';

  if MensagemConfirmacao(vMensagem)=smbOK then
  begin
    qryAtualizarLocalizacoes.Sql.clear;
    qryProdutosLocalizacao.first;
    while not qryProdutosLocalizacao.Eof do
    begin
      if qryProdutosLocalizacaoretirar_localizacao.AsBoolean then
      begin
        qryAtualizarLocalizacoes.Sql.Append(format('update estoques set localizacao=null where filial = %s and produto = %s ;',
            [filial, qryProdutosLocalizacaocodigo.asString]));

        qryProdutosLocalizacao.edit;
        qryProdutosLocalizacaoretirar_localizacao.AsBoolean := false;
        qryProdutosLocalizacaolocalizacao.Clear;
        qryProdutosLocalizacao.post;

      end
      else
      if (qryProdutosLocalizacaolocalizacao.AsString <> Localizacao) and (Localizacao<>'') then
      begin
        qryAtualizarLocalizacoes.Sql.Append(format('update estoques set localizacao=%s where filial = %s and produto = %s ;',
        [quotedstr(localizacao), filial, qryProdutosLocalizacaocodigo.asString]));

        qryProdutosLocalizacao.edit;
        qryProdutosLocalizacaolocalizacao.asString := localizacao;
        qryProdutosLocalizacao.post;

      end;

      if qryProdutosLocalizacaoretirar_sublocalizacao.AsBoolean then
      begin
        qryAtualizarLocalizacoes.Sql.Append(format('update estoques set sublocalizacao=null where filial = %s and produto = %s ;',
           [filial, qryProdutosLocalizacaocodigo.asString]));

        qryProdutosLocalizacao.edit;
        qryProdutosLocalizacaoretirar_sublocalizacao.AsBoolean := false;
        qryProdutosLocalizacaosublocalizacao.Clear;
        qryProdutosLocalizacao.post;

      end
      else
      if (qryProdutosLocalizacaosublocalizacao.AsString <> SubLocalizacao) and (SubLocalizacao<>'') then
      begin
        qryAtualizarLocalizacoes.Sql.Append(format('update estoques set sublocalizacao=%s where filial = %s and produto = %s ;',
          [quotedstr(sublocalizacao), filial, qryProdutosLocalizacaocodigo.asString]));

        qryProdutosLocalizacao.edit;
        qryProdutosLocalizacaosublocalizacao.asString := sublocalizacao;
        qryProdutosLocalizacao.post;

      end;

      qryProdutosLocalizacao.next;

    end;

    if qryAtualizarLocalizacoes.Sql.Count <> 0 then
    begin
      qryAtualizarLocalizacoes.ExecSql;
      if perpetrar([qryAtualizarLocalizacoes]) then
      begin
        qryLocalizacao.Close;
        qryLocalizacao.Open;
      end;
    end;
  end;

end;

procedure TdtmControleLocalizacoes.qryProdutosLocalizacaoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryLocalizacao.edit;
end;

procedure TdtmControleLocalizacoes.dsrPesquisarLocalizacoesDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryPesquisarLocalizacoesselecionar then
  begin
    if  qryLocalizacoesselecionar.asBoolean <> qryPesquisarLocalizacoesselecionar.AsBoolean then
    begin
      qryLocalizacoes.edit;
      qryLocalizacoesselecionar.asBoolean := qryPesquisarLocalizacoesselecionar.AsBoolean;
      if qryLocalizacoes.state = dsedit then
        qryLocalizacoes.post;
    end;
  end
  else
  if field = qryPesquisarLocalizacoesimploc then
  begin
    if  qryLocalizacoesimploc.asBoolean <> qryPesquisarLocalizacoesimploc.AsBoolean then
    begin
      qryLocalizacoes.edit;
      qryLocalizacoesimploc.asBoolean := qryPesquisarLocalizacoesimploc.AsBoolean;
      if qryLocalizacoes.state = dsedit then
        qryLocalizacoes.post;
    end;
  end
  else
  if field = qryPesquisarLocalizacoesimpsubloc then
  begin
    if  qryLocalizacoesimpsubloc.asBoolean <> qryPesquisarLocalizacoesimpsubloc.AsBoolean then
    begin
      qryLocalizacoes.edit;
      qryLocalizacoesimpsubloc.asBoolean := qryPesquisarLocalizacoesimpsubloc.AsBoolean;
      if qryLocalizacoes.state = dsedit then
        qryLocalizacoes.post;
    end;
  end;
end;

procedure TdtmControleLocalizacoes.MarcarLocalizacoes(
  SelecionarTodos: Boolean);
begin
  AtribuirDados(qryLocalizacoes, [qryLocalizacoesselecionar], [SelecionarTodos], true);

  dsrLocalizacoes.onDataChange := nil;
  if SelecionarTodos then
  begin
    qryPesquisarLocalizacoes.edit;
    qryPesquisarLocalizacoesqtmarcados.asInteger := qryLocalizacoes.recordcount;
    qryPesquisarLocalizacoes.post;
  end
  else
  begin
    qryPesquisarLocalizacoes.edit;
    qryPesquisarLocalizacoesqtmarcados.asInteger := 0;
    qryPesquisarLocalizacoes.post;
  end;

  dsrLocalizacoes.onDataChange := dsrLocalizacoesDataChange;
end;

procedure TdtmControleLocalizacoes.dsrLocalizacoesDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

  if field = qryLocalizacoesselecionar then
  begin
    if field.asBoolean then
    begin
      dsrPesquisarLocalizacoes.onDataChange := nil;
      qryPesquisarLocalizacoes.edit;
      qryPesquisarLocalizacoesqtmarcados.asinteger := qryPesquisarLocalizacoesqtmarcados.asinteger + 1;
//      qryPesquisarLocalizacoes.post;
      dsrPesquisarLocalizacoes.onDataChange := dsrPesquisarLocalizacoesDataChange;
    end
    else
    begin
      if qryPesquisarLocalizacoesqtmarcados.asinteger - 1 >= 0 then
      begin
        dsrPesquisarLocalizacoes.onDataChange := nil;
        qryPesquisarLocalizacoes.edit;
        qryPesquisarLocalizacoesqtmarcados.asinteger := qryPesquisarLocalizacoesqtmarcados.asinteger - 1;
//        qryPesquisarLocalizacoes.post;
        dsrPesquisarLocalizacoes.onDataChange := dsrPesquisarLocalizacoesDataChange;
      end;
    end;
  end
  else
  if field = qryLocalizacoesimploc then
  begin
    if not field.asBoolean and not qryLocalizacoesimpsubloc.asBoolean then
      qryLocalizacoesimpsubloc.asBoolean := True;
  end
  else
  if field = qryLocalizacoesimpsubloc then
  begin
    if not field.asBoolean and not qryLocalizacoesimploc.asBoolean then
      qryLocalizacoesimploc.asBoolean := True;
  end;
end;

function TdtmControleLocalizacoes.ImprimirEtiqueta(arquivofast: String): boolean;
var

vArquivo : String;
begin
  result := true;
  vArquivo := ExtractFilePath(Application.ExeName) + arquivofast;

  if not FileExists(vArquivo) then
  begin
    MensagemAviso(format('O arquivo ''%s'' não existe.',[vArquivo]));
    result := false;
  end;

  if result then
  begin
    try
      qryLocalizacoes.GuardarRegistroAtual(true,false);
      qryLocalizacoes.filtered := true;
//      qryLocalizacoes.First;

      frxEtiquetas.LoadFromFile(vArquivo);

//      frxEtiquetas.DesignReport;
      frxEtiquetas.ShowReport(true);

    finally
      qryLocalizacoes.filtered := false;
      qryLocalizacoes.VoltarRegistro;
    end;
  end;

end;

procedure TdtmControleLocalizacoes.qryLocalizacoesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryLocalizacoes.filtered then
    Accept := qryLocalizacoesselecionar.asBoolean;

end;

procedure TdtmControleLocalizacoes.qryLocalizacoesCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  if qryLocalizacoesimploc.asBoolean and qryLocalizacoesimpsubloc.asboolean then
  begin

    if (qryLocalizacoeslocalizacao.asString<>'') and (qryLocalizacoessublocalizacao.asString<>'') then
      qryLocalizacoeslocsubloc.asString := qryLocalizacoeslocalizacao.asString+'*'+
                                           qryLocalizacoessublocalizacao.asString
    else
    if (qryLocalizacoeslocalizacao.asString<>'') and (qryLocalizacoessublocalizacao.asString='') then
      qryLocalizacoeslocsubloc.asString := qryLocalizacoeslocalizacao.asString+'*'
    else
    if (qryLocalizacoeslocalizacao.asString='') and (qryLocalizacoessublocalizacao.asString<>'') then
      qryLocalizacoeslocsubloc.asString := '*'+qryLocalizacoeslocalizacao.asString;
  end
  else
  if qryLocalizacoesimploc.asBoolean and not qryLocalizacoesimpsubloc.asboolean then
    qryLocalizacoeslocsubloc.asString := qryLocalizacoeslocalizacao.asString+'*'
  else
  if not qryLocalizacoesimploc.asBoolean and qryLocalizacoesimpsubloc.asboolean then
    qryLocalizacoeslocsubloc.asString := '*'+qryLocalizacoessublocalizacao.asString;

end;

procedure TdtmControleLocalizacoes.MarcarImpSubLocalizacoes(
  SelecionarTodos: Boolean);
begin
  dsrLocalizacoes.onDataChange := nil;
  AtribuirDados(qryLocalizacoes, [qryLocalizacoesimpsubloc], [SelecionarTodos], true);
  dsrLocalizacoes.onDataChange := dsrLocalizacoesDataChange;
end;

procedure TdtmControleLocalizacoes.MarcarImpLocalizacoes(
  SelecionarTodos: Boolean);
begin
  dsrLocalizacoes.onDataChange := nil;
  AtribuirDados(qryLocalizacoes, [qryLocalizacoesimploc], [SelecionarTodos], true);
  dsrLocalizacoes.onDataChange := dsrLocalizacoesDataChange;
end;

procedure TdtmControleLocalizacoes.qryPesquisarLocalizacoesNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryPesquisarLocalizacoesimploc.asBoolean := true;
  qryPesquisarLocalizacoesimpsubloc.asBoolean := true;
end;

end.
