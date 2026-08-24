unit dmcadastroRedes_Adquirentes;

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
  TdtmCadastroRedes_Adquirentes = class(TdtmBasico)
    qryRedes_Adquirentes: TtecQuery;
    qryRedes_Adquirentes_Tipos_Recebimentos: TtecQuery;
    dsrRedes_Adquirentes: TtecDataSource;
    dsrFiliaisRedes_Adquirentes: TtecDataSource;
    qryRedes_Adquirentescodigo: TIntegerField;
    qryRedes_Adquirentesdescricao: TStringField;
    qryRedes_Adquirentesmnemonico: TStringField;
    spcProximoRedes_Adquirentes: TtecQuery;
    spcProximoRedes_Adquirentescodigo: TIntegerField;
    qryConsultaRedes_Adquirentes: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryProcuraFiliais: TtecQuery;
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaRedes_Adquirentescodigo: TIntegerField;
    qryConsultaRedes_Adquirentesdescricao: TStringField;
    qryConsultaRedes_Adquirentesmnemonico: TStringField;
    qryRedes_Adquirentes_Tipos_Recebimentosgrupo: TIntegerField;
    qryRedes_Adquirentes_Tipos_Recebimentosfilial: TIntegerField;
    qryRedes_Adquirentes_Tipos_Recebimentosnome: TStringField;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryRedes_Adquirentesestoque: TBooleanField;
    procedure qryRedes_AdquirentesAfterScroll(DataSet: TDataSet);
    procedure qryRedes_Adquirentes_Tipos_RecebimentosBeforeInsert(DataSet: TDataSet);
    procedure qryRedes_Adquirentes_Tipos_RecebimentosBeforeEdit(DataSet: TDataSet);
    procedure qryRedes_Adquirentes_Tipos_RecebimentosBeforeDelete(DataSet: TDataSet);
    procedure qryRedes_AdquirentesAfterClose(DataSet: TDataSet);
    procedure qryRedes_Adquirentes_Tipos_RecebimentosAfterDelete(DataSet: TDataSet);
  private
  protected
   procedure SetCodigoGrupoFilial(const Value: Integer);
   procedure SetCodigoFilialGrupoFilial(const Value: Integer);
   function  GetTabelaRedes_Adquirentes: TZDataSet;
   function  GetTabelaFiliaisRedes_Adquirentes: TZDataSet;
   function  GetConsultarFiliais: TZDataSet;
   function  GetConsultarRedes_Adquirentes: TZDataSet;
   function  GetEditandoTabelaFiliaisRedes_Adquirentes: boolean;
   function  GetCodigoGrupoFilial: Integer;
   function  GetCodigoFilial:string;
   function  GetDescricaoFilial: String;
  public
   procedure MontaListaFiliais(Editando: Boolean);
   procedure SelecionarFilial;
   procedure PosicionarRedes_Adquirentes;
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
   property  TabelaRedes_Adquirentes: TZDataSet read GetTabelaRedes_Adquirentes;
   property  TabelaFiliaisRedes_Adquirentes: TZDataSet read GetTabelaFiliaisRedes_Adquirentes;
   property  ConsultarFiliais: TZDataSet read GetConsultarFiliais;
   property  ConsultarRedes_Adquirentes: TZDataSet read GetConsultarRedes_Adquirentes;
   property  EditandoTabelaFiliaisRedes_Adquirentes :Boolean read GetEditandoTabelaFiliaisRedes_Adquirentes;
  end;

var
  dtmCadastroRedes_Adquirentes: TdtmCadastroRedes_Adquirentes;

implementation

uses dmtecsoft;

{$R *.dfm}

constructor TdtmCadastroRedes_Adquirentes.Create(AOwner: TComponent);
begin
  inherited;
  qryRedes_Adquirentes.Tag := ctTabelas;
  qryRedes_Adquirentes_Tipos_Recebimentos.Tag  := ctTabelas;
  qryConsultaRedes_Adquirentes.Tag := ctCrediarioTabelaConsultaRedes_Adquirentes;
  qryConsultaFiliais.Tag := ctCrediarioTabelaConsultaFiliais;
end;


procedure TdtmCadastroRedes_Adquirentes.PosicionarRedes_Adquirentes;
begin
  qryRedes_Adquirentes.Close;
  qryRedes_Adquirentes_Tipos_Recebimentos.Close;
  qryRedes_Adquirentes.Params[0].AsInteger:= CodigoGrupoFilial;
  qryRedes_Adquirentes.Open;
  qryRedes_Adquirentes_Tipos_Recebimentos.Open
end;

function TdtmCadastroRedes_Adquirentes.IncluirGrupoFilial: Boolean;
begin
  qryRedes_Adquirentes.Insert;
  qryRedes_Adquirentesestoque.AsBoolean:= False;
  Result:=True;
end;

function TdtmCadastroRedes_Adquirentes.IncluirFilialGrupoFilial(Editar:boolean):Boolean;
begin
  if (qryRedes_Adquirentes_Tipos_Recebimentos.State in [dsEdit,dsInsert]) then
    qryRedes_Adquirentes_Tipos_Recebimentos.Cancel;
  MontaListaFiliais(Editar);
  qryRedes_Adquirentes_Tipos_Recebimentos.Params[0].Clear;
  if Editar and not qryRedes_Adquirentes_Tipos_Recebimentos.IsEmpty then begin
//    qryRedes_Adquirentes_Tipos_Recebimentos.Edit;
//    qryRedes_Adquirentes_Tipos_Recebimentos.Cancel;
  end
  else
    qryRedes_Adquirentes_Tipos_Recebimentos.Append;
  Result:=True;
end;


function TdtmCadastroRedes_Adquirentes.GravarGrupoFilial: Boolean;
var
  cont: Integer;
begin
  if qryRedes_Adquirentes.CheckRequiredFields then begin
    if qryRedes_Adquirentes.State in [dsInsert] then
    begin
      spcProximoRedes_Adquirentes.Open;
      SetCodigoGrupoFilial(spcProximoRedes_Adquirentescodigo.AsInteger);
      spcProximoRedes_Adquirentes.Close;
    end;
    qryRedes_Adquirentes_Tipos_Recebimentos.DisableControls;
    try
      qryRedes_Adquirentes_Tipos_Recebimentos.First;
      for cont:= 1 to qryRedes_Adquirentes_Tipos_Recebimentos.RecordCount do
      begin
        if qryRedes_Adquirentes_Tipos_Recebimentosgrupo.AsInteger = 0 then
        begin
          qryRedes_Adquirentes_Tipos_Recebimentos.Edit;
          SetCodigoFilialGrupoFilial(qryRedes_Adquirentescodigo.AsInteger);
          qryRedes_Adquirentes_Tipos_Recebimentos.Post;
        end;
        qryRedes_Adquirentes_Tipos_Recebimentos.Next;
      end;
    finally
      qryRedes_Adquirentes_Tipos_Recebimentos.EnableControls;
    end;
    Perpetrar([qryRedes_Adquirentes, qryRedes_Adquirentes_Tipos_Recebimentos]);
    Result:=True;
  end
  else
    Result:= False;
end;

function TdtmCadastroRedes_Adquirentes.GravarFilialGrupoFilial: Boolean;
begin
  qryRedes_Adquirentes_Tipos_Recebimentosfilial.AsInteger := qryProcuraFiliaiscodigo.AsInteger;
  qryRedes_Adquirentes_Tipos_Recebimentosnome.AsString := qryProcuraFiliaisnome.AsString;
  qryRedes_Adquirentes_Tipos_Recebimentos.Post;
  qryRedes_Adquirentes.Edit;
  Result:= True;
end;

function TdtmCadastroRedes_Adquirentes.ExcluirGrupoFilial: Boolean;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o GRUPO DE FILIAIS'])) = smbok then
  begin
    if not qryRedes_Adquirentes.IsEmpty then
      qryRedes_Adquirentes.Delete
    else
      qryRedes_Adquirentes.Cancel;
    Perpetrar([qryRedes_Adquirentes]);
    qryRedes_Adquirentes.Edit;
    Result:= True;
  end
  else
    Result:= False;
end;

function TdtmCadastroRedes_Adquirentes.ExcluirFilialGrupoFilial: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a FILIAL'])) = smbOk then begin
    if not qryRedes_Adquirentes_Tipos_Recebimentos.IsEmpty then
         qryRedes_Adquirentes_Tipos_Recebimentos.Delete
    else qryRedes_Adquirentes_Tipos_Recebimentos.Cancel;
    Result:= True;
  end
end;

function TdtmCadastroRedes_Adquirentes.ExisteGrupoFilial(campo, codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaRedes_Adquirentes, campo, codigo);
end;

function TdtmCadastroRedes_Adquirentes.ExisteFilial(campo, codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

procedure TdtmCadastroRedes_Adquirentes.SelecionarFilial;
begin
  qryRedes_Adquirentes_Tipos_Recebimentosfilial.AsInteger := qryConsultaFiliaiscodigo.AsInteger;
  qryRedes_Adquirentes_Tipos_Recebimentosnome.AsString   := qryConsultaFiliaisnome.AsString;
end;

function TdtmCadastroRedes_Adquirentes.GetTabelaRedes_Adquirentes: TZDataSet;
begin
  Result:= qryRedes_Adquirentes;
end;

function TdtmCadastroRedes_Adquirentes.GetTabelaFiliaisRedes_Adquirentes: TZDataSet;
begin
  Result:= qryRedes_Adquirentes_Tipos_Recebimentos;
end;

function TdtmCadastroRedes_Adquirentes.GetConsultarFiliais: TZDataSet;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmCadastroRedes_Adquirentes.GetConsultarRedes_Adquirentes: TZDataSet;
begin
  Result:= qryConsultaRedes_Adquirentes;
end;

function TdtmCadastroRedes_Adquirentes.GetCodigoGrupoFilial: Integer;
begin
  Result:= qryConsultaRedes_Adquirentescodigo.AsInteger;
end;

function TdtmCadastroRedes_Adquirentes.GetDescricaoFilial: String;
begin
  Result:= qryProcuraFiliaisnome.AsString;
end;

procedure TdtmCadastroRedes_Adquirentes.SetCodigoGrupoFilial(const Value: Integer);
begin
  if qryRedes_Adquirentes.State in [dsInsert, dsEdit] then
    qryRedes_Adquirentescodigo.AsInteger:= Value;
end;

procedure TdtmCadastroRedes_Adquirentes.SetCodigoFilialGrupoFilial(const Value: Integer);
begin
  if qryRedes_Adquirentes_Tipos_Recebimentos.State in [dsInsert, dsEdit] then
    qryRedes_Adquirentes_Tipos_Recebimentosgrupo.AsInteger:= Value;
end;

procedure TdtmCadastroRedes_Adquirentes.qryRedes_AdquirentesAfterScroll(DataSet: TDataSet);
begin
  RefazConsulta(qryRedes_Adquirentes_Tipos_Recebimentos, [0], [qryRedes_Adquirentescodigo.AsInteger]);
end;

procedure TdtmCadastroRedes_Adquirentes.qryRedes_Adquirentes_Tipos_RecebimentosBeforeInsert(DataSet: TDataSet);
begin
   qryRedes_Adquirentes.Edit;
end;

procedure TdtmCadastroRedes_Adquirentes.qryRedes_Adquirentes_Tipos_RecebimentosBeforeEdit(DataSet: TDataSet);
begin
  qryRedes_Adquirentes.Edit;
end;

procedure TdtmCadastroRedes_Adquirentes.qryRedes_Adquirentes_Tipos_RecebimentosBeforeDelete(DataSet: TDataSet);
begin
  qryRedes_Adquirentes.Edit;
end;

procedure TdtmCadastroRedes_Adquirentes.MontaListaFiliais(Editando: Boolean);
var
  Pos : TBookmark;
  Filial, a  : Integer;
  ParamConsulta, ParamProcura : String;
begin
  ParamConsulta := '';
  ParamProcura  := '';
  Filial        := qryRedes_Adquirentes_Tipos_RecebimentosFilial.AsInteger;
  if not qryRedes_Adquirentes_Tipos_Recebimentos.IsEmpty then begin
    ParamConsulta := 'Where not (F.Codigo in (';
    ParamProcura  := 'and not (F.Codigo in (';
  end;
  Pos:= qryRedes_Adquirentes_Tipos_Recebimentos.GetBookmark;
  qryRedes_Adquirentes_Tipos_Recebimentos.DisableControls;
  try
    qryRedes_Adquirentes_Tipos_Recebimentos.First;
    for a:= 1 to qryRedes_Adquirentes_Tipos_Recebimentos.RecordCount do
    begin
      ParamConsulta:= ParamConsulta + qryRedes_Adquirentes_Tipos_RecebimentosFilial.AsString + ',';
      if Editando then
      begin
        if (qryRedes_Adquirentes_Tipos_Recebimentos.RecordCount > 1) then
        begin
          if (qryRedes_Adquirentes_Tipos_RecebimentosFilial.AsInteger <> Filial) then
            ParamProcura:= ParamProcura + qryRedes_Adquirentes_Tipos_RecebimentosFilial.AsString + ',';
        end
        else
          ParamProcura:= ParamProcura + '0,';
      end
      else
        ParamProcura:= ParamProcura + qryRedes_Adquirentes_Tipos_RecebimentosFilial.AsString + ',';
      qryRedes_Adquirentes_Tipos_Recebimentos.Next;
    end;
    if not qryRedes_Adquirentes_Tipos_Recebimentos.IsEmpty then
    begin
      Delete(ParamConsulta,Length(ParamConsulta),1);
      Delete(ParamProcura ,Length(ParamProcura ),1);
      ParamConsulta:= ParamConsulta + '))';
      ParamProcura := ParamProcura  + '))';
    end;
    qryConsultaFiliais.Sql[03]:= ParamConsulta;
    qryProcuraFiliais.Sql[04] := ParamProcura;
  finally
    qryRedes_Adquirentes_Tipos_Recebimentos.GotoBookmark(Pos);
    qryRedes_Adquirentes_Tipos_Recebimentos.FreeBookmark(Pos);
    qryRedes_Adquirentes_Tipos_Recebimentos.EnableControls;
  end;
end;

function TdtmCadastroRedes_Adquirentes.GetEditandoTabelaFiliaisRedes_Adquirentes: boolean;
begin
  Result := qryRedes_Adquirentes_Tipos_Recebimentos.State = dsEdit;
end;

function TdtmCadastroRedes_Adquirentes.GetCodigoFilial: string;
begin
  Result:=qryRedes_Adquirentes_Tipos_Recebimentosfilial.AsString;
end;

procedure TdtmCadastroRedes_Adquirentes.qryRedes_Adquirentes_Tipos_RecebimentosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if qryRedes_Adquirentes.State = dsBrowse then
    qryRedes_Adquirentes.Edit;
end;

procedure TdtmCadastroRedes_Adquirentes.qryRedes_AdquirentesAfterClose(DataSet: TDataSet);
begin
  inherited;
  RefazConsulta(qryRedes_Adquirentes_Tipos_Recebimentos, [0],[0]);
end;


end.
