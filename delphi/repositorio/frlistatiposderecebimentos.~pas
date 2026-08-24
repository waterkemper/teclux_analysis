unit frlistatiposderecebimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, QCheckLst, biblio, dmtecsoft, DB,
  ZQuery, ZPgSqlQuery, cpquery, ctconstantes, CheckLst;

type
  TfraListaTiposdeRecebimentos = class(TFrame)
    gbx: TGroupBox;
    clbTiposdeRecebimentos: TCheckListBox;
    pnldireito: TPanel;
    sbnDesmarcar: TSpeedButton;
    sbnMarcar: TSpeedButton;
    Bevel1: TBevel;
    qryTiposdeRecebimentos: TtecQuery;
    qryTiposdeRecebimentoscodigo: TIntegerField;
    qryTiposdeRecebimentosdescricao: TStringField;
    procedure sbnMarcarClick(Sender: TObject);
    procedure sbnDesmarcarClick(Sender: TObject);
  private
    FTodosMarcados: Boolean;
    FListaSelecionada: String;
    FPlanilhaCustos: boolean;
    FChequesAvulsos: Boolean;
    function GetListaTiposdeRecebimentos: TLista;
    function GetListaSelecionada: String;
    function GetTodosMarcados: Boolean;
    procedure SetPlanilhaCustos(const Value: boolean);
    function GetChequesAvulsos: Boolean;
  private
    { Private declarations }
    property ListaTiposdeRecebimentos: TLista read GetListaTiposdeRecebimentos;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    property TodosMarcados: Boolean read GetTodosMarcados write FTodosMarcados;
    property ListaSelecionada: String read GetListaSelecionada write FListaSelecionada;
    property ChequesAvulsos: Boolean read GetChequesAvulsos write FChequesAvulsos;
    property PlanilhaCustos: boolean read FPlanilhaCustos write SetPlanilhaCustos;
    procedure MarcarListaTiposdeRecebimentos(Lista: String);
  end;

implementation

var
FLista  : TLista;


{$R *.dfm}

{ TfraListaTiposdeRecebimentos }

constructor TfraListaTiposdeRecebimentos.Create(Aowner: Tcomponent);
begin
  inherited;
  qryTiposdeRecebimentos.DataBase := dtmtecsoft.dbatecsoft;
  qryTiposdeRecebimentos.Transaction := dtmtecsoft.tstTecSoft;

  ObterLista(ListaTiposdeRecebimentos, clbtiposderecebimentos);
end;

function TfraListaTiposdeRecebimentos.GetListaTiposdeRecebimentos: TLista;
Var
  Ind: Integer;
begin
  FillChar(FLista,SizeOf(FLista),0);
  qryTiposdeRecebimentos.Open;
  SetLength(FLista, qryTiposdeRecebimentos.RecordCount);
  Ind:= 0;
  while not qryTiposdeRecebimentos.Eof do begin
    FLista[Ind].codigo   := qryTiposdeRecebimentoscodigo.AsString;
    FLista[Ind].descricao:= qryTiposdeRecebimentosdescricao.AsString;
    Inc(Ind);
    qryTiposdeRecebimentos.Next;
  end;
  qryTiposdeRecebimentos.Close;
  Result := FLista;
end;

procedure TfraListaTiposdeRecebimentos.sbnMarcarClick(Sender: TObject);
begin
  MarcarLista(clbtiposderecebimentos, True);
end;

procedure TfraListaTiposdeRecebimentos.sbnDesmarcarClick(Sender: TObject);
begin
  MarcarLista(clbtiposderecebimentos, False);
end;

function TfraListaTiposdeRecebimentos.GetListaSelecionada: String;
var
 i: integer;
begin
  FListaSelecionada := '';
  for i:=0 to clbtiposderecebimentos.Items.Count -1 do
    if clbtiposderecebimentos.Checked[i] then
      FListaSelecionada := FListaSelecionada + quotedstr(flista[i].codigo)+',';

  if FListaSelecionada<>'' then
    FListaSelecionada := copy(FListaSelecionada,1,length(FListaSelecionada)-1);

  Result := FListaSelecionada;
end;

function TfraListaTiposdeRecebimentos.GetTodosMarcados: Boolean;
var
 i: integer;
 Desmarcados : Boolean;
begin
  Desmarcados := true;
  FTodosMarcados := True;

  for i:=0 to clbtiposderecebimentos.Items.Count -1 do
    if not (clbtiposderecebimentos.Checked[i]) then
      FTodosMarcados := False
    else
    if Desmarcados then
      Desmarcados := false;

  Result := FTodosMarcados or Desmarcados;
end;

procedure TfraListaTiposdeRecebimentos.SetPlanilhaCustos(const Value: boolean);
begin
  if value <> FPlanilhaCustos then
  begin
    clbtiposderecebimentos.Items.Clear;
    FPlanilhaCustos := Value;
    ObterLista(ListaTiposdeRecebimentos, clbtiposderecebimentos);
  end;
end;

procedure TfraListaTiposdeRecebimentos.MarcarListaTiposdeRecebimentos(Lista: String);
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
        clbtiposderecebimentos.Checked[ind] := true;
        break;
      end
 end;

begin
 if lista<>'' then
 begin
   MarcarLista(clbtiposderecebimentos, False);
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

function TfraListaTiposdeRecebimentos.GetChequesAvulsos: Boolean;
var
 i: integer;

begin
  FChequesAvulsos := false;
  for i:=0 to clbtiposderecebimentos.Items.Count -1 do
    if (clbtiposderecebimentos.Checked[i]) and (flista[i].codigo='999')  then
    begin
      FChequesAvulsos := true;
      break;
    end;

  Result := FChequesAvulsos;

end;

end.
