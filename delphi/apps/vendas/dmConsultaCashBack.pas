unit dmConsultaCashBack;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft;

type
  TdtmConsultaCashBack = class(TdtmBasico)
    qryConsultaCashBack: TtecQuery;
    dsrConsultaCashBack: TtecDataSource;
    qryConsultaCashBackdata_hora: TDateTimeField;
    qryConsultaCashBackcliente: TIntegerField;
    qryConsultaCashBacktipo_cliente: TStringField;
    qryConsultaCashBacknomecliente: TStringField;
    qryConsultaCashBackcontrato: TStringField;
    qryConsultaCashBackfilialvenda: TIntegerField;
    qryConsultaCashBackcashback: TIntegerField;
    qryConsultaCashBackdescricaocashback: TStringField;
    qryConsultaCashBackvalidade: TDateTimeField;
    qryConsultaCashBackjson_prod: TStringField;
    qryConsultaCashBackvalorcb: TFloatField;
    qryConsultaCashBackvalorcb_dev: TFloatField;
    qryConsultaCashBackvalorcb_apro: TFloatField;
    qryConsultaCashBackvalorcb_apro_canc: TFloatField;
    qryConsultaCashBack_Det: TtecQuery;
    dsrConsultaCashBack_Det: TtecDataSource;
    qryConsultaCashBack_Detprodutovisual: TStringField;
    qryConsultaCashBack_Detdescricaoproduto: TStringField;
    qryConsultaCashBack_Detquantidade: TFloatField;
    qryConsultaCashBack_Detvalor: TFloatField;
    qryConsultaCashBackreg: TLargeintField;
    qryConsultaCashBack_Detcashback: TIntegerField;
    qryConsultaCashBack_Detvalidade: TDateTimeField;
    qryConsultaCashBack_Detstatus: TStringField;
    qryConsultaCashBack_Detdescricaocashback: TStringField;
    qryConsultaCashBacktotal: TFloatField;
    qryConsultaCashBack_porProdutos: TtecQuery;
    dsrConsultaCashBack_porProdutos: TtecDataSource;
    qryConsultaCashBack_porProdutosprodutovisual: TStringField;
    qryConsultaCashBack_porProdutosdescricaoproduto: TStringField;
    qryConsultaCashBack_porProdutosvalorcb: TFloatField;
    qryConsultaCashBack_porProdutosvalorcb_dev: TFloatField;
    qryConsultaCashBack_porProdutosvalorcb_apro: TFloatField;
    qryConsultaCashBack_porProdutosvalorcb_apro_canc: TFloatField;
    qryConsultaCashBack_porProdutosjson_prod: TStringField;
    qryConsultaCashBack_porProdutostotal: TFloatField;
    qryConsultaCashBack_DetProd: TtecQuery;
    dsrConsultaCashBack_DetProd: TtecDataSource;
    qryConsultaCashBack_porProdutosjson_saldos: TStringField;
    qryConsultaCashBack_porProdutosreg: TLargeintField;
    qryConsultaCashBack_DetProdcashback: TIntegerField;
    qryConsultaCashBack_DetProdvalidade: TDateTimeField;
    qryConsultaCashBack_DetProdquantidade: TFloatField;
    qryConsultaCashBack_DetProdvalor: TFloatField;
    qryConsultaCashBack_DetProddescricaocashback: TStringField;
    qryConsultaCashBack_DetProddata_hora: TDateTimeField;
    qryConsultaCashBack_DetProdcliente: TIntegerField;
    qryConsultaCashBack_DetProdtipo_cliente: TStringField;
    qryConsultaCashBack_DetProdstatus: TStringField;
    qryConsultaCashBack_DetProdcontrato: TStringField;
    qryConsultaCashBack_DetProdparcela: TIntegerField;
    qryConsultaCashBack_DetProdnomecliente: TStringField;
    qryConsultaCashBack_porProdutosValorCB_Acertos: TFloatField;
    qryConsultaCashBackValorCB_Acertos: TFloatField;
    qryConsultaCashBackvalorcb_vencidos: TFloatField;
    qryConsultaCashBack_porProdutosvalorcb_vencidos: TFloatField;
  private
    FFiliais: String;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property Filiais: String read FFiliais write FFiliais;
    procedure AbrirConsulta(DataInicial, DataFinal, SelecionarPor, VisaoPor, ListaCondicionalClientes: String);
    procedure Abrir_ConsultaCashBack_Det;
    procedure Abrir_ConsultaCashBack_DetProd;
  end;

var
  dtmConsultaCashBack: TdtmConsultaCashBack;

implementation

{$R *.dfm}

{ TdtmConsultaCashBack }

procedure TdtmConsultaCashBack.AbrirConsulta(DataInicial, DataFinal, SelecionarPor,
VisaoPor, ListaCondicionalClientes: String);
begin
  if filiais <> '' then
    qryConsultaCashBack.macrobyname('ListaFiliais').asString := ' and ct.filialvenda in ('+
      Filiais+')'
  else
    qryConsultaCashBack.macrobyname('ListaFiliais').asString := '';

  if SelecionarPor = 'Data do CashBack' then
  begin
    if (DataInicial <> '') and (DataFinal <> '') then
    begin
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString :=
      ' and cast(cb_s.data_hora as date) between '+quotedstr(datainicial)+ ' and ' + quotedstr(datafinal);
    end
    else
    if (DataInicial <> '') and (DataFinal = '') then
    begin
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString :=
      ' and cast(cb_s.data_hora as date) >= '+quotedstr(datainicial);
    end
    else
    if (DataInicial = '') and (DataFinal <> '') then
    begin
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString :=
      ' and cast(cb_s.data_hora as date) <= ' + quotedstr(datafinal);
    end
    else
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString := '';
  end
  else
  if SelecionarPor = 'Validade do CasBack' then
  begin

    if (DataInicial <> '') and (DataFinal <> '') then
    begin
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString :=
      ' and cast(cb_sp.validade as date) between '+quotedstr(datainicial)+ ' and ' + quotedstr(datafinal);
    end
    else
    if (DataInicial <> '') and (DataFinal = '') then
    begin
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString :=
      ' and cast(cb_sp.validade as date) >= '+quotedstr(datainicial);
    end
    else
    if (DataInicial = '') and (DataFinal <> '') then
    begin
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString :=
      ' and cast(cb_sp.validade as date) <= ' + quotedstr(datafinal);
    end
    else
      qryConsultaCashBack.macrobyname('IntervaloDatas').asString := '';

  end;

  if ListaCondicionalClientes <> '' then
    qryConsultaCashBack.macrobyname('Cliente').asString :=  ' and (' + ListaCondicionalClientes + ')'
  else
    qryConsultaCashBack.macrobyname('Cliente').asString := '';


  if VisaoPor = 'Visão por Contrato' then
  begin
    qryConsultaCashBack.close;
    qryConsultaCashBack.open;
    Abrir_ConsultaCashBack_Det;
  end
  else
  if VisaoPor = 'Totais por Produto' then
  begin
    qryConsultaCashBack_porProdutos.macros := qryConsultaCashBack.macros;
    qryConsultaCashBack_porProdutos.close;
    qryConsultaCashBack_porProdutos.open;
    Abrir_ConsultaCashBack_DetProd;
  end;


end;

procedure TdtmConsultaCashBack.Abrir_ConsultaCashBack_Det;
begin

  qryConsultaCashBack_Det.close;

  if qryConsultaCashBackjson_prod.asString<>'' then
  begin
    qryConsultaCashBack_Det.Macrobyname('json_Prod').asString :=
      quotedstr(qryConsultaCashBackjson_prod.asString);
    qryConsultaCashBack_Det.open;
  end;

end;

procedure TdtmConsultaCashBack.Abrir_ConsultaCashBack_DetProd;
begin

  qryConsultaCashBack_DetProd.close;

  if qryConsultaCashBack_porProdutosjson_prod.asString<>'' then
  begin
    qryConsultaCashBack_DetProd.Macrobyname('json_Prod').asString :=
      quotedstr(qryConsultaCashBack_porProdutosjson_prod.asString);

    qryConsultaCashBack_DetProd.Macrobyname('json_saldos').asString :=
      quotedstr(qryConsultaCashBack_porProdutosjson_saldos.asString);

    qryConsultaCashBack_DetProd.open;
  end;

end;

constructor TdtmConsultaCashBack.Create(AOwner: TComponent);
begin
  inherited;
end;

end.
