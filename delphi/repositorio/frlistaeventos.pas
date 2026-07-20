unit frlistaeventos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, CheckLst, DB, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes;

type
  TfraListaEventos = class(TFrame)
    gbx: TGroupBox;
    Bevel1: TBevel;
    clbEventos: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    qryEventos: TtecQuery;
    qryEventoscodigo: TIntegerField;
    qryEventosdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FPlanilhaCustos: boolean;
    function GetLista: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    procedure SetPlanilhaCustos(const Value: boolean);
  private
    { Private declarations }
    property Lista: TLista read GetLista;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property PlanilhaCustos: boolean read FPlanilhaCustos write SetPlanilhaCustos;
    
  end;

implementation
var
FLista  : TLista;

{$R *.dfm}

{ TfraListaEventos }

constructor TfraListaEventos.Create(Aowner: Tcomponent);
begin
  inherited;
  qryEventos.DataBase := dtmtecsoft.dbatecsoft;
  qryEventos.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(Lista, clbEventos);
end;

function TfraListaEventos.GetLista: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  if PlanilhaCustos then
    qryEventos.MacroByName('WherePlanilhaCustos').AsString :=
      'where planilhacustos'
  else
    qryEventos.MacroByName('WherePlanilhaCustos').AsString := '';

  qryEventos.Open;
  SetLength(FLista, qryEventos.RecordCount);
  Ind:= 0;
  while not qryEventos.Eof do begin
    FLista[Ind].codigo   := qryEventoscodigo.AsString;
    FLista[Ind].descricao:= qryEventosdescricao.AsString;
    Inc(Ind);
    qryEventos.Next;
  end;
  qryEventos.Close;
  Result := FLista;
end;

function TfraListaEventos.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbEventos.Items.Count -1 do
    if clbEventos.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaEventos.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbEventos.Items.Count -1 do
    if not (clbEventos.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaEventos.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbEventos, True);
end;

procedure TfraListaEventos.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbEventos, False);
end;

procedure TfraListaEventos.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clbEventos.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(Lista, clbEventos);
  end;
end;

end.
