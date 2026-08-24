unit dmLiberacaoMaquinas;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmtecsoft, ctconstantes;

type
  TdtmLiberacaoMaquinas = class(TdtmBasico)
    dsrMaquinasBloqueadas: TtecDataSource;
    qryMaquinasBloqueadas: TtecQuery;
    qryMaquinasBloqueadasmaquina: TIntegerField;
    qryMaquinasBloqueadasdescricaomaquina: TStringField;
    qryMaquinasBloqueadasosp: TIntegerField;
    qryMaquinasBloqueadasusuario: TIntegerField;
    qryMaquinasBloqueadasnomeusuario: TStringField;
    qryMaquinasBloqueadasdata: TDateField;
    qryMaquinasBloqueadasinicio: TTimeField;
    qryMaquinasBloqueadasdatatermino: TDateField;
    qryMaquinasBloqueadastermino: TTimeField;
    qryMaquinasBloqueadasinicioparada: TDateTimeField;
    qryMaquinasBloqueadascodigoparada: TIntegerField;
    qryMaquinasBloqueadasdescricaoparada: TStringField;
    qryMaquinasBloqueadasliberar: TBooleanField;
    qryMaquinasBloqueadasfimparada: TDateTimeField;
    qryUpdatesMaquinasBloqueadas: TtecQuery;
    qryMaquinasBloqueadaslote: TIntegerField;
    qryMaquinasBloqueadasc01: TStringField;
    qryMaquinasBloqueadasc02: TStringField;
    qryMaquinasBloqueadasc03: TStringField;
    qryMaquinasBloqueadasnomeoperacao: TStringField;
    qryMaquinasBloqueadasoperacao: TIntegerField;
    procedure dsrMaquinasBloqueadasDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure AbrirMaquinasBloqueadas;
    procedure GravarLiberacaoMaquinas;
  end;

var
  dtmLiberacaoMaquinas: TdtmLiberacaoMaquinas;

implementation

{$R *.dfm}

{ TdtmLiberacaoMaquinas }

procedure TdtmLiberacaoMaquinas.AbrirMaquinasBloqueadas;
begin
  qryMaquinasBloqueadas.close;
  qryMaquinasBloqueadas.Open;
end;

constructor TdtmLiberacaoMaquinas.Create(AOwner: TComponent);
begin
  inherited;
  qryMaquinasBloqueadas.Tag := ctTabelas;
end;

destructor TdtmLiberacaoMaquinas.Destroy;
begin

  inherited;
end;

procedure TdtmLiberacaoMaquinas.MarcarSelecionados(Marcando,
  Todos: Boolean);
begin
  MarcarRegistros(qryMaquinasBloqueadas,qryMaquinasBloqueadasliberar,marcando,Todos);
end;

procedure TdtmLiberacaoMaquinas.dsrMaquinasBloqueadasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryMaquinasBloqueadasliberar then
  begin
    if field.asboolean then
      qryMaquinasBloqueadasfimparada.AsDateTime := now
    else
      qryMaquinasBloqueadasfimparada.clear;
  end;
end;

procedure TdtmLiberacaoMaquinas.GravarLiberacaoMaquinas;
var
  i: integer;
begin

  GuardarRegistroAtual(qryMaquinasBloqueadas, true);
  while not qryMaquinasBloqueadas.Eof do
  begin
    if qryMaquinasBloqueadasliberar.AsBoolean then
    begin
      for i:=0 to qryUpdatesMaquinasBloqueadas.ParamCount - 1 do
      begin
        if qryUpdatesMaquinasBloqueadas.Params[i].name = 'inicio' then
          qryUpdatesMaquinasBloqueadas.Params[i].asstring := FormatDateTime('HH:MM:SS',qryMaquinasBloqueadas.fieldbyname(qryUpdatesMaquinasBloqueadas.Params[i].name).asdatetime)
        else
          qryUpdatesMaquinasBloqueadas.Params[i].Value := qryMaquinasBloqueadas.fieldbyname(qryUpdatesMaquinasBloqueadas.Params[i].name).Value;
      end;
      qryUpdatesMaquinasBloqueadas.ExecSql;
    end;
    qryMaquinasBloqueadas.Next;
  end;
  VoltarRegistroAtual(qryMaquinasBloqueadas);

  perpetrar([]);
  
end;

end.
