unit dmcadastroempreendimentos;

interface

uses
  SysUtils, Classes, biblio, dmtecsoft, dmbasico, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, Forms, ctconstantes, ZTransact, variants, clparametrossistema;

type
  Tdtmcadastroempreendimentos = class(TdtmBasico)
    qryEmpreendimentos: TtecQuery;
    dsrEmpreendimentos: TtecDataSource;
    spcEmpreendimentos_ProximoCodigo: TtecQuery;
    qryBlocos: TtecQuery;
    dsrBlocos: TtecDataSource;
    qryBlocoscodigo: TIntegerField;
    qryBlocosempreendimento: TIntegerField;
    qryBlocosdescricao: TStringField;
    spcEmpreendimentos_ProximoCodigocodigo: TIntegerField;
    qryConsultaEmpreendimentos: TtecQuery;
    qryConsultaEmpreendimentoscodigo: TIntegerField;
    qryConsultaEmpreendimentosnome: TStringField;
    qryConsultaEmpreendimentoscidade: TIntegerField;
    qryConsultaEmpreendimentosestado: TStringField;
    qryConsultaEmpreendimentosnomecidade: TStringField;
    spcBlocos_ProximoCodigo: TtecQuery;
    spcBlocos_ProximoCodigocodigo: TIntegerField;
    qryConsultaEmpreendimentossigla: TStringField;
    qryImoveis: TtecQuery;
    dsrImoveis: TtecDataSource;
    qryImoveisFracaoIdeal: TFloatField;
    qryImoveisAreaTotal: TFloatField;
    qryAtualizarContratos_SetarDataHabitese: TtecQuery;
    qryVendasImoveis: TtecQuery;
    dsrVendasImoveis: TtecDataSource;
    qryEmpreendimentosCodigo: TIntegerField;
    qryEmpreendimentosNome: TStringField;
    qryEmpreendimentosSigla: TStringField;
    qryEmpreendimentosRua: TStringField;
    qryEmpreendimentosNumero: TIntegerField;
    qryEmpreendimentosComplemento: TStringField;
    qryEmpreendimentosEstado: TStringField;
    qryEmpreendimentosCidade: TIntegerField;
    qryEmpreendimentosBairro: TIntegerField;
    qryEmpreendimentosCEP: TIntegerField;
    qryEmpreendimentosDataHabiteSe: TDateField;
    qryEmpreendimentosObservacoes: TStringField;
    qryEmpreendimentosContaVenda: TIntegerField;
    qryEmpreendimentosContaCOFINS: TIntegerField;
    qryEmpreendimentosContaCSLL: TIntegerField;
    qryEmpreendimentosContaIRPJ: TIntegerField;
    qryEmpreendimentosContaPIS: TIntegerField;
    qryEmpreendimentosDebitoCustos: TIntegerField;
    qryEmpreendimentosCreditoCustos: TIntegerField;
    qryEmpreendimentosCreditoVendaChaves: TIntegerField;
    qryEmpreendimentosDebitoCustoChaves: TIntegerField;
    qryEmpreendimentosCreditoAtualizacaoMonetaria: TIntegerField;
    qryEmpreendimentosDebitoDescontoRecebimento: TIntegerField;
    qryEmpreendimentosAreaTerreno: TFloatField;
    qryEmpreendimentosDebitoDescontoConcedidos: TIntegerField;
    qryEmpreendimentosNomeCidadeCliente: TStringField;
    qryEmpreendimentosNomeBairroCliente: TStringField;
    qryParcelasImoveis: TtecQuery;
    qryParcelasImoveiscontrato: TIntegerField;
    qryAtualizarDatadoHabitese: TtecQuery;
    qryReverterDatadoHabitese: TtecQuery;
    qryParcelasImoveisorigem: TStringField;
    qryParametrosContasImoveis: TtecQuery;
    qryParametrosContasImoveisdebitardespesasvenda: TIntegerField;
    dsrParametrosContasImoveis: TtecDataSource;
    qryParametrosContasImoveisdescricaoplanocontasdebitardespesasvendas: TStringField;
    qryParametrosContasImoveisclassificacaoplanocontasdebitardespesasvendas: TStringField;
    qryEmpreendimentosCreditoDespesasVenda: TIntegerField;
    qryGerarLancamentosHabitese: TtecQuery;
    qryApagarLancamentosHabitese: TtecQuery;
    qryAtualizarContratos_LimparDataHabitese: TtecQuery;
    qryEmpreendimentosUnid_Imob: TStringField;
    qryEmpreendimentosInd_Nat_Emp: TStringField;
    qryImoveisAreaPrivativa: TFloatField;
    qryImoveisAreaComum: TFloatField;
    qryEmpreendimentosAVPCurtoPrazo: TIntegerField;
    qryEmpreendimentosAVPLongoPrazo: TIntegerField;
    qryEmpreendimentosAVPTaxaDesconto: TFloatField;
    qryEmpreendimentosEstoquesImoveisConcluidos: TIntegerField;
    procedure qryBlocosBeforePost(DataSet: TDataSet);
    procedure qryBlocosAfterPost(DataSet: TDataSet);
    procedure qryEmpreendimentosAfterOpen(DataSet: TDataSet);
    procedure qryEmpreendimentosAfterCancel(DataSet: TDataSet);
    procedure qryEmpreendimentosAfterClose(DataSet: TDataSet);
    procedure qryEmpreendimentosNewRecord(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryEmpreendimentosAfterInsert(DataSet: TDataSet);
    procedure qryEmpreendimentosAfterPost(DataSet: TDataSet);
    procedure qryEmpreendimentosAfterScroll(DataSet: TDataSet);
  private
    FAfterOpenEmpreendimentos: TNotifyEvent;
    FAfterCancelEmpreendimentos: TNotifyEvent;
    function GetIncluindoCadastroEmpreedimentos: Boolean;
    function ExistePagamentoApartirdoHabitese: Boolean;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    procedure AbreTabelasConsulta(TipoPesquisa: TtecPesquisa);
    procedure FechaTabelasConsulta(TipoPesquisa: TtecPesquisa);
    procedure Selecionar(TipoPesquisa: TtecPesquisa);
    function  ExisteEmpreendimento(Campo, Codigo : String): Boolean;
    procedure RefazConsultaEmpreendimento; overload;
    procedure RefazConsultaEmpreendimento(Numero: String); overload;
    function IncluirEmpreendimento: Boolean;
    function GravarEmpreendimento: Boolean;
    function ExcluirEmpreendimento: Boolean;
    function IncluirBloco(Editar: Boolean): Boolean;
    function GravarBloco : Boolean;
    function ExcluirBloco: Boolean;
    procedure AtualizarContratos;
    procedure ReverterContratos;
    property AfterOpenEmpreendimentos : TNotifyEvent read FAfterOpenEmpreendimentos write FAfterOpenEmpreendimentos;
    property AfterCancelEmpreendimentos : TNotifyEvent read FAfterCancelEmpreendimentos write FAfterCancelEmpreendimentos;
    property IncluindoCadastroEmpreedimentos: Boolean Read GetIncluindoCadastroEmpreedimentos;

  end;

var
  dtmcadastroempreendimentos: Tdtmcadastroempreendimentos;

implementation

{$R *.dfm}

{ Tdtmcadastroempreendimentos }

procedure Tdtmcadastroempreendimentos.RefazConsultaEmpreendimento;
begin
  RefazConsultaPorNome(qryEmpreendimentos,['Numero'],[qryEmpreendimentosCodigo.AsVariant]);
end;

function Tdtmcadastroempreendimentos.IncluirEmpreendimento: Boolean;
begin
  qryEmpreendimentos.Open;
  qryEmpreendimentos.Insert;
  Result:= True
end;

procedure Tdtmcadastroempreendimentos.RefazConsultaEmpreendimento(Numero: String);
begin
  RefazConsultaPorNome(qryEmpreendimentos,['Numero'],[Numero]);
end;

function Tdtmcadastroempreendimentos.GravarEmpreendimento: Boolean;
begin
  result := qryEmpreendimentos.CheckRequiredFields;

  if result then
  begin
    if (qryEmpreendimentos.State = dsinsert) and
       (qryEmpreendimentosDataHabiteSe.AsDateTime > 0) then
    begin
      result := false;
      MensagemAviso('A data do HABITE-SE não pode ser cadastrada na inclusão de um empreendimento.');
    end;

    if result then
    begin
      if qryEmpreendimentos.State = dsinsert then
      begin
        spcEmpreendimentos_ProximoCodigo.Open;
        qryEmpreendimentosCodigo.AsInteger:= spcEmpreendimentos_ProximoCodigocodigo.AsInteger;
        spcEmpreendimentos_ProximoCodigo.Close;
        qryEmpreendimentos.Post;
      end
      else
      begin
            {não havia data do habite-se e foi definida}
        if ((qryEmpreendimentosDataHabiteSe.OldValue = null) and
            (not qryEmpreendimentosDataHabiteSe.isnull)) or

            {havia data do habite-se e foi alterada}
           ((qryEmpreendimentosDataHabiteSe.OldValue <> null) and
            (qryEmpreendimentosDataHabiteSe.OldValue <> qryEmpreendimentosDataHabiteSe.AsVariant)) then

           if ExistePagamentoApartirdoHabitese then
           begin
             result := false;

             MensagemAviso(format('A parcela %s do contrato %s'+chr(13)+
                                  'foi paga após a data do HABITE-SE.',
                                  [qryParcelasImoveisorigem.AsString,
                                   qryParcelasImoveiscontrato.AsString]));
           end;
       end;

      if result then
      begin
        if not qryBlocos.IsEmpty then
        begin
          qryBlocos.First;
          while not qryBlocos.Eof do
          begin
            if qryBlocosempreendimento.AsInteger <> qryEmpreendimentosCodigo.AsInteger then
            begin
              qryBlocos.Edit;
              qryBlocosempreendimento.AsInteger:= qryEmpreendimentosCodigo.AsInteger;
              qryBlocos.Post;
            end;
            qryBlocos.Next;
          end;
        end;

        {havia data do habite-se e foi zerada}
        if (qryEmpreendimentosDataHabiteSe.OldValue <> null) and
            qryEmpreendimentosDataHabiteSe.IsNull then
          ReverterContratos
        else
        {não havia data do habite-se e foi definida}
        if ((qryEmpreendimentosDataHabiteSe.OldValue = null) and
             not qryEmpreendimentosDataHabiteSe.IsNull) then
          AtualizarContratos
        else
        {havia data do habite-se e foi alterada}
         if  ((qryEmpreendimentosDataHabiteSe.OldValue <> null) and
             (qryEmpreendimentosDataHabiteSe.OldValue <>
              qryEmpreendimentosDataHabiteSe.AsVariant)) then
         begin
           reverterContratos;
           AtualizarContratos;
         end;

        Perpetrar([qryEmpreendimentos, qryBlocos, qryAtualizarContratos_LimparDataHabitese,
                   qryAtualizarContratos_SetarDataHabitese,
                   qryReverterDatadoHabitese, qryAtualizarDatadoHabitese]);

        Result:= True;
      end;

    end;
  end
  else
    Result:= False
end;

function Tdtmcadastroempreendimentos.ExcluirEmpreendimento: Boolean;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o EMPREENDIMENTO'])) = smbOk then
  begin
    if not qryEmpreendimentos.IsEmpty then
         qryEmpreendimentos.Delete
    else qryEmpreendimentos.Cancel;
    Perpetrar([qryEmpreendimentos, qryBlocos]);
    Result:= True;
  end
  else
    Result:= False;
end;

procedure Tdtmcadastroempreendimentos.AbreTabelasConsulta(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesEMPREENDIMENTOS : qryConsultaEmpreendimentos.Open;
  end;
end;

procedure Tdtmcadastroempreendimentos.FechaTabelasConsulta(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesEMPREENDIMENTOS : qryConsultaEmpreendimentos.Close;
  end;
end;

procedure Tdtmcadastroempreendimentos.Selecionar(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
    pesEMPREENDIMENTOS  : begin
                            RefazConsultaPorNome(qryEmpreendimentos,['Numero'],[qryConsultaEmpreendimentoscodigo.AsInteger]);
                          end;
  end;
end;

function Tdtmcadastroempreendimentos.ExisteEmpreendimento(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaEmpreendimentos, Campo, Codigo);
end;

function Tdtmcadastroempreendimentos.IncluirBloco(Editar: Boolean): Boolean;
begin
  if not Editar then
    qryBlocos.Insert
  else
    qryBlocos.Edit;
  Result:= True;
end;

function Tdtmcadastroempreendimentos.ExcluirBloco: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o Bloco'])) = smbOK then
  begin
    if not qryBlocos.IsEmpty then
    begin
      qryBlocos.Delete;
      Result := True;
    end;
  END;
end;

function Tdtmcadastroempreendimentos.GravarBloco: Boolean;
begin
  qryBlocos.Post;
  Result:= True;
end;

procedure Tdtmcadastroempreendimentos.qryBlocosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryBlocos.State = dsinsert then
  begin
    spcBlocos_ProximoCodigo.Open;
    qryBlocoscodigo.AsInteger:= spcBlocos_ProximoCodigocodigo.AsInteger;
    spcBlocos_ProximoCodigo.Close;
    qryBlocosempreendimento.AsInteger:= qryEmpreendimentosCodigo.AsInteger;
  end;
end;

procedure Tdtmcadastroempreendimentos.qryBlocosAfterPost(DataSet: TDataSet);
begin
  inherited;
  IF NOT (qryEmpreendimentos.State IN [DSINSERT, DSEDIT]) THEN
    qryEmpreendimentos.Edit;
  qryBlocos.SortByField('Descricao');
end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryBlocos,['Empreendimento'],[qryEmpreendimentosCodigo.AsVariant]);
  RefazConsultaPorNome(qryImoveis,['Empreendimento'],[qryEmpreendimentosCodigo.AsVariant]);
  if qryEmpreendimentos.RecordCount > 0 then
  begin
    if Assigned(FAfterOpenEmpreendimentos) then
      FAfterOpenEmpreendimentos(Self)
  end
  else
    if Assigned(FAfterCancelEmpreendimentos) then
      FAfterCancelEmpreendimentos(Self);
end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  qryBlocos.Cancel;
end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  qryBlocos.Close;
  qryImoveis.Close;
end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryEmpreendimentosUnid_Imob.asstring := '06';
  qryEmpreendimentosInd_Nat_Emp.asstring := '4';
  qryImoveis.Close;
end;

procedure Tdtmcadastroempreendimentos.AtualizarContratos;
begin

  qryAtualizarContratos_SetarDataHabitese.ParamByName('dataHabitese').AsDateTime := qryEmpreendimentosDataHabiteSe.AsDateTime;
  qryAtualizarContratos_SetarDataHabitese.ParamByName('Empreendimento').asinteger := qryEmpreendimentosCodigo.asinteger;
  qryAtualizarContratos_SetarDataHabitese.ExecSql;

  qryAtualizarDatadoHabitese.ParamByName('dataHabitese').AsDateTime := qryEmpreendimentosDataHabiteSe.AsDateTime;
  qryAtualizarDatadoHabitese.ParamByName('Empreendimento').asinteger := qryEmpreendimentosCodigo.asinteger;
  qryAtualizarDatadoHabitese.ExecSql;

  qryGerarLancamentosHabitese.ParamByName('Empreendimento').asinteger := qryEmpreendimentosCodigo.asinteger;
  qryGerarLancamentosHabitese.ParamByName('dataHabitese').AsDateTime := qryEmpreendimentosDataHabiteSe.AsDateTime;
  qryGerarLancamentosHabitese.ExecSql;

end;

procedure Tdtmcadastroempreendimentos.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
  Listar : TStringList;
  Arquivo: String;
begin
  inherited;
  Listar := TStringList.Create;
  Arquivo := 'C:\Empreendimentos.sql';
  if FileExists(Arquivo) then
    Listar.LoadFromFile(Arquivo);
  Listar.Add('');
  Listar.Add(Sql);
  Listar.Add(Result);
  listar.SaveToFile(Arquivo);
  listar.Free;
end;

function Tdtmcadastroempreendimentos.GetIncluindoCadastroEmpreedimentos: Boolean;
begin
  Result := (qryEmpreendimentos.State = dsInsert) or qryEmpreendimentos.IsEmpty
end;

function Tdtmcadastroempreendimentos.ExistePagamentoApartirdoHabitese: Boolean;
begin
  if qryEmpreendimentosDataHabiteSe.isnull then
    RefazConsultaPorNome(qryParcelasImoveis,['dataHabitese','empreendimento'],
      [qryEmpreendimentosDataHabiteSe.oldvalue, qryEmpreendimentosCodigo.AsVariant])
  else
    RefazConsultaPorNome(qryParcelasImoveis,['dataHabitese','empreendimento'],
      [qryEmpreendimentosDataHabiteSe.asDateTime, qryEmpreendimentosCodigo.AsVariant]);
      
  result :=  not qryParcelasImoveis.IsEmpty;
end;

procedure Tdtmcadastroempreendimentos.ReverterContratos;
begin
   qryAtualizarContratos_LimparDataHabitese.ParamByName('Empreendimento').asinteger := qryEmpreendimentosCodigo.asinteger;
   qryAtualizarContratos_LimparDataHabitese.ExecSql;

   qryReverterDatadoHabitese.ParamByName('Empreendimento').asinteger := qryEmpreendimentosCodigo.asinteger;
   qryReverterDatadoHabitese.ParamByName('dataHabitese').AsDateTime := qryEmpreendimentosDataHabiteSe.OldValue;
   qryReverterDatadoHabitese.ExecSql;

   qryApagarLancamentosHabitese.ParamByName('Empreendimento').asinteger := qryEmpreendimentosCodigo.asinteger;
   qryApagarLancamentosHabitese.ParamByName('dataHabitese').AsDateTime := qryEmpreendimentosDataHabiteSe.OldValue;
   qryApagarLancamentosHabitese.ExecSql;

end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryEmpreendimentosDataHabiteSe.ReadOnly := true;
end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryEmpreendimentosDataHabiteSe.ReadOnly := false;
end;

constructor Tdtmcadastroempreendimentos.Create(AOwner: TComponent);
begin
  inherited;
  qryParametrosContasImoveis.open;
end;

procedure Tdtmcadastroempreendimentos.qryEmpreendimentosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryEmpreendimentosDataHabiteSe.IsNull and
    (qryEmpreendimentosDataHabiteSe.AsDateTime < ParSistema.DataContabil) then
    qryEmpreendimentosDataHabiteSe.ReadOnly := true
  else
    qryEmpreendimentosDataHabiteSe.ReadOnly := false;

end;

end.
