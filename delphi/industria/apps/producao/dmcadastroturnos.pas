unit dmcadastroTurnos;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, ctconstantes, Forms, ZTransact;

type
  TdtmCadastroTurnos = class(TdtmBasico)
    dsrTurnos: TtecDataSource;
    qryTurnos: TtecQuery;
    qryTurnoscodigo: TIntegerField;
    qryTurnosdescricao: TStringField;
    dsrTurnosIntervalos: TtecDataSource;
    qryTurnosIntervalos: TtecQuery;
    qryTurnosProximo: TtecQuery;
    qryTurnosProximocodigo: TIntegerField;
    qryTurnosIntervalosturno: TIntegerField;
    qryTurnosIntervalosintervaloinicial: TTimeField;
    qryTurnosIntervalosintervalofinal: TTimeField;
    qryTurnosIntervalosdiasemana: TIntegerField;
    qryDiaSemana: TtecQuery;
    qryDiaSemananumerodia: TIntegerField;
    qryDiaSemanadiasemana: TStringField;
    dsrDiaSemana: TtecDataSource;
    qryTurnosIntervaloslkdiasemana: TStringField;
    qryTurnosIntervalosehinicioturno: TBooleanField;
    qryTurnosIntervalosehterminoturno: TBooleanField;
    procedure qryTurnosAfterScroll(DataSet: TDataSet);
    procedure qryTurnosIntervalosNewRecord(DataSet: TDataSet);
    procedure qryTurnosIntervalosAfterPost(DataSet: TDataSet);
    procedure qryTurnosIntervalosAfterDelete(DataSet: TDataSet);
    procedure dsrTurnosIntervalosDataChange(Sender: TObject;
      Field: TField);
    procedure qryTurnosAfterInsert(DataSet: TDataSet);
  private
    FTurnosIntervalosNewRecord: TNotifyEvent;
    { Private declarations }
  protected
    function ProximoCodigo: Integer;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure ExcluirTurnos;
    procedure IncluirTurnos;
    function GravarTurnos: Boolean;
    function SalvarTurnosIntervalos(gravar: boolean): boolean;
    procedure ExcluirTurnosIntervalos;
    procedure EditarTurnos;
    procedure GravarTurnosIntervalos;
    procedure EditarTurnosIntervalos;
    property TurnosIntervalosNewRecord: TNotifyEvent
             read FTurnosIntervalosNewRecord
             write FTurnosIntervalosNewRecord;


  end;

var
  dtmCadastroTurnos: TdtmCadastroTurnos;

implementation

{$R *.dfm}

procedure TdtmCadastroTurnos.ExcluirTurnos;
begin
  if not qryTurnos.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o TURNO e INTERVALOS'])) = smbOk) then
    begin
       qryTurnos.Delete;
       Perpetrar([qryTurnos]);
    end;
end;

function TdtmCadastroTurnos.GravarTurnos: Boolean;
var
  CodigoTurnoGerado : integer;
  i: integer;

  function AtribuirCodigonoTurnoUsuario: boolean;
  begin
    result := true;
    GuardarRegistroAtual(qryTurnosIntervalos,true);
    qryTurnosIntervalos.First;
    while not qryTurnosIntervalos.Eof do
    begin
      if qryTurnosIntervalosTurno.AsInteger <> qryTurnoscodigo.AsInteger then
      begin
        qryTurnosIntervalos.Edit;
        qryTurnosIntervalosTurno.AsInteger := qryTurnoscodigo.AsInteger;
        qryTurnosIntervalos.Post;
      end;
      result := SalvarTurnosIntervalos(false);
      if not result then
        break;
      qryTurnosIntervalos.Next;
    end;
    VoltarRegistroAtual(qryTurnosIntervalos);
  end;

begin
  result := false;
  qryTurnosIntervalos.first;
  while not qryTurnosIntervalos.eof do
  begin
    if qryTurnosIntervalosintervaloinicial.isnull and
       qryTurnosIntervalosintervalofinal.isnull then
      qryTurnosIntervalos.delete
    else
      qryTurnosIntervalos.next;
  end;

  if (qryTurnos.CheckRequiredFields) then
  begin
    if SalvarTurnosIntervalos(true) then
    begin
      CodigoTurnoGerado := qryTurnoscodigo.AsInteger;
      if qryTurnos.State = dsinsert then
          qryTurnoscodigo.AsInteger := ProximoCodigo;

      if AtribuirCodigonoTurnoUsuario then
      begin
        qryTurnos.Post;
        result := Perpetrar([qryTurnos, qryTurnosIntervalos]);
        if result then
          qryTurnosAfterScroll(qryturnos);

      end;
    end;
  end;
end;

procedure TdtmCadastroTurnos.IncluirTurnos;
begin
  qryTurnos.Insert;
  qryTurnoscodigo.AsInteger := ProximoCodigo;
end;

function TdtmCadastroTurnos.ProximoCodigo: Integer;
begin
 qryTurnosProximo.Open;
 result := qryTurnosProximocodigo.AsInteger;
 qryTurnosProximo.Close;
end;

procedure TdtmCadastroTurnos.qryTurnosAfterScroll(
  DataSet: TDataSet);
var
  i: integer;
begin
  inherited;
  ReFazConsulta(qryTurnosIntervalos,[0], [qryTurnoscodigo.AsVariant]);

  if (qryTurnosIntervalos.recordcount=0) and ((qryturnos.RecordCount<>0) or (qryturnos.state = dsinsert)) then
  begin
    for i:=1 to 7 do
    begin
      qryTurnosIntervalos.append;
      qryTurnosIntervalosturno.asinteger := qryturnoscodigo.asinteger;
      qryTurnosIntervalosdiasemana.asinteger := i;
      qryTurnosIntervalos.post;
    end;
    qryTurnosIntervalos.first;
  end;  

end;

function TdtmCadastroTurnos.SalvarTurnosIntervalos(gravar: boolean): boolean;
begin
  result := true;
  if (qryTurnosIntervalos.State in [dsedit, dsinsert]) then
  begin
    if qryTurnosIntervalos.CheckRequiredFields then
    begin
      if qryTurnosIntervalosintervaloinicial.AsString >
         qryTurnosIntervalosintervalofinal.AsString then
      begin
        MensagemAviso('A hora inicial não pode ser maior que a hora final.');
        result := false;
      end
      else
        if gravar then
          qryTurnosIntervalos.Post
    end    
    else
      result := false;
  end;
end;

procedure TdtmCadastroTurnos.qryTurnosIntervalosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  if not qryTurnoscodigo.IsNull then
    qryTurnosIntervalosTurno.AsString := qryTurnoscodigo.AsString;
    
  qryTurnosIntervalosdiasemana.asinteger := 1;
  if assigned(TurnosIntervalosNewRecord) then
    TurnosIntervalosNewRecord(qryTurnosIntervalos);

  



end;

procedure TdtmCadastroTurnos.ExcluirTurnosIntervalos;
begin
  if not qryTurnosIntervalos.IsEmpty then
    if not qryTurnosIntervalos.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o intervalo deste turno'])) = smbOk) then
         qryTurnosIntervalos.Delete;
end;

procedure TdtmCadastroTurnos.EditarTurnos;
begin
  if not (qryTurnos.State in [dsedit, dsinsert]) then
    qryTurnos.Edit;
end;

constructor TdtmCadastroTurnos.Create(AOwner: TComponent);
begin
  inherited;
  qryTurnos.Tag := ctTabelas;
  qryTurnosIntervalos.Tag := ctTabelas;
  qryDiaSemana.Tag := ctTabelas;
end;

destructor TdtmCadastroTurnos.Destroy;
begin

  inherited;
end;

procedure TdtmCadastroTurnos.GravarTurnosIntervalos;
begin
  if (qryTurnosIntervalos.State in [dsedit, dsinsert]) then
     qryTurnosIntervalos.Post;
end;


procedure TdtmCadastroTurnos.EditarTurnosIntervalos;
begin
  if not (qryTurnosIntervalos.State in [dsedit, dsinsert]) then
    qryTurnosIntervalos.Edit;
end;

procedure TdtmCadastroTurnos.qryTurnosIntervalosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarTurnos;

end;

procedure TdtmCadastroTurnos.qryTurnosIntervalosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarTurnos;
end;

procedure TdtmCadastroTurnos.dsrTurnosIntervalosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryTurnosIntervalosintervaloinicial then
  begin
    if NOT qryTurnosIntervalosintervalofinal.IsNull AND
       (qryTurnosIntervalosintervaloinicial.AsString >
        qryTurnosIntervalosintervalofinal.AsString) then
    begin
      MensagemErro('A hora de início não pode ser superior a a hora de término.');
      qryTurnosIntervalosintervaloinicial.Clear;
    end;
  end
  else
  if field = qryTurnosIntervalosintervalofinal then
  begin
    if NOT qryTurnosIntervalosintervalofinal.IsNull AND
       (qryTurnosIntervalosintervaloinicial.AsString >
        qryTurnosIntervalosintervalofinal.AsString) then
    begin
      MensagemErro('A hora de término não pode ser inferior hora de início.');
      qryTurnosIntervalosintervalofinal.Clear;
    end;
  end;
end;

procedure TdtmCadastroTurnos.qryTurnosAfterInsert(DataSet: TDataSet);
var
 i: integer;
begin
  inherited;

end;

end.
