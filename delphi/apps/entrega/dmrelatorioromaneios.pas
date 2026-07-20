unit dmrelatorioromaneios;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ctconstantes, FR_DSet, FR_DBSet, FR_Class, biblio,
  clparametrossistema, fmpreviewpadrao, ZTransact;

type
  Tdtmrelatorioromaneios = class(TdtmBasico)
    qryFornecedores: TtecQuery;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedoresrazao: TStringField;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaFornecedoresrazao: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryRomaneios: TtecQuery;
    qryRomaneiosnumero: TIntegerField;
    qryRomaneiostipo: TStringField;
    qryRomaneiosfornecedor: TIntegerField;
    qryRomaneiosnomefornecedor: TStringField;
    qryRomaneiosemissao: TDateField;
    qryRomaneiostotalromaneio: TFloatField;
    qryRomaneiosdatapagto: TDateField;
    qryRomaneiosvalorpagto: TFloatField;
    frpRomaneios: TfrReport;
    fdsRomaneios: TfrDBDataSet;
    qryRomaneiosvalorentregue: TFloatField;
    qryRomaneiosvaloraentregar: TFloatField;
    qryRomaneiosvalorvencimento: TFloatField;
    procedure frpRomaneiosBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryRomaneiosCalcFields(DataSet: TDataSet);

  private
    FEmissaoFinal: String;
    FEmissaoInicial: String;
    FParametroCabecalho: String;
    FTipoNormal: Boolean;
    FTipoTransferencia: Boolean;
    function GetConsultaFornecedores: TtecQuery;
    procedure SetEmissaoFinal(const Value: String);
    procedure SetEmissaoInicial(const Value: String);
    procedure SetFornecedor(const Value: String);
    procedure MontaDataEmissao;
    procedure SetTipoNormal(const Value: Boolean);
    procedure SetTipoTransferencia(const Value: Boolean);

    { Private declarations }
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecRelatorioRomaneios);
    procedure Selecionar(TipoPesquisa: TtecRelatorioRomaneios);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecRElatorioRomaneios);
    property ConsultaFornecedores: TtecQuery read GetConsultaFornecedores;
    function ExisteFornecedor(campo, codigo: string): boolean;
    procedure ImprimirRelatorio(tipo: TTecTipoRelatorioRomaneio);
    property EmissaoInicial: String read FEmissaoInicial write SetEmissaoInicial;
    property EmissaoFinal: String read FEmissaoFinal write SetEmissaoFinal;
    property Fornecedor: String write SetFornecedor;
    procedure porSituacao(Situacao: integer);
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property TipoNormal: Boolean read FTipoNormal write SetTipoNormal;
    property TipoTransferencia: Boolean read FTipoTransferencia write SetTipoTransferencia;
  end;

var
  dtmrelatorioromaneios: Tdtmrelatorioromaneios;


implementation

{$R *.dfm}

{ Tdtmrelatorioromaneios }

const
   WhereBase           = 13;
   WhereEmissao        = WhereBase+1;
   WhereFornecedor     = WhereBase+2;
   WhereTipo           = WhereBase+3;
   WhereSituacao       = WhereBase+4;

procedure Tdtmrelatorioromaneios.AbreTabelaPesquisa(
  TipoPesquisa: TtecRelatorioRomaneios);
begin
  case TipoPesquisa of
    rrFORNECEDOR : abre(ctConsultaRelatorioRomaneios);
  end;
end;

constructor Tdtmrelatorioromaneios.Create(AOwner: TComponent);
begin
  inherited;
  qryFornecedores.Tag         := ctTabelas;
  qryConsultaFornecedores.Tag := ctConsultaRelatorioRomaneios;
end;

function Tdtmrelatorioromaneios.ExisteFornecedor(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultaFornecedores, campo, codigo)
end;

procedure Tdtmrelatorioromaneios.FechaTabelaPesquisa(
  TipoPesquisa: TtecRElatorioRomaneios);
begin
  case TipoPesquisa of
      rrFORNECEDOR : Fecha(ctConsultaRelatorioRomaneios);
  end;
end;

function Tdtmrelatorioromaneios.GetConsultaFornecedores: TtecQuery;
begin
  result := qryConsultaFornecedores
end;

procedure Tdtmrelatorioromaneios.ImprimirRelatorio(
  tipo: TTecTipoRelatorioRomaneio);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frVariables['Outras']:= FParametroCabecalho;
  case Tipo of
    rmEMABERTO            : frVariables['Titulo']:= 'ROMANEIOS EM ABERTO';
    rmQUITADOS            : frVariables['Titulo']:= 'ROMANEIOS QUITADOS';
    rmTODOS               : frVariables['Titulo']:= 'RELACAO DE ROMANEIOS';
  end;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
//   frpRomaneios.DesignReport;
   frmPreview.frCompositeReport.Reports.Add(frpRomaneios);
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
end;

procedure Tdtmrelatorioromaneios.MontaDataEmissao;
const
  Data_1: String = 'where (r.emissao = ';
  Data_2: String = 'where (r.emissao between (';
begin
  if not DataEmBranco(FEmissaoInicial) then begin
    if DataEmBranco(FEmissaoFinal) then
    begin
      qryRomaneios.macrobyname('SQLEmissao').asstring:= Data_1 + quotedstr(FEmissaoInicial);
      FParametroCabecalho:=FParametroCabecalho+' Entre '+FEmissaoInicial+' e '+FEmissaoInicial;
    end
    else
    begin
      qryRomaneios.macrobyname('SQLEmissao').asstring:= Data_2 + quotedstr(FEmissaoInicial) +') and ('+quotedstr(FEmissaoFinal)+'))';
      FParametroCabecalho:=FParametroCabecalho+' Entre '+FEmissaoInicial+' e '+FEmissaoFinal;
    end;
  end
  else
  begin
    if not DataEmBranco(FEmissaoFinal) then
    begin
      qryRomaneios.macrobyname('SQLEmissao').asstring:= Data_1 + quotedstr(FEmissaoFinal) +')';
      FParametroCabecalho:=FParametroCabecalho+' Entre '+FEmissaoFinal+' e '+FEmissaoFinal;
    end
    else qryRomaneios.macrobyname('SQLFornecedor').asstring:= '';
  end;
end;

procedure Tdtmrelatorioromaneios.porsituacao(Situacao: integer);
begin
case Situacao of
  0 : qryRomaneios.macrobyname('SQLSituacao').asstring  :=' and r.datapagto is null';
  1 : qryRomaneios.macrobyname('SQLSituacao').asstring  :=' and r.datapagto is not null ';
  2 : qryRomaneios.macrobyname('SQLSituacao').asstring  :='';
end;
end;

procedure Tdtmrelatorioromaneios.Selecionar(
  TipoPesquisa: TtecRelatorioRomaneios);
begin
  case TipoPesquisa of
      rrFORNECEDOR : ReFazConsulta(qryFornecedores,[0],[qryConsultaFornecedorescodigo.AsInteger]);
  end;
end;


procedure Tdtmrelatorioromaneios.SetEmissaoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FEmissaoFinal := Value
  else FEmissaoFinal := '';
  MontaDataEmissao;
end;

procedure Tdtmrelatorioromaneios.SetEmissaoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FEmissaoInicial := Value
  else FEmissaoInicial := '';
end;

procedure Tdtmrelatorioromaneios.SetFornecedor(const Value: String);
begin
  if (Value <> '') then
  begin
   qryRomaneios.macrobyname('SQLFornecedor').asstring:= 'and (r.Fornecedor = ' + Value + ')';
   FParametroCabecalho:=FParametroCabecalho+' Fornecedor: '+Value;
  end
  else qryRomaneios.macrobyname('SQLFornecedor').asstring:= '';
end;

procedure Tdtmrelatorioromaneios.SetTipoNormal(const Value: Boolean);
begin
 FTipoNormal := Value;
end;

procedure Tdtmrelatorioromaneios.SetTipoTransferencia(
  const Value: Boolean);
begin
 FTipoTransferencia := Value;
 if FTipoNormal and FTipoTransferencia then
   qryRomaneios.macrobyname('SQLTipo').asstring:= ''
 else
   if FTipoNormal then
   begin
     qryRomaneios.macrobyname('SQLTipo').asstring:= 'and (r.tipo='+quotedstr('N')+')';
     FParametroCabecalho:=FParametroCabecalho+' Tipo: N';
   end
   else
   begin
     qryRomaneios.macrobyname('SQLTipo').asstring:= 'and (r.tipo='+quotedstr('T')+')';
     FParametroCabecalho:=FParametroCabecalho+' Tipo: T';
   end;
end;

procedure Tdtmrelatorioromaneios.frpRomaneiosBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRomaneios,View);
end;

procedure Tdtmrelatorioromaneios.qryRomaneiosCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryRomaneiosvalorvencimento.ascurrency :=
     qryRomaneiosvalorentregue.ascurrency + qryRomaneiosvaloraentregar.ascurrency;
end;

end.
