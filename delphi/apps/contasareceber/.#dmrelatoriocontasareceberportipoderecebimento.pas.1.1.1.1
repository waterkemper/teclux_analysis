unit dmrelatoriocontasareceberportipoderecebimento;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_dset, fr_dbset, fr_class, Biblio, fmpreviewpadrao,
  ZTransact;

type
  Tdtmrelatoriocontasareceberportipoderecebimento = class(TdtmBasico)
    qryRecebimentos: TtecQuery;
    dsrRecebimentos: TtecDataSource;
    frpRecebimentos: TfrReport;
    fdsRecebimentos: TfrDBDataSet;
    ZMonitor1: TZMonitor;
    qryRecebimentoscontrato: TStringField;
    qryRecebimentosnumeroparcela: TIntegerField;
    qryRecebimentosparcelaorigem: TStringField;
    qryRecebimentoscliente: TIntegerField;
    qryRecebimentosnomecliente: TStringField;
    qryRecebimentosfilial: TIntegerField;
    qryRecebimentosnomefilialemissao: TStringField;
    qryRecebimentoscodigotiporecebimento: TIntegerField;
    qryRecebimentosdescricaotiporecebimento: TStringField;
    qryRecebimentosdatavencto: TDateField;
    qryRecebimentosvalorvencto: TFloatField;
    qryRecebimentosnumerocheque: TStringField;
    qryRecebimentosvendedor: TIntegerField;
    qryRecebimentosnomevendedor: TStringField;
    qryRecebimentostipocliente: TStringField;
    qryRecebimentosjuros: TFloatField;
    qryRecebimentosTotalDevido: TCurrencyField;
    qryRecebimentospdesagio: TFloatField;
    qryRecebimentosvalordesagio: TFloatField;
    qryRecebimentosvalorlancto: TFloatField;
    qryRecebimentosconfirmado: TBooleanField;
    frpRecebimentosResumo: TfrReport;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpRecebimentosBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryRecebimentosCalcFields(DataSet: TDataSet);
  private
    FAgruparFilial: Boolean;
    FAgruparCliente: Boolean;
    FAgruparData: Boolean;
    FResumo: Integer;
    FPeriodoFinalVencto: String;
    FPeriodoInicialVencto: String;
    FParametroCabecalho: String;
    FTipoCliente: String;
    FFilial: String;
    FAgruparVendedor: Boolean;
    FAgruparTipodeRecebimento: Boolean;
    FTipodeRecebimento: String;
    FPeriodoInicialEmissao: String;
    FPeriodoFinalEmissao: String;
    FChequesAvulsos: Boolean;
    FConfirmados: Integer;
    procedure MontaIntervaloPeriodoVencimento;
    procedure MontaIntervaloPeriodoEmissao;

    procedure SetAgruparData(const Value: Boolean);
    procedure SetBanco(const Value: String);
    procedure SetFilial(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetPeriodoFinalVencto(const Value: String);
    procedure SetPeriodoInicialVencto(const Value: String);
    procedure SetResumo(const Value: Integer);
    procedure SetCliente(const Value: String);
    procedure SetTipoCliente(const Value: String);
    procedure SetVendedor(const Value: String);
    procedure SetTipodeRecebimento(const Value: String);
    procedure SetPeriodoFinalEmissao(const Value: String);
    procedure SetPeriodoInicialEmissao(const Value: String);
    procedure SetChequesAvulsos(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    FOrdenacao: String;
    property Filial            : String read  FFilial             write SetFilial;
    property TipodeRecebimento : String read FTipodeRecebimento write SetTipodeRecebimento;
    property GrupoFiliais      : String write SetGrupoFiliais;
    property PeriodoInicialVencto    : String read  FPeriodoInicialVencto     write SetPeriodoInicialVencto;
    property PeriodoFinalVencto      : String read  FPeriodoFinalVencto       write SetPeriodoFinalVencto;

    property ChequesAvulsos : Boolean read FChequesAvulsos write SetChequesAvulsos;

    property PeriodoInicialEmissao    : String read  FPeriodoInicialEmissao     write SetPeriodoInicialEmissao;
    property PeriodoFinalEmissao      : String read  FPeriodoFinalEmissao       write SetPeriodoFinalEmissao;


    property Banco             : String write SetBanco;
    property Cliente           : String write SetCliente;
    property Vendedor          : String write SetVendedor;
    property TipoCliente       : String read  FTipoCliente        write SetTipoCliente;
    property Resumo            : Integer read  FResumo             write SetResumo;
    property AgruparFilial     : Boolean read  FAgruparFilial      write FAgruparFilial;
    property AgruparVendedor   : Boolean read  FAgruparVendedor    write FAgruparVendedor;
    property AgruparCliente    : Boolean read  FAgruparCliente     write FAgruparCliente;
    property AgruparTipodeRecebimento: Boolean read FAgruparTipodeRecebimento  write FAgruparTipodeRecebimento;
    property Confirmados: Integer read FConfirmados write FConfirmados;

    property AgruparData       : Boolean read  FAgruparData        write SetAgruparData;
    property ParametroCabecalho: String  read  FParametroCabecalho write FParametroCabecalho;
    procedure DefineOrdenacao(OrdenarPor: String);

    function  GerarRelatorio: Boolean;
    procedure ImprimirRelatorio;
  end;

var
  dtmrelatoriocontasareceberportipoderecebimento: Tdtmrelatoriocontasareceberportipoderecebimento;

implementation

{$R *.dfm}

{ Tdtmrelatoriocontasareceberportipoderecebimento }

procedure Tdtmrelatoriocontasareceberportipoderecebimento.DefineOrdenacao(ordenarPor: String);
var
Ordenacao : String;
begin
  Ordenacao:='';

  if FAgruparFilial then
    Ordenacao:=Ordenacao + ', nomefilialemissao, filial';

  if FAgruparVendedor then
    Ordenacao:=Ordenacao + ', nomevendedor, vendedor';

  if FAgruparCliente then
    Ordenacao:=Ordenacao + ', nomecliente, cliente, tipocliente';

  if FAgruparTipodeRecebimento then
    Ordenacao:=Ordenacao + ', descricaotiporecebimento, codigotiporecebimento';

  if FAgruparData then
    Ordenacao:=Ordenacao + ', datavencto';

  if Ordenacao<>'' then
    Ordenacao := Ordenacao + ', '+OrdenarPor
  else
    Ordenacao := OrdenarPor;

  qryRecebimentos.MacroByName('Ordenacao').AsString:='Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
end;

function Tdtmrelatoriocontasareceberportipoderecebimento.GerarRelatorio: Boolean;
begin
  if(Confirmados=0) then
  begin
        qryRecebimentos.MacroByName('confirmados').AsString := 'and not confirmado ';
        qryRecebimentos.MacroByName('confirmados_nao_recebimentos').AsString:=' and true ';
  end
  else if (Confirmados=1) then
  begin
        qryRecebimentos.MacroByName('confirmados').AsString := 'and confirmado ';
        qryRecebimentos.MacroByName('confirmados_nao_recebimentos').AsString:=' and false ';
  end
  else if (Confirmados=2) then
  begin
        qryRecebimentos.MacroByName('confirmados').AsString := '';
        qryRecebimentos.MacroByName('confirmados_nao_recebimentos').AsString:='';
  end;
  RefazConsulta(qryRecebimentos,[],[]);
  Result:= qryRecebimentos.IsEmpty;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio;
  frVariables['AgruparFilial'] := FAgruparFilial;
  frVariables['AgruparCliente'] := FAgruparCliente;
  frVariables['AgruparVendedor'] := FAgruparVendedor;
  frVariables['AgruparTipodeRecebimento'] := FAgruparTipodeRecebimento;
  frVariables['AgruparData']        := FAgruparData;

  frVariables['Outras']             := FParametroCabecalho;

  frpRecebimentos.Pages[0].PrintToPrevPage := False;
  frpRecebimentosResumo.Pages[0].PrintToPrevPage := False;


  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  //frpRecebimentos.DesignReport;
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do
    begin
      frVariables['Titulo']:= 'CONTAS A RECEBER';
      case Resumo of
      0: begin
           frCompositeReport.Reports.Add(frpRecebimentos);
           frCompositeReport.Reports.Add(frpRecebimentosResumo);
         end;
      1: frCompositeReport.Reports.Add(frpRecebimentos);
      2: frCompositeReport.Reports.Add(frpRecebimentosResumo);
      end;
    end;
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.DoublePass:=True;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free
  end;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.MontaIntervaloPeriodoVencimento;
begin
  if not DataEmBranco(FPeriodoInicialVencto) then begin
    if DataEmBranco(FPeriodoFinalVencto) then
    begin

     qryRecebimentos.macrobyname('SQLContratoDataVencto').asstring :=
       ' and p.datavencto >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto)));

     qryRecebimentos.macrobyname('SQLRecebimentosDataVencto').asstring :=
       ' and r.datavencto >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto)));

     qryRecebimentos.macrobyname('SQLChequesDataVencto').asstring :=
       ' and ch.vencto >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto)));

     FParametroCabecalho:=FParametroCabecalho+' VENCIMENTOS A PARTIR DE : '+FPeriodoInicialVencto;
    end
    else
    begin
     qryRecebimentos.macrobyname('SQLContratoDataVencto').asstring :=
       ' and p.datavencto between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

     qryRecebimentos.macrobyname('SQLRecebimentosDataVencto').asstring :=
       ' and r.datavencto between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

     qryRecebimentos.macrobyname('SQLChequesDataVencto').asstring :=
       ' and ch.vencto between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

     FParametroCabecalho:=FParametroCabecalho+'VENCIMENTOS ENTRE: '+FPeriodoInicialVencto+' E '+FPeriodoFinalVencto;
    end;
  end
  else begin
    if not DataEmBranco(FPeriodoFinalVencto) then
    begin
      qryRecebimentos.macrobyname('SQLContratoDataVencto').asstring :=
        ' and p.datavencto <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

      qryRecebimentos.macrobyname('SQLRecebimentosDataVencto').asstring :=
        ' and r.datavencto <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

      qryRecebimentos.macrobyname('SQLChequesDataVencto').asstring :=
        ' and ch.vencto <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

      FParametroCabecalho:=FParametroCabecalho+' VENCIMENTOS ATÉ: '+FPeriodoFinalVencto;
    end
    else
    begin
      qryRecebimentos.MacroByName('SQLContratoDataVencto').AsString:= '';
      qryRecebimentos.MacroByName('SQLRecebimentosDataVencto').AsString:= '';
      qryRecebimentos.MacroByName('SQLChequesDataVencto').AsString:= '';

      FParametroCabecalho:=FParametroCabecalho+' TODOS VENCIMENTOS ';
    end;
  end;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetAgruparData(const Value: Boolean);
begin
  FAgruparData := Value;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetBanco(const Value: String);
begin
  if (Value <> '') then
  begin
//    FParametroCabecalho:=FParametroCabecalho+' BANCO: ' + qryRecebimentosnomebanco.AsString;
    qryRecebimentos.MacroByName('Banco').AsString:= 'and (p.contaboleto in (Select co.conta from contas co where co.banco = ' + Value + '))';
  end
  else qryRecebimentos.MacroByName('Banco').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetCliente(const Value: String);
begin
  if (Value <> '') then
  begin
    qryRecebimentos.MacroByName('Cliente_Contrato').AsString:= 'and ((ct.cliente = ' + Value + ')'+
                                                       'and (ct.tipocliente = ' + quotedstr(FTipoCliente) + '))';
    qryRecebimentos.MacroByName('Cliente_ChequesAvulsos').AsString:= 'and ((ch.cliente = ' + Value + ')'+
                                                       'and (ch.tipocliente = ' + quotedstr(FTipoCliente) + '))';
  end
  else
  begin
    qryRecebimentos.MacroByName('Cliente_Contrato').AsString:= '';
    qryRecebimentos.MacroByName('Cliente_ChequesAvulsos').AsString:= '';
  end;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetFilial(const Value: String);
begin
  FFilial := Value;
  if (Value <> '') then
  begin
    qryRecebimentos.MacroByName('Filial_Contrato').AsString:= 'and ct.filialvenda in (' + Value + ')';
    qryRecebimentos.MacroByName('Filial_ChequesAvulsos').AsString:= 'and ch.filial in (' + Value + ')';
    FParametroCabecalho:=FParametroCabecalho+' FILIAL: ' + Value;
  end
  else
  begin
    qryRecebimentos.MacroByName('Filial_Contrato').AsString:= '';
    qryRecebimentos.MacroByName('Filial_ChequesAvulsos').AsString:= '';
  end;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetGrupoFiliais(const Value: String);
begin
  if (Value <> '') then
  begin
   qryRecebimentos.MacroByName('GrupoFilial').AsString:= 'and (c.filialvenda in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
   FParametroCabecalho:= FParametroCabecalho+' GRUPO DE FILIAL: ' + Value;
  end
  else qryRecebimentos.MacroByName('GrupoFilial').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetPeriodoFinalVencto(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoFinalVencto := Value
  else FPeriodoFinalVencto := '';
  MontaIntervaloPeriodoVencimento;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetPeriodoInicialVencto(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoInicialVencto := Value
  else FPeriodoInicialVencto := '';
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetResumo(const Value: Integer);
begin
  if FResumo <> Value Then
    FResumo:= Value;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetTipoCliente(const Value: String);
begin
  if FTipoCliente <> Value then
    FTipoCliente:= VAlue;
end;


procedure Tdtmrelatoriocontasareceberportipoderecebimento.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 Arquivo: String;
begin
  inherited;
  Arquivo:= 'c:\teclux\RelatorioRecebimentos.sql';
  Listar := tStringlist.create;
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);
  listar.free;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.frpRecebimentosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentos,View);
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetVendedor(const Value: String);
begin
  if (Value <> '') then
  begin
    qryRecebimentos.MacroByName('Vendedor_Contrato').AsString:= 'and (ct.vendedor = ' + Value + ')';
    qryRecebimentos.MacroByName('Vendedor_ChequesAvulsos').AsString:= 'and false';
  end
  else
  begin
    qryRecebimentos.MacroByName('Vendedor_Contrato').AsString:= '';
    qryRecebimentos.MacroByName('Vendedor_ChequesAvulsos').AsString:= '';
  end;

end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetTipodeRecebimento(
  const Value: String);
begin
  FTipodeRecebimento := Value;
  if (Value <> '') then
  begin
   qryRecebimentos.MacroByName('TipoRecebimento_Parcelas').AsString:= 'and p.tiporecebimento in (' + Value + ')';
   qryRecebimentos.MacroByName('TipoRecebimento_Recebimentos').AsString:= 'and r.tiporecebimento in (' + Value + ')';
   FParametroCabecalho:=FParametroCabecalho+' TIPO DE RECBIMENTO: ' + Value;
  end
  else
  begin
    qryRecebimentos.MacroByName('TipoRecebimento_Parcelas').AsString:= '';
    qryRecebimentos.MacroByName('TipoRecebimento_Recebimentos').AsString:= '';
  end;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.qryRecebimentosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if not qryRecebimentosconfirmado.AsBoolean then
    qryRecebimentosTotalDevido.AsCurrency := (qryRecebimentosvalorlancto.AsCurrency +
                                              qryRecebimentosjuros.AsCurrency) -
                                             qryRecebimentosvalordesagio.AsCurrency
  else
    qryRecebimentosTotalDevido.AsCurrency := 0;

end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetPeriodoFinalEmissao(
  const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoFinalEmissao := Value
  else FPeriodoFinalEmissao := '';
  MontaIntervaloPeriodoEmissao;
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetPeriodoInicialEmissao(
  const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoInicialEmissao := Value
  else FPeriodoInicialEmissao := '';
end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.MontaIntervaloPeriodoEmissao;
begin
  if not DataEmBranco(FPeriodoInicialEmissao) then begin
    if DataEmBranco(FPeriodoFinalEmissao) then
    begin

     qryRecebimentos.macrobyname('SQLContratoDataEmissao').asstring :=
       ' and ct.faturamento >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialEmissao)));

     qryRecebimentos.macrobyname('SQLChequesDataEmissao').asstring :=
       ' and ch.data >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialEmissao)));

     FParametroCabecalho:=FParametroCabecalho+' EMISSÃO A PARTIR DE : '+FPeriodoInicialEmissao;
    end
    else
    begin
     qryRecebimentos.macrobyname('SQLContratoDataEmissao').asstring :=
       ' and ct.faturamento between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialEmissao))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalEmissao)));

     qryRecebimentos.macrobyname('SQLChequesDataEmissao').asstring :=
       ' and ch.data between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialEmissao))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalEmissao)));

     FParametroCabecalho:=FParametroCabecalho+'EMISSÃO ENTRE: '+FPeriodoInicialEmissao+' E '+FPeriodoFinalEmissao;
    end;
  end
  else begin
    if not DataEmBranco(FPeriodoFinalEmissao) then
    begin
      qryRecebimentos.macrobyname('SQLContratoDataEmissao').asstring :=
        ' and ct.faturamento <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalEmissao)));

      qryRecebimentos.macrobyname('SQLChequesDataEmissao').asstring :=
        ' and ch.data <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalEmissao)));

      FParametroCabecalho:=FParametroCabecalho+' EMISSÃO ATÉ: '+FPeriodoFinalEmissao;
    end
    else
    begin
      qryRecebimentos.MacroByName('SQLContratoDataEmissao').AsString:= '';
      qryRecebimentos.MacroByName('SQLChequesDataEmissao').AsString:= '';

      FParametroCabecalho:=FParametroCabecalho+' TODAS EMISSÕES ';
    end;
  end;

end;

procedure Tdtmrelatoriocontasareceberportipoderecebimento.SetChequesAvulsos(
  const Value: Boolean);
begin
  FChequesAvulsos := Value;
  
  if FTipodeRecebimento<>'' then
    qryRecebimentos.parambyname('SelecionouChequesAvulsos').asboolean := Value
  else
    qryRecebimentos.parambyname('SelecionouChequesAvulsos').asboolean := true;
end;

end.
