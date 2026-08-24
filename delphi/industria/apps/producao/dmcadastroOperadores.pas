unit dmCadastroOperadores;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource,
  //Biblio
  ctconstantes, Biblio, dmbasico, clparametrossistema,
  //Repositorio
  dmtecsoft, dmconsultaenderecos, ZTransact;


type
  TdtmCadastroOperadores = class(TdtmBasico)
    qryUsuarios: TtecQuery;
    dsrUsuarios: TtecDataSource;
    qryUsuariosInstrucoesTrabalho: TtecQuery;
    dsrUsuariosInstrucoesTrabalho: TtecDataSource;
    qryUsuarioscodigo: TIntegerField;
    qryUsuariosnome: TStringField;
    qryUsuariossalariohora: TFloatField;
    qryUsuariosanuenio: TFloatField;
    qryUsuariosturno: TIntegerField;
    qryUsuariosInstrucoesTrabalhousuario: TIntegerField;
    qryUsuariosInstrucoesTrabalhoinstrucaotrabalho: TIntegerField;
    qryUsuariosInstrucoesTrabalhonivelconhecimento: TIntegerField;
    qryUsuariosInstrucoesTrabalhohabilitadosetup: TBooleanField;
    qryUsuariosInstrucoesTrabalhoinstrucao: TStringField;
    qryUsuariosInstrucoesTrabalhodescricaonivelconhecimento: TStringField;
    qryUsuariosInstrucoesTrabalhodescricaoinstrucao: TStringField;
    qryUsuariosInstrucoesTrabalhodatainicialtreinamento: TDateField;
    qryUsuariosInstrucoesTrabalhodatafinaltreinamento: TDateField;
    qryUsuariosinativo: TStringField;
    qryUsuariosInstrucoesTrabalhoinativo: TDateField;
    qryUsuariosInstrucoesTrabalhoUltimaAtividade: TDateField;

    procedure qryUsuariosFiliaisAfterDelete(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryUsuariosInstrucoesTrabalhoAfterOpen(DataSet: TDataSet);
    procedure qryUsuariosInstrucoesTrabalhoAfterPost(DataSet: TDataSet);
    procedure qryUsuariosInstrucoesTrabalhoAfterDelete(DataSet: TDataSet);
    procedure qryUsuariosInstrucoesTrabalhoBeforePost(DataSet: TDataSet);
    procedure qryUsuariosAfterScroll(DataSet: TDataSet);
    procedure qryUsuariosInstrucoesTrabalhoNewRecord(DataSet: TDataSet);
    procedure qryUsuariosInstrucoesTrabalhoAfterScroll(DataSet: TDataSet);
    procedure dsrUsuariosInstrucoesTrabalhoDataChange(Sender: TObject;
      Field: TField);
    procedure qryUsuariosInstrucoesTrabalhoAfterEdit(DataSet: TDataSet);
//    procedure qryUsuariosAfterInsert(DataSet: TDataSet);
  private
{    FTipoClienteEntrada: String;
    FTipoClienteSaida: String;
    FNomeFornecedor: String;
    FNomeCliente: String;
}
    FOptantepeloSimples: Boolean;
    FDataChangeFiliais: TNotifyEvent;
    FListaInstrucaoSelecionadas: String;
//    FOnScrollInternet: TNotifyEvent;
  private
    procedure AtualizaListaInstrucao;


  protected
    FNRComissoes: Integer;
    FSerieFilial: String;
    
  public
    procedure AbreTabelasParametrosSistemas(Procura: TtecParametroSistemas);
    constructor Create(AOwner: TComponent); override;
    procedure EditarUsuarios;
    procedure FechaTabelasConsulta(Procura: TtecProcuraFiliais);
    procedure FechaTabelasUsuarios(Procura: TtecProcuraUsuarios);
    procedure FechaTabelasParametrosSistemas(Procura: TtecParametroSistemas);
//    function  IncluirUsuario: Boolean;
    procedure EditarUsuariosinstrucaoProducao;
    property ListaInstrucaoSelecionadas: String read FListaInstrucaoSelecionadas write FListaInstrucaoSelecionadas;
    function SalvarUsuariosInstrucoesTrabalho(gravar: Boolean): boolean;
    procedure GravarUsuariosinstrucaoProducao;
    procedure SelecionarUsuario(Pesquisa: TtecProcuraUsuarios);
    function GravarOperador: boolean;
    procedure IncluirInstrucaoTrabalho;
    procedure ExcluirInstrucaoTrabalho;

  end;

var
  dtmCadastroOperadores: TdtmCadastroOperadores;

implementation

{$R *.dfm}

uses clusuario;

constructor TdtmCadastroOperadores.Create(AOwner: TComponent);
begin
  inherited;
  qryUsuarios.Tag                    := ctCadastroUsuarios;
  FListaInstrucaoSelecionadas := '0';
end;

procedure TdtmCadastroOperadores.EditarUsuarios;
begin
  if Not (qryUsuarios.State in [dsEdit, dsInsert]) then
    qryUsuarios.Edit
end;
 {
function TdtmCadastroOperadores.IncluirUsuario: Boolean;
begin
  qryUsuarios.edit;
  Result := True;
end;
  }


procedure TdtmCadastroOperadores.AbreTabelasParametrosSistemas(Procura: TtecParametroSistemas);
begin
  case Procura of
    psMODULO    : Abre(ctTabelaConsultaModulos);
    psPARAMETRO : Abre(ctTabelaConsultaParametros);
    psFILIAL    : Abre(ctCrediarioTabelaConsultaFiliais);
  end;
end;

procedure TdtmCadastroOperadores.FechaTabelasConsulta(Procura: TtecProcuraFiliais);
begin
  case Procura of
    tpFILIAIS,
    tpFILIALCONTABILFILIAIS,
    tpFILIALMONTAGEMFILIAIS,
    tpFILIALCONSOLIDADORADIME : Fecha(ctCrediarioTabelaConsultaFiliais);
    tpCOLUNASPRECONORMALFILIAIS,
    tpCOLUNASPRECOPROMOCAOFILIAIS: Fecha(ctTabelasConsultaColunas);
    tpfCONTADEBITO,
    tpfCONTACREDITO         : Fecha(ctConsultaContaContabil);
  end;
end;

procedure TdtmCadastroOperadores.FechaTabelasParametrosSistemas(Procura: TtecParametroSistemas);
begin
  case Procura of
    psMODULO    : Fecha(ctTabelaConsultaModulos);
    psPARAMETRO : Fecha(ctTabelaConsultaParametros);
    psFILIAL    : Fecha(ctCrediarioTabelaConsultaFiliais);
  end;
end;

procedure TdtmCadastroOperadores.FechaTabelasUsuarios(Procura: TtecProcuraUsuarios);
begin
  case Procura of
    tpSETORES: Fecha(ctTabelaConsultaSetores);
    tpFILIAL : Fecha(ctCrediarioTabelaConsultaFiliais);
    tpFILTRO : Fecha(ctTabelasConsultaFiltrosSAC);
    tpUSUARIO: Fecha(ctTabelasConsultaUsuarios);
    tpCOMISSOESGRUPOS : Fecha(ctConsultaGrupos);
    tpCOMISSOESCLASSES : Fecha(ctConsultaClasses);
  end;
end;

{

procedure TdtmCadastroOperadores.SetUsuarioSomenteLeitura(const Value: Boolean);
begin
  qryUsuarios.RequestLive := Not Value;
end;
function TdtmCadastroOperadores.GetUsuarioSomenteLeitura: Boolean;
begin
  Result := Not qryUsuarios.RequestLive
end;
 }
procedure TdtmCadastroOperadores.qryUsuariosFiliaisAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  if not (qryUsuarios.State in [dsEdit, dsInsert]) then
    qryUsuarios.Edit;
end;

procedure TdtmCadastroOperadores.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\log.sql') then
    Listar.loadfromfile('c:\log.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\log.sql');
  listar.free;
end;

procedure TdtmCadastroOperadores.EditarUsuariosinstrucaoProducao;
begin
  if not (qryUsuariosInstrucoesTrabalho.State in [dsedit, dsinsert]) then
    qryUsuariosInstrucoesTrabalho.Edit;

end;

procedure TdtmCadastroOperadores.AtualizaListaInstrucao;
var
  Pos: TBookmark;
begin
  Pos := qryUsuariosInstrucoesTrabalho.GetBookmark;
  qryUsuariosInstrucoesTrabalho.DisableControls;
  try
    ListaInstrucaoSelecionadas := '';
    qryUsuariosInstrucoesTrabalho.First;
    while Not qryUsuariosInstrucoesTrabalho.Eof do
    begin
      if qryUsuariosInstrucoesTrabalhoinstrucaotrabalho.AsString<>'' then
      begin
        ListaInstrucaoSelecionadas := ListaInstrucaoSelecionadas +
                                     qryUsuariosInstrucoesTrabalhoinstrucaotrabalho.AsString + ',';
      end;
      qryUsuariosInstrucoesTrabalho.Next
    end;

    if ListaInstrucaoSelecionadas <> '' then
      ListaInstrucaoSelecionadas := copy(ListaInstrucaoSelecionadas,0, Length(ListaInstrucaoSelecionadas)-1)
    else
      ListaInstrucaoSelecionadas := '0';

  finally
    qryUsuariosInstrucoesTrabalho.GotoBookmark(Pos);
    qryUsuariosInstrucoesTrabalho.FreeBookmark(Pos);
    qryUsuariosInstrucoesTrabalho.EnableControls;
  end
end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaListaInstrucao;
  qryUsuariosInstrucoesTrabalho.First;
end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarUsuarios;
  AtualizaListaInstrucao;
end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarUsuarios;
  AtualizaListaInstrucao;

end;

function TdtmCadastroOperadores.SalvarUsuariosInstrucoesTrabalho(gravar: Boolean): boolean;
begin
  result := true;
  if (qryUsuariosInstrucoesTrabalho.State in [dsedit, dsinsert]) then
  begin
    if qryUsuariosInstrucoesTrabalho.CheckRequiredFields then
    begin
      if gravar then
        qryUsuariosInstrucoesTrabalho.Post
    end
    else
      result := false;
  end;
end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  SalvarUsuariosInstrucoesTrabalho(false);
end;

procedure TdtmCadastroOperadores.GravarUsuariosinstrucaoProducao;
begin
  if (qryUsuariosInstrucoesTrabalho.State in [dsedit, dsinsert]) then
     qryUsuariosInstrucoesTrabalho.Post;
end;


procedure TdtmCadastroOperadores.SelecionarUsuario(
  Pesquisa: TtecProcuraUsuarios);
begin
 case pesquisa of
 tpUSUARIO : ReFazConsulta(qryUsuarios,[0],[qryUsuarioscodigo.asInteger]);
 end;
end;

procedure TdtmCadastroOperadores.qryUsuariosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryUsuariosInstrucoesTrabalho,['usuario'], [qryUsuarioscodigo.AsVariant]);
  qryUsuarios.ReadOnly := qryUsuariosInativo.AsString = 'INATIVO';
  qryUsuariosInstrucoesTrabalho.ReadOnly := qryUsuarios.ReadOnly;
end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryUsuariosInstrucoesTrabalhousuario.AsInteger := qryUsuarioscodigo.AsInteger;
  qryUsuariosInstrucoesTrabalhohabilitadosetup.AsBoolean := false;
end;

function TdtmCadastroOperadores.GravarOperador: boolean;
begin
  result := qryUsuarios.CheckRequiredFields;
  
  if result then
    result := Perpetrar([qryUsuarios,qryUsuariosInstrucoesTrabalho]);
end;

procedure TdtmCadastroOperadores.IncluirInstrucaoTrabalho;
begin
  qryUsuariosInstrucoesTrabalho.append;
end;

procedure TdtmCadastroOperadores.ExcluirInstrucaoTrabalho;
begin
  if not qryUsuariosInstrucoesTrabalho.isempty then
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a INSTRUÇÃO DE TRABALHO'])) = smbOk then
      qryUsuariosInstrucoesTrabalho.Delete;


end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
//  qryUsuariosInstrucoesTrabalhohorainicialtreinamento.ReadOnly := qryUsuariosInstrucoesTrabalhodatainicialtreinamento.IsNull;
  qryUsuariosInstrucoesTrabalhodatafinaltreinamento.ReadOnly := qryUsuariosInstrucoesTrabalhodatainicialtreinamento.IsNull;
//  qryUsuariosInstrucoesTrabalhohorafinaltreinamento.ReadOnly := qryUsuariosInstrucoesTrabalhodatainicialtreinamento.IsNull;

  
end;

procedure TdtmCadastroOperadores.dsrUsuariosInstrucoesTrabalhoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

  if (field = qryUsuariosInstrucoesTrabalhodatainicialtreinamento) then
  begin
    if NOT qryUsuariosInstrucoesTrabalhodatafinaltreinamento.IsNull AND
       NOT qryUsuariosInstrucoesTrabalhodatainicialtreinamento.IsNull AND
       (qryUsuariosInstrucoesTrabalhodatainicialtreinamento.Asdatetime >
        qryUsuariosInstrucoesTrabalhodatafinaltreinamento.AsDateTime) then
    begin
      MensagemErro('A data inicial não pode ser superior à final.');
      qryUsuariosInstrucoesTrabalhodatainicialtreinamento.Clear;
    end;
  end
  {
  else
  if (field = qryUsuariosInstrucoesTrabalhohorainicialtreinamento) then
  begin
    if NOT qryUsuariosInstrucoesTrabalhohorafinaltreinamento.IsNull AND
       (qryUsuariosInstrucoesTrabalhohorainicialtreinamento.AsDateTime >
        qryUsuariosInstrucoesTrabalhohorafinaltreinamento.AsDateTime) and
       (qryUsuariosInstrucoesTrabalhodatainicialtreinamento.AsDatetime >=
        qryUsuariosInstrucoesTrabalhodatafinaltreinamento.Asdatetime) then
    begin
      MensagemErro('A hora inicial não pode ser superior à final.');
      qryUsuariosInstrucoesTrabalhohorainicialtreinamento.Clear;
    end;
  end

  else
  if (field = qryUsuariosInstrucoesTrabalhohorafinaltreinamento) then
  begin
    if qryUsuariosInstrucoesTrabalhodatafinaltreinamento.isnull and not qryUsuariosInstrucoesTrabalhohorafinaltreinamento.isnull then
      qryUsuariosInstrucoesTrabalhodatafinaltreinamento.asdatetime := DataServidor;

    if NOT qryUsuariosInstrucoesTrabalhohorafinaltreinamento.IsNull AND
       (qryUsuariosInstrucoesTrabalhohorainicialtreinamento.Asdatetime >
        qryUsuariosInstrucoesTrabalhohorafinaltreinamento.AsDateTime) and
       (qryUsuariosInstrucoesTrabalhodatainicialtreinamento.AsDateTime >=
        qryUsuariosInstrucoesTrabalhodatafinaltreinamento.AsDateTime) then
    begin
      MensagemErro('A hora final não pode ser inferior à inicial.');
      qryUsuariosInstrucoesTrabalhohorafinaltreinamento.Clear;
    end;
  end
  }
  else
  if (field = qryUsuariosInstrucoesTrabalhodatafinaltreinamento) then
  begin
    if NOT qryUsuariosInstrucoesTrabalhodatainicialtreinamento.IsNull AND
       NOT qryUsuariosInstrucoesTrabalhodatafinaltreinamento.IsNull AND
       (qryUsuariosInstrucoesTrabalhodatainicialtreinamento.AsDateTime >
        qryUsuariosInstrucoesTrabalhodatafinaltreinamento.AsDateTime) then
    begin
      MensagemErro('A data final não pode ser inferior à inicial.');
      qryUsuariosInstrucoesTrabalhodatafinaltreinamento.Clear;
    end;
  end;
  qryUsuariosInstrucoesTrabalhoAfterScroll(nil);

end;

procedure TdtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
    EditarUsuarios;

end;

end.
