unit frlistamarcasprodutos;

interface

uses
  SysUtils, Types, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes, Classes;

type
  TfraListaMarcasProdutos = class(TFrame)
    gbx: TGroupBox;
    clbMarcasprodutos: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    Bevel1: TBevel;
    qryMarcassProdutos: TtecQuery;
    qrymarcassProdutoscodigo: TIntegerField;
    qrymarcassProdutosdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FPlanilhaCustos: boolean;
    function GetListaMarcass: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    procedure SetPlanilhaCustos(const Value: boolean);
  private
    { Private declarations }
    property ListaMarcass: TLista read GetListaMarcass;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property PlanilhaCustos: boolean read FPlanilhaCustos write SetPlanilhaCustos;
    procedure MarcarListaMarcas(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaMarcasProdutos }

constructor TfraListaMarcasProdutos.Create(Aowner: Tcomponent);
begin
  inherited;
  qryMarcassProdutos.DataBase := dtmtecsoft.dbatecsoft;
  qryMarcassProdutos.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(ListaMarcass, clbMarcasprodutos);
end;

function TfraListaMarcasProdutos.GetListaMarcass: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  if PlanilhaCustos then
    qryMarcassProdutos.MacroByName('WherePlanilhaCustos').AsString :=
      'where g.planilhacustos'
  else
    qryMarcassProdutos.MacroByName('WherePlanilhaCustos').AsString := '';

  qryMarcassProdutos.Open;
  SetLength(FLista, qryMarcassProdutos.RecordCount);
  Ind:= 0;
  while not qryMarcassProdutos.Eof do begin
    FLista[Ind].codigo   := qryMarcassProdutoscodigo.AsString;
    FLista[Ind].descricao:= qryMarcassProdutosdescricao.AsString;
    Inc(Ind);
    qryMarcassProdutos.Next;
  end;
  qryMarcassProdutos.Close;
  Result := FLista;
end;

procedure TfraListaMarcasProdutos.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbMarcasprodutos, True);
end;

procedure TfraListaMarcasProdutos.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbMarcasprodutos, False);
end;

function TfraListaMarcasProdutos.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbMarcasprodutos.Items.Count -1 do
    if clbMarcasprodutos.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaMarcasProdutos.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbMarcasprodutos.Items.Count -1 do
    if not (clbMarcasprodutos.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaMarcasProdutos.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clbMarcasprodutos.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(ListaMarcass, clbMarcasprodutos);
  end;
end;

procedure TfraListaMarcasProdutos.MarcarListaMarcas(Lista: String);
var
 Marcas: String;
 i: integer;

 procedure Selecionar;
 var
   ind : integer;
 begin
    for Ind:= 0 to (Length(flista) - 1) do
      if Marcas = flista[ind].codigo then
      begin
        clbMarcasprodutos.Checked[ind] := true;
        break;
      end
 end;

begin
 if lista<>'' then
 begin
   MarcarLista(clbMarcasprodutos, False);
   for i:=1 to length(lista) do
   begin
     if lista[i]=',' then
     begin
       selecionar;
       Marcas := '';
     end
     else
       if lista[i]<>'''' then
         Marcas := Marcas + lista[i];
   end;
   if Marcas<>'' then
     selecionar;
 end;
end;

end.
