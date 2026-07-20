unit dmrelatoriocontasareceber;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_dset, fr_dbset, fr_class, Biblio, fmpreviewpadrao,
  ZTransact;

type
  Tdtmrelatoriocontasareceber = class(TdtmBasico)
    qryRecebimentos: TtecQuery;
    dsrRecebimentos: TtecDataSource;
    frpRecebimentos: TfrReport;
    fdsRecebimentos: TfrDBDataSet;
    ZMonitor1: TZMonitor;
    qryRecebimentoscontrato: TStringField;
    qryRecebimentosnumerparcela: TIntegerField;
    qryRecebimentosparcela: TStringField;
    qryRecebimentoscliente: TIntegerField;
    qryRecebimentosnomecliente: TStringField;
    qryRecebimentosfilialvenda: TIntegerField;
    qryRecebimentosnomefilialemissao: TStringField;
    qryRecebimentosgrupofilialemissao: TIntegerField;
    qryRecebimentosnomegrupofilialemissao: TStringField;
    qryRecebimentostiporecebimento: TStringField;
    qryRecebimentosnomebanco: TStringField;
    qryRecebimentosdatavencto: TDateField;
    qryRecebimentosvalorvencto: TFloatField;
    qryRecebimentosdatapagto: TDateField;
    qryRecebimentosvalorpagto: TFloatField;
    qryRecebimentosdiferenciar: TBooleanField;
    qryRecebimentosnumeronota: TIntegerField;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpRecebimentosBeforePrint(Memo: TStringList; View: TfrView);
  private
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FAgruparCliente: Boolean;
    FAgruparData: Boolean;
    FResumo: Integer;
    FPeriodoFinal: String;
    FPeriodoInicial: String;
    FTipoRelatorio: Integer;
    FParametroCabecalho: String;
    FTipoCliente: String;
    FFilial: String;
    procedure MontaIntervaloPeriodo;
    procedure SetAgruparData(const Value: Boolean);
    procedure SetBanco(const Value: String);
    procedure SetFilial(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetPeriodoFinal(const Value: String);
    procedure SetPeriodoInicial(const Value: String);
    procedure SetResumo(const Value: Integer);
    procedure SetTiporecebimento(const Value: String);
    procedure SetTipoRelatorio(const Value: Integer);
    procedure SetCliente(const Value: String);
    procedure SetTipoCliente(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    FOrdenacao: String;
    property Filial            : String  read  FFilial             write SetFilial;
    property GrupoFiliais      : String  write SetGrupoFiliais;
    property TipoRelatorio     : Integer read  FTipoRelatorio      write SetTipoRelatorio;
    property PeriodoInicial    : String  read  FPeriodoInicial     write SetPeriodoInicial;
    property PeriodoFinal      : String  read  FPeriodoFinal       write SetPeriodoFinal;
    property Banco             : String  write SetBanco;
    property Cliente           : String  write SetCliente;
    property TipoCliente       : String  read  FTipoCliente        write SetTipoCliente;
    property Tiporecebimento   : String  write SetTiporecebimento;
    property Resumo            : Integer read  FResumo             write SetResumo;
    property AgruparGrupoFilial: Boolean read  FAgruparGrupoFilial write FAgruparGrupoFilial;
    property AgruparFilial     : Boolean read  FAgruparFilial      write FAgruparFilial;
    property AgruparCliente    : Boolean read  FAgruparCliente     write FAgruparCliente;
    property AgruparData       : Boolean read  FAgruparData        write SetAgruparData;
    property ParametroCabecalho: String  read  FParametroCabecalho write FParametroCabecalho;
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

  if FAgruparGrupoFilial then
    Ordenacao:= Ordenacao + ', nomegrupofilialemissao, grupofilialemissao';
  if FAgruparFilial then
    Ordenacao:=Ordenacao + ', nomefilialemissao, c.filialvenda';

  case FTipoRelatorio of
    0:
    begin
      if FOrdenacao = 'D' then
        Ordenacao := Ordenacao + ', p.datavencto, NomeCliente, c.cliente'
      else if FOrdenacao = 'N' then
        Ordenacao := Ordenacao + ', NomeCliente, c.cliente, p.datavencto'
      else
        Ordenacao := Ordenacao + ', NomeCliente, c.cliente, p.datavencto';
    end;
    1:
    begin
      if FOrdenacao ='D' then
        Ordenacao := Ordenacao + ', p.datapagto, NomeCliente, c.cliente'
      else if FOrdenacao ='N' then
        Ordenacao := Ordenacao + ', NomeCliente, c.cliente, p.datapagto'
      else
        Ordenacao := Ordenacao + ', NomeCliente, c.cliente ,p.datapagto';
    end;
  end;
  qryRecebimentos.MacroByName('Ordenacao').AsString:='Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
end;

function Tdtmrelatoriocontasareceber.GerarRelatorio: Boolean;
begin
  RefazConsulta(qryRecebimentos,[],[]);
  Result:= qryRecebimentos.IsEmpty;
end;

procedure Tdtmrelatoriocontasareceber.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio;
  frVariables['AgruparGrupoFilial'] := FAgruparGrupoFilial;
  frVariables['AgruparFilial']      := FAgruparFilial;
  frVariables['AgruparCliente']     := FAgruparCliente;
  frVariables['AgruparData']        := FAgruparData;
  frVariables['Outras']             := FParametroCabecalho;
  if FTipoRelatorio = 0 then
    frVariables['Ordem']              := 'N'
  else if FTipoRelatorio = 1 then
    frVariables['Ordem']              := 'D';
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  //frpRecebimentos.DesignReport;
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do
    begin
      case FTipoRelatorio of
        0: begin
             frVariables['Titulo']:= 'CONTAS A RECEBER';
             frCompositeReport.Reports.Add(frpRecebimentos);
               { if AgruparGrupoFilial or
                   AgruparFilial or
                   AgruparFornecedor or
                   AgruparData then
                  frCompositeReport.Reports.Add(frpResumoDuplicatasPagar); }
           end;
        1: begin
             frVariables['Titulo']:= 'PAGAMENTOS EFETUADOS';
             frCompositeReport.Reports.Add(frpRecebimentos);
            {    if AgruparGrupoFilial or
                   AgruparFilial or
                   AgruparFornecedor or
                   AgruparData then
                  frCompositeReport.Reports.Add(frpResumoPagamentosEfetuados);     }
           end;
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

procedure Tdtmrelatoriocontasareceber.MontaIntervaloPeriodo;
var
  Data_1: String;
  Data_2: String;
begin
  case FTipoRelatorio of
    0: begin
         Data_1:= 'and (p.datavencto = ';
         Data_2:= 'and (p.datavencto between (';
       end;
    1: begin
         Data_1:= 'and (p.datapagto = ';
         Data_2:= 'and (p.datapagto between (';
       end;
  end;
  if not DataEmBranco(FPeriodoInicial) then begin
    if DataEmBranco(FPeriodoFinal) then
    begin
     qryRecebimentos.MacroByName('Periodo').AsString:= Data_1 + '''' + FPeriodoInicial + ''')';
     FParametroCabecalho:=FParametroCabecalho+'ENTRE: '+FPeriodoInicial+' E '+FPeriodoInicial;
    end
    else
    begin
     qryRecebimentos.MacroByName('Periodo').AsString:= Data_2 + '''' + FPeriodoInicial + ''') and (''' + FPeriodoFinal + '''))';
     FParametroCabecalho:=FParametroCabecalho+'ENTRE: '+FPeriodoInicial+' E '+FPeriodoFinal;
    end;
  end
  else begin
    if not DataEmBranco(FPeriodoFinal) then
    begin
     qryRecebimentos.MacroByName('Periodo').AsString:= Data_1 + '''' + FPeriodoFinal + ''')';
     FParametroCabecalho:=FParametroCabecalho+'ENTRE: '+FPeriodoFinal+' E '+FPeriodoInicial;
    end
    else qryRecebimentos.MacroByName('Periodo').AsString:= '';
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
    FParametroCabecalho:=FParametroCabecalho+' BANCO: ' + qryRecebimentosnomebanco.AsString;
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
   qryRecebimentos.MacroByName('Filial').AsString:= 'and (c.filialvenda = ' + Value + ')';
   FParametroCabecalho:=FParametroCabecalho+' FILIAL: ' + Value;
  end
  else qryRecebimentos.MacroByName('Filial').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceber.SetGrupoFiliais(const Value: String);
begin
  if (Value <> '') then
  begin
   qryRecebimentos.MacroByName('GrupoFilial').AsString:= 'and (c.filialvenda in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
   FParametroCabecalho:= FParametroCabecalho+' GRUPO DE FILIAL: ' + Value;
  end
  else qryRecebimentos.MacroByName('GrupoFilial').AsString:= '';
end;

procedure Tdtmrelatoriocontasareceber.SetPeriodoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoFinal := Value
  else FPeriodoFinal := '';
  MontaIntervaloPeriodo;
end;

procedure Tdtmrelatoriocontasareceber.SetPeriodoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoInicial := Value
  else FPeriodoInicial := '';
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
    FParametroCabecalho:= FParametroCabecalho+' TIPO DE PAGAMENTO: '+ Value;
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

procedure Tdtmrelatoriocontasareceber.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 Arquivo: String;
begin
  inherited;
  Arquivo:= 'c:\Lixo\RelatorioRecebimentos.sql';
  Listar := tStringlist.create;
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);
  listar.free;
end;

procedure Tdtmrelatoriocontasareceber.frpRecebimentosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRecebimentos,View);
end;

end.
