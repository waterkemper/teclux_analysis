unit dmmemoriacredito;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, ZTransact, Variants;

type
  TdtmMemoriaCredito = class(TdtmBasico)
    qryProcuraClientes: TtecQuery;
    qryProcuraClientescodigo: TIntegerField;
    qryProcuraClientesnome: TStringField;
    qryProcuraClientestipo: TStringField;
    dsrProcuraClientes: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryParametros: TtecQuery;
    dsrParametros: TtecDataSource;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientesestado: TStringField;
    qryConsultaClientestipo: TStringField;
    qryConsultaClientestipocliente: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryClientes: TtecQuery;
    dsrClientes: TtecDataSource;
    qryClientescodigo: TIntegerField;
    qryClientesnome: TStringField;
    qryClientesnascto: TDateField;
    qryClientesapelido: TStringField;
    qryClientessexo: TStringField;
    qryClientescivil: TStringField;
    qryClientescivildata: TDateField;
    qryClientesiddocumento: TStringField;
    qryClientesidorgao: TStringField;
    qryClientesiddata: TDateField;
    qryClientesidestado: TStringField;
    qryClientespessoatipo: TStringField;
    qryClientespessoanumero: TStringField;
    qryClientesmae: TStringField;
    qryClientespai: TStringField;
    qryClientesconceito: TIntegerField;
    qryClientesnaturalcidade: TIntegerField;
    qryClientesnaturalestado: TStringField;
    qryClientesrua: TStringField;
    qryClientesestado: TStringField;
    qryClientescidade: TIntegerField;
    qryClientesbairro: TIntegerField;
    qryClientescep: TIntegerField;
    qryClientesfonetipo: TStringField;
    qryClientesfoneddd: TIntegerField;
    qryClientesfonenumero: TIntegerField;
    qryClientesfoneramal: TStringField;
    qryClientesfone2ddd: TIntegerField;
    qryClientesfone2numero: TIntegerField;
    qryClientesfone2ramal: TStringField;
    qryClientesrestipo: TStringField;
    qryClientesresonus: TFloatField;
    qryClientesrestempo: TDateField;
    qryClientesempresa: TStringField;
    qryClientesempadmissao: TDateField;
    qryClientesempcep: TIntegerField;
    qryClientesempcomprovado: TBooleanField;
    qryClientesempfoneddd: TIntegerField;
    qryClientesempfonenumero: TIntegerField;
    qryClientesempfoneramal: TStringField;
    qryClientesempoutrasdescricao: TStringField;
    qryClientesempoutrasfaixa: TIntegerField;
    qryClientesempoutrasvalor: TFloatField;
    qryClientesemprendafaixa: TIntegerField;
    qryClientesemprendavalor: TFloatField;
    qryClientesemprua: TStringField;
    qryClientesempestado: TStringField;
    qryClientesempcidade: TIntegerField;
    qryClientesempbairro: TIntegerField;
    qryClientesempcargo: TIntegerField;
    qryClientesconjuge: TIntegerField;
    qryClientesconnome: TStringField;
    qryClientesconadmissao: TDateField;
    qryClientesconcep: TIntegerField;
    qryClientesconempresa: TStringField;
    qryClientesconfoneddd: TIntegerField;
    qryClientesconfonenumero: TIntegerField;
    qryClientesconfoneramal: TStringField;
    qryClientesconnascto: TDateField;
    qryClientesconrendafaixa: TIntegerField;
    qryClientesconrendavalor: TFloatField;
    qryClientesconrua: TStringField;
    qryClientesconestado: TStringField;
    qryClientesconcidade: TIntegerField;
    qryClientesconbairro: TIntegerField;
    qryClientesconcargo: TIntegerField;
    qryClientesreferencia: TStringField;
    qryClientesreftipo: TStringField;
    qryClientesrefrua: TStringField;
    qryClientesrefestado: TStringField;
    qryClientesrefcidade: TIntegerField;
    qryClientesrefbairro: TIntegerField;
    qryClientesrefcep: TIntegerField;
    qryClientesreffoneddd: TIntegerField;
    qryClientesreffonenumero: TIntegerField;
    qryClientesreffoneramal: TStringField;
    qryClientesreffone2ddd: TIntegerField;
    qryClientesreffone2numero: TIntegerField;
    qryClientesreffone2ramal: TStringField;
    qryClientesobservacoes: TStringField;
    qryClientesemail: TStringField;
    qryClientesautomovel: TBooleanField;
    qryClientescartaocredito: TBooleanField;
    qryClientescartaoloja: TBooleanField;
    qryClientescheque: TBooleanField;
    qryClienteschequeespecial: TBooleanField;
    qryClientesdependentes: TIntegerField;
    qryClientesonus: TFloatField;
    qryClientesenderecoalterado: TDateField;
    qryClientesfilialcadastro: TIntegerField;
    qryClientesdatacadastro: TDateField;
    qryClientesfone: TStringField;
    qryClientesestadocivil: TStringField;
    qryClientesresidencia: TStringField;
    qryClientestiporeferencia: TStringField;
    qryParametrosc1: TIntegerField;
    qryParametrosc2: TIntegerField;
    qryParametrosc3: TIntegerField;
    qryParametrosc4: TIntegerField;
    qryParametrosc5: TIntegerField;
    qryParametrosc6: TIntegerField;
    qryParametrosc7: TIntegerField;
    qryParametrosc8: TIntegerField;
    qryParametrosc9: TIntegerField;
    qryParametrosc10: TIntegerField;
    qryParametrosc11: TIntegerField;
    qryParametrosc12: TIntegerField;
    qryParametrosc13: TIntegerField;
    qryParametrosc14: TStringField;
    qryParametrosc15: TIntegerField;
    qryParametrosc16: TStringField;
    qryParametrosc17: TIntegerField;
    qryParametrosc18: TStringField;
    qryParametrosc19: TIntegerField;
    qryParametrosc20: TIntegerField;
    qryParametrosc21: TIntegerField;
    qryParametrosc22: TStringField;
    qryParametrosc23: TIntegerField;
    qryParametrosc24: TIntegerField;
    qryParametrosc25: TIntegerField;
    qryParametrosc26: TIntegerField;
    qryParametrosc27: TIntegerField;
    qryParametrosc28: TIntegerField;
    qryParametrosc29: TIntegerField;
    qryParametrosc30: TIntegerField;
    qryParametrosc31: TIntegerField;
    qryParametrosc32: TIntegerField;
    qryParametrosc33: TIntegerField;
    qryParametrosc34: TIntegerField;
    qryParametrosc35: TIntegerField;
    qryParametrosc36: TFloatField;
    qryParametrosc37: TIntegerField;
    qryParametrosc38: TFloatField;
    qryParametrosc39: TFloatField;
    qryParametrosc40: TFloatField;
    qryParametrosc41: TFloatField;
    qryParametrosc42: TIntegerField;
    qryParametrosc43: TIntegerField;
    qryParametrosc44: TFloatField;
    qryParametrosc45: TFloatField;
    qryParametrosc46: TFloatField;
    qryParametrosc49: TFloatField;
    qryParametrosc53: TFloatField;
    qryParametrosc55: TFloatField;
    qryParametrosc56: TFloatField;
    qryParametrosc57: TFloatField;
    qryParametrosc58: TFloatField;
    qryParametrosc59: TFloatField;
    qryParametrosc60: TFloatField;
    qryParametrosc61: TFloatField;
    qryParametrosc62: TFloatField;
    qryParametrosc63: TFloatField;
    qryParametrosc64: TFloatField;
    qryParametrosc50: TStringField;
    qryParametrosc54: TStringField;
    qryParametrosc47: TIntegerField;
    qryParametrosc48: TIntegerField;
    qryParametrosc51: TIntegerField;
    qryParametrosc52: TIntegerField;
  private
    function GetTabelaConsultaClientes: TtecQuery;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;

    procedure AbreTabelasMemoriaCredito(TipoConsulta: TtecPesquisa);
    procedure SelecionaTabelasMemoriaCredito(TipoConsulta: TtecPesquisa);
    procedure FechaTabelasConsulta(TipoConsulta: TtecPesquisa);
    function  ExisteClientes(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; overload;
    procedure CalculaCredito;
    procedure LimparCampos;

    property  TabelaConsultaClientes: TtecQuery read GetTabelaConsultaClientes;
  end;

var
  dtmMemoriaCredito: TdtmMemoriaCredito;

implementation

{$R *.dfm}

{ TdtmMemoriaCredito }

procedure TdtmMemoriaCredito.AbreTabelasMemoriaCredito(
  TipoConsulta: TtecPesquisa);
begin
  case TipoConsulta of
    pesCLIENTES : qryConsultaClientes.Open;
  end;
end;

procedure TdtmMemoriaCredito.CalculaCredito;
begin
  qryParametros.ParamByName('Cliente').AsInteger  := qryProcuraClientescodigo.AsInteger;
  qryParametros.ParamByName('Tipo').AsString      := qryProcuraClientestipo.AsString;
  qryParametros.ParamByName('ValorNota').AsFloat  := 0;
  qryParametros.ParamByName('Emissao').AsDateTime := DataServidor;
  if qryParametros.Active then
    qryParametros.Close;
  qryParametros.Open;

  RefazConsulta(qryClientes, [0], [qryProcuraClientescodigo.AsInteger]);
  if qryParametrosc14.AsString = '0' then
    qryParametrosc14.AsString := qryClientesEstadoCivil.AsString;
  qryParametrosc16.AsString := qryClientesfone.AsString;
  qryParametrosc18.AsString := qryClientesResidencia.AsString;
  qryParametrosc22.AsString := qryClientesTiporeferencia.AsString;

end;

constructor TdtmMemoriaCredito.Create(AOwner: TComponent);
begin
  inherited;
  qryProcuraClientes.Tag        := ctTabelas;
  qryConsultaClientes.Tag       := ctTabelasConsultaClientes;;
  qryProcuraClientes.Params[1].AsString := 'C';
end;

function TdtmMemoriaCredito.ExisteClientes(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if NomeCampo = 'nomecidade' then
    NomeCampo:= 'c.nome'
  else if NomeCampo = 'tipocliente' then
    NomeCampo:= 'v.tipo'
  else
    NomeCampo:= 'v.' + NomeCampo;
  qryConsultaClientes.Sql[08]:= 'Where to_ascii(' + NomeCampo + ',''latin1'') ilike to_ascii(''' + Value + '%'',''latin1'')';
  qryConsultaClientes.Open;
  Result := qryConsultaClientes.RecordCount > 0
end;

procedure TdtmMemoriaCredito.FechaTabelasConsulta(
  TipoConsulta: TtecPesquisa);
begin
  case TipoConsulta of
    pesCLIENTES : Fecha(ctTabelasConsultaClientes);
  end;
end;

function TdtmMemoriaCredito.GetTabelaConsultaClientes: TtecQuery;
begin
  Result := qryConsultaClientes;
end;

procedure TdtmMemoriaCredito.LimparCampos;
var
  a : Integer;
begin
  for a := 0 to 46 do
    qryParametros.Fields[a].AsVariant := null;
end;

procedure TdtmMemoriaCredito.SelecionaTabelasMemoriaCredito(
  TipoConsulta: TtecPesquisa);
begin
  case TipoConsulta of
    pesCLIENTES: begin
                   ReFazConsulta(qryProcuraClientes,[0,1],[qryConsultaClientesCodigo.AsVariant,
                                   qryConsultaClientestipo.AsVariant]);
                 end;
  end;
end;

end.
