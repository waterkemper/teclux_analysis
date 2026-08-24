unit dmcadastroniveissalariais;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, ctconstantes, Forms;

type
  TdtmCadastroNiveisSalariais = class(TdtmBasico)
    dsrNiveisSalariais: TtecDataSource;
    qryNiveisSalariais: TtecQuery;
    qryNiveisSalariaiscodigo: TIntegerField;
    qryNiveisSalariaisdescricao: TStringField;
    dsrNiveisSalariaisUsuarios: TtecDataSource;
    qryNiveisSalariaisUsuarios: TtecQuery;
    qryNiveisSalariaisUsuariosnivelsalarial: TIntegerField;
    qryNiveisSalariaisUsuariosusuario: TIntegerField;
    qryNiveisSalariaisUsuariosnome: TStringField;
    qryNiveisSalariaisProximo: TtecQuery;
    qryNiveisSalariaisProximocodigo: TIntegerField;
    qryNiveisSalariaisUsuariosusuariovalidado: TBooleanField;
    procedure qryNiveisSalariaisAfterScroll(DataSet: TDataSet);
    procedure qryNiveisSalariaisUsuariosNewRecord(DataSet: TDataSet);
    procedure qryNiveisSalariaisUsuariosAfterOpen(DataSet: TDataSet);
    procedure qryNiveisSalariaisUsuariosAfterPost(DataSet: TDataSet);
    procedure qryNiveisSalariaisUsuariosAfterDelete(DataSet: TDataSet);
  private
    FonNiveisSalariaisUsuariosNewRecord: TNotifyEvent;
    FListaUsuariosSelecionados: String;
    { Private declarations }
  protected
    function ProximoCodigo: Integer;
    procedure AtualizaListaUsuarios;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure ExcluirNiveisSalariais;
    procedure IncluirNiveisSalariais;
    function GravarNiveisSalariais: Boolean;
    function SalvarNiveisSalariaisUsuarios: boolean;
    property onNiveisSalariaisUsuariosNewRecord : TNotifyEvent read FonNiveisSalariaisUsuariosNewRecord write FonNiveisSalariaisUsuariosNewRecord;
    procedure ExcluirNiveisSalariaisUsuarios;
    procedure EditarNiveisSalariais;
    property ListaUsuariosSelecionados: String read FListaUsuariosSelecionados write FListaUsuariosSelecionados;
    procedure GravarNiveisSalariaisUsuarios;
    procedure LimparNiveisSalariaisUsuarios;
    procedure CancelarNiveisSalariaisUsuarios;
    procedure EditarNiveisSalariaisUsuarios;
    function RegistrodeNiveisSalariaisUsuarios: boolean;

  end;

var
  dtmCadastroNiveisSalariais: TdtmCadastroNiveisSalariais;

implementation

{$R *.dfm}

procedure TdtmCadastroNiveisSalariais.ExcluirNiveisSalariais;
begin
  if not qryNiveisSalariais.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o NÍVEL SALARIAL'])) = smbOk) then
    begin
       qryNiveisSalariais.Delete;
       Perpetrar([qryNiveisSalariais]);
    end;
end;

function TdtmCadastroNiveisSalariais.GravarNiveisSalariais: Boolean;
var
  CodigoNivelSalarialGerado : integer;

  function AtribuirCodigonoNivelSalarialUsuario: boolean;
  begin
    result := false;
    GuardarRegistroAtual(qryNiveisSalariaisUsuarios,true);
    qryNiveisSalariaisUsuarios.First;
    while not qryNiveisSalariaisUsuarios.Eof do
    begin
      if qryNiveisSalariaisUsuariosnivelsalarial.AsInteger = CodigoNivelSalarialGerado then
      begin
        if qryNiveisSalariaisUsuariosnivelsalarial.AsInteger <> qryNiveisSalariaiscodigo.AsInteger then
        begin
          qryNiveisSalariaisUsuarios.Edit;
          qryNiveisSalariaisUsuariosnivelsalarial.AsInteger := qryNiveisSalariaiscodigo.AsInteger;
          qryNiveisSalariaisUsuarios.Post;
        end;
      end;
      result := qryNiveisSalariaisUsuarios.CheckRequiredFields;
      if not result then
        break;
      qryNiveisSalariaisUsuarios.Next;
    end;
    VoltarRegistroAtual(qryNiveisSalariaisUsuarios);
  end;

begin
  result := false;
  if (qryNiveisSalariais.CheckRequiredFields) then
  begin
    if SalvarNiveisSalariaisUsuarios then
    begin
      CodigoNivelSalarialGerado := qryNiveisSalariaiscodigo.AsInteger;
      if qryNiveisSalariais.State = dsinsert then
          qryNiveisSalariaiscodigo.AsInteger := ProximoCodigo;

      if AtribuirCodigonoNivelSalarialUsuario then
      begin
        qryNiveisSalariais.Post;
        result := Perpetrar([qryNiveisSalariais, qryNiveisSalariaisUsuarios]);
      end;
    end;
  end;
end;

procedure TdtmCadastroNiveisSalariais.IncluirNiveisSalariais;
begin
  qryNiveisSalariais.Insert;
  qryNiveisSalariaiscodigo.AsInteger := ProximoCodigo;
end;

function TdtmCadastroNiveisSalariais.ProximoCodigo: Integer;
begin
 qryNiveisSalariaisProximo.Open;
 result := qryNiveisSalariaisProximocodigo.AsInteger;
 qryNiveisSalariaisProximo.Close;
end;

procedure TdtmCadastroNiveisSalariais.qryNiveisSalariaisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryNiveisSalariaisUsuarios,[0], [qryNiveisSalariaiscodigo.AsVariant]);
end;

function TdtmCadastroNiveisSalariais.SalvarNiveisSalariaisUsuarios: boolean;
begin
  result := true;
  if (qryNiveisSalariaisUsuarios.State in [dsedit, dsinsert]) then
  begin
    if qryNiveisSalariaisUsuarios.CheckRequiredFields then
      qryNiveisSalariaisUsuarios.Post
    else
      result := false;
  end;
end;

procedure TdtmCadastroNiveisSalariais.qryNiveisSalariaisUsuariosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryNiveisSalariaisUsuariosusuariovalidado.AsBoolean := false;

  if not qryNiveisSalariaiscodigo.IsNull then
    qryNiveisSalariaisUsuariosnivelsalarial.AsString := qryNiveisSalariaiscodigo.AsString;

  if Assigned(onNiveisSalariaisUsuariosNewRecord) then
    onNiveisSalariaisUsuariosNewRecord(qryNiveisSalariaisUsuarios);
end;

procedure TdtmCadastroNiveisSalariais.ExcluirNiveisSalariaisUsuarios;
begin
  if not qryNiveisSalariaisUsuarios.IsEmpty then
    if not qryNiveisSalariaisUsuarios.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o usuário deste nível'])) = smbOk) then
         qryNiveisSalariaisUsuarios.Delete;
end;

procedure TdtmCadastroNiveisSalariais.EditarNiveisSalariais;
begin
  if not (qryNiveisSalariais.State in [dsedit, dsinsert]) then
    qryNiveisSalariais.Edit;
end;

procedure TdtmCadastroNiveisSalariais.AtualizaListaUsuarios;
var
  Pos: TBookmark;
begin
  Pos := qryNiveisSalariaisUsuarios.GetBookmark;
  qryNiveisSalariaisUsuarios.DisableControls;
  try
    ListaUsuariosSelecionados := '';
    qryNiveisSalariaisUsuarios.First;
    while Not qryNiveisSalariaisUsuarios.Eof do
    begin
      if qryNiveisSalariaisUsuariosusuario.AsString<>'' then
        ListaUsuariosSelecionados := ListaUsuariosSelecionados +
                                     qryNiveisSalariaisUsuariosusuario.AsString + ',';
      qryNiveisSalariaisUsuarios.Next
    end;

    if ListaUsuariosSelecionados <> '' then
      ListaUsuariosSelecionados := copy(ListaUsuariosSelecionados,0, Length(ListaUsuariosSelecionados)-1)
    else
      ListaUsuariosSelecionados := '0';

  finally
    qryNiveisSalariaisUsuarios.GotoBookmark(Pos);
    qryNiveisSalariaisUsuarios.FreeBookmark(Pos);
    qryNiveisSalariaisUsuarios.EnableControls;
  end
end;

constructor TdtmCadastroNiveisSalariais.Create(AOwner: TComponent);
begin
  inherited;
  qryNiveisSalariais.Tag := ctTabelas;
  qryNiveisSalariaisUsuarios.Tag := ctTabelas;
  ListaUsuariosSelecionados := '0';
end;

destructor TdtmCadastroNiveisSalariais.Destroy;
begin

  inherited;
end;

procedure TdtmCadastroNiveisSalariais.GravarNiveisSalariaisUsuarios;
begin
  if (qryNiveisSalariaisUsuarios.State in [dsedit, dsinsert]) then
     qryNiveisSalariaisUsuarios.Post;
end;

procedure TdtmCadastroNiveisSalariais.LimparNiveisSalariaisUsuarios;
begin
   if not (qryNiveisSalariaisUsuarios.State in [dsedit, dsinsert]) then
     qryNiveisSalariaisUsuarios.Edit;
   qryNiveisSalariaisUsuariosusuario.Clear;
   qryNiveisSalariaisUsuariosnome.Clear;
end;

procedure TdtmCadastroNiveisSalariais.CancelarNiveisSalariaisUsuarios;
begin
  qryNiveisSalariaisUsuarios.Cancel;
  if not qryNiveisSalariaisUsuariosusuariovalidado.AsBoolean then
    if not qryNiveisSalariaisUsuarios.IsEmpty then
       qryNiveisSalariaisUsuarios.Delete;
end;

function TdtmCadastroNiveisSalariais.RegistrodeNiveisSalariaisUsuarios: boolean;
begin
  result := qryNiveisSalariaisUsuariosusuario.IsNull or
            qryNiveisSalariaisUsuariosnome.IsNull;
end;

procedure TdtmCadastroNiveisSalariais.EditarNiveisSalariaisUsuarios;
begin
  if not (qryNiveisSalariaisUsuarios.State in [dsedit, dsinsert]) then
    qryNiveisSalariaisUsuarios.Edit;
end;

procedure TdtmCadastroNiveisSalariais.qryNiveisSalariaisUsuariosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaListaUsuarios;
end;

procedure TdtmCadastroNiveisSalariais.qryNiveisSalariaisUsuariosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarNiveisSalariais;
  AtualizaListaUsuarios;
end;

procedure TdtmCadastroNiveisSalariais.qryNiveisSalariaisUsuariosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarNiveisSalariais;
  AtualizaListaUsuarios;
end;

end.
