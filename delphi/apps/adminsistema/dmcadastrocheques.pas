unit dmcadastrocheques;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, DB,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Componentes
  cpdatasource,  cpquery,
  // Repositorio
  dmbasico,dmtecsoft,
  // Constantes
  ctconstantes,biblio, clparametrossistema, ZTransact;

type

//  TtecOnLancarParcela = function(var Data: String): Boolean of object;

  TdtmCadastroCheques = class(TdtmBasico)
    qryCheques: TtecQuery;
    dsrCheques: TtecDataSource;
    qryProcuraClientes: TtecQuery;
    dsrProcuraClientes: TtecDataSource;
    qryParcelasCheques: TtecQuery;
    dsrParcelas: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    qryProcuraFiliais: TtecQuery;
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaCheques: TtecQuery;
    qryParcelasChequescheque: TStringField;
    qryParcelasChequesnumero: TIntegerField;
    qryParcelasChequesdatavencto: TDateField;
    qryParcelasChequesvalorvencto: TFloatField;
    qryParcelasChequesdatapagto: TDateField;
    qryParcelasChequesvalorpagto: TFloatField;
    qryParcelasChequesfilialpagto: TIntegerField;
    qryParcelasChequestipopagto: TStringField;
    qryParcelasChequesdeventrada: TDateField;
    qryParcelasChequesdevcaixa: TDateField;
    qryParcelasChequesdevfilial: TIntegerField;
    qryParcelasChequesincobravel: TDateField;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryProcuraClientesnome: TStringField;
    qryProcuraClientescodigo: TIntegerField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    spcValidaCheques: TtecQuery;
    qryChequesnumero: TStringField;
    qryChequescliente: TIntegerField;
    qryChequestitular: TStringField;
    qryChequesdata: TDateField;
    qryChequesvencto: TDateField;
    qryChequesvalor: TFloatField;
    qryChequesfilial: TIntegerField;
    qryChequessituacao: TStringField;
    qryConsultaChequestitular: TStringField;
    spcValidaChequescheques_valido: TBooleanField;
    qryChequeResgatado: TtecQuery;
    qryChequesremessadata: TDateField;
    qryChequesremessanumero: TIntegerField;
    qryParcelasChequesautenticacao: TIntegerField;
    qryProcuraMotivos: TtecQuery;
    qryProcuraMotivoscodigo: TIntegerField;
    qryProcuraMotivosdescricao: TStringField;
    dsrProcuraMotivos: TtecDataSource;
    qryConsultaMotivos: TtecQuery;
    qryConsultaMotivosdescricao: TStringField;
    qryConsultaMotivoscodigo: TIntegerField;
    qryChequesmotivo: TIntegerField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientesnome: TStringField;
    qryChequestipocliente: TStringField;
    qryProcuraClientestipo: TStringField;
    qryConsultaClientestipo: TStringField;
    qryChequeResgatadonumero: TIntegerField;
    qryConsultaChequesnome: TStringField;
    qryConsultaChequesnumero: TStringField;
    qryConsultaChequesbanco: TStringField;
    qryConsultaChequesagencia: TStringField;
    qryConsultaChequesconta: TStringField;
    qryConsultaChequescheque: TStringField;
    qryConsultaChequestipocliente: TStringField;
    qryChequesusuario: TIntegerField;
    qryProcuraCobradores: TtecQuery;
    dsrProcuraCobradores: TtecDataSource;
    qryConsultaCobradores: TtecQuery;
    qryConsultaCobradorescodigo: TIntegerField;
    qryConsultaCobradoresnome: TStringField;
    qryProcuraCobradorescodigo: TIntegerField;
    qryProcuraCobradoresnome: TStringField;
    qryChequescancelado: TDateField;
    qryChequesprimeiradevolucao: TDateField;
    qryChequessegundadevolucao: TDateField;
    qryChequesremessadata2: TDateField;
    qryChequesremessanumero2: TIntegerField;
    qryChequesreapresentar: TDateField;
    qryConsultaChequesvalor: TFloatField;
    qryConsultaClientestipocliente: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientesestado: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryParcelasChequesresgate: TStringField;
    qryChequessituacaocheque: TStringField;
    qryChequesobservacao: TStringField;
    qryChequessituacaochequecalculada: TStringField;
    qryChequesRepassados: TtecQuery;
    dsrChequesRepassados: TtecDataSource;
    qryChequesRepassadosnumero: TIntegerField;
    qryChequesRepassadosdata: TDateField;
    qryChequesRepassadosfornecedor: TIntegerField;
    qryChequesRepassadostipofornecedor: TStringField;
    qryChequesRepassadosnomefornecedor: TStringField;
    qryChequesRepassadosfilial: TIntegerField;
    qryChequesRepassadosnomefilial: TStringField;
    qryChequesRepassadosobservacao: TStringField;
    qryChequesRepassadossituacao: TStringField;
    qryChequesRepassadosrepassador: TIntegerField;
    qryChequesRepassadosnomerepassador: TStringField;
    qryChequesRepassadosdatarepasse: TDateTimeField;
    qryChequesRepassadosexcluidor: TIntegerField;
    qryChequesRepassadosnomecancelador: TStringField;
    qryChequesRepassadosexcluido: TDateTimeField;
    qryChequesRepassadosdevolvedor: TIntegerField;
    qryChequesRepassadosnomedevolvedor: TStringField;
    qryChequesRepassadosdevolvido: TDateTimeField;
    procedure qryChequesNewRecord(DataSet: TDataSet);
    procedure qryChequesAfterScroll(DataSet: TDataSet);
    procedure dsrChequesDataChange(Sender: TObject; Field: TField);
    procedure qryProcuraClientesAfterOpen(DataSet: TDataSet);
    procedure qryChequesAfterEdit(DataSet: TDataSet);
    procedure qryChequesAfterOpen(DataSet: TDataSet);
    procedure qryChequesCalcFields(DataSet: TDataSet);
  private
    function GetExistePagamento: boolean;
  protected
    FNumeroCheque: String;
    function  GetPodeReapresentarCheque: Boolean;
    function  GetPodeAtribuirSegundaDevolucao: Boolean;
    function  GetPodeAtribuirMotivo: Boolean;
    function  GetPodeAtribuirPrimeiraDevolucao: Boolean;
    function  GetPodeAtribuirCobrador: Boolean;
    function  GetPodeCancelarCheque: Boolean;
    function  ChequeParaPrimeiroResgate: Boolean;
    function  ChequeParaSegundoResgate: Boolean;
    function  ChequePrimeiraDevolucaoResgatado: Boolean;
    function  ChequeSegundaDevolucaoResgatado: Boolean;
    function  GetSomenteControlarSegundaDevolucao: Boolean;
    function  GetTabelaCheques: TZDataSet;
    function  GetTabelaConsultaCheques        : TtecQuery;
    function  GetTabelaConsultaClientes       : TtecQuery;
    function  GetTabelaConsultaFilial         : TtecQuery;
    function  GetTabelaConsultaMotivos: TtecQuery;
    function  GetTabelaConsultaCobradores: TtecQuery;
    function  GetAlterandoInserindo: Boolean;
    function  GetNumeroChequeConsulta: String;
    function  GetManual1: String;
    function  GetManual2: String;
    function  GetManual3: String;
    procedure LancarChequeResgate;
    function  ValidaCheque(cheque:string):boolean;
    function  ValidarSituacaoCheque:Boolean;
  public
    FSituacaoOk: Boolean;
    procedure AbrirTabelas(TipoConsulta: TtecChequeCadastroConsulta);
    procedure FecharTabelas(TipoConsulta: TtecChequeCadastroConsulta);
    procedure Selecionar(TipoConsulta: TtecChequeCadastroConsulta);
    function  ChequeCadastrado(Numero: String): Boolean;
    constructor Create(AOwner: TComponent); override;
    function  ExcluirCheque: Boolean;
    function  ExisteCheque(campo, codigo: string): boolean;
    function  ExisteCliente(campo, codigo: string): boolean;
    function  ExisteFilial(campo, codigo: string): boolean;
    function  ExisteCobrador(campo, codigo: string): boolean;
    function  ExisteMotivo(Campo, codigo: String): boolean;
    function  GravarCheque:  Boolean;
    function  IncluirCheque: Boolean; overload;
    procedure ReFazConsultaCheques;
    procedure RefazConsultaParcelas;
    property  TabelaCheques      : TZDataSet read GetTabelaCheques;
    property  TabelaConsultaCheques    : TtecQuery read GetTabelaConsultaCheques;
    property  TabelaConsultaClientes   : TtecQuery read GetTabelaConsultaClientes;
    property  TabelaConsultaFiliais    : TtecQuery read GetTabelaConsultaFilial;
    property  TabelaConsultaMotivos    : TtecQuery read GetTabelaConsultaMotivos;
    property  TabelaConsultaCobradores : TtecQuery read GetTabelaConsultaCobradores;
    property  AlterandoInserindo       : Boolean   read GetAlterandoInserindo;
    property  NumeroChequeConsulta     : String    read GetNumeroChequeConsulta;
    property  Manual1                  : String    read GetManual1;
    property  Manual2                  : String    read GetManual2;
    property  Manual3                  : String    read GetManual3;
    property  SomenteControlarSegundaDevolucao: Boolean   read GetSomenteControlarSegundaDevolucao;
    property  PodeCancelarCheque       : Boolean   read GetPodeCancelarCheque;
    property  PodeAtribuirCobrador     : Boolean   read GetPodeAtribuirCobrador;
    property  PodeAtribuirMotivo       : Boolean   read GetPodeAtribuirMotivo;
    property  PodeAtribuirPrimeiraDevolucao : Boolean read GetPodeAtribuirPrimeiraDevolucao;
    property  PodeAtribuirSegundaDevolucao  : Boolean read GetPodeAtribuirSegundaDevolucao;
    property  PodeReapresentarCheque   : Boolean   read GetPodeReapresentarCheque;
    property ExistePagamento: boolean read GetExistePagamento;
    procedure SetarCamposSomenteLeitura(SomenteLeitura: Boolean);
    procedure RefazConsultaCheque;
  end;

var
  dtmCadastroCheques: TdtmCadastroCheques;

implementation

{$R *.dfm}

{ TdtmCadastroCheques }

procedure TdtmCadastroCheques.AbrirTabelas(TipoConsulta: TtecChequeCadastroConsulta);
begin
  case TipoConsulta of                  
    cccClientes  : begin
                     qryConsultaClientes.Sql[08] := 'Where (v.codigo = 0)';
                     Abre(ctChequesConsultaClientes);
                   end;
    cccFiliais   : Abre(ctChequesConsultaFilial);
    cccMotivos   : Abre(ctChequesConsultaMotivos);
    cccCobrador  : Abre(ctChequesCobradores);
    cccCheques   : begin
                     qryConsultaCheques.Sql[12]:= 'and False';
                     Abre(ctChequesConsulta);
                   end;
  end;
end;

function TdtmCadastroCheques.ChequeCadastrado(Numero: String): Boolean;
begin
  Result:= False;
  if (qryCheques.IsEmpty or (qryChequesnumero.AsString <> Numero)) then begin
    ReFazConsulta(qryCheques,[0],[Numero]);
    if qryCheques.IsEmpty then
      if not (qryCheques.State in [dsEdit, dsInsert]) then begin
        qryCheques.Insert;
        qryChequesnumero.AsString:= Numero;
      end;
  end;
end;

function TdtmCadastroCheques.ChequeParaPrimeiroResgate: Boolean;
begin
  Result:= False;
  if (qryChequesNumero.AsString <> '') then begin
    qryChequeResgatado.Sql[03]:= ''; //'and (datapagto is null)';
    qryChequeResgatado.Sql[04]:= 'and (resgate = ''1'')';
    qryChequeResgatado.Params[0].AsString:= qryChequesNumero.AsString;
    qryChequeResgatado.Open;
    Result:= qryChequeResgatado.RecordCount = 0;
  end;
end;

function TdtmCadastroCheques.ChequeParaSegundoResgate: Boolean;
begin
  Result:= False;
  if (qryChequesNumero.AsString <> '') then begin
    qryChequeResgatado.Sql[03]:= ''; //'and (datapagto is null)';
    qryChequeResgatado.Sql[04]:= 'and (resgate = ''2'')';
    qryChequeResgatado.Params[0].AsString:= qryChequesNumero.AsString;
    qryChequeResgatado.Open;
    Result:= qryChequeResgatado.IsEmpty;
  end;
end;

function TdtmCadastroCheques.ChequePrimeiraDevolucaoResgatado: Boolean;
begin
  Result:= False;
  if (qryChequesNumero.AsString <> '') then begin
    qryChequeResgatado.Sql[03]:= 'and (datapagto is not null)';
    qryChequeResgatado.Sql[04]:= 'and (resgate = ''1'')';
    qryChequeResgatado.Params[0].AsString:= qryChequesNumero.AsString;
    qryChequeResgatado.Open;
    Result:= not qryChequeResgatado.IsEmpty;
  end;
end;

function TdtmCadastroCheques.ChequeSegundaDevolucaoResgatado: Boolean;
begin
  Result:= False;
  if (qryChequesNumero.AsString <> '') then begin
    qryChequeResgatado.Sql[03]:= 'and (datapagto is not null)';
    qryChequeResgatado.Sql[04]:= 'and (resgate = ''2'')';
    qryChequeResgatado.Params[0].AsString:= qryChequesNumero.AsString;
    qryChequeResgatado.Open;
    Result:= not qryChequeResgatado.IsEmpty;
  end;
end;

constructor TdtmCadastroCheques.Create(AOwner: TComponent);
begin
  inherited;
  qryCheques.Tag          := ctChequesCadastro;
  qryParcelasCheques.Tag  := ctChequesCadastro;
  qryConsultaClientes.Tag := ctChequesConsultaClientes;
  qryConsultaFiliais.Tag  := ctChequesConsultaFilial;
  qryConsultaCheques.Tag  := ctChequesConsulta;
  qryConsultaMotivos.Tag  := ctChequesConsultaMotivos;
  qryConsultaCobradores.Tag := ctChequesCobradores;
  qryProcuraClientes.Params[1].AsString := 'C';
end;

procedure TdtmCadastroCheques.dsrChequesDataChange(Sender: TObject; Field: TField);
begin
  inherited;
//  if (Field = qryChequessituacao){ or (Field = qryChequesprimeiradevolucao))} then begin
//    ValidarSituacaoCheque;
(*    FSituacaoOk:= True;
    if (qryChequesSituacao.AsString = 'D') then begin
      if ControlarSegundaDevolucao  then begin
        if qryChequessegundadevolucao.IsNull  then
          qryChequessegundadevolucao.AsDateTime := DataServidor
      end
//      else if not qryChequesremessanumero.IsNull and qryChequesprimeiradevolucao.IsNull then
      else if qryChequesprimeiradevolucao.IsNull then
        qryChequesprimeiradevolucao.AsDateTime:= DataServidor;

      if ControlarSegundaDevolucao or not qryChequesprimeiradevolucao.IsNull then
        if not ChequeParaResgate then
          LancarChequeResgate;
      qryChequescancelado.Clear;
    end;

    if (qryChequesSituacao.AsString = 'C') then begin
      if PodeCancelarCheque then
           qryChequescancelado.AsDateTime := DataServidor
      else qryChequescancelado.Clear;
    end;

    if (qryChequesSituacao.AsString = 'N') or (qryChequesSituacao.AsString = 'C') then begin
      if ChequeResgatado then begin
        MensagemAviso(ctCHEQUERESGATADO);
        FSituacaoOk:= False;
      end
      else begin
        if not qryParcelasCheques.IsEmpty then begin
          qryParcelasCheques.First;
          while not qryParcelasCheques.Eof do
            qryParcelasCheques.Delete;
          Perpetrar([qryParcelasCheques]);
        end;
        if (qryChequesSituacao.AsString = 'N') then
          qryChequescancelado.Clear;
        qryChequesmotivo.Clear;
        qryProcuraMotivosdescricao.Clear;
        qryChequesprimeiradevolucao.Clear;
        qryChequesreapresentar.Clear;
        qryChequessegundadevolucao.Clear;
      end;
    end;
  end
  else if (Field = qryChequesprimeiradevolucao) then begin
    if qryChequesprimeiradevolucao.IsNull then begin
      qryChequesmotivo.Clear;
      qryProcuraMotivosdescricao.Clear;
    end;
  end;*)
end;

function TdtmCadastroCheques.ExcluirCheque: Boolean;
begin
  Result:= False;
  if qryParcelasCheques.IsEmpty then begin
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o CHEQUE'])) = smbOk then begin
      if (qryCheques.State in [dsEdit, dsInsert]) then
           qryCheques.Cancel
      else qryCheques.Delete;
      Perpetrar([qryCheques]);
      Result := True
    end
  end
  else MensagemAviso(ctCHEQUENAOPODEEXCLUIR);
end;

function TdtmCadastroCheques.ExisteCheque(campo, codigo: string): boolean;
const
  SQL = 'and (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1'') )';
  SQL_banco   = 'and substring(cheques.numero,1,3) = %s';
  SQL_agencia = 'and substring(cheques.numero,4,4) = %s';
  SQL_conta   = 'and substring(cheques.numero,20,10) = %s';
  SQL_cheque  = 'and substring(cheques.numero,12,06) = %s';
begin
  if campo = 'banco' then
    qryConsultaCheques.Sql[12]:= Format(SQL_banco, [codigo])
  else if campo = 'agencia' then
    qryConsultaCheques.Sql[12]:= Format(SQL_agencia, [codigo])
  else if campo = 'conta' then
    qryConsultaCheques.Sql[12]:= Format(SQL_conta, [codigo])
  else if campo = 'cheque' then
    qryConsultaCheques.Sql[12]:= Format(SQL_cheque, [codigo])

  else
    qryConsultaCheques.Sql[12]:= Format(SQL, [campo, codigo, '%']);

  qryConsultaCheques.Open;
  Result := (qryConsultaCheques.RecordCount > 0);
end;

function TdtmCadastroCheques.ExisteCliente(campo, codigo: string): boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if Campo = 'nomecidade' then
    Campo:= 'c.nome'
  else if Campo = 'tipocliente' then
    Campo:= 'v.tipo'
  else Campo:= 'v.' + Campo;
  qryConsultaClientes.Sql[08] := Format(SQL, [campo, codigo, '%']);
  qryConsultaClientes.Open;
  Result := qryConsultaClientes.RecordCount > 0
end;

function TdtmCadastroCheques.ExisteFilial(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

function TdtmCadastroCheques.ExisteMotivo(Campo, codigo: String): boolean;
begin
 Result := ExisteCodigo(qryConsultaMotivos, campo, codigo);end;

procedure TdtmCadastroCheques.FecharTabelas(TipoConsulta: TtecChequeCadastroConsulta);
begin
  case TipoConsulta of
    cccClientes  : Fecha(ctChequesConsultaClientes);
    cccFiliais   : Fecha(ctChequesConsultaFilial);
    cccMotivos   : Fecha(ctChequesConsultaMotivos);
    cccCheques   : Fecha(ctChequesConsulta);
    cccCobrador  : Fecha(ctChequesCobradores);
  end;
end;

function TdtmCadastroCheques.GetTabelaCheques: TZDataSet;
begin
  Result := qryCheques
end;

function TdtmCadastroCheques.GetTabelaConsultaCheques: TtecQuery;
begin
  Result := qryConsultaCheques
end;

function TdtmCadastroCheques.GetTabelaConsultaClientes: TtecQuery;
begin
  Result := qryConsultaClientes
end;

function TdtmCadastroCheques.GetTabelaConsultaFilial: TtecQuery;
begin
  Result := qryConsultaFiliais
end;

function TdtmCadastroCheques.GetTabelaConsultaMotivos: TtecQuery;
begin
  Result:= qryConsultaMotivos;
end;

function TdtmCadastroCheques.GravarCheque: Boolean;
begin
  Result:= False;
  if qryCheques.CheckRequiredFields then
    Result:= ValidaCheque(qryChequesnumero.AsString);
    if Result then begin
      Result:= ((qryChequessituacao.AsString <> 'D') or
                ((qryChequessituacao.AsString = 'D') and
                 (not qryChequesprimeiradevolucao.IsNull or not qryChequessegundadevolucao.IsNull)));
      if Result then begin
        Result:= ValidarSituacaoCheque;
        if Result then begin
          if qryCheques.State in [dsEdit, dsInsert] then
            qryCheques.Post;
          Perpetrar([qryCheques, qryParcelasCheques]);
        end;
      end
      else
        MensagemAviso(ctSEMDATADEVOLUCAO);
    end
    else MensagemAviso(ctERRORCHEQUENUMERO);
end;

function TdtmCadastroCheques.IncluirCheque: Boolean;
begin
  qryCheques.Insert;
  Result := True;
end;

procedure TdtmCadastroCheques.LancarChequeResgate;
var
  NrP: Integer;
  Resgate: String;
begin
  if qryParcelasCheques.RecordCount > 0 then Resgate:= '2'
  else                                       Resgate:= '1';
  qryParcelasCheques.Last;
  NrP:= qryParcelasChequesnumero.AsInteger + 1;
  qryParcelasCheques.Append;
  qryParcelasChequescheque.AsString       := qryChequesnumero.AsString;
  qryParcelasChequesnumero.AsInteger      := NrP;
  qryParcelasChequesresgate.AsString      := Resgate;
  qryParcelasChequesdatavencto.AsDateTime := qryChequesvencto.AsDateTime;
  qryParcelasChequesvalorvencto.AsFloat   := qryChequesvalor.AsFloat;
  qryParcelasCheques.Post
end;

procedure TdtmCadastroCheques.qryChequesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryParcelasCheques,[0],[qryChequesnumero.AsString]);
  RefazConsultaPorNome(qryChequesRepassados,['cheque'],[qryChequesnumero.AsString]);
end;

procedure TdtmCadastroCheques.qryChequesNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryChequesdata.AsDateTime      := date;
  qryChequesvencto.AsDateTime    := date;
  qryChequessituacao.AsString    := 'N';
  qryChequestipocliente.AsString := 'C'
end;

procedure TdtmCadastroCheques.ReFazConsultaCheques;
begin
  if qryCheques.RecordCount <> 0 then
    ReFazConsulta(qryCheques,[0],['']);
end;

procedure TdtmCadastroCheques.RefazConsultaParcelas;
begin
  ReFazConsulta(qryParcelasCheques, [0], [qryChequesnumero.AsString]);
end;

procedure TdtmCadastroCheques.Selecionar(TipoConsulta: TtecChequeCadastroConsulta);
begin
  case TipoConsulta of
    cccClientes  : begin
                     qryProcuraClientes.Params[1].AsString := qryConsultaClientestipo.AsString;
                     qryCheques.Edit;
                     qryChequescliente.AsInteger:= qryConsultaClientescodigo.AsInteger;
                   end;
    cccFiliais   : begin
                     qryCheques.Edit;
                     qryChequesfilial.AsInteger:= qryConsultaFiliaiscodigo.AsInteger;
                   end;
    cccMotivos   : begin
                     qryCheques.Edit;
                     qryChequesmotivo.AsInteger := qryConsultaMotivoscodigo.AsInteger;
                   end;
    cccCheques   : begin
                     FNumeroCheque:= qryConsultaChequesnumero.AsString;
                     qryProcuraClientes.Params[1].AsString := qryConsultaChequestipocliente.AsString;
                   end;
    cccCobrador  : begin
                     qryCheques.Edit;
                     qryChequesusuario.AsInteger:= qryConsultaCobradorescodigo.AsInteger;
                   end;
  end;
end;

function TdtmCadastroCheques.ValidaCheque(cheque: string): boolean;
begin
  spcValidaCheques.Params[0].AsString:= Cheque;
  spcValidaCheques.open;
  Result := spcValidaChequescheques_valido.AsBoolean;
  spcValidaCheques.Close;
end;

procedure TdtmCadastroCheques.qryProcuraClientesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsrCheques.OnDataChange:= nil;
  if qryCheques.State in[dsEdit, dsInsert] then begin
    if qryProcuraClientescodigo.AsInteger > 0 then begin
      qryChequestitular.AsString    := qryProcuraClientesnome.AsString;
      qryChequestipocliente.AsString:= qryProcuraClientestipo.AsString;
    end
  end;
  dsrCheques.OnDataChange:= dsrChequesDataChange;
end;

function TdtmCadastroCheques.GetAlterandoInserindo: Boolean;
begin
  Result:= (qryCheques.State in [dsEdit, dsInsert]);
end;

function TdtmCadastroCheques.GetNumeroChequeConsulta: String;
begin
  Result:= FNumeroCheque;
end;

function TdtmCadastroCheques.ExisteCobrador(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaCobradores, campo, codigo);
end;

function TdtmCadastroCheques.GetTabelaConsultaCobradores: TtecQuery;
begin
  Result:= qryConsultaCobradores;
end;

function TdtmCadastroCheques.GetSomenteControlarSegundaDevolucao: Boolean;
begin
  Result:= ParSistema.ControlarSomente2Devolucao;
end;

function TdtmCadastroCheques.GetPodeCancelarCheque: Boolean;
begin
  Result:= qryChequesremessanumero.IsNull;
end;

function TdtmCadastroCheques.GetPodeAtribuirCobrador: Boolean;
begin
  Result:= not qryChequessegundadevolucao.IsNull;
end;

function TdtmCadastroCheques.GetPodeAtribuirMotivo: Boolean;
begin
  Result:= ((not SomenteControlarSegundaDevolucao and
            (not qryChequesprimeiradevolucao.IsNull or not qryChequessegundadevolucao.IsNull)) or
            (SomenteControlarSegundaDevolucao and not qryChequessegundadevolucao.IsNull));
end;

function TdtmCadastroCheques.GetPodeAtribuirPrimeiraDevolucao: Boolean;
begin
  Result:= (not SomenteControlarSegundaDevolucao) and (not qryChequesremessanumero.IsNull)
                                           and qryChequessegundadevolucao.IsNull
                                           and qryChequesremessanumero2.IsNull;

end;

function TdtmCadastroCheques.GetPodeReapresentarCheque: Boolean;
begin
  Result:= not SomenteControlarSegundaDevolucao and not qryChequesprimeiradevolucao.IsNull
                                         and qryChequesremessanumero2.IsNull;
end;

function TdtmCadastroCheques.GetPodeAtribuirSegundaDevolucao: Boolean;
begin
  Result:= not qryChequesremessanumero2.IsNull;
end;

function TdtmCadastroCheques.GetManual1: String;
begin
  Result:= Copy(FNumeroCheque,1,8);
end;

function TdtmCadastroCheques.GetManual2: String;
begin
  Result:= Copy(FNumeroCheque,9,10);
end;

function TdtmCadastroCheques.GetManual3: String;
begin
  Result:= Copy(FNumeroCheque,19,12);
end;

procedure TdtmCadastroCheques.qryChequesAfterEdit(DataSet: TDataSet);
begin
  inherited;
//  if not FSituacaoOk then
//    qryCheques.Cancel;
end;

procedure TdtmCadastroCheques.qryChequesAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  FSituacaoOk:= True;
end;

function TdtmCadastroCheques.ValidarSituacaoCheque: Boolean;
begin
  Result:= True;
  if (qryChequesSituacao.AsString = 'D') then begin
    if SomenteControlarSegundaDevolucao then begin
      if (not qryChequessegundadevolucao.IsNull and ChequeParaPrimeiroResgate) then
        LancarChequeResgate;
    end
    else begin
      if ((not qryChequesprimeiradevolucao.IsNull and ChequeParaPrimeiroResgate) or
          (not qryChequessegundadevolucao.IsNull  and ChequePrimeiraDevolucaoResgatado and ChequeParaSegundoResgate)) then
        LancarChequeResgate
      else begin
        if qryChequessegundadevolucao.IsNull and not ChequeParaSegundoResgate and
                                                 not ChequeSegundaDevolucaoResgatado then begin
          qryParcelasCheques.First;
          while not qryParcelasCheques.Eof do begin
            if qryParcelasChequesresgate.AsInteger = 2 then
                 qryParcelasCheques.Delete
            else qryParcelasCheques.Next;
          end;
          //Perpetrar([qryParcelasCheques]);
        end
        else begin
          if qryChequessegundadevolucao.IsNull and ChequeSegundaDevolucaoResgatado then begin
            MensagemAviso('Data da segunda devolução obrigatória');
            Result:= False;
          end;
        end;
      end;
    end;
    qryChequescancelado.Clear;
  end;

  if (qryChequesSituacao.AsString = 'N') or (qryChequesSituacao.AsString = 'C') then begin
    if (ChequePrimeiraDevolucaoResgatado or ChequeSegundaDevolucaoResgatado) then begin
      MensagemAviso(ctCHEQUERESGATADO);
      Result:= False;
//      FSituacaoOk:= False;
    end
    else begin
      if not qryParcelasCheques.IsEmpty then begin
        qryParcelasCheques.First;
        while not qryParcelasCheques.Eof do
          qryParcelasCheques.Delete;
        //Perpetrar([qryParcelasCheques]);
      end;
      if (qryChequesSituacao.AsString = 'N') then
        qryChequescancelado.Clear;
      qryChequesmotivo.Clear;
      qryProcuraMotivosdescricao.Clear;
      qryChequesprimeiradevolucao.Clear;
      qryChequesreapresentar.Clear;
      qryChequessegundadevolucao.Clear;
    end;
  end;

  if (qryChequesSituacao.AsString = 'C') then begin
    if PodeCancelarCheque then
         qryChequescancelado.AsDateTime := DataServidor
    else qryChequescancelado.Clear;
  end;

  if ((not SomenteControlarSegundaDevolucao and qryChequesprimeiradevolucao.IsNull) or
      (    SomenteControlarSegundaDevolucao and qryChequessegundadevolucao.IsNull)) then begin
    qryChequesmotivo.Clear;
    qryProcuraMotivosdescricao.Clear;
  end;
end;

procedure TdtmCadastroCheques.qryChequesCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryChequessituacao.AsString = 'N' then
    qryChequessituacaochequecalculada.AsString := qryChequessituacaocheque.AsString
  else
  if qryChequessituacao.AsString = 'C' then
    qryChequessituacaochequecalculada.AsString := 'CANCELADO'
  else
  if qryChequessituacao.AsString = 'D' then
  begin
    if (qryChequessituacaocheque.AsString = 'RESGATADO') or
       (qryChequessituacaocheque.AsString = 'RESGATE PARCIAL') then
      qryChequessituacaochequecalculada.AsString := qryChequessituacaocheque.AsString
    else
      qryChequessituacaochequecalculada.AsString := 'DEVOLVIDO';
  end;

end;

function TdtmCadastroCheques.GetExistePagamento: boolean;
begin
  result := false;
  GuardarRegistroAtual(qryParcelasCheques, true);
  qryParcelasCheques.First;
  while not qryParcelasCheques.Eof do
  begin
    if not qryParcelasChequesdatapagto.IsNull then
    begin
      result := true;
      break;
    end;
    qryParcelasCheques.Next;
  end;
  VoltarRegistroAtual(qryParcelasCheques);
end;

procedure TdtmCadastroCheques.SetarCamposSomenteLeitura(
  SomenteLeitura: Boolean);
begin
  qryChequescliente.ReadOnly := SomenteLeitura;
  qryChequestitular.ReadOnly := SomenteLeitura;
  qryChequesfilial.ReadOnly := SomenteLeitura;
  qryChequesdata.ReadOnly := SomenteLeitura;
  qryChequesvencto.ReadOnly := SomenteLeitura;
  qryChequesvalor.ReadOnly := SomenteLeitura;
  qryChequesprimeiradevolucao.ReadOnly := SomenteLeitura;
  qryChequesreapresentar.ReadOnly := SomenteLeitura;
  qryChequessegundadevolucao.ReadOnly := SomenteLeitura;
//  qryChequescancelado.ReadOnly := SomenteLeitura;
//  qryChequesmotivo.ReadOnly := SomenteLeitura;
//  qryChequesusuario.ReadOnly := SomenteLeitura;
  qryChequesremessadata.ReadOnly := SomenteLeitura;
//  qryChequesremessanumero.ReadOnly := SomenteLeitura;
  qryChequesremessadata2.ReadOnly := SomenteLeitura;
//  qryChequesremessanumero2.ReadOnly := SomenteLeitura;
  qryChequesobservacao.ReadOnly := SomenteLeitura;
end;

procedure TdtmCadastroCheques.RefazConsultaCheque;
begin
  try
    RefazConsultaPorNome(qryCheques,['numero'],[qryChequesnumero.AsVariant]);
  except
  end;  
end;

end.
