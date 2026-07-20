unit dmdiarioauxiliarparcelas;

interface

uses
  SysUtils, Classes, DB, CheckLst,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Repositorio
  dmbasico, dmtecsoft, fmpreviewpadrao, ctconstantes, dmimprimetermos,
  //Componentes
  cpquery, cpdatasource,
  //Biblio
  biblio, FR_DSet, FR_DBSet, FR_Class, FR_Desgn;


type
  Tdtmdiarioauxiliarparcelas = class(TdtmBasico)
    qryDiarioAuxiliarParcelas: TtecQuery;
    dsrDiarioAuxialiarParcelas: TtecDataSource;
    qryDiarioAuxiliarParcelascliente: TIntegerField;
    qryDiarioAuxiliarParcelasnome: TStringField;
    qryDiarioAuxiliarParcelascontrato: TStringField;
    qryDiarioAuxiliarParcelasdata: TDateField;
    qryDiarioAuxiliarParcelasparcela_inicial: TIntegerField;
    qryDiarioAuxiliarParcelasparcela_final: TIntegerField;
    qryDiarioAuxiliarParcelasvencto_inicial: TDateField;
    qryDiarioAuxiliarParcelasvalordebito: TFloatField;
    fdsDiarioAuxilarParcelas: TfrDBDataSet;
    frpDiarioAuxiliarParcelas: TfrReport;
    qryDiarioAuxiliarParcelasfilialvenda: TIntegerField;
    qryDiarioAuxiliarParcelasnomefilialvenda: TStringField;
    qryDiarioAuxiliarParcelasgrupofilialvenda: TIntegerField;
    qryDiarioAuxiliarParcelasnomegrupofilialvenda: TStringField;
    frpDiarioAuxiliarParcelasResumo: TfrReport;
    qryDiarioAuxiliarParcelastipocliente: TStringField;
    qryProcuraFiliais: TtecQuery;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryProcuraFiliaisrazao: TStringField;
    qryProcuraFiliaiscnpj: TStringField;
    qryProcuraFiliaisinscricaoestadual: TStringField;
    qryProcuraFiliaisrua: TStringField;
    qryProcuraFiliaisestado: TStringField;
    qryProcuraFiliaisnomecidade: TStringField;
    qryProcuraFiliaisnomebairro: TStringField;
    qryProcuraFiliaiscep: TIntegerField;
    qryProcuraFiliaisjunta: TStringField;
    qryProcuraFiliaisjuntadata: TDateField;
    dsrProcuraFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryProcuraGruposFiliais: TtecQuery;
    qryProcuraGruposFiliaiscodigo: TIntegerField;
    qryProcuraGruposFiliaisdescricao: TStringField;
    dsrProcuraGruposFiliais: TtecDataSource;
    qryConsultaGruposFiliais: TtecQuery;
    qryConsultaGruposFiliaisdescricao: TStringField;
    qryConsultaGruposFiliaiscodigo: TIntegerField;
    qryDiarioAuxiliarParcelasResumo: TtecQuery;
    dsrDiarioAuxialiarParcelasResumo: TtecDataSource;
    qryDiarioAuxiliarParcelasResumofilialvenda: TIntegerField;
    qryDiarioAuxiliarParcelasResumonomefilialvenda: TStringField;
    qryDiarioAuxiliarParcelasResumogrupofilialvenda: TIntegerField;
    qryDiarioAuxiliarParcelasResumonomegrupofilialvenda: TStringField;
    qryDiarioAuxiliarParcelasResumovalordebito: TFloatField;
    fdsDiarioAuxilarParcelasREsumo: TfrDBDataSet;
    procedure frpDiarioAuxiliarParcelasBeforePrint(Memo: TStringList;
      View: TfrView);
  Protected
    ImpressaoTermos: TdtmImprimeTermos;
  private
    FAgruparFilial: boolean;
    FAgruparGrupoFilial: boolean;
    FParametroCabecalho: String;
    FResumo: Integer;
    FParametrosCabecalho: String;
    FDataSituacao: String;
    FParametroPagina: Integer;
    FParametroMaximo: Integer;
    FParametroRelatorio: Integer;
    FParametroLivro: Integer;
    procedure SetParametroFilial(const Value: string);
    procedure SetParametroGrupoFiliais(const Value: string);
    procedure SetDataSituacao(const Value: String);
    function GetCodigoFilial: Integer;
    function GetCodigoGrupoFilial: Integer;
    function GetConsultarFilial: TtecQuery;
    function GetConsultarGrupoFilial: TtecQuery;
    procedure SetAgruparGrupoFilial(const Value: boolean);
    procedure SetAgruparFilial(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TTecPesquisa);
    procedure FechaTabelaPesquisa(TipoPesquisa: TTecPesquisa);
    procedure Selecionar(Pesquisa: TtecPesquisa);
    procedure ImprimirRelatorio;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property AgruparGrupoFilial: boolean read FAgruparGrupoFilial write SetAgruparGrupoFilial;
    property AgruparFilial: boolean read FAgruparFilial write SetAgruparFilial;
    property Resumo: Integer read FResumo write FResumo;
    property ParametroFilial: string write SetParametroFilial;
    property ParametroGrupoFiliais: string write SetParametroGrupoFiliais;
    property ParametrosCabecalho: String read FParametrosCabecalho write FParametrosCabecalho;
    property DataSituacao: String read FDataSituacao write SetDataSituacao;
    procedure MontarOrdenacao;
    function ExisteFilial(Campo, Codigo: string): Boolean;
    function ExisteGrupoFilial(Campo, Codigo: string): Boolean;
    property ConsultarFilial: TtecQuery read GetConsultarFilial;
    property ConsultarGrupoFilial: TtecQuery read GetConsultarGrupoFilial;
    property CodigoFilial: Integer read GetCodigoFilial;
    property CodigoGrupoFilial: Integer read GetCodigoGrupoFilial;
    property ParametroLivro: Integer read FParametroLivro write FParametroLivro;
    property ParametroPagina: Integer read FParametroPagina write FParametroPagina;
    property ParametroMaximo: Integer read FParametroMaximo write FParametroMaximo;
    property ParametroRelatorio: Integer read FParametroRelatorio write FParametroRelatorio;
    function AbrirTabelaRelatorio: Boolean;
  end;

var
  dtmdiarioauxiliarparcelas: Tdtmdiarioauxiliarparcelas;

Const
  P_WhereFiliais            = 33;
  P_WhereOrdenacao          = 35;

  P_WhereFiliaisResumo      = 25;


  FiltroFilial      = 'AND ( ct.filialvenda IN (%s)) ';
  FiltroGrupoFilial = 'AND ( ct.filialvenda IN (SELECT filial '+
                                         'FROM filiaisgruposfiliais fgf '+
                                         'WHERE fgf.grupo IN (%s)))';


implementation

{$R *.dfm}

{ Tdtmdiarioauxiliarparcelas }

procedure Tdtmdiarioauxiliarparcelas.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  if FParametroLivro=0 then
   AtribuirParametrosBaseRelatorio
  else
   AtribuirParametrosBaseRelatorio(qryprocurafiliaiscodigo.asstring);
   
  frVariables['Titulo']:='DIARIO AUXILIAR DAS PARCELAS EM ABERTO';
  frVariables['SubTitulo']:= '';
{
  frVariables['Livro'] := Livro;
  frVariables['Pagina']:= Pagina;
  frVariables['Maximo']:= Maximo;
  }
  frVariables['Outras']:=FParametroCabecalho;
  frVariables['AgruparGrupoFilial']:=FAgruparGrupoFilial;
  frVariables['AgruparFilial']:=FAgruparFilial;
  frmPreview := TfrmPreviewPadrao.create(self);
  frpDiarioAuxiliarParcelas.Pages[0].PrintToPrevPage := False;
  frpDiarioAuxiliarParcelasResumo.Pages[0].PrintToPrevPage := False;

//  frpDiarioAuxiliarParcelasResumo.DesignReport;
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    case FParametroRelatorio of
    0: case FResumo of
         0 : begin
             frCompositeReport.Reports.Add(frpDiarioAuxiliarParcelas);
             frCompositeReport.Reports.Add(frpDiarioAuxiliarParcelasResumo);
            end;
         1 : frCompositeReport.Reports.Add(frpDiarioAuxiliarParcelas);
         2 : frCompositeReport.Reports.Add(frpDiarioAuxiliarParcelasResumo);
       end;
    1: begin
        if not Assigned(ImpressaoTermos) then
          ImpressaoTermos := TdtmImprimeTermos.Create(Self);
        frCompositeReport.Reports.Add(ImpressaoTermos.frpTermos_P);
       end;
    end;
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free;
   AtribuirParametrosBaseRelatorio
  end;
end;

procedure Tdtmdiarioauxiliarparcelas.frpDiarioAuxiliarParcelasBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
end;

procedure Tdtmdiarioauxiliarparcelas.SetParametroFilial(const Value: string);
begin
  if (Value <> '') then
  begin
    qryDiarioAuxiliarParcelas.Sql[P_WhereFiliais]  := format(FiltroFilial, [Value]);
    qryDiarioAuxiliarParcelasResumo.Sql[P_WhereFiliaisResumo]  := format(FiltroFilial, [Value]);
    FParametroCabecalho:=FParametroCabecalho+' Filial: '+Value;
  end
  else
  begin
    qryDiarioAuxiliarParcelas.Sql[P_WhereFiliais]  := '';
    qryDiarioAuxiliarParcelasResumo.Sql[P_WhereFiliaisResumo]  := '';
  end;
end;

procedure Tdtmdiarioauxiliarparcelas.SetParametroGrupoFiliais(const Value: string);
begin
  if (Value <> '') then
  begin
    qryDiarioAuxiliarParcelas.Sql[P_WhereFiliais] := format(FiltroGrupoFilial, [Value]);
    qryDiarioAuxiliarParcelasResumo.Sql[P_WhereFiliaisResumo] := format(FiltroGrupoFilial, [Value]);
    FParametroCabecalho:=FParametroCabecalho+' Grupo de Filial: '+Value;
  end;
end;

procedure Tdtmdiarioauxiliarparcelas.SetDataSituacao(const Value: String);
begin
  FDataSituacao := Value;
  qryDiarioAuxiliarParcelas.Params[0].AsString := Value;
  qryDiarioAuxiliarParcelasResumo.Params[2].AsString := Value;
  FParametroCabecalho:= 'Situacao em: '+Value;
end;

procedure Tdtmdiarioauxiliarparcelas.MontarOrdenacao;
var
Ordenacao: String;
begin
  Ordenacao:='';
  if FAgruparGrupoFilial then
    Ordenacao:=Ordenacao+', nomegrupofilialvenda, grupofilialvenda ';
  if FAgruparFilial then
    Ordenacao:=Ordenacao+', nomefilialvenda, filialvenda ';
  Ordenacao:=Ordenacao+', ct.nome, ct.cliente, ct.tipocliente ';
  if Ordenacao<>'' then
    qryDiarioAuxiliarParcelas.sql[P_WhereOrdenacao]:= ('Order by '+copy(Ordenacao,2,length(Ordenacao)-1));
end;

function Tdtmdiarioauxiliarparcelas.ExisteFilial(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function Tdtmdiarioauxiliarparcelas.ExisteGrupoFilial(Campo,
  Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaGruposFiliais, Campo, Codigo);
end;

function Tdtmdiarioauxiliarparcelas.GetCodigoFilial: Integer;
begin
  Result := qryConsultaFiliaiscodigo.AsInteger;
end;

function Tdtmdiarioauxiliarparcelas.GetCodigoGrupoFilial: Integer;
begin
  Result := qryConsultaGruposFiliaiscodigo.AsInteger;
end;

function Tdtmdiarioauxiliarparcelas.GetConsultarFilial: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function Tdtmdiarioauxiliarparcelas.GetConsultarGrupoFilial: TtecQuery;
begin
  Result:= qryConsultaGruposFiliais;
end;

procedure Tdtmdiarioauxiliarparcelas.AbreTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Abre(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Abre(ctPesquisaGrupoFilial);
  end;
end;

procedure Tdtmdiarioauxiliarparcelas.FechaTabelaPesquisa(
  TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesFILIAIS      : Fecha(ctPesquisaFilial);
    pesGRUPOSFILIAIS: Fecha(ctPesquisaGrupoFilial);
  end;
end;

procedure Tdtmdiarioauxiliarparcelas.Selecionar(Pesquisa: TtecPesquisa);
begin
  case Pesquisa of
    pesFILIAIS      : RefazConsulta(qryProcuraFiliais,[0],[CodigoFilial]);
    pesGRUPOSFILIAIS: RefazConsulta(qryProcuraGruposFiliais,[0],[CodigoGrupoFilial]);
  end;
end;

function Tdtmdiarioauxiliarparcelas.AbrirTabelaRelatorio: Boolean;
begin
  qryDiarioAuxiliarParcelas.close;
  qryDiarioAuxiliarParcelasResumo.close;
  case Resumo of
  0:begin
     qryDiarioAuxiliarParcelas.Open;
     qryDiarioAuxiliarParcelasResumo.Open;
    end;
  1: qryDiarioAuxiliarParcelas.Open;
  2: qryDiarioAuxiliarParcelasResumo.Open;
  end;
  result := not qryDiarioAuxiliarParcelas.IsEmpty or
            not qryDiarioAuxiliarParcelasResumo.IsEmpty;

end;

procedure Tdtmdiarioauxiliarparcelas.SetAgruparGrupoFilial(
  const Value: boolean);
begin
  FAgruparGrupoFilial := Value;
  qryDiarioAuxiliarParcelasResumo.Params[0].Asboolean := Value;
end;

procedure Tdtmdiarioauxiliarparcelas.SetAgruparFilial(
  const Value: boolean);
begin
  FAgruparFilial := Value;
  qryDiarioAuxiliarParcelasResumo.Params[1].Asboolean := Value;
end;

constructor Tdtmdiarioauxiliarparcelas.Create(AOwner: TComponent);
begin
  inherited;
  qryConsultaFiliais.Tag:= ctPesquisaFilial;
  qryConsultaGruposFiliais.Tag:= ctPesquisaGrupoFilial;
  qryProcuraFiliais.Tag:= ctTabelas;
  qryProcuraGruposFiliais.Tag:= ctTabelas;
end;

end.
