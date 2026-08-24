unit dmOperacoesPorcelana;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmtecsoft, ctconstantes, biblio;

type
  TdtmOperacoesPorcelana = class(TdtmBasico)
    dsrOperacoes: TtecDataSource;
    qryOperacoes: TtecQuery;
    qryOperacoescodigo: TIntegerField;
    qryOperacoesnome: TStringField;
    qryOperacoesc01: TStringField;
    qryOperacoesc02: TStringField;
    qryOperacoesc03: TStringField;
    qryOperacoesdescricao: TStringField;
    qryConsultaOperacoesOSPUsuarios: TtecQuery;
    dsrConsultaOperacoesOSPUsuarios: TtecDataSource;
    qryConsultaOperacoesOSPUsuariososp: TIntegerField;
    qryConsultaOperacoesOSPUsuarioslote: TIntegerField;
    qryConsultaOperacoesOSPUsuariosok: TBooleanField;
    qryConsultaOperacoesOSPUsuariosquantidade: TIntegerField;
    qryConsultaOperacoesOSPUsuariosquantidadeoriginal: TIntegerField;
    qryOperacoesOSPUsuario: TtecQuery;
    qryOperacoesOSPUsuarioosp: TIntegerField;
    qryOperacoesOSPUsuariolote: TIntegerField;
    qryOperacoesOSPUsuariooperacao: TIntegerField;
    qryOperacoesOSPUsuariousuario: TIntegerField;
    qryOperacoesOSPUsuariodata: TDateField;
    qryOperacoesOSPUsuarioinicio: TTimeField;
    qryOperacoesOSPUsuariotermino: TTimeField;
    qryOperacoesOSPUsuarioquantidade: TIntegerField;
    qryOperacoesOSPUsuarioturno: TIntegerField;
    qryOperacoesOSPUsuariodatatermino: TDateField;
    qryOperacoesOSPUsuariousuariotermino: TIntegerField;
    qryOperacoesOSPUsuariomaquina: TIntegerField;
    qryOperacoesmaquina: TIntegerField;
    qryConsultaOperacoesOSPUsuariosdataterminoultimaoperacao: TDateField;
    qryConsultaOperacoesOSPUsuariosterminoultimaoperacao: TTimeField;
    procedure qryOperacoesAfterScroll(DataSet: TDataSet);
    procedure qryConsultaOperacoesOSPUsuariosAfterInsert(DataSet: TDataSet);
    procedure dsrConsultaOperacoesOSPUsuariosDataChange(Sender: TObject;
      Field: TField);
  private
    FMarcados: integer;
    FOperacoesAfterScroll: TNotifyEvent;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    function ExisteondicaoParaGravar(Operador: String): boolean;
    property Marcados: integer read FMarcados write fMarcados;
    function GravarOperacoesPorcelana(operador, turno: integer): boolean;
    property OperacoesAfterScroll : TNotifyEvent read FOperacoesAfterScroll write FOperacoesAfterScroll;

  end;

var
  dtmOperacoesPorcelana: TdtmOperacoesPorcelana;

implementation

uses DateUtils;

{$R *.dfm}

{ TdtmOperacoesPorcelana }

constructor TdtmOperacoesPorcelana.Create(AOwner: TComponent);
begin
  inherited;
  qryOperacoes.tag := ctTabelas;
end;

destructor TdtmOperacoesPorcelana.Destroy;
begin
  inherited;
  if assigned(dtmOperacoesPorcelana) then
    dtmOperacoesPorcelana := nil;

end;

procedure TdtmOperacoesPorcelana.qryOperacoesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  Marcados := 0;
  RefazConsultaPorNome(qryConsultaOperacoesOSPUsuarios,['operacao'],[qryOperacoescodigo.AsInteger]);
  if assigned(OperacoesAfterScroll) then
    OperacoesAfterScroll(qryOperacoes);  
end;

procedure TdtmOperacoesPorcelana.qryConsultaOperacoesOSPUsuariosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaOperacoesOSPUsuarios.Cancel;
end;

procedure TdtmOperacoesPorcelana.dsrConsultaOperacoesOSPUsuariosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryConsultaOperacoesOSPUsuariosquantidade then
  begin
    if field.asinteger > qryConsultaOperacoesOSPUsuariosquantidadeoriginal.AsInteger then
    begin
      MensagemErro(format('A Quantidade não pode ultrapassar a %s unidades.',[qryConsultaOperacoesOSPUsuariosquantidadeoriginal.AsString]));
      field.asinteger := qryConsultaOperacoesOSPUsuariosquantidadeoriginal.AsInteger;
    end
    else
    if field.asinteger = 0 then
    begin
      MensagemErro('A Quantidade não foi informada');
      field.asinteger := qryConsultaOperacoesOSPUsuariosquantidadeoriginal.AsInteger;
    end;
  end
  else
  if field = qryConsultaOperacoesOSPUsuariosok then
  begin
    if field.AsBoolean then
      inc(fMarcados)
    else
      dec(fMarcados);
  end;
end;

function TdtmOperacoesPorcelana.ExisteondicaoParaGravar(Operador: String): boolean;
begin
  result := Operador <> '';
  if result then
  begin
    result := marcados <> 0;
  end;
end;

function TdtmOperacoesPorcelana.GravarOperacoesPorcelana(operador, turno: integer): boolean;
begin
  qryOperacoesOSPUsuario.Open;
  GuardarRegistroAtual(qryConsultaOperacoesOSPUsuarios, true);
  qryConsultaOperacoesOSPUsuarios.first;

  while not qryConsultaOperacoesOSPUsuarios.Eof do
  begin
    if qryConsultaOperacoesOSPUsuariosok.AsBoolean then
    begin
      qryOperacoesOSPUsuario.Append;

      qryOperacoesOSPUsuarioosp.asinteger := qryConsultaOperacoesOSPUsuariososp.AsInteger;
      qryOperacoesOSPUsuariolote.AsInteger := qryConsultaOperacoesOSPUsuarioslote.AsInteger;
      qryOperacoesOSPUsuariooperacao.AsInteger := qryOperacoescodigo.AsInteger;
      qryOperacoesOSPUsuariousuario.AsInteger :=  operador;
      if qryoperacoescodigo.AsInteger = 181 then
      begin
        qryOperacoesOSPUsuariodata.asdatetime :=  qryConsultaOperacoesOSPUsuariosdataterminoultimaoperacao.AsDateTime;
        qryOperacoesOSPUsuarioinicio.AsDateTime := strtoDateTime(FormatDateTime('HH:MM',qryConsultaOperacoesOSPUsuariosterminoultimaoperacao.AsDateTime));
      end
      else
      begin
        qryOperacoesOSPUsuariodata.asdatetime :=  DataServidor;
        qryOperacoesOSPUsuarioinicio.AsDateTime := strtoDateTime(FormatDateTime('HH:MM',HoraServidor));
      end;
      qryOperacoesOSPUsuariotermino.asdatetime :=  IncMinute(qryOperacoesOSPUsuarioinicio.AsDateTime);
      qryOperacoesOSPUsuarioquantidade.asinteger := qryConsultaOperacoesOSPUsuariosquantidade.AsInteger;
      qryOperacoesOSPUsuarioturno.asinteger := turno;
      qryOperacoesOSPUsuariodatatermino.asdatetime :=  DataServidor;
      qryOperacoesOSPUsuariousuariotermino.AsInteger :=  operador;

      if qryOperacoesmaquina.AsInteger <> 0 then
        qryOperacoesOSPUsuariomaquina.AsInteger := qryOperacoesmaquina.AsInteger;
      qryOperacoesOSPUsuario.post;
    end;

    qryConsultaOperacoesOSPUsuarios.next

  end;

  VoltarRegistroAtual(qryConsultaOperacoesOSPUsuarios);
  result := perpetrar([qryOperacoesOSPUsuario]);
  qryOperacoesOSPUsuario.Close;

  qryOperacoesAfterScroll(qryoperacoes);

end;

end.
