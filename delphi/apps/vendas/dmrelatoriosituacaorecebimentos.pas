unit dmrelatoriosituacaorecebimentos;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, CheckLst, dmtecsoft, FR_Class, FR_DSet, FR_DBSet,
  clparametrossistema, biblio,
  fmpreviewpadrao, ZTransact;

type
  TdtmRelatorioSituacaoRecebimentos = class(TdtmBasico)
    qryAgentes: TtecQuery;
    qryAgentescodigo: TIntegerField;
    qryAgentesdescricao: TStringField;
    qryConceitos: TtecQuery;
    qryConceitoscodigo: TIntegerField;
    qryConceitosdescricao: TStringField;
    qryRelatorioSituacaoRecebimentos: TtecQuery;
    frpRelatorioSituacaoRecebimentos: TfrReport;
    fdsRelatorioSituacaoRecebimentos: TfrDBDataSet;
    qryRelatorioSituacaoRecebimentosgrupofilialvenda: TIntegerField;
    qryRelatorioSituacaoRecebimentosnomegrupofilialvenda: TStringField;
    qryRelatorioSituacaoRecebimentosfilialvenda: TIntegerField;
    qryRelatorioSituacaoRecebimentosnomefilialvenda: TStringField;
    qryRelatorioSituacaoRecebimentosmesvencto: TMemoField;
    qryRelatorioSituacaoRecebimentosmesvenctorelatorio: TMemoField;
    qryRelatorioSituacaoRecebimentosordemsubtotal: TMemoField;
    qryRelatorioSituacaoRecebimentosvenctomesbase: TFloatField;
    qryRelatorioSituacaoRecebimentosavistamesbase: TFloatField;
    qryRelatorioSituacaoRecebimentosentradamesbase: TFloatField;
    qryRelatorioSituacaoRecebimentosvenctomesanterior: TFloatField;
    qryRelatorioSituacaoRecebimentospagtomesbase: TFloatField;
    qryRelatorioSituacaoRecebimentosjurosmesbase: TFloatField;
    qryRelatorioSituacaoRecebimentosaprazomesbase: TFloatField;
    procedure frpRelatorioSituacaoRecebimentosBeforePrint(
      Memo: TStringList; View: TfrView);
  private
    FListaAgentes: TStringList;
    FAgruparFilial: Boolean;
    FAgruparGrupoFilial: Boolean;
    FTipodeContrato: Integer;
    FRenegociacao: Integer;
    FParametroCabecalho: String;
    FMesBase: String;
    FMesBaseSaldo: String;
    FMesBaseDepois: String;
    FFiliais: String;
    FGrupoFiliais: String;
    function GetListaAgentes: TStrings;
    procedure SetAgentes(const Value: String);
    procedure SetFiliais(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetRenegociacao(const Value: Integer);
    procedure SetTipodeContrato(const Value: Integer);
    procedure SetMesBase(const Value: String);
    procedure SetMesBaseSaldo(const Value: String);
    procedure SetAgruparFilial(const Value: Boolean);
    procedure SetAgruparGrupoFilial(const Value: Boolean);
    procedure SetMesBaseDepois(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioVendas);
    property Filiais: String read FFiliais write SetFiliais;
    property GrupoFiliais: String read FGrupoFiliais write SetGrupoFiliais;
    property Agentes: String write SetAgentes;
    property TipodeContrato: Integer read FTipodeContrato write SetTipodeContrato;
    property Renegociacao: Integer read FRenegociacao write SetRenegociacao;
    procedure ImprimirRelatorio;
    property ListaAgentes: TStrings read GetListaAgentes;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property AgruparGrupoFilial: Boolean read FAgruparGrupoFilial write SetAgruparGrupoFilial;
    property AgruparFilial: Boolean read FAgruparFilial write SetAgruparFilial;
    procedure MontarFiltroAgentes(Usar: TCheckListBox);
    property MesBaseSaldo: String read FMesBaseSaldo write SetMesBaseSaldo;
    property MesBaseDepois: String read FMesBaseDepois write SetMesBaseDepois;
    property MesBase: String read FMesBase write SetMesBase;
  end;

var
  dtmRelatorioSituacaoRecebimentos: TdtmRelatorioSituacaoRecebimentos;

implementation

{$R *.dfm}
const
   WhereBase                  = 83;
   Wherefiliais               = WhereBase+1;
   WhereAgentes               = WhereBase+2;
   WhereTipodeContrato        = WhereBase+3;
//   WhereContratoNaoEstornado  = WhereBase+4;

 // Filtros
  FiltroAgente      = ' AND ( ct.agente IN (%s)) ' +#13#10;


{ TdtmRelatorioSituacaoRecebimentos }

procedure TdtmRelatorioSituacaoRecebimentos.AbreTabelaPesquisa(
  TipoPesquisa: TtecRelatorioVendas);
begin
  case TipoPesquisa of
    rvFILIAIS         : abre(ctVendaTabelaConsultaFiliais);
    rvGRUPOFILIAIS    : abre(ctVendaTabelaConsultaGrupoFiliais);
  end;
end;

constructor TdtmRelatorioSituacaoRecebimentos.Create(AOwner: TComponent);
begin
  inherited;
  qryAgentes.Tag                :=ctTabelas;
end;

destructor TdtmRelatorioSituacaoRecebimentos.Destroy;
begin
  FListaAgentes.Free;
  inherited;
end;


function TdtmRelatorioSituacaoRecebimentos.GetListaAgentes: TStrings;
begin
  FListaAgentes:= TStringList.Create;
  qryAgentes.Open;
  while not qryAgentes.Eof do
  begin
    FListaAgentes.AddObject(qryAgentesdescricao.AsString, Pointer(qryAgentescodigo.AsInteger));
    qryAgentes.Next;
  end;
  qryAgentes.Close;
  Result := FListaAgentes;
end;

procedure TdtmRelatorioSituacaoRecebimentos.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['AgruparGrupoFilial']:=FAgruparGrupoFilial;
  frVariables['AgruparFilial']:=FAgruparFilial;
  frVariables['MesBase']:= FMesBase;
  frpRelatorioSituacaoRecebimentos.Dataset:=fdsRelatorioSituacaoRecebimentos;

  ImprimirRelatoriofast('SITUACAO DOS RECEBIMENTOS', FParametroCabecalho, MSimples, 0,
                     [frpRelatorioSituacaoRecebimentos], false, self);


end;

procedure TdtmRelatorioSituacaoRecebimentos.MontarFiltroAgentes(
  Usar: TCheckListBox);
var
  STRAgentes: String;
  TodosAgentes: Boolean;
  cnt: Integer;
begin
  TodosAgentes:=true;
  STRAgentes := '';
  for cnt := 0 to FListaAgentes.Count - 1 do
    if Usar.Checked[cnt] then
      STRAgentes := STRAgentes + '''' + IntToStr(Integer(FListaAgentes.Objects[cnt])) + ''','
    else
      TodosAgentes:=false;

  STRAgentes := Copy(STRAgentes, 0, Length(STRAgentes) - 1);
  if Trim(STRAgentes) <> '' then
  begin
    if TodosAgentes then
      FParametroCabecalho:=FParametroCabecalho+' Agentes: Todos'
    else
      FParametroCabecalho:=FParametroCabecalho+' Agentes: '+STRAgentes;
  end;
  Agentes := STRAGentes;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetAgentes(
  const Value: String);
begin
if Value <>'' then
 qryRelatorioSituacaoRecebimentos.Sql[WhereAgentes]:=Format(FiltroAgente,[Value])
else
 qryRelatorioSituacaoRecebimentos.Sql[WhereAgentes]:=''
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetAgruparFilial(
  const Value: Boolean);
begin
  FAgruparFilial := Value;
  qryRelatorioSituacaoRecebimentos.ParamByName('AgruparFilial').AsBoolean:=Value;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetAgruparGrupoFilial(
  const Value: Boolean);
begin
  FAgruparGrupoFilial := Value;
  qryRelatorioSituacaoRecebimentos.ParamByName('AgruparGrupoFilial').AsBoolean:=Value;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetFiliais(
  const Value: String);
begin
 FFiliais := Value;
 if (Value <> '') then
   qryRelatorioSituacaoRecebimentos.Sql[WhereFiliais]:=
     ' and (ct.filialvenda in (' + Value + '))'
 else
   qryRelatorioSituacaoRecebimentos.Sql[WhereFiliais]:= '';
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetGrupoFiliais(
  const Value: String);
begin
  if (Value <> '') then
  begin
   if ParSistema.RelatorioSomenteFiliaisAutorizadas then
     qryRelatorioSituacaoRecebimentos.Sql[WhereFiliais]:=
     qryRelatorioSituacaoRecebimentos.Sql[WhereFiliais] +
     ' and (ct.filialvenda in (Select filial From filiaisgruposfiliais '+
     'Where grupo = ' + Value + '))'
   else
     qryRelatorioSituacaoRecebimentos.Sql[WhereFiliais]:=
     ' and (ct.filialvenda in (Select filial From filiaisgruposfiliais '+
     'Where grupo = ' + Value + '))'
  end;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetMesBase(
  const Value: String);
begin
  FmesBase := Value;
  qryRelatorioSituacaoRecebimentos.ParamByName('MesBase').AsString:=FMesBase;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetMesBaseSaldo(
  const Value: String);
begin
  FMesBaseSaldo := Value;
  qryRelatorioSituacaoRecebimentos.ParamByName('MesBaseSaldo').AsString:=FmesBaseSaldo;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetRenegociacao(
  const Value: Integer);
begin
  FRenegociacao := Value;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetTipodeContrato(
  const Value: Integer);
begin
  FTipodeContrato := Value;
  case FTipodeContrato of
  0 : case FRenegociacao of
         0 : begin
             qryRelatorioSituacaoRecebimentos.Sql[WhereTipodeContrato] :=
              ' and (ct.numero not in '+
              '(select c.origem from contratos c where c.origem=ct.numero'+
              ' and to_char(c.faturamento,''YYYY/MM'') <= '+quotedstr(FMesBase)+'))';
              FParametroCabecalho:=FParametroCabecalho+' Tipo: Atual incluindo Renegociados';
             end;
         1 : begin
              qryRelatorioSituacaoRecebimentos.Sql[WhereTipodeContrato] :=
              ' and (ct.tiporenegociacao=''A'' or ct.tiporenegociacao is null)'+
              ' and (ct.numero not in '+
              '(select c.origem from contratos c where ct.numero=c.origem '+
              'and to_char(c.faturamento,''YYYY/MM'') <= '+quotedstr(FMesBase)+'))';
              FParametroCabecalho:=FParametroCabecalho+' Tipo: Atual excluindo Renegociados';
             end;
         2 : begin
              qryRelatorioSituacaoRecebimentos.Sql[WhereTipodeContrato] :=
              ' and (ct.tiporenegociacao in (''R'',''S'',''B''))'+
              ' and (ct.numero not in '+
              '(select c.origem from contratos c where ct.numero=c.origem '+
              'and to_char(c.faturamento,''YYYY/MM'') <= '+quotedstr(FMesBase)+'))';
              FParametroCabecalho:=FParametroCabecalho+' Tipo: Atual somente Renegociados';
             end;
      end;
  1 : case FRenegociacao of
         0 : begin
             qryRelatorioSituacaoRecebimentos.Sql[WhereTipodeContrato] :=
             ' and (ct.origem is null)';
             FParametroCabecalho:=FParametroCabecalho+' Tipo: Original incluindo Renegociados';
             end;
         1 : begin
             qryRelatorioSituacaoRecebimentos.Sql[WhereTipodeContrato] :=
             ' and ((ct.origem is null) and (ct.numero not in '+
             '(select c.origem from contratos c where ct.numero=c.origem '+
               'and c.tiporenegociacao in  (''R'',''S'',''B'') '+
               'and to_char(c.faturamento,''YYYY/MM'') <= '+quotedstr(FMesBase)+')))';
             FParametroCabecalho:=FParametroCabecalho+' Tipo: Original excluindo Renegociados';
             end;
         2 : begin
             qryRelatorioSituacaoRecebimentos.Sql[WhereTipodeContrato] :=
             ' and ((ct.origem is null) and (ct.numero in '+
             '(select c.origem from contratos c where ct.numero=c.origem '+
               'and c.tiporenegociacao in  (''R'',''S'',''B'') '+
               'and to_char(c.faturamento,''YYYY/MM'') <= '+quotedstr(FMesBase)+')))';
             FParametroCabecalho:=FParametroCabecalho+' Tipo: Original somente Renegociados';
             end;
      end;
  end;
{  qryRelatorioSituacaoRecebimentos.Sql[WhereContratoNaoEstornado]:=
    ' and (coalesce((select count(*) from parcelas p where '+
                   '(p.contrato = ct.numero and ((p.tipopagto in (''E'',''J'') and to_char(p.datapagto,''YYYY/MM'')<='+quotedstr(FMesBase)+')'+
                'or (p.tipopagto in (''D'',''C'',''P'',''X'') and to_char(p.deventrada,''YYYY/MM'')<='+quotedstr(FMesBase)+'))) ),0)'+
    '<> (select count(*) from parcelas p where p.contrato=ct.numero))'
}    
end;

procedure TdtmRelatorioSituacaoRecebimentos.frpRelatorioSituacaoRecebimentosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
end;

procedure TdtmRelatorioSituacaoRecebimentos.SetMesBaseDepois(
  const Value: String);
begin
  FMesBaseDepois := Value;
  qryRelatorioSituacaoRecebimentos.ParamByName('MesBaseDepois').AsString:=FMesBaseDepois;
end;

end.


