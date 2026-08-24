unit dmconsultatransferencias;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, dmtecsoft, biblio;

type
  TdtmConsultaTransferencias = class(TdtmBasico)
    qryPedidosFiliais: TtecQuery;
    dsrPedidosFiliais: TtecDataSource;
    qryPedidosFiliaiscodigo: TIntegerField;
    qryPedidosFiliaisproduto: TLargeintField;
    qryPedidosFiliaisdata: TDateTimeField;
    qryPedidosFiliaishora: TTimeField;
    qryPedidosFiliaisrequisitante: TIntegerField;
    qryPedidosFiliaisrequisitada: TIntegerField;
    qryPedidosFiliaisqtdepedida: TFloatField;
    qryPedidosFiliaisqtderecebida: TFloatField;
    qryPedidosFiliaissituacao: TStringField;
    qryPedidosFiliaisobservacao: TStringField;
    qryPedidosFiliaislotetransferencia: TIntegerField;
    qryPedidosFiliaisnomefilialrequisitante: TStringField;
    qryPedidosFiliaisnomefilialrequisitada: TStringField;
    qryPedidosFiliaisprodutovisual: TStringField;
    qryPedidosFiliaisdescricaoproduto: TStringField;
    qryPedidosFiliaisfilialnota: TIntegerField;
    qryPedidosFiliaisserienota: TStringField;
    qryPedidosFiliaisnumeronota: TIntegerField;
    qryPedidosFiliaisdatanota: TDateField;
    qryPedidosFiliaisdescricaosituacao: TStringField;
    qryPedidosFiliaisvalorgrade1: TStringField;
    qryPedidosFiliaisvalorgrade2: TStringField;
    qryPedidosFiliaislinha: TStringField;
    qryPedidosFiliaiscoluna: TStringField;
    qryPedidosFiliaisdadofiscal: TIntegerField;
    qryPedidosFiliaisestoquerequisitante: TFloatField;
    qryPedidosFiliaisestoquerequisitada: TFloatField;
    qryPedidosFiliaisreservapreviarequisitada: TFloatField;
    qryPedidosFiliaiscst_produto: TStringField;
    qryPedidosFiliaiscsosn_produto: TStringField;
    qryPedidosFiliaispiscst_produto: TStringField;
    qryPedidosFiliaiscofinscst_produto: TStringField;
    qryPedidosFiliaisresultadocurvaabc: TStringField;
  private
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    FDataInicial: String;
    FDataFinal: String;
    FSituacao_A: Boolean;
    FSituacao_F: Boolean;
    FSituacao_D: Boolean;
    FSituacao_C: Boolean;
    fCurvaABC_A: Boolean;
    fCurvaABC_NaoDefinido: Boolean;
    fCurvaABC_B: Boolean;
    fCurvaABC_C: Boolean;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
    procedure SetDataInicial(const Value: String);
    procedure SetDataFinal(const Value: String);
    procedure SetSituacao_A(const Value: Boolean);
    procedure SetSituacao_C(const Value: Boolean);
    procedure SetSituacao_D(const Value: Boolean);
    procedure SetSituacao_F(const Value: Boolean);
    { Private declarations }
  protected
    procedure MontaIntervaloData;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
    property OnScrollLinhaColunaGrade : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;

    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property Situacao_A: Boolean read FSituacao_A write SetSituacao_A;
    property Situacao_F: Boolean read FSituacao_F write SetSituacao_F;
    property Situacao_D: Boolean read FSituacao_D write SetSituacao_D;
    property Situacao_C: Boolean read FSituacao_C write SetSituacao_C;

    property CurvaABC_A: Boolean read fCurvaABC_A write fCurvaABC_A;
    property CurvaABC_B: Boolean read fCurvaABC_B write fCurvaABC_B;
    property CurvaABC_C: Boolean read fCurvaABC_C write fCurvaABC_C;
    property CurvaABC_NaoDefinido: Boolean read fCurvaABC_NaoDefinido write fCurvaABC_NaoDefinido;

    function  GerarConsultaRequisicao(ListaFiliaisRequisitantes, ListaFiliaisRequisitada: String): Boolean;


  end;

var
  dtmConsultaTransferencias: TdtmConsultaTransferencias;

implementation

uses clparametrossistema;

{$R *.dfm}

{ TdtmConsultaTransferencias }

constructor TdtmConsultaTransferencias.Create(AOwner: TComponent);
begin
  inherited;
  qryPedidosFiliaisestoquerequisitante     .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisestoquerequisitada      .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisreservapreviarequisitada.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisqtdepedida              .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryPedidosFiliaisqtderecebida            .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

function TdtmConsultaTransferencias.GerarConsultaRequisicao(
  ListaFiliaisRequisitantes, ListaFiliaisRequisitada: String): Boolean;
var
 SQLFilial, SQLEstoque, SQLProdutos, SQLSituacaoProdutos, SQLCurvaABC : String;
begin
  if qryPedidosFiliais.Active then
    qryPedidosFiliais.Close;

  if ListaFiliaisRequisitantes<>'' then
    qryPedidosFiliais.macrobyname('FiliaisRequisitantes').asString := 'and pf.requisitante in ('+ListaFiliaisRequisitantes+')'
  else
    qryPedidosFiliais.macrobyname('FiliaisRequisitantes').asString := '';

  if ListaFiliaisRequisitada<>'' then
    qryPedidosFiliais.macrobyname('FiliaisRequisitadas').asString := 'and pf.requisitada in ('+ListaFiliaisRequisitada+')'
  else
    qryPedidosFiliais.macrobyname('FiliaisRequisitadas').asString := '';


  SQLCurvaABC := '';
  if CurvaABC_A then
     SQLCurvaABC := SQLCurvaABC + ' p.resultadocurvaabc = ''A''';

  if CurvaABC_B then
    if (length(SQLCurvaABC)<>0) then
      SQLCurvaABC := SQLCurvaABC + ' or  p.resultadocurvaabc = ''B'''
    else
      SQLCurvaABC := ' p.resultadocurvaabc = ''B''';

  if CurvaABC_C then
    if (length(SQLCurvaABC)<>0) then
      SQLCurvaABC := SQLCurvaABC + ' or p.resultadocurvaabc = ''C'''
    else
      SQLCurvaABC := ' p.resultadocurvaabc = ''C''';

  if CurvaABC_NaoDefinido then
    if (length(SQLCurvaABC)<>0) then
      SQLCurvaABC := SQLCurvaABC + ' or  coalesce(p.resultadocurvaabc,'''') = '''''
    else
      SQLCurvaABC := ' coalesce(p.resultadocurvaabc,'''') = ''''';

  if (length(SQLCurvaABC)<>0) then
  begin
    SQLCurvaABC := SQLCurvaABC + ')';
    Insert(' and (', SQLCurvaABC, 0)
  end;

  if (length(SQLCurvaABC)<>0) then
    qryPedidosFiliais.MacroByName('CurvaABC').AsString := SQLCurvaABC
  else
    qryPedidosFiliais.MacroByName('CurvaABC').AsString := '';

  qryPedidosFiliais.Open;

  Result:= (qryPedidosFiliais.recordcount <> 0);
  if not Result then
    qryPedidosFiliais.Close;
end;

function TdtmConsultaTransferencias.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryPedidosFiliaislinha.AsString)
end;

function TdtmConsultaTransferencias.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryPedidosFiliaiscoluna.asString)
end;

procedure TdtmConsultaTransferencias.MontaIntervaloData;
const
  Data_1: String = 'and (cast(pf.data as date) = ';
  Data_2: String = 'and (cast(pf.data as date) between (';
begin
  if not DataEmBranco(FDataInicial) then begin
    if DataEmBranco(FDataFinal) then
         qryPedidosFiliais.macrobyname('Periodo').asstring := Data_1 + '''' + FDataInicial + ''')'
    else qryPedidosFiliais.macrobyname('Periodo').asstring := Data_2 + '''' + FDataInicial + ''') and (''' + FDataFinal + '''))';
  end
  else begin
    if not DataEmBranco(FDataFinal) then
         qryPedidosFiliais.macrobyname('Periodo').asstring := Data_1 + '''' + FDataFinal + ''')'
    else qryPedidosFiliais.macrobyname('Periodo').asstring := '';
  end;
end;


procedure TdtmConsultaTransferencias.SetDataFinal(const Value: String);
begin
  if FDataFinal <> Value then
    FDataFinal:= Value;
  MontaIntervaloData;
end;

procedure TdtmConsultaTransferencias.SetDataInicial(const Value: String);
begin
  if FDataInicial <> Value then
    FDataInicial:= Value;
  MontaIntervaloData;

end;

procedure TdtmConsultaTransferencias.SetSituacao_A(const Value: Boolean);
begin
  FSituacao_A := Value;
end;

procedure TdtmConsultaTransferencias.SetSituacao_C(const Value: Boolean);
begin
  FSituacao_C := Value;
end;

procedure TdtmConsultaTransferencias.SetSituacao_D(const Value: Boolean);
begin
  FSituacao_D := Value;
end;

procedure TdtmConsultaTransferencias.SetSituacao_F(const Value: Boolean);
begin
  FSituacao_F := Value;


  qryPedidosFiliais.macrobyname('Situacao').asstring := '';
  if FSituacao_A then
    qryPedidosFiliais.macrobyname('Situacao').asstring := ' and ( pf.situacao = ''A'' ';

  if FSituacao_F then
  begin
    if qryPedidosFiliais.macrobyname('Situacao').asstring <> '' then
      qryPedidosFiliais.macrobyname('Situacao').asstring := qryPedidosFiliais.macrobyname('Situacao').asstring + ' or pf.situacao = ''F'' '
    else
      qryPedidosFiliais.macrobyname('Situacao').asstring := ' and ( pf.situacao = ''F'' ';
  end;

  if FSituacao_D then
  begin
    if qryPedidosFiliais.macrobyname('Situacao').asstring <> '' then
      qryPedidosFiliais.macrobyname('Situacao').asstring := qryPedidosFiliais.macrobyname('Situacao').asstring + ' or pf.situacao = ''D'' '
    else
      qryPedidosFiliais.macrobyname('Situacao').asstring := ' and ( pf.situacao = ''D'' ';
  end;

  if FSituacao_C then
  begin
    if qryPedidosFiliais.macrobyname('Situacao').asstring <> '' then
      qryPedidosFiliais.macrobyname('Situacao').asstring := qryPedidosFiliais.macrobyname('Situacao').asstring + ' or pf.situacao = ''C'' '
    else
      qryPedidosFiliais.macrobyname('Situacao').asstring := ' and ( pf.situacao = ''C'' ';
  end;

  if qryPedidosFiliais.macrobyname('Situacao').asstring <> '' then
    qryPedidosFiliais.macrobyname('Situacao').asstring := qryPedidosFiliais.macrobyname('Situacao').asstring + ' ) ';
end;

end.
