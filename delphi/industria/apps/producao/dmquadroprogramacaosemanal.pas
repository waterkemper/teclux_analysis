unit dmquadroprogramacaosemanal;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ZTransact, fr_class, fr_dset, fr_dbset, fmpreviewpadrao, biblio,
  ctconstantes, ComObj, Forms, clparametrossistema;

type
  TdtmQuadroProgramacaoSemanal = class(TdtmBasico)
    qryOsp: TtecQuery;
    dsrOsp: TtecDataSource;
    qryOspordem: TIntegerField;
    qryOspnumero: TIntegerField;
    qryOspsemana: TStringField;
    qryOspano: TStringField;
    qryOspprioridade: TIntegerField;
    qryOspproduto: TLargeintField;
    qryOspdata: TDateField;
    qryOspcliente: TIntegerField;
    qryOspnomecliente: TStringField;
    qryOspquantidade: TFloatField;
    qryOspproduto_cliente: TStringField;
    fdsQuadroSemanal: TfrDBDataSet;
    frpQuadroSemanal: TfrReport;
    qryOspprodutovisual: TStringField;
    qryOspmarcador: TStringField;
    qryOspsemananormal: TIntegerField;
    qryOsppn: TStringField;
    qryOspqtdeentregue: TFloatField;
    qryOspsaldo: TCurrencyField;
    procedure frpQuadroSemanalBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryOspCalcFields(DataSet: TDataSet);
  private
    FSemanaFim: String;
    FSemanaInicio: String;
    FCliente: String;
    FAnoFim: String;
    FAnoInicio: String;
    ParametroPeriodo : String;
    ParametroCliente : String;
    FValidacaoInicial: Boolean;
    FValidacaoFinal: Boolean;
    FExisteInicial: Boolean;
    FExisteFinal: Boolean;
    FLocalGravacao: String;
    { Private declarations }
  protected
    procedure MontarParametros;

  public
    { Public declarations }
    property SemanaInicio : String read FSemanaInicio write FSemanaInicio;
    property SemanaFim    : String read FSemanaFim    write FSemanaFim;
    property AnoInicio    : String read FAnoInicio    write FAnoInicio;
    property AnoFim       : String read FAnoFim       write FAnoFim;
    property Cliente      : String read FCliente      Write FCliente;
    property ValidacaoInicial : Boolean read FValidacaoInicial write FValidacaoInicial;
    property ValidacaoFinal   : Boolean read FValidacaoFinal   write FValidacaoFinal;
    property ExisteInicial    : Boolean read FExisteInicial    write FExisteInicial;
    property ExisteFinal      : Boolean read FExisteFinal      write FExisteFinal;

    function GerarConsulta: Boolean;
    procedure Ordenar;

    procedure ImprimirRelatorio;
    property LocalGravacao : String read FLocalGravacao write FLocalGravacao;

    procedure GravarExcel;

  end;

var
  dtmQuadroProgramacaoSemanal: TdtmQuadroProgramacaoSemanal;

implementation

{$R *.dfm}

{ TdtmQuadroProgramacaoSemanal }

function TdtmQuadroProgramacaoSemanal.GerarConsulta: Boolean;
begin
  MontarParametros;
  qryOsp.MacroByName('Cliente').AsString:= ParametroCliente;
  qryOsp.MacroByName('Semana').AsString:= ParametroPeriodo;

  if qryOsp.Active then
    qryOsp.Close;
  qryOsp.Open;

  Result:= qryOsp.IsEmpty;
end;

procedure TdtmQuadroProgramacaoSemanal.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin

  frVariables['FILIALBASE']:= RazaoFilialBase;
  frVariables['ENDERECO']  := RuaFilialBase + ' - ' + BairroFilialBase;
  frVariables['CIDADE']    := FormatarCEP(CEPFilialBase) + '  ' +
                              CidadeFilialBase + '  ' + EstadoFilialBase;
  frVariables['Titulo']    := 'QUADRO DE PROGRAMAÇÃO SEMANAL';

  if ExisteInicial
  then if ExisteFinal
       then frVariables['Outras']:= 'SEMANAS DE ' + FSemanaInicio + '/' + FAnoInicio +
                                            ' A ' + FSemanaFim    + '/' + FAnoFim
       else frVariables['Outras']:= 'SEMANAS A PARTIR DE ' + FSemanaInicio + '/' + FAnoInicio

  else if ExisteFinal
       then frVariables['Outras']:= 'SEMANAS ATÉ ' + FSemanaFim + '/' + FAnoFim
       else frVariables['Outras']:= 'TODAS AS SEMANAS';

  qryOsp.DisableControls;
  frmPreview := TfrmPreviewPadrao.create(self);

  try
   //frpQuadroSemanal.DesignReport;
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    frCompositeReport.Reports.Add(frpQuadroSemanal);
   end;
   frmPreview.cmbZoom.ItemIndex:= 3;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
  qryOsp.EnableControls;
  qryOsp.First;

end;

procedure TdtmQuadroProgramacaoSemanal.MontarParametros;
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



procedure TdtmQuadroProgramacaoSemanal.Ordenar;
var i: Integer;
    OldValue: String;
begin
  i:= 1;
  OldValue:= '';
  qryOsp.DisableControls;
  qryOsp.First;
  while not qryOsp.Eof do
  begin
    qryOsp.Edit;
    if (OldValue = qryOspsemana.Value) then
    begin
      qryOspordem.AsInteger:= i;
      inc(i);
    end
    else
    begin
      i:= 1;
      qryOspordem.AsInteger:= i;
      inc(i);
    end;
    qryOsp.Post;
    OldValue:= qryOspsemana.AsString;
    qryOsp.Next;
  end;
  qryOsp.First;
  qryOsp.EnableControls;
end;

procedure TdtmQuadroProgramacaoSemanal.frpQuadroSemanalBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpQuadroSemanal, View);
end;

procedure TdtmQuadroProgramacaoSemanal.GravarExcel;
const
 xlCenter = -4108;
var i,coluna,eline: Integer;
    oXL, oWB, oSheet, oRng, VArray : Variant;
    NomeArquivo,v: String;
    ColunaSomatorioEvento, LinhaSomatorioEvento, LinhaSomatorioGrupo: Integer;
    parametros : String;

    semana, ano : String;

    somamesano : Currency;

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
       then Parametros:= 'SEMANAS DE ' + FSemanaInicio + '/' + FAnoInicio +
                                 ' A ' + FSemanaFim    + '/' + FAnoFim
       else Parametros:= 'SEMANAS A PARTIR DE ' + FSemanaInicio + '/' + FAnoInicio

  else if ExisteFinal
       then Parametros:= 'SEMANAS ATÉ ' + FSemanaFim + '/' + FAnoFim
       else Parametros:= 'TODAS AS SEMANAS';

  oSheet.Cells[eline,2].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,2].Font.size := 14;
  oSheet.Cells[eline,2] := parametros;

  eline := eline + 2;

  coluna:=1;

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' ORDEM';
  oSheet.Cells[eline,coluna].HorizontalAlignment := xlCenter;

  inc(coluna);

  oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
  oSheet.Cells[eline,coluna] := ' OSP';
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
  oSheet.Cells[eline,coluna] := ' F';
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

  semana := qryOspsemana.asstring;
  ano := qryOspano.AsString;

  Inc(eline); // Add 1 to the line of Sheet

  while not qryOsp.Eof do // Detail
  begin
    somamesano := 0;
    coluna :=1;

    oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
    oSheet.Cells[eline,coluna].ColumnWidth := 10;
    oSheet.Cells[eline,coluna] := 'SEMANA - ' + semana + '/' + ano;

    inc(eline);

    while (qryOspsemana.AsString = semana) and
          (qryospano.asstring = ano) do
    begin
      coluna :=1;

      oSheet.Cells[eline,coluna].ColumnWidth := 10;
      oSheet.Cells[eline,coluna] := qryOspordem.value;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 10;
      oSheet.Cells[eline,coluna] := qryOspnumero.value;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 40;
      oSheet.Cells[eline,coluna] := qryOspnomecliente.asstring;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 15;
      oSheet.Cells[eline,coluna] := qryOsppn.asstring;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 5;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 30;
      oSheet.Cells[eline,coluna] := qryOspprodutovisual.asstring;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 15;
      oSheet.Cells[eline,coluna] := qryOspQuantidade.value;
      oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 15;
      oSheet.Cells[eline,coluna] := qryOspQtdeEntregue.value;
      oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

      inc(coluna);

      oSheet.Cells[eline,coluna].ColumnWidth := 15;
      oSheet.Cells[eline,coluna] := qryOspsaldo.value;
      oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

      somamesano := somamesano + qryOspsaldo.AsCurrency;

      qryOsp.Next;

      inc(eline);

      if qryOsp.eof then
        break;


    end;

    oSheet.Cells[eline,coluna-1].HorizontalAlignment := xlCenter;
    oSheet.Cells[eline,coluna-1].Font.FontStyle := 'Negrito';
    oSheet.Cells[eline,coluna-1] := 'TOTAL';

    oSheet.Cells[eline,coluna].Font.FontStyle := 'Negrito';
    oSheet.Cells[eline,coluna] := somamesano;
      oSheet.Cells[eline,coluna].numberformat := '###.###.##0'; //ParSistema.MascaraQuantidade;

    semana := qryOspsemana.asstring;
    ano := qryOspano.AsString;

    inc(eline);
    inc(eline);

  end;

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



procedure TdtmQuadroProgramacaoSemanal.qryOspCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not qryOSPqtdeentregue.IsNull then
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency -
                              qryOSPqtdeentregue.AsCurrency
  else
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency;
end;

end.
