unit dmrelatorioreimpressaorequisicoes;

interface

uses
  SysUtils, Classes, FR_Class, FR_DSet, FR_DBSet, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, clparametrossistema,
  ctconstantes, dmbasico, fmpreviewpadrao, FR_Desgn, biblio, ZTransact;

type
  TdtmRelatorioReimpressaoRequisicoes = class(TDtmBasico)
    qryCliente: TtecQuery;
    qryClientecodigo: TIntegerField;
    qryClientenome: TStringField;
    qryClientetipo: TStringField;
    dsrCliente: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientestipo: TStringField;
    qryConsultaClientestipoorig: TStringField;
    qryMontador: TtecQuery;
    qryMontadorcodigo: TIntegerField;
    qryMontadornome: TStringField;
    qryMontadortipo: TStringField;
    dsrMontador: TtecDataSource;
    qryConsultaMontador: TtecQuery;
    qryConsultaMontadornome: TStringField;
    qryConsultaMontadorcodigo: TIntegerField;
    qryConsultaMontadortipo: TStringField;
    qryConsultaMontadortipoorig: TStringField;
    qryRequisicoes: TtecQuery;
    frpRequisicao: TfrReport;
    fdsRequisicoes: TfrDBDataSet;
    qryRequisicoesnumero: TIntegerField;
    qryRequisicoesabertura: TDateField;
    qryRequisicoesdatahora: TDateTimeField;
    qryRequisicoesdadofiscal: TIntegerField;
    qryRequisicoesfilialmontagem: TIntegerField;
    qryRequisicoesnomefilialmontagem: TStringField;
    qryRequisicoesmontador: TIntegerField;
    qryRequisicoestipomontador: TStringField;
    qryRequisicoesnomemontador: TStringField;
    qryRequisicoesvendedor: TIntegerField;
    qryRequisicoesnomevendedor: TStringField;
    qryRequisicoescliente: TIntegerField;
    qryRequisicoestipocliente: TStringField;
    qryRequisicoesnomecliente: TStringField;
    qryRequisicoesruaresidencia: TStringField;
    qryRequisicoescidaderesidencia: TIntegerField;
    qryRequisicoesnomecidaderesidencia: TStringField;
    qryRequisicoesestadoresidencia: TStringField;
    qryRequisicoesbairroresidencia: TIntegerField;
    qryRequisicoesnomebairroresidencia: TStringField;
    qryRequisicoescepresidencia: TIntegerField;
    qryRequisicoesfonedddresidencia: TIntegerField;
    qryRequisicoesfonenumeroresidencia: TIntegerField;
    qryRequisicoesfoneramalresidencia: TStringField;
    qryRequisicoesfonedddempresa: TIntegerField;
    qryRequisicoesfonenumeroempresa: TIntegerField;
    qryRequisicoesfoneramalempresa: TStringField;
    qryRequisicoesempresa: TStringField;
    qryRequisicoescidade: TIntegerField;
    qryRequisicoesnomecidade: TStringField;
    qryRequisicoesbairro: TIntegerField;
    qryRequisicoesnomebairro: TStringField;
    qryRequisicoesestado: TStringField;
    qryRequisicoescep: TIntegerField;
    qryRequisicoesobservacoes: TStringField;
    qryRequisicoesfoneddd: TIntegerField;
    qryRequisicoesfonenumero: TIntegerField;
    qryRequisicoesfoneramal: TStringField;
    qryRequisicoesfilialemissao: TIntegerField;
    qryRequisicoesnomefilialemissao: TStringField;
    qryRequisicoesfilialvenda: TIntegerField;
    qryRequisicoesnomefilialvenda: TStringField;
    qryRequisicoescontrato: TStringField;
    qryRequisicoesserie: TStringField;
    qryRequisicoesnotafiscal: TIntegerField;
    qryRequisicoesmaquina: TIntegerField;
    qryRequisicoesintervensao: TIntegerField;
    qryRequisicoescupomfiscal: TIntegerField;
    qryRequisicoesproduto: TLargeintField;
    qryRequisicoesdescricaoproduto: TStringField;
    qryRequisicoesfilial: TIntegerField;
    qryRequisicoesquantidade: TFloatField;
    qryRequisicoesmontagem: TIntegerField;
    qryRequisicoesdescricaomontagem: TStringField;
    qryRequisicoestipodemontagem: TStringField;
    qryRequisicoesdatamontagem: TDateField;
    qryRequisicoesvalorpagto: TFloatField;
    qryRequisicoesdatapagto: TDateField;
    qryRequisicoesobservacoesitens: TStringField;
    qryRequisicoesnumerodeitens: TLargeintField;
    qryRequisicoesrua: TStringField;
    qryRequisicoesobsdadofiscal: TStringField;
    procedure frpRequisicaoBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpRequisicaoGetValue(const ParName: String;
      var ParValue: Variant);
  private
    FSituacaoRequisicaoItemMontagem: Boolean;
    FResumo: Integer;
    FSituacaodaMontagem: Integer;
    FMontador: String;
    FCliente: String;
    FDataInicial: string;
    FDataFinal: string;
    FRequisicaoInicial: string;
    FRequisicaoFinal: string;
    FHoraInicial: string;
    FHoraFinal: string;
    function GetConsultaClientes: TZDataSet;
    function GetConsultaMontadores: TZDataSet;
    procedure SetCliente(const Value: String);
    procedure SetDataFinal(const Value: string);
    procedure SetMontador(const Value: String);
    procedure SetSituacaodaMontagem(const Value: Integer);
    procedure SetSituacaoRequisicaoItemMontagem(const Value: Boolean);
    procedure SetRequisicaoFinal(const Value: string);
    procedure SetRequisicaoInicial(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TipoProcuraRequisicoes);
    procedure FechaTabelaPesquisa(TipoPesquisa: TipoProcuraRequisicoes);
    procedure Selecionar(TipoPesquisa: TipoProcuraRequisicoes);
    procedure AbreConsultaCliente;
    property ConsultaClientes: TZDataSet read GetConsultaClientes;
    property ConsultaMontadores: TZDataSet read GetConsultaMontadores;
    function ExisteCliente(NomeCampo: String; Value: Variant): Boolean;
    function ExisteMontador(NomeCampo: String; Value: Variant): Boolean;
    property HoraInicial: string read FHoraInicial write FHoraInicial;
    property DataInicial: string read FDataInicial write FDataInicial;
    property HoraFinal: string read FHoraFinal write FHoraFinal;
    property DataFinal: string read FDataFinal write SetDataFinal;
    property RequisicaoInicial: string read FRequisicaoInicial write SetRequisicaoInicial;
    property RequisicaoFinal: string read FRequisicaoFinal write SetRequisicaoFinal;
    property Montador: String read FMontador write SetMontador;
    property Cliente: String read FCliente write SetCliente;
    property SituacaodaMontagem: Integer read FSituacaodaMontagem write SetSituacaodaMontagem;
    property SituacaoRequisicaoItemMontagem: Boolean read FSituacaoRequisicaoItemMontagem write SetSituacaoRequisicaoItemMontagem;
    property Resumo: Integer read FResumo write FResumo;
    procedure ImprimirRelatorio(tipo: String);
  end;

var
  dtmRelatorioReimpressaoRequisicoes: TdtmRelatorioReimpressaoRequisicoes;

implementation

{$R *.dfm}
Const
 WhereCliente  = 89;
 WhereMontador = 90;
 WhereSitucaoMontagemRequisicao = 91;
 WhereSitucaoMontagemItensRequisicao = 92;
 WhereNumeroRequisicoes = 93;

{ TdtmRelatorioReimpressaoRequisicoes }

procedure TdtmRelatorioReimpressaoRequisicoes.AbreConsultaCliente;
begin
 ExisteCliente('nome', '0')
end;

procedure TdtmRelatorioReimpressaoRequisicoes.AbreTabelaPesquisa(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
  case TipoPesquisa of
   tpRequisicoesClientes   : AbreConsultaCliente;
   tpRequisicoesMontadores : Abre(ctConsultaMontadoresMontagem);

  end

end;

constructor TdtmRelatorioReimpressaoRequisicoes.Create(AOwner: TComponent);
begin
  inherited;
  qryCliente.Tag               := ctTabelas;
  qryMontador.tag              := ctTabelas;
  qryConsultaClientes.tag      := ctConsultaClientesMontagem;
  qryConsultaMontador.Tag      := ctConsultaMontadoresMontagem;
  qryMontador.Params[1].AsString := 'U';
  qryCliente.Params[1].AsString  := 'C';
  qryRequisicoesquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;  
end;

function TdtmRelatorioReimpressaoRequisicoes.ExisteCliente(
  NomeCampo: String; Value: Variant): Boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';

begin

  qryConsultaClientes.Sql[9] := Format(SQL, [NomeCampo, ANSIUpperCase(Value), '%']);

  qryConsultaClientes.Open;

  Result := qryConsultaClientes.RecordCount > 0

end;

function TdtmRelatorioReimpressaoRequisicoes.ExisteMontador(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaMontador, Nomecampo, Value);
end;

procedure TdtmRelatorioReimpressaoRequisicoes.FechaTabelaPesquisa(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
  case TipoPesquisa of
   tpRequisicoesClientes  : Fecha(ctConsultaClientesMontagem);
   tpRequisicoesMontadores: Fecha(ctConsultaMontadoresMontagem);

  end

end;

function TdtmRelatorioReimpressaoRequisicoes.GetConsultaClientes: TZDataSet;
begin
  result := qryConsultaClientes;
end;

function TdtmRelatorioReimpressaoRequisicoes.GetConsultaMontadores: TZDataSet;
begin
 result := qryConsultaMontador;
end;

procedure TdtmRelatorioReimpressaoRequisicoes.ImprimirRelatorio(
  tipo: String);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= RazaoFilialBase;
  frVariables['titulo']:='REQUISICAO DE MONTAGEM';
  frmPreview := TfrmPreviewPadrao.create(self);
//  frpRequisicao.DesignReport;
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   frmPreview.frCompositeReport.Reports.Add(frpRequisicao);
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;

  finally

   frmPreview.Free

  end;

end;

procedure TdtmRelatorioReimpressaoRequisicoes.Selecionar(
  TipoPesquisa: TipoProcuraRequisicoes);
begin
case TipoPesquisa of
 tpRequisicoesClientes               :
 begin

  RefazConsulta(qryCliente,[0,1],[qryConsultaClientescodigo.AsVariant,

                                  qryConsultaClientestipo.AsVariant]);

  qryCliente.Params[1].AsString:=qryConsultaClientestipo.AsString;

 end;

 tpRequisicoesMontadores :
 begin

  RefazConsulta(qryMontador,[0,1], [qryConsultaMontadorcodigo.AsVariant,

                                    qryConsultaMontadortipo.AsVariant]);

  qryMontador.Params[1].AsString:=qryConsultaMontadortipo.AsString;

 end;

end;

end;

procedure TdtmRelatorioReimpressaoRequisicoes.SetCliente(
  const Value: String);
begin
  FCliente := Value;
  if Value <> '' then
    qryRequisicoes.Sql[WhereCliente]:=
    ' and (r.cliente = ' + Value +
    ') and (r.tipocliente = ' + quotedstr(qryClientetipo.AsString) + ')'
  else
    qryRequisicoes.Sql[WhereCliente]:='';

end;

procedure TdtmRelatorioReimpressaoRequisicoes.SetDataFinal(
  const Value: string);
begin
  FDataFinal := Value;

  if value='' then
    FDataFinal:=FDataInicial;

  if FDataInicial='' then
    FDataInicial:=FDataFinal;

  qryRequisicoes.parambyname('DataInicial').asstring:=FDataInicial+' '+FHoraInicial;
  qryRequisicoes.parambyname('DataFinal').asstring:=FDataFinal+' '+FHoraFinal;
end;


procedure TdtmRelatorioReimpressaoRequisicoes.SetMontador(
  const Value: String);
begin
  FMontador := Value;
  if Value <> '' then
    qryRequisicoes.Sql[WhereMontador]:=
    ' and (r.montador = ' + Value +
    ') and (r.tipomontador = ' + quotedstr(qryMontadortipo.AsString) + ')'
  else
    qryRequisicoes.Sql[WhereMontador]:='';
end;

procedure TdtmRelatorioReimpressaoRequisicoes.SetRequisicaoFinal(
  const Value: string);
begin
  FRequisicaoFinal := Value;
  if value='' then
    FRequisicaoFinal:=FRequisicaoInicial;

  if FRequisicaoInicial='' then
    FRequisicaoInicial:=FRequisicaoFinal;

  if FRequisicaoFinal<>'' then
   qryRequisicoes.Sql[WhereNumeroRequisicoes]:=
     ' and r.numero >= '+FRequisicaoInicial+' and r.numero <= '+FRequisicaoFinal
  else
   qryRequisicoes.Sql[WhereNumeroRequisicoes]:='';
end;

procedure TdtmRelatorioReimpressaoRequisicoes.SetRequisicaoInicial(
  const Value: string);
begin
  FRequisicaoInicial := Value;
end;

procedure TdtmRelatorioReimpressaoRequisicoes.SetSituacaodaMontagem(
  const Value: Integer);
begin
  FSituacaodaMontagem := Value;
    case Value of
  0: qryRequisicoes.Sql[WhereSitucaoMontagemRequisicao]:=
     'and ((select count(*) from requisicoesitens ri '+
     'Where ri.requisicao=r.numero and ri.datamontagem is not null)=0)';
  1: qryRequisicoes.Sql[WhereSitucaoMontagemRequisicao]:=
     'and (select count(*) from requisicoesitens ri '+
     'Where ri.requisicao=r.numero) not in '+
     '((select count(*) from requisicoesitens ri where ri.requisicao=r.numero and ri.datamontagem is not null),'+
     ' (select count(*) from requisicoesitens ri where ri.requisicao=r.numero and ri.datamontagem is null))';
  2: qryRequisicoes.Sql[WhereSitucaoMontagemRequisicao]:=
     'and ((select count(*) from requisicoesitens ri '+
     'Where ri.requisicao=r.numero and ri.datamontagem is null)=0)';
  3: qryRequisicoes.Sql[WhereSitucaoMontagemRequisicao]:='';
  end;
end;

procedure TdtmRelatorioReimpressaoRequisicoes.SetSituacaoRequisicaoItemMontagem(
  const Value: Boolean);
begin
  FSituacaoRequisicaoItemMontagem := Value;
  if value then
   qryRequisicoes.Sql[WhereSitucaoMontagemItensRequisicao] :=
   ' and ri.datamontagem is not null'
  else
   qryRequisicoes.Sql[WhereSitucaoMontagemItensRequisicao] :='';
end;

procedure TdtmRelatorioReimpressaoRequisicoes.frpRequisicaoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if View.Name = 'logotipo' then
   if FileExists(LogotipoFilialBase) then
     try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;

end;

procedure TdtmRelatorioReimpressaoRequisicoes.frpRequisicaoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  IF ParName = 'QUANTIDADEPRODUTO' then
   parValue := FormatarQuantidade(qryRequisicoesquantidade.AsCurrency)
end;

end.
