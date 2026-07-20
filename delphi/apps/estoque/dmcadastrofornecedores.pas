unit dmcadastrofornecedores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, dmtecsoft, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  biblio, ctConstantes, ZTransact, StrUtils,
  BaseGrid, AdvGrid, DBAdvGrid;

type
  TdtmCadastroFornecedores = class(TdtmBasico)
    qryFornecedores: TtecQuery;
    qryFornecedoresnome: TStringField;
    qryFornecedoresrazao: TStringField;
    qryFornecedorespessoatipo: TStringField;
    qryFornecedoresrua: TStringField;
    qryFornecedoresbairro: TIntegerField;
    qryFornecedorescidade: TIntegerField;
    qryFornecedoresestado: TStringField;
    qryFornecedorescep: TIntegerField;
    qryFornecedoresfoneddd: TIntegerField;
    qryFornecedoresfonenumero: TIntegerField;
    qryFornecedoresfaxddd: TIntegerField;
    qryFornecedoresfaxnumero: TIntegerField;
    qryFornecedoresinscricaoestadual: TStringField;
    qryFornecedorescontato: TStringField;
    qryFornecedoresdebito: TIntegerField;
    qryFornecedorescredito: TIntegerField;
    qryFornecedoresemail: TStringField;
    qryFornecedoresinativo: TDateField;
    qryFornecedoresnomecidade: TStringField;
    qryFornecedoresnomebairro: TStringField;
    dsrFornecedores: TtecDataSource;
    spcProximoFornecedor: TtecQuery;
    spcProximoFornecedorcodigo: TIntegerField;
    qrySeriesFornecedores: TtecQuery;
    qrySeriesFornecedoresfornecedor: TIntegerField;
    qrySeriesFornecedoresserie: TStringField;
    dsrSeriesFornecedores: TtecDataSource;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedorespessoanumero: TStringField;
    qryFornecedoresobservacoes: TStringField;
    qryFornecedoresgrupofornecedor: TIntegerField;
    qryProcuraGruposFornecedores: TtecQuery;
    dsrProcuraGruposFornecedores: TtecDataSource;
    qryConsultaGruposFornecedores: TtecQuery;
    qryConsultaGruposFornecedorescodigo: TIntegerField;
    qryConsultaGruposFornecedoresnome: TStringField;
    qryProcuraGruposFornecedorescodigo: TIntegerField;
    qryFornecedorCadastrado: TtecQuery;
    qryFornecedorCadastradocodigo: TIntegerField;
    qryFornecedorCadastradonome: TStringField;
    qryFornecedoresmarkup: TFloatField;
    qryExisteFornecedorSerieNotasPag: TtecQuery;
    qryFornecedoresenderecoalterado: TDateField;
    qryFornecedoresGrupos: TtecQuery;
    dsrFornecedoresGrupos: TtecDataSource;
    qryProcuraGrupos: TtecQuery;
    dsrProcuraGrupos: TtecDataSource;
    qryConsultaGrupos: TtecQuery;
    qryConsultaGruposdescricao: TStringField;
    qryFornecedoresGruposfornecedor: TIntegerField;
    qryFornecedoresGruposdescricao: TStringField;
    qryFornecedoresGruposgrupo: TStringField;
    qryConsultaGruposcodigo: TStringField;
    qryProcuraGruposcodigo: TStringField;
    qryProcuraGruposdescricao: TStringField;
    qryFornecedoresGruposclasse: TStringField;
    qryFornecedoresGruposdescricao_classe: TStringField;
    qryProcuraClasses: TtecQuery;
    dsrProcuraClasses: TtecDataSource;
    qryProcuraClassescodigo: TStringField;
    qryProcuraClassesdescricao: TStringField;
    qryConsultaClasses: TtecQuery;
    qryConsultaClassesdescricao: TStringField;
    qryConsultaClassescodigo: TStringField;
    qryGrupoClasseJaCadastrado: TtecQuery;
    qryGrupoClasseJaCadastradoQtde: TLargeintField;
    qryFornecedoresnosimples: TBooleanField;
    qryProcuraGruposFornecedoresnome: TStringField;
    qryContatosFornecedores: TtecQuery;
    dsrContatosFornecedores: TtecDataSource;
    qryContatosCargos: TtecQuery;
    dsrContatosCargos: TtecDataSource;
    qryContatosCargoscodigo: TIntegerField;
    qryContatosCargoscontato: TStringField;
    qryContatosCargostelefone: TStringField;
    qryContatosCargosemail: TStringField;
    qryContatosCargosobservacoes: TStringField;
    qryContatosCargoscodigovfornecedores: TIntegerField;
    qryContatosCargostipovfornecedores: TStringField;
    qryContatosCargoscargo: TIntegerField;
    qryContatosFornecedorescodigo: TIntegerField;
    qryContatosFornecedorescontato: TStringField;
    qryContatosFornecedoresfonenumero: TIntegerField;
    qryContatosFornecedoresfoneddd: TIntegerField;
    qryContatosFornecedoresemail: TStringField;
    qryContatosFornecedorescodigovfornecedores: TIntegerField;
    qryContatosFornecedorestipovfornecedores: TStringField;
    qryContatosFornecedorescargo: TIntegerField;
    qryContatosFornecedoresdescricaocargo: TStringField;
    qryContatosFornecedoresobservacoes: TStringField;
    qryContatosFornecedoresfoneramal: TStringField;
    spccontatosfornecedoresproximocodigo: TtecQuery;
    spccontatosfornecedoresproximocodigocodigo: TIntegerField;
    qryFornecedorescontribicms: TBooleanField;
    qryFornecedoresnumero: TIntegerField;
    qryFornecedorescomplemento: TStringField;
    qryFornecedoresrntc: TStringField;
    qryFornecedoressuframa: TStringField;
    qryIESubstTributario: TtecQuery;
    qryIESubstTributariocliente: TIntegerField;
    qryIESubstTributariotipocliente: TStringField;
    qryIESubstTributarioestado: TStringField;
    qryIESubstTributarioinscricaoestadual: TStringField;
    qryFornecedoresfornecedorparaiss: TBooleanField;
    qryFornecedoressite: TStringField;
    qryFornecedoresadiantamento: TIntegerField;
    qrySeriesFornecedoresmodelodoctofiscal: TStringField;
    qryFornecedoreshistoricocontabil: TIntegerField;
    qryFornecedorestipofornec_produto_l: TBooleanField;
    qryFornecedorestipofornec_tranporte_l: TBooleanField;
    qryFornecedorestipofornec_montagem_l: TBooleanField;
    qryUpdateTipFornecedor: TtecQuery;
    qryFornecedoresnaosubstituto: TBooleanField;
    qryFornecedoresdistribuidor: TBooleanField;
    qryFornecedoresinscricaomunicipal: TStringField;
    qryFornecedorescrt: TIntegerField;
    qryFornecedoreshistoricocontabilpagtoduplicata: TIntegerField;
    qryFornecedoresfichaalerta: TStringField;
    qryContatosFornecedoresreceberemailmarketing: TBooleanField;
    qryFornecedorestipofornec_maoobra_l: TBooleanField;
    qryObras_Fornecedores: TtecQuery;
    dsrObras_Fornecedores: TtecDataSource;
    qryObras_Fornecedorescno: TStringField;
    qryObras_Fornecedoresdescricao: TStringField;
    qryfornecedor_infoProcRetPr: TtecQuery;
    dsrfornecedor_infoProcRetPr: TtecDataSource;
    qryfornecedor_infoProcRetPrfornecedor: TIntegerField;
    qryfornecedor_infoProcRetPrprocessojudicial: TIntegerField;
    qryfornecedor_infoProcRetPrnumerosuspensaoexibilidadetributos: TIntegerField;
    qryfornecedor_infoProcRetPrnrproc: TStringField;
    qryfornecedor_infoProcRetPrcodsusp: TStringField;
    qryfornecedor_infoProcRetAd: TtecQuery;
    dsrfornecedor_infoProcRetAd: TtecDataSource;
    qryfornecedor_infoProcRetAdfornecedor: TIntegerField;
    qryfornecedor_infoProcRetAdprocessojudicial: TIntegerField;
    qryfornecedor_infoProcRetAdnumerosuspensaoexibilidadetributos: TIntegerField;
    qryfornecedor_infoProcRetAdnrproc: TStringField;
    qryfornecedor_infoProcRetAdcodsusp: TStringField;
    qryFornecedoresindcprb: TIntegerField;
    qryObras_Fornecedorescliente: TIntegerField;
    qryObras_Fornecedorestipocliente: TStringField;
    qryObras_Fornecedorestpinscestabindobra: TIntegerField;
    qryfornecedor_infoProcRetPrtipofornecedor: TStringField;
    qryfornecedor_infoProcRetAdtipofornecedor: TStringField;
    qryContatosFornecedoresenviar_nfe: TBooleanField;
    qryContatosFornecedoresenviar_boleto: TBooleanField;
    qryFornecedoresdda: TBooleanField;
    qryFornecedoresdda_anterior: TBooleanField;
    qryFornecedoresconfirmacaodda: TBooleanField;
    qryAtualizarDuplicatas: TtecQuery;
    qryAtendimentosAlertas: TtecQuery;
    qryAtendimentosAlertasalertas: TMemoField;
    dsrAtendimentosAlertas: TtecDataSource;
    qryFornecedoresdatahoraconferenciacadastro: TDateTimeField;
    qryFornecedoresultimaalteracao: TDateField;
    qryFornecedoresemailrecebxmlnfe: TStringField;
    qryFornecedorespoliticatroca: TStringField;
    qryLimitesEntregaFornecedores: TtecQuery;
    dsrLimitesEntregaFornecedores: TtecDataSource;
    qryLimitesEntregaFornecedoresfornecedor: TIntegerField;
    qryLimitesEntregaFornecedoresdia_da_semana: TIntegerField;
    qryLimitesEntregaFornecedoresperiodo: TIntegerField;
    qryLimitesEntregaFornecedoresquantidade: TIntegerField;
    qryLimitesEntregaFornecedoresdescricaoperiodo: TStringField;
    qryLimitesEntregaFornecedoresdescricaosemana: TStringField;
    qrySemana: TtecQuery;
    qrySemanacodigo: TIntegerField;
    qrySemanadescricao: TStringField;
    dsrSemana: TtecDataSource;
    qryperiodosentrega: TtecQuery;
    dsrperiodosentrega: TtecDataSource;
    qryperiodosentregacodigo: TIntegerField;
    qryperiodosentregadescricao: TStringField;
    qryperiodosentregahorapadrao: TTimeField;
    qryperiodosentregainativo: TDateField;
    qryperiodosentregainicio: TTimeField;
    qryperiodosentregafim: TTimeField;
    qryRestricoes_Vigilancia_Sanitaria: TtecQuery;
    dsrRestricoes_Vigilancia_Sanitaria: TtecDataSource;
    qryRestricoes_Vigilancia_Sanitariacodigo_fornecedor: TIntegerField;
    qryRestricoes_Vigilancia_Sanitariacodigo_classificacao: TIntegerField;
    qryRestricoes_Vigilancia_Sanitariadescricao_classificacao: TStringField;
    qryFornecedoresestrangeiro: TBooleanField;
    procedure qrySeriesFornecedoresBeforeEdit(DataSet: TDataSet);
    procedure qrySeriesFornecedoresBeforeInsert(DataSet: TDataSet);
    procedure qryFornecedoresAfterScroll(DataSet: TDataSet);
    procedure qrySeriesFornecedoresAfterDelete(DataSet: TDataSet);
    procedure dsrSeriesFornecedoresDataChange(Sender: TObject; Field: TField);
    procedure qrySeriesFornecedoresAfterPost(DataSet: TDataSet);
    procedure qrySeriesFornecedoresAfterScroll(DataSet: TDataSet);
    procedure dsrFornecedoresDataChange(Sender: TObject; Field: TField);
    procedure qryFornecedoresGruposgrupoChange(Sender: TField);
    procedure qryFornecedoresGruposAfterDelete(DataSet: TDataSet);
    procedure qryFornecedoresGruposclasseChange(Sender: TField);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryContatosFornecedoresNewRecord(DataSet: TDataSet);
    procedure qryContatosFornecedoresBeforeInsert(DataSet: TDataSet);
    procedure qryContatosFornecedoresAfterPost(DataSet: TDataSet);
    procedure qryContatosFornecedoresAfterDelete(DataSet: TDataSet);
    procedure qryContatosFornecedoresBeforePost(DataSet: TDataSet);
    procedure qryIESubstTributarioAfterPost(DataSet: TDataSet);
    procedure qryIESubstTributarioAfterDelete(DataSet: TDataSet);
    procedure qryFornecedoresNewRecord(DataSet: TDataSet);
    procedure qryObras_FornecedoresAfterPost(DataSet: TDataSet);
    procedure qryObras_FornecedoresAfterDelete(DataSet: TDataSet);
    procedure qryfornecedor_infoProcRetPrAfterDelete(DataSet: TDataSet);
    procedure qryfornecedor_infoProcRetPrAfterPost(DataSet: TDataSet);
    procedure qryfornecedor_infoProcRetAdAfterDelete(DataSet: TDataSet);
    procedure qryfornecedor_infoProcRetAdAfterPost(DataSet: TDataSet);
    procedure qryObras_FornecedoresAfterInsert(DataSet: TDataSet);
    procedure qryObras_FornecedoresNewRecord(DataSet: TDataSet);
    procedure qryfornecedor_infoProcRetPrNewRecord(DataSet: TDataSet);
    procedure qryfornecedor_infoProcRetAdNewRecord(DataSet: TDataSet);
    procedure qryFornecedoresBeforePost(DataSet: TDataSet);
    procedure qryLimitesEntregaFornecedoresNewRecord(DataSet: TDataSet);
    procedure qryLimitesEntregaFornecedoresAfterDelete(DataSet: TDataSet);
    procedure qryLimitesEntregaFornecedoresAfterPost(DataSet: TDataSet);
    procedure qryRestricoes_Vigilancia_SanitariaAfterDelete(
      DataSet: TDataSet);
    procedure qryRestricoes_Vigilancia_SanitariaAfterPost(
      DataSet: TDataSet);
    procedure qryRestricoes_Vigilancia_SanitariaAfterInsert(
      DataSet: TDataSet);
  protected
    FSerieFornecedorAntesEdicao: String;
    function GrupoClasseJaCadastrados: Boolean;
    function GetTipoPessoa: String;
    function GetEstadoFornecedor: String;
    function GetConsultaGruposFornecedores: TtecQuery;
    function GetTabelaSeriesEmpty: Boolean;
    function GetTabelaFornecedor: TtecQuery;
    function GetExisteFornecedorSerie: Boolean;
    function GetTabelaFornecedoresGrupos: TtecQuery;
    function GetConsultaGrupos: TtecQuery;
    function GetConsultaClasses: TtecQuery;
    function GetInserindo: Boolean;
    function GetTabelaFornecedorVazia: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbrirTabelasConsulta(Pesquisa:TtecPesquisa);
    procedure FecharTabelasConsulta(Pesquisa:TtecPesquisa);
    function  FornecedorJaCadastrado(Numero: String): Boolean;
    procedure PosicionarTabelas(Pesquisa: TtecPesquisa);
    procedure ExcluirSeriesFornecedores;
    function  ExisteGrupos(Campo, codigo: String): Boolean;
    function  ExisteClasses(Campo, codigo: String): Boolean;
    function  ExisteGrupoFornecedore(campo, codigo: string): boolean;
    function  IncluirFornecedor: Boolean;
    function  IncluirContatoFornecedor: Boolean;
    function  IncluirFornecedoresGrupos(Editando: Boolean): Boolean;
    function  ExcluirFornecedor: Boolean;
    function  ExcluirFornecedoresContatos: Boolean;
    function  ExcluirFornecedoresGrupos: Boolean;
    function  GravarFornecedor: Boolean;
    function  GravarFornecedoresGrupos: Boolean;
    function  VerificaSerieFornecedor: Boolean;
    procedure AtualizaSerieFornecedor;
    property  TabelaSeriesEmpty: Boolean read GetTabelaSeriesEmpty;
    property  TabelaFornecedor: TtecQuery read GetTabelaFornecedor;
    property  TabelaFornecedoresGrupos: TtecQuery read GetTabelaFornecedoresGrupos;
    property  ConsultaGruposFornecedores: TtecQuery read GetConsultaGruposFornecedores;
    property  ConsultaGrupos: TtecQuery read GetConsultaGrupos;
    property  ConsultaClasses: TtecQuery read GetConsultaClasses;
    property  EstadoFornecedor: String read GetEstadoFornecedor;
    property  TipoPessoa: String read GetTipoPessoa;
    property  SerieFornecedorAntesEdicao: String read FSerieFornecedorAntesEdicao write FSerieFornecedorAntesEdicao;
    property  ExisteFornecedorSerie: Boolean read GetExisteFornecedorSerie;
    property  Inserindo: Boolean read GetInserindo;
    property  TabelaFornecedorVazia: Boolean read GetTabelaFornecedorVazia;
    procedure ReFazConsultaFornecedor(Codigo:Integer);
    procedure AtribuirDadosSuspensaoExibilidadeTributos_pr(qrySuspensaoExibilidadeTributos:TtecQuery);
    procedure AtribuirDadosSuspensaoExibilidadeTributos_ad(qrySuspensaoExibilidadeTributos:TtecQuery);
    procedure AtribuirDadosClassificacao_Vigilancia_Sanitaria(qryProcuraClassificacao_Vigilancia_Sanitaria:TtecQuery);

  end;

var
  dtmCadastroFornecedores: TdtmCadastroFornecedores;

implementation

uses clparametrossistema;

var
  aSeriesFornecedores: array of record
  Serie: String
end;



{$R *.dfm}

{ TdtmCadastroFornecedores }

constructor TdtmCadastroFornecedores.Create(AOwner: TComponent);
begin
  inherited;
  qryFornecedores.Tag               := ctTabelas;
  qrySeriesFornecedores.Tag         := ctTabelas;
  qryFornecedoresGrupos.Tag         := ctTabelas;
//qryConsultaFornecedor.Tag         := ctTabelasFornecedoresConsulta;
  qryConsultaGruposFornecedores.Tag := ctConsultaGruposFornecedores;
  qryConsultaGrupos.Tag             := ctConsultaGrupos;
  qryConsultaClasses.Tag            := ctConsultaClasses;
  qryFornecedorespessoanumero.Required := ParSistema.CPF_CNPJObrigatorio;
  qryFornecedoresemail.Required := Parsistema.EmailObrigatorio;


  qrySemana.close;
  qrySemana.open;

  qryperiodosentrega.close;
  qryperiodosentrega.open;

  
end;

function TdtmCadastroFornecedores.ExcluirFornecedor: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o FORNECEDOR'])) = smbOk then begin
    if not qryFornecedores.IsEmpty then begin
      qryFornecedores.Delete;
      Perpetrar([qrySeriesFornecedores,qryFornecedores]);
      Result := True;
    end;
  end;
end;

function TdtmCadastroFornecedores.ExcluirFornecedoresGrupos: Boolean;
begin
  Result:= False;
  if not qryFornecedoresGrupos.IsEmpty then begin
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o GRUPO'])) = smbOk then begin
      qryFornecedoresGrupos.Delete;
      Result := True;
    end;
  end;
end;

procedure TdtmCadastroFornecedores.ExcluirSeriesFornecedores;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a SÉRIE'])) = smbOk then begin
    if not qrySeriesFornecedores.IsEmpty then begin
      qryFornecedores.Edit;
      qrySeriesFornecedores.Delete;
    end;  
  end;
end;

{
function TdtmCadastroFornecedores.ExisteFornecedor(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaFornecedor, campo, codigo);
end;
}

function TdtmCadastroFornecedores.ExisteGrupos(Campo, codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGrupos, campo, codigo);
end;

function TdtmCadastroFornecedores.ExisteClasses(Campo, codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaClasses, campo, codigo);
end;

{
function TdtmCadastroFornecedores.GetConsultaFornecedores: TTecQuery;
begin
  Result:= qryConsultaFornecedor;
end;
}

function TdtmCadastroFornecedores.GetTabelaFornecedor: TtecQuery;
begin
  Result:= qryFornecedores;
end;

function TdtmCadastroFornecedores.GravarFornecedor: Boolean;
var
I, C : Integer;

  function ValidarCampoInscricaoEstadual: boolean;
  begin
    if (qryFornecedorespessoatipo.AsString = 'J') then
    begin
      if not PossuiSomenteNumero(qryFornecedoresinscricaoestadual.AsString) and (trim(qryFornecedoresinscricaoestadual.AsString)<>'') then
      begin
        result := false;
        MensagemErro('O campo Inscricão Estadual só pode conter caracteres numéricos');
      end
      else
       result := true;
    end
    else
      result := true;
  end;

begin
  Result:= False;
  qryFornecedoresinscricaoestadual.Required := qryFornecedorescontribicms.AsBoolean;

  result :=  qryFornecedores.CheckRequiredFields;

  if result then
    result := ValidarCampoInscricaoEstadual;


  if result then
    result := qryObras_Fornecedores.CheckRequiredFields;

  if result then
    result := qryfornecedor_infoProcRetPr.CheckRequiredFields;

  if result then
    result := qryfornecedor_infoProcRetAd.CheckRequiredFields;


  if result then
    result := qryRestricoes_Vigilancia_Sanitaria.CheckRequiredFields(True,false,true,self.owner, true, true);

  if result then
    result := qryLimitesEntregaFornecedores.CheckRequiredFields(true, false, true, self.owner, true, true);

  if result then begin
    qryUpdateTipFornecedor.Sql.Clear;

    Result:= not FornecedorJaCadastrado(qryFornecedorespessoanumero.AsString);
    if Result then
    begin
      if qryFornecedores.State = dsInsert then begin
        spcProximoFornecedor.Open;
        qryFornecedoresCodigo.AsInteger:= spcProximoFornecedorCodigo.AsInteger;
        spcProximoFornecedor.Close;
      end;

      qrySeriesFornecedores.First;
      for I := 1 to qrySeriesFornecedores.RecordCount do
      begin
        if qrySeriesFornecedoresfornecedor.IsNull or
           not qrySeriesFornecedoresserie.ReadOnly then
        begin
           qrySeriesFornecedores.Edit;
           qrySeriesFornecedoresFornecedor.AsInteger:= qryFornecedoresCodigo.AsInteger;
           qrySeriesFornecedores.Post;
        end;
        qrySeriesfornecedores.Next
      end;

      qryLimitesEntregaFornecedores.First;
      for I := 1 to qryLimitesEntregaFornecedores.RecordCount do
      begin
        if qryLimitesEntregaFornecedoresfornecedor.IsNull or
           not qryLimitesEntregaFornecedores.ReadOnly then
        begin
           qryLimitesEntregaFornecedores.Edit;
           qryLimitesEntregaFornecedoresfornecedor.AsInteger := qryFornecedoresCodigo.AsInteger;
           qryLimitesEntregaFornecedores.Post;
        end;
        qryLimitesEntregaFornecedores.Next
      end;

      qryContatosFornecedores.First;
      for C:= 1 to qryContatosFornecedores.RecordCount do
      begin
        if qryContatosFornecedorescodigovfornecedores.IsNull then
        begin
          qryContatosFornecedores.Edit;
          qryContatosFornecedorescodigovfornecedores.AsInteger := qryFornecedorescodigo.asInteger;
          qryContatosFornecedores.Post;
        end;
        qryContatosFornecedores.next;
      end;

      if not qryIESubstTributario.IsEmpty then
      begin
         qryIESubstTributario.First;
         while not qryIESubstTributario.Eof do
         begin
           qryIESubstTributario.Edit;
           qryIESubstTributariocliente.AsInteger := qryFornecedorescodigo.AsInteger;
           qryIESubstTributariotipocliente.AsString := 'F';
           qryIESubstTributario.Post;
           qryIESubstTributario.Next;
         end;
      end;

{      if qryFornecedoresinscricaoestadual.AsString = '' then
        qryFornecedoresinscricaoestadual.AsString := 'ISENTO';}

      if qryFornecedoresconfirmacaodda.asBoolean then
      begin
        RefazConsultaPorNome(qryAtualizarDuplicatas,
                  ['ValorDDA','fornecedor','TipoFornecedor'],
                  [qryFornecedoresdda.AsBoolean, qryfornecedorescodigo.asinteger, 'F']);
        qryAtualizarDuplicatas.ExecSql;
      end;

      qryFornecedores.Post;

      AtribuirChave(qryObras_Fornecedores, [qryObras_Fornecedorescliente], [qryFornecedorescodigo]);

      AtribuirChave(qryfornecedor_infoProcRetPr, [qryfornecedor_infoProcRetPrfornecedor], [qryFornecedorescodigo]);

      AtribuirChave(qryfornecedor_infoProcRetAd, [qryfornecedor_infoProcRetAdfornecedor], [qryFornecedorescodigo]);

      AtribuirChave(qryRestricoes_Vigilancia_Sanitaria, [qryRestricoes_Vigilancia_Sanitariacodigo_fornecedor], [qryFornecedorescodigo]);


      result := Perpetrar([qryFornecedores, qrySeriesFornecedores, qryFornecedoresGrupos,
                 qryContatosFornecedores, qryIESubstTributario, qryUpdateTipFornecedor,
                 qryObras_Fornecedores, qryfornecedor_infoProcRetPr, qryfornecedor_infoProcRetAd,
                 qryAtualizarDuplicatas, qryLimitesEntregaFornecedores, qryRestricoes_Vigilancia_Sanitaria]);

      if result then
      begin
        qryUpdateTipFornecedor.Sql.Append('update fornecedores set tipofornecimento[0] = '+
          ifthen(qryFornecedorestipofornec_produto_l.AsBoolean,'''P''','''''')+' where codigo  = '+qryFornecedorescodigo.AsString+';');

        qryUpdateTipFornecedor.Sql.Append('update fornecedores set tipofornecimento[1] = '+
          ifthen(qryFornecedorestipofornec_tranporte_l.AsBoolean,'''T''','''''')+' where codigo  = '+qryFornecedorescodigo.AsString+';');

        qryUpdateTipFornecedor.Sql.Append('update fornecedores set tipofornecimento[2] = '+
          ifthen(qryFornecedorestipofornec_montagem_l.AsBoolean,'''M''','''''')+' where codigo  = '+qryFornecedorescodigo.AsString+';');

        qryUpdateTipFornecedor.Sql.Append('update fornecedores set tipofornecimento[3] = '+
          ifthen(qryFornecedorestipofornec_maoobra_l.AsBoolean,'''O''','''''')+' where codigo  = '+qryFornecedorescodigo.AsString+';');

        qryUpdateTipFornecedor.ExecSql;

        Perpetrar([]);

      end;


      Result:= True;
    end;
  end;
end;

function TdtmCadastroFornecedores.GravarFornecedoresGrupos: Boolean;
begin
  Result:= False;
  if qryFornecedoresGrupos.CheckRequiredFields then begin
    if not GrupoClasseJaCadastrados then begin
      qryFornecedoresGrupos.Post;

(*      qryFornecedoresGrupos.First;
      for I:= 1 to qryFornecedoresGrupos.RecordCount do begin
        if qryFornecedoresGruposfornecedor.IsNull then begin
          qryFornecedoresGrupos.Edit;
          qryFornecedoresGruposfornecedor.AsInteger:= qryFornecedoresCodigo.AsInteger;
          qryFornecedoresGrupos.Post;
        end;
        qryFornecedoresGrupos.Next;
      end;  *)

      Perpetrar([qryFornecedoresGrupos]);
      qryFornecedores.Edit;
      Result:= True;
    end
    else
      MensagemAviso('O Grupo/Classe (' + qryFornecedoresGruposgrupo.AsString  + ' / ' +
                                         qryFornecedoresGruposclasse.AsString +
                                         ') já foram definidos para este fornecedor.');
  end;
end;

function TdtmCadastroFornecedores.GrupoClasseJaCadastrados: Boolean;
begin
  ReFazConsulta(qryGrupoClasseJaCadastrado,[0,1,2],[qryFornecedoresGruposfornecedor.AsInteger,
                                                    qryFornecedoresGruposgrupo.AsString,
                                                    qryFornecedoresGruposclasse.AsString]);
  Result:= (qryGrupoClasseJaCadastradoQtde.AsInteger > 0);
end;

function TdtmCadastroFornecedores.IncluirFornecedor: Boolean;
begin
  qryFornecedores.Insert;
  qryFornecedorespessoatipo.AsString:= 'J';
  qryFornecedorestipofornec_produto_l.AsBoolean:= true;
  qryFornecedorestipofornec_tranporte_l.AsBoolean:= false;
  qryFornecedorestipofornec_montagem_l.AsBoolean:= false;

  qryFornecedoresnosimples.AsBoolean := False;
  Result:= True;
end;

function TdtmCadastroFornecedores.IncluirFornecedoresGrupos(Editando: Boolean): Boolean;

  procedure Grupos(Editando: Boolean);
  var
    Campos : String;
    Coluna : String;
    Pos    : TBookmark;
  begin
    Campos := '';
    Coluna := qryFornecedoresGruposgrupo.AsString;
    qryFornecedoresGrupos.DisableControls;
    Pos:= qryFornecedoresGrupos.GetBookmark;
    try
      qryFornecedoresGrupos.First;
      while not qryFornecedoresGrupos.Eof do begin
        if (qryFornecedoresGruposgrupo.AsString <> '') then begin
          if not Editando then
            Campos := Campos + '' + QuotedStr(qryFornecedoresGruposgrupo.AsString) + ','
          else if (qryFornecedoresGruposgrupo.AsString <> Coluna) then
            Campos := Campos + '' + QuotedStr(qryFornecedoresGruposgrupo.AsString) + ',';
        end;
        qryFornecedoresGrupos.Next;
      end;
    finally
      qryFornecedoresGrupos.GotoBookmark(Pos);
      qryFornecedoresGrupos.FreeBookmark(Pos);
      qryFornecedoresGrupos.EnableControls;
      Delete(Campos,Length(Campos),1);
      if Campos = '' then Campos:= '0';
    end;
    qryProcuraGrupos.Sql[04] := Format('and not (g.codigo in (%s))', [Campos]);
    qryConsultaGrupos.Sql[03]:= Format('Where not (g.codigo in (%s))', [Campos]);
  end;

begin
  if not qryFornecedoresGrupos.IsEmpty and Editando then begin
//    Grupos(Editando);
    qryFornecedoresGrupos.Params[0].AsString:= qryFornecedorescodigo.AsString;
    qryFornecedoresGrupos.Edit;
    qryFornecedoresGrupos.Cancel;
  end
  else begin
//    Grupos(Editando);
    qryFornecedoresGrupos.Params[0].Clear;
    qryFornecedoresGrupos.Append;
    qryFornecedoresGruposfornecedor.AsInteger:= qryFornecedorescodigo.AsInteger;
  end;
  Result:= True;
end;

procedure TdtmCadastroFornecedores.qrySeriesFornecedoresAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if qryFornecedores.State = dsBrowse then
    qryFornecedores.Edit;
  AtualizaSerieFornecedor;
end;

procedure TdtmCadastroFornecedores.qrySeriesFornecedoresBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if qryFornecedores.State = dsBrowse then
   qryFornecedores.Edit;
  SerieFornecedorAntesEdicao := qrySeriesFornecedoresserie.AsString;
end;

procedure TdtmCadastroFornecedores.qrySeriesFornecedoresBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.qryFornecedoresAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qrySeriesFornecedores,[0],[qryFornecedorescodigo.AsInteger]);
  ReFazConsulta(qryFornecedoresGrupos,[0],[qryFornecedorescodigo.AsInteger]);
  RefazConsulta(qryContatosFornecedores,[0],[qryFornecedorescodigo.AsInteger]);
  RefazConsulta(qryIESubstTributario,[0],[qryFornecedorescodigo.AsInteger]);


  RefazConsultaPorNome(qryLimitesEntregaFornecedores,['fornecedor'],[qryFornecedorescodigo.AsInteger]);
  RefazConsultaPorNome(qryObras_Fornecedores,['fornecedor'],[qryFornecedorescodigo.AsInteger]);
  RefazConsultaPorNome(qryfornecedor_infoProcRetPr,['fornecedor'],[qryFornecedorescodigo.AsInteger]);
  RefazConsultaPorNome(qryfornecedor_infoProcRetAd,['fornecedor'],[qryFornecedorescodigo.AsInteger]);

  RefazConsultaPorNome(qryAtendimentosAlertas,
                       ['cliente','tipocliente','status'],
                       [qryFornecedoresCodigo.asInteger, 'F', 'A']);

  RefazConsultaPorNome(qryRestricoes_Vigilancia_Sanitaria,['codigo_fornecedor'],[qryFornecedorescodigo.AsInteger]);

  AtualizaSerieFornecedor;
end;

procedure TdtmCadastroFornecedores.PosicionarTabelas(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesGRUPOSFORNECEDORES : begin
                              qryFornecedores.Edit;
                              qryFornecedoresgrupofornecedor.AsInteger:= qryConsultaGruposFornecedorescodigo.AsInteger;
                            end;
    pesGRUPOS             : begin
                              qryFornecedoresGrupos.Edit;
                              qryFornecedoresGruposgrupo.AsString     := qryConsultaGruposcodigo.AsString;
                              qryFornecedoresGruposdescricao.AsString := qryConsultaGruposdescricao.AsString;
                            end;
    pesCLASSES            : begin
                              qryFornecedoresGrupos.Edit;
                              qryFornecedoresGruposclasse.AsString           := qryConsultaClassescodigo.AsString;
                              qryFornecedoresGruposdescricao_classe.AsString := qryConsultaClassesdescricao.AsString;
                            end;
  end;
end;

function TdtmCadastroFornecedores.GetTabelaSeriesEmpty: Boolean;
begin
  Result:= qrySeriesFornecedores.IsEmpty;
end;

function TdtmCadastroFornecedores.GetEstadoFornecedor: String;
begin
  Result:= qryFornecedoresestado.AsString;
end;

procedure TdtmCadastroFornecedores.AbrirTabelasConsulta(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesGRUPOSFORNECEDORES : Abre(ctConsultaGruposFornecedores);
    pesGRUPOS             : Abre(ctConsultaGrupos);
    pesCLASSES            : Abre(ctConsultaClasses);
  end;
end;

procedure TdtmCadastroFornecedores.FecharTabelasConsulta(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesGRUPOSFORNECEDORES : Fecha(ctConsultaGruposFornecedores);
    pesGRUPOS             : Fecha(ctConsultaGrupos);
    pesCLASSES            : Fecha(ctConsultaClasses);
  End;
end;

function TdtmCadastroFornecedores.GetConsultaGruposFornecedores: TtecQuery;
begin
  Result:= qryConsultaGruposFornecedores;
end;

function TdtmCadastroFornecedores.ExisteGrupoFornecedore(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaGruposFornecedores, campo, codigo);
end;

function TdtmCadastroFornecedores.GetTipoPessoa: String;
begin
  Result:= '';
  if Assigned(qryFornecedores) then begin
    if qryFornecedorespessoatipo.AsString <> '' then
         Result:= qryFornecedorespessoatipo.AsString
    else Result:= '';
  end;
end;

function TdtmCadastroFornecedores.FornecedorJaCadastrado(Numero: String): Boolean;
begin
  Result:= False;
  if (ParSistema.CPF_CNPJObrigatorio or (qryFornecedorespessoanumero.AsString <> '')) then
    if qryFornecedores.State in [dsEdit, dsInsert] then begin
      qryFornecedorCadastrado.Sql[02]:= 'Where (pessoanumero = ' + '''' + Numero + '''' + ')';
      if qryFornecedores.State in [dsInsert] then
        qryFornecedorCadastrado.Sql[03]:= ''
      else if qryFornecedores.State in [dsEdit] then
        qryFornecedorCadastrado.Sql[03]:= 'and (codigo <> ' + qryFornecedorescodigo.AsString + ')';
      qryFornecedorCadastrado.Open;
      Result:= not qryFornecedorCadastrado.IsEmpty;
      if Result then begin
        if MensagemConfirmacao(format(ctCLIENTEJACADASTRADO,['fornecedor',qryFornecedorCadastradoNome.AsString])) = smbOk then
           ReFazConsulta(qryFornecedores,[0],[qryFornecedorCadastradoCodigo.AsInteger])
        else qryFornecedorespessoanumero.Clear;
      end;
    end;
end;

procedure TdtmCadastroFornecedores.dsrSeriesFornecedoresDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field=qrySeriesFornecedoresserie then
   if VerificaSerieFornecedor then
    begin
     mensagemaviso(ctSERIESJACADASTRADA);
     qrySeriesFornecedores.Cancel;
    end;
end;

function TdtmCadastroFornecedores.VerificaSerieFornecedor: Boolean;
var
i: integer;
begin
  result := false;
  for i := 0 to High(aseriesfornecedores) do
  begin
   if (qrySeriesFornecedoresserie.AsString = aSeriesFornecedores[i].Serie) then
    if (qrySeriesFornecedores.State = dsEdit) and
       (qrySeriesFornecedoresserie.AsString = SerieFornecedorAntesEdicao) then
      result := false
    else  result := true ;
  end;
end;

procedure TdtmCadastroFornecedores.AtualizaSerieFornecedor;
var
i: integer;
RegistroAtual : TBookMark;
begin
  i := 0;
  aSeriesFornecedores := nil;
  RegistroAtual := qrySeriesFornecedores.GetBookmark;
  qrySeriesFornecedores.First;
  while Not qrySeriesFornecedores.Eof do begin
   SetLength(aseriesFornecedores, i + 1);
   aSeriesFornecedores[i].Serie := qrySeriesFornecedoresserie.AsString;
   Inc(i);
   qrySeriesFornecedores.next;
  end;
  qrySeriesFornecedores.GotoBookmark(RegistroAtual);
  qrySeriesFornecedores.FreeBookmark(RegistroAtual);
end;


procedure TdtmCadastroFornecedores.qrySeriesFornecedoresAfterPost(DataSet: TDataSet);
begin
  inherited;
  AtualizaSerieFornecedor;
end;

procedure TdtmCadastroFornecedores.qrySeriesFornecedoresAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryExisteFornecedorSerieNotasPag, [0,1],
             [qryFornecedorescodigo.AsVariant,
              qrySeriesFornecedoresserie.AsVariant]);
  if not qryExisteFornecedorSerieNotasPag.IsEmpty then
    qrySeriesFornecedoresserie.ReadOnly := True
  else qrySeriesFornecedoresserie.ReadOnly := False;
end;

function TdtmCadastroFornecedores.GetExisteFornecedorSerie: Boolean;
begin
  result := not qryExisteFornecedorSerieNotasPag.IsEmpty
end;

procedure TdtmCadastroFornecedores.dsrFornecedoresDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  if qryFornecedores.State = dsEdit then
  begin
    if (field = qryFornecedoresrua) or
       (field = qryFornecedoresbairro) or
       (field = qryFornecedorescidade) or
       (field = qryFornecedoresestado) or
       (field = qryFornecedorescep) then
    begin
      if (qryFornecedoresRua.AsString <> qryFornecedoresrua.OldValue) or
         (qryFornecedoresbairro.AsInteger <> qryFornecedoresbairro.OldValue) or
         (qryFornecedorescidade.AsInteger <> qryFornecedorescidade.OldValue) or
         (qryFornecedoresestado.AsString <> qryFornecedoresestado.OldValue) or
         (qryFornecedorescep.AsInteger <> qryFornecedorescep.OldValue) then
       qryFornecedoresenderecoalterado.AsDateTime := DataHoraLocal
      else if qryFornecedoresenderecoalterado.OldValue <> null then
        qryFornecedoresenderecoalterado.AsDateTime := qryFornecedoresenderecoalterado.OldValue
      else qryFornecedoresenderecoalterado.AsString :='';
    end;

    (*
    else
    if field = qryFornecedoresDDA then
    begin
//      if qryfornecedoresdda.asBoolean <> qryFornecedoresdda_anterior.AsBoolean then
      begin
        if qryFornecedoresdda.AsBoolean then
        begin
          case  MensagemSelecionaOpcao('Deseja setar todas as duplicatas em aberto para este fornecedor como "dda"?') of
            smbYES     : qryFornecedoresconfirmacaodda.asBoolean := true;
            smbNo      : qryFornecedoresconfirmacaodda.asBoolean := false;
            smbCancel  : begin
                            dsrFornecedores.onDataChange := nil;
                            qryFornecedoresDDA.AsBoolean := not qryFornecedoresDDA.AsBoolean;
                            qryFornecedoresconfirmacaodda.asBoolean := false;
                            dsrFornecedores.onDataChange := dsrFornecedoresDataChange;
                          end;
          end;
        end
        else
        begin
          case  MensagemSelecionaOpcao('Deseja desmarcar o "dda" de todas as duplicatas em aberto para este fornecedor?') of
            smbYES     : qryFornecedoresconfirmacaodda.asBoolean := true;
            smbNo      : qryFornecedoresconfirmacaodda.asBoolean := false;
            smbCancel  : begin
                            dsrFornecedores.onDataChange := nil;
                            qryFornecedoresDDA.AsBoolean := not qryFornecedoresDDA.AsBoolean;
                            qryFornecedoresconfirmacaodda.asBoolean := false;
                            dsrFornecedores.onDataChange := dsrFornecedoresDataChange;
                          end;
          end;
        end;
      end;
    end;
    *)

  end
  else
  if field = qryFornecedoresCRT then
    qryFornecedoresnosimples.AsBoolean := (Field.asinteger = 1);

end;

function TdtmCadastroFornecedores.GetTabelaFornecedoresGrupos: TtecQuery;
begin
  Result:= qryFornecedoresGrupos;
end;

function TdtmCadastroFornecedores.GetConsultaGrupos: TtecQuery;
begin
  Result:= qryConsultaGrupos;
end;

procedure TdtmCadastroFornecedores.qryFornecedoresGruposgrupoChange(Sender: TField);
begin
  inherited;
  if Sender = qryFornecedoresGrupos.FieldByName('grupo') then
    qryFornecedoresGruposdescricao.AsString:= qryProcuraGruposdescricao.AsString;
end;

procedure TdtmCadastroFornecedores.qryFornecedoresGruposAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if qryFornecedores.State = dsBrowse then
    qryFornecedores.Edit;
  Perpetrar([qryFornecedoresGrupos]);
end;

function TdtmCadastroFornecedores.GetConsultaClasses: TtecQuery;
begin
  Result:= qryConsultaClasses;
end;

procedure TdtmCadastroFornecedores.qryFornecedoresGruposclasseChange(Sender: TField);
begin
  inherited;
  if Sender = qryFornecedoresGrupos.FieldByName('classe') then
    qryFornecedoresGruposdescricao_classe.AsString:= qryProcuraClassesdescricao.AsString;
end;


function TdtmCadastroFornecedores.GetInserindo: Boolean;
begin
  Result:= (qryFornecedores.State = dsInsert);
end;

function TdtmCadastroFornecedores.GetTabelaFornecedorVazia: Boolean;
begin
  Result:= qryFornecedores.IsEmpty;
end;

procedure TdtmCadastroFornecedores.ReFazConsultaFornecedor(
  Codigo: Integer);
begin
    ReFazConsulta(qryFornecedores,[0],[Codigo]);
end;


procedure TdtmCadastroFornecedores.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\lixo\logfornecedores.sql') then
    Listar.loadfromfile('c:\lixo\logfornecedores.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\lixo\logfornecedores.sql');
  listar.free;
end;

function TdtmCadastroFornecedores.ExcluirFornecedoresContatos: Boolean;
begin
  Result:= False;
  if not qryContatosFornecedores.IsEmpty then begin
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o CONTATO'])) = smbOk then begin
      qryContatosFornecedores.Delete;
      Result := True;
    end;
  end;
end;

function TdtmCadastroFornecedores.IncluirContatoFornecedor: Boolean;
begin
      qryContatosFornecedores.append;
      Result:= true
end;

procedure TdtmCadastroFornecedores.qryContatosFornecedoresNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryContatosFornecedorestipovfornecedores.asstring := 'F';
end;

procedure TdtmCadastroFornecedores.qryContatosFornecedoresBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
{     if qryContatosFornecedores.IsEmpty then
     begin
      Max:= 1;
     end
     else
     begin
      qryContatosFornecedores.Last;
      Max:= qryContatosFornecedorescodigo.asinteger + 1;
     end;}
end;

procedure TdtmCadastroFornecedores.qryContatosFornecedoresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryContatosFornecedores.SortByField('contato');
  qryFornecedores.edit;
end;

procedure TdtmCadastroFornecedores.qryContatosFornecedoresAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.edit;
end;

procedure TdtmCadastroFornecedores.qryContatosFornecedoresBeforePost(
  DataSet: TDataSet);
begin
  inherited;
     if qryContatosFornecedores.state = dsinsert then
     begin
       spccontatosfornecedoresproximocodigo.Open;
       qryContatosFornecedorescodigo.Value:= spccontatosfornecedoresproximocodigocodigo.Value;
       spccontatosfornecedoresproximocodigo.Close;
     end;
end;

procedure TdtmCadastroFornecedores.qryIESubstTributarioAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;

end;

procedure TdtmCadastroFornecedores.qryIESubstTributarioAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;

end;

procedure TdtmCadastroFornecedores.qryFornecedoresNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedoresfornecedorparaiss.AsBoolean := False;
  qryFornecedoresnaosubstituto.AsBoolean := false;
  qryFornecedoresdistribuidor.AsBoolean := false;
  qryFornecedorescontribicms.AsBoolean := true;

  if ParSistema.GerarContabilidade then
    qryFornecedoresadiantamento.AsString := ParSistema.ContaContabilAdiantamentoFornecedor;
  qryFornecedorescrt.AsInteger := 3;  //normal  
end;

procedure TdtmCadastroFornecedores.qryObras_FornecedoresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.qryObras_FornecedoresAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
    qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.AtribuirDadosSuspensaoExibilidadeTributos_pr(
  qrySuspensaoExibilidadeTributos: TtecQuery);
begin
   qryfornecedor_infoProcRetPrprocessojudicial.asInteger := qrySuspensaoExibilidadeTributos.fieldbyname('processojudicial').AsInteger;
   qryfornecedor_infoProcRetPrnrproc.AsString := qrySuspensaoExibilidadeTributos.fieldbyname('nrProc').AsString;
end;

procedure TdtmCadastroFornecedores.qryfornecedor_infoProcRetPrAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.qryfornecedor_infoProcRetPrAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.qryfornecedor_infoProcRetAdAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.qryfornecedor_infoProcRetAdAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.AtribuirDadosSuspensaoExibilidadeTributos_ad(
  qrySuspensaoExibilidadeTributos: TtecQuery);
begin
   qryfornecedor_infoProcRetAdprocessojudicial.asInteger := qrySuspensaoExibilidadeTributos.fieldbyname('processojudicial').AsInteger;
   qryfornecedor_infoProcRetAdnrproc.AsString := qrySuspensaoExibilidadeTributos.fieldbyname('nrProc').AsString;

end;

procedure TdtmCadastroFornecedores.qryObras_FornecedoresAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmCadastroFornecedores.qryObras_FornecedoresNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryObras_Fornecedorestpinscestabindobra.AsInteger := 1;
  qryObras_Fornecedorestipocliente.AsString := 'F';
end;

procedure TdtmCadastroFornecedores.qryfornecedor_infoProcRetPrNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryfornecedor_infoProcRetPrtipofornecedor.asString := 'F';
end;

procedure TdtmCadastroFornecedores.qryfornecedor_infoProcRetAdNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryfornecedor_infoProcRetAdtipofornecedor.AsString := 'F';
end;

procedure TdtmCadastroFornecedores.qryFornecedoresBeforePost(
  DataSet: TDataSet);
begin
  inherited;
//qryFornecedoresdda_anterior.AsBoolean := qryFornecedoresdda.AsBoolean;
  qryFornecedoresconfirmacaodda.asBoolean := false;
end;


procedure TdtmCadastroFornecedores.qryLimitesEntregaFornecedoresNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryLimitesEntregaFornecedoresdia_da_semana.asinteger := 1;
  qryLimitesEntregaFornecedoresperiodo.asinteger := 1;
end;

procedure TdtmCadastroFornecedores.qryLimitesEntregaFornecedoresAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.qryLimitesEntregaFornecedoresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;
end;

procedure TdtmCadastroFornecedores.AtribuirDadosClassificacao_Vigilancia_Sanitaria(
  qryProcuraClassificacao_Vigilancia_Sanitaria: TtecQuery);
begin
  qryRestricoes_Vigilancia_Sanitariacodigo_classificacao.asString :=
    qryProcuraClassificacao_Vigilancia_Sanitaria.fieldbyname('codigo').asString;

  qryRestricoes_Vigilancia_Sanitariadescricao_classificacao.asString :=
    qryProcuraClassificacao_Vigilancia_Sanitaria.fieldbyname('descricao').asString;  
end;

procedure TdtmCadastroFornecedores.qryRestricoes_Vigilancia_SanitariaAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;

end;

procedure TdtmCadastroFornecedores.qryRestricoes_Vigilancia_SanitariaAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryFornecedores.Edit;

end;

procedure TdtmCadastroFornecedores.qryRestricoes_Vigilancia_SanitariaAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
//  TDBAdvGrid(self.owner.findcomponent('DBAdvRestricoes_Vigilancia_Sanitaria')).ShowInplaceEdit;
end;

end.
