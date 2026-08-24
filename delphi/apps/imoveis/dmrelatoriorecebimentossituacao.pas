unit dmrelatoriorecebimentossituacao;

interface

uses
  SysUtils, Classes, dmbasico, ctconstantes, dmtecsoft, FR_DSet,
  FR_DBSet, FR_Class, biblio, clparametrossistema, fmpreviewpadrao,
  FR_Desgn, StdCtrls, Variants, Graphics, DB, cpdatasource, cpQuery,
  ZPgSqlQuery, cpquery, ZTransact, dateutils, frxClass, frxDBSet, ZQuery;

type
  TdtmrelatorioContratosSituacao = class(TdtmBasico)
    qryRelatorioContratosSituacao: TtecQuery;
    dsrRelatorioContratosSituacao: TtecDataSource;
    qryRelatorioContratosSituacaocontrato: TIntegerField;
    qryRelatorioContratosSituacaodata: TDateField;
    qryRelatorioContratosSituacaocliente: TIntegerField;
    qryRelatorioContratosSituacaosaldodevedor: TFloatField;
    qryRelatorioContratosSituacaorecebimentoscurtoprazo: TFloatField;
    qryRelatorioContratosSituacaorecebimentoslongoprazo: TFloatField;
    qryRelatorioContratosSituacaoavpcurtoprazo: TFloatField;
    qryRelatorioContratosSituacaoavplongoprazo: TFloatField;
    qryRelatorioContratosSituacaonomesituacao: TStringField;
    qryRelatorioContratosSituacaonomecliente: TStringField;
    qryRelatorioContratosSituacaoempreendimento: TIntegerField;
    qryRelatorioContratosSituacaosigla: TStringField;
    frxRelatorioContratosSituacao: TfrxReport;
    frxDBRelatorioContratosSituacao_: TfrxDBDataset;
    frxDBRelatorioContratosSituacao: TfrxDBDataset;
    qryRelatorioContratosSituacaonomeempreendimento: TStringField;
    qryRelatorioContratosSituacaoprecovenda: TFloatField;
    qryImoveisVendidos: TtecQuery;
    qryImoveisVendidoscontrato: TIntegerField;
    qryImoveisVendidosbloco: TIntegerField;
    qryImoveisVendidosnumero: TStringField;
    qryImoveisVendidosobservacoes: TStringField;
    qryImoveisVendidosprecovenda: TFloatField;
    qryImoveisVendidosunidade: TIntegerField;
    qryImoveisVendidosordem: TIntegerField;
    qryRelatorioContratosSituacaodescricaobloco: TStringField;
    qryRelatorioContratosSituacaonomeunidade: TStringField;
    qryRelatorioContratosSituacaonumero: TStringField;
    qryRelatorioContratosSituacaoareatotal: TFloatField;
    qryImoveisVendidosdescricaobloco: TStringField;
    qryImoveisVendidosnomeunidade: TStringField;
    qryImoveisVendidosareatotal: TFloatField;
    frxDBDImoveisVendidos: TfrxDBDataset;
    procedure qryRelatorioContratosSituacaoBeforeOpen(DataSet: TDataSet);
    procedure frxRelatorioContratosSituacaoGetValue(const VarName: String;
      var Value: Variant);
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
    fListaOpcao: integer;
    procedure setOrdenacao(const Value: Integer);
    procedure SetListaOpcao(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
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
  dtmrelatorioContratosSituacao: TdtmrelatorioContratosSituacao;

implementation

{$R *.dfm}

procedure TdtmrelatorioContratosSituacao.ImprimirRelatorio;
var
  PV: TfrxComponent;
begin

  qryRelatorioContratosSituacao.Close;
  qryRelatorioContratosSituacao.Open;
  
  AtribuirParametrosBaseRelatorio;
  frVariables['Titulo']:= 'SITUAÇÃO DOS CONTRATOS  ENTRE '+FormatDateTime('DD/MM/YYYY',FDataInicial)+
                          ' E ' + FormatDateTime('DD/MM/YYYY',FDataFinal) + ' SITUAÇÃO EM ' + FormatDateTime('DD/MM/YYYY',DataSituacaoEm);

  if FileExists(LogotipoFilialBase) then
  begin
    PV := frxRelatorioContratosSituacao.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
  end;

//  frxRelatorioContratosSituacao.DesignReport(true,true);

  frxRelatorioContratosSituacao.ShowReport(true);


end;


procedure TdtmrelatorioContratosSituacao.qryRelatorioContratosSituacaoBeforeOpen(
  DataSet: TDataSet);
var
 vListaSituacao: String;
begin
  inherited;
  qryRelatorioContratosSituacao.ParamByName('DataInicial').AsDateTime:= FDataInicial;
  qryRelatorioContratosSituacao.ParamByName('DataFinal').AsDateTime  := FDataFinal;

  qryRelatorioContratosSituacao.ParamByName('DataSituacaoEm').AsDateTime  := FDataSituacaoEm;
  qryRelatorioContratosSituacao.ParamByName('exercicio').AsInteger  := YearOf(FDataSituacaoEm);

  if FEmpreendimento > 0 then
    qryRelatorioContratosSituacao.MacroByName('WhereEmpreendimentos').AsString:= 'AND vi.empreendimento = '+IntToStr(FEmpreendimento)
  else
    qryRelatorioContratosSituacao.MacroByName('WhereEmpreendimentos').AsString:= '';

  if FCliente > 0 then
    qryRelatorioContratosSituacao.MacroByName('WhereClientes').AsString:= 'and comp.cliente = ' + inttostr(FCliente)
  else
    qryRelatorioContratosSituacao.MacroByName('WhereClientes').AsString:= '';

  vListaSituacao := '';

  if Vendidos then
    vListaSituacao := vListaSituacao + quotedstr('V');

  if Rescindidos then
    vListaSituacao := vListaSituacao + quotedstr('S');

  if Transferidos then
    vListaSituacao := vListaSituacao + quotedstr('F');

  if Renegociados then
    vListaSituacao := vListaSituacao + quotedstr('D');

  if vListaSituacao <> '' then
    qryRelatorioContratosSituacao.MacroByName('ListaSituacao').AsString:= 'and vi.situacao in ('+vListaSituacao+')'
  else
    qryRelatorioContratosSituacao.MacroByName('ListaSituacao').AsString:= 'and vi.situacao in ('+'''V'',''S'',''F'',''D'''+')';

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

  qryRelatorioContratosSituacao.MacroByName('Ordenacao').AsString:= fordenacao;

  qryImoveisVendidos.Params := qryRelatorioContratosSituacao.Params;
  qryImoveisVendidos.Macros := qryRelatorioContratosSituacao.Macros;

  qryImoveisVendidos.open;

end;

procedure TdtmrelatorioContratosSituacao.SetListaOpcao(
  const Value: integer);
begin
  fListaOpcao := Value;

  case listaopcao of
  0: frxDBDImoveisVendidos.RangeEnd := reLast;
  1: frxDBDImoveisVendidos.RangeEnd := reCurrent;
  end;

end;

procedure TdtmrelatorioContratosSituacao.setOrdenacao(
  const Value: Integer);
begin
  case value of
  0: fordenacao := 'order by vi.situacao, em.nome, vi.contrato ';
  1: fordenacao := 'order by vi.situacao, vi.contrato';
  2: fordenacao := 'order by vi.situacao, vf.nome, comp.cliente, vi.contrato';
  end;
end;

procedure TdtmrelatorioContratosSituacao.frxRelatorioContratosSituacaoGetValue(
  const VarName: String; var Value: Variant);
begin
  inherited;
  if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio)
  else if VarName = 'RAZAOFILIALBASE' then
    Value := RazaoFilialBase
  else if VarName = 'ENDERECO_BAIRRO' then
    Value :=  RuaFilialBase+ ' - '+BairroFilialBase
  else if VarName = 'CEP_CIDADE_UF' then
    Value :=  FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase

end;

end.
