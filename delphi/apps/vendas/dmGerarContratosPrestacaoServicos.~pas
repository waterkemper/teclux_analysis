unit dmGerarContratosPrestacaoServicos;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmtecsoft, biblio;

type
  TdtmGerarContratosPrestacaoServicos = class(TdtmBasico)
    qryContratosManutencao: TtecQuery;
    dsrContratosManutencao: TtecDataSource;
    qryContratosManutencaonumero: TIntegerField;
    qryContratosManutencaocliente: TIntegerField;
    qryContratosManutencaotipocliente: TStringField;
    qryContratosManutencaodiavencimento: TIntegerField;
    qryContratosManutencaoassinatura: TDateField;
    qryContratosManutencaovigencia: TDateField;
    qryContratosManutencaovalor: TFloatField;
    qryContratosManutencaoobservacoesnf: TStringField;
    qryContratosManutencaonomecliente: TStringField;
    qryContratosManutencaosituacaocontrato: TStringField;
    qryContratosManutencaocontrato: TStringField;
    qryContratosManutencaomarcar: TBooleanField;
    qryContratosManutencaodesconsiderar: TBooleanField;
    qryContratosManutencaodatavencto: TDateField;
    qryContratosManutencaodata_: TDateField;
    qryContratosManutencaodataentrega: TDateField;
    qryContratosManutencaodiavencimento_: TIntegerField;
    qryContratosManutencaodatavenctoparcela: TDateField;
    qryContratosManutencaonumeroparcela: TIntegerField;
    qryContratosManutencaovalorvenctoparcela: TCurrencyField;
    qryContratosManutencaovalorvencto: TCurrencyField;
    qryContratosManutencaonumeroparcelacontrato: TIntegerField;
    qryContratosManutencaodatapagtoparcela: TDateField;
    qryContratosManutencaovalorpagtoparcela: TCurrencyField;
    qryAtualizarParcelasContratosManutencao: TtecQuery;
    qryGerarContratoporContratodeManutencao: TtecQuery;
    qryContratosManutencaocontratomanutencao: TIntegerField;
    procedure dsrContratosManutencaoDataChange(Sender: TObject;
      Field: TField);
    procedure qryContratosManutencaoCalcFields(DataSet: TDataSet);
  private
    function GetQtdeContratos: Integer;
    function GetTotalContratos: Real;
    { Private declarations }
  public
    { Public declarations }
    function gerarConsultacontratosServicos(dataInicialPeriodo, DataFinalPeriodo, ListaSelecionadaClientes: String; OpcaoDaSelecao: Integer): boolean;
    property QtdeContratos: Integer read GetQtdeContratos;
    property TotalContratos: Real read GetTotalContratos;
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure gerarcontratoporcontratodemanutencao;

  end;

var
  dtmGerarContratosPrestacaoServicos: TdtmGerarContratosPrestacaoServicos;

implementation

{$R *.dfm}

{ TdtmGerarContratosPrestacaoServicos }

function TdtmGerarContratosPrestacaoServicos.gerarConsultacontratosServicos(
  dataInicialPeriodo, DataFinalPeriodo,
  ListaSelecionadaClientes: String;
  OpcaoDaSelecao: Integer): boolean;
begin
//  qryContratosManutencao.ParamByName('diaInicial').AsInteger := strtoint(diaInicialPeriodo);
//  qryContratosManutencao.ParamByName('diaFinal').AsInteger := strtoint(FormatDateTime('dd', strtodate(DataFinalPeriodo)));

  qryContratosManutencao.ParamByName('datafinal').AsDateTime := strtodate(DataFinalPeriodo);
  qryContratosManutencao.ParamByName('datainicial').AsDateTime := strtodate(dataInicialPeriodo);
  qryContratosManutencao.ParamByName('OpcaoDaSelecao').asInteger := OpcaoDaSelecao;

  if ListaSelecionadaClientes<>'' then
    qryContratosManutencao.macrobyname('ListaClientes').AsString := quotedstr(trocar(trocar(ListaSelecionadaClientes, '),(', '), ('),'''',''))
  else
    qryContratosManutencao.macrobyname('ListaClientes').AsString := '''''' ;


  qryContratosManutencao.close;
  qryContratosManutencao.open;

  result := not qryContratosManutencao.isempty;

end;

procedure TdtmGerarContratosPrestacaoServicos.dsrContratosManutencaoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  {
  if field = qryContratosManutencaomarcar then
  begin

    if not ((qryContratosManutencaosituacaocontrato.AsString='A FATURAR') or
            (qryContratosManutencaosituacaocontrato.AsString='FATURADO')) then
      field.asboolean := false;

  end;
  }
end;

function TdtmGerarContratosPrestacaoServicos.GetQtdeContratos: Integer;
begin
  Result:= qryContratosManutencao.RecordCount;
end;

function TdtmGerarContratosPrestacaoServicos.GetTotalContratos: Real;
begin
  Result:= TotalizarValores[qryContratosManutencao, qryContratosManutencaovalor, nil];
end;

procedure TdtmGerarContratosPrestacaoServicos.MarcarSelecionados(Marcando,
  Todos: Boolean);
begin
  MarcarRegistros(qryContratosManutencao,
                  qryContratosManutencaomarcar,
                  qryContratosManutencaovalor,
                  Marcando,
                  Todos);
end;

procedure TdtmGerarContratosPrestacaoServicos.qryContratosManutencaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryContratosManutencaodesconsiderar.AsBoolean := not qryContratosManutencaomarcar.AsBoolean;
end;

procedure TdtmGerarContratosPrestacaoServicos.gerarcontratoporcontratodemanutencao;
var
  vLista: TSTringList;
  vListaParcela: TSTringList;
  i : integer;
begin
  try
    vLista := TSTringList.create;
    vLista.Delimiter := ',';
    vListaParcela := TSTringList.create;

    vLista := RetornarListaTString(qryContratosManutencao, qryContratosManutencaonumero, qryContratosManutencaomarcar, false);
    vListaParcela := RetornarListaTString(qryContratosManutencao, qryContratosManutencaonumeroparcela, qryContratosManutencaomarcar, false);

    qryAtualizarParcelasContratosManutencao.paramByName('datainicial').asDateTime := qryContratosManutencao.parambyname('datainicial').asDateTime;
    qryAtualizarParcelasContratosManutencao.paramByName('datafinal').asDateTime := qryContratosManutencao.parambyname('datafinal').asDateTime;
    qryAtualizarParcelasContratosManutencao.macrobyname('contratomanutencao').asString := QuotedStr(trocar(vLista.DelimitedText,',',', '));
    qryAtualizarParcelasContratosManutencao.execSql;
    perpetrar([qryAtualizarParcelasContratosManutencao]);


    for i:=0 to vLIsta.count-1 do
    begin
      qryGerarContratoporContratodeManutencao.parambyname('contratoManutencao').asinteger := strtoint(vLista[i]);
      qryGerarContratoporContratodeManutencao.parambyname('parcelacontratomanutencao').asinteger := strtoint(vListaParcela[i]);
      qryGerarContratoporContratodeManutencao.execSQL;
      perpetrar([]);
    end;
  finally
    vLista.free;
    vListaParcela.free;
  end;






end;

end.
