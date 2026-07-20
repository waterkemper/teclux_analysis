unit dmrelatoriocontasareceber;

interface
                                
uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_dset, fr_dbset, fr_class, Biblio, fmpreviewpadrao,
  ZTransact, variants;

type
  Tdtmrelatoriocontasareceber = class(TdtmBasico)
    qryRecebimentos: TtecQuery;
    dsrRecebimentos: TtecDataSource;
    frpRecebimentosPISCOFINS: TfrReport;
    fdsRecebimentos: TfrDBDataSet;
    qryRecebimentoscontrato: TStringField;
    qryRecebimentosnumerparcela: TIntegerField;
    qryRecebimentosparcela: TStringField;
    qryRecebimentoscliente: TIntegerField;
    qryRecebimentosnomecliente: TStringField;
    qryRecebimentosfilialvenda: TIntegerField;
    qryRecebimentosnomefilialvenda: TStringField;
    qryRecebimentosgrupofilialvenda: TIntegerField;
    qryRecebimentosnomegrupofilialvenda: TStringField;
    qryRecebimentostiporecebimento: TStringField;
    qryRecebimentosnomebanco: TStringField;
    qryRecebimentosdatavencto: TDateField;
    qryRecebimentosvalorvencto: TFloatField;
    qryRecebimentosdatapagto: TDateField;
    qryRecebimentosvalorpagto: TFloatField;
    qryRecebimentosdiferenciar: TBooleanField;
    qryRecebimentosobservacaoboleto: TStringField;
    qryRecebimentosnumeronota: TStringField;
    qryRecebimentosnumeronotaaux: TStringField;
    qryRecebimentossiglabanco: TStringField;
    qryRecebimentostotalprodutospis: TFloatField;
    qryRecebimentostotalprodutoscofins: TFloatField;
    qryRecebimentostotalprodutos: TFloatField;
    qryRecebimentospercpis: TFloatField;
    qryRecebimentosperccofins: TFloatField;
    qryRecebimentosvalorpercpis: TFloatField;
    qryRecebimentosvalorperccofins: TFloatField;
    frpRecebimentos: TfrReport;
    qryRecebimentosvendedor: TIntegerField;
    qryRecebimentosnomevendedor: TStringField;
    frpRecebimentos_resumo: TfrReport;
    frpRecebimentosPISCOFINS_Resumo: TfrReport;
    qryRecebimentosfilialpagto: TIntegerField;
    qryRecebimentosnomefilialpagto: TStringField;
    qryRecebimentosgrupofilialpagto: TIntegerField;
    qryRecebimentosnomegrupofilialpagto: TStringField;
    qryRecebimentosdesconto: TFloatField;
    procedure frpRecebimentosPISCOFINSBeforePrint(Memo: TStringList; View: TfrView);
    procedure ZMonitorMonitorEvent(Sql, Result: String);
    procedure qryRecebimentosCalcFields(DataSet: TDataSet);
    procedure frpRecebimentosBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpRecebimentos_resumo_BeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpRecebimentosPISCOFINS_resumo_BeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpRecebimentosPISCOFINSBeginBand(Band: TfrBand);
    procedure frpRecebimentosBeginBand(Band: TfrBand);
    procedure frpRecebimentos_resumoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpRecebimentosPISCOFINS_resumoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpRecebimentosEndBand(Band: TfrBand);
  private
    AfterRodapeMestre : Boolean;
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FAgruparCliente: Boolean;
    FAgruparData: Boolean;
    FResumo: Integer;
    FPeriodoFinal: String;
    FTipoRelatorio: Integer;
    FParametroCabecalho: String;
    FTipoCliente: String;
    FFilial: String;
    FPeriodoInicialVencto: String;
    FPeriodoFinalRecebimento: String;
    FPeriodoInicialRecebimento: String;
    FPeriodoFinalEmissao: String;
    FPeriodoFinalVencto: String;
    FPeriodoInicialEmissao: String;
    fVisualizarValoresPISeCOFINS: Boolean;
    fListaCondicionalVendedores: String;
    FAgruparVendedor: Boolean;
    FFilialSelecao: Integer;
    FFilialExibicao: Integer;
    procedure SetAgruparData(const Value: Boolean);
    procedure SetBanco(const Value: String);
    procedure SetFilial(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetResumo(const Value: Integer);
    procedure SetTiporecebimento(const Value: String);
    procedure SetTipoRelatorio(const Value: Integer);
    procedure SetCliente(const Value: String);
    procedure SetTipoCliente(const Value: String);
    procedure SetParametroCabecalho(const Value: String);
    procedure SetVisualizarValoresPISeCOFINS(const Value: Boolean);
    procedure SetListaCondicionalVendedores(const Value: String);
    procedure SetFilialExibicao(const Value: Integer);
    procedure SetFilialSelecao(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property Filial            : String  read  FFilial             write SetFilial;
    property GrupoFiliais      : String  write SetGrupoFiliais;
    property TipoRelatorio     : Integer read  FTipoRelatorio      write SetTipoRelatorio;
    property Banco             : String  write SetBanco;
    property Cliente           : String  write SetCliente;
    property TipoCliente       : String  read  FTipoCliente        write SetTipoCliente;
    property Tiporecebimento   : String  write SetTiporecebimento;
    property Resumo            : Integer read  FResumo             write SetResumo;
    property AgruparGrupoFilial: Boolean read  FAgruparGrupoFilial write FAgruparGrupoFilial;
    property AgruparFilial     : Boolean read  FAgruparFilial      write FAgruparFilial;
    property AgruparCliente    : Boolean read  FAgruparCliente     write FAgruparCliente;
    property AgruparData       : Boolean read  FAgruparData        write SetAgruparData;
    property AgruparVendedor   : Boolean read  FAgruparVendedor    write fAgruparVendedor;

    property ParametroCabecalho: String  read  FParametroCabecalho write SetParametroCabecalho;
    property PeriodoInicialEmissao    : String read  FPeriodoInicialEmissao     write FPeriodoInicialEmissao;
    property PeriodoFinalEmissao      : String read  FPeriodoFinalEmissao       write FPeriodoFinalEmissao;

    property PeriodoInicialVencto    : String read  FPeriodoInicialVencto     write FPeriodoInicialVencto;
    property PeriodoFinalVencto      : String read  FPeriodoFinalVencto       write FPeriodoFinalVencto;

    property PeriodoInicialRecebimento    : String read  FPeriodoInicialRecebimento     write FPeriodoInicialRecebimento;
    property PeriodoFinalRecebimento      : String read  FPeriodoFinalRecebimento       write FPeriodoFinalRecebimento;
    property VisualizarValoresPISeCOFINS : Boolean read fVisualizarValoresPISeCOFINS write SetVisualizarValoresPISeCOFINS;

    property FilialSelecao: Integer read FFilialSelecao write SetFilialSelecao;
    property FilialExibicao: Integer read FFilialExibicao write SetFilialExibicao;

    property ListaCondicionalVendedores: String read fListaCondicionalVendedores write SetListaCondicionalVendedores;

    procedure MontaIntervaloPeriodoRecebimento;
    procedure MontaIntervaloPeriodoVencimento;
    procedure MontaIntervaloPeriodoEmissao;


    procedure DefineOrdenacao;

    function  GerarRelatorio: Boolean;
    procedure ImprimirRelatorio;
  end;

var
  dtmrelatoriocontasareceber: Tdtmrelatoriocontasareceber;

implementation

{$R *.dfm}

{ Tdtmrelatoriocontasareceber }

procedure Tdtmrelatoriocontasareceber.DefineOrdenacao;
var
Ordenacao : String;
begin
  Ordenacao:='';

  if AgruparGrupoFilial then
   case FilialExibicao of
    0: Ordenacao:=Ordenacao+', nomegrupofilialpagto, grupofilialpagto ';
    1: Ordenacao:=Ordenacao+', nomegrupofilialvenda, grupofilialvenda ';
   end;

  if AgruparFilial then
   case FilialExibicao of
    0: Ordenacao:=Ordenacao+', nomefilialpagto, filialpagto ';
    1: Ordenacao:=Ordenacao+', nomefilialvenda, filialvenda ';
   end;

  if AgruparVendedor then
    Ordenacao:=Ordenacao + ', nomevendedor, vendedor';

  if AgruparCliente then
    Ordenacao:=Ordenacao + ', nomecliente, cliente';

  case FTipoRelatorio of
    0: Ordenacao := Ordenacao + ', datavencto, nomecliente, cliente';
    1: Ordenacao := Ordenacao + ', datapagto, NomeCliente, cliente'
  end;
  qryRecebimentos.MacroByName('Ordenacao').AsString:='Order by '+copy(Ordenacao, 3, length(ordenacao));
end;

function Tdtmrelatoriocontasareceber.GerarRelatorio: Boolean;
begin
  RefazConsulta(qryRecebimentos,[],[]);
  Result:= qryRecebimentos.IsEmpty;
end;

procedure Tdtmrelatoriocontasareceber.ImprimirRelatorio;
begin

  AtribuirParametrosBaseRelatorio;
  frVariables['AgruparGrupoFilial'] := FAgruparGrupoFilial;
  frVariables['AgruparFilial']      := FAgruparFilial;
  frVariables['AgruparCliente']     := FAgruparCliente;
  frVariables['AgruparData']        := FAgruparData;
  frVariables['AgruparVendedor']    := FAgruparVendedor;

  frVariables['FilialExibicao']     := FFilialExibicao;

  frVariables['Outras']             := ParametroCabecalho;
  if FTipoRelatorio = 0 then
    frVariables['Ordem']              := 'N'
  else if FTipoRelatorio = 1 then
    frVariables['Ordem']              := 'D';

//    frpRecebimentos.SHOWREPORT;

//  frpRecebimentos.DesignReport;
//  frpRecebimentos_resumo.DesignReport;
//  frpRecebimentosPISCOFINS.DesignReport;
//  frpRecebimentosPISCOFINS_Resumo.designreport;

  AfterRodapeMestre := false;

  case FTipoRelatorio of
    0: begin
         frVariables['Titulo']:= 'CONTAS A RECEBER';
         if not visualizarValoresPISeCOFINS then
           ImprimirRelatoriofast(null, null, MPadrao, Resumo, [frpRecebimentos, frpRecebimentos_resumo], true, self)
         else
           ImprimirRelatoriofast(null, null, MPadrao, Resumo, [frpRecebimentosPISCOFINS, frpRecebimentosPISCOFINS_resumo], true, self)
       end;
    1: begin
         frVariables['Titulo']:= 'RECEBIMENTOS';
         if not visualizarValoresPISeCOFINS then
           ImprimirRelatoriofast(null, null, MPadrao, Resumo, [frpRecebimentos, frpRecebimentos_resumo], true, self)
         else
           ImprimirRelatoriofast(null, null, MPadrao, Resumo, [frpRecebimentosPISCOFINS, frpRecebimentosPISCOFINS_resumo], true, self)
       end;
  end;
end;

procedure Tdtmrelatoriocontasareceber.SetAgruparData(const Value: Boolean);
begin
  FAgruparData := Value;
  qryRecebimentos.ParamByName('AgruparData').AsBoolean := FAgruparData;
end;

procedure Tdtmrelatoriocontasareceber.SetBanco(const Value: String);
begin
  if (Value <> '') then
  begin
    ParametroCabecalho:=' BANCO: ' + qryRecebimentosnomebanco.AsString;
    qryRecebimentos.MacroByName('Banco').AsString:= 'and (p.contaboleto in (Select co.conta from contas co where co.banco = ' + Value + '))';
  end
  else qryRecebimentos.MacroByName('Banco').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceber.SetCliente(const Value: String);
begin
  if (Value <> '') then
    qryRecebimentos.MacroByName('Cliente').AsString:= 'and ((c.cliente = ' + Value + ')'+
                                                       'and (c.tipocliente = ' + quotedstr(FTipoCliente) + '))'
  else qryRecebimentos.MacroByName('Cliente').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceber.SetFilial(const Value: String);
begin
  FFilial := Value;
  if (Value <> '') then
  begin
   case FFilialSelecao of
   0: begin
       qryRecebimentos.MacroByName('Filial').AsString:= 'and (p.filialpagto = ' + Value + ')';
       ParametroCabecalho := ' FILIAL PAGTO: ' + Value;
      end;
   1: begin
       qryRecebimentos.MacroByName('Filial').AsString:= 'and (c.filialvenda = ' + Value + ')';
       ParametroCabecalho := ' FILIAL VENDA: ' + Value;
      end;
   end;
  end
  else
    qryRecebimentos.MacroByName('Filial').AsString:= '';

end;

procedure Tdtmrelatoriocontasareceber.SetGrupoFiliais(const Value: String);
begin
  if (Value <> '') then
  begin
   qryRecebimentos.MacroByName('GrupoFilial').AsString:= 'and (c.filialvenda in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
   ParametroCabecalho := ' GRUPO DE FILIAL: ' + Value;
  end
  else qryRecebimentos.MacroByName('GrupoFilial').AsString:= '';
end;


procedure Tdtmrelatoriocontasareceber.SetResumo(const Value: Integer);
begin
  if FResumo <> Value Then
    FResumo:= Value;
end;

procedure Tdtmrelatoriocontasareceber.SetTipoCliente(const Value: String);
begin
  if FTipoCliente <> Value then
    FTipoCliente:= VAlue;
end;

procedure Tdtmrelatoriocontasareceber.SetTiporecebimento(const Value: String);
begin
  if (Value <> '') then
  begin
    qryRecebimentos.MacroByName('TipoRecebimento').AsString:= 'and (p.tiporecebimento = ' + Value + ')';
    ParametroCabecalho:= ' TIPO DE PAGAMENTO: '+ Value;
  end
  else qryRecebimentos.MacroByName('TipoRecebimento').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceber.SetTipoRelatorio(const Value: Integer);
begin
  //  0 = Recebimentos em Aberto     1 = Recebimentos quitadas
  if FTipoRelatorio <> Value then
    FTipoRelatorio:= Value;
  case FTipoRelatorio of
    0: qryRecebimentos.MacroByName('TipoRelatorio').AsString:= 'and (p.datapagto is null)';
    1: qryRecebimentos.MacroByName('TipoRelatorio').AsString:= 'and (p.datapagto is not null)';
  end;
end;


procedure Tdtmrelatoriocontasareceber.frpRecebimentosPISCOFINSBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentosPISCOFINS,View);
end;

procedure Tdtmrelatoriocontasareceber.ZMonitorMonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 FileName: String;
begin
  inherited;
  Listar := tStringlist.create;
  FileName := 'c:\contas.sql';

  if fileexists(FileName) then
    Listar.loadfromfile(FileName);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(FileName);
  listar.free;
end;

procedure Tdtmrelatoriocontasareceber.qryRecebimentosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryRecebimentosnumeronotaaux.asString := trocar(qryRecebimentosnumeronota.asString,';',','{+chr(13)})
end;

procedure Tdtmrelatoriocontasareceber.MontaIntervaloPeriodoEmissao;
begin
  if not DataEmBranco(FPeriodoInicialEmissao) then
  begin
    if DataEmBranco(FPeriodoFinalEmissao) then
    begin
     qryRecebimentos.macrobyname('SQLContratoDataEmissao').asstring :=
       ' and c.faturamento >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialEmissao)));
     ParametroCabecalho := 'EMISSÃO A PARTIR DE : '+FPeriodoInicialEmissao;
    end
    else
    begin
     qryRecebimentos.macrobyname('SQLContratoDataEmissao').asstring :=
       ' and c.faturamento between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialEmissao))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalEmissao)));
     ParametroCabecalho := 'EMISSÃO ENTRE: '+FPeriodoInicialEmissao+' E '+FPeriodoFinalEmissao;
    end;
  end
  else
  begin
    if not DataEmBranco(FPeriodoFinalEmissao) then
    begin
      qryRecebimentos.macrobyname('SQLContratoDataEmissao').asstring :=
        ' and c.faturamento <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalEmissao)));
      ParametroCabecalho := 'EMISSÃO ATÉ: '+FPeriodoFinalEmissao;
    end
    else
    begin
      qryRecebimentos.MacroByName('SQLContratoDataEmissao').AsString    := '';
      ParametroCabecalho := 'TODAS EMISSÕES ';
    end;
  end;

end;

procedure Tdtmrelatoriocontasareceber.MontaIntervaloPeriodoRecebimento;
begin

  if not DataEmBranco(FPeriodoInicialRecebimento) then
  begin
    if DataEmBranco(FPeriodoFinalRecebimento) then
    begin

     qryRecebimentos.macrobyname('SQLContratoDataRecebimento').asstring :=
       ' and coalesce(p.formapagamento,'''') not in (''T'',''E'') and p.datapagto >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialRecebimento)));

     qryRecebimentos.macrobyname('SQLContratoDataDevolucao').asstring :=
       ' and coalesce(p.formapagamento,'''')<>''T'' and p.devEntrada >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialRecebimento)));

     ParametroCabecalho := 'RECEBIMENTOS E DEVOLUÇÕES A PARTIR DE : '+FPeriodoInicialRecebimento;
    end
    else
    begin
     qryRecebimentos.macrobyname('SQLContratoDataRecebimento').asstring :=
       ' and coalesce(p.formapagamento,'''')<>''T'' and p.datapagto between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialRecebimento))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalRecebimento)));

     qryRecebimentos.macrobyname('SQLContratoDataDevolucao').asstring :=
       ' and coalesce(p.formapagamento,'''')<>''T'' and p.deventrada between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialRecebimento))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalRecebimento)));

     ParametroCabecalho:='RECEBIMENTOS E DEVOLUÇÕES ENTRE: '+FPeriodoInicialRecebimento+' E '+FPeriodoFinalRecebimento;
    end;
  end
  else
  begin
    if not DataEmBranco(FPeriodoFinalRecebimento) then
    begin
      qryRecebimentos.macrobyname('SQLContratoDataRecebimento').asstring :=
        ' and coalesce(p.formapagamento,'''')<>''T'' and p.datapagto <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalRecebimento)));

      qryRecebimentos.macrobyname('SQLContratoDataDevolucao').asstring :=
        ' and coalesce(p.formapagamento,'''')<>''T'' and p.deventrada <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalRecebimento)));

      ParametroCabecalho := 'RECEBIMENTOS E DEVOLUÇÕES ATÉ: '+FPeriodoFinalRecebimento;
    end
    else
    begin
      qryRecebimentos.MacroByName('SQLContratoDataRecebimento').AsString:= 'and coalesce(p.formapagamento,'''')<>''T''';
      qryRecebimentos.macrobyname('SQLContratoDataDevolucao').asstring :=  'and coalesce(p.formapagamento,'''')<>''T''';
      ParametroCabecalho := 'TODOS RECEBIMENTOS E DEVOLUÇÕES';
    end;
  end;

end;

procedure Tdtmrelatoriocontasareceber.MontaIntervaloPeriodoVencimento;
begin
  if not DataEmBranco(FPeriodoInicialVencto) then
  begin
    if DataEmBranco(FPeriodoFinalVencto) then
    begin

     qryRecebimentos.macrobyname('SQLContratoDataVencto').asstring :=
       ' and p.datavencto >= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto)));

     ParametroCabecalho := 'VENCIMENTOS A PARTIR DE : '+FPeriodoInicialVencto;
    end
    else
    begin
     qryRecebimentos.macrobyname('SQLContratoDataVencto').asstring :=
       ' and p.datavencto between ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoInicialVencto))) +
       ' and '+quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

     ParametroCabecalho:='VENCIMENTOS ENTRE: '+FPeriodoInicialVencto+' E '+FPeriodoFinalVencto;
    end;
  end
  else begin
    if not DataEmBranco(FPeriodoFinalVencto) then
    begin
      qryRecebimentos.macrobyname('SQLContratoDataVencto').asstring :=
        ' and p.datavencto <= ' + quotedstr(FormatDateTime('yyyy-mm-dd',StrToDateTime(FPeriodoFinalVencto)));

      ParametroCabecalho := 'VENCIMENTOS ATÉ: '+FPeriodoFinalVencto;
    end
    else
    begin
      qryRecebimentos.MacroByName('SQLContratoDataVencto').AsString:= '';
      ParametroCabecalho := 'TODOS VENCIMENTOS ';
    end;
  end;
end;

procedure Tdtmrelatoriocontasareceber.SetParametroCabecalho(
  const Value: String);
begin
  if Value = '' then
    FParametroCabecalho := Value
  else
  begin
    if fparametroCabecalho <> '' then
      FParametroCabecalho := FParametroCabecalho + ' - ' + value
    else
      FParametroCabecalho := value;
  end;
end;

procedure Tdtmrelatoriocontasareceber.SetVisualizarValoresPISeCOFINS(
  const Value: Boolean);
begin
  fVisualizarValoresPISeCOFINS := Value;
  qryRecebimentos.parambyname('VisualizarValoresPISeCOFINS').asBoolean := Value;
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentos,View);
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentos_resumo_BeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentos_resumo,View);
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosPISCOFINS_resumo_BeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentosPISCOFINS_resumo,View);
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosPISCOFINSBeginBand(
  Band: TfrBand);
begin
  inherited;
  if Band.Name = 'RodapeMestre' then
   if Resumo = 0 then
   begin

     band.NewPageAfter := true;
   end;
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosBeginBand(
  Band: TfrBand);
begin
  inherited;

  if Band.Name = 'RodapeMestre' then
  begin
    if Resumo = 0 then
    begin
      band.NewPageAfter := true;
//      AfterRodapeMestre := true;
//      frVariables['ImprimirCabecalho'] := false;
    end;
  end
  else
  if Band.Name = 'Cabecalho' then
  begin
    if AfterRodapeMestre then
//      Band.Visible := false;
  end;
end;

procedure Tdtmrelatoriocontasareceber.SetListaCondicionalVendedores(
  const Value: String);
begin
  fListaCondicionalVendedores := Value;
  if value <> '' then
  begin
    qryRecebimentos.MacroByName('ListaCondicionalVendedores').AsString := ' and (' + ListaCondicionalVendedores +')';
    ParametroCabecalho :=' VENDEDORES: ' + ListaCondicionalVendedores;
  end
  else
    qryRecebimentos.MacroByName('ListaCondicionalVendedores').AsString := '';
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentos_resumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentos_resumo,View);
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosPISCOFINS_resumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentosPISCOFINS_resumo,View);
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosEndBand(
  Band: TfrBand);
begin
  inherited;
  if Band.Name = 'RodapeMestre' then
  begin
    if Resumo = 0 then
    begin
      band.NewPageAfter := true;
      AfterRodapeMestre := true;
//      frVariables['ImprimirCabecalho'] := false;
    end;
  end
  else
  if Band.Name = 'Cabecalho' then
  begin
    if AfterRodapeMestre then
      Band.Visible := false;
  end;

end;

procedure Tdtmrelatoriocontasareceber.SetFilialExibicao(
  const Value: Integer);
begin
  FFilialExibicao := Value;
end;

procedure Tdtmrelatoriocontasareceber.SetFilialSelecao(
  const Value: Integer);
begin
  FFilialSelecao := Value;
end;

end.
