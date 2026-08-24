unit dmquadroatrasosemanal;

interface

uses
  SysUtils, Forms, Classes, dmbasico, biblio, ZTransact, fr_class, fr_dset,
  fr_dbset, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  fmpreviewpadrao, ComObj, ctconstantes, dmtecsoft, dateutils;

type
  TdtmQuadroAtrasoSemanal = class(TdtmBasico)
    qryOsp: TtecQuery;
    dsrOsp: TtecDataSource;
    fdsQuadroAtrasoSemanal: TfrDBDataSet;
    frpQuadroAtrasoSemanal: TfrReport;
    qryOspnumero: TIntegerField;
    qryOspsemananormal: TIntegerField;
    qryOspsemana: TStringField;
    qryOspano: TStringField;
    qryOspmarcador: TStringField;
    qryOspprioridade: TIntegerField;
    qryOspproduto: TLargeintField;
    qryOspdata: TDateField;
    qryOspcliente: TIntegerField;
    qryOspnomecliente: TStringField;
    qryOspquantidade: TFloatField;
    qryOspentregue: TFloatField;
    qryOspproduto_cliente: TStringField;
    qryOspprodutovisual: TStringField;
    qryOspSaldo: TCurrencyField;
    qryOsppn: TStringField;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpQuadroAtrasoSemanalBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryOspCalcFields(DataSet: TDataSet);
  private
    FDataLimite: String;
    FCliente: String;
    ParametroPeriodo: String;
    ParametroCliente: String;
    FSemanaFim: String;
    FSemanaInicio: String;
    FAnoFim: String;
    FAnoInicio: String;
    FExisteInicial: Boolean;
    FExisteFinal: Boolean;
    { Private declarations }
  protected
    procedure MontarParametros;
  public
    { Public declarations }
    function GerarConsulta: Boolean;

    property SemanaInicio : String read FSemanaInicio write FSemanaInicio;
    property SemanaFim    : String read FSemanaFim    write FSemanaFim;
    property AnoInicio    : String read FAnoInicio    write FAnoInicio;
    property AnoFim       : String read FAnoFim       write FAnoFim;
    property ExisteInicial    : Boolean read FExisteInicial    write FExisteInicial;
    property ExisteFinal      : Boolean read FExisteFinal      write FExisteFinal;


    property DataLimite : String read FDataLimite write FDataLimite;
    property Cliente    : String read FCliente    write FCliente;

    procedure ImprimirRelatorio;
    procedure GravarExcel;
  end;

var
  dtmQuadroAtrasoSemanal: TdtmQuadroAtrasoSemanal;

implementation

uses QForms;


{$R *.dfm}

{ TdtmQuadroAtrasoSemanal }

procedure TdtmQuadroAtrasoSemanal.MontarParametros;
begin

  ParametroPeriodo:= '';
  ParametroCliente:= '';

  if FCliente <> '' then
    ParametroCliente:= ' and osp.cliente = '+FCliente+'';

  if (ExisteInicial and not ExisteFinal) then
    ParametroPeriodo:= ' and (osp.semana >= '+FSemanaInicio+' and osp.ano >= '+FAnoInicio+')'

  else if (not ExisteInicial and ExisteFinal) then
    ParametroPeriodo:= ' and (osp.semana <= '+FSemanaFim+' and osp.ano <= '+FAnoFim+')'
  else if (ExisteInicial and ExisteFinal) then
    ParametroPeriodo:= ' and ((osp.semana >= '+FSemanaInicio+' and osp.ano >= '+FAnoInicio+') and '+
                       '(osp.semana <= '+FSemanaFim+' and osp.ano <= '+FAnoFim+'))'
  else
    ParametroPeriodo:= '';

end;

function TdtmQuadroAtrasoSemanal.GerarConsulta: Boolean;
//const
//DataDadoFiscal = ' and df.data <= ''%s''';
begin

  MontarParametros;
  qryOsp.MacroByName('Cliente').AsString:= ParametroCliente;
  qryOsp.MacroByName('Semana').AsString:= ParametroPeriodo;

//if ExisteFinal then
//  qryOsp.MacroByName('DataDadoFiscal').AsString := format(DataDadoFiscal,[formatdatetime('YYYY-MM-DD',(StartOfAWeek(strtoint(FanoFim),strtoint(FSemanaFim))+6))])
//else
//  qryOsp.MacroByName('DataDadoFiscal').AsString := '';

  if qryOsp.Active then
    qryOsp.Close;
  qryOsp.Open;

  Result:= qryOsp.IsEmpty;
end;

procedure TdtmQuadroAtrasoSemanal.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['FILIALBASE'] := RazaoFilialBase;
  frVariables['ENDERECO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CIDADE']     :=  FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Titulo']     := 'R-7.2.03 - QUADRO DE PROGRAMAÇÃO SEMANAL';

  if ExisteInicial and ExisteFinal then
    frVariables['Outras']:= 'ATRASOS DAS SEMANAS DE ' + FSemanaInicio + '/' + FAnoInicio +
                                    ' A ' + FSemanaFim    + '/' + FAnoFim
  else
  if ExisteInicial and not ExisteFinal then
    frVariables['Outras']:= 'ATRASOS DAS SEMANAS A PARTIR DE ' + FSemanaInicio + '/' + FAnoInicio
  else
  if not ExisteInicial and ExisteFinal then
    frVariables['Outras']:= 'ATRASOS DA SEMANAS ATÉ ' + FSemanaFim    + '/' + FAnoFim
  else
    frVariables['Outras']:= 'TODAS AS SEMANAS';


  qryOsp.DisableControls;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
  //frpQuadroAtrasoSemanal.DesignReport;
  Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    WindowState:= wsMaximized;
    frCompositeReport.Reports.Clear;
    frCompositeReport.Reports.Add(frpQuadroAtrasoSemanal);
   end;
   frmPreview.cmbZoom.ItemIndex:= 3;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.Preview.Zoom:= 125;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
  qryOsp.EnableControls;
  qryOsp.First;
end;

procedure TdtmQuadroAtrasoSemanal.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 Arquivo: String;
begin
{  inherited;
  Listar := tStringlist.create;
  Arquivo:='c:\osp12.sql';
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);

  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);

  listar.free;}
end;

procedure TdtmQuadroAtrasoSemanal.frpQuadroAtrasoSemanalBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpQuadroAtrasoSemanal, View);
end;

procedure TdtmQuadroAtrasoSemanal.qryOspCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryOspentregue.AsCurrency>0 then
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency -
                              qryOSPentregue.AsCurrency
  else
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency;
end;

procedure TdtmQuadroAtrasoSemanal.GravarExcel;
const
 xlCenter = -4108;
var i,coluna,eline: Integer;
    oXL, oWB, oSheet, oRng, VArray : Variant;
    NomeArquivo,v: String;
    ColunaSomatorioEvento, LinhaSomatorioEvento, LinhaSomatorioGrupo: Integer;
    parametros : String;

    TotalPedida:   Currency;
    TotalEntregue: Currency;
    TotalSaldo:    Currency;

begin
  inherited;
  // Start Excel and get Application Object
  oXL:= CreateOleObject('Excel.Application');
  oXL.Visible := true;

  // Get a new workbook
  oWB := oXL.Workbooks.Add;
  oSheet := oWB.ActiveSheet;

  // Dataset Header

  eline :=1;

  oSheet.name := 'QUADRO DE PROGRAMAÇÃO SEMANAL';
  oSheet.Cells[eline,2].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,2].Font.size := 14;
  oSheet.Cells[eline,2] := 'QUADRO DE PROGRAMAÇÃO SEMANAL';
  eline := eline + 1;

  if ExisteInicial
  then if ExisteFinal
       then Parametros:= 'R-7.2.03 - ATRASOS DAS SEMANAS DE ' + FSemanaInicio + '/' + FAnoInicio +
                                             ' A ' + FSemanaFim    + '/' + FAnoFim
       else Parametros:= 'R-7.2.03 - ATRASOS DAS SEMANAS A PARTIR DE ' + FSemanaInicio + '/' + FAnoInicio

  else if ExisteFinal
       then Parametros:= 'R-7.2.03 - ATRASOS DAS SEMANAS ATÉ ' + FSemanaFim + '/' + FAnoFim
       else Parametros:= 'R-7.2.03 - ATRASOS DE TODAS AS SEMANAS';

  oSheet.Cells[eline,2].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,2].Font.size := 14;
  oSheet.Cells[eline,2] := parametros;

  eline := eline + 2;

  coluna:=1;

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' PRAZO ';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' O.S.P.';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' CLIENTE';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' PN';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' DESCRIÇÃO DO MATERIAL';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' QT PEDIDA';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' ENTREGUE';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' SALDO';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  if qryOsp.IsEmpty then
    Inc(eline);

  qryOsp.DisableControls;
  qryOsp.First;

  Inc(eline); // Add 1 to the line of Sheet

  TotalPedida  := 0;
  TotalEntregue:= 0;
  TotalSaldo   := 0;
  while not qryOsp.Eof do // Detail
  begin


    inc(eline);
    coluna :=1;

    oSheet.Cells[eline,coluna].ColumnWidth := 10;
    oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;
    oSheet.Cells[eline,coluna] := qryOspMarcador.AsString;

    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 10;
    oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;
    oSheet.Cells[eline,coluna] := qryOspnumero.value;

    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 40;
    oSheet.Cells[eline,coluna] := qryOspnomecliente.asstring;

    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 15;
    oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;
    oSheet.Cells[eline,coluna] := qryOspPN.asstring;


    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 30;
    oSheet.Cells[eline,coluna] := qryOspProdutoVisual.asstring;

    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 15;
    oSheet.Cells[eline,coluna] := qryOspQuantidade.value;
    oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 15;
    oSheet.Cells[eline,coluna] := qryOspEntregue.value;
    oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

    inc(coluna);
    oSheet.Cells[eline,coluna].ColumnWidth := 15;
    oSheet.Cells[eline,coluna] := qryOspsaldo.value;
    oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

    TotalPedida  := TotalPedida   + qryOSPQuantidade.AsCurrency;
    TotalEntregue:= TotalEntregue + qryOSPEntregue.  AsCurrency;
    TotalSaldo   := TotalSaldo    + qryOSPSaldo.     AsCurrency;

    qryOsp.Next;
  end;

  inc(eline);
  oSheet.Cells[eline,5].HorizontalAlignment := xlCenter;
  oSheet.Cells[eline,5].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,5] := 'TOTAIS';

  oSheet.Cells[eline,6].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,6]:= TotalPedida;
  oSheet.Cells[eline,6].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

  oSheet.Cells[eline,7].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,7]:= TotalEntregue;
  oSheet.Cells[eline,7].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

  oSheet.Cells[eline,8].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,8]:= TotalSaldo;
  oSheet.Cells[eline,8].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

  qryOsp.EnableControls;
  // Save the file
  NomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas';

  if not DirectoryExists(NomeArquivo) then
    if not CreateDir(NomeArquivo) then
    raise Exception.Create('Impossível criar o diretório '+NomeArquivo);

  NomeArquivo := NomeArquivo+'\QuadroProgramacaosemanal';
  try
  oWB.SaveAs(NomeArquivo); except end;
//  oXL.Visible := true;
//  oXL.Quit;
end;

end.

