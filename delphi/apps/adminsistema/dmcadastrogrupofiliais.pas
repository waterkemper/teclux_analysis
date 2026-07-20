unit dmcadastrogrupofiliais;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery,cpdatasource,
  // Biblio
  ctconstantes, biblio,
  // Repositorio
  dmbasico;

type
  TdtmCadastroGrupoFiliais = class(TdtmBasico)
    qryGruposFiliais: TtecQuery;
    qryFiliaisGruposFiliais: TtecQuery;
    dsrGruposFiliais: TtecDataSource;
    dsrFiliaisGruposFiliais: TtecDataSource;
    qryGruposFiliaiscodigo: TIntegerField;
    qryGruposFiliaisdescricao: TStringField;
    qryGruposFiliaismnemonico: TStringField;
    spcProximoGruposFiliais: TtecQuery;
    spcProximoGruposFiliaiscodigo: TIntegerField;
    qryConsultaGruposFiliais: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryProcuraFiliais: TtecQuery;
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaGruposFiliaiscodigo: TIntegerField;
    qryConsultaGruposFiliaisdescricao: TStringField;
    qryConsultaGruposFiliaismnemonico: TStringField;
    qryFiliaisGruposFiliaisgrupo: TIntegerField;
    qryFiliaisGruposFiliaisfilial: TIntegerField;
    qryFiliaisGruposFiliaisnome: TStringField;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryGruposFiliaisestoque: TBooleanField;
    procedure qryGruposFiliaisAfterScroll(DataSet: TDataSet);
    procedure qryFiliaisGruposFiliaisBeforeInsert(DataSet: TDataSet);
    procedure qryFiliaisGruposFiliaisBeforeEdit(DataSet: TDataSet);
    procedure qryFiliaisGruposFiliaisBeforeDelete(DataSet: TDataSet);
    procedure qryGruposFiliaisAfterClose(DataSet: TDataSet);
    procedure qryFiliaisGruposFiliaisAfterDelete(DataSet: TDataSet);
  private
  protected
   procedure SetCodigoGrupoFilial(const Value: Integer);
   procedure SetCodigoFilialGrupoFilial(const Value: Integer);
   function  GetTabelaGruposFiliais: TZDataSet;
   function  GetTabelaFiliaisGruposFiliais: TZDataSet;
   function  GetConsultarFiliais: TZDataSet;
   function  GetConsultarGruposFiliais: TZDataSet;
   function  GetEditandoTabelaFiliaisGruposFiliais: boolean;
   function  GetCodigoGrupoFilial: Integer;
   function  GetCodigoFilial:string;
   function  GetDescricaoFilial: String;
  public
   procedure MontaListaFiliais(Editando: Boolean);
   procedure SelecionarFilial;
   procedure PosicionarGrupoFiliais;
   function  IncluirGrupoFilial: Boolean;
   function  IncluirFilialGrupoFilial(Editar:boolean):Boolean;
   function  GravarGrupoFilial: Boolean;
   function  GravarFilialGrupoFilial: Boolean;
   function  ExcluirGrupoFilial: Boolean;
   function  ExcluirFilialGrupoFilial: Boolean;
   function  ExisteGrupoFilial(campo, codigo: string): Boolean;
   function  ExisteFilial(campo, codigo: string): Boolean;
   constructor Create(AOwner: TComponent); override;
   property  CodigoGrupoFilial: Integer read GetCodigoGrupoFilial;
   property  CodigoFilial: String  read GetCodigoFilial;
   property  DescricaoFilial: String read GetDescricaoFilial;
   property  TabelaGruposFiliais: TZDataSet read GetTabelaGruposFiliais;
   property  TabelaFiliaisGrupoFiliais: TZDataSet read GetTabelaFiliaisGruposFiliais;
   property  ConsultarFiliais: TZDataSet read GetConsultarFiliais;
   property  ConsultarGruposFiliais: TZDataSet read GetConsultarGruposFiliais;
   property  EditandoTabelaFiliaisGruposFiliais :Boolean read GetEditandoTabelaFiliaisGruposFiliais;
  end;

var
  dtmCadastroGrupoFiliais: TdtmCadastroGrupoFiliais;

implementation

uses dmtecsoft;

{$R *.dfm}

constructor TdtmCadastroGrupoFiliais.Create(AOwner: TComponent);
begin
  inherited;
  qryGruposFiliais.Tag := ctTabelas;
  qryFiliaisGruposFiliais.Tag  := ctTabelas;
  qryConsultaGruposFiliais.Tag := ctCrediarioTabelaConsultaGrupoFiliais;
  qryConsultaFiliais.Tag := ctCrediarioTabelaConsultaFiliais;
end;


procedure TdtmCadastroGrupoFiliais.PosicionarGrupoFiliais;
begin
  qryGruposFiliais.Close;
  qryFiliaisGruposFiliais.Close;
  qryGruposFiliais.Params[0].AsInteger:= CodigoGrupoFilial;
  qryGruposFiliais.Open;
  qryFiliaisGruposFiliais.Open
end;

function TdtmCadastroGrupoFiliais.IncluirGrupoFilial: Boolean;
begin
  qryGruposFiliais.Insert;
  qryGruposFiliaisestoque.AsBoolean:= False;
  Result:=True;
end;

function TdtmCadastroGrupoFiliais.IncluirFilialGrupoFilial(Editar:boolean):Boolean;
begin
  if (qryFiliaisGruposFiliais.State in [dsEdit,dsInsert]) then
    qryFiliaisGruposFiliais.Cancel;
  MontaListaFiliais(Editar);
  qryFiliaisGruposFiliais.Params[0].Clear;
  if Editar and not qryFiliaisGruposFiliais.IsEmpty then begin
//    qryFiliaisGruposFiliais.Edit;
//    qryFiliaisGruposFiliais.Cancel;
  end
  else
    qryFiliaisGruposFiliais.Append;
  Result:=True;
end;


function TdtmCadastroGrupoFiliais.GravarGrupoFilial: Boolean;
var
  cont: Integer;
begin
  if qryGruposFiliais.CheckRequiredFields then begin
    if qryGruposFiliais.State in [dsInsert] then
    begin
      spcProximoGruposFiliais.Open;
      SetCodigoGrupoFilial(spcProximoGruposFiliaiscodigo.AsInteger);
      spcProximoGruposFiliais.Close;
    end;
    qryFiliaisGruposFiliais.DisableControls;
    try
      qryFiliaisGruposFiliais.First;
      for cont:= 1 to qryFiliaisGruposFiliais.RecordCount do
      begin
        if qryFiliaisGruposFiliaisgrupo.AsInteger = 0 then
        begin
          qryFiliaisGruposFiliais.Edit;
          SetCodigoFilialGrupoFilial(qryGruposFiliaiscodigo.AsInteger);
          qryFiliaisGruposFiliais.Post;
        end;
        qryFiliaisGruposFiliais.Next;
      end;
    finally
      qryFiliaisGruposFiliais.EnableControls;
    end;
    Perpetrar([qryGruposFiliais, qryFiliaisGruposFiliais]);
    Result:=True;
  end
  else
    Result:= False;
end;

function TdtmCadastroGrupoFiliais.GravarFilialGrupoFilial: Boolean;
begin
  qryFiliaisGruposFiliaisfilial.AsInteger := qryProcuraFiliaiscodigo.AsInteger;
  qryFiliaisGruposFiliaisnome.AsString := qryProcuraFiliaisnome.AsString;
  qryFiliaisGruposFiliais.Post;
  qryGruposFiliais.Edit;
  Result:= True;
end;

function TdtmCadastroGrupoFiliais.ExcluirGrupoFilial: Boolean;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o GRUPO DE FILIAIS'])) = smbok then
  begin
    if not qryGruposFiliais.IsEmpty then
      qryGruposFiliais.Delete
    else
      qryGruposFiliais.Cancel;
    Perpetrar([qryGruposFiliais]);
    qryGruposFiliais.Edit;
    Result:= True;
  end
  else
    Result:= False;
end;

function TdtmCadastroGrupoFiliais.ExcluirFilialGrupoFilial: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a FILIAL'])) = smbOk then begin
    if not qryFiliaisGruposFiliais.IsEmpty then
         qryFiliaisGruposFiliais.Delete
    else qryFiliaisGruposFiliais.Cancel;
    Result:= True;
  end
end;

function TdtmCadastroGrupoFiliais.ExisteGrupoFilial(campo, codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGruposFiliais, campo, codigo);
end;

function TdtmCadastroGrupoFiliais.ExisteFilial(campo, codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

procedure TdtmCadastroGrupoFiliais.SelecionarFilial;
begin
  qryFiliaisGruposFiliaisfilial.AsInteger := qryConsultaFiliaiscodigo.AsInteger;
  qryFiliaisGruposFiliaisnome.AsString   := qryConsultaFiliaisnome.AsString;
end;

function TdtmCadastroGrupoFiliais.GetTabelaGruposFiliais: TZDataSet;
begin
  Result:= qryGruposFiliais;
end;

function TdtmCadastroGrupoFiliais.GetTabelaFiliaisGruposFiliais: TZDataSet;
begin
  Result:= qryFiliaisGruposFiliais;
end;

function TdtmCadastroGrupoFiliais.GetConsultarFiliais: TZDataSet;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmCadastroGrupoFiliais.GetConsultarGruposFiliais: TZDataSet;
begin
  Result:= qryConsultaGruposFiliais;
end;

function TdtmCadastroGrupoFiliais.GetCodigoGrupoFilial: Integer;
begin
  Result:= qryConsultaGruposFiliaiscodigo.AsInteger;
end;

function TdtmCadastroGrupoFiliais.GetDescricaoFilial: String;
begin
  Result:= qryProcuraFiliaisnome.AsString;
end;

procedure TdtmCadastroGrupoFiliais.SetCodigoGrupoFilial(const Value: Integer);
begin
  if qryGruposFiliais.State in [dsInsert, dsEdit] then
    qryGruposFiliaiscodigo.AsInteger:= Value;
end;

procedure TdtmCadastroGrupoFiliais.SetCodigoFilialGrupoFilial(const Value: Integer);
begin
  if qryFiliaisGruposFiliais.State in [dsInsert, dsEdit] then
    qryFiliaisGruposFiliaisgrupo.AsInteger:= Value;
end;

procedure TdtmCadastroGrupoFiliais.qryGruposFiliaisAfterScroll(DataSet: TDataSet);
begin
  RefazConsulta(qryFiliaisGruposFiliais, [0], [qryGruposFiliaiscodigo.AsInteger]);
end;

procedure TdtmCadastroGrupoFiliais.qryFiliaisGruposFiliaisBeforeInsert(DataSet: TDataSet);
begin
   qryGruposFiliais.Edit;
end;

procedure TdtmCadastroGrupoFiliais.qryFiliaisGruposFiliaisBeforeEdit(DataSet: TDataSet);
begin
  qryGruposFiliais.Edit;
end;

procedure TdtmCadastroGrupoFiliais.qryFiliaisGruposFiliaisBeforeDelete(DataSet: TDataSet);
begin
  qryGruposFiliais.Edit;
end;

procedure TdtmCadastroGrupoFiliais.MontaListaFiliais(Editando: Boolean);
var
  Pos : TBookmark;
  Filial, a  : Integer;
  ParamConsulta, ParamProcura : String;
begin
  ParamConsulta := '';
  ParamProcura  := '';
  Filial        := qryFiliaisGruposFiliaisFilial.AsInteger;
  if not qryFiliaisGruposFiliais.IsEmpty then begin
    ParamConsulta := 'Where not (F.Codigo in (';
    ParamProcura  := 'and not (F.Codigo in (';
  end;
  Pos:= qryFiliaisGruposFiliais.GetBookmark;
  qryFiliaisGruposFiliais.DisableControls;
  try
    qryFiliaisGruposFiliais.First;
    for a:= 1 to qryFiliaisGruposFiliais.RecordCount do
    begin
      ParamConsulta:= ParamConsulta + qryFiliaisGruposFiliaisFilial.AsString + ',';
      if Editando then
      begin
        if (qryFiliaisGruposFiliais.RecordCount > 1) then
        begin
          if (qryFiliaisGruposFiliaisFilial.AsInteger <> Filial) then
            ParamProcura:= ParamProcura + qryFiliaisGruposFiliaisFilial.AsString + ',';
        end
        else
          ParamProcura:= ParamProcura + '0,';
      end
      else
        ParamProcura:= ParamProcura + qryFiliaisGruposFiliaisFilial.AsString + ',';
      qryFiliaisGruposFiliais.Next;
    end;
    if not qryFiliaisGruposFiliais.IsEmpty then
    begin
      Delete(ParamConsulta,Length(ParamConsulta),1);
      Delete(ParamProcura ,Length(ParamProcura ),1);
      ParamConsulta:= ParamConsulta + '))';
      ParamProcura := ParamProcura  + '))';
    end;
    qryConsultaFiliais.Sql[03]:= ParamConsulta;
    qryProcuraFiliais.Sql[04] := ParamProcura;
  finally
    qryFiliaisGruposFiliais.GotoBookmark(Pos);
    qryFiliaisGruposFiliais.FreeBookmark(Pos);
    qryFiliaisGruposFiliais.EnableControls;
  end;
end;

function TdtmCadastroGrupoFiliais.GetEditandoTabelaFiliaisGruposFiliais: boolean;
begin
  Result := qryFiliaisGruposFiliais.State = dsEdit;
end;

function TdtmCadastroGrupoFiliais.GetCodigoFilial: string;
begin
  Result:=qryFiliaisGruposFiliaisfilial.AsString;
end;

procedure TdtmCadastroGrupoFiliais.qryFiliaisGruposFiliaisAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if qryGruposFiliais.State = dsBrowse then
    qryGruposFiliais.Edit;
end;

procedure TdtmCadastroGrupoFiliais.qryGruposFiliaisAfterClose(DataSet: TDataSet);
begin
  inherited;
  RefazConsulta(qryFiliaisGruposFiliais, [0],[0]);
end;


end.
