unit dmprocessosjudiciaisreinf;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ctconstantes, biblio;

type
  TdtmProcessosJudiciaisReinf = class(TdtmBasico)
    qryProcessoJudicialReinf: TtecQuery;
    dsrProcessoJudicialReinf: TtecDataSource;
    qryProcessoJudicialReinfnumero: TIntegerField;
    qryProcessoJudicialReinftpproc: TIntegerField;
    qryProcessoJudicialReinfnrproc: TStringField;
    qryProcessoJudicialReinfinivalid: TStringField;
    qryProcessoJudicialReinffimvalid: TStringField;
    qryProcessoJudicialReinfindautoria: TIntegerField;
    spcProcessoJudicialReinf: TtecQuery;
    spcProcessoJudicialReinfcodigo: TIntegerField;
    qryProcessoJudicialReinfobservacoes: TStringField;
    qrySuspensaoExibilidadeTributos: TtecQuery;
    dsrSuspensaoExibilidadeTributos: TtecDataSource;
    qryProcessoJudicialReinfdatahoraexclusao: TDateTimeField;
    qryProcessoJudicialReinfsdatahoraexclusao: TStringField;
    qrySuspensaoExibilidadeTributosprocessojudicial: TIntegerField;
    qrySuspensaoExibilidadeTributosnumero: TIntegerField;
    qrySuspensaoExibilidadeTributoscodsusp: TStringField;
    qrySuspensaoExibilidadeTributosindsusp: TStringField;
    qrySuspensaoExibilidadeTributosdtdecisao: TDateField;
    qrySuspensaoExibilidadeTributosinddeposito: TStringField;
    qrySuspensaoExibilidadeTributosufvara: TStringField;
    qrySuspensaoExibilidadeTributoscodmunic: TIntegerField;
    qrySuspensaoExibilidadeTributosidvara: TStringField;
    dsrTabelaSuspensaoExibilidade: TtecDataSource;
    qryTabelaSuspensaoExibilidade: TtecQuery;
    qryTabelaSuspensaoExibilidadecodigo: TStringField;
    qryTabelaSuspensaoExibilidadedescricao: TStringField;
    qrySuspensaoExibilidadeTributoss_indsusp: TStringField;
    spcSuspensaoExibilidadeTributos: TtecQuery;
    spcSuspensaoExibilidadeTributoscodigo: TIntegerField;
    qrySuspensaoExibilidadeTributosdatahoraexclusao: TDateTimeField;
    qrySuspensaoExibilidadeTributosnomecidade: TStringField;
    qrySuspensaoExibilidadeTributosibge_nomecidade: TStringField;
    qryProcessoJudicialReinfdatahoraalteracao: TDateTimeField;
    qryProcessoJudicialReinfsdatahoraalteracao: TStringField;
    qrySuspensaoExibilidadeTributossDataHoraExclusao: TStringField;
    qryEnvio_ProcessoJudicialReinf: TtecQuery;
    dsrEnvio_ProcessoJudicialReinf: TtecDataSource;
    qryEnvio_SuspensaoExibilidadeTributos: TtecQuery;
    dsrEnvio_SuspensaoExibilidadeTributos: TtecDataSource;
    qryEnvio_ProcessoJudicialReinfnumero: TIntegerField;
    qryEnvio_ProcessoJudicialReinfdatahoraprocessamento: TDateTimeField;
    qryEnvio_ProcessoJudicialReinfoperacao: TStringField;
    qryEnvio_ProcessoJudicialReinftpproc: TIntegerField;
    qryEnvio_ProcessoJudicialReinfnrproc: TStringField;
    qryEnvio_ProcessoJudicialReinfinivalid: TStringField;
    qryEnvio_ProcessoJudicialReinffimvalid: TStringField;
    qryEnvio_ProcessoJudicialReinfindautoria: TIntegerField;
    qryEnvio_ProcessoJudicialReinfdatahoraexclusao: TDateTimeField;
    qryEnvio_ProcessoJudicialReinfdatahoraalteracao: TDateTimeField;
    qryEnvio_SuspensaoExibilidadeTributosprocessojudicial: TIntegerField;
    qryEnvio_SuspensaoExibilidadeTributosnumero: TIntegerField;
    qryEnvio_SuspensaoExibilidadeTributosdatahoraprocessamento: TDateTimeField;
    qryEnvio_SuspensaoExibilidadeTributoscodsusp: TStringField;
    qryEnvio_SuspensaoExibilidadeTributosindsusp: TStringField;
    qryEnvio_SuspensaoExibilidadeTributosdtdecisao: TDateField;
    qryEnvio_SuspensaoExibilidadeTributosinddeposito: TStringField;
    qryEnvio_SuspensaoExibilidadeTributosufvara: TStringField;
    qryEnvio_SuspensaoExibilidadeTributoscodmunic: TIntegerField;
    qryEnvio_SuspensaoExibilidadeTributosidvara: TStringField;
    qryEnvio_SuspensaoExibilidadeTributosdatahoraexclusao: TDateTimeField;
    qryEnvio_ProcessoJudicialReinfs_tpproc: TStringField;
    qryEnvio_ProcessoJudicialReinfs_indautoria: TStringField;
    qryEnvio_ProcessoJudicialReinfs_operacao: TStringField;
    qryEnvio_SuspensaoExibilidadeTributoss_indsusp: TStringField;
    qryEnvio_SuspensaoExibilidadeTributosibge_nomecidade: TStringField;
    qryEnvio_SuspensaoExibilidadeTributosnomecidade: TStringField;
    qryEnvio_ProcessoJudicialReinfnumeroreinf: TIntegerField;
    qryEnvio_ProcessoJudicialReinfnrrecarqbase: TStringField;
    procedure qryProcessoJudicialReinfCalcFields(DataSet: TDataSet);
    procedure qryProcessoJudicialReinfAfterScroll(DataSet: TDataSet);
    procedure qrySuspensaoExibilidadeTributosufvaraChange(Sender: TField);
    procedure qrySuspensaoExibilidadeTributosNewRecord(DataSet: TDataSet);
    procedure qrySuspensaoExibilidadeTributosBeforePost(DataSet: TDataSet);
    procedure qryProcessoJudicialReinfBeforeEdit(DataSet: TDataSet);
    procedure qrySuspensaoExibilidadeTributosCalcFields(DataSet: TDataSet);
    procedure qrySuspensaoExibilidadeTributosAfterEdit(DataSet: TDataSet);
    procedure qrySuspensaoExibilidadeTributosAfterDelete(
      DataSet: TDataSet);
    procedure qrySuspensaoExibilidadeTributosAfterPost(DataSet: TDataSet);
    procedure qryEnvio_ProcessoJudicialReinfAfterScroll(DataSet: TDataSet);
    procedure qryEnvio_SuspensaoExibilidadeTributosCalcFields(
      DataSet: TDataSet);
    procedure qryProcessoJudicialReinfAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure IncluirProcessoJudicialReinf;
    function GravarProcessoJudicialReinf: Boolean;
    function ExcluirProcessoJudicialReinf: boolean;
    function ExcluirSuspensaoExibilidadeTributos: boolean;
    procedure AbrirTabelasEnvios;

  end;

var
  dtmProcessosJudiciaisReinf: TdtmProcessosJudiciaisReinf;

implementation

{$R *.dfm}

{ TdtmProcessosJudiciaisReinf }

constructor TdtmProcessosJudiciaisReinf.Create(AOwner: TComponent);
begin
  inherited;
  qryProcessoJudicialReinf.tag := ctTabelas;
  qryTabelaSuspensaoExibilidade.tag := ctTabelas;
end;

destructor TdtmProcessosJudiciaisReinf.Destroy;
begin

  inherited;
end;

function TdtmProcessosJudiciaisReinf.ExcluirProcessoJudicialReinf: boolean;
begin
  if not qryProcessoJudicialReinf.IsEmpty then
  begin
    if MensagemConfirmacao('O Cancelamento deste registro?') = smbOK then
    begin
      qryProcessoJudicialReinf.edit;
      qryProcessoJudicialReinfdatahoraexclusao.AsDateTime := DataHoraServidor;
    end;
  end;
end;

function TdtmProcessosJudiciaisReinf.GravarProcessoJudicialReinf: boolean;
begin
  result := qryProcessoJudicialReinf.CheckRequiredFields;

  if result then
  begin
    result := qrySuspensaoExibilidadeTributos.CheckRequiredFields(true);

    if result then
    begin
      if qryProcessoJudicialReinf.state = dsinsert then
      begin
        spcProcessoJudicialReinf.Open;
        qryProcessoJudicialReinfnumero.AsInteger:= spcProcessoJudicialReinfcodigo.AsInteger;
        spcProcessoJudicialReinf.Close;
      end;

      AtribuirChave(qrySuspensaoExibilidadeTributos,
                  [qrySuspensaoExibilidadeTributosprocessojudicial],
                  [qryProcessoJudicialReinfnumero]);

      qrySuspensaoExibilidadeTributos.First;

      while not qrySuspensaoExibilidadeTributos.eof do
      begin
        if qrySuspensaoExibilidadeTributosnumero.IsNull then
        begin
          spcSuspensaoExibilidadeTributos.Open;
          qrySuspensaoExibilidadeTributos.edit;
          qrySuspensaoExibilidadeTributosnumero.AsInteger := spcSuspensaoExibilidadeTributoscodigo.AsInteger;
          qrySuspensaoExibilidadeTributos.Post;
          spcSuspensaoExibilidadeTributos.Close;
        end;

        qrySuspensaoExibilidadeTributos.next;
      end;

      qryProcessoJudicialReinfdatahoraalteracao.AsDateTime := DataHoraServidor;

      result := perpetrar([qryProcessoJudicialReinf, qrySuspensaoExibilidadeTributos]);

    end;

  end;
end;

procedure TdtmProcessosJudiciaisReinf.IncluirProcessoJudicialReinf;
begin
  qryProcessoJudicialReinf.Append;
end;

procedure TdtmProcessosJudiciaisReinf.qryProcessoJudicialReinfCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if not qryProcessoJudicialReinfdatahoraexclusao.IsNull then
    qryProcessoJudicialReinfsdatahoraexclusao.asString := 'CANCELADO EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qryProcessoJudicialReinfdatahoraexclusao.asDateTime)
  else
    qryProcessoJudicialReinfsdatahoraexclusao.clear;

  if not qryProcessoJudicialReinfdatahoraalteracao.IsNull then
    qryProcessoJudicialReinfsdatahoraalteracao.asString := 'ALTERADO EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qryProcessoJudicialReinfdatahoraalteracao.asDateTime)
  else
    qryProcessoJudicialReinfsdatahoraalteracao.clear;

end;

procedure TdtmProcessosJudiciaisReinf.qryProcessoJudicialReinfAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qrySuspensaoExibilidadeTributos, ['ProcessoJudicial'], [qryProcessoJudicialReinfnumero.asinteger]);
end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosufvaraChange(
  Sender: TField);
begin
  inherited;
;
end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qrySuspensaoExibilidadeTributosindsusp.AsString := '01';
  qrySuspensaoExibilidadeTributosdtdecisao.AsDateTime := DataServidor;
  qrySuspensaoExibilidadeTributosinddeposito.AsString := 'S';
  qrySuspensaoExibilidadeTributosufvara.AsString := EstadoFilialBase;
  qrySuspensaoExibilidadeTributoscodmunic.AsString := CodigoCidadeIBGEFilialBase;
  qrySuspensaoExibilidadeTributosnomecidade.AsString := CidadeFilialBase;

end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosBeforePost(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmProcessosJudiciaisReinf.qryProcessoJudicialReinfBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if not qrySuspensaoExibilidadeTributoscodmunic.isnull then
    qrySuspensaoExibilidadeTributosibge_nomecidade.asString :=
      qrySuspensaoExibilidadeTributoscodmunic.asString + ' - ' +
      qrySuspensaoExibilidadeTributosnomecidade.asString;


  if not qrySuspensaoExibilidadeTributosdatahoraexclusao.IsNull then
    qrySuspensaoExibilidadeTributossdatahoraexclusao.asString := 'EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qrySuspensaoExibilidadeTributosdatahoraexclusao.asDateTime)
  else
    qrySuspensaoExibilidadeTributossdatahoraexclusao.clear;

end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryProcessoJudicialReinf.edit;
end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryProcessoJudicialReinf.edit;
end;

function TdtmProcessosJudiciaisReinf.ExcluirSuspensaoExibilidadeTributos: boolean;
begin
  if not qrySuspensaoExibilidadeTributos.IsEmpty then
  begin
    if MensagemConfirmacao('O Cancelamento deste registro?') = smbOK then
    begin
      qrySuspensaoExibilidadeTributos.edit;
      qrySuspensaoExibilidadeTributosdatahoraexclusao.AsDateTime := DataHoraServidor;
      qrySuspensaoExibilidadeTributos.post;
    end;  
  end;

end;

procedure TdtmProcessosJudiciaisReinf.qrySuspensaoExibilidadeTributosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryProcessoJudicialReinf.edit;
end;

procedure TdtmProcessosJudiciaisReinf.qryEnvio_ProcessoJudicialReinfAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryEnvio_SuspensaoExibilidadeTributos,
               ['ProcessoJudicial', 'numeroreinf'],

               [qryEnvio_ProcessoJudicialReinfnumero.AsInteger,
                qryEnvio_ProcessoJudicialReinfnumeroreinf.AsInteger]);

end;

procedure TdtmProcessosJudiciaisReinf.AbrirTabelasEnvios;
begin
  RefazConsultaPorNome(qryEnvio_ProcessoJudicialReinf, ['numero'],
                    [qryProcessoJudicialReinfnumero.asInteger]);
end;

procedure TdtmProcessosJudiciaisReinf.qryEnvio_SuspensaoExibilidadeTributosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if not qryEnvio_SuspensaoExibilidadeTributoscodmunic.isnull then
    qryEnvio_SuspensaoExibilidadeTributosibge_nomecidade.asString :=
      qryEnvio_SuspensaoExibilidadeTributoscodmunic.asString + ' - ' +
      qryEnvio_SuspensaoExibilidadeTributosnomecidade.asString;

end;

procedure TdtmProcessosJudiciaisReinf.qryProcessoJudicialReinfAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qrySuspensaoExibilidadeTributos, ['ProcessoJudicial'], [qryProcessoJudicialReinfnumero.asinteger]);
end;

end.
