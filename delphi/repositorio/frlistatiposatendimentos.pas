unit frlistatiposAtendimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, QCheckLst, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes, CheckLst;

type
  TfraListaTiposAtendimentos = class(TFrame)
    gbx: TGroupBox;
    clbTiposAtendimentos: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    Bevel1: TBevel;
    qryTiposAtendimentos: TtecQuery;
    qryTiposAtendimentoscodigo: TIntegerField;
    qryTiposAtendimentosdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FPlanilhaCustos: boolean;
    FChequesAvulsos: Boolean;
    function GetListaTiposAtendimentos: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    procedure SetPlanilhaCustos(const Value: boolean);
    function GetChequesAvulsos: Boolean;
  private
    { Private declarations }
    property ListaTiposAtendimentos: TLista read GetListaTiposAtendimentos;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property ChequesAvulsos: Boolean read GetChequesAvulsos write FChequesAvulsos;
    property PlanilhaCustos: boolean read FPlanilhaCustos write SetPlanilhaCustos;
    procedure MarcarListaTiposAtendimentos(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaTiposAtendimentos }

constructor TfraListaTiposAtendimentos.Create(Aowner: Tcomponent);
begin
  inherited;
  qryTiposAtendimentos.DataBase := dtmtecsoft.dbatecsoft;
  qryTiposAtendimentos.Transaction := dtmtecsoft.tstTecSoft;

  ObterLista(ListaTiposAtendimentos, clbtiposAtendimentos);
end;

function TfraListaTiposAtendimentos.GetListaTiposAtendimentos: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryTiposAtendimentos.Open;
  SetLength(FLista, qryTiposAtendimentos.RecordCount);
  Ind:= 0;
  while not qryTiposAtendimentos.Eof do begin
    FLista[Ind].codigo   := qryTiposAtendimentoscodigo.AsString;
    FLista[Ind].descricao:= qryTiposAtendimentosdescricao.AsString;
    Inc(Ind);
    qryTiposAtendimentos.Next;
  end;
  qryTiposAtendimentos.Close;
  Result := FLista;
end;

procedure TfraListaTiposAtendimentos.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbtiposAtendimentos, True);
end;

procedure TfraListaTiposAtendimentos.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbtiposAtendimentos, False);
end;

function TfraListaTiposAtendimentos.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbtiposAtendimentos.Items.Count -1 do
    if clbtiposAtendimentos.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaTiposAtendimentos.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbtiposAtendimentos.Items.Count -1 do
    if not (clbtiposAtendimentos.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaTiposAtendimentos.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clbtiposAtendimentos.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(ListaTiposAtendimentos, clbtiposAtendimentos);
  end;
end;

procedure TfraListaTiposAtendimentos.MarcarListaTiposAtendimentos(Lista: String);
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
        clbtiposAtendimentos.Checked[ind] := true;
        break;
      end
 end;

begin
 if lista<>'' then
 begin
   MarcarLista(clbtiposAtendimentos, False);
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

function TfraListaTiposAtendimentos.GetChequesAvulsos: Boolean;
var
 i: integer;

begin
  FChequesAvulsos := false;
  for i:=0 to clbtiposAtendimentos.Items.Count -1 do
    if (clbtiposAtendimentos.Checked[i]) and (flista[i].codigo='999')  then
    begin
      FChequesAvulsos := true;
      break;
    end;

  Result := FChequesAvulsos;

end;

end.
