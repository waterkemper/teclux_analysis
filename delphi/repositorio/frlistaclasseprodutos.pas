unit frlistaclasseprodutos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes, CheckLst;

type
  TfraListaClasseProdutos = class(TFrame)
    gbx: TGroupBox;
    clbClasseprodutos: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    Bevel1: TBevel;
    qryClassesProdutos: TtecQuery;
    qryclassesProdutoscodigo: TStringField;
    qryclassesProdutosdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FPlanilhaCustos: boolean;
    function GetListaclasses: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    procedure SetPlanilhaCustos(const Value: boolean);
  private
    { Private declarations }
    property Listaclasses: TLista read GetListaclasses;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property PlanilhaCustos: boolean read FPlanilhaCustos write SetPlanilhaCustos;
    procedure MarcarListaclasses(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaclasseProdutos }

constructor TfraListaclasseProdutos.Create(Aowner: Tcomponent);
begin
  inherited;
  qryClassesProdutos.DataBase := dtmtecsoft.dbatecsoft;
  qryClassesProdutos.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(Listaclasses, clbclasseprodutos);
end;

function TfraListaclasseProdutos.GetListaclasses: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  if PlanilhaCustos then
    qryclassesProdutos.MacroByName('WherePlanilhaCustos').AsString :=
      'where g.planilhacustos'
  else
    qryclassesProdutos.MacroByName('WherePlanilhaCustos').AsString := '';

  qryclassesProdutos.Open;
  SetLength(FLista, qryclassesProdutos.RecordCount);
  Ind:= 0;
  while not qryclassesProdutos.Eof do begin
    FLista[Ind].codigo   := qryclassesProdutoscodigo.AsString;
    FLista[Ind].descricao:= qryclassesProdutosdescricao.AsString;
    Inc(Ind);
    qryclassesProdutos.Next;
  end;
  qryclassesProdutos.Close;
  Result := FLista;
end;

procedure TfraListaclasseProdutos.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbclasseprodutos, True);
end;

procedure TfraListaclasseProdutos.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbclasseprodutos, False);
end;

function TfraListaclasseProdutos.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbclasseprodutos.Items.Count -1 do
    if clbclasseprodutos.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaclasseProdutos.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbclasseprodutos.Items.Count -1 do
    if not (clbclasseprodutos.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaclasseProdutos.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clbclasseprodutos.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(Listaclasses, clbclasseprodutos);
  end;
end;

procedure TfraListaclasseProdutos.MarcarListaclasses(Lista: String);
var
 classe: String;
 i: integer;

 procedure Selecionar;
 var
   ind : integer;
 begin
    for Ind:= 0 to (Length(flista) - 1) do
      if classe = flista[ind].codigo then
      begin
        clbclasseprodutos.Checked[ind] := true;
        break;
      end
 end;

begin
 if lista<>'' then
 begin
   MarcarLista(clbclasseprodutos, False);
   for i:=1 to length(lista) do
   begin
     if lista[i]=',' then
     begin
       selecionar;
       classe := '';
     end
     else
       if lista[i]<>'''' then
         classe := classe + lista[i];
   end;
   if classe<>'' then
     selecionar;
 end;
end;

end.
