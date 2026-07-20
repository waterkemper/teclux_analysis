 unit dmcadastroplanospagamentos;

interface

uses
  //CLX
  SysUtils, Classes, DB, Forms, Math,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes, biblio,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmbasico, ZTransact;

type
  TdtmCadastroPlanosPagamentos = class(TdtmBasico)
    qryPlanos: TtecQuery;
    qryPlanosCodigo: TIntegerField;
    qryPlanosDescricao: TStringField;
    qryPlanosValidadeInicial: TDateField;
    qryPlanosValidadeFinal: TDateField;
    qryPlanosQuantidadeParcelas: TIntegerField;
    qryPlanosPrazoVenctoEntrada: TIntegerField;
    qryPlanosToleranciaEntrada: TIntegerField;
    qryPlanosDiaVenctoEntrada: TDateField;
    qryPlanosPorcentagemEntrada: TFloatField;
    qryPlanosTipoPlano: TIntegerField;
    qryPlanosAgente: TIntegerField;
    qryPlanosTipoComissao: TStringField;
    qryPlanosComissao: TFloatField;
    qryPlanosAlterarValor: TBooleanField;
    qryPlanosAlterarVencimento: TBooleanField;
    qryPlanosTaxaMensalJuros: TFloatField;
    qryPlanosIntervaloParcelas: TIntegerField;
    qryPlanosValorMinimoParcela: TFloatField;
    qryPlanosCompraMinima: TFloatField;
    qryPlanosCompraMaxima: TFloatField;
    qryPlanosDescontoMaximo: TFloatField;
    qryPlanosDiaBase: TIntegerField;
    qryPlanosAposDia: TIntegerField;
    qryPlanosImprParcelaCarne: TBooleanField;
    qryPlanosEnderecoCompleto: TBooleanField;
    dsrPlanos: TtecDataSource;
    qryConsultaAgentes: TtecQuery;
    qryConsultaAgentesdescricao: TStringField;
    qryConsultaAgentescodigo: TIntegerField;
    qryConsultaPlanos: TtecQuery;
    qryConsultaPlanosdescricao: TStringField;
    qryConsultaPlanoscodigo: TIntegerField;
    qryConsultaTiposPlanos: TtecQuery;
    qryConsultaTiposPlanosdescricao: TStringField;
    qryConsultaTiposPlanoscodigo: TIntegerField;
    qryProcuraTiposPlanos: TtecQuery;
    qryProcuraTiposPlanoscodigo: TIntegerField;
    qryProcuraTiposPlanosdescricao: TStringField;
    qryProcuraAgentes: TtecQuery;
    qryProcuraAgentescodigo: TIntegerField;
    qryProcuraAgentesdescricao: TStringField;
    dsrProcuraAgentes: TtecDataSource;
    dsrProcuraTiposPlanos: TtecDataSource;
    qryPlanosGrupos: TtecQuery;
    dsrPlanosGrupos: TtecDataSource;
    qryPlanosClasses: TtecQuery;
    dsrPlanosClasses: TtecDataSource;
    qryPlanosGruposgrupo: TStringField;
    qryPlanosGruposdescricao: TStringField;
    qryPlanosClassesclasse: TStringField;
    qryPlanosClassesdescricao: TStringField;
    qryProcuraGrupoPlano: TtecQuery;
    dsrProcuraGrupoPlano: TtecDataSource;
    qryProcuraGrupoPlanocodigo: TStringField;
    qryProcuraGrupoPlanodescricao: TStringField;
    qryConsultaGrupoPlano: TtecQuery;
    qryConsultaGrupoPlanocodigo: TStringField;
    qryConsultaGrupoPlanodescricao: TStringField;
    qryPlanosGruposplano: TIntegerField;
    qryPlanosClassesplano: TIntegerField;
    qryProcuraClassePlano: TtecQuery;
    qryProcuraClassePlanocodigo: TStringField;
    qryProcuraClassePlanodescricao: TStringField;
    dsrProcuraClassePlano: TtecDataSource;
    qryConsultaClassePlano: TtecQuery;
    qryConsultaClassePlanocodigo: TStringField;
    qryConsultaClassePlanodescricao: TStringField;
    spcPlanosProximo: TtecQuery;
    spcPlanosProximocodigo: TIntegerField;
    qryConsultaConstratos: TtecQuery;
    qryConsultaConstratosqtdade: TLargeintField;
    qryPlanosMesTrintaDias: TBooleanField;
    qryPlanosMultiplo: TFloatField;
    qryPlanosToleranciaEntreParcelas: TIntegerField;
    qryPlanosDesagio: TFloatField;
    qryPlanosTipoRecebimento: TIntegerField;
    qryProcuraTiposRecebimentos: TtecQuery;
    dsrProcuraTiposRecebimentos: TtecDataSource;
    qryProcuraTiposRecebimentoscodigo: TIntegerField;
    qryProcuraTiposRecebimentosdescricao: TStringField;
    qryConsultaTiposRecebimentos: TtecQuery;
    qryConsultaTiposRecebimentoscodigo: TIntegerField;
    qryConsultaTiposRecebimentosdescricao: TStringField;
    qryPlanosAlterarTipoRecebimento: TBooleanField;
    qryPlanosAparecerNoSite: TBooleanField;
    qryConsultaPlanosaparecenosite: TStringField;
    qryPlanosenviarboletoemail: TBooleanField;
    qryPlanospermitirimpressaodoboleto: TBooleanField;
    qryPlanosminimoparcelaaotipodereceb: TBooleanField;
    procedure qryPlanosAfterOpen(DataSet: TDataSet);
    procedure qryPlanosNewRecord(DataSet: TDataSet);
    procedure qryPlanosGruposAfterDelete(DataSet: TDataSet);
    procedure dsrPlanosDataChange(Sender: TObject; Field: TField);
    procedure qryPlanosAfterDelete(DataSet: TDataSet);
    procedure qryPlanosAfterInsert(DataSet: TDataSet);
  protected
    FPlanosAfterOpen: TNotifyEvent;
    procedure FiltrarClassesIncluidas;
    procedure FiltrarGruposIncluidos;
    procedure FiltrarRegistroIncluidos(qryTabela, qryTabConsulta, qryTabProcura: TtecQuery; Campo: TStringField);
    function getReadOnly: Boolean;
    function GetTabelaClassePlanos: TZDataSet;
    function GetTabelaConsultaAgentes: TZDataSet;
    function GetTabelaConsultaGrupoPlanos: TZDataSet;
    function GetTabelaConsultaClassePlanos: TZDataSet;
    function GetTabelaConsultaPlanos: TZDataSet;
    function GetTabelaConsultaTiposPlanos: TZDataSet;
    function GetTabelaGrupoPlanos: TZDataSet;
    function GetTabelaPlanos: TZDataSet;
    function GetTabelaConsultaTiposRecebimentos: TZDataSet;
  public
    constructor Create(AOwner: TComponent); override;
    function NumeroParcelasEhValido:Boolean;
    function CancelarEdicao: Boolean;
    function GravarClassePlano: Boolean;
    function GravarGrupoPlano: Boolean;
    function GravarPlano: Boolean;
    function ExcluirClassePlano: Boolean;
    function ExcluirGrupoPlano: Boolean;
    function ExcluirPlano: Boolean;
    function ExisteAgente(campo, codigo: string): boolean;
    function ExisteClassePlano(campo, codigo: string): boolean;
    function ExisteGrupoPlano(campo, codigo: string): boolean;
    function ExistePlano(campo, codigo: string): boolean;
    function ExisteTipoPlano(campo, codigo: string): boolean;
    function ExisteTipoRecebimento(campo, codigo: string): boolean;
    function IncluirClassePlano: Boolean;
    function IncluirGrupoPlano: Boolean;
    function IncluirPlano: Boolean;
    function ValidarPlano: Boolean;
    procedure SelecionarClassePlano;
    procedure SelecionarGrupoPlano;
    procedure SelecionarPlano(TipoConsulta: TtecCrediarioConsultaPlanoPagamento);
    property ReadOnly: Boolean read getReadOnly;
    property PlanosAfterOpen: TNotifyEvent read FPlanosAfterOpen write FPlanosAfterOpen;
    property TabelaConsultaAgentes: TZDataSet read GetTabelaConsultaAgentes;
    property TabelaConsultaClassePlanos: TZDataSet read GetTabelaConsultaClassePlanos;
    property TabelaConsultaGrupoPlanos: TZDataSet read GetTabelaConsultaGrupoPlanos;
    property TabelaConsultaPlanos: TZDataSet read GetTabelaConsultaPlanos;
    property TabelaConsultaTiposPlanos: TZDataSet read GetTabelaConsultaTiposPlanos;
    property TabelaClassePlanos: TZDataSet read GetTabelaClassePlanos;
    property TabelaGrupoPlanos: TZDataSet read GetTabelaGrupoPlanos;
    property TabelaPlanos: TZDataSet read GetTabelaPlanos;
    property TabelaConsultaTiposRecebimentos: TZDataSet read GetTabelaConsultaTiposRecebimentos;
  end;

var
  dtmCadastroPlanosPagamentos: TdtmCadastroPlanosPagamentos;

implementation

Uses
  //Repositorio
  dmtecsoft, DateUtils;

{$R *.dfm}

{ TdtmCadastroPlanosPagamentos }

function TdtmCadastroPlanosPagamentos.CancelarEdicao: Boolean;
begin
  qryPlanosAfterOpen(nil);
  Result := true
end;

constructor TdtmCadastroPlanosPagamentos.Create(AOwner: TComponent);
begin
  inherited;
  qryPlanos.Tag               := ctCrediarioTabelaPlanos;
  qryConsultaPlanos.Tag       := ctCrediarioTabelaConsultaPlanos;
  qryConsultaTiposPlanos.Tag  := ctCrediarioTabelaConsultaTiposPlanos;
  qryConsultaAgentes.Tag      := ctCrediarioTabelaConsultaAgentes;
  qryConsultaGrupoPlano.Tag   := ctCrediarioConsultaGrupos;
  qryConsultaClassePlano.Tag  := ctCrediarioConsultaClasses;
  qryConsultaTiposRecebimentos.Tag := ctCrediarioTabelaTiposRecebimentos;
end;

procedure TdtmCadastroPlanosPagamentos.dsrPlanosDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryPlanosDiaVenctoEntrada then begin
    if not qryPlanosDiaVenctoEntrada.IsNull then
      qryPlanosPrazoVenctoEntrada.Clear;
  end
  else if Field = qryPlanosAposDia then begin
    if not qryPlanosAposDia.IsNull then
      qryPlanosDiaBase.Clear;
  end
  else if Field = qryPlanosDiaBase then begin
    if not qryPlanosDiaBase.IsNull then
      qryPlanosAlterarVencimento.AsBoolean:= False;
  end;
end;

function TdtmCadastroPlanosPagamentos.ExcluirClassePlano: Boolean;
begin
  Result := False;
  if not qryPlanosClasses.IsEmpty then
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, [ctACLASSE])) = smbOk then begin
      qryPlanos.Edit;
      qryPlanosClasses.Delete;
      Result := True
    end;
end;

function TdtmCadastroPlanosPagamentos.ExcluirGrupoPlano: Boolean;
begin
  Result := False;
  if not qryPlanosGrupos.IsEmpty then
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, [ctOGRUPO])) = smbOk then begin
      qryPlanos.Edit;
      qryPlanosGrupos.Delete;
      Result := True
    end;
end;

function TdtmCadastroPlanosPagamentos.ExcluirPlano: Boolean;
//var
//  ValorAnt: Boolean;
begin
  Result := False;
  if not qryPlanos.IsEmpty then
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, [ctOPLANOPAGAMENTO])) = smbOk then begin
//      ValorAnt := qryPlanos.RequestLive;
//      qryPlanos.RequestLive := True;
      qryPlanos.Delete;
      try
        Perpetrar([qryPlanos]);
      finally
//        qryPlanos.RequestLive := ValorAnt
      end;
      Result := True;
    end;
end;

function TdtmCadastroPlanosPagamentos.ExisteAgente(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaAgentes, campo, codigo);
end;

function TdtmCadastroPlanosPagamentos.ExisteClassePlano(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaClassePlano, campo, codigo);
end;

function TdtmCadastroPlanosPagamentos.ExisteGrupoPlano(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaGrupoPlano, campo, codigo);
end;

function TdtmCadastroPlanosPagamentos.ExistePlano(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaPlanos, campo, codigo);
end;

function TdtmCadastroPlanosPagamentos.ExisteTipoPlano(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaTiposPlanos, campo, codigo);
end;

function TdtmCadastroPlanosPagamentos.ExisteTipoRecebimento(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaTiposRecebimentos, campo, codigo);
end;

procedure TdtmCadastroPlanosPagamentos.FiltrarclassesIncluidas;
begin
  FiltrarRegistroIncluidos(qryPlanosClasses,
                           qryConsultaClassePlano,
                           qryProcuraClassePlano,
                           qryPlanosClassesclasse);
end;

procedure TdtmCadastroPlanosPagamentos.FiltrarGruposIncluidos;
begin
  FiltrarRegistroIncluidos(qryPlanosGrupos,
                           qryConsultaGrupoPlano,
                           qryProcuraGrupoPlano,
                           qryPlanosGruposgrupo);
end;

procedure TdtmCadastroPlanosPagamentos.FiltrarRegistroIncluidos(
  qryTabela, qryTabConsulta, qryTabProcura: TtecQuery; Campo: TStringField);
const
  Where = 'where ';
  OpAND = 'and ';
  SQL = 'Not (codigo in (%s))';
var
  pos: TBookmark;
  Str: String;
begin
  pos := qryTabela.GetBookmark;
  qryTabela.DisableControls;
  try
    Str := '';
    qryTabela.First;
    while Not qryTabela.Eof do begin
      Str := Str + '''' + Campo.AsString + ''',';
      qryTabela.Next
    end;
    if Str <> '' then begin
      Str := Format(SQL, [Copy(Str, 1, Length(Str) - 1)]);
      qryTabConsulta.Sql[3] := Where + Str;
      qryTabProcura.Sql[4]  := OpAND + Str;
    end else begin
      qryTabConsulta.Sql[3] := '';
      qryTabProcura.Sql[4]  := '';
    end
  finally
    qryTabela.GotoBookmark(pos);
    qryTabela.EnableControls
  end
end;

function TdtmCadastroPlanosPagamentos.getReadOnly: Boolean;
begin
  Result:= (qryConsultaConstratosqtdade.AsInteger > 0);
//  Result := Not qryPlanos.RequestLive
end;

function TdtmCadastroPlanosPagamentos.GetTabelaClassePlanos: TZDataSet;
begin
  Result := qryPlanosClasses
end;

function TdtmCadastroPlanosPagamentos.GetTabelaConsultaAgentes: TZDataSet;
begin
  Result := qryConsultaAgentes
end;

function TdtmCadastroPlanosPagamentos.GetTabelaConsultaClassePlanos: TZDataSet;
begin
  Result := qryConsultaClassePlano
end;

function TdtmCadastroPlanosPagamentos.GetTabelaConsultaGrupoPlanos: TZDataSet;
begin
  Result := qryConsultaGrupoPlano
end;

function TdtmCadastroPlanosPagamentos.GetTabelaConsultaPlanos: TZDataSet;
begin
  Result:= qryConsultaPlanos;
end;

function TdtmCadastroPlanosPagamentos.GetTabelaConsultaTiposPlanos: TZDataSet;
begin
  Result := qryConsultaTiposPlanos
end;

function TdtmCadastroPlanosPagamentos.GetTabelaGrupoPlanos: TZDataSet;
begin
  Result := qryPlanosGrupos
end;

function TdtmCadastroPlanosPagamentos.GetTabelaPlanos: TZDataSet;
begin
  Result:= qryPlanos;
end;

function TdtmCadastroPlanosPagamentos.GetTabelaConsultaTiposRecebimentos: TZDataSet;
begin
  Result := qryConsultaTiposRecebimentos
end;

function TdtmCadastroPlanosPagamentos.GravarClassePlano: Boolean;
begin
  if qryPlanosClasses.State = dsInsert then
    qryPlanosClassesplano.AsInteger := qryPlanosCodigo.AsInteger;
  qryPlanosClasses.Post;
  Result := True
end;

function TdtmCadastroPlanosPagamentos.GravarGrupoPlano: Boolean;
begin
  if qryPlanosGrupos.State = dsInsert then
    qryPlanosGruposplano.AsInteger := qryPlanosCodigo.AsInteger;
  qryPlanosGrupos.Post;
  Result := True
end;

function TdtmCadastroPlanosPagamentos.GravarPlano: Boolean;
begin
  qryPlanosPrazoVenctoEntrada.Required:= True;
  If qryPlanosDiaVenctoEntrada.AsDateTime > 0 then
    qryPlanosPrazoVenctoEntrada.Required:= False;
  if qryPlanos.CheckRequiredFields and ValidarPlano then begin
    if qryPlanos.State = dsInsert then begin
      spcPlanosProximo.Open;
      qryPlanosCodigo.AsInteger := spcPlanosProximocodigo.AsInteger;
      spcPlanosProximo.Close;
    end;
    if qryPlanosMultiplo.AsFloat = 0 then
        qryPlanosMultiplo.AsFloat:= 0.01;
    qryPlanos.Post;
    Perpetrar([qryPlanos, qryPlanosGrupos, qryPlanosClasses]);
    Result:= True;
  end else
    Result:= False;
end;

function TdtmCadastroPlanosPagamentos.IncluirClassePlano: Boolean;
begin
  qryPlanos.Edit;
  FiltrarClassesIncluidas;
  qryPlanosClasses.Append;
  Result := True
end;

function TdtmCadastroPlanosPagamentos.IncluirGrupoPlano: Boolean;
begin
  qryPlanos.Edit;
  FiltrarGruposIncluidos;
  qryPlanosGrupos.Append;
  Result := True
end;

function TdtmCadastroPlanosPagamentos.IncluirPlano: Boolean;
begin
//  qryPlanos.RequestLive := True; 
  qryPlanos.Insert;
  Result:= True;
end;

function TdtmCadastroPlanosPagamentos.NumeroParcelasEhValido: Boolean;
begin
  Result:= True;
  if (qryPlanosIntervaloParcelas.AsInteger <> 30) and
     (qryPlanosquantidadeparcelas.AsInteger > 4)  then begin
     MensagemAviso(ctSOMEMTEQUATROPARCELAS);
     Result:= False;
  end;
end;

procedure TdtmCadastroPlanosPagamentos.qryPlanosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qryPlanosCodigo.AsInteger > 0 then begin
    ReFazConsulta(qryPlanosGrupos,[0],[qryPlanosCodigo.AsInteger]);
    ReFazConsulta(qryPlanosClasses,[0],[qryPlanosCodigo.AsInteger]);
    ReFazConsulta(qryConsultaConstratos,[0],[qryPlanosCodigo.AsInteger]);
  end;
  if Assigned(FPlanosAfterOpen) then
    FPlanosAfterOpen(qryPlanos);
end;

procedure TdtmCadastroPlanosPagamentos.qryPlanosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryConsultaConstratos, [0], [qryPlanosCodigo.AsInteger]);
  if Assigned(FPlanosAfterOpen) then
    FPlanosAfterOpen(qryPlanos);
end;

procedure TdtmCadastroPlanosPagamentos.qryPlanosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryConsultaConstratos, [0], [qryPlanosCodigo.AsInteger]);
  if Assigned(FPlanosAfterOpen) then
    FPlanosAfterOpen(qryPlanos);
end;

procedure TdtmCadastroPlanosPagamentos.qryPlanosGruposAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qryPlanos.Edit;
end;

procedure TdtmCadastroPlanosPagamentos.qryPlanosNewRecord(DataSet: TDataSet);
begin
   inherited;
   qryPlanosTaxaMensalJuros.AsFloat   := 0.00;
   qryPlanosMultiplo.       AsFloat   := 0.01;
//   qryPlanosAposDia.        AsInteger :=    0;
   qryPlanosDesagio.        AsFloat   := 0.00;
//   qryPlanosDiaBase.        AsInteger           := 0;

   qryPlanosValidadeInicial.AsDateTime:= DataServidor;
   qryPlanosValidadeFinal.  AsDateTime:= StrToDate('31/12/' + FStr(YearOf(DataServidor)+10,$41));

   qryPlanosAlterarValor.          AsBoolean:= False;
   qryPlanosAlterarVencimento.     AsBoolean:= False;
   qryPlanosAlterarTipoRecebimento.AsBoolean:= False;

   qryPlanosTipoComissao.AsString  := '%';
   qryPlanosComissao.    AsFloat   :=    0;

   qryPlanosQuantidadeParcelas.AsInteger:=    1;
   qryPlanosValorMinimoParcela.AsFloat  := 0.00;
   qryPlanosIntervaloParcelas.AsInteger :=   30;
//   qryPlanosPrazoVenctoEntrada.AsInteger:=    0;
   qryPlanosMesTrintaDias.AsBoolean     := True;

//   qryPlanosPrazoVenctoEntrada.AsInteger:=     0;
//   qryPlanosToleranciaEntrada. AsInteger:=     0;
   qryPlanosPorcentagemEntrada.AsFloat  :=  0.00;

   qryPlanosCompraMinima.  AsFloat:=      0;
   qryPlanosCompraMaxima.  AsFloat:= 999999;
   qryPlanosDescontoMaximo.AsFloat:=  10.00;

   qryPlanosImprParcelaCarne.AsBoolean:= false;
   qryPlanosEnderecoCompleto.AsBoolean:= false;
   qryPlanosAparecerNoSite.  AsBoolean:= false;
end;

procedure TdtmCadastroPlanosPagamentos.SelecionarClassePlano;
begin
  if qryPlanosClasses.State = dsBrowse then
    qryPlanosClasses.Edit;
  qryPlanosClassesclasse.AsString    := qryConsultaClassePlanocodigo.AsString;
  qryPlanosClassesdescricao.AsString := qryConsultaClassePlanodescricao.AsString;
end;

procedure TdtmCadastroPlanosPagamentos.SelecionarGrupoPlano;
begin
  if qryPlanosGrupos.State = dsBrowse then
    qryPlanosGrupos.Edit;
  qryPlanosGruposgrupo.AsString     := qryConsultaGrupoPlanocodigo.AsString;
  qryPlanosGruposdescricao.AsString := qryConsultaGrupoPlanodescricao.AsString;
end;

procedure TdtmCadastroPlanosPagamentos.SelecionarPlano(TipoConsulta: TtecCrediarioConsultaPlanoPagamento);
begin
  case TipoConsulta of
    cppTIPOPLANO: begin
                    qryPlanos.Edit;
                    qryPlanosTipoPlano.AsInteger  := qryConsultaTiposPlanoscodigo.AsInteger;
                  end;
    cppAGENTES: begin
                  qryPlanos.Edit;
                  qryPlanosAgente.AsInteger:= qryConsultaAgentescodigo.AsInteger;
                end;
    cppTIPOSRECEBIMENTOS: begin
                            qryPlanos.Edit;
                            qryPlanosTipoRecebimento.AsInteger:= qryConsultaTiposRecebimentoscodigo.AsInteger;
                          end;
    else
      ReFazConsulta(qryPlanos,[0],[qryConsultaPlanoscodigo.asInteger]);
  end
end;

function TdtmCadastroPlanosPagamentos.ValidarPlano: Boolean;
begin
  Result := True;
  if qryPlanosQuantidadeParcelas.AsInteger <= 0 then begin
    MensagemAviso(ctQTDADEPARCELASPLANO);
    Result := False
  end else if qryPlanosValidadeInicial.AsDateTime > qryPlanosValidadeFinal.AsDateTime then begin
    MensagemAviso(ctPLANOVALIDADEINICIALMAIORVALIDADEFINAL);
    Result := False;
  end else if qryPlanosCompraMinima.AsFloat <> 0 then begin
    if qryPlanosPorcentagemEntrada.IsNull  or (qryPlanosPorcentagemEntrada.AsFloat = 0) then begin
      if (qryPlanosCompraMinima.AsFloat < (qryPlanosQuantidadeParcelas.AsInteger * qryPlanosValorMinimoParcela.AsFloat)) then begin
        MensagemAviso(ctCOMPRAMINIMAFORALIMITE);
        qryPlanosCompraMinima.FocusControl;
        Result := False;
      end
    end else if (qryPlanosCompraMinima.AsFloat <
          RoundTo(((qryPlanosQuantidadeParcelas.AsInteger - 1) * qryPlanosValorMinimoParcela.AsFloat) /
                   (1 - (qryPlanosPorcentagemEntrada.AsFloat / 100)),-2))
    then begin
      MensagemAviso(ctCOMPRAMINIMAFORALIMITE);
      qryPlanosCompraMinima.FocusControl;
      Result := False;
    end;
  end else if qryPlanosCompraMaxima.AsFloat <> 0 then
    if (qryPlanosCompraMaxima.AsFloat < qryPlanosCompraMinima.AsFloat) then begin
        MensagemAviso(ctCOMPRAMAXIMAFORALIMITE);
        qryPlanosCompraMaxima.FocusControl;
        Result := False;
    end
end;




end.
