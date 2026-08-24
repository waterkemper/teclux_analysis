unit dmrelatorioicmsstarecolher;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_class, fr_dset, fr_dbset, Biblio, fmpreviewpadrao,
  ZTransact;

type
  TTipoIntervaloData = (IntDataCadastro, IntDataEmissao);
  TOpcaoNCM = (NCMNotaFiscal, NCMEmpresa);

type
  Tdtmrelatorioicmsstarecolher = class(TDtmBasico)
    qryNotasFiscaisEntrada: TtecQuery;
    dsrNotasFiscaisEntrada: TtecDataSource;
    fdsNotasFiscaisEntrada: TfrDBDataSet;
    frpRelatorioNotasEntrada: TfrReport;
    qryProdutosNotasEntrada: TtecQuery;
    dsrProdutosNotasEntrada: TtecDataSource;
    qryNotasFiscaisEntradacodigo: TIntegerField;
    qryNotasFiscaisEntradafornecedor: TIntegerField;
    qryNotasFiscaisEntradatipofornecedor: TStringField;
    qryNotasFiscaisEntradanome: TStringField;
    qryNotasFiscaisEntradagrupofilial: TIntegerField;
    qryNotasFiscaisEntradanomegrupofilial: TStringField;
    qryNotasFiscaisEntradafilial: TIntegerField;
    qryNotasFiscaisEntradanomefilial: TStringField;
    qryNotasFiscaisEntradaserie: TStringField;
    qryNotasFiscaisEntradanumero: TIntegerField;
    qryNotasFiscaisEntradacodigofiscal: TIntegerField;
    qryNotasFiscaisEntradanatureza: TStringField;
    qryNotasFiscaisEntradadata: TDateField;
    qryNotasFiscaisEntradaemissao: TDateField;
    qryNotasFiscaisEntradavalornota: TFloatField;
    qryNotasFiscaisEntradadocumentopag: TIntegerField;
    fdsProdutosNotasEntrada: TfrDBDataSet;
    qryNotasFiscaisEntradavaloricmssubstituicao: TFloatField;
    qryProdutosNotasEntradacrt: TIntegerField;
    qryProdutosNotasEntradafornecedor: TIntegerField;
    qryProdutosNotasEntradavaloricmssubstituicao: TFloatField;
    qryProdutosNotasEntradaestadonota: TStringField;
    qryProdutosNotasEntradanumero: TIntegerField;
    qryProdutosNotasEntradafornecedornosimples: TBooleanField;
    qryProdutosNotasEntradacodigonota: TIntegerField;
    qryProdutosNotasEntradaproduto: TLargeintField;
    qryProdutosNotasEntradaquantidade: TFloatField;
    qryProdutosNotasEntradaprecounitario: TFloatField;
    qryProdutosNotasEntradavprod: TFloatField;
    qryProdutosNotasEntradavbc: TFloatField;
    qryProdutosNotasEntradacodigocaracteristica: TLargeintField;
    qryProdutosNotasEntradanomeproduto: TStringField;
    qryProdutosNotasEntradaicmscaracteristica: TIntegerField;
    qryProdutosNotasEntradapredbc: TFloatField;
    qryProdutosNotasEntradapredbcst: TFloatField;
    qryProdutosNotasEntradancm: TStringField;
    qryProdutosNotasEntradapicms: TFloatField;
    qryProdutosNotasEntradafator: TFloatField;
    qryProdutosNotasEntradapicms_dentro: TFloatField;
    qryProdutosNotasEntradavicms: TFloatField;
    qryProdutosNotasEntradaicmsdentro: TFloatField;
    qryProdutosNotasEntradaicmsfora: TFloatField;
    qryProdutosNotasEntradaajustemva: TFloatField;
    qryProdutosNotasEntradaequalizacao: TFloatField;
    qryProdutosNotasEntradamvaajustado: TFloatField;
    qryProdutosNotasEntradavbcst: TFloatField;
    qryProdutosNotasEntradavicmsst: TFloatField;
    qryProdutosNotasEntradavoutro: TFloatField;
    qryProdutosNotasEntradavaloripi: TFloatField;
    procedure qryProdutosNotasEntradaBeforeOpen(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpRelatorioNotasEntradaBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure ZmonitorMonitorEvent(Sql, Result: String);
  private
    { Private declarations }
    FListaNotas: String;
  public
    { Public declarations }
    function ObterListaNotas:String;
    function AbrirConsulta(ListadeFiliais, Fornecedor, Produto,
                           DataInicial, DataFinal: String; TipoIntervaloData: TTipoIntervaloData; OpcaoNCM: TOpcaoNCM): Boolean;
    procedure ImprimirRelatorio;
  end;

var
  dtmrelatorioicmsstarecolher: Tdtmrelatorioicmsstarecolher;

implementation

{$R *.dfm}

{ Tdtmrelatorioicmsstarecolher }

function Tdtmrelatorioicmsstarecolher.AbrirConsulta(ListadeFiliais,
  Fornecedor, Produto, DataInicial, DataFinal: String; TipoIntervaloData: TTipoIntervaloData; OpcaoNCM: TOpcaoNCM): Boolean;
const
  FiltroDataCadastro = 'AND np.data between %s and %s';
  FiltroDataEmissao  = 'AND np.emissao between %s and %s';
  FiltroFilial       = 'AND np.filial in (%s)';
  FiltroFornecedor   = 'AND np.fornecedor = %s';
  FiltroProduto      = 'AND pnp.produto = %s';
var
  Subtitulo : String;
begin
   qryNotasFiscaisEntrada.Close;
   qryProdutosNotasEntrada.Close;

   case TipoIntervaloData of
     IntDataCadastro :
     begin
       Subtitulo := 'Notas Cadastradas entre ';
       qryNotasFiscaisEntrada.MacroByName('WherePeriodo').AsString:= Format(FiltroDataCadastro,[quotedstr(DataInicial),quotedstr(DataFinal)]);
     end;

     IntDataEmissao  :
     begin
       Subtitulo := 'Notas Emitidas entre ';
       qryNotasFiscaisEntrada.MacroByName('WherePeriodo').AsString:= Format(FiltroDataEmissao,[quotedstr(DataInicial),quotedstr(DataFinal)]);
     end;
   end;

   case OpcaoNCM of
     NCMNotaFiscal : qryProdutosNotasEntrada.ParamByName('NCMEmpresa').AsBoolean := false;
     NCMEmpresa    : qryProdutosNotasEntrada.ParamByName('NCMEmpresa').AsBoolean := true;
   end;

   Subtitulo:= Subtitulo  + FormatDateTime('dd/mm/yyyy',StrToDate(DataInicial)) +
               '  A  ' + FormatDateTime('dd/mm/yyyy',StrToDate(DataFinal))   + sLineBreak;

   if ListadeFiliais <> '' then begin
      qryNotasFiscaisEntrada.MacroByName('WhereFilial').AsString:= Format(FiltroFilial,[ListadeFiliais]);
      Subtitulo:= Subtitulo + 'FILIAL: ' + ListadeFiliais + '     ';
   end
   else qryNotasFiscaisEntrada.MacroByName('WhereFilial').AsString:= '';

   if Fornecedor <> '' then begin
      qryNotasFiscaisEntrada.MacroByName('WhereFornecedor').AsString:= Format(FiltroFornecedor,[Fornecedor]);
      Subtitulo:= Subtitulo + 'FORNECEDOR: ' + Fornecedor+sLineBreak;
   end
   else qryNotasFiscaisEntrada.MacroByName('WhereFornecedor').AsString:= '';

   if Produto <> '' then
   begin
      qryProdutosNotasEntrada.MacroByName('WhereProduto').AsString:= Format(FiltroProduto,[Produto]);
      qryNotasFiscaisEntrada.MacroByName('WhereProduto').AsString:= Format(FiltroProduto,[Produto]);
      Subtitulo:= Subtitulo + 'PRODUTO: ' + Produto;
   end
   else
   begin
     qryProdutosNotasEntrada.MacroByName('WhereProduto').AsString:= '';
     qryNotasFiscaisEntrada.MacroByName('WhereProduto').AsString:= '';

   end;

   frVariables['Subtitulo'] := Subtitulo;

   qryNotasFiscaisEntrada.Open;

   if qryNotasFiscaisEntrada.RecordCount > 0
   then qryProdutosNotasEntrada.Open;

   Result:= qryNotasFiscaisEntrada.RecordCount > 0;
end;

procedure Tdtmrelatorioicmsstarecolher.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio;
  frVariables['Titulo'] := 'ICMS ST A RECOLHER';


  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 2;
  try
    Relatorio := frmPreview.frCompositeReport;
     with frmPreview do
     begin
       frCompositeReport.Reports.Clear;
       frCompositeReport.DoublePass:= True;
//       frpRelatorioNotasEntrada.DesignReport;

       frCompositeReport.Reports.Add(frpRelatorioNotasEntrada);
     end;
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
  finally
    frmPreview.Free;
  end;
end;

function Tdtmrelatorioicmsstarecolher.ObterListaNotas: String;
var i : integer;
begin
   FListaNotas:= '';
   qryNotasFiscaisEntrada.First;
   while not qryNotasFiscaisEntrada.Eof do
   begin
     FListaNotas:= FListaNotas + IntToStr(qryNotasFiscaisEntradacodigo.AsInteger)+ ',';
     qryNotasFiscaisEntrada.Next;
   end;
   if FListaNotas <> '' then
       FListaNotas := copy(FListaNotas,1,Length(FListaNotas)-1);
       
   Result:= FListaNotas;
end;

procedure Tdtmrelatorioicmsstarecolher.qryProdutosNotasEntradaBeforeOpen(DataSet: TDataSet);
var ListaNotas : String;
begin
  inherited;
  ListaNotas := ObterListaNotas;
  qryProdutosNotasEntrada.MacroByName('Codigos').AsString:= ListaNotas;
  qryProdutosNotasEntrada.ParamByName('EstadoFilial').AsString:= EstadoFilialBase;
  qryProdutosNotasEntrada.ParamByName('Regimetributario').AsInteger:= RegimeTributario;
end;

procedure Tdtmrelatorioicmsstarecolher.ZMonitor1MonitorEvent(Sql,   Result: String);
var
 Listar : TStringList;
 Arquivo: String;
begin
  inherited;
  Listar := tStringlist.create;
  Arquivo:= 'c:\tecsoft\ICMSSubstituicao.sql';
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);
  listar.free;
end;

procedure Tdtmrelatorioicmsstarecolher.frpRelatorioNotasEntradaBeforePrint(Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioNotasEntrada, View);
end;

procedure Tdtmrelatorioicmsstarecolher.ZmonitorMonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 Arquivo: String;
begin
  inherited;
  Listar := tStringlist.create;
  Arquivo:= 'c:\Lixo\ICMSSubstituicao.sql';
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);
  listar.free;
end;

end.

