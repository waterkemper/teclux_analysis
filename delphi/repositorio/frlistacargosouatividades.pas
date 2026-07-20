unit frlistacargosouatividades;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes;

type
  TfraListaCargosouAtividades = class(TFrame)
    gbx: TGroupBox;
    clblista: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    bevel1: TBevel;
    qryCargosouAtividades: TtecQuery;
    ckbExceto: TCheckBox;
    qryCargosouAtividadescodigo: TIntegerField;
    qryCargosouAtividadesdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FPlanilhaCustos: boolean;
    FListaSelecionada2: String;
    function GetLista: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    procedure SetPlanilhaCustos(const Value: boolean);
    function GetListaSelecionada2: String;
  private
    { Private declarations }
    property Lista: TLista read GetLista;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property ListaSelecionada2: String read GetListaSelecionada2 write FListaSelecionada2;
    property PlanilhaCustos: boolean read FPlanilhaCustos write SetPlanilhaCustos;
    procedure MarcarListaArmazenada(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaCargosouAtividades }

constructor TfraListaCargosouAtividades.Create(Aowner: Tcomponent);
begin
  inherited;
  qryCargosouAtividades.DataBase := dtmtecsoft.dbatecsoft;
  qryCargosouAtividades.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(Lista, clblista);
end;

function TfraListaCargosouAtividades.GetLista: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryCargosouAtividades.Open;
  SetLength(FLista, qryCargosouAtividades.RecordCount);
  Ind:= 0;
  while not qryCargosouAtividades.Eof do begin
    FLista[Ind].codigo   := qryCargosouAtividadescodigo.AsString;
    FLista[Ind].descricao:= qryCargosouAtividadesdescricao.AsString;
    Inc(Ind);
    qryCargosouAtividades.Next;
  end;
  qryCargosouAtividades.Close;
  Result := FLista;
end;

procedure TfraListaCargosouAtividades.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clblista, True);
end;

procedure TfraListaCargosouAtividades.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clblista, False);
end;

function TfraListaCargosouAtividades.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clblista.Items.Count -1 do
    if clblista.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaCargosouAtividades.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clblista.Items.Count -1 do
    if not (clblista.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaCargosouAtividades.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clblista.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(Lista, clblista);
  end;
end;

procedure TfraListaCargosouAtividades.MarcarListaArmazenada(Lista: String);
var
 codigofiscal: String;
 i: integer;

 procedure Selecionar;
 var
   ind : integer;
 begin
    for Ind:= 0 to (Length(flista) - 1) do
      if codigofiscal = flista[ind].codigo then
      begin
        clblista.Checked[ind] := true;
        break;
      end
 end;

begin
 MarcarLista(clblista, False);
 if lista<>'' then
 begin
   for i:=1 to length(lista) do
   begin
     if lista[i]=',' then
     begin
       selecionar;
       codigofiscal := '';
     end
     else
       if lista[i]<>'''' then
         codigofiscal := codigofiscal + lista[i];
   end;
   if codigofiscal<>'' then
     selecionar;
 end;
end;

function TfraListaCargosouAtividades.GetListaSelecionada2: String;
var
 i: integer;
begin
  FListaSelecionada2 := '';
  for i:=0 to clblista.Items.Count -1 do
    if clblista.Checked[i] then
      FListaSelecionada2 := FListaSelecionada2 + '''' + flista[i].codigo + ''''',''';

  if FListaSelecionada2<>'' then
    FListaSelecionada2 := copy(FListaSelecionada2,1,length(FListaSelecionada2)-3);

  Result := FListaSelecionada2;

end;

end.
