unit dmrelatoriofluxodecaixa;


interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  FR_DSet, FR_DBSet, FR_Class, clfinanceira, ctconstantes, cpdatasource,
  clparametrossistema, fmpreviewpadrao, biblio, FR_Desgn, Variants,
  ZTransact;

type
  Tdtmrelatoriofluxodecaixa = class(Tdtmbasico)
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    dsrFiliais: TtecDataSource;
    qryGrupoFiliais: TtecQuery;
    qryGrupoFiliaiscodigo: TIntegerField;
    qryGrupoFiliaisdescricao: TStringField;
    dsrGrupoFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaGrupoFiliais: TtecQuery;
    qryConsultaGrupoFiliaisdescricao: TStringField;
    qryConsultaGrupoFiliaiscodigo: TIntegerField;
    qryTotalizacao: TtecQuery;
    qryTotalizacaogrupofilial: TIntegerField;
    qryTotalizacaofilial: TIntegerField;
    qryTotalizacaotregistros: TIntegerField;
    qryTotalizacaotvlrrec: TFloatField;
    qryTotalizacaotjurosrec: TFloatField;
    qryTotalizacaottotalrec: TFloatField;
    qryTotalizacaotvlrarec: TFloatField;
    qryTotalizacaotjurosarec: TFloatField;
    qryTotalizacaottotalarec: TFloatField;
    qryTotalizacaotvlrpag: TFloatField;
    qryTotalizacaotjurospag: TFloatField;
    qryTotalizacaottotalpag: TFloatField;
    qryTotalizacaotvlrapag: TFloatField;
    qryTotalizacaotjurosapag: TFloatField;
    qryTotalizacaottotalapag: TFloatField;
    qryTotalizacaojatotalizado: TStringField;
    qryTotalizacaottsaldo: TFloatField;
    qryTotalizacaodata: TDateField;
    qryFluxoporEvento: TtecQuery;
    frpFluxoporEvento: TfrReport;
    fdsFluxoporEvento: TfrDBDataSet;
    qryFluxoporEventogrupofilial: TIntegerField;
    qryFluxoporEventonomegrupofilial: TStringField;
    qryFluxoporEventofilial: TIntegerField;
    qryFluxoporEventonomefilial: TStringField;
    qryFluxoporEventodata: TDateField;
    qryFluxoporEventovlrarec: TFloatField;
    qryFluxoporEventovlrapag: TFloatField;
    qryFluxoporEventooperacao: TStringField;
    qryFluxoporEventototalizado: TBooleanField;
    qryTotalizacaottvlrarec_ant: TFloatField;
    qryTotalizacaottvlrapag_ant: TFloatField;
    qryTotalizacaottsaldo_ant: TFloatField;
    qryTotalizacaotvlrarec_ant: TFloatField;
    qryTotalizacaotvlrapag_ant: TFloatField;
    qryFluxoporEventodescricaoevento_c: TStringField;
    qryFluxoporEventodescricaoevento_d: TStringField;
    qryFluxoDetalhado: TtecQuery;
    frpFluxoDetalhado: TfrReport;
    fdsFluxoDetalhado: TfrDBDataSet;
    qryFluxoDetalhadogrupofilial: TIntegerField;
    qryFluxoDetalhadonomegrupofilial: TStringField;
    qryFluxoDetalhadofilial: TIntegerField;
    qryFluxoDetalhadonomefilial: TStringField;
    qryFluxoDetalhadodata: TDateField;
    qryFluxoDetalhadovlrarec: TFloatField;
    qryFluxoDetalhadodescricaoevento_c: TStringField;
    qryFluxoDetalhadovlrapag: TFloatField;
    qryFluxoDetalhadodescricaoevento_d: TStringField;
    qryFluxoDetalhadooperacao: TStringField;
    qryFluxoDetalhadototalizado: TBooleanField;
    qrysaldoFluxoCaixa: TtecQuery;
    qrysaldoFluxoCaixasaldo: TFloatField;
    qryFluxoporEventoExibirSaldo: TBooleanField;
    qryFluxoporEvento_aux: TtecQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    BooleanField1: TBooleanField;
    StringField4: TStringField;
    StringField5: TStringField;
    BooleanField2: TBooleanField;
    qryFluxoDetalhado_aux: TtecQuery;
    IntegerField3: TIntegerField;
    StringField6: TStringField;
    IntegerField4: TIntegerField;
    StringField7: TStringField;
    DateField2: TDateField;
    FloatField3: TFloatField;
    StringField8: TStringField;
    FloatField4: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    BooleanField3: TBooleanField;
    qryFluxoDetalhadoExibirSaldo: TBooleanField;
    procedure frprelatoriofluxodecaixaBeginDoc;
    procedure frprelatoriofluxodecaixaEndDoc;
    procedure frprelatoriofluxodecaixaBeginBand(Band: TfrBand);
    procedure qryFluxoporEventoAfterScroll(DataSet: TDataSet);
    procedure frpFluxoporEventoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpFluxoporEventoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpFluxoDetalhadoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpFluxoDetalhadoBeginBand(Band: TfrBand);
    procedure frpFluxoDetalhadoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure qryFluxoDetalhadoAfterScroll(DataSet: TDataSet);
    procedure qryFluxoporEventoAfterOpen(DataSet: TDataSet);
    procedure qryFluxoDetalhadoAfterOpen(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FBandaImpressa: String;
    FSaldo: Currency;
    FImprimindoRelatorio: Boolean;
    FFilial: integer;
    FGrupoFilial: integer;
    FData: String;
    FSaldoInicial: Currency;
    FExibirSaldoAcumulado: Boolean;
    property BandaImpressa: String read FBandaImpressa write FBandaImpressa;
    procedure VerificarAgrupamentoEvento(Tabela :TtecQuery);
    procedure TotalizarRelatorioEvento(Tabela : TTecQuery);
    function CalcularTotal(Campo:TField): Currency;
    function CalcularTotalEventos(Campo:TField): Currency;
    procedure SetAgruparGrupoFilial(const Value: Boolean);
    procedure SetAgruparFilial(const Value: Boolean);
    procedure SetSaldoInicial(const Value: Currency);
    procedure SetExibirSaldoAcumulado(const Value: Boolean);
    procedure SetExibirSaldoInicial(const Value: Boolean);

  private
    FDataInicial: String;
    FDataInicialAcumulado: String;
    FDataFinal: String;
    FDataFinalAcumulado: String;
    FTipoRelatorio: Integer;
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FParametroCabecalho: String;
    function GetConsultaFiliais: TtecQuery;
    function GetConsultaGrupoFiliais: TtecQuery;
    procedure SetDataFinal(const Value: String);
    procedure SetDataFinalAcumulado(const Value: String);
    procedure SetDataInicial(const Value: String);
    procedure SetDataInicialAcumulado(const Value: String);
    procedure SetFiliais(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetTipoRelatorio(const Value: Integer);
    property Saldo: Currency read FSaldo write FSaldo;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirRelatorio;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioVendas);
    procedure Selecionar(TipoPesquisa: TtecRelatorioVendas);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecRElatorioVendas);
    procedure lerParametros;
    property ConsultaFiliais: TtecQuery read GetConsultaFiliais;
    property ConsultaGrupoFiliais: TtecQuery read GetConsultaGrupoFiliais;
    function ExisteFiliais(campo, codigo: string): boolean;
    function ExisteGrupoFiliais(campo, codigo: string): boolean;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property DataInicialAcumulado: String read FDataInicialAcumulado write SetDataInicialAcumulado;
    property DataFinalAcumulado: String read FDataFinalAcumulado write SetDataFinalAcumulado;
    property Filiais: String write SetFiliais;
    property GrupoFiliais: String write SetGrupoFiliais;
    property TipoRelatorio: Integer read FTipoRelatorio write SetTipoRelatorio;
    property AgruparGrupoFilial: Boolean Read FAgruparGrupoFilial write SetAgruparGrupoFilial;
    property AgruparFilial: Boolean Read FAgruparFilial write SetAgruparFilial;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    procedure MontarOrdenacao;
    property SaldoInicial: Currency read FSaldoInicial write SetSaldoInicial;
    function SaldoFluxoCaixa: Currency;
    procedure VerificarSaldoaExibir(Tabela:TTecQuery);
    property ExibirSaldoAcumulado: Boolean read FExibirSaldoAcumulado write SetExibirSaldoAcumulado;
    property ExibirSaldoInicial: Boolean read FExibirSaldoAcumulado write SetExibirSaldoInicial;
  end;

var
  dtmrelatoriofluxodecaixa: Tdtmrelatoriofluxodecaixa;

implementation
{$R *.dfm}

procedure Tdtmrelatoriofluxodecaixa.AbreTabelaPesquisa(
  TipoPesquisa: TtecRelatorioVendas);
begin
  case TipoPesquisa of
    rvFILIAIS         : abre(ctVendaTabelaConsultaFiliais);
    rvGRUPOFILIAIS    : abre(ctVendaTabelaConsultaGrupoFiliais);
  end;
end;

constructor Tdtmrelatoriofluxodecaixa.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Tag                :=ctTabelas;
  qryGrupoFiliais.Tag           :=ctTabelas;
  qrysaldoFluxoCaixa.tag        :=ctTabelas;
  qryConsultaFiliais.Tag        :=ctVendaTabelaConsultaFiliais;
  qryConsultaGrupoFiliais.Tag   :=ctVendaTabelaConsultaGrupoFiliais;
  lerParametros;
end;

function Tdtmrelatoriofluxodecaixa.ExisteFiliais(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultaFiliais, campo, codigo)
end;

function Tdtmrelatoriofluxodecaixa.ExisteGrupoFiliais(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultaGrupoFiliais, campo, codigo)
end;

procedure Tdtmrelatoriofluxodecaixa.FechaTabelaPesquisa(
  TipoPesquisa: TtecRElatorioVendas);
begin
  case TipoPesquisa of
    rvFILIAIS         : Fecha(ctVendaTabelaConsultaFiliais);
    rvGRUPOFILIAIS    : Fecha(ctVendaTabelaConsultaGrupoFiliais);
  end;
end;

function Tdtmrelatoriofluxodecaixa.GetConsultaFiliais: TtecQuery;
begin
  result := qryConsultaFiliais;
end;

function Tdtmrelatoriofluxodecaixa.GetConsultaGrupoFiliais: TtecQuery;
begin
  result := qryConsultaGrupoFiliais;
end;

procedure Tdtmrelatoriofluxodecaixa.ImprimirRelatorio();
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  Saldo := 0;

  qryFluxoporEvento.AfterScroll := qryFluxoporEventoAfterScroll;
  qryFluxoDetalhado.AfterScroll := qryFluxoDetalhadoAfterScroll;

  ReFazConsulta(qryTotalizacao, [],[]);
  qryTotalizacao.Delete;

  frVariables['Outras']:= FParametroCabecalho;
  frVariables['AgruparGrupoFilial']:= FAgruparGrupoFilial;
  frVariables['AgruparFilial']:= FAgruparFilial;

//  frpFluxoDetalhado.DesignReport;

  if FTipoRelatorio = 0 then
   frVariables['Titulo']:='FLUXO DE CAIXA'
  else
   frVariables['Titulo']:='FLUXO DE CAIXA - DETALHADO';

  frmPreview := TfrmPreviewPadrao.create(self.owner);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   case FTipoRelatorio of
   0: frmPreview.frCompositeReport.Reports.Add(frpFluxoporEvento);
   1: frmPreview.frCompositeReport.Reports.Add(frpFluxoDetalhado);
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
end;

procedure Tdtmrelatoriofluxodecaixa.lerParametros;
begin
 with tecFinanceira do
  begin
        DiasAtraso1       := ParSistema.DiasAtraso1;
        DiasAtraso2       := ParSistema.DiasAtraso2;
        PercentualMultas1 := ParSistema.PercentualAtrasoMultas1;
        PercentualMultas2 := ParSistema.PercentualAtrasoMultas2;
        TaxaJuros1        := ParSistema.PercentualAtrasoJuros1;
        TaxaJuros2        := ParSistema.PercentualAtrasoJuros2;
        Juros             := ParSistema.TaxaJuros;
        JurosSimples      := ParSistema.UtilizarJurosSimples;
  end;
end;

procedure Tdtmrelatoriofluxodecaixa.MontarOrdenacao;
Var
Ordenacao : String;
begin
 Ordenacao:='';
 if FAgruparGrupoFilial then
   Ordenacao:=Ordenacao+', nomegrupofilial, grupofilial';
 if FAgruparFilial then
   Ordenacao:=Ordenacao+', nomefilial, filial';
 Ordenacao := Ordenacao+', operacao, data';

 qryFluxoporEvento.MacroByName('ordenacao').AsString := 'Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
 qryFluxoDetalhado.MacroByName('ordenacao').AsString := 'Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
 
end;

procedure Tdtmrelatoriofluxodecaixa.Selecionar(
  TipoPesquisa: TtecRelatorioVendas);
begin
  case TipoPesquisa of
  rvFILIAIS         : ReFazConsulta(qryFiliais,[0],[qryConsultaFiliaiscodigo.AsInteger]);
  rvGRUPOFILIAIS    : ReFazConsulta(qryGrupoFiliais,[0],[qryConsultaGrupoFiliaiscodigo.AsInteger]);
  end;
end;

procedure Tdtmrelatoriofluxodecaixa.SetDataFinal(const Value: String);
begin
  FDataFinal := Value;
  qryFluxoporEvento.ParamByName('DataFinal').AsString:=Value;
  qryFluxoDetalhado.ParamByName('DataFinal').AsString:=Value;
  FParametroCabecalho := 'PERÍODO ENTRE ' + FDataInicial + ' E ' + FDataFinal;
end;

procedure Tdtmrelatoriofluxodecaixa.SetDataFinalAcumulado(
  const Value: String);
begin
  FDataFinalAcumulado := Value;
  qryFluxoporEvento.ParamByName('DataFinalAcumulado').AsString:=Value;
  qryFluxoDetalhado.ParamByName('DataFinalAcumulado').AsString:=Value;
  if ExibirSaldoAcumulado then
    FParametroCabecalho := FParametroCabecalho +#13+
       'SALDO ACUMULADO ENTRE '+ FDataInicialAcumulado + ' E ' + FDataFinalAcumulado;
end;

procedure Tdtmrelatoriofluxodecaixa.SetDataInicial(const Value: String);
begin
  FDataInicial := Value;
  qryFluxoporEvento.ParamByName('DataInicial').AsString:=Value;
  qryFluxoDetalhado.ParamByName('DataInicial').AsString:=Value;

end;

procedure Tdtmrelatoriofluxodecaixa.SetDataInicialAcumulado(
  const Value: String);
begin
  FDataInicialAcumulado := Value;
  qryFluxoporEvento.ParamByName('DataInicialAcumulado').AsString:=Value;
  qryFluxoDetalhado.ParamByName('DataInicialAcumulado').AsString:=Value;

end;

procedure Tdtmrelatoriofluxodecaixa.SetFiliais(const Value: String);
begin
  if (Value <> '') then
   begin
    qryFluxoporEvento.macrobyname('WhereFilialVenda').AsString :=
      ' and (ct.filialvenda = ' + Value + ')';
    qryFluxoporEvento.macrobyname('WhereFilialEmissao').asstring :=
      ' and (dp.filialemissao = ' + Value + ')';
    qryFluxoporEvento.macrobyname('WhereFilialRecebimento').AsString :=
      ' and (r.filial = ' + Value + ')';
    qryFluxoporEvento.macrobyname('WhereFilialCheque').AsString :=
      ' and (ch.filial = ' + Value + ')';


    qryFluxoDetalhado.macrobyname('WhereFilialVenda').AsString :=
      ' and (ct.filialvenda = ' + Value + ')';
    qryFluxoDetalhado.macrobyname('WhereFilialEmissao').asstring :=
      ' and (dp.filialemissao = ' + Value + ')';
    qryFluxoDetalhado.macrobyname('WhereFilialRecebimento').AsString :=
      ' and (r.filial = ' + Value + ')';
    qryFluxoDetalhado.macrobyname('WhereFilialCheque').AsString :=
      ' and (ch.filial = ' + Value + ')';

    FParametroCabecalho:=FParametroCabecalho+' FILIAL: '+Value;
   end
  else
   begin
    qryFluxoporEvento.macrobyname('WhereFilialVenda').AsString := '';
    qryFluxoporEvento.macrobyname('WhereFilialEmissao').AsString := '';
    qryFluxoporEvento.macrobyname('WhereFilialRecebimento').AsString := '';
    qryFluxoporEvento.macrobyname('WhereFilialCheque').AsString := '';

    qryFluxoDetalhado.macrobyname('WhereFilialVenda').AsString := '';
    qryFluxoDetalhado.macrobyname('WhereFilialEmissao').AsString := '';
    qryFluxoDetalhado.macrobyname('WhereFilialRecebimento').AsString := '';
    qryFluxoDetalhado.macrobyname('WhereFilialCheque').AsString := '';
   end;
end;

procedure Tdtmrelatoriofluxodecaixa.SetGrupoFiliais(const Value: String);
begin
  if (Value <> '') then
   begin
    qryFluxoporEvento.macrobyname('WhereFilialVenda').AsString :=
      ' and (ct.filialvenda in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
    qryFluxoporEvento.macrobyname('WhereFilialEmissao').AsString :=
      ' and (dp.filialemissao in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
    qryFluxoporEvento.macrobyname('WhereFilialRecebimento').AsString :=
      ' and (r.filial in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
    qryFluxoporEvento.macrobyname('WhereFilialCheque').AsString :=
      ' and (ch.filial in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';


    qryFluxoDetalhado.macrobyname('WhereFilialVenda').AsString :=
      ' and (ct.filialvenda in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
    qryFluxoDetalhado.macrobyname('WhereFilialEmissao').AsString :=
      ' and (dp.filialemissao in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
    qryFluxoDetalhado.macrobyname('WhereFilialRecebimento').AsString :=
      ' and (r.filial in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';
    qryFluxoDetalhado.macrobyname('WhereFilialCheque').AsString :=
      ' and (ch.filial in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))';

    FParametroCabecalho:=FParametroCabecalho+' GRUPO DE FILIAL: '+Value;
   end;
end;


procedure Tdtmrelatoriofluxodecaixa.SetTipoRelatorio(const Value: Integer);
begin
  FTipoRelatorio := Value;
end;

procedure Tdtmrelatoriofluxodecaixa.frprelatoriofluxodecaixaBeginDoc;
begin
  inherited;
  FImprimindoRelatorio := True;
end;

procedure Tdtmrelatoriofluxodecaixa.frprelatoriofluxodecaixaEndDoc;
begin
  inherited;
  FImprimindoRelatorio := False;
end;

procedure Tdtmrelatoriofluxodecaixa.frprelatoriofluxodecaixaBeginBand(
  Band: TfrBand);
begin
  inherited;
  BandaImpressa := Band.Name;
  if BandaImpressa = 'CabecalhoFilial' then
   band.NewPageAfter := true;
end;

function Tdtmrelatoriofluxodecaixa.CalcularTotal(Campo: TField): Currency;
var
 TRegistros : Integer;
 Valor,
 TVlrRec, TJurosRec, TTotalRec,
 TVlraRec, TJurosaRec, TTotalaRec,
 TVlrPag, TJurosPag, TTotalPag,
 TVlraPag, TJurosaPag, TTotalaPag, TTSaldo : Currency;

 procedure Adicionar;
 begin
   Valor          := Valor + Campo.AsFloat;

   TRegistros     := TRegistros + qryTotalizacaoTRegistros.AsInteger;

   TVlrRec        := TVlrRec + qryTotalizacaotvlrrec.AsCurrency;
   TJurosRec      := TJurosRec + qryTotalizacaotjurosrec.AsCurrency;
   TTotalRec      := TTotalRec + qryTotalizacaottotalrec.AsCurrency;

   TVlraRec       := TVlraRec + qryTotalizacaotvlrarec.AsCurrency;
   TJurosaRec     := TJurosaRec + qryTotalizacaotjurosarec.AsCurrency;
   TTotalaRec     := TTotalaRec + qryTotalizacaottotalarec.AsCurrency;

   TVlrPag        := TVlrPag + qryTotalizacaotvlrPag.AsCurrency;
   TJurosPag      := TJurosPag + qryTotalizacaotjurosPag.AsCurrency;
   TTotalPag      := TTotalPag + qryTotalizacaottotalPag.AsCurrency;

   TVlraPag       := TVlraPag + qryTotalizacaotvlraPag.AsCurrency;
   TJurosaPag     := TJurosaPag + qryTotalizacaotjurosaPag.AsCurrency;
   TTotalaPag     := TTotalaPag + qryTotalizacaottotalaPag.AsCurrency;

   TTSaldo        := TTSaldo + qryTotalizacaottsaldo.AsCurrency;
 end;

 procedure AdicionarJaTotalizado(VGrupoFilial, VFilial: integer);
 begin
  qryTotalizacao.Append;
  qryTotalizacaogrupofilial.AsInteger := VGrupoFilial;
  qryTotalizacaofilial.AsInteger := VFilial;

  qryTotalizacaotregistros.AsInteger := TRegistros;

  qryTotalizacaotvlrrec.AsCurrency   := TVlrRec;
  qryTotalizacaotjurosrec.AsCurrency := TJurosRec;
  qryTotalizacaottotalrec.AsCurrency := TTotalRec;

  qryTotalizacaotvlrarec.AsCurrency   := TVlraRec;
  qryTotalizacaotjurosarec.AsCurrency := TJurosaRec;
  qryTotalizacaottotalarec.AsCurrency := TTotalaRec;

  qryTotalizacaotvlrpag.AsCurrency   := TVlrPag;
  qryTotalizacaotjurospag.AsCurrency := TJurosPag;
  qryTotalizacaottotalpag.AsCurrency := TTotalPag;

  qryTotalizacaotvlrapag.AsCurrency   := TVlraPag;
  qryTotalizacaotjurosapag.AsCurrency := TJurosaPag;
  qryTotalizacaottotalapag.AsCurrency := TTotalaPag;

  qryTotalizacaottsaldo.AsCurrency    := TTSaldo;

  qryTotalizacaojatotalizado.AsString := 'S';

  qrytotalizacao.Post;
 end;


begin
   Valor      := 0;
   TRegistros := 0;

   TVlrRec    := 0;
   TJurosRec  := 0;
   TTotalRec  := 0;

   TVlraRec   := 0;
   TJurosaRec := 0;
   TTotalaRec := 0;

   TVlrPag    := 0;
   TJurosPag  := 0;
   TTotalPag  := 0;

   TVlraPag   := 0;
   TJurosaPag := 0;
   TTotalaPag := 0;

   TTSaldo    := 0;

 if (BandaImpressa = 'RodapeFilial') and FAgruparFilial then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,FFilial,'S']),[]) then
   Valor := Valor + Campo.AsFloat
  else
  begin
   if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,FFilial, 'N']),[]) then
   begin
    while not qryTotalizacao.Eof do
    begin
     if (qryTotalizacaogrupofilial.AsInteger = FGrupoFilial) and
          (qryTotalizacaofilial.AsInteger = FFilial) and
          (qryTotalizacaojatotalizado.AsString='N')then
      Adicionar;
     qryTotalizacao.Next;
    end;
    AdicionarJaTotalizado(FGrupoFilial, FFilial);
   end;
  end;
 end

 else

 if (BandaImpressa = 'RodapeGrupoFilial') and FAgruparGrupoFilial then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,0,'S']),[]) then
   Valor := Valor + Campo.AsFloat
  else
   if qryTotalizacao.Locate('GrupoFilial;JaTotalizado',VarArrayof([FGrupoFilial,'S']),[]) then
   begin
    while not qryTotalizacao.Eof do
    begin
     if (qryTotalizacaogrupofilial.AsInteger = FGrupoFilial) and
        (qryTotalizacaojatotalizado.AsString='S') then
      Adicionar;
     qryTotalizacao.Next;
    end;
    AdicionarJaTotalizado(FGrupoFilial,0);
   end
   else
   begin
     if qryTotalizacao.Locate('GrupoFilial,JaTotalizado',VarArrayof([FGrupoFilial,'N']),[]) then
     begin
      while not qryTotalizacao.Eof do
      begin
       if (qryTotalizacaogrupofilial.AsInteger = FGrupoFilial) and
          (qryTotalizacaojatotalizado.AsString='N') then
        Adicionar;
       qryTotalizacao.Next;
      end;
      AdicionarJaTotalizado(FGrupoFilial,0);
     end;
   end;
 end

 else

 if BandaImpressa = 'SumarioTotal' then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([0,0,'S']),[]) then
   Valor := Valor + Campo.AsFloat
  else
   begin
    if qryTotalizacao.Locate('JaTotalizado','S',[]) then
    begin
     if (qryTotalizacaofilial.AsInteger<>0) then
     begin
      while not qryTotalizacao.eof do
      begin
       if (qryTotalizacaojatotalizado.AsString='S') and
          (qryTotalizacaofilial.AsInteger<>0) then
         Adicionar;
       qryTotalizacao.next;
      end;
      AdicionarJaTotalizado(0,0);
     end
     else
     begin
      while not qryTotalizacao.eof do
      begin
       if (qryTotalizacaojatotalizado.AsString='S') and
          (qryTotalizacaogrupofilial.AsInteger<>0) then
        Adicionar;
       qryTotalizacao.next;
      end;
      AdicionarJaTotalizado(0,0);
     end;
    end
    else
    begin
      qryTotalizacao.First;
      while not qryTotalizacao.Eof and
            (qryTotalizacaojatotalizado.AsString='N') do
      begin
       Adicionar;
       qryTotalizacao.Next;
      end;
      AdicionarJaTotalizado(0,0);
    end;
   end;
 end;

 result := valor;

end;

procedure Tdtmrelatoriofluxodecaixa.SetAgruparGrupoFilial(
  const Value: Boolean);
begin
  FAgruparGrupoFilial := Value;
  qryFluxoporEvento.ParamByName('AgruparGrupoFilial').AsBoolean := value;
  qryFluxoDetalhado.ParamByName('AgruparGrupoFilial').AsBoolean := value;
end;

procedure Tdtmrelatoriofluxodecaixa.SetAgruparFilial(const Value: Boolean);
begin
  FAgruparFilial := Value;
  qryFluxoporEvento.ParamByName('AgruparFilial').AsBoolean := value;
  qryFluxoDetalhado.ParamByName('AgruparFilial').AsBoolean := value;
end;

procedure Tdtmrelatoriofluxodecaixa.qryFluxoporEventoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if FImprimindoRelatorio and not qryFluxoporEvento.Eof then
  begin
   VerificarAgrupamentoEvento(qryFluxoporEvento);
   if not qryFluxoporEventototalizado.AsBoolean then
     TotalizarRelatorioEvento(qryFluxoporEvento);
  end;
end;

procedure Tdtmrelatoriofluxodecaixa.VerificarAgrupamentoEvento(Tabela :TtecQuery);
begin
   if AgruparGrupoFilial and AgruparFilial then
   begin
    FGrupoFilial := tabela.fieldbyname('grupofilial').AsInteger;
    FFilial := tabela.fieldbyname('filial').AsInteger;
   end
   else
   if AgruparGrupoFilial and not AgruparFilial then
   begin
    FGrupoFilial := tabela.fieldbyname('grupofilial').AsInteger;
    FFilial := 0;
   end
   else
   if not AgruparGrupoFilial and AgruparFilial then
   begin
    FGrupoFilial := 0;
    FFilial := tabela.fieldbyname('filial').AsInteger;
   end
   else
   if not AgruparGrupoFilial and not AgruparFilial then
   begin
    FGrupoFilial := 0;
    FFilial := 0;
   end;
end;

procedure Tdtmrelatoriofluxodecaixa.TotalizarRelatorioEvento(Tabela : TTecQuery);
begin
 tabela.Edit;
 tabela.fieldbyname('totalizado').AsBoolean := True;
 tabela.post;

  if not qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,FFilial,'N']),[]) then
  begin
  qryTotalizacao.Append;
  qryTotalizacao.Post;
  end;

 qryTotalizacao.Edit;
 qryTotalizacaogrupofilial.AsInteger := FGrupoFilial;
 qryTotalizacaofilial.AsInteger := FFilial;
 qryTotalizacaodata.Asstring := FData;
 qryTotalizacaoTRegistros.AsInteger := qryTotalizacaoTRegistros.AsInteger + 1;
 if tabela.fieldbyname('operacao').AsString='1 - SALDO ANTERIOR' then
 begin
   qryTotalizacaotvlrarec_ant.AsCurrency := qryTotalizacaotvlrarec_ant.AsCurrency+
                                            tabela.fieldbyname('vlrarec').AsCurrency;
   qryTotalizacaotvlrapag_ant.AsCurrency := qryTotalizacaotvlrapag_ant.AsCurrency+
                                            tabela.fieldbyname('vlrapag').AsCurrency;
   qryTotalizacaottsaldo_ant.AsCurrency :=  qryTotalizacaottsaldo_ant.AsCurrency+
                                            tabela.fieldbyname('vlrarec').AsCurrency-
                                            tabela.fieldbyname('vlrapag').AsCurrency;
 end
 else
 begin
  if tabela.fieldbyname('operacao').AsString<>'2 - SALDO INICIAL' then
    qryTotalizacaotvlrarec.AsCurrency := qryTotalizacaotvlrarec.AsCurrency+
                                         tabela.fieldbyname('vlrarec').AsCurrency;

  qryTotalizacaotvlrapag.AsCurrency := qryTotalizacaotvlrapag.AsCurrency+
                                       tabela.fieldbyname('vlrapag').AsCurrency;

  qryTotalizacaottsaldo.AsCurrency :=  qryTotalizacaottsaldo.AsCurrency+
                                       tabela.fieldbyname('vlrarec').AsCurrency-
                                       tabela.fieldbyname('vlrapag').AsCurrency;
 end;
 qryTotalizacaojatotalizado.AsString := 'N';
 qrytotalizacao.Post;
end;

procedure Tdtmrelatoriofluxodecaixa.frpFluxoporEventoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if ANSIUpperCase(parname) = 'EXIBIRSALDO' then
   ParValue := qryFluxoporEventoExibirSaldo.AsBoolean
  else if ANSIUpperCase(parname) = 'NOMEGRUPOFILIAL' then
   ParValue := qryFluxoporEventonomegrupofilial.AsString
  else if ANSIUpperCase(parname) = 'GRUPOFILIAL' then
   ParValue := qryFluxoporEventogrupofilial.AsString
  else if ANSIUpperCase(parname) = 'NOMEFILIAL' then
   ParValue := qryFluxoporEventonomefilial.AsString
  else if ANSIUpperCase(parname) = 'FILIAL' then
   ParValue := qryFluxoporEventofilial.AsString
  else if ANSIUpperCase(parname) = 'Evento_C' then
   ParValue := qryFluxoporEventoDescricaoEvento_c.AsString
  else if ANSIUpperCase(parname) = 'Evento_D' then
   ParValue := qryFluxoporEventoDescricaoEvento_d.AsString
  else if ANSIUpperCase(parname) = 'OPERACAO' then
   ParValue := qryFluxoporEventooperacao.AsString
  else if ANSIUpperCase(parname) = 'DATAMOVIMENTO' then
   ParValue := qryFluxoporEventodata.AsDateTime
  else if ANSIUpperCase(ParName) = 'VLRAREC' then
  begin
    if (qryFluxoporEventooperacao.AsString = '2 - SALDO INICIAL') or
       (qryFluxoporEventovlrarec.AsFloat=0) then
      ParValue := ''
    else
      ParValue := formatarvalor(qryFluxoporEventovlrarec.AsFloat,2);
  end
  else if ANSIUpperCase(ParName) = 'VLRAPAG' then
  begin
   if (qryFluxoporEventovlrapag.AsFloat<>0) then
     ParValue := formatarvalor(qryFluxoporEventovlrapag.AsFloat,2)
   else  ParValue := '';
  end
  else if ANSIUpperCase(ParName) = 'TREGISTROS_V' then
   ParValue := CalcularTotalEventos(qryTotalizacaoTRegistros)
  else if ANSIUpperCase(ParName) = 'TVLRAREC' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrarec),2)
  else if ANSIUpperCase(ParName) = 'TVLRAPAG' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrapag),2)
  else if ANSIUpperCase(ParName) = 'TTSALDO' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaottsaldo),2)
  else if ANSIUpperCase(ParName) = 'TVLRAREC_ANT' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrarec_ant),2)
  else if ANSIUpperCase(ParName) = 'TVLRAPAG_ANT' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrapag_ant),2)
  else if ANSIUpperCase(ParName) = 'TTSALDO_ANT' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaottsaldo_ant),2);
end;

function Tdtmrelatoriofluxodecaixa.CalcularTotalEventos(
  Campo: TField): Currency;
var
 TRegistros : Integer;
 Valor, TVlraRec, TVlraPag, TTSaldo,
 TVlraRec_Ant, TVlraPag_Ant, TTSaldo_Ant : Currency;

 procedure Adicionar;
 begin
   Valor          := Valor + Campo.AsFloat;

   TRegistros     := TRegistros + qryTotalizacaoTRegistros.AsInteger;

   TVlraRec       := TVlraRec + qryTotalizacaotvlrarec.AsCurrency;
   TVlraPag       := TVlraPag + qryTotalizacaotvlraPag.AsCurrency;
   TTSaldo        := TTSaldo + qryTotalizacaottsaldo.AsCurrency;

   TVlraRec_Ant   := TVlraRec_Ant + qryTotalizacaotvlrarec_ant.AsCurrency;
   TVlraPag_Ant   := TVlraPag_Ant + qryTotalizacaotvlrapag_ant.AsCurrency;
   TTSaldo_Ant    := TTSaldo_Ant + qryTotalizacaottsaldo_ant.AsCurrency;

 end;

 procedure AdicionarJaTotalizado(VGrupoFilial, VFilial: integer);
 begin
  qryTotalizacao.Append;
  qryTotalizacaogrupofilial.AsInteger := VGrupoFilial;
  qryTotalizacaofilial.AsInteger := VFilial;

  qryTotalizacaotregistros.AsInteger := TRegistros;

  qryTotalizacaotvlrarec.AsCurrency   := TVlraRec;
  qryTotalizacaotvlrapag.AsCurrency   := TVlraPag;
  qryTotalizacaottsaldo.AsCurrency    := TTSaldo;

  qryTotalizacaotvlrarec_ant.AsCurrency   := TVlraRec_Ant;
  qryTotalizacaotvlrapag_ant.AsCurrency   := TVlraPag_Ant;
  qryTotalizacaottsaldo_ant.AsCurrency    := TTSaldo_Ant;

  qryTotalizacaojatotalizado.AsString := 'S';

  qrytotalizacao.Post;
 end;


begin
   Valor      := 0;
   TRegistros := 0;

   TVlraRec   := 0;
   TVlraPag   := 0;
   TTSaldo    := 0;

   TVlraRec_Ant   := 0;
   TVlraPag_Ant   := 0;
   TTSaldo_Ant    := 0;


 if (BandaImpressa = 'MasterDataFluxo') or
    (BandaImpressa = 'RodapeSaldoAnterior') then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial',VarArrayof([FGrupoFilial,FFilial]),[]) then
    Valor := Campo.AsFloat;
 end

 else

 if (BandaImpressa = 'RodapeFilial') and FAgruparFilial then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,FFilial,'S']),[]) then
   Valor := Valor + Campo.AsFloat
  else
  begin
   if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,FFilial, 'N']),[]) then
   begin
    while not qryTotalizacao.Eof do
    begin
     if (qryTotalizacaogrupofilial.AsInteger = FGrupoFilial) and
          (qryTotalizacaofilial.AsInteger = FFilial) and
          (qryTotalizacaojatotalizado.AsString='N')then
      Adicionar;
     qryTotalizacao.Next;
    end;
    AdicionarJaTotalizado(FGrupoFilial, FFilial);
   end;
  end;
 end

 else

 if (BandaImpressa = 'RodapeGrupoFilial') and FAgruparGrupoFilial then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([FGrupoFilial,0,'S']),[]) then
   Valor := Valor + Campo.AsFloat
  else
   if qryTotalizacao.Locate('GrupoFilial;JaTotalizado',VarArrayof([FGrupoFilial,'S']),[]) then
   begin
    while not qryTotalizacao.Eof do
    begin
     if (qryTotalizacaogrupofilial.AsInteger = FGrupoFilial) and
        (qryTotalizacaojatotalizado.AsString='S') then
      Adicionar;
     qryTotalizacao.Next;
    end;
    AdicionarJaTotalizado(FGrupoFilial,0);
   end
   else
   begin
     if qryTotalizacao.Locate('GrupoFilial,JaTotalizado',VarArrayof([FGrupoFilial,'N']),[]) then
     begin
      while not qryTotalizacao.Eof do
      begin
       if (qryTotalizacaogrupofilial.AsInteger = FGrupoFilial) and
          (qryTotalizacaojatotalizado.AsString='N') then
        Adicionar;
       qryTotalizacao.Next;
      end;
      AdicionarJaTotalizado(FGrupoFilial,0);
     end;
   end;
 end

 else

 if BandaImpressa = 'SumarioTotal' then
 begin
  if qryTotalizacao.Locate('GrupoFilial;Filial;JaTotalizado',VarArrayof([0,0,'S']),[]) then
   Valor := Valor + Campo.AsFloat
  else
   begin
    if qryTotalizacao.Locate('JaTotalizado','S',[]) then
    begin
     if (qryTotalizacaofilial.AsInteger<>0) then
     begin
      while not qryTotalizacao.eof do
      begin
       if (qryTotalizacaojatotalizado.AsString='S') and
          (qryTotalizacaofilial.AsInteger<>0) then
         Adicionar;
       qryTotalizacao.next;
      end;
      AdicionarJaTotalizado(0,0);
     end
     else
     begin
      while not qryTotalizacao.eof do
      begin
       if (qryTotalizacaojatotalizado.AsString='S') and
          (qryTotalizacaogrupofilial.AsInteger<>0) then
        Adicionar;
       qryTotalizacao.next;
      end;
      AdicionarJaTotalizado(0,0);
     end;
    end
    else
    begin
      qryTotalizacao.First;
      while not qryTotalizacao.Eof and
            (qryTotalizacaojatotalizado.AsString='N') do
      begin
       Adicionar;
       qryTotalizacao.Next;
      end;
      AdicionarJaTotalizado(0,0);
    end;
   end;
 end;

 result := valor;

end;


procedure Tdtmrelatoriofluxodecaixa.SetSaldoInicial(const Value: Currency);
begin
  FSaldoInicial := Value;
  qryFluxoporEvento.parambyname('SaldoInicial').ascurrency := FSaldoInicial;
  qryFluxoDetalhado.parambyname('SaldoInicial').ascurrency := FSaldoInicial;
end;

procedure Tdtmrelatoriofluxodecaixa.frpFluxoporEventoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpFluxoporEvento, view);
end;

procedure Tdtmrelatoriofluxodecaixa.frpFluxoDetalhadoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpFluxoDetalhado, view);
end;

procedure Tdtmrelatoriofluxodecaixa.frpFluxoDetalhadoBeginBand(
  Band: TfrBand);
begin
  inherited;
  BandaImpressa := Band.Name;
  if BandaImpressa = 'CabecalhoFilial' then
   band.NewPageAfter := true;
end;

procedure Tdtmrelatoriofluxodecaixa.frpFluxoDetalhadoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if ANSIUpperCase(parname) = 'EXIBIRSALDO' then
   ParValue := qryFluxoDetalhadoExibirSaldo.AsBoolean
  else if ANSIUpperCase(parname) = 'NOMEGRUPOFILIAL' then
   ParValue := qryFluxoDetalhadonomegrupofilial.AsString
  else if ANSIUpperCase(parname) = 'GRUPOFILIAL' then
   ParValue := qryFluxoDetalhadogrupofilial.AsString
  else if ANSIUpperCase(parname) = 'NOMEFILIAL' then
   ParValue := qryFluxoDetalhadonomefilial.AsString
  else if ANSIUpperCase(parname) = 'FILIAL' then
   ParValue := qryFluxoDetalhadofilial.AsString
  else if ANSIUpperCase(parname) = 'Evento_C' then
   ParValue := qryFluxoDetalhadoDescricaoEvento_c.AsString
  else if ANSIUpperCase(parname) = 'Evento_D' then
   ParValue := qryFluxoDetalhadoDescricaoEvento_d.AsString
  else if ANSIUpperCase(parname) = 'OPERACAO' then
   ParValue := qryFluxoDetalhadooperacao.AsString
  else if ANSIUpperCase(parname) = 'DATAMOVIMENTO' then
   ParValue := qryFluxoDetalhadodata.AsDAteTime
  else if ANSIUpperCase(ParName) = 'VLRAREC' then
  begin
    if (qryFluxoDetalhadooperacao.AsString = '2 - SALDO INICIAL') or
       (qryFluxoDetalhadovlrarec.AsFloat=0) then
      ParValue := ''
    else
      ParValue := formatarvalor(qryFluxoDetalhadovlrarec.AsFloat,2);
  end
  else if ANSIUpperCase(ParName) = 'VLRAPAG' then
  begin
   if (qryFluxoDetalhadovlrapag.AsFloat<>0) then
     ParValue := formatarvalor(qryFluxoDetalhadovlrapag.AsFloat,2)
   else  ParValue := '';
  end
  else if ANSIUpperCase(ParName) = 'TREGISTROS_V' then
   ParValue := CalcularTotalEventos(qryTotalizacaoTRegistros)
  else if ANSIUpperCase(ParName) = 'TVLRAREC' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrarec),2)
  else if ANSIUpperCase(ParName) = 'TVLRAPAG' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrapag),2)
  else if ANSIUpperCase(ParName) = 'TTSALDO' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaottsaldo),2)
  else if ANSIUpperCase(ParName) = 'TVLRAREC_ANT' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrarec_ant),2)
  else if ANSIUpperCase(ParName) = 'TVLRAPAG_ANT' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaotvlrapag_ant),2)
  else if ANSIUpperCase(ParName) = 'TTSALDO_ANT' then
   ParValue := formatarvalor(CalcularTotalEventos(qryTotalizacaottsaldo_ant),2);

end;

procedure Tdtmrelatoriofluxodecaixa.qryFluxoDetalhadoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if FImprimindoRelatorio and not qryFluxoDetalhado.Eof then
  begin
   VerificarAgrupamentoEvento(qryFluxoDetalhado);
   if not qryFluxoDetalhadototalizado.AsBoolean then
     TotalizarRelatorioEvento(qryFluxoDetalhado);
  end;
end;

function Tdtmrelatoriofluxodecaixa.SaldoFluxoCaixa: Currency;
begin
  result := qrysaldoFluxoCaixasaldo.AsCurrency;
end;

procedure Tdtmrelatoriofluxodecaixa.qryFluxoporEventoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  VerificarSaldoaExibir(qryFluxoporEvento);
end;

procedure Tdtmrelatoriofluxodecaixa.VerificarSaldoaExibir(
  Tabela: TTecQuery);
var
  GrupodeFilial, Filial, Data: String;
  procedure Exibir;
  begin
    tabela.Prior;
    tabela.Edit;
    tabela.fieldbyname('ExibirSaldo').AsBoolean := true;
    tabela.post;
    tabela.Next;
  end;
begin
  inherited;

  tabela.AfterScroll := nil;

  tabela.First;

  GrupodeFilial := '';
  Filial := '';
  Data := '';

  while not Tabela.Eof do
  begin
    GrupodeFilial := Tabela.fieldbyname('grupofilial').AsString;
    Filial := Tabela.fieldbyname('filial').AsString;
    Data := Tabela.fieldbyname('data').AsString;
    Tabela.Next;
    if AgruparGrupoFilial and AgruparFilial then
    begin
      if ((GrupodeFilial <> Tabela.fieldbyname('grupofilial').AsString) or
          (Filial <> Tabela.fieldbyname('filial').asstring) or
          (Data <> Tabela.fieldbyname('data').AsString)) then
        Exibir
    end
    else
    if AgruparGrupoFilial then
    begin
      if ((GrupodeFilial <> Tabela.fieldbyname('grupofilial').AsString) or
          (Data <> Tabela.fieldbyname('data').AsString)) then
        Exibir
    end
    else
    if AgruparFilial then
    begin
      if ((Filial <> Tabela.fieldbyname('filial').asstring) or
          (Data <> Tabela.fieldbyname('data').AsString)) then
        Exibir
    end
    else
      if (Data <> Tabela.fieldbyname('data').AsString) then
        Exibir;
  end;

  //ultimo sempre é visivel
  if not Tabela.fieldbyname('ExibirSaldo').AsBoolean then
  begin
    Tabela.Edit;
    Tabela.fieldbyname('ExibirSaldo').AsBoolean := true;
    Tabela.post;
  end;

  Tabela.First;

end;

procedure Tdtmrelatoriofluxodecaixa.qryFluxoDetalhadoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  VerificarSaldoaExibir(qryFluxoDetalhado);
end;

procedure Tdtmrelatoriofluxodecaixa.SetExibirSaldoAcumulado(
  const Value: Boolean);
begin
  FExibirSaldoAcumulado := Value;
  if not value then
  begin
    qryFluxoporEvento.Sql[
      NumerodalinhanoTexto(
           qryFluxoporEvento.Sql,'/*INICIO SALDO ANTERIOR*/')] :=
            '/*INICIO SALDO ANTERIOR';

    qryFluxoporEvento.Sql[
      NumerodalinhanoTexto(
           qryFluxoporEvento.Sql,'/*FINAL SALDO ANTERIOR*/')] :=
          'FINAL SALDO ANTERIOR*/';

    qryFluxoDetalhado.Sql[
      NumerodalinhanoTexto(
           qryFluxoDetalhado.Sql,'/*INICIO SALDO ANTERIOR*/')] :=
          '/*INICIO SALDO ANTERIOR';

    qryFluxoDetalhado.Sql[
      NumerodalinhanoTexto(
           qryFluxoDetalhado.Sql,'/*FINAL SALDO ANTERIOR*/')] :=
          'FINAL SALDO ANTERIOR*/';

  end;
end;
procedure Tdtmrelatoriofluxodecaixa.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\logadmin3.txt') then
    Listar.loadfromfile('c:\logadmin3.txt');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\logadmin3.txt');
  listar.free;
end;

procedure Tdtmrelatoriofluxodecaixa.SetExibirSaldoInicial(
  const Value: Boolean);
begin
  FExibirSaldoAcumulado := Value;
  if not value then
  begin

    qryFluxoporEvento.Sql[
      NumerodalinhanoTexto(
           qryFluxoporEvento.Sql,'/*DEFINIÇÃO DO SALDO INICIAL INFORMADO*/')] :=
            '/*DEFINIÇÃO DO SALDO INICIAL INFORMADO';

    qryFluxoporEvento.Sql[
      NumerodalinhanoTexto(
           qryFluxoporEvento.Sql,'/*FIM DA DEFINIÇÃO DO SALDO INICIAL INFORMADO*/')] :=
          'FIM DA DEFINIÇÃO DO SALDO INICIAL INFORMADO*/';

    qryFluxoDetalhado.Sql[
      NumerodalinhanoTexto(
           qryFluxoDetalhado.Sql,'/*DEFINIÇÃO DO SALDO INICIAL INFORMADO*/')] :=
            '/*DEFINIÇÃO DO SALDO INICIAL INFORMADO';

    qryFluxoDetalhado.Sql[
      NumerodalinhanoTexto(
           qryFluxoDetalhado.Sql,'/*FIM DA DEFINIÇÃO DO SALDO INICIAL INFORMADO*/')] :=
          'FIM DA DEFINIÇÃO DO SALDO INICIAL INFORMADO*/';

  end;
end;

end.
