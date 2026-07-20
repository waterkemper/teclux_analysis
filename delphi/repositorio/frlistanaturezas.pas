unit frlistanaturezas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes;

type
  TfraListaNaturezas = class(TFrame)
    gbx: TGroupBox;
    clbLista: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    Bevel1: TBevel;
    qryNaturezas: TtecQuery;
    qryNaturezascodigo: TIntegerField;
    qryNaturezasdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    function GetLista: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
  private
    { Private declarations }
    property Lista: TLista read GetLista;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    procedure MarcarListaArmazenada(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaNaturezas }

constructor TfraListaNaturezas.Create(Aowner: Tcomponent);
begin
  inherited;
  qryNaturezas.DataBase := dtmtecsoft.dbatecsoft;
  qryNaturezas.Transaction := dtmtecsoft.tstTecSoft;
  ObterLista(Lista, clbLista);

end;

function TfraListaNaturezas.GetLista: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryNaturezas.Open;
  SetLength(FLista, qryNaturezas.RecordCount);
  Ind:= 0;
  while not qryNaturezas.Eof do begin
    FLista[Ind].codigo   := qryNaturezascodigo.AsString;
    FLista[Ind].descricao:= qryNaturezasdescricao.AsString;
    Inc(Ind);
    qryNaturezas.Next;
  end;
  qryNaturezas.Close;
  Result := FLista;
end;

procedure TfraListaNaturezas.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbLista, True);
end;

procedure TfraListaNaturezas.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbLista, False);
end;

function TfraListaNaturezas.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbLista.Items.Count -1 do
    if clbLista.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaNaturezas.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbLista.Items.Count -1 do
    if not (clbLista.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;


procedure TfraListaNaturezas.MarcarListaArmazenada(Lista: String);
var
 grupo: String;
 i: integer;

 procedure Selecionar;
 var
   ind : integer;
 begin
    for Ind:= 0 to (Length(flista) - 1) do
      if grupo = flista[ind].codigo then
      begin
        clbLista.Checked[ind] := true;
        break;
      end
 end;

begin
 MarcarLista(clbLista, False);
 if lista<>'' then
 begin
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

end.
