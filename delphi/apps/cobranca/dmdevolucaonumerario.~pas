unit dmdevolucaonumerario;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Repositorio
  dmbasico, dmtecsoft,
  //Componentes
  cpquery, cpdatasource,
  //Biblio
  ctconstantes, biblio, clusuario, ZTransact;

type
  TdtmDevolucaoNumerario = class(TdtmBasico)
    qryContratos: TtecQuery;
    dsrContratos: TtecDataSource;
    qryParcelasContrato: TtecQuery;
    dsrParcelasContrato: TtecDataSource;
    qryContratosnumero: TStringField;
    qryContratoscliente: TIntegerField;
    qryContratosfilialvenda: TIntegerField;
    qryContratosagente: TIntegerField;
    qryContratosavalista: TIntegerField;
    qryContratosvendedor: TIntegerField;
    qryContratosanalista: TIntegerField;
    qryContratosvalorvista: TFloatField;
    qryContratosvalorprazo: TFloatField;
    qryContratosorigem: TStringField;
    qryContratosdescricaosituacao: TStringField;
    qryContratosnovocontrato: TStringField;
    qryContratosnomeavalista: TStringField;
    qryContratosnomevendedor: TStringField;
    qryContratosnomeanalista: TStringField;
    qryParcelasContratocontrato: TStringField;
    qryParcelasContratonumero: TIntegerField;
    qryParcelasContratodatavencto: TDateField;
    qryParcelasContratovalorvencto: TFloatField;
    qryParcelasContratofilialpagto: TIntegerField;
    qryParcelasContratodatapagto: TDateField;
    qryParcelasContratovalorpagto: TFloatField;
    qryParcelasContratodeventrada: TDateField;
    qryParcelasContratodevcaixa: TDateField;
    qryParcelasContratoincobravel: TDateField;
    qryParcelasContratoautorizavel: TBooleanField;
    qryContratosnomefilialvenda: TStringField;
    qryContratosdescricaoagente: TStringField;
    qryClientes: TtecQuery;
    dsrClientes: TtecDataSource;
    qryContratosPorCliente: TtecQuery;
    qryContratosPorClientenumero: TStringField;
    dsrContratosPorCliente: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryMaxParcelaQuitada: TtecQuery;
    qryMaxParcelaQuitadanumero: TIntegerField;
    qryParcelasContratoorigempagto: TIntegerField;
    qryParcelasContratocopiapagto: TIntegerField;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientestipo: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientestipocliente: TStringField;
    qryConsultaClientesestado: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryParcelasContratoparcelaorigem: TStringField;
    qryParcelasContratotipopagto: TStringField;
    qryCliente: TtecQuery;
    qryClientecodigo: TIntegerField;
    qryClientenome: TStringField;
    qryClientenascto: TDateField;
    qryClienteiddocumento: TStringField;
    qryClientenomepessoanumero: TStringField;
    qryClientepessoanumero: TStringField;
    qryClientesexo: TStringField;
    qryClientenaturalcidade: TIntegerField;
    qryClientenaturalestado: TStringField;
    qryClienteempresa: TStringField;
    qryClienterua: TStringField;
    qryClientebairro: TIntegerField;
    qryClientecidade: TIntegerField;
    qryClienteestado: TStringField;
    qryClientecep: TIntegerField;
    qryClientenomecidade: TStringField;
    qryClientenomebairro: TStringField;
    qryClientenomenaturalcidade: TStringField;
    qryClientepessoatipo: TStringField;
    qryClienteenderecoalterado: TDateField;
    qryClientesnome: TStringField;
    qryClientescodigo: TIntegerField;
    qryClientestipo: TStringField;
    qryClientespessoanumero: TStringField;
    qryClientestipocliente: TStringField;
    qryClientesestado: TStringField;
    qryClientesnomecidade: TStringField;
    procedure qryContratosAfterScroll(DataSet: TDataSet);
    procedure qryContratosPorClienteAfterScroll(DataSet: TDataSet);
    procedure qryClientesAfterOpen(DataSet: TDataSet);
    procedure ZMonitorMonitorEvent(Sql, Result: String);
  protected
    FOnAfterScrollContrato: TNotifyEvent;
    function GetParcelaJaDevolvida: Boolean;
    function GetPodeDevolverParcela: Boolean;
    function ParcelaAutorizada: boolean;
    function GetConsultarCliente: TtecQuery;
    function GetCodigoCliente: integer;
    function GetTipoCliente: String;
  public
    procedure AbrirConsultaClientes;
    procedure FecharConsultaClientes;
    procedure LimparTabelas;
    procedure ReFazConsultaContratosPorCliente;
    procedure Selecionar;
    function  ExisteCliente(NomeCampo, Value: Variant): boolean;
    function  EfetuarDevolucaoNumerario: Boolean;

    constructor Create(AOwner: TComponent); override;
    property OnAfterScrollContrato: TNotifyEvent read FOnAfterScrollContrato write FOnAfterScrollContrato;
    property ConsultarCliente: TtecQuery read GetConsultarCliente;
    property CodigoCliente: integer read GetCodigoCliente;
    property TipoCliente: String read GetTipoCliente;
    property PodeDevolverParcela: Boolean read GetPodeDevolverParcela;
    property ParcelaJaDevolvida: Boolean read GetParcelaJaDevolvida;
  end;

{var
  dtmDevolucaoNumerario: TdtmDevolucaoNumerario;}

implementation

{$R *.dfm}

{ TdtmDevolucaoNumerario }

procedure TdtmDevolucaoNumerario.AbrirConsultaClientes;
begin
  qryConsultaClientes.Sql[08] := 'Where (v.codigo = 0)';
  qryConsultaClientes.Open;
end;

constructor TdtmDevolucaoNumerario.Create(AOwner: TComponent);
begin
  inherited;
  qryClientes.Tag         := ctCrediarioClientes;
  qryConsultaClientes.Tag := ctCrediarioConsultaClientes;
  qryClientes.Params[0].AsInteger := 0;
  qryClientes.Params[1].AsString := 'C';
end;

function TdtmDevolucaoNumerario.ExisteCliente(NomeCampo, Value: Variant): boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if NomeCampo = 'nomecidade' then
    NomeCampo:= 'c.nome'
  else if NomeCampo = 'tipocliente' then
    NomeCampo:= 'v.tipo'
  else
    NomeCampo:= 'v.' + NomeCampo;    
  qryConsultaClientes.Sql[08]:= Format(SQL, [NomeCampo, ANSIUpperCase(Value), '%']);
  qryConsultaClientes.Open;
  Result := Not qryConsultaClientes.IsEmpty
end;

procedure TdtmDevolucaoNumerario.FecharConsultaClientes;
begin
  qryConsultaClientes.Close;
end;

function TdtmDevolucaoNumerario.GetConsultarCliente: TtecQuery;
begin
  Result := qryConsultaClientes;
end;

procedure TdtmDevolucaoNumerario.Selecionar;
begin
  RefazConsulta(qryClientes, [0,1], [qryConsultaClientesCodigo.AsString,
                                     qryConsultaClientestipo.AsVariant]);
  // acrescentado por DANIEL...
  ReFazConsultaContratosPorCliente;
end;

procedure TdtmDevolucaoNumerario.qryContratosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsulta(qryParcelasContrato, [0], [qryContratosNumero.asString]);
  if Assigned(OnAfterScrollContrato) then
    OnAfterScrollContrato(qryContratos);
end;

function TdtmDevolucaoNumerario.GetCodigoCliente: integer;
begin
  Result := qryClientesCodigo.AsInteger;
end;

function TdtmDevolucaoNumerario.ParcelaAutorizada: boolean;
begin
  Result:= False;
  if not qryParcelasContrato.isEmpty then begin
    Result := qryParcelasContratoAutorizavel.AsBoolean;
    if Result then begin
    {
      if (qryParcelasContratodatapagto.AsDateTime = DataServidor) then begin
        MensagemAviso(ctDEVOLUCAOPARCELAVIACAIXA);
        Result:= False;
      end
      else begin}
        ReFazConsulta(qryMaxParcelaQuitada,[0],[qryContratosnumero.AsString]);
        Result:= (qryMaxParcelaQuitadanumero.AsInteger = qryParcelasContratonumero.AsInteger);
        if not Result then
          MensagemAviso(ctSOMENTEULTIMAPODESERDEVOLVIDA);
//      end;
    end
    else MensagemAviso(ctERRORPARCELANAOAUTORIZAVEL);
  end;
end;

function TdtmDevolucaoNumerario.EfetuarDevolucaoNumerario: Boolean;
var
  Usuario           : TtecUsuarios;

  procedure InserirNovaParcela;
  var
    Pos           : TBookmark;
    ParcelaOrigem : String;
    DataVencto    : TDateTime;
    ValorVencto   : Currency;
    CopiaPagto    : integer;
    OrigemPagto   : integer;
  begin
   qryParcelasContrato.DisableControls;
   Pos:= qryParcelasContrato.GetBookmark;
   try
       // Armazena valores da prestação a ser devolvida.
       ParcelaOrigem := qryParcelasContratoparcelaorigem.AsString;
       DataVencto  := qryParcelasContratodatavencto.AsDateTime;
       ValorVencto := qryParcelasContratovalorvencto.AsCurrency;
       CopiaPagto  := qryParcelasContratocopiapagto.AsInteger;
       OrigemPagto := qryParcelasContratonumero.AsInteger; // Necessário
       // Insere nova parcela.
       qryParcelasContrato.append;
       qryParcelasContratocontrato.AsString       := qryContratosnumero.AsString;
       qryParcelasContratonumero.AsInteger        := qryParcelasContrato.RecordCount + 1;
       if (ParcelaOrigem<>'') then
         qryParcelasContratoparcelaorigem.AsString  := ParcelaOrigem;
       qryParcelasContratodatavencto.AsDateTime   := DataVencto;
       qryParcelasContratovalorvencto.AsCurrency  := ValorVencto;
       qryParcelasContratocopiapagto.AsInteger   := CopiaPagto;
       qryParcelasContratoorigempagto.AsInteger  := OrigemPagto;
       qryParcelasContrato.Post;
    finally
      qryParcelasContrato.GotoBookmark(Pos);
      qryParcelasContrato.FreeBookmark(Pos);
      qryParcelasContrato.EnableControls;
    end;
  end;

begin
  Result:= False;
  if ParcelaAutorizada then
    if MensagemConfirmacao(ctPERGUNTAPARCELADEVOLUCAONUMERARIO) = smbOK then begin
      if UsuarioLogin.DevolucaoNumerario  then
           Usuario:= ObterAutorizacao(taSENHA)
      else Usuario:= ObterAutorizacao(taLOGIN);
      try
        if Assigned(Usuario) then begin
          if Usuario.DevolucaoNumerario then begin
            qryParcelasContrato.Edit;
            qryParcelasContratotipopagto.AsString := 'P';
            qryParcelasContratodeventrada.AsDateTime := now();
            qryParcelasContrato.Post;
            InserirNovaParcela;  //Primeiro Edição, depois inserção.
            Perpetrar([qryParcelasContrato]);
            RefazConsulta(qryParcelasContrato, [0], [qryContratosNumero.AsString]);
            Result := True;
          end
          else MensagemAviso(ctUSUARIOSEMPERMISSAO);
        end
        else MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']))
      finally
        Usuario.Free
      end;
    end;
end;

procedure TdtmDevolucaoNumerario.ReFazConsultaContratosPorCliente;
begin
  ReFazConsulta(qryContratosPorCliente,[0,1],[qryClientesCodigo.AsInteger,
                                              qryClientestipo.AsVariant]);
//  ReFazConsulta(qryCliente,[0,1],[qryClientesCodigo.AsInteger,
//                                  qryClientesTipo.AsVariant]);
//  ReFazConsulta(qryCartasCliente,[0,1],[qryClientesCodigo.AsInteger,
//                                  qryClientesTipo.AsVariant]);
//  ReFazConsulta(qrySPCCliente,[0,1],[qryClientesCodigo.AsInteger,
//                                  qryClientesTipo.AsVariant]);
//  ReFazConsulta(qryCheques,[0,1],[qryClientesCodigo.AsInteger,
//                                  qryClientesTipo.AsVariant]);
//  ReFazConsulta(qryAtendimentosCliente,[0,1],[qryClientesCodigo.AsInteger,
//                                  qryClientesTipo.AsVariant]);
end;

procedure TdtmDevolucaoNumerario.qryContratosPorClienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryContratos,[0],[qryContratosPorClienteNumero.AsString]);
end;

procedure TdtmDevolucaoNumerario.LimparTabelas;
begin
  ReFazConsulta(qryContratos,          [0],['0']);
  ReFazConsulta(qryParcelasContrato,   [0],['0']);
  ReFazConsulta(qryContratosPorCliente,[0,1],[0,'0']);
//  ReFazConsulta(qryCartasCliente,[0,1],[0,'C']);
end;

function TdtmDevolucaoNumerario.GetParcelaJaDevolvida: Boolean;
begin
  Result := qryParcelasContratoDevEntrada.AsDateTime <> 0;
end;

function TdtmDevolucaoNumerario.GetPodeDevolverParcela: Boolean;
begin
  Result := qryParcelasContratoAutorizavel.AsBoolean;
end;

procedure TdtmDevolucaoNumerario.qryClientesAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  LimparTabelas;
end;

function TdtmDevolucaoNumerario.GetTipoCliente: String;
begin
 Result := qryClientestipo.AsString;
end;

procedure TdtmDevolucaoNumerario.ZMonitorMonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\logspc.sql') then
    Listar.loadfromfile('c:\logspc.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\logspc.sql');
  listar.free;
end;

end.


