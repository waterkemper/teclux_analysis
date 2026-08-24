unit dmrelatoriorecebimentosporcobrador;

interface

uses
  SysUtils, Classes, DB,
  // Constantes
  ctconstantes, biblio,
  // Componentes
  cpdatasource, cpquery,
  // Terceiros
  FR_DSet, FR_DBSet, FR_Class, ZQuery, ZPgSqlQuery, frx2xto30,
  // Repositorio
  dmtecsoft, dmbasico, clparametrossistema, fmpreviewpadrao, frxClass;

type
  TdtmRelatorioRecebimentosPorCobrador = class(TdtmBasico)
    qryFilial: TtecQuery;
    qryFilialcodigo: TIntegerField;
    qryFilialnome: TStringField;
    dsrFilial: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryCobradores: TtecQuery;
    dsrCobradores: TtecDataSource;
    qryConsultaCobradores: TtecQuery;
    qryAgentes: TtecQuery;
    dsrAgentes: TtecDataSource;
    qryConsultaAgentes: TtecQuery;
    qryRecebimentos: TtecQuery;
    frpRecebimentos: TfrReport;
    fdsRecebimentos: TfrDBDataSet;
    qryCobradoresnome: TStringField;
    qryCobradorescodigo: TIntegerField;
    qryAgentescodigo: TIntegerField;
    qryAgentesdescricao: TStringField;
    qryConsultaAgentesdescricao: TStringField;
    qryConsultaAgentescodigo: TIntegerField;
    qryConsultaCobradoresnome: TStringField;
    qryConsultaCobradorescodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryRecebimentoscontrato: TStringField;
    qryRecebimentosparcelaorigem: TStringField;
    qryRecebimentosvalorpagto: TFloatField;
    qryRecebimentosdatapagto: TDateField;
    qryRecebimentosdata: TDateField;
    qryRecebimentoscliente: TIntegerField;
    qryRecebimentosnomecliente: TStringField;
    qryRecebimentosdatacobranca: TDateField;
    qryRecebimentosusuario: TIntegerField;
    qryRecebimentosnomecobrador: TStringField;    frxReport1: TfrxReport;
    procedure frpRecebimentosBeforePrint(Memo: TStringList; View: TfrView);
  protected
    FParametroCabecalho: String;
    FPeriodoFinal: String;
    FPeriodoInicial: String;
    procedure MontaIntervaloPeriodo;
    procedure SetAgente(const Value: String);
    procedure SetCobrador(const Value: String);
    procedure SetPeriodoFinal(const Value: String);
    procedure SetPeriodoInicial(const Value: String);
    procedure SetFilial(const Value: String);
    procedure SetOrdenacao(const Value: Integer);
    function  GetConsultaAgentes: TtecQuery;
    function  GetConsultaCobradores: TtecQuery;
    function  GetConsultaFiliais: TtecQuery;
  public
    function  GerarRelatorio: Boolean;
    procedure ImprimirRelatorio;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecRecebimentosPorCobrador);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecRecebimentosPorCobrador);
    procedure Selecionar(TipoPesquisa: TtecRecebimentosPorCobrador);
    function  ExisteFiliais(Campo, Codigo: string): Boolean;
    function  ExisteCobradores(Campo, Codigo: String): Boolean;
    function  ExisteAgentes(Campo, Codigo: String): Boolean;
    constructor Create(AOwner: TComponent); Override;
    property ConsultaFiliais: TtecQuery read GetConsultaFiliais;
    property ConsultaCobradores: TtecQuery read GetConsultaCobradores;
    property ConsultaAgentes: TtecQuery read GetConsultaAgentes;
    property PeriodoInicial: String read FPeriodoInicial write SetPeriodoInicial;
    property PeriodoFinal: String read FPeriodoFinal write SetPeriodoFinal;
    property Filial: String write SetFilial;
    property Cobrador: String write SetCobrador;
    property Agente: String write SetAgente;
    property Ordenacao: Integer write SetOrdenacao;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
  end;

implementation

const
    WhereBase = 11;
    WherePeriodo         = WhereBase + 1;
    WhereFilial          = WhereBase + 2;
    WhereAgente          = WhereBase + 9;
    WhereCobrador        = WhereBase + 14;
    WhereOrdenacao       = WhereBase + 15;

{$R *.dfm}

{ TdtmRelatorioChequesEmitidos }

procedure TdtmRelatorioRecebimentosPorCobrador.AbreTabelaPesquisa(TipoPesquisa: TtecRecebimentosPorCobrador);
begin
  case TipoPesquisa of
          rpcFILIAIS : qryConsultaFiliais.Open;
       rpcCOBRADORES : qryConsultaCobradores.Open;
          rpcAGENTES : qryConsultaAgentes.Open;
  end;
end;

constructor TdtmRelatorioRecebimentosPorCobrador.Create(AOwner: TComponent);
begin
  inherited;
  qryFilial.Tag     := ctTabelas;
  qryCobradores.Tag := ctTabelas;
  qryAgentes.Tag    := ctTabelas;
end;

function TdtmRelatorioRecebimentosPorCobrador.ExisteAgentes(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaAgentes, Campo, Codigo);
end;

function TdtmRelatorioRecebimentosPorCobrador.ExisteCobradores(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaCobradores, Campo, Codigo);
end;

function TdtmRelatorioRecebimentosPorCobrador.ExisteFiliais(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

procedure TdtmRelatorioRecebimentosPorCobrador.FechaTabelaPesquisa(TipoPesquisa: TtecRecebimentosPorCobrador);
begin
  case TipoPesquisa of
          rpcFILIAIS : qryConsultaFiliais.Close;
       rpcCOBRADORES : qryConsultaCobradores.Close;
          rpcAGENTES : qryConsultaAgentes.Close;
  end;
end;

function TdtmRelatorioRecebimentosPorCobrador.GerarRelatorio: Boolean;
begin
  qryRecebimentos.Open;
  Result:= qryRecebimentos.IsEmpty;
end;

function TdtmRelatorioRecebimentosPorCobrador.GetConsultaAgentes: TtecQuery;
begin
  Result:= qryConsultaAgentes;
end;

function TdtmRelatorioRecebimentosPorCobrador.GetConsultaCobradores: TtecQuery;
begin
  Result:= qryConsultaCobradores;
end;

function TdtmRelatorioRecebimentosPorCobrador.GetConsultaFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

procedure TdtmRelatorioRecebimentosPorCobrador.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin


  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= FParametroCabecalho;  frpRecebimentos.designreport;  frxReport1.designreport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do
    begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.Reports.Add(frpRecebimentos);
    end;
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free
  end;
end;

procedure TdtmRelatorioRecebimentosPorCobrador.MontaIntervaloPeriodo;
const
  Data_1 = '(p.datapagto = ';
  Data_2 = '(p.datapagto between (';
begin
  if not DataEmBranco(FPeriodoInicial) then begin
    if DataEmBranco(FPeriodoFinal) then begin
      qryRecebimentos.Sql[WherePeriodo]:= Data_1 + '''' + FPeriodoInicial + ''')';
      FParametroCabecalho:=FParametroCabecalho+'Entre: ' + FPeriodoInicial + ' e ' + FPeriodoInicial;
    end
    else begin
      qryRecebimentos.Sql[WherePeriodo]:= Data_2 + '''' + FPeriodoInicial + ''') and (''' + FPeriodoFinal + '''))';
      FParametroCabecalho:=FParametroCabecalho+'Entre: ' + FPeriodoInicial + ' e ' + FPeriodoFinal;
    end;
  end
  else begin
    if not DataEmBranco(FPeriodoFinal) then begin
      qryRecebimentos.Sql[WherePeriodo]:= Data_1 + '''' + FPeriodoFinal + ''')';
      FParametroCabecalho:=FParametroCabecalho+'Entre: ' + FPeriodoFinal + ' e ' + FPeriodoInicial;
    end
    else
      qryRecebimentos.Sql[WherePeriodo]:= '';
  end;
end;

procedure TdtmRelatorioRecebimentosPorCobrador.Selecionar(TipoPesquisa: TtecRecebimentosPorCobrador);
begin
  case TipoPesquisa of
          rpcFILIAIS : ReFazConsulta(qryFilial,    [0],[qryConsultaFiliaiscodigo.AsInteger]);
       rpcCOBRADORES : ReFazConsulta(qryCobradores,[0],[qryConsultaCobradorescodigo.AsInteger]);
          rpcAGENTES : ReFazConsulta(qryAgentes,   [0],[qryConsultaAgentescodigo.AsInteger]);
  end;
end;

procedure TdtmRelatorioRecebimentosPorCobrador.SetAgente(const Value: String);
begin
  if (Value <> '') then begin
    FParametroCabecalho:= FParametroCabecalho + ' Agente: ' + Value;
    qryRecebimentos.Sql[WhereAgente]:= 'and (c.agente = ' + Value + ')'
  end
  else qryRecebimentos.Sql[WhereAgente]:= '';
end;

procedure TdtmRelatorioRecebimentosPorCobrador.SetCobrador(const Value: String);
begin
  if (Value <> '') then begin
    FParametroCabecalho:=FParametroCabecalho+' Cobrador: ' + Value;
    qryRecebimentos.Sql[WhereCobrador]:= 'and (uc.usuario = ' + Value + ')';
  end
  else qryRecebimentos.Sql[WhereCobrador]:= '';
end;

procedure TdtmRelatorioRecebimentosPorCobrador.SetPeriodoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoFinal := Value
  else FPeriodoFinal := '';
  MontaIntervaloPeriodo;
end;

procedure TdtmRelatorioRecebimentosPorCobrador.SetPeriodoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FPeriodoInicial := Value
  else FPeriodoInicial := '';
  MontaIntervaloPeriodo;  
end;

procedure TdtmRelatorioRecebimentosPorCobrador.SetFilial(const Value: String);
begin
  if (Value <> '') then begin
   qryRecebimentos.Sql[WhereFilial]:= 'and (p.filialpagto = ' + Value + ')';
   FParametroCabecalho:=FParametroCabecalho+' Filial pagto: '+Value;
  end
  else qryRecebimentos.Sql[WhereFilial]:= '';
end;

procedure TdtmRelatorioRecebimentosPorCobrador.SetOrdenacao(const Value: Integer);
begin
  case Value of
    0: begin
         qryRecebimentos.Sql[WhereOrdenacao]:= 'Order By p.datapagto';
         FParametroCabecalho:=FParametroCabecalho+' Ordenação: Data pagto';
       end;
    1: begin
        qryRecebimentos.Sql[WhereOrdenacao]:= 'Order By UPPER(TO_ASCII(c.nome,''LATIN1''))';
        FParametroCabecalho:=FParametroCabecalho+' Ordenação: Nome cliente';
       end;
    2: begin
        qryRecebimentos.Sql[WhereOrdenacao]:= 'Order By p.valorpagto';
        FParametroCabecalho:=FParametroCabecalho+' Ordenação: Vaor pagto';
       end;
  end;
end;

procedure TdtmRelatorioRecebimentosPorCobrador.frpRecebimentosBeforePrint(Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
    if FileExists(LogotipoFilialBase) then
      try
        TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase)
      except
      end;
end;

end.
