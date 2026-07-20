unit dmlogprodutos;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  cpdatasource, FR_DSet, FR_DBSet, FR_Class, ctconstantes, biblio,Graphics,
  clparametrossistema, QGraphics,
  fmpreviewpadrao, FR_Desgn, ZTransact;

type
  TdtmLogProdutos = class(TdtmBasico)
    qryLogs: TtecQuery;
    qryLogscaracteristica: TLargeintField;
    qryLogsdescricao: TStringField;
    qryLogsoperacao: TMemoField;
    qryLogst: TStringField;
    qryLogsdata: TMemoField;
    qryLogsusuario: TStringField;
    qryLogsonde: TMemoField;
    dsrLogs: TtecDataSource;
    frpImprimirLog: TfrReport;
    fdbImprimirLog: TfrDBDataSet;
    procedure frpImprimirLogBeforePrint(Memo: TStringList; View: TfrView);
  private

    FDataInicial: String;
    FDataFinal: String;
    FParametroCabecalho: String;
    FInserido: Boolean;
    FApagado: Boolean;
    FAtualizado: Boolean;
    procedure SetDataFinal(const Value: String);
    procedure MontaDatas;


    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    property DataInicial: String read FDataInicial write FDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;


    property Inserido: Boolean read FInserido write FInserido;
    property Atualizado: Boolean read FAtualizado write FAtualizado;
    property Apagado: Boolean read FApagado write FApagado;
    procedure MontaQueryLog(ItemProduto: String;Produto: String);

  end;

var
  dtmLogProdutos: TdtmLogProdutos;

implementation

{$R *.dfm}

{ TdtmLogProdutos }


constructor TdtmLogProdutos.Create(AOwner: TComponent);
begin
  inherited;
end;


procedure TdtmLogProdutos.SetDataFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
  begin
    FDataFinal := Value;
    if FDataInicial='' then
      FDataInicial:=FDataFinal;
  end
  else FDataFinal := FDataInicial;
  MontaDatas;
end;

procedure TdtmLogProdutos.MontaDatas;
begin
  FParametroCabecalho := FParametroCabecalho+' Entre: '+FDataInicial+' e '+FDataFinal;
end;



procedure TdtmLogProdutos.MontaQueryLog(ItemProduto: String;Produto: String);
var
sql,operacao:String;
Relatorio: TfrReport;
frmPreview: TfrmPreviewPadrao;
begin
    if not (Produto = '') then
     qryLogs.MacroByName('WHEREPRODUTO').Asstring:=' AND caracteristica = '+Produto;

    if not (ItemProduto = '') then
     qryLogs.MacroByName('WHEREITEMPRODUTO').Asstring:=' AND caracteristica = (SELECT caracteristica from produtos where codigo='+ItemProduto+')';

    qryLogs.MacroByName('WHEREPERIODO').AsString := ' AND cast(trigger_changed as date) BETWEEN '''+FDataInicial+ ''' AND '''+FDataFinal +'''';

    //FILTRO POR OPERAÇÕES
    operacao:='';
    sql:='';
    if (FInserido) then
      operacao:= '''INSERT''';
    if (FAtualizado) then
    begin
      if FInserido then
        operacao:=operacao + ',''UPDATE'''
      else
        operacao:='''UPDATE''';
    end;

    if (FApagado) then
    begin
      if (FInserido or FAtualizado) then
        SQL:= 'AND ((trigger_tuple=''NEW'' AND trigger_mode IN ('+operacao+')) OR trigger_mode IN (''DELETE''))'
      else
       SQL:= 'AND trigger_mode IN (''DELETE'')';
    end
    else
      if (FInserido or FApagado) then
        SQL:='AND (trigger_tuple=''NEW'' AND trigger_mode IN ('+operacao+')';
    qryLogs.MacroByName('WHEREOPERACAO').AsString:= SQL;

    ReFazConsulta(qryLogs,[],[]);

    frVariables['Titulo']:= 'LOG DE PRODUTOS';
//    frpImprimirLog.DesignReport;
    frmPreview := TfrmPreviewPadrao.create(self);
  try
    Relatorio := frmPreview.frCompositeReport;
    frmPreview.frCompositeReport.Reports.Clear;
    frmPreview.frCompositeReport.Reports.Add(frpImprimirLog);
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free;
  end;
end;


procedure TdtmLogProdutos.frpImprimirLogBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
  begin
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
  end
  else
  if TColorRef(strtoint(parsistema.CorZebradoRelatorio))<>TColorRef(clnone) then
   if (View.Name = 'mmoZebrado') then
    if (frpImprimirLog.Dictionary.Variables.Variable['LINHA'] MOD 2)=0 then
      frpImprimirLog.FindObject('mmoZebrado').FillColor := TColorRef(strtoint(parsistema.CorZebradoRelatorio))
    else
      frpImprimirLog.FindObject('mmoZebrado').FillColor := clnone;
end;

end.
