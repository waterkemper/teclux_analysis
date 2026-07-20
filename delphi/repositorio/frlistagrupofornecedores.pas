unit frlistagrupofornecedores;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, DB, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, biblio, CheckLst;

type
  TfraListaGrupoFornecedores = class(TFrame)
    gbxGrupoFornecedores: TGroupBox;
    bvllimitatortabajara: TBevel;
    clbgrupofornecedores: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    qryGruposFornecedores: TtecQuery;
    qryGruposFornecedorescodigo: TIntegerField;
    qryGruposFornecedoresnome: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FListaGruposSelecionados: vInteger;
    FListaGruposSelecionadosA: vString;
    FListaGruposSelecionadosB: String;
    function GetListaGrupos: TLista;
    function GetListaGruposSelecionados: vInteger;
    function GetListaGruposSelecionadosA: vString;
    function GetListaGruposSelecionadosB: String;
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    property ListaGrupos: TLista read GetListaGrupos;


    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property ListaGruposSelecionados: vInteger read GetListaGruposSelecionados write FListaGruposSelecionados;
    property ListaGruposSelecionadosA: vString read GetListaGruposSelecionadosA write FListaGruposSelecionadosA;
    property ListaGruposSelecionadosB: String read GetListaGruposSelecionadosB write FListaGruposSelecionadosB;

    procedure MarcarListaGrupoFornecedores(Lista: String);

  end;

implementation

uses dmtecsoft;

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaGrupoFornecedores }

constructor TfraListaGrupoFornecedores.Create(Aowner: Tcomponent);
begin
  inherited;
  qryGruposFornecedores.DataBase := dtmtecsoft.dbatecsoft;
  qryGruposFornecedores.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(ListaGrupos, clbgrupofornecedores);
end;

function TfraListaGrupoFornecedores.GetListaGrupos: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryGruposFornecedores.Open;
  SetLength(FLista, qryGruposFornecedores.RecordCount);
  Ind:= 0;
  while not qryGruposFornecedores.Eof do begin
    FLista[Ind].codigo   := qryGruposFornecedorescodigo.AsString;
    FLista[Ind].descricao:= qryGruposFornecedoresnome.AsString;
    Inc(Ind);
    qryGruposFornecedores.Next;
  end;
  qryGruposFornecedores.Close;
  Result := FLista;
end;

function TfraListaGrupoFornecedores.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbgrupofornecedores.Items.Count -1 do
    if clbgrupofornecedores.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaGrupoFornecedores.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbgrupofornecedores.Items.Count -1 do
    if not (clbgrupofornecedores.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaGrupoFornecedores.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbgrupofornecedores, True);
end;

procedure TfraListaGrupoFornecedores.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbgrupofornecedores, False);
end;

procedure TfraListaGrupoFornecedores.MarcarListaGrupoFornecedores(
  Lista: String);
var
 Grupo: String;
 i: integer;

 procedure Selecionar;
 var
   ind : integer;
 begin
    for Ind:= 0 to (Length(flista) - 1) do
      if grupo = flista[ind].codigo then
      begin
        clbgrupofornecedores.Checked[ind] := true;
        break;
      end
 end;

begin
 if lista<>'' then
 begin
   MarcarLista(clbgrupofornecedores, False);
   for i:=1 to length(lista) do
   begin
     if lista[i]=',' then
     begin
       selecionar;
       grupo := '';
     end
     else
       if lista[i]<>'''' then
         grupo := grupo + lista[i];
   end;
   if grupo<>'' then
     selecionar;
 end;
end;


function TfraListaGrupoFornecedores.GetListaGruposSelecionados: vInteger;
var
 i,j: integer;
begin
  FListaGruposSelecionados := nil;
  j := 0;

  for i:=0 to clbgrupofornecedores.Items.Count -1 do
    if clbgrupofornecedores.Checked[i] then
    begin
      SetLength(FListaGruposSelecionados, length(FListaGruposSelecionados)+1);
      FListaGruposSelecionados[j] := strtoint(flista[i].codigo);
      inc(j);
    end;
  Result := FListaGruposSelecionados;

end;


function TfraListaGrupoFornecedores.GetListaGruposSelecionadosA: vString;
var
 i,j: integer;
begin
  FListaGruposSelecionadosA:= nil;
  j := 0;

  for i:=0 to clbgrupofornecedores.Items.Count -1 do
    if clbgrupofornecedores.Checked[i] then
    begin
      SetLength(FListaGruposSelecionadosA, length(FListaGruposSelecionadosA)+1);
      FListaGruposSelecionadosA[j] := flista[i].codigo;
      inc(j);
    end;
  Result := FListaGruposSelecionadosA;

end;

function TfraListaGrupoFornecedores.GetListaGruposSelecionadosB: String;
var
 i: integer;
begin
  FListaGruposSelecionadosB := '';
  for i:=0 to clbgrupofornecedores.Items.Count -1 do
    if clbgrupofornecedores.Checked[i] then
      FListaGruposSelecionadosB := FListaGruposSelecionadosB + flista[i].codigo+',';

  if FListaGruposSelecionadosB<>'' then
    FListaGruposSelecionadosB := copy(FListaGruposSelecionadosB,1,length(FListaGruposSelecionadosB)-1);

  Result := '{'+FListaGruposSelecionadosB+'}';
end;

end.
