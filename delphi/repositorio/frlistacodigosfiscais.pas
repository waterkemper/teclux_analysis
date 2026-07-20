unit frlistacodigosfiscais;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes;

type
  TfraListaCodigosFiscais = class(TFrame)
    gbx: TGroupBox;
    clblista: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    Bevel1: TBevel;
    qryCodigosFiscais: TtecQuery;
    qryCodigosFiscaiscodigo: TIntegerField;
    qryCodigosFiscaisdescricao: TStringField;
    ckbExceto: TCheckBox;
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
    procedure MarcarListaArmazenada(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaCodigosFiscais }

constructor TfraListaCodigosFiscais.Create(Aowner: Tcomponent);
begin
  inherited;
  qryCodigosFiscais.DataBase := dtmtecsoft.dbatecsoft;
  qryCodigosFiscais.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(Lista, clblista);
end;

function TfraListaCodigosFiscais.GetLista: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryCodigosFiscais.Open;
  SetLength(FLista, qryCodigosFiscais.RecordCount);
  Ind:= 0;
  while not qryCodigosFiscais.Eof do begin
    FLista[Ind].codigo   := qryCodigosFiscaiscodigo.AsString;
    FLista[Ind].descricao:= qryCodigosFiscaisdescricao.AsString;
    Inc(Ind);
    qryCodigosFiscais.Next;
  end;
  qryCodigosFiscais.Close;
  Result := FLista;
end;

procedure TfraListaCodigosFiscais.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clblista, True);
end;

procedure TfraListaCodigosFiscais.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clblista, False);
end;

function TfraListaCodigosFiscais.GetListaSelecionada: String;
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

function TfraListaCodigosFiscais.GetTodosMarcados: Boolean;
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

procedure TfraListaCodigosFiscais.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clblista.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(Lista, clblista);
  end;
end;

procedure TfraListaCodigosFiscais.MarcarListaArmazenada(Lista: String);
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

end.
