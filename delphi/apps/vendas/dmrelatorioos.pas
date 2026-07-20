unit dmrelatorioos;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, FR_DSet, FR_DBSet, FR_Class, fmpreviewpadrao,
  //projetos
  ctconstantes, dmimprimeordemservicos, ZTransact, biblio, dmtecsoft;


type
  TdtmRelatorioOS = class(TdtmBasico)
//   procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FParametroCabecalho: String;
    FDataFinalAbertura: String;
    FDataInicialAbertura: String;
    FDataFinalFechamento: String;
    FDataInicialFechamento: String;
    FCliente: String;
    FComCustoMedio: Boolean;
    FOSFechada: Boolean;
    FOSAberta: Boolean;
    FtipoRelatorio: integer;
    FFilial: String;
    FAgrupamentoAbertura: Boolean;
    FAgrupamentoFechamento: Boolean;
    FAgrupamentoNroOs: Boolean;
    FParametroAgrupamento: String;
    fOrdemServicoemGarantia: boolean;
    fOrdemServicoemCortesia: boolean;
    fLogicaGarantia: String;
    fGarantiaAprovada: boolean;
    fGarantiaReprovada: boolean;
    fGarantiaNaoDefinida: boolean;
    fEquipamento: String;
    fListaTiposAtendimentos: String;
    fIncluirRegistrosSemAtendimentos: Boolean;
    fTodosListaTiposAtendimentosMarcados: Boolean;
    fComAtendimento: Boolean;
    fSemAtendimento: Boolean;
    fEmAberto: Boolean;
    fEmAtraso: Boolean;
    FQuitado: Boolean;
    fRenegociado: Boolean;
    fDataInicialUltimoPagamento: String;
    fDataFinalUltimoPagamento: String;
    procedure SetDataFinalAbertura(const Value: String);
    procedure SetDataFinalFechamento(const Value: String);
    procedure SetCliente(const Value: String);
    procedure SetOSFechada(const Value: Boolean);
    procedure SetFilial(const Value: String);
    procedure SetAgrupamentoAbertura(const Value: Boolean);
    procedure SetAgrupamentoFechamento(const Value: Boolean);
    procedure SetAgrupamentoNroOs(const Value: Boolean);
    procedure SetTipoEqptoOrdemServico(const Value: String);
    procedure SetLogicaGarantia(const Value: String);
    procedure SetEquipamento(const Value: String);
    procedure SetSituacao(const Value: String);
    procedure SetListaTiposAtendimentos(const Value: String);
    procedure SetEmAberto(const Value: Boolean);
    procedure SetEmAtraso(const Value: Boolean);
    procedure SetQuitado(const Value: Boolean);
    procedure SetRenegociado(const Value: Boolean);
    procedure SetDataFinalUltimoPagamento(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    dtmImprimeOrdemServicos: TdtmImprimeOrdemServicos;
    constructor Create(AOwner: TComponent); override;

    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property ParametroAgrupamento: String read FParametroAgrupamento write FParametroAgrupamento;

    property DataInicialAbertura: String read FDataInicialAbertura write FDataInicialAbertura;
    property DataFinalAbertura: String read FDataFinalAbertura write SetDataFinalAbertura;

    property DataInicialUltimoPagamento: String read fDataInicialUltimoPagamento write fDataInicialUltimoPagamento;
    property DataFinalUltimoPagamento: String read fDataFinalUltimoPagamento write SetDataFinalUltimoPagamento;


    property DataInicialFechamento: String read FDataInicialFechamento write FDataInicialFechamento;
    property DataFinalFechamento: String read FDataFinalFechamento write SetDataFinalFechamento;
    
    property Cliente: String read FCliente write SetCliente;
    property Filial: String read FFilial write SetFilial;
    property ComCustoMedio: Boolean read FComCustoMedio write FComCustoMedio;
    property OSAberta: Boolean read FOSAberta write FOSAberta;
    property OSFechada: Boolean read FOSFechada write SetOSFechada;
    property TipoRelatorio: integer read FtipoRelatorio write FTiporelatorio;
    property AgrupamentoNroOs: Boolean read FAgrupamentoNroOs write SetAgrupamentoNroOs;
    property AgrupamentoAbertura: Boolean read FAgrupamentoAbertura write SetAgrupamentoAbertura;
    property AgrupamentoFechamento: Boolean read FAgrupamentoFechamento write SetAgrupamentoFechamento;
    property TipoEqptoOrdemServico: String write SetTipoEqptoOrdemServico;

    property OrdemServicoemGarantia: boolean read fOrdemServicoemGarantia write fOrdemServicoemGarantia;
    property OrdemServicoemCortesia: boolean read fOrdemServicoemCortesia write fOrdemServicoemCortesia;

    property GarantiaAprovada: boolean read fGarantiaAprovada write fGarantiaAprovada;
    property GarantiaReprovada: boolean read fGarantiaReprovada write fGarantiaReprovada;
    property GarantiaNaoDefinida: boolean read fGarantiaNaoDefinida write fGarantiaNaoDefinida;

    property Equipamento: String read fEquipamento write SetEquipamento;
    property FSituacao: String write SetSituacao;


    property LogicaGarantia: String read fLogicaGarantia write SetLogicaGarantia;

    property SemAtendimento: Boolean read fSemAtendimento write fSemAtendimento;
    property ComAtendimento: Boolean read fComAtendimento write fComAtendimento;

    property TodosListaTiposAtendimentosMarcados: Boolean read fTodosListaTiposAtendimentosMarcados write fTodosListaTiposAtendimentosMarcados;
    property ListaTiposAtendimentos: String read fListaTiposAtendimentos write SetListaTiposAtendimentos;


    property EmAberto: Boolean read fEmAberto write SetEmAberto;
    property Quitado: Boolean read FQuitado write SetQuitado;
    property Renegociado: Boolean read fRenegociado write SetRenegociado;
    property EmAtraso : Boolean read fEmAtraso write SetEmAtraso;


    function AbrirRelatorio: Boolean;
    procedure ImprimirRelatorio;



  end;

var
  dtmRelatorioOS: TdtmRelatorioOS;

implementation

{$R *.dfm}

{ TdtmRelatorioOS }


function TdtmRelatorioOS.AbrirRelatorio: Boolean;
begin
 ReFazConsulta(dtmImprimeOrdemServicos.qryOrdemServicos,[],[]);
 result := not dtmImprimeOrdemServicos.qryOrdemServicos.IsEmpty;
end;

constructor TdtmRelatorioOS.Create(AOwner: TComponent);
begin
  inherited;
  dtmImprimeOrdemServicos := TdtmImprimeOrdemServicos.Create(Self);
end;

procedure TdtmRelatorioOS.ImprimirRelatorio;
begin
  dtmImprimeOrdemServicos.AgruparNroOs:= AgrupamentoNroOs;
  dtmImprimeOrdemServicos.AgruparAbertura:= AgrupamentoAbertura;
  dtmImprimeOrdemServicos.AgruparFechamento:= AgrupamentoFechamento;
  dtmImprimeOrdemServicos.ImprimirRelatorio(FParametroCabecalho,FParametroAgrupamento, FTipoRelatorio, FComCustoMedio);
end;

procedure TdtmRelatorioOS.SetDataFinalAbertura(const Value: String);
const
 SQL = 'and ct.data between %s and %s';
begin
  FDataFinalAbertura := Value;
  if value='' then
    FDataFinalAbertura:=FDataInicialAbertura;

  if FDataInicialAbertura='' then
    FDataInicialAbertura:=FDataFinalAbertura;

  if FDataFinalAbertura<>'' then
  begin
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('DataEntrada').AsString := format(SQL,[quotedstr(FDataInicialAbertura),
                                                                                                quotedstr(FDataFinalAbertura)]);
    FParametroCabecalho:=FParametroCabecalho+' Abertura entre: '+FDataInicialAbertura+' e '+FDataFinalAbertura;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('DataEntrada').AsString := '';
end;

procedure TdtmRelatorioOS.SetDataFinalFechamento(const Value: String);
const
 SQL = 'and ct.datafechamento between %s and %s';
begin
  FDataFinalFechamento := Value;
  if value='' then
    FDataFinalFechamento:=FDataInicialFechamento;

  if FDataInicialFechamento='' then
    FDataInicialFechamento:=FDataFinalFechamento;

  if FDataFinalFechamento<>'' then
  begin
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('DataFechamento').AsString := Format(SQL,[quotedstr(FDataInicialFechamento),
    quotedstr(FDataFinalFechamento)]);
    FParametroCabecalho:=FParametroCabecalho+' Fechamento entre: '+FDataInicialFechamento+' e '+FDataFinalFechamento;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('DataFechamento').AsString:= '';
end;


procedure TdtmRelatorioOS.SetCliente(const Value: String);
const
 SQL = 'and ct.cliente = %s';
begin
  FCliente := Value;
  if value <> '' then
  begin
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('cliente').AsString := Format(SQL,[Value]);;
    FParametroCabecalho:=FParametroCabecalho+' Cliente: '+Value;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('cliente').AsString := '';
end;

procedure TdtmRelatorioOS.SetOSFechada(const Value: Boolean);
begin
  FOSFechada := Value;
  if FOSAberta and not FOSFechada then
  begin
   dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('situacao').AsString := 'and ct.situacao IN (''O'',''R'')';
   FParametroCabecalho:=FParametroCabecalho+' O.S. Abertas ';
  end
  else
  if not FOSAberta and FOSFechada then
  begin
   dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('situacao').AsString:= 'and ct.situacao in (''N'',''P'')';
   FParametroCabecalho:=FParametroCabecalho+' O.S. Fechadas ';
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('situacao').AsString := '';

end;

procedure TdtmRelatorioOS.SetFilial(const Value: String);
const
 SQL = 'and ct.filialvenda = %s';
begin
  FFilial := Value;
  if value <> '' then
  begin
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('filial').AsString := Format(SQL,[Value]);;
    FParametroCabecalho:=FParametroCabecalho+' Filial: '+Value;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('filial').AsString := '';
end;

{procedure TdtmRelatorioOS.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
 arquivo: String;
begin
  inherited;
  arquivo:='/tmp/Anderson.txt';
  Listar := tStringlist.create;
  if fileexists(arquivo) then
    Listar.loadfromfile(arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(arquivo);
  listar.free;
end;}
procedure TdtmRelatorioOS.SetAgrupamentoNroOs(const Value: Boolean);
begin
  FAgrupamentoNroOs := Value;
  if FAgrupamentoNroOs then
  FParametroAgrupamento:=FParametroAgrupamento+' Número da OS ';
end;

procedure TdtmRelatorioOS.SetAgrupamentoAbertura(const Value: Boolean);
begin
  FAgrupamentoAbertura := Value;
  if FAgrupamentoAbertura then
  FParametroAgrupamento:=FParametroAgrupamento+' Data Abertura ';
end;

procedure TdtmRelatorioOS.SetAgrupamentoFechamento(const Value: Boolean);
begin
  FAgrupamentoFechamento := Value;
  if FAgrupamentoFechamento then
  FParametroAgrupamento:=FParametroAgrupamento+' Data Fechamento ';
end;

procedure TdtmRelatorioOS.SetTipoEqptoOrdemServico(const Value: String);
var
 vValue : String;
begin
  if value <> '' then
  begin
    vValue := Value;
    delete(vValue, length(vvalue),1);
    dtmImprimeOrdemServicos.qryOrdemServicos.macrobyname('TipoEqptoOrdemServico').asString := ' and (ct.tipoequipamento in ('+vValue+'))';
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.macrobyname('TipoEqptoOrdemServico').asString := '';
end;

procedure TdtmRelatorioOS.SetLogicaGarantia(const Value: String);
var
   vSituacaoGarantia : String;
   vStatusGarantia: String;
begin
  fLogicaGarantia := Value;

  vSituacaoGarantia := '';
  vStatusGarantia := '';

  if not ((GarantiaAprovada and GarantiaReprovada and GarantiaNaoDefinida) or
          (not GarantiaAprovada and not GarantiaReprovada and not GarantiaNaoDefinida)) then
  begin
    if (GarantiaAprovada and not GarantiaReprovada and not GarantiaNaoDefinida) then       //VFF
       vStatusGarantia :=  ' and coalesce(ct.os_garantia_status,'''')=''A'''
    else
    if (GarantiaAprovada and  GarantiaReprovada and not GarantiaNaoDefinida) then          //VVF
       vStatusGarantia :=  ' and coalesce(ct.os_garantia_status,'''') in (''A'',''R'')'
    else
    if (GarantiaAprovada and  not GarantiaReprovada and GarantiaNaoDefinida) then          //VFV
       vStatusGarantia :=  ' and (coalesce(ct.os_garantia_status,'''')=''A'' or ct.os_garantia_status is null) '
    else
    if (not GarantiaAprovada and  GarantiaReprovada and not GarantiaNaoDefinida) then      //FVF
       vStatusGarantia :=  ' and coalesce(ct.os_garantia_status,'''')=''R'''
    else
    if (not GarantiaAprovada and  GarantiaReprovada and GarantiaNaoDefinida) then          //FVV
       vStatusGarantia :=  ' and (coalesce(ct.os_garantia_status,'''')=''R'' or ct.os_garantia_status is null) '
    else
    if (not GarantiaAprovada and  not GarantiaReprovada and GarantiaNaoDefinida) then      //FFV
       vStatusGarantia :=  ' and ct.os_garantia_status is null ';
  end;


  if (OrdemServicoemGarantia and OrdemServicoemCortesia) then
  begin
    if logicaGarantia = 'E' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') and coalesce(ct.os_cortesia,false))'
    else
    if logicaGarantia = 'OR' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') or coalesce(ct.os_cortesia,false))'
    else
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') and coalesce(ct.os_cortesia,false))';
  end
  else
  if (OrdemServicoemGarantia and not OrdemServicoemCortesia) then
  begin
    if logicaGarantia = 'E' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') and not coalesce(ct.os_cortesia,false))'
    else
    if logicaGarantia = 'OR' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') or not coalesce(ct.os_cortesia,false))'
    else
      vSituacaoGarantia := vSituacaoGarantia + ' and (coalesce(ct.os_garantia,false) '+ vStatusGarantia + ')';
  end
  else
  if (not OrdemServicoemGarantia and OrdemServicoemCortesia) then
  begin
    if logicaGarantia = 'E' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (not coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') and coalesce(ct.os_cortesia,false))'
    else
    if logicaGarantia = 'OR' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (not coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') or coalesce(ct.os_cortesia,false))'
    else
       vSituacaoGarantia := vSituacaoGarantia + ' and (coalesce(ct.os_cortesia,false))';
  end
  else
  if (not OrdemServicoemGarantia and not OrdemServicoemCortesia) then
  begin
    if logicaGarantia = 'E' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (not coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') and not coalesce(ct.os_cortesia,false))'
    else
    if logicaGarantia = 'OR' then
       vSituacaoGarantia := vSituacaoGarantia + ' and ( (not coalesce(ct.os_garantia,false) '+ vStatusGarantia + ') or not coalesce(ct.os_cortesia,false))';
  end;

  dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('SituacaoGarantia').asString := vSituacaoGarantia;


end;

procedure TdtmRelatorioOS.SetEquipamento(const Value: String);
begin
  fEquipamento := Value;

  if Value <> '' then
    dtmImprimeOrdemServicos.qryOrdemServicos.macrobyname('Equipamento').asString := ' and ct.equipamento = ' + quotedstr(Value)
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.macrobyname('Equipamento').asString := '';

end;

procedure TdtmRelatorioOS.SetSituacao(const Value: String);
var
  SQLSituacao: String;
begin

  SQLSituacao := 'and ct.situacao in (' + Value;
  if Copy(SQLSituacao,length(SQLSituacao),1) = ',' then
    SQLSituacao := Copy(SQLSituacao,1,length(SQLSituacao)-1) + ') ';

  dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('situacao').AsString := SQLSituacao;
  FParametroCabecalho:=FParametroCabecalho+' Situacâo: '+trocar(Value,'''','') ;

end;

procedure TdtmRelatorioOS.SetListaTiposAtendimentos(const Value: String);
begin
  fListaTiposAtendimentos := Value;

  if ComAtendimento and not SemAtendimento then
  begin
    if not TodosListaTiposAtendimentosMarcados then
    begin
      dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('TiposAtendimentos').AsString := ' and tipoatendimentocontrato(ct.numero) in ('+ fListaTiposAtendimentos +')';
      FParametroCabecalho := FParametroCabecalho + ' Tipo de Atendimento : '+fListaTiposAtendimentos;
    end
    else
    begin
      dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('TiposAtendimentos').AsString := 'and coalesce((select true from atendimentos a where a.contrato = ct.numero limit 1),false) ';
      FParametroCabecalho := FParametroCabecalho + ' Tipo de Atendimento : Todos';
    end;
  end
  else
  if not ComAtendimento and SemAtendimento then
  begin
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('TiposAtendimentos').AsString := 'and coalesce((select false from atendimentos a where a.contrato = ct.numero limit 1),true)';
    FParametroCabecalho := FParametroCabecalho + ' Tipo de Atendimento : Sem Atendimentos';
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('TiposAtendimentos').AsString := '';
end;

procedure TdtmRelatorioOS.SetEmAberto(const Value: Boolean);
var SQLEmAberto, vStringFinanceiro: String;
begin
  fEmAberto := Value;
  if Value = True then
  begin
    SQLEmAberto:= 'and ((contratos_emaberto(ct.numero)) = True) and ((ct.situacao not in (''C'',''O'',''R'')))';
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('Emaberto').AsString:= SQLEmAberto;
  end
  else
   dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('Emaberto').AsString:= '';

  vStringFinanceiro := '';
  if EmAberto then
    vStringFinanceiro := 'Em Aberto, ';

  if Quitado then
    vStringFinanceiro := vStringFinanceiro + 'Quitado, ';

  if Renegociado then
    vStringFinanceiro := vStringFinanceiro + 'Renegociado, ';

  if EmAtraso then
    vStringFinanceiro := vStringFinanceiro + 'Em atraso, ';

  if vStringFinanceiro <> '' then
  begin
    delete(vStringFinanceiro, length(vStringFinanceiro)-2, 2);
    FParametroCabecalho := FParametroCabecalho + ' Situação Financeira: '+vStringFinanceiro;
  end;
end;

procedure TdtmRelatorioOS.SetEmAtraso(const Value: Boolean);
var SQLEmAtraso: String;
begin
  fEmAtraso := Value;
  if Value = True then
  begin
    SQLEmAtraso:= 'and ((Position(''/'' in (vficha_situacaocontrato(ct.numero)))>0) and ((ct.situacao not in (''C'',''O'',''R''))))';
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('EmAtraso').AsString:= SQLEmAtraso;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('EmAtraso').AsString:= '';
end;


procedure TdtmRelatorioOS.SetQuitado(const Value: Boolean);
var SQLQuitado: String;
begin
  FQuitado := Value;
  if Value = True then
  begin
    SQLQuitado:= 'and (((contratos_quitado(ct.numero)) = True ) and not (ct.situacao in (''C'',''O'',''R'')) and (vficha_situacaocontrato(ct.numero) <> ''ESTORNADO''))';
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('Quitado').AsString:= SQLQuitado;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('Quitado').AsString:= '';
end;

procedure TdtmRelatorioOS.SetRenegociado(const Value: Boolean);
var SQLRenegociado: String;
begin
  fRenegociado := Value;
  if Value = True then
  begin
    SQLRenegociado:= 'and ((ct.renegociacao is not null) and (vficha_situacaocontrato(ct.numero) <> ''ESTORNADO''))';
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('Renegociado').AsString:= SQLRenegociado;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('Renegociado').AsString:= ' and contratos_atual(ct.numero) ';
end;


procedure TdtmRelatorioOS.SetDataFinalUltimoPagamento(const Value: String);
const
 SQL =
  ' and (select max(pa.datapagto)                                             '+
  '      from parcelas pa                                                    '+
  '      where pa.contrato = ct.numero                                       '+
  '       and not exists (select pa2.contrato                                '+
  '                       from parcelas pa2                                  '+
  '                       where pa2.contrato = pa.contrato                   '+
  '                         and pa2.datapagto is null)) between %s and %s   ';

begin
  fDataFinalUltimoPagamento := Value;

  if value='' then
    FDataFinalUltimoPagamento:=FDataInicialUltimoPagamento;

  if FDataInicialUltimoPagamento='' then
    FDataInicialUltimoPagamento:=FDataFinalUltimoPagamento;

  if (fDataInicialUltimoPagamento<>'') and (fDataFinalUltimoPagamento<>'') then
  begin
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('DataUltimoPagamento').AsString := Format(SQL,[quotedstr(FDataInicialUltimoPagamento),
    quotedstr(FDataFinalUltimoPagamento)]);
    FParametroCabecalho:=FParametroCabecalho+' Ultimo Pagamento entre: '+FDataInicialUltimoPagamento+' e '+FDataFinalUltimoPagamento;
  end
  else
    dtmImprimeOrdemServicos.qryOrdemServicos.MacroByName('DataUltimoPagamento').AsString:= '';
end;


end.
