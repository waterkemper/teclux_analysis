unit frlistafiliais;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, dmbasico, biblio, clparametrossistema,clusuario,
  CheckLst;
type
  TfraListaFiliais = class(TFrame)
    gbxFiliais: TGroupBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FListaSelecionada2: String;
    FListaSelecionada_int: String;
    function GetTodosMarcados: Boolean;
    function GetListaSelecionada: String;
    function GetListaSelecionada2: String;
    function GetListadeFiliaisSelecionadas: TStringList;
    function GetListaGeraldeFiliais: TStringList;
    function GetListaSelecionada_int: String;
    { Private declarations }
  protected
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property ListaSelecionada2: String read GetListaSelecionada2 write FListaSelecionada2;
    property ListaSelecionada_int: String read GetListaSelecionada_int write FListaSelecionada_int;
    property ListadeFiliaisSelecionadas: TStringList read GetListadeFiliaisSelecionadas;

    property ListaGeraldeFiliais: TStringList read GetListaGeraldeFiliais;
    procedure MarcarListaArmazenada(Lista: String);
  end;

implementation
uses frlistagruposfiliais;
{$R *.dfm}

{ TfraListaFiliais }

constructor TfraListaFiliais.Create(Aowner: Tcomponent);
var i: integer;
begin
  inherited;

  ObterLista(ListaFiliais, clbFiliais);
  for i:=0 to clbFiliais.Items.Count -1 do
  begin
    if (Integer(ListaFiliais.Objects[i]) = FilialBase) and not (UsuarioLogin.Administrador) then
    begin
      clbFiliais.checked[i] := true;
      break;
    end
  end;
end;

procedure TfraListaFiliais.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfraListaFiliais.sbnMarcarFiliaisClick(Sender: TObject);
begin
  MarcarLista(clbFiliais, True);
end;

procedure TfraListaFiliais.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  MarcarLista(clbFiliais, False);
end;

function TfraListaFiliais.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbFiliais.Items.Count -1 do
    if not (clbFiliais.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

function TfraListaFiliais.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbFiliais.Items.Count -1 do
    if clbFiliais.Checked[i] then
      FListaSelecionada := FListaSelecionada + '''' + IntToStr(Integer(ListaFiliais.Objects[i])) + ''',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1)
  else
  if ParSistema.RelatorioSomenteFiliaisAutorizadas then
    FListaSelecionada := ListaFiliaisLiberada;

  Result := FListaSelecionada;
end;

function TfraListaFiliais.GetListaSelecionada2: String;
var
 i: integer;
begin
  FListaSelecionada2 := '';
  for i:=0 to clbFiliais.Items.Count -1 do
    if clbFiliais.Checked[i] then
      FListaSelecionada2 := FListaSelecionada2 + '''' + IntToStr(Integer(ListaFiliais.Objects[i])) + ''''',''';

  if FListaSelecionada2<>'' then
    FListaSelecionada2 := copy(FListaSelecionada2,1,length(FListaSelecionada2)-3)
  else
  if ParSistema.RelatorioSomenteFiliaisAutorizadas then
    FListaSelecionada2 := ListaFiliaisLiberada2;

  Result := FListaSelecionada2;

end;

procedure TfraListaFiliais.MarcarListaArmazenada(Lista: String);
var
 codigo: String;
 i: integer;

 procedure Selecionar;
 var
   ind : integer;
 begin
    for Ind:= 0 to clbFiliais.items.count - 1 do
      if strtoint(codigo) = Integer(ListaFiliais.Objects[Ind]) then
      begin
        clbFiliais.Checked[ind] := true;
        break;
      end
 end;

begin
 MarcarLista(clbfiliais, False);
 if lista<>'' then
 begin
   for i:=1 to length(lista) do
   begin
     if lista[i]=',' then
     begin
       selecionar;
       codigo := '';
     end
     else
       if lista[i]<>'''' then
         codigo := codigo + lista[i];
   end;
   if codigo<>'' then
     selecionar;
 end;
end;

function TfraListaFiliais.GetListadeFiliaisSelecionadas: TStringList;
var
 i: integer;
begin
  result := TStringList.Create;
  for i:=0 to clbFiliais.Items.Count -1 do
    if clbFiliais.Checked[i] then
      result.add(IntToStr(Integer(ListaFiliais.Objects[i])));
end;

function TfraListaFiliais.GetListaGeraldeFiliais: TStringList;
var
 i: integer;
begin
  result := TStringList.Create;
  for i:=0 to clbFiliais.Items.Count -1 do
    result.add(IntToStr(Integer(ListaFiliais.Objects[i])));
end;

function TfraListaFiliais.GetListaSelecionada_int: String;
var
 i: integer;
begin
  FListaSelecionada_int := '';
  for i:=0 to clbFiliais.Items.Count -1 do
    if clbFiliais.Checked[i] then
      FListaSelecionada_int := FListaSelecionada_int + IntToStr(Integer(ListaFiliais.Objects[i])) + ',';

  if FListaSelecionada_int<>'' then
    FListaSelecionada_int := copy(FListaSelecionada_int,1,length(FListaSelecionada_int)-1)
  else
  if ParSistema.RelatorioSomenteFiliaisAutorizadas then
    FListaSelecionada_int := trocar(ListaFiliaisLiberada,'''','');

  Result := FListaSelecionada_int;
end;

end.
