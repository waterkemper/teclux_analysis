unit dmrelatorionotasportransportador;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, FR_Class, FR_DSet, FR_DBSet, CheckLst, clparametrossistema,
  biblio, fmpreviewpadrao, ZTransact;

type
  Tdtmrelatorionotasportransportador = class(TdtmBasico)
    qryTransportadoras: TtecQuery;
    dsrTransportadoras: TtecDataSource;
    qrynotastransportador: TtecQuery;
    dsrnotastransportador: TtecDataSource;
    fdsnotastransportador: TfrDBDataSet;
    frpNotasTransportador: TfrReport;
    qryTransportadorascodigo: TIntegerField;
    qryTransportadorasnome: TStringField;
    qryTransportadorasselecionado: TBooleanField;
    qryTransportadorascidadetransportador: TStringField;
    qrynotastransportadornumero: TIntegerField;
    qrynotastransportadornumeronota: TStringField;
    qrynotastransportadortransportadora: TStringField;
    qrynotastransportadorcidadetransportadora: TMemoField;
    qrynotastransportadorcodigofiscal: TIntegerField;
    qrynotastransportadordata: TDateField;
    qrynotastransportadorcliente: TIntegerField;
    qrynotastransportadornomecliente: TStringField;
    qrynotastransportadorcidadecliente: TMemoField;
    qrynotastransportadorvalorprodutos: TFloatField;
    qrynotastransportadorpeso: TFloatField;
    qrynotastransportadorvolumes: TLargeintField;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpNotasTransportadorBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryTransportadorasBeforeOpen(DataSet: TDataSet);
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FListaTotalTransportadoras: TStrings;
    FListaTransportadorasImpressao: String;
    FTransportadoras: String;
    FNumeroSelecionadas: integer;
    function GetListaTotalTransportadoras: TStrings;
    procedure SetDataFinal(const Value: TDateTime);
    procedure SetDataInicial(const Value: TDateTime);
    procedure AbrirTabelaTransportadora;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property ListaTotalTransportadoras: TStrings read GetListaTotalTransportadoras;
    property ListaTransportadorasImpressao:String read FListaTransportadorasImpressao write FListaTransportadorasImpressao;
    procedure MontarFiltroTranportador(Usar: TCheckListBox);
    property DataInicial : TDateTime read FDataInicial write SetDataInicial;
    property DataFinal : TDateTime read FDataFinal write SetDataFinal;
    property Transportadoras: String read FTransportadoras write FTransportadoras;
    property NumeroSelecionadas: integer read FNumeroSelecionadas write FNumeroSelecionadas;
    procedure SelecionarTransportadoras(Marcar, Todos: Boolean);
    procedure ImprimirRelatorio;
    function MontarRegistrosImpressao: String;
    procedure AtribuirNumeroNota;
  end;

var
  dtmrelatorionotasportransportador: Tdtmrelatorionotasportransportador;

implementation
{$R *.dfm}

{ Tdtmnotasportransportador }

procedure Tdtmrelatorionotasportransportador.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirNumeroNota;
  frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Titulo']:= 'NOTAS ENTREGUES A TRANSPORTADOR';
  frVariables['Outras']:= 'EMITIDAS ENTRE ' + FormatDateTime('dd/mm/yy', FDataInicial) +
                                      ' E ' + FormatDateTime('dd/mm/yy', FDataFinal);

  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3;
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   //frpNotasTransportador.DesignReport;
   frmPreview.frCompositeReport.Reports.Add(frpNotasTransportador);
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;

   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
end;

function Tdtmrelatorionotasportransportador.GetListaTotalTransportadoras: TStrings;
begin
  FListaTotalTransportadoras:= TStringList.Create;
  qryTransportadoras.Open;
  qryTransportadoras.First;
  while not qryTransportadoras.Eof do
  begin
    FListaTotalTransportadoras.AddObject(qryTransportadorasnome.AsString, Pointer(qryTransportadorascodigo.AsInteger));
    qryTransportadoras.Next;
  end;
  qryTransportadoras.Close;
  Result := FListaTotalTransportadoras;
end;

procedure Tdtmrelatorionotasportransportador.MontarFiltroTranportador(Usar: TCheckListBox);
var
  STRTransportadoras: String;
  TodasTransportadoras: Boolean;
  cnt: Integer;
begin
  TodasTransportadoras:= True;
  STRTransportadoras := '';
  for cnt := 0 to FListaTotalTransportadoras.Count - 1 do
    if Usar.Checked[cnt] then
      STRTransportadoras := STRTransportadoras + '''' + IntToStr(Integer(FListaTotalTransportadoras.Objects[cnt])) + ''','
    else
      TodasTransportadoras:=false;

  STRTransportadoras := Copy(STRTransportadoras, 0, Length(STRTransportadoras) - 1);
{  if Trim(STRTransportadoras) <> '' then
  begin
    if TodasTransportadoras then
      FParametroCabecalho:=FParametroCabecalho+' Agentes: Todos'
    else
      FParametroCabecalho:=FParametroCabecalho+' Agentes: '+STRTransportadoras;
  end;
         }
  FTransportadoras := STRTransportadoras;
end;

procedure Tdtmrelatorionotasportransportador.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 arquivo: String;
begin
  inherited;
  Listar := tStringlist.Create;
  arquivo := 'c:\Lixo\Transportadoras.sql';
  if fileexists(arquivo) then
    Listar.loadfromfile(arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(arquivo);
  listar.free;
end;


procedure Tdtmrelatorionotasportransportador.SelecionarTransportadoras(
  Marcar, Todos: Boolean);
begin
  if Todos then
  begin
    try
      GuardarRegistroAtual(qryTransportadoras,True);
      qryTransportadoras.First;
      while not qryTransportadoras.Eof do
      begin
        qryTransportadoras.Edit;
        qryTransportadorasselecionado.AsBoolean:= Marcar;
        qryTransportadoras.Post;
        qryTransportadoras.Next;
      end;
    finally
      VoltarRegistroAtual(qryTransportadoras);
    end;
  end
  else
  begin
    qryTransportadoras.Edit;
    qryTransportadorasselecionado.AsBoolean:= not qryTransportadorasselecionado.AsBoolean;
    qryTransportadoras.Post;
  end;
end;

constructor Tdtmrelatorionotasportransportador.Create(AOwner: TComponent);
begin
  inherited;
//  qryTransportadoras.Open;
end;

function Tdtmrelatorionotasportransportador.MontarRegistrosImpressao: String;
begin
  FNumeroSelecionadas:= 0;
  FListaTransportadorasImpressao:= '';
  qryTransportadoras.First;
  while not qryTransportadoras.Eof do
  begin
    if qryTransportadorasselecionado.AsBoolean then
    begin
      FListaTransportadorasImpressao:= FListaTransportadorasImpressao + qryTransportadorascodigo.AsString + ',';
      FNumeroSelecionadas:= FNumeroSelecionadas + 1;
    end;
    qryTransportadoras.Next;
  end;
  FListaTransportadorasImpressao:= Copy(FListaTransportadorasImpressao, 0, Length(FListaTransportadorasImpressao)-1);
  Result:= FListaTransportadorasImpressao;
end;

procedure Tdtmrelatorionotasportransportador.AtribuirNumeroNota;
begin
  qrynotastransportador.First;
  while not qrynotastransportador.Eof do
  begin
    qrynotastransportador.Edit;
    qrynotastransportadornumeronota.AsString:= FormatarNroNFe(qrynotastransportadornumero.AsString);
    qrynotastransportador.Post;
    qrynotastransportador.Next;
  end;
end;

procedure Tdtmrelatorionotasportransportador.frpNotasTransportadorBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpNotasTransportador,View);
end;

procedure Tdtmrelatorionotasportransportador.qryTransportadorasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryTransportadoras.ParamByName('datainicial').AsDateTime := DataInicial;
  qryTransportadoras.ParamByName('datafinal').AsDateTime := DataFinal;

  if qryTransportadoras.ParamByName('datainicial').Asdatetime=0 then
    qryTransportadoras.ParamByName('datainicial').AsDateTime := now();

  if qryTransportadoras.ParamByName('datafinal').Asdatetime=0 then
    qryTransportadoras.ParamByName('datafinal').AsDateTime := now();
end;

procedure Tdtmrelatorionotasportransportador.SetDataFinal(
  const Value: TDateTime);
begin
  FDataFinal := Value;
  AbrirTabelaTransportadora;
end;

procedure Tdtmrelatorionotasportransportador.SetDataInicial(
  const Value: TDateTime);
begin
  FDataInicial := Value;
  AbrirTabelaTransportadora;
end;

procedure Tdtmrelatorionotasportransportador.AbrirTabelaTransportadora;
begin
  qryTransportadoras.Close;
  qryTransportadoras.open;
end;

end.
