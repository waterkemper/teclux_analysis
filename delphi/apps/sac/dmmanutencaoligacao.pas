unit dmmanutencaoligacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource;

type
  TdtmManutencaoLigacao = class(TdtmBasico)
    qryManutencaoLigacao: TtecQuery;
    qryManutencaoLigacaofiltrosac: TIntegerField;
    qryManutencaoLigacaocliente: TIntegerField;
    qryManutencaoLigacaousuario: TIntegerField;
    qryManutencaoLigacaodatahora: TDateTimeField;
    qryManutencaoLigacaosituacao: TStringField;
    qryManutencaoLigacaoreligado: TIntegerField;
    qryManutencaoLigacaocontato: TIntegerField;
    qryManutencaoLigacaomarcar: TBooleanField;
    dsrManutencaoLigacao: TtecDataSource;
    qryFiltrosSAC: TtecQuery;
    qryFiltrosSACnumero: TIntegerField;
    qryFiltrosSACdescricao: TStringField;
    dsFiltrosSAC: TtecDataSource;
    qryTotaisManutencaoLigacao: TtecQuery;
    dsrTotaisManutencaoLigacao: TtecDataSource;
    qryConsultaFiltrosSAC: TtecQuery;
    qryConsultaFiltrosSACdescricao: TStringField;
    qryConsultaFiltrosSACnumero: TIntegerField;
    qryTotaisManutencaoLigacaoqtdeatendida: TIntegerField;
    qryTotaisManutencaoLigacaoqtdereligar: TIntegerField;
    qryTotaisManutencaoLigacaoqtdecancelado: TIntegerField;
    qryTotaisManutencaoLigacaoqtdediscando: TIntegerField;
    qryTotaisManutencaoLigacaoqtdeligar: TIntegerField;
    procedure qryManutencaoLigacaoAfterPost(DataSet: TDataSet);
  protected
    FReligado: String;
    FStatus: String;
    FFiltro: String;
    function GetNumeroFiltro: Integer;
    function GetTabelaConsultaFiltrosSAC: TtecQuery;
    function GetTabelaManutencaoLigacao: TtecQuery;
  public
    function  ExisteFiltrosSAC(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    procedure SubstituirStatus(Status:String);
    procedure SelecionarLigacaoMudarStatus(Todas:Boolean);
    procedure ExecutarConsultaManutencaoLigacao;
    procedure SetFiltro(const Value: String);
    procedure SetStatus(const Value: String);
    procedure SetReligado(const Value: String);

    constructor Create(AOwner: TComponent); override;
    property  Filtro: String read FFiltro write SetFiltro;
    property  Status: String read FStatus write SetStatus;
    property  Religado: String read FReligado write SetReligado;
    property  TabelaManutencaoLigacao: TtecQuery read GetTabelaManutencaoLigacao;
    property  TabelaConsultaFiltrosSAC: TtecQuery read GetTabelaConsultaFiltrosSAC;
    property  NumeroFiltro: Integer read GetNumeroFiltro;
  end;

var
  dtmManutencaoLigacao: TdtmManutencaoLigacao;

const

  //linhas complementares do SQL (ManutencaoLigacao).
  ctWhereBase   = 1;
  ctFiltro      = ctWhereBase + 1;
  ctStatus      = ctWhereBase + 2;
  ctReligado    = ctWhereBase + 3;

  //linhas complementares do SQL (TotaisManutencaoLigacao).
  ctWhereBase_1   = 5;
  ctFiltro_1      = ctWhereBase_1 + 1;

implementation

{$R *.dfm}

uses ctConstantes,
     dmtecsoft;

{ TdtmManutencaoLigacao }

constructor TdtmManutencaoLigacao.Create(AOwner: TComponent);
begin
  inherited;
  qryFiltrosSAC.Tag          := ctTabelas;
  qryManutencaoLigacao.Tag   := ctTabelaManutencaoLigacao;
  qryConsultaFiltrosSAC.Tag  := ctConsultaFiltrosSAC;
end;

procedure TdtmManutencaoLigacao.ExecutarConsultaManutencaoLigacao;
var
  a: Integer;
begin
  qryManutencaoLigacao.Active:= False;
  qryManutencaoLigacao.Active:= True;

  qryTotaisManutencaoLigacao.Active:= False;
  qryTotaisManutencaoLigacao.Active:= True;

  if not qryManutencaoLigacao.IsEmpty then begin
//    qryManutencaoLigacao.DisableControls;
    qryManutencaoLigacao.First;
    for a:= 1 to qryManutencaoLigacao.RecordCount do begin
      qryManutencaoLigacao.Edit;
      qryManutencaoLigacaoMarcar.AsBoolean:= False;
      qryManutencaoLigacao.Post;
      qryManutencaoLigacao.Next;
    end;
    qryManutencaoLigacao.First;
//    qryManutencaoLigacao.EnableControls;
  end;
end;

procedure TdtmManutencaoLigacao.SelecionarLigacaoMudarStatus(Todas: Boolean);
var
  a:Integer;
begin
  if not qryManutencaoLigacao.IsEmpty then begin
    if Todas then begin
      qryManutencaoLigacao.First;
      for a:= 1 to qryManutencaoLigacao.RecordCount do begin
        qryManutencaoLigacao.edit;
        qryManutencaoLigacaoMarcar.AsBoolean:= not qryManutencaoLigacaoMarcar.AsBoolean;
        qryManutencaoLigacao.Post;
        qryManutencaoLigacao.Next;
      end;
    end
    else begin
      qryManutencaoLigacao.edit;
      qryManutencaoLigacaoMarcar.AsBoolean:= not qryManutencaoLigacaoMarcar.AsBoolean;
      qryManutencaoLigacao.Post;
    end;
    qryManutencaoLigacao.First;
  end;
end;

procedure TdtmManutencaoLigacao.SetFiltro(const Value: String);
begin
  if FFiltro <> Value then
    FFiltro:= Value;
  if FFiltro <> '' then begin
    qryManutencaoLigacao.Sql[ctFiltro]         := 'where (filtrosac = ' + FFiltro + ')';
    qryTotaisManutencaoLigacao.Sql[ctFiltro_1] := 'where (filtrosac = ' + FFiltro + ')';
  end;
end;

procedure TdtmManutencaoLigacao.SetReligado(const Value: String);
begin
  if FReligado <> Value then
     FReligado:= Value;
  if FReligado <> '' then
       qryManutencaoLigacao.Sql[ctReligado] := 'and (Religado = ' + FReligado + ')'
  else qryManutencaoLigacao.Sql[ctReligado] := '';
end;

procedure TdtmManutencaoLigacao.SetStatus(const Value: String);
begin
  if FStatus <> Value then
    FStatus := Value;
  if FStatus <> '' then
    qryManutencaoLigacao.Sql[ctStatus] := 'and (situacao in ' + FStatus + ')';
end;

procedure TdtmManutencaoLigacao.SubstituirStatus(Status: String);
var
  a:Integer;
begin
  if not qryManutencaoLigacao.IsEmpty then begin
    qryManutencaoLigacao.First;
    for a:= 1 to qryManutencaoLigacao.RecordCount do begin
      if qryManutencaoLigacaomarcar.AsBoolean then begin
        qryManutencaoLigacao.edit;
        qryManutencaoLigacaosituacao.AsString:= Status;
        qryManutencaoLigacao.Post;
      end;
      qryManutencaoLigacao.Next;
    end;
    Perpetrar([qryManutencaoLigacao]);
    qryManutencaoLigacao.First;
  end;
end;

procedure TdtmManutencaoLigacao.qryManutencaoLigacaoAfterPost(DataSet: TDataSet);
begin
  inherited;
  Perpetrar([qryManutencaoLigacao]);
end;

function TdtmManutencaoLigacao.GetTabelaManutencaoLigacao: TtecQuery;
begin
  Result:= qryManutencaoLigacao;
end;

function TdtmManutencaoLigacao.ExisteFiltrosSAC(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiltrosSAC NomeCampo, Value);
end;

function TdtmManutencaoLigacao.GetTabelaConsultaFiltrosSAC: TtecQuery;
begin
  Result:= qryConsultaFiltrosSAC;
end;

function TdtmManutencaoLigacao.GetNumeroFiltro: Integer;
begin
  Result:= qryConsultaFiltrosSACnumero.AsInteger;
end;

end.
