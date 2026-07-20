unit dmcadastroimoveis;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, ZTransact, Biblio, ctconstantes;

type
  TdtmCadastroImoveis = class(TdtmBasico)
    qryImoveis: TtecQuery;
    dsrImoveis: TtecDataSource;
    dsrConsultaBlocos: TtecDataSource;
    qryConsultaBlocos: TtecQuery;
    qryConsultaBlocoscodigo: TIntegerField;
    qryConsultaBlocosempreendimento: TIntegerField;
    qryConsultaBlocosdescricao: TStringField;
    qryConsultaEmpreendimentos: TtecQuery;
    qryProcuraEmpreendimentos: TtecQuery;
    dsrProcuraEmpreendimentos: TtecDataSource;
    qryConsultaImoveis: TtecQuery;
    qryProcuraImoveis: TtecQuery;
    dsrProcuraImoveis: TtecDataSource;
    qryConsultaEmpreendimentoscodigo: TIntegerField;
    qryConsultaEmpreendimentosnome: TStringField;
    qryConsultaEmpreendimentosnomecidade: TStringField;
    qryConsultaEmpreendimentosestado: TStringField;
    qryProcuraEmpreendimentoscodigo: TIntegerField;
    qryProcuraEmpreendimentosnome: TStringField;
    qryProcuraEmpreendimentosrua: TStringField;
    qryProcuraEmpreendimentosnumero: TIntegerField;
    qryProcuraEmpreendimentosestado: TStringField;
    qryProcuraEmpreendimentoscidade: TIntegerField;
    qryProcuraEmpreendimentosbairro: TIntegerField;
    qryProcuraEmpreendimentoscep: TIntegerField;
    qryProcuraEmpreendimentosobservacoes: TStringField;
    qryProcuraEmpreendimentoscomplemento: TStringField;
    qryProcuraEmpreendimentossigla: TStringField;
    qryProcuraEmpreendimentosnomecidadecliente: TStringField;
    qryProcuraEmpreendimentosnomebairrocliente: TStringField;
    qryProcuraImoveisbloco: TIntegerField;
    qryProcuraImoveisUnidade: TIntegerField;
    qryProcuraImoveispavimento: TStringField;
    qryProcuraImoveissituacao: TStringField;
    qryProcuraImoveisareaprivativa: TFloatField;
    qryProcuraImoveisareacomum: TFloatField;
    qryProcuraImoveisfracaoideal: TFloatField;
    qryProcuraImoveisobservacoes: TStringField;
    qryProcuraImoveisdescricaobloco: TStringField;
    qryProcuraImoveistipoUnidade: TStringField;
    qryImoveisBloco: TIntegerField;
    qryImoveisEmpreendimento: TIntegerField;
    qryImoveisNomeBloco: TStringField;
    qryImoveisUnidade: TIntegerField;
    qryImoveisTipoUnidade: TStringField;
    qryImoveisNumero: TStringField;
    qryImoveisPavimento: TStringField;
    qryImoveisSituacao: TStringField;
    qryImoveisAreaPrivativa: TFloatField;
    qryImoveisAreaComum: TFloatField;
    qryImoveisFracaoIdeal: TFloatField;
    qryImoveisObservacoes: TStringField;
    qryProcuraImoveisnumero: TStringField;
    qryImoveisVendidos: TtecQuery;
    dsrImoveisVendidos: TtecDataSource;
    qryImoveisVendidoscontrato: TIntegerField;
    qryImoveisVendidosbloco: TIntegerField;
    qryImoveisVendidosnumero: TStringField;
    qryImoveisVendidosobservacoes: TStringField;
    qryVendasImoveis: TtecQuery;
    dsrVendasImoveis: TtecDataSource;
    qryVendasImoveiscontrato: TIntegerField;
    qryVendasImoveisdata: TDateField;
    qryVendasImoveisValortotal: TFloatField;
    qryVendasImoveissituacao: TStringField;
    qryVendasImoveisvendedor: TIntegerField;
    qryVendasImoveisobservacoes: TStringField;
    qryCompradores: TtecQuery;
    dsrCompradores: TtecDataSource;
    qryOutrosImoveis: TtecQuery;
    dsrOutrosImoveis: TtecDataSource;
    qryOutrosImoveiscontrato: TIntegerField;
    qryOutrosImoveisbloco: TIntegerField;
    qryOutrosImoveisnomebloco: TStringField;
    qryOutrosImoveisnumero: TStringField;
    qryOutrosImoveisnomeempreendimento: TStringField;
    qryConsultaTiposUnidades: TtecQuery;
    qryConsultaTiposUnidadescodigo: TIntegerField;
    qryConsultaTiposUnidadesnome: TStringField;
    qryProcuraTiposUnidades: TtecQuery;
    qryProcuraTiposUnidadescodigo: TIntegerField;
    qryProcuraTiposUnidadesnome: TStringField;
    dsrProcuraTiposUnidades: TtecDataSource;
    qryConsultaImoveisempreendimento: TStringField;
    qryConsultaImoveistipo: TStringField;
    qryConsultaImoveisnumero: TStringField;
    qryConsultaImoveispavimento: TStringField;
    qryConsultaImoveisnomebloco: TStringField;
    qryConsultaImoveisbloco: TIntegerField;
    qryConsultaEmpreendimentossigla: TStringField;
    qryConsultaImoveisSigla: TStringField;
    qryCompradorescontrato: TIntegerField;
    qryCompradorescliente: TIntegerField;
    qryCompradoresnomecomprador: TStringField;
    qryCompradorespercentual: TFloatField;
    qryCompradoresrepresentante: TIntegerField;
    qryCompradoresnomerepresentante: TStringField;
    qryCompradorestiporepresentante: TStringField;
    qryCompradoresfiador: TIntegerField;
    qryCompradoresnomefiador: TStringField;
    qryConsultaNumeroImovel: TtecQuery;
    dsrConsultaNumeroImovel: TtecDataSource;
    qryConsultaNumeroImovelnumero: TStringField;
    qryBloquearImoveis: TtecQuery;
    qryBloquearImoveislock: TIntegerField;
    qryDesbloquearImoveis: TtecQuery;
    qryBloquearImoveisbloco: TIntegerField;
    qryBloquearImoveisnumero: TStringField;
    qryDesbloquearImoveislock: TIntegerField;
    qryOutrosImoveistipo: TStringField;
    qryProcuraImoveisprecotabela: TFloatField;
    qryCompradorestipocliente: TStringField;
    qryCompradorestipofiador: TStringField;
    qryImoveisVendidossituacaocontrato: TStringField;
    qryImoveisAreaTotal: TFloatField;
    qryImoveisPreco: TFloatField;
    qryConsultaImoveispreco: TFloatField;
    qryConsultaImoveisunidade: TIntegerField;
    dsrConsultaTiposUnidades: TtecDataSource;
    qryImoveisTotalPrivativa: TFloatField;
    qryImoveisTotalComum: TFloatField;
    qryImoveistotalfracao: TFloatField;
    qryImoveisTotalArea: TCurrencyField;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryImoveisCalcFields(DataSet: TDataSet);
    procedure qryProcuraImoveisAfterScroll(DataSet: TDataSet);
    procedure qryImoveisAfterOpen(DataSet: TDataSet);
    procedure qryImoveisVendidosAfterOpen(DataSet: TDataSet);
    procedure qryImoveisVendidosAfterScroll(DataSet: TDataSet);
    procedure qryImoveisVendidosAfterCancel(DataSet: TDataSet);
    procedure qryImoveisAfterCancel(DataSet: TDataSet);
    procedure qryConsultaNumeroImovelBeforeOpen(DataSet: TDataSet);
    procedure qryImoveisBeforeOpen(DataSet: TDataSet);
    procedure qryImoveisBeforeCancel(DataSet: TDataSet);
    procedure qryImoveisBeforeClose(DataSet: TDataSet);
    procedure qryImoveisAfterClose(DataSet: TDataSet);
    procedure qryProcuraEmpreendimentosAfterScroll(DataSet: TDataSet);
    procedure qryConsultaBlocosAfterScroll(DataSet: TDataSet);
    procedure qryImoveisAfterInsert(DataSet: TDataSet);
    procedure dsrImoveisDataChange(Sender: TObject; Field: TField);
    procedure qryConsultaTiposUnidadesAfterScroll(DataSet: TDataSet);
  private
    FBloco: Integer;
    fSituacaoAnt: TtecSituacaoContratoImoveis;
    FBloqueado: Boolean;
    StateAnt: TDataSetState;
    AtualizarBlocos: Boolean;
    FCancelado: Boolean;
    FEmpreendimento: Integer;
    function GetVendido: Boolean;
    function GetPossuiContrato: Boolean;
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    function GetSituacaoContrato: TtecSituacaoContratoImoveis;
    procedure SetSituacaoContrato(const Value: TtecSituacaoContratoImoveis);

  protected
    FNumeroImovelBloqueado: String;
    FBlocoImovelBloqueado: Integer;
    FUnidadeImovelBloqueado: Integer;
    function  BloquearImoveis(Bloco: Integer; Numero: String; Unidade: Integer): Boolean;
    procedure DesbloquearImoveis; overload;
    procedure DesbloquearImoveis(Bloco: Integer; Numero: String; Unidade: integer); overload;

    { Private declarations }
  public
    { Public declarations }
    Mensagem: String;
    NumeroImovel: String;
    constructor Create(AOwner: TComponent); override;

    procedure AbretabelasSecundarias;
    procedure FechaTabelasSecundarias;
    procedure AbreTabelasConsulta(TipoPesquisa: TtecPesquisa);
    procedure FechaTabelasConsulta(TipoPesquisa: TtecPesquisa);
    procedure Selecionar(TipoPesquisa: TtecPesquisa);
    function  ExisteEmpreendimento(Campo, Codigo : String): Boolean;
    function  ExisteTiposUnidades(Campo, Codigo : String): Boolean;
    function  ExisteBloco(Campo, Codigo : String): Boolean;
    function  ExisteImoveis(Campo, Codigo : String): Boolean;
    function  ExisteNumeroImoveis(Campo, Codigo : String): Boolean;
    procedure RefazConsultaBlocos(Bloco: Integer);
    function  IncluirImovel: Boolean;
    function GravarImovel : Boolean;
    property  ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    property  Empreendimento : Integer read FEmpreendimento write FEmpreendimento;
    property Bloco : Integer read FBloco write FBloco;
    property Vendido : Boolean read GetVendido;
    property Cancelado : Boolean read FCancelado write FCancelado;
    property Bloqueado: Boolean read FBloqueado write FBloqueado;
    property PossuiCOntrato: Boolean read GetPossuiContrato;
    property SituacaoAnt: TtecSituacaoContratoImoveis read fSituacaoAnt write fSituacaoant;
    property SituacaoContrato: TtecSituacaoContratoImoveis read GetSituacaoContrato write SetSituacaoContrato;
    function ExcluirImovel: Boolean;
    function AbrirImoveis: Boolean;
  end;

var
  dtmCadastroImoveis: TdtmCadastroImoveis;

implementation

{$R *.dfm}

procedure TdtmCadastroImoveis.ZMonitor1MonitorEvent(Sql, Result: String);
var Listar: TStringList;
    Arquivo: String;
begin
  inherited;
  Listar := tStringlist.create;
  Arquivo:= 'c:\Lixo\Imoveis.sql';
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);
  listar.free;
end;

procedure TdtmCadastroImoveis.qryImoveisCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryImoveisAreaTotal.AsCurrency:= qryImoveisAreaPrivativa. AsCurrency + qryImoveisAreaComum. AsCurrency;
  qryImoveisTotalArea.AsCurrency:= qryImoveisTotalPrivativa.AsCurrency + qryImoveisTotalComum.AsCurrency;
end;

procedure TdtmCadastroImoveis.AbreTabelasConsulta(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesEMPREENDIMENTOS : qryConsultaEmpreendimentos.Open;
    pesBLOCOS          : qryConsultaBlocos.Open;
    pesNUMEROSIMOVEIS  : qryConsultaNumeroImovel.Open;
    pesIMOVEIS         : qryConsultaImoveis.Open;
    pesTIPOSUnidadeS   : qryConsultaTiposUnidades.Open;
  end;
end;

function TdtmCadastroImoveis.ExisteEmpreendimento(Campo,Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaEmpreendimentos, Campo, Codigo);
end;

procedure TdtmCadastroImoveis.FechaTabelasConsulta(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesEMPREENDIMENTOS : qryConsultaEmpreendimentos.Close;
    pesBLOCOS          : qryConsultaBlocos.Close;
    pesNUMEROSIMOVEIS  : qryConsultaNumeroImovel.Close;
    pesIMOVEIS         : qryConsultaImoveis.Close;
    pesTIPOSUnidadeS   : qryConsultaTiposUnidades.Close;
  end;
end;

procedure TdtmCadastroImoveis.Selecionar(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesEMPREENDIMENTOS  : begin
                            RefazConsultaPorNome(qryProcuraEmpreendimentos,['Codigo'],[qryConsultaEmpreendimentoscodigo.AsVariant]);
                          end;
    pesIMOVEIS          : begin
                            FCancelado:= True;
                            RefazConsultaPorNome(qryImoveis,['Bloco','Imovel','Unidade'],
                                                  [qryConsultaImoveisbloco.AsVariant,
                                                   qryConsultaImoveisnumero.AsVariant,
                                                   qryConsultaImoveisunidade.AsVariant]);
                            FCancelado:= False;
                            RefazConsultaBlocos(qryImoveisEmpreendimento.AsInteger);
                            Empreendimento:= 0;
                            Bloco:= 0;
                            RefazConsultaPorNome(qryProcuraEmpreendimentos,['Codigo'],[qryImoveisEmpreendimento.AsVariant]);
                          end;
    pesTIPOSUnidadeS    : begin
                            RefazConsultaPorNome(qryProcuraTiposUnidades,['Codigo'],[qryConsultaTiposUnidadescodigo.AsVariant]);
                            qryImoveisUnidade.AsInteger:= qryProcuraTiposUnidadescodigo.AsInteger;
                          end;
    pesNUMEROSIMOVEIS   : begin
                            RefazConsultaPorNome(qryImoveis,['Bloco','Imovel'],[qryConsultaBlocoscodigo.AsVariant,
                                                                                qryConsultaNumeroImovelnumero.AsVariant]);
                          end;
  end;
end;

function TdtmCadastroImoveis.ExisteBloco(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaBlocos, Campo, Codigo);
end;

function TdtmCadastroImoveis.ExisteImoveis(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaImoveis, Campo, Codigo);
end;

procedure TdtmCadastroImoveis.qryProcuraImoveisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryImoveis.ParamByName('Bloco').AsInteger         := qryProcuraImoveisbloco.AsInteger;
  qryImoveis.ParamByName('Imovel').AsString        := qryProcuraImoveisnumero.AsString;
  qryImoveis.ParamByName('Unidade').AsInteger        := qryProcuraImoveisUnidade.AsInteger;

  if ((qryImoveis.ParamByName('Bloco').AsInteger > 0) and
      (trim(qryImoveis.ParamByName('Imovel').AsString) <> '') and
      (qryImoveis.ParamByName('unidade').AsInteger > 0)) then
  begin
    qryImoveis.Open;
  end
  else
    IncluirImovel;
end;

function TdtmCadastroImoveis.IncluirImovel: Boolean;
begin
  if (SituacaoContrato in [sciQUITADO, sciVENDIDO]) or FBloqueado then
    DesbloquearImoveis(qryImoveisbloco.AsInteger, qryImoveisNumero.ASString, qryImoveisUnidade.asinteger);
  if qryImoveis.ReadOnly then
    qryImoveis.ReadOnly:= False;
  atualizarBlocos:= False;
  if qryImoveis.State = dsinsert then
    qryImoveis.Cancel;
  atualizarBlocos:= True;
  qryImoveis.Append;
  Result:= True;
end;

procedure TdtmCadastroImoveis.RefazConsultaBlocos(Bloco: Integer);
begin
  RefazConsultaPorNome(qryConsultaBlocos,['Empreendimento'],[Bloco]);
end;

function TdtmCadastroImoveis.GravarImovel: Boolean;
var M: string;
begin
  if (qryImoveis.CheckRequiredFields) then
  begin
    if (qryImoveisAreaPrivativa.AsFloat    >= 0) and
       (qryImoveisAreaComum.    AsFloat    >= 0) and
       (qryImoveisPreco.        AsCurrency >  0) and
       (qryImoveisUnidade.      AsInteger  >  0) and
       (not qryImoveisNumero.   IsNull)
    then begin
      Bloco:= qryConsultaBlocoscodigo.AsInteger;
      FEmpreendimento:= qryprocuraempreendimentoscodigo.asinteger;
      qryImoveisbloco.AsInteger:= Bloco;
      qryImoveis.Post;

      Perpetrar([qryImoveis]);
      Result:= true;
    end
    else
    begin
      M:= '';
      if qryImoveisAreaPrivativa.AsFloat   < 0  then M:= M + 'Área Privativa, ';
      if qryImoveisAreaComum.    AsFloat   < 0  then M:= M + 'Área Comum, ';
      if (qryImoveisNumero.      IsNull) or
         (qryImoveisNumero.      AsString = '') then M:= M + 'Nº do Imóvel, ';
      if qryImoveisPreco.        AsFloat   <= 0 then M:= M + 'Preço do Imóvel, ';
      if qryImoveisUnidade.      AsInteger <= 0 then M:= M + 'Tipo de Unidade, ';
      Delete(M, Length(M)-1,2);
      Mensagem:= M;
      Result:= False;
    end;
  end
  else
    MensagemAviso(ctVALIDARCONTROLES);
end;

procedure TdtmCadastroImoveis.qryImoveisAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryImoveisVendidos,['Bloco','Numero', 'Unidade'],[qryImoveisbloco.AsVariant,
                                                              qryImoveisNumero.AsVariant,
                                                              qryImoveisUnidade.asvariant]);
  qryImoveis.ParamByName('Bloco').AsInteger:= qryConsultaBlocoscodigo.AsInteger;
  qryImoveis.ParamByName('Unidade').AsInteger:= qryConsultaTiposUnidadescodigo.AsInteger;
  if (FBloqueado) and (qryImoveis.RecordCount > 0) then
      MensagemAviso(ctINFORMACAOSENDOEDITADA);
  ReadOnly:= ((dtmCadastroImoveis.SituacaoContrato in [sciVENDIDO,sciQUITADO]) or FBloqueado)
end;

function TdtmCadastroImoveis.GetVendido: Boolean;
begin
  Result:= not qryImoveisVendidos.IsEmpty;
end;

procedure TdtmCadastroImoveis.AbretabelasSecundarias;
begin
  RefazConsultaPorNome(qryVendasImoveis,['Contrato'],[qryImoveisVendidoscontrato.AsVariant]);
  RefazConsultaPorNome(qryCompradores,['Contrato'],[qryImoveisVendidoscontrato.AsVariant]);
  RefazConsultaPorNome(qryOutrosImoveis,['Contrato','Bloco','Numero','Unidade'],[qryImoveisVendidoscontrato.AsVariant,
                                                                       qryImoveisbloco.AsVariant,
                                                                       qryImoveisNumero.AsVariant,
                                                                       qryImoveisUnidade.AsVariant]);
{ RefazConsultaPorNome(qryParcelasContrato,['Contrato'],[qryImoveisVendidoscontrato.AsVariant]);}
end;

procedure TdtmCadastroImoveis.qryImoveisVendidosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  AbretabelasSecundarias;
end;

procedure TdtmCadastroImoveis.qryImoveisVendidosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  AbretabelasSecundarias;
end;

procedure TdtmCadastroImoveis.FechaTabelasSecundarias;
begin
  RefazConsulta(qryVendasImoveis,[],[]);
  RefazConsulta(qryCompradores,[],[]);
  RefazConsulta(qryOutrosImoveis,[],[]);
  RefazConsulta(qryProcuraEmpreendimentos,[],[]);
end;

procedure TdtmCadastroImoveis.qryImoveisVendidosAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  FechaTabelasSecundarias;
end;

procedure TdtmCadastroImoveis.qryImoveisAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qryImoveisVendidos.Cancel;
  qryImoveisVendidos.Close;
  ReadOnly:= False;
end;

function TdtmCadastroImoveis.ExisteTiposUnidades(Campo,
  Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaTiposUnidades, Campo, Codigo);
end;

function TdtmCadastroImoveis.GetPossuiContrato: Boolean;
begin
  Result:= not qryImoveisVendidoscontrato.IsNull;
end;

function TdtmCadastroImoveis.ExcluirImovel: Boolean;
begin
  qryImoveis.Delete;
  try
    perpetrar([qryImoveis]);
  except end;
  FechaTabelasSecundarias;
end;

function TdtmCadastroImoveis.ExisteNumeroImoveis(Campo,
  Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaNumeroImovel, Campo, Codigo);
end;

procedure TdtmCadastroImoveis.qryConsultaNumeroImovelBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaNumeroImovel.ParamByName('Bloco').AsInteger:= qryConsultaBlocoscodigo.AsInteger;
  qryConsultaNumeroImovel.ParamByName('Empreendimento').AsInteger:= qryProcuraEmpreendimentoscodigo.AsInteger;
end;

function TdtmCadastroImoveis.GetReadOnly: Boolean;
begin
  Result:= qryImoveis.ReadOnly;
end;

procedure TdtmCadastroImoveis.SetReadOnly(const Value: Boolean);
begin
  qryImoveis.ReadOnly:= Value;
  qryConsultaTiposUnidades.ReadOnly:= Value;
  qryProcuraTiposUnidades.ReadOnly:= Value;
end;

function TdtmCadastroImoveis.GetSituacaoContrato: TtecSituacaoContratoImoveis;
begin
  if qryImoveisSituacao.AsString = 'R' then
    Result:= sciRESERVADO
  else if qryImoveisSituacao.AsString = 'C' then
    Result:= sciCANCELADO
  else if qryImoveisSituacao.AsString = 'V' then
    Result:= sciVENDIDO
  else if qryImoveisSituacao.AsString = 'Q' then
    Result:= sciQUITADO
  else
    Result:= sciNENHUM;
end;

procedure TdtmCadastroImoveis.SetSituacaoContrato(const Value: TtecSituacaoContratoImoveis);
begin
  if SituacaoContrato <> Value then
  begin
    SituacaoAnt:= SituacaoContrato;
    if SituacaoAnt = sciVendido then
      ReadOnly := False;
    if qryImoveis.State = dsbrowse then
      qryImoveis.Edit;
     case Value of
       sciRESERVADO : qryImoveisSituacao.AsString := 'R';
       sciCANCELADO : qryImoveisSituacao.AsString := 'C';
       sciVENDIDO   : qryImoveisSituacao.AsString := 'V';
       sciQUITADO   : qryImoveisSituacao.AsString := 'Q';
     end;
  end;
end;

function TdtmCadastroImoveis.BloquearImoveis(Bloco: Integer;
  Numero: String; Unidade: Integer): Boolean;
begin
  ReFazConsultaPorNome(qryBloquearImoveis, ['Bloco','Numero','Unidade'], [Bloco, Numero, Unidade]);
  Result := (qryBloquearImoveis.RecordCount > 0) and (qryBloquearImoveislock.AsInteger = 1);
  FBloqueado := Not Result;
end;

procedure TdtmCadastroImoveis.DesbloquearImoveis;
begin
  DesbloquearImoveis(qryImoveisBloco.ASInteger, qryImoveisNumero.AsString, qryImoveisUnidade.asinteger);
end;

procedure TdtmCadastroImoveis.DesbloquearImoveis(Bloco: Integer; Numero: String; Unidade: Integer);
begin
  RefazConsultaPorNome(qryDesbloquearImoveis, ['Bloco','Numero','Unidade'], [Bloco, Numero, Unidade]);
  FBloqueado := False
end;

procedure TdtmCadastroImoveis.qryImoveisBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not FCancelado then
  begin
    qryImoveis.ParamByName('Bloco').AsInteger := qryConsultaBlocoscodigo.AsInteger;
    qryImoveis.ParamByName('Unidade').AsInteger := qryConsultaTiposUnidadescodigo.AsInteger;
  end;

  if ((qryImoveis.Params[0].AsInteger > 0) and
      (Trim(qryImoveis.Params[1].AsString) <> '') and
      (qryImoveis.Params[2].AsInteger > 0)) then
    BloquearImoveis(qryImoveis.Params[0].AsInteger,
                    qryImoveis.Params[1].AsString,
                    qryImoveis.Params[2].Asinteger);
  ReadOnly := FBloqueado;
end;

procedure TdtmCadastroImoveis.qryImoveisBeforeCancel(DataSet: TDataSet);
begin
  inherited;
  if AtualizarBlocos then
    qryConsultaBlocos.Close;
  StateAnt:= qryImoveis.State;
end;

procedure TdtmCadastroImoveis.qryImoveisBeforeClose(DataSet: TDataSet);
begin
  inherited;
  FNumeroImovelBloqueado:= qryImoveisNumero.AsString;
  FBlocoImovelBloqueado :=  qryImoveisbloco.AsInteger;
  FUnidadeImovelBloqueado := qryImoveisUnidade.AsInteger;
end;

procedure TdtmCadastroImoveis.qryImoveisAfterClose(DataSet: TDataSet);
begin
  inherited;
  DesbloquearImoveis(FBlocoImovelBloqueado,FNumeroImovelBloqueado, fUnidadeImovelBloqueado);
  ReadOnly:= False;
end;

procedure TdtmCadastroImoveis.qryProcuraEmpreendimentosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryConsultaBlocos,['Empreendimento'],
  [qryProcuraEmpreendimentoscodigo.AsVariant]);
  
end;

constructor TdtmCadastroImoveis.Create(AOwner: TComponent);
begin
  inherited;
  FEmpreendimento:= 0;
  qryProcuraEmpreendimentos.Tag := ctTabelas;
  qryConsultaTiposUnidades.Tag := cttabelas;
end;

procedure TdtmCadastroImoveis.qryConsultaBlocosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryImoveis.ParamByName('Bloco').AsInteger:= qryConsultaBlocoscodigo.AsInteger;
end;

procedure TdtmCadastroImoveis.qryImoveisAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryImoveisSituacao.AsString:= 'D';
  qryImoveisbloco.AsInteger:= qryConsultaBlocoscodigo.AsInteger;
  qryImoveisUnidade.AsInteger:= qryConsultaTiposUnidadescodigo.AsInteger;  

end;

procedure TdtmCadastroImoveis.dsrImoveisDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryImoveisUnidade then
  begin
    if not (qryImoveis.State in [dsinsert, dsedit]) then
      qryImoveis.Edit;
  end;
end;

function TdtmCadastroImoveis.AbrirImoveis: Boolean;
begin
  if ((qryImoveisEmpreendimento.AsInteger <> qryProcuraEmpreendimentoscodigo.AsInteger) or
      (qryImoveisbloco.OldValue <> qryConsultaBlocoscodigo.AsInteger) or
      (qryImoveisUnidade.OldValue <> qryConsultaTiposUnidadescodigo.AsInteger)) and
     (qryImoveisEmpreendimento.AsInteger > 0)   then
    RefazConsulta(qryImoveis,[0,1,2],[qryConsultaBlocoscodigo.AsVariant,
                                    NumeroImovel,
                                     qryConsultaTiposUnidadescodigo.AsVariant]);
  if (NumeroImovel <> '') and (qryImoveis.RecordCount = 0) and not (qryImoveis.State = dsinsert) then
    IncluirImovel;
end;

procedure TdtmCadastroImoveis.qryConsultaTiposUnidadesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryImoveis.ParamByName('Unidade').AsInteger:= qryConsultaTiposUnidadescodigo.AsInteger;
end;

end.
