unit dmmanutencaoacessos;

interface

uses
  SysUtils, Classes, DB,
    //Terceiros
  ZQuery, ZPgSqlQuery,
  //Repositorio
  dmbasico, dmtecsoft, biblio, ctConstantes,
  //Componentes
  cpquery, cpdatasource, ZTransact;


type
  TdtmManutencaoAcessos = class(TdtmBasico)
    qryGruposUsuarios: TtecQuery;
    dsrGruposUsuarios: TtecDataSource;
    qryGruposUsuarioscodigo: TIntegerField;
    qryGruposUsuariosnome: TStringField;
    qryUsuarios: TtecQuery;
    qryUsuarioscodigo: TIntegerField;
    qryUsuariosnome: TStringField;
    qryUsuariosmarcar: TBooleanField;
    qryGruposUsuariosmarcar: TBooleanField;
    dsrUsuarios: TtecDataSource;
    qryAcessosModulos: TtecQuery;
    dsrAcessosModulos: TtecDataSource;
    qryUsuariosAcessosModulos: TtecQuery;
    dsrUsuariosAcessosModulos: TtecDataSource;
    qryUsuariosgrupo: TIntegerField;
    qryUsuariosAcessosModulosdescricao: TStringField;
    qryUsuariosAcessosModulosacesso: TIntegerField;
    qryAcessosModulosdescricao: TStringField;
    qryAtualizaUsuariosAcessosModulos: TtecQuery;
    qryAtualizaUsuariosAcessosModulosusuario: TIntegerField;
    qryAtualizaUsuariosAcessosModulosacesso: TIntegerField;
    dsrAtualizaUsuariosAcessosModulos: TtecDataSource;
    qryAcessosModuloscodigo: TIntegerField;
    qryExisteUsuarioAcessoModulo: TtecQuery;
    qryExisteUsuarioAcessoModulonacesso: TLargeintField;
    qryUsuariosAcessosModulos_Usuarios: TtecQuery;
    qryUsuariosAcessosModulos_GruposUsuarios: TtecQuery;
    qryAtualizaGruposUsuariosAcessosModulos: TtecQuery;
    dsrGruposAtualizaUsuariosAcessosModulos: TtecDataSource;
    qryExisteGrupoUsuarioAcessoModulo: TtecQuery;
    qryAtualizaGruposUsuariosAcessosModulosgrupo: TIntegerField;
    qryAtualizaGruposUsuariosAcessosModulosacesso: TIntegerField;
    qryExisteGrupoUsuarioAcessoModulonacesso: TLargeintField;
    qryUsuariosAcessosModulosIteclux: TtecQuery;
    dsrUsuariosAcessosModulosIteclux: TtecDataSource;
    qryUsuariosAcessosModulosItecluxdescricao: TStringField;
    qryUsuariosAcessosModulosItecluxacesso: TIntegerField;
    qryAcessosModulosIteclux: TtecQuery;
    dsrAcessosModulosIteclux: TtecDataSource;
    qryAcessosModulosItecluxdescricao: TStringField;
    qryAcessosModulosItecluxcodigo: TIntegerField;
    qryUsuariosAcessosModulosIteclux_Usuarios: TtecQuery;
    qryUsuariosAcessosModulosIteclux_GruposUsuarios: TtecQuery;
    procedure qryUsuariosAfterScroll(DataSet: TDataSet);
    procedure qryGruposUsuariosmarcarChange(Sender: TField);
    procedure qryUsuariosmarcarChange(Sender: TField);
    procedure qryUsuariosAcessosModulosBeforeOpen(DataSet: TDataSet);
    procedure qryUsuariosAcessosModulosAfterOpen(DataSet: TDataSet);
    procedure qryAcessosModulosBeforeOpen(DataSet: TDataSet);
    procedure qryGruposUsuariosAfterScroll(DataSet: TDataSet);
    procedure qryUsuariosAcessosModulosItecluxAfterOpen(DataSet: TDataSet);
    procedure qryUsuariosAcessosModulosItecluxBeforeOpen(DataSet: TDataSet);
    procedure qryAcessosModulosItecluxBeforeOpen(DataSet: TDataSet);
  private
    UsuariosMarcados: TStringList;
    GruposUsuariosMarcados: TStringList;
    RecursosSelecionados: String;
    RecursosSelecionadosItecLUX: String;
    FTipoRecurso: integer;
    function GetTabelaAtualizaUsuariosAcessos: TZDataset;
    procedure SetTipoRecurso(const Value: integer);
    function GetTabelaAtualizaGruposUsuariosAcessos: TZDataset;
    function GetTabelaGruposUsuarios: TZDataset;
    function GetTabelaUsuarios: TZDataset;
    procedure MarcarUsuariosporGrupos(Grupo: String; marcado: Boolean);

    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property TabelaAtualizaUsuariosAcesso: TZDataset read GetTabelaAtualizaUsuariosAcessos;
    property TabelaAtualizaGruposUsuariosAcesso: TZDataset read GetTabelaAtualizaGruposUsuariosAcessos;
    property TabelaUsuarios: TZDataset read GetTabelaUsuarios;
    property TabelaGruposUsuarios: TZDataset read GetTabelaGruposUsuarios;
    procedure MarcarUsuario(MarcarTodos, Marcar: Boolean);
    procedure MarcarGrupoUsuarios(MarcarTodos, Marcar: Boolean);
    procedure RetirarRecurso(RetirarTodos: Boolean);
    procedure AdicionarRecurso(AdicionarTodos: Boolean);
    procedure RetirarAcessosAtualizaUsuarios(itecLUX: Boolean = false);
    procedure AdicionarAcessosAtualizaUsuarios(ItecLUX: Boolean = False);
    function ListaUsuariosMarcados: String;
    function ListaGruposUsuariosMarcados: String;
    function ListaFiltroGruposUsuariosMarcados: String;
    procedure PosicionaUsuariosAcessos;
    procedure PosicionaUsuariosAcessosIteclux;
    procedure gravarAtualizaUsuariosAcessos;
    property TipoRecurso: integer read FTipoRecurso write SetTipoRecurso;
    procedure ProcuraNome(NomeProcura: String);
    procedure Proximo;
    procedure Anterior;
    procedure AdicionarRecursoIteclux(AdicionarTodos: Boolean);
    procedure RetirarRecursoIteclux(RetirarTodos: Boolean);
  end;

var
  dtmManutencaoAcessos: TdtmManutencaoAcessos;

implementation

{$R *.dfm}

{ TdtmManutencaoAcessos }

constructor TdtmManutencaoAcessos.Create(AOwner: TComponent);
begin
  inherited;
  qryGruposUsuarios.Tag := ctTabelas;
  qryUsuarios.Tag       := ctTabelas;
  qryUsuarios.Params[0].AsBoolean := false;
  UsuariosMarcados := TStringList.Create;
  GruposUsuariosMarcados := TStringList.Create;
end;

function TdtmManutencaoAcessos.GetTabelaAtualizaUsuariosAcessos: TZDataset;
begin
 result := qryAtualizaUsuariosAcessosModulos;
end;

procedure TdtmManutencaoAcessos.MarcarGrupoUsuarios(MarcarTodos, Marcar: Boolean);
var
 RegistroAtual : TBookmark;
begin
 RegistroAtual := qryGruposUsuarios.GetBookmark;

 if MarcarTodos then
 begin
  qryGruposUsuarios.DisableControls;
  qryGruposUsuarios.First;
  while not qryGruposUsuarios.Eof do
  begin
   if qryGruposUsuariosmarcar.AsBoolean <> Marcar then
   begin
    qryGruposUsuarios.Edit;
    qryGruposUsuariosmarcar.AsBoolean := Marcar;
    qryGruposUsuarios.Post;
   end;
   qryGruposUsuarios.Next;
  end;
  qryGruposUsuarios.EnableControls;
 end
 else
 begin
  qryGruposUsuarios.Edit;
  qryGruposUsuariosmarcar.AsBoolean := not qryGruposUsuariosmarcar.AsBoolean;
  qryGruposUsuarios.Post;
 end;
 qryGruposUsuarios.GotoBookmark(RegistroAtual);
 qryGruposUsuarios.FreeBookmark(RegistroAtual);

 case TipoRecurso of
  0: begin
       if (UsuariosMarcados.Count>0) then
       begin
        ReFazConsulta(qryUsuariosAcessosModulos,[],[]);
        ReFazConsulta(qryUsuariosAcessosModulosIteclux,[],[]);
       end
       else
       if qryUsuarios.Active then
         qryUsuariosAfterScroll(qryUsuarios);
     end;
  1: begin
       if (GruposUsuariosMarcados.Count>0) then
       begin
        ReFazConsulta(qryUsuarios, [0],[True]);
        ReFazConsulta(qryUsuariosAcessosModulos,[],[]);
        ReFazConsulta(qryUsuariosAcessosModulosIteclux,[],[]);
       end
       else
        qryGruposUsuariosAfterScroll(qryGruposUsuarios);
     end;
 end;
end;

procedure TdtmManutencaoAcessos.MarcarUsuario(MarcarTodos, Marcar: Boolean);
var
 RegistroAtual : TBookmark;
begin
 RegistroAtual := qryUsuarios.GetBookmark;
 if MarcarTodos then
 begin
  qryUsuarios.DisableControls;
  qryusuarios.AfterScroll := nil;
  qryusuarios.First;
  while not qryusuarios.Eof do
  begin
   if qryUsuariosmarcar.AsBoolean <> Marcar then
   begin
    qryusuarios.Edit;
    qryUsuariosmarcar.AsBoolean := Marcar;
    qryusuarios.Post;
   end;
   qryUsuarios.Next;
  end;
  qryUsuarios.AfterScroll := qryUsuariosAfterScroll;
  qryUsuariosAfterScroll(qryUsuarios);
  qryUsuarios.EnableControls;
 end
 else
 begin
  qryusuarios.Edit;
  qryUsuariosmarcar.AsBoolean := not qryUsuariosmarcar.AsBoolean;
  qryusuarios.Post;
 end;
 qryUsuarios.GotoBookmark(RegistroAtual);
 qryUsuarios.FreeBookmark(RegistroAtual);

 if (UsuariosMarcados.Count>0) then
 begin
   ReFazConsulta(qryUsuariosAcessosModulos,[],[]);
   ReFazConsulta(qryUsuariosAcessosModulosIteclux,[],[]);
 end
 else
   qryUsuariosAfterScroll(qryUsuarios);
end;

procedure TdtmManutencaoAcessos.qryUsuariosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  case TipoRecurso of
  0: begin
      if (UsuariosMarcados.Count=0) then
      begin
       qryUsuariosAcessosModulos.Sql[12] := 'where usuariosacessosmodulos.usuario =:usuario';
       qryUsuariosAcessosModulosIteclux.Sql[12] := 'where usuariosacessosmodulos.usuario =:usuario';
       qryUsuariosAcessosModulos.Sql[22] := 'where gruposusuariosacessosmodulos.grupo = (select grupo from usuarios where codigo =:usuario) and u.codigo = :usuario';
       qryUsuariosAcessosModulosIteclux.Sql[22] := 'where gruposusuariosacessosmodulos.grupo = (select grupo from usuarios where codigo =:usuario) and u.codigo = :usuario';
       ReFazConsulta(qryUsuariosAcessosModulos,[0,1], [qryUsuarioscodigo.AsVariant,1]);
       ReFazConsulta(qryUsuariosAcessosModulosIteclux,[0,1], [qryUsuarioscodigo.AsVariant,1]);
      end;
     end;
  end;
end;

procedure TdtmManutencaoAcessos.qryGruposUsuariosmarcarChange(
  Sender: TField);
var
 Posicao  : integer;
const
 SQL_GRUPOS = 'Where gruposusuariosacessosmodulos.grupo in (%s)';
 SQL_USUARIOS = 'AND grupo in (%s)';
begin
  inherited;
  if qryGruposUsuariosmarcar.AsBoolean then
  begin
   if GruposUsuariosMarcados.IndexOf(qryGruposUsuarioscodigo.AsString) = -1 then
    GruposUsuariosMarcados.add(qryGruposUsuarioscodigo.AsString);
  end
  else
  begin
   posicao := GruposUsuariosMarcados.IndexOf(qryGruposUsuarioscodigo.AsString);
   if posicao <> -1 then
    GruposUsuariosMarcados.delete(posicao);
  end;

  case TipoRecurso of
   0: begin
       if qryUsuarios.Active then
       begin
        MarcarUsuariosporGrupos(qryGruposUsuarioscodigo.AsString, qryGruposUsuariosmarcar.AsBoolean);
        qryUsuariosAfterScroll(qryUsuarios);
       end;
      end;
   1: begin
       if (GruposUsuariosMarcados.Count > 0) then
       begin
        qryUsuarios.SQL[6] := format(SQL_USUARIOS, [ListaGruposUsuariosMarcados]);
        qryUsuariosAcessosModulos.Sql[12] := format(SQL_GRUPOS, [ListaGruposUsuariosMarcados]);
        qryUsuariosAcessosModulosIteclux.Sql[12] := format(SQL_GRUPOS, [ListaGruposUsuariosMarcados]);
        qryUsuariosAcessosModulos.ParamByName('nusuarios').AsInteger := GruposUsuariosMarcados.Count;
        qryUsuariosAcessosModulosIteclux.ParamByName('nusuarios').AsInteger := GruposUsuariosMarcados.Count;
       end;
      end;
  end;
end;

procedure TdtmManutencaoAcessos.qryUsuariosmarcarChange(Sender: TField);
const
 SQL_USUARIOS = 'Where usuariosacessosmodulos.usuario in (%s)';
 SQL_GRUPOS = 'Where gruposusuariosacessosmodulos.grupo in (select grupo from usuarios where codigo in (%s))'+
              ' and u.codigo in (%s)';
var
 Posicao  : integer;
begin
  inherited;
  if qryUsuariosmarcar.AsBoolean then
  begin
   if UsuariosMarcados.IndexOf(qryUsuarioscodigo.AsString) = -1 then
    UsuariosMarcados.add(qryUsuarioscodigo.AsString);
  end
  else
  begin
   posicao := UsuariosMarcados.IndexOf(qryUsuarioscodigo.AsString);
   if posicao <> -1 then
    UsuariosMarcados.delete(posicao);
  end;

  case TipoRecurso of
  0 : begin
       if (UsuariosMarcados.Count > 0) then
       begin
        qryUsuariosAcessosModulos.Sql[12] := format(SQL_USUARIOS, [ListaUsuariosMarcados]);
        qryUsuariosAcessosModulosIteclux.Sql[12] := format(SQL_USUARIOS, [ListaUsuariosMarcados]);
        qryUsuariosAcessosModulos.Sql[22] := format(SQL_GRUPOS, [ListaUsuariosMarcados, ListaUsuariosMarcados]);
        qryUsuariosAcessosModulosIteclux.Sql[22] := format(SQL_GRUPOS, [ListaUsuariosMarcados, ListaUsuariosMarcados]);
        qryUsuariosAcessosModulos.ParamByName('nusuarios').AsInteger := UsuariosMarcados.Count;
        qryUsuariosAcessosModulosIteclux.ParamByName('nusuarios').AsInteger := UsuariosMarcados.Count;
       end;
      end;
  end;

end;

procedure TdtmManutencaoAcessos.qryUsuariosAcessosModulosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryUsuariosAcessosModulos.CancelUpdates;
  case TipoRecurso of
  0: begin
      if (UsuariosMarcados.Count>1) then
       qryUsuariosAcessosModulos.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados em Comum para os Usuários'
      else
       qryUsuariosAcessosModulos.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados para o Usuário';
     end;
  1: begin
      if (GruposUsuariosMarcados.Count>1) then
       qryUsuariosAcessosModulos.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados em Comum para os Grupos'
      else
       qryUsuariosAcessosModulos.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados para o grupo';
     end;
  end;
end;

procedure TdtmManutencaoAcessos.qryUsuariosAcessosModulosAfterOpen(
  DataSet: TDataSet);
Const
 SQL_Atualiza_Usuario = 'Where usuario in (%s) and acesso in (%s)';
 SQL_Atualiza_Grupo   = 'Where grupo in (%s) and acesso in (%s)';
 SQL_Modulo ='Where codigo not in (%s)';
var
 RegistroAtual : TBookmark;
begin
  inherited;
  RecursosSelecionados := '';

  RegistroAtual := qryUsuariosAcessosModulos.GetBookmark;
  qryUsuariosAcessosModulos.First;
  while not qryUsuariosAcessosModulos.Eof do
  begin
   RecursosSelecionados := RecursosSelecionados+quotedstr(qryUsuariosAcessosModulosacesso.AsString)+',';
   qryUsuariosAcessosModulos.Next;
  end;
  qryUsuariosAcessosModulos.GotoBookmark(RegistroAtual);
  qryUsuariosAcessosModulos.FreeBookmark(RegistroAtual);
  if (RecursosSelecionados ='') then RecursosSelecionados := quotedstr('0')+',';

  case TipoRecurso of
  0: begin
      if (UsuariosMarcados.Count>0) then
       qryAtualizaUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Usuario,
                   [ListaUsuariosMarcados,
                    copy(recursosselecionados,0,length(RecursosSelecionados)-1)])
      else
       qryAtualizaUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Usuario,
                   [qryusuarioscodigo.asstring,
                    copy(recursosselecionados,0,length(RecursosSelecionados)-1)]);

      ReFazConsulta(qryAtualizaUsuariosAcessosModulos,[],[]);
     end;
  1: begin
      if (GruposUsuariosMarcados.Count>0) then
       qryAtualizaGruposUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Grupo,
                   [ListaGruposUsuariosMarcados,
                    copy(recursosselecionados,0,length(RecursosSelecionados)-1)])
      else
       qryAtualizaGruposUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Grupo,
                   [qryGruposusuarioscodigo.asstring,
                    copy(recursosselecionados,0,length(RecursosSelecionados)-1)]);

      ReFazConsulta(qryAtualizaGruposUsuariosAcessosModulos,[],[]);
     end;
  end;

  qryAcessosModulos.Sql[2] := format(SQL_Modulo,
               [copy(recursosselecionados,0,length(RecursosSelecionados)-1)]);
  ReFazConsulta(qryAcessosModulos,[],[]);
end;

procedure TdtmManutencaoAcessos.RetirarRecurso(RetirarTodos: Boolean);
Const
 SQL_Modulo ='Where codigo not in (%s)';
begin
 if not qryUsuariosAcessosModulos.IsEmpty then
 begin
  if RetirarTodos then
  begin
   qryUsuariosAcessosModulos.First;
   while not qryUsuariosAcessosModulos.Eof do
   begin
    RetirarAcessosAtualizaUsuarios;
    delete(RecursosSelecionados, pos((quotedstr(qryUsuariosAcessosModulosacesso.AsString)+','), RecursosSelecionados),
           length(quotedstr(qryUsuariosAcessosModulosacesso.AsString)+','));
    qryUsuariosAcessosModulos.Delete;
   end;
  end
  else
  begin
   RetirarAcessosAtualizaUsuarios;
   delete(RecursosSelecionados, pos((quotedstr(qryUsuariosAcessosModulosacesso.AsString)+','), RecursosSelecionados),
          length(quotedstr(qryUsuariosAcessosModulosacesso.AsString)+','));
   qryUsuariosAcessosModulos.Delete;
  end;

  case TipoRecurso of
   0: qryAtualizaUsuariosAcessosModulos.Edit;
   1: qryAtualizaGruposUsuariosAcessosModulos.Edit;
  end;

  if (RecursosSelecionados<>'') then
   qryAcessosModulos.Sql[2] := format(SQL_Modulo,
               [copy(recursosselecionados,0,length(RecursosSelecionados)-1)])
  else qryAcessosModulos.Sql[2]:='where codigo <> 0';

  ReFazConsulta(qryAcessosModulos,[],[]);
 end;
end;

procedure TdtmManutencaoAcessos.RetirarAcessosAtualizaUsuarios(itecLUX: Boolean = false);
begin
  case TipoRecurso of
  0: begin
      qryAtualizaUsuariosAcessosModulos.First;
      if itecLUX then
      begin
        while not qryAtualizaUsuariosAcessosModulos.Eof do
        begin
          if (qryAtualizaUsuariosAcessosModulosacesso.AsInteger=qryUsuariosAcessosModulosItecluxacesso.AsInteger) then
            qryAtualizaUsuariosAcessosModulos.Delete
          else
            qryAtualizaUsuariosAcessosModulos.next;
        end;
      end
      else
      begin
        while not qryAtualizaUsuariosAcessosModulos.Eof do
        begin
          if (qryAtualizaUsuariosAcessosModulosacesso.AsInteger=qryUsuariosAcessosModulosacesso.AsInteger) then
            qryAtualizaUsuariosAcessosModulos.Delete
          else
            qryAtualizaUsuariosAcessosModulos.next;
        end;
      end;
     end;
  1: begin
      qryAtualizaGruposUsuariosAcessosModulos.First;
      if itecLUX then
      begin
        while not qryAtualizaGruposUsuariosAcessosModulos.Eof do
        begin
         if (qryAtualizaGruposUsuariosAcessosModulosacesso.AsInteger=qryUsuariosAcessosModulosItecluxacesso.AsInteger) then
           qryAtualizaGruposUsuariosAcessosModulos.Delete
         else
           qryAtualizaGruposUsuariosAcessosModulos.next;
        end;
      end
      else
      begin
        while not qryAtualizaGruposUsuariosAcessosModulos.Eof do
        begin
          if (qryAtualizaGruposUsuariosAcessosModulosacesso.AsInteger=qryUsuariosAcessosModulosacesso.AsInteger) then
            qryAtualizaGruposUsuariosAcessosModulos.Delete
          else
            qryAtualizaGruposUsuariosAcessosModulos.next;
        end;
      end;
     end;
  end;
end;

procedure TdtmManutencaoAcessos.AdicionarRecurso(AdicionarTodos: Boolean);
begin
 if not qryAcessosModulos.IsEmpty then
 begin
  if AdicionarTodos then
  begin
   qryAcessosModulos.First;
   while not qryAcessosModulos.Eof do
   begin
    AdicionarAcessosAtualizaUsuarios;
    PosicionaUsuariosAcessos;
    if qryUsuariosAcessosModulos.Eof then
     qryUsuariosAcessosModulos.append
    else qryUsuariosAcessosModulos.insert;
    qryUsuariosAcessosModulosdescricao.AsString := qryAcessosModulosdescricao.AsString;
    qryUsuariosAcessosModulosacesso.AsString := qryAcessosModuloscodigo.AsString;
    qryUsuariosAcessosModulos.Post;
    RecursosSelecionados := RecursosSelecionados+quotedstr(qryAcessosModuloscodigo.AsString)+',';
    qryAcessosModulos.Delete;
   end;
  end
  else
  begin
   AdicionarAcessosAtualizaUsuarios;
   PosicionaUsuariosAcessos;
   if qryUsuariosAcessosModulos.Eof then
    qryUsuariosAcessosModulos.append
   else qryUsuariosAcessosModulos.insert;
   qryUsuariosAcessosModulosdescricao.AsString := qryAcessosModulosdescricao.AsString;
   qryUsuariosAcessosModulosacesso.AsString := qryAcessosModuloscodigo.AsString;
   qryUsuariosAcessosModulos.Post;
   RecursosSelecionados := RecursosSelecionados+quotedstr(qryAcessosModuloscodigo.AsString)+',';
   qryAcessosModulos.Delete;
  end;
  case TipoRecurso of
   0: qryAtualizaUsuariosAcessosModulos.Edit;
   1: qryAtualizaGruposUsuariosAcessosModulos.Edit;
  end;
 end;
end;

procedure TdtmManutencaoAcessos.AdicionarAcessosAtualizaUsuarios(ItecLUX: Boolean = False);
var
 I : integer;
begin
 case TipoRecurso of
 0: begin
     if UsuariosMarcados.Count>0 then
     begin
      for I:=0 to UsuariosMarcados.count -1 do
      begin
       if ItecLUX then
         ReFazConsulta(qryExisteUsuarioAcessoModulo,[0,1],
                [UsuariosMarcados[I], qryAcessosModulosItecluxcodigo.AsVariant])
       else
         ReFazConsulta(qryExisteUsuarioAcessoModulo,[0,1],
                [UsuariosMarcados[I], qryAcessosModuloscodigo.AsVariant]);
       if qryExisteUsuarioAcessoModulonacesso.AsInteger=0 then
       begin
        qryAtualizaUsuariosAcessosModulos.Append;
        qryAtualizaUsuariosAcessosModulosusuario.AsString := UsuariosMarcados[I];
        if ItecLUX then
          qryAtualizaUsuariosAcessosModulosacesso.AsInteger := qryAcessosModulosItecluxcodigo.AsInteger
        else
          qryAtualizaUsuariosAcessosModulosacesso.AsInteger := qryAcessosModuloscodigo.AsInteger;
        qryAtualizaUsuariosAcessosModulos.Post;
       end;
      end;
     end
     else
     begin
       if ItecLUX then
         ReFazConsulta(qryExisteUsuarioAcessoModulo,[0,1],
                [qryUsuarioscodigo.AsVariant, qryAcessosModulosItecluxcodigo.AsVariant])
       else
         ReFazConsulta(qryExisteUsuarioAcessoModulo,[0,1],
                [qryUsuarioscodigo.AsVariant, qryAcessosModuloscodigo.AsVariant]);
       if qryExisteUsuarioAcessoModulonacesso.AsInteger=0 then
       begin
        qryAtualizaUsuariosAcessosModulos.Append;
        qryAtualizaUsuariosAcessosModulosusuario.AsString := qryUsuarioscodigo.AsString;
        if ItecLUX then
          qryAtualizaUsuariosAcessosModulosacesso.AsInteger := qryAcessosModulosItecluxcodigo.AsInteger
        else
          qryAtualizaUsuariosAcessosModulosacesso.AsInteger := qryAcessosModuloscodigo.AsInteger;
        qryAtualizaUsuariosAcessosModulos.Post;
       end;
     end;
    end;
 1: begin
     if GruposUsuariosMarcados.Count>0 then
     begin
      for I:=0 to GruposUsuariosMarcados.count -1 do
      begin
       if ItecLUX then
         ReFazConsulta(qryExisteGrupoUsuarioAcessoModulo,[0,1],
                [GruposUsuariosMarcados[I], qryAcessosModulosItecluxcodigo.AsVariant])
       else
         ReFazConsulta(qryExisteGrupoUsuarioAcessoModulo,[0,1],
                [GruposUsuariosMarcados[I], qryAcessosModuloscodigo.AsVariant]);
       if qryExisteGrupoUsuarioAcessoModulonacesso.AsInteger=0 then
       begin
        qryAtualizaGruposUsuariosAcessosModulos.Append;
        qryAtualizaGruposUsuariosAcessosModulosgrupo.AsString := GruposUsuariosMarcados[I];
        if ItecLUX then
          qryAtualizaGruposUsuariosAcessosModulosacesso.AsInteger := qryAcessosModulosItecluxcodigo.AsInteger
        else
          qryAtualizaGruposUsuariosAcessosModulosacesso.AsInteger := qryAcessosModuloscodigo.AsInteger;
        qryAtualizaGruposUsuariosAcessosModulos.Post;
       end;
      end;
     end
     else
     begin
       if ItecLUX then
         ReFazConsulta(qryExisteGrupoUsuarioAcessoModulo,[0,1],
                [qryGruposUsuarioscodigo.AsVariant, qryAcessosModulosItecluxcodigo.AsVariant])
       else
         ReFazConsulta(qryExisteGrupoUsuarioAcessoModulo,[0,1],
                [qryGruposUsuarioscodigo.AsVariant, qryAcessosModuloscodigo.AsVariant]);
       if qryExisteGrupoUsuarioAcessoModulonacesso.AsInteger=0 then
       begin
        qryAtualizaGruposUsuariosAcessosModulos.Append;
        qryAtualizaGruposUsuariosAcessosModulosgrupo.AsString := qryGruposUsuarioscodigo.AsString;
        if ItecLUX then
          qryAtualizaGruposUsuariosAcessosModulosacesso.AsInteger := qryAcessosModulosItecluxcodigo.AsInteger
        else
          qryAtualizaGruposUsuariosAcessosModulosacesso.AsInteger := qryAcessosModuloscodigo.AsInteger;
        qryAtualizaGruposUsuariosAcessosModulos.Post;
       end;
     end;
    end;
 end;
end;

function TdtmManutencaoAcessos.ListaUsuariosMarcados: String;
var
 Lista : String;
 I : integer;
begin
 Lista :='';
 for I:=0 to UsuariosMarcados.count -1 do
  Lista := Lista+UsuariosMarcados[I]+',';
 delete(Lista,length(Lista),1);
 result := Lista;
end;

procedure TdtmManutencaoAcessos.qryAcessosModulosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryAcessosModulos.CancelUpdates;
end;

procedure TdtmManutencaoAcessos.PosicionaUsuariosAcessos;
var
 acima: Boolean;
begin
 acima := false;
 if (qryUsuariosAcessosModulosdescricao.AsString >
     qryAcessosModulosdescricao.AsString) then
 begin
  acima := true;
  while (qryUsuariosAcessosModulosdescricao.AsString >
     qryAcessosModulosdescricao.AsString) do
     begin
      qryUsuariosAcessosModulos.Prior;
      if qryUsuariosAcessosModulos.Bof then
      begin
       acima := false;
       break;
      end;
     end;
 end
 else
 if (qryUsuariosAcessosModulosdescricao.AsString <
     qryAcessosModulosdescricao.AsString) then
  while (qryUsuariosAcessosModulosdescricao.AsString <
     qryAcessosModulosdescricao.AsString) do
     begin
      qryUsuariosAcessosModulos.Next;
      if qryUsuariosAcessosModulos.Eof then
       break;
     end;
 if acima then
  qryUsuariosAcessosModulos.Next;
end;

procedure TdtmManutencaoAcessos.gravarAtualizaUsuariosAcessos;
begin
 case TipoRecurso of
  0: begin
       if qryAtualizaUsuariosAcessosModulos.State in [dsedit, dsinsert] then
        qryAtualizaUsuariosAcessosModulos.Cancel;
       Perpetrar([qryAtualizaUsuariosAcessosModulos]);
     end;
  1: begin
       if qryAtualizaGruposUsuariosAcessosModulos.State in [dsedit, dsinsert] then
        qryAtualizaGruposUsuariosAcessosModulos.Cancel;
       Perpetrar([qryAtualizaGruposUsuariosAcessosModulos]);
     end;
 end;
 ReFazConsulta(qryUsuariosAcessosModulos,[],[]);
 ReFazConsulta(qryUsuariosAcessosModulosIteclux,[],[]);
end;

procedure TdtmManutencaoAcessos.qryGruposUsuariosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  case TipoRecurso of
  1: begin
      if (GruposUsuariosMarcados.Count=0) then
      begin
       qryUsuarios.Sql[6] := 'and grupo = :grupo';
       ReFazConsulta(qryUsuarios,[0,1],[False,qryGruposUsuarioscodigo.AsVariant]);
       qryUsuariosAcessosModulos.Sql[12] := 'where gruposusuariosacessosmodulos.grupo =:grupo';
       qryUsuariosAcessosModulosIteclux.Sql[12] := 'where gruposusuariosacessosmodulos.grupo =:grupo';
       ReFazConsulta(qryUsuariosAcessosModulos,[0,1],[qryGruposUsuarioscodigo.AsVariant,1]);
       ReFazConsulta(qryUsuariosAcessosModulosIteclux,[0,1],[qryGruposUsuarioscodigo.AsVariant,1]);
      end;
     end;
  end;
end;

procedure TdtmManutencaoAcessos.SetTipoRecurso(const Value: integer);
begin
  FTipoRecurso := Value;
  case value of
   0: begin
       qryAtualizaGruposUsuariosAcessosModulos.Close;
       qryUsuariosAcessosModulos.Sql.Text := qryUsuariosAcessosModulos_Usuarios.Sql.Text;
       qryUsuariosAcessosModulosIteclux.Sql.Text := qryUsuariosAcessosModulosIteclux_Usuarios.Sql.Text;
       qryusuarios.Close;
       UsuariosMarcados.Clear;
       qryusuarios.Sql[6]:='';
       if (GruposUsuariosMarcados.Count>0) then
         MarcarGrupoUsuarios(true,false);
       refazconsulta(qryUsuarios,[0],[False]);
      end;
   1: begin
       qryAtualizaUsuariosAcessosModulos.Close;
       qryUsuariosAcessosModulos.Sql.Text := qryUsuariosAcessosModulos_GruposUsuarios.Sql.Text;
       qryUsuariosAcessosModulosIteclux.Sql.Text := qryUsuariosAcessosModulosIteclux_GruposUsuarios.Sql.Text;
       UsuariosMarcados.Clear;
       if (GruposUsuariosMarcados.Count>0) then
         MarcarGrupoUsuarios(true,false);
       qryGruposUsuariosAfterScroll(qryGruposUsuarios);
      end;
  end;
end;

function TdtmManutencaoAcessos.ListaGruposUsuariosMarcados: String;
var
 Lista : String;
 I : integer;
begin
 Lista :='';
 for I:=0 to GruposUsuariosMarcados.count -1 do
  Lista := Lista+GruposUsuariosMarcados[I]+',';
 delete(Lista,length(Lista),1);
 result := Lista;
end;

function TdtmManutencaoAcessos.ListaFiltroGruposUsuariosMarcados: String;
var
 Lista : String;
 I : integer;
begin
 Lista :='';
 for I:=0 to GruposUsuariosMarcados.count -1 do
 begin
  if length(Lista)>0 then
   Lista := Lista+' or grupo = '
  else
   Lista := 'grupo = ';
  Lista := Lista+GruposUsuariosMarcados[I];
 end;
 result := Lista;
end;

function TdtmManutencaoAcessos.GetTabelaAtualizaGruposUsuariosAcessos: TZDataset;
begin
 result := qryAtualizaGruposUsuariosAcessosModulos;
end;

function TdtmManutencaoAcessos.GetTabelaGruposUsuarios: TZDataset;
begin
 result := qryGruposUsuarios;
end;

function TdtmManutencaoAcessos.GetTabelaUsuarios: TZDataset;
begin
 result := qryUsuarios;
end;

procedure TdtmManutencaoAcessos.MarcarUsuariosporGrupos(Grupo: String;
  marcado: Boolean);
var
 RegistroAtual : TBookmark;
begin
  qryUsuarios.DisableControls;
  qryusuarios.AfterScroll := nil;
  RegistroAtual := qryUsuarios.GetBookmark;
  qryUsuarios.First;
  while not qryUsuarios.Eof do
  begin
   if (qryUsuariosgrupo.AsString = grupo) then
    if (marcado <> qryUsuariosmarcar.AsBoolean) then
    begin
     qryUsuarios.Edit;
     qryUsuariosmarcar.AsBoolean := qryGruposUsuariosmarcar.AsBoolean;
     qryUsuarios.Post;
    end;
   qryUsuarios.Next;
  end;
  qryUsuarios.GotoBookmark(RegistroAtual);
  qryUsuarios.FreeBookmark(RegistroAtual);
  qryUsuarios.EnableControls;
  qryUsuarios.AfterScroll := qryUsuariosAfterScroll;
end;

procedure TdtmManutencaoAcessos.ProcuraNome(NomeProcura: String);
begin
  qryUsuarios.Locate('nome',NomeProcura,[loCaseInsensitive,loPartialKey]);
end;

procedure TdtmManutencaoAcessos.Anterior;
begin
   qryUsuarios.Prior;
end;

procedure TdtmManutencaoAcessos.Proximo;
begin
   qryUsuarios.Next;
end;

procedure TdtmManutencaoAcessos.qryUsuariosAcessosModulosItecluxAfterOpen(
  DataSet: TDataSet);
Const
 SQL_Atualiza_Usuario = 'Where usuario in (%s) and acesso in (%s)';
 SQL_Atualiza_Grupo   = 'Where grupo in (%s) and acesso in (%s)';
 SQL_Modulo ='Where codigo not in (%s)';
var
 RegistroAtual : TBookmark;
begin
  inherited;
  RecursosSelecionadosItecLUX := '';

  RegistroAtual := qryUsuariosAcessosModulosIteclux.GetBookmark;
  qryUsuariosAcessosModulosIteclux.First;
  while not qryUsuariosAcessosModulosIteclux.Eof do
  begin
   RecursosSelecionadosItecLUX := RecursosSelecionadosItecLUX+quotedstr(qryUsuariosAcessosModulosItecluxacesso.AsString)+',';
   qryUsuariosAcessosModulosIteclux.Next;
  end;
  qryUsuariosAcessosModulosIteclux.GotoBookmark(RegistroAtual);
  qryUsuariosAcessosModulosIteclux.FreeBookmark(RegistroAtual);
  if (RecursosSelecionadosItecLUX ='') then RecursosSelecionadosItecLUX := quotedstr('0')+',';

  case TipoRecurso of
  0: begin
      if (UsuariosMarcados.Count>0) then
       qryAtualizaUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Usuario,
                   [ListaUsuariosMarcados,
                    copy(RecursosSelecionados+RecursosSelecionadosItecLUX,0,length(RecursosSelecionados+RecursosSelecionadosItecLUX)-1)])
      else
       qryAtualizaUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Usuario,
                   [qryusuarioscodigo.asstring,
                    copy(RecursosSelecionados+RecursosSelecionadosItecLUX,0,length(RecursosSelecionados+RecursosSelecionadosItecLUX)-1)]);

      ReFazConsulta(qryAtualizaUsuariosAcessosModulos,[],[]);
     end;
  1: begin
      if (GruposUsuariosMarcados.Count>0) then
       qryAtualizaGruposUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Grupo,
                   [ListaGruposUsuariosMarcados,
                    copy(RecursosSelecionados+RecursosSelecionadosItecLUX,0,length(RecursosSelecionados+RecursosSelecionadosItecLUX)-1)])
      else
       qryAtualizaGruposUsuariosAcessosModulos.Sql[3] :=format(SQL_Atualiza_Grupo,
                   [qryGruposusuarioscodigo.asstring,
                    copy(RecursosSelecionados+RecursosSelecionadosItecLUX,0,length(RecursosSelecionados+RecursosSelecionadosItecLUX)-1)]);

      ReFazConsulta(qryAtualizaGruposUsuariosAcessosModulos,[],[]);
     end;
  end;

  qryAcessosModulosIteclux.Sql[2] := format(SQL_Modulo,
               [copy(RecursosSelecionadosItecLUX,0,length(RecursosSelecionadosItecLUX)-1)]);
  ReFazConsulta(qryAcessosModulosIteclux,[],[]);
end;

procedure TdtmManutencaoAcessos.qryUsuariosAcessosModulosItecluxBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryUsuariosAcessosModulosIteclux.CancelUpdates;
  case TipoRecurso of
  0: begin
      if (UsuariosMarcados.Count>1) then
       qryUsuariosAcessosModulosIteclux.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados em Comum para os Usuários'
      else
       qryUsuariosAcessosModulosIteclux.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados para o Usuário';
     end;
  1: begin
      if (GruposUsuariosMarcados.Count>1) then
       qryUsuariosAcessosModulosIteclux.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados em Comum para os Grupos'
      else
       qryUsuariosAcessosModulosIteclux.FieldByName('descricao').DisplayLabel := 'Recursos Disponibilizados para o grupo';
     end;
  end;
end;

procedure TdtmManutencaoAcessos.qryAcessosModulosItecluxBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryAcessosModulosIteclux.CancelUpdates;
end;

procedure TdtmManutencaoAcessos.AdicionarRecursoIteclux(
  AdicionarTodos: Boolean);
begin
 if not qryAcessosModulosIteclux.IsEmpty then
 begin
  if AdicionarTodos then
  begin
   qryAcessosModulosIteclux.First;
   while not qryAcessosModulosIteclux.Eof do
   begin
    AdicionarAcessosAtualizaUsuarios(True);
    PosicionaUsuariosAcessosIteclux;
    if qryUsuariosAcessosModulosIteclux.Eof then
     qryUsuariosAcessosModulosIteclux.append
    else qryUsuariosAcessosModulosIteclux.insert;
    qryUsuariosAcessosModulosItecluxdescricao.AsString := qryAcessosModulosItecluxdescricao.AsString;
    qryUsuariosAcessosModulosItecluxacesso.AsString := qryAcessosModulosItecluxcodigo.AsString;
    qryUsuariosAcessosModulosIteclux.Post;
    RecursosSelecionadosItecLUX := RecursosSelecionadosItecLUX+quotedstr(qryAcessosModulosItecluxcodigo.AsString)+',';
    qryAcessosModulosIteclux.Delete;
   end;
  end
  else
  begin
   AdicionarAcessosAtualizaUsuarios(True);
   PosicionaUsuariosAcessosIteclux;
   if qryUsuariosAcessosModulosIteclux.Eof then
    qryUsuariosAcessosModulosIteclux.append
   else qryUsuariosAcessosModulosIteclux.insert;
   qryUsuariosAcessosModulosItecluxdescricao.AsString := qryAcessosModulosItecluxdescricao.AsString;
   qryUsuariosAcessosModulosItecluxacesso.AsString := qryAcessosModulosItecluxcodigo.AsString;
   qryUsuariosAcessosModulosIteclux.Post;
   RecursosSelecionadosItecLUX := RecursosSelecionadosItecLUX+quotedstr(qryAcessosModulosItecluxcodigo.AsString)+',';
   qryAcessosModulosIteclux.Delete;
  end;
  case TipoRecurso of
   0: qryAtualizaUsuariosAcessosModulos.Edit;
   1: qryAtualizaGruposUsuariosAcessosModulos.Edit;
  end;
 end;
end;

procedure TdtmManutencaoAcessos.PosicionaUsuariosAcessosIteclux;
var
 acima: Boolean;
begin
 acima := false;
 if (qryUsuariosAcessosModulosItecluxdescricao.AsString >
     qryAcessosModulosItecluxdescricao.AsString) then
 begin
  acima := true;
  while (qryUsuariosAcessosModulosItecluxdescricao.AsString >
     qryAcessosModulosItecluxdescricao.AsString) do
     begin
      qryUsuariosAcessosModulosIteclux.Prior;
      if qryUsuariosAcessosModulosIteclux.Bof then
      begin
       acima := false;
       break;
      end;
     end;
 end
 else
 if (qryUsuariosAcessosModulosItecluxdescricao.AsString <
     qryAcessosModulosItecluxdescricao.AsString) then
  while (qryUsuariosAcessosModulosItecluxdescricao.AsString <
     qryAcessosModulosItecluxdescricao.AsString) do
     begin
      qryUsuariosAcessosModulosIteclux.Next;
      if qryUsuariosAcessosModulosIteclux.Eof then
       break;
     end;
 if acima then
  qryUsuariosAcessosModulosIteclux.Next;
end;

procedure TdtmManutencaoAcessos.RetirarRecursoIteclux(RetirarTodos: Boolean);
Const
 SQL_Modulo ='Where codigo not in (%s)';
begin
 if not qryUsuariosAcessosModulosIteclux.IsEmpty then
 begin
  if RetirarTodos then
  begin
   qryUsuariosAcessosModulosIteclux.First;
   while not qryUsuariosAcessosModulosIteclux.Eof do
   begin
    RetirarAcessosAtualizaUsuarios(True);
    delete(RecursosSelecionadosItecLUX, pos((quotedstr(qryUsuariosAcessosModulosItecluxacesso.AsString)+','), RecursosSelecionadosItecLUX),
           length(quotedstr(qryUsuariosAcessosModulosItecluxacesso.AsString)+','));
    qryUsuariosAcessosModulosIteclux.Delete;
   end;
  end
  else
  begin
   RetirarAcessosAtualizaUsuarios(True);
   delete(RecursosSelecionadosItecLUX, pos((quotedstr(qryUsuariosAcessosModulosItecluxacesso.AsString)+','), RecursosSelecionadosItecLUX),
          length(quotedstr(qryUsuariosAcessosModulosItecluxacesso.AsString)+','));
   qryUsuariosAcessosModulosIteclux.Delete;
  end;

  case TipoRecurso of
   0: qryAtualizaUsuariosAcessosModulos.Edit;
   1: qryAtualizaGruposUsuariosAcessosModulos.Edit;
  end;

  if (RecursosSelecionadosItecLUX<>'') then
   qryAcessosModulosIteclux.Sql[2] := format(SQL_Modulo,
               [copy(RecursosSelecionadosItecLUX,0,length(RecursosSelecionadosItecLUX)-1)])
  else qryAcessosModulosIteclux.Sql[2]:='where codigo <> 0';

  ReFazConsulta(qryAcessosModulosIteclux,[],[]);
 end;
end;


end.
