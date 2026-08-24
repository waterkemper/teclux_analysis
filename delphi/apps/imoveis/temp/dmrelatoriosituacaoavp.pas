
unit dmrelatoriosituacaoavp;

interface

uses
  SysUtils, Classes, dmbasico, ctconstantes, dmtecsoft, FR_DSet,
  FR_DBSet, FR_Class, biblio, clparametrossistema, fmpreviewpadrao,
  FR_Desgn, StdCtrls, Variants, Graphics, DB, cpdatasource, cpQuery,
  ZPgSqlQuery, cpquery, ZTransact, dateutils, frxClass, frxDBSet;

type
  Tdtmrelatoriosituacaoavp = class(TdtmBasico)
    qryRelatoriosituacaoavp: TtecQuery;
    dsrRelatoriosituacaoavp: TtecDataSource;
    qryRelatoriosituacaoavpcontrato: TIntegerField;
    qryRelatoriosituacaoavpdata: TDateField;
    qryRelatoriosituacaoavpcliente: TIntegerField;
    qryRelatoriosituacaoavpsaldodevedor: TFloatField;
    qryRelatoriosituacaoavprecebimentoscurtoprazo: TFloatField;
    qryRelatoriosituacaoavprecebimentoslongoprazo: TFloatField;
    qryRelatoriosituacaoavpavpcurtoprazo: TFloatField;
    qryRelatoriosituacaoavpavplongoprazo: TFloatField;
    qryRelatoriosituacaoavpnomesituacao: TStringField;
    qryRelatoriosituacaoavpnomecliente: TStringField;
    qryRelatoriosituacaoavpempreendimento: TIntegerField;
    qryRelatoriosituacaoavpsigla: TStringField;
    frxRelatoriosituacaoavp: TfrxReport;
    frxDBRelatoriosituacaoavp_: TfrxDBDataset;
    frxDBRelatoriosituacaoavp: TfrxDBDataset;
    qryRelatoriosituacaoavpnomeempreendimento: TStringField;
    qryRelatoriosituacaoavpprecovenda: TFloatField;
    qryImoveisVendidos: TtecQuery;
    qryImoveisVendidoscontrato: TIntegerField;
    qryImoveisVendidosbloco: TIntegerField;
    qryImoveisVendidosnumero: TStringField;
    qryImoveisVendidosobservacoes: TStringField;
    qryImoveisVendidosprecovenda: TFloatField;
    qryImoveisVendidosunidade: TIntegerField;
    qryImoveisVendidosordem: TIntegerField;
    qryRelatoriosituacaoavpdescricaobloco: TStringField;
    qryRelatoriosituacaoavpnomeunidade: TStringField;
    qryRelatoriosituacaoavpnumero: TStringField;
    qryRelatoriosituacaoavpareatotal: TFloatField;
    qryImoveisVendidosdescricaobloco: TStringField;
    qryImoveisVendidosnomeunidade: TStringField;
    qryImoveisVendidosareatotal: TFloatField;
    frxDBDImoveisVendidos: TfrxDBDataset;
    qryImoveisVendidosnregistros: TLargeintField;
    qryRelatoriosituacaoavpsiglaempreendimento: TStringField;
    procedure qryRelatoriosituacaoavpBeforeOpen(DataSet: TDataSet);
    procedure frxRelatoriosituacaoavpGetValue(const VarName: String;
      var Value: Variant);
    procedure qryImoveisVendidosBeforeOpen(DataSet: TDataSet);
  private
    FCliente: Integer;
    FEmpreendimento: Integer;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FContaPagto: integer;
    fVendidos: Boolean;
    fTransferidos: Boolean;
    fRescindidos: Boolean;
    fRenegociados: Boolean;
    FDataSituacaoEm: TDateTime;
    fOrdenacao: String;
    fOrdenacaoI : Integer;
    fListaOpcao: integer;
    procedure setOrdenacao(const Value: Integer);
    procedure SetListaOpcao(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    fParametroCabecalho: String;
    property DataInicial : TDateTime read FDataInicial write FDataInicial;
    property DataFinal : TDateTime read FDataFinal write FDataFinal;
    property DataSituacaoEm : TDateTime read FDataSituacaoEm write FDataSituacaoEm;

    property Empreendimento : Integer read FEmpreendimento write FEmpreendimento;
    property Cliente : Integer read FCliente write FCliente;
    property ContaPagto : integer read FContaPagto write FContaPagto;

    property Vendidos     : Boolean read fVendidos     write fVendidos;
    property Rescindidos  : Boolean read fRescindidos  write fRescindidos;
    property Transferidos : Boolean read fTransferidos write fTransferidos;
    property Renegociados : Boolean read fRenegociados write fRenegociados;
    property Ordenacao    : Integer write setOrdenacao;
    property ListaOpcao   : integer read fListaOpcao write SetListaOpcao;

    procedure ImprimirRelatorio;
  end;

var
  dtmrelatoriosituacaoavp: Tdtmrelatoriosituacaoavp;

implementation

{$R *.dfm}

procedure Tdtmrelatoriosituacaoavp.ImprimirRelatorio;
var
  PV: TfrxComponent;
begin

  qryRelatoriosituacaoavp.Close;
  qryRelatoriosituacaoavp.Open;

  qryImoveisVendidos.close;
  qryImoveisVendidos.open;

  AtribuirParametrosBaseRelatorio;

  if FileExists(LogotipoFilialBase) then
  begin
    PV := frxRelatoriosituacaoavp.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
  end;

//  frxRelatoriosituacaoavp.DesignReport(true,true);

  frxRelatoriosituacaoavp.ShowReport(true);


end;


procedure Tdtmrelatoriosituacaoavp.qryRelatoriosituacaoavpBeforeOpen(
  DataSet: TDataSet);
var
 vListaSituacao: String;
begin
  inherited;
  qryRelatoriosituacaoavp.ParamByName('DataInicial').AsDateTime:= FDataInicial;
  qryRelatoriosituacaoavp.ParamByName('DataFinal').AsDateTime  := FDataFinal;

  qryRelatoriosituacaoavp.ParamByName('DataSituacaoEm').AsDateTime  := FDataSituacaoEm;
  qryRelatoriosituacaoavp.ParamByName('exercicio').AsInteger  := YearOf(FDataSituacaoEm);

  if FEmpreendimento > 0 then
    qryRelatoriosituacaoavp.MacroByName('WhereEmpreendimentos').AsString:= 'AND vi.empreendimento = '+IntToStr(FEmpreendimento)
  else
    qryRelatoriosituacaoavp.MacroByName('WhereEmpreendimentos').AsString:= '';

  if FCliente > 0 then
    qryRelatoriosituacaoavp.MacroByName('WhereClientes').AsString:= 'and comp.cliente = ' + inttostr(FCliente)
  else
    qryRelatoriosituacaoavp.MacroByName('WhereClientes').AsString:= '';

  vListaSituacao := '';

  if Vendidos then
    vListaSituacao := vListaSituacao + quotedstr('V')+',';

  if Rescindidos then
    vListaSituacao := vListaSituacao + quotedstr('S')+',';

  if Transferidos then
    vListaSituacao := vListaSituacao + quotedstr('F')+',';

  if Renegociados then
    vListaSituacao := vListaSituacao + quotedstr('D')+',';

  if vListaSituacao <> '' then
    delete(vListaSituacao, length(vListaSituacao), 1); 

  if vListaSituacao <> '' then
  begin
    qryRelatoriosituacaoavp.MacroByName('ListaSituacao').AsString:= 'and vi.situacao in ('+vListaSituacao+')';
    fParametroCabecalho := trim(fParametroCabecalho + ' Situação: ' + vListaSituacao);
  end
  else
    qryRelatoriosituacaoavp.MacroByName('ListaSituacao').AsString:= 'and vi.situacao in ('+'''V'',''S'',''F'',''D'''+')';

  {
    Ver com LÚCIO a questão do Quitado

  [V]endido
  Re[S]cindido

  [T]ransferido para
  trans[F]erido de

  Rene[G]ociado para
  Renegocia[D]o de

  [R]eservado
  [C]ancelado
  [Q]uitado
  }

  qryRelatoriosituacaoavp.MacroByName('Ordenacao').AsString:= fordenacao;

  qryImoveisVendidos.Params := qryRelatoriosituacaoavp.Params;
  qryImoveisVendidos.Macros := qryRelatoriosituacaoavp.Macros;


end;

procedure Tdtmrelatoriosituacaoavp.SetListaOpcao(
  const Value: integer);
begin
  fListaOpcao := Value;

  case listaopcao of
  0: qryImoveisVendidos.macrobyname('CondicaoOpcaoListar').asString  := '';
  1: qryImoveisVendidos.macrobyname('CondicaoOpcaoListar').asString  :=
    ' and (iv.contrato, iv.bloco, iv.numero, iv.unidade) in '+
    '   (select iv2.contrato, iv2.bloco, iv2.numero, iv2.unidade '+
    '    from imoveisvendidos iv2 '+
    '    where iv2.contrato = iv.contrato '+
    '    order by iv2.precovenda desc, iv2.ordem limit 1) ';

  end;

end;

procedure Tdtmrelatoriosituacaoavp.setOrdenacao(
  const Value: Integer);
begin

  fOrdenacaoI := value;
  case value of
  0: fordenacao := 'order by situacao, nomeempreendimento, contrato ';
  1: fordenacao := 'order by situacao, contrato';
  2: fordenacao := 'order by situacao, nomecliente, cliente, contrato';
  end;
end;

procedure Tdtmrelatoriosituacaoavp.frxRelatoriosituacaoavpGetValue(
  const VarName: String; var Value: Variant);
begin
  inherited;
  if VarName = 'TITULO' then
  begin
    Value := 'SITUAÇÃO DOS CONTRATOS ENTRE '+FormatDateTime('DD/MM/YYYY',FDataInicial)+
             ' E ' + FormatDateTime('DD/MM/YYYY',FDataFinal) + ' SITUAÇÃO EM ' + FormatDateTime('DD/MM/YYYY',DataSituacaoEm);
  end
  else
  if VarName = 'SUBTITULO' then
  begin
    Value := fparametrocabecalho
  end
  else
  if VarName = 'Ordenacao' then
    Value :=  fOrdenacaoI
  else if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio)
  else if VarName = 'RAZAOFILIALBASE' then
    Value := RazaoFilialBase
  else if VarName = 'ENDERECO_BAIRRO' then
    Value :=  RuaFilialBase+ ' - '+BairroFilialBase
  else if VarName = 'CEP_CIDADE_UF' then
    Value :=  FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase

end;

procedure Tdtmrelatoriosituacaoavp.qryImoveisVendidosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryImoveisVendidos.ParamByName('ListaOpcao').asinteger := ListaOpcao;
end;

end.
