unit dmrelatorioparcelasatraso;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_class, fr_dset, fr_dbset, fmpreviewpadrao,
  ZTransact;

type
  Tdtmrelatorioparcelasatraso = class(TDtmBasico)
    qryParcelas: TtecQuery;
    dsrParcelas: TtecDataSource;
    fdsParcelas: TfrDBDataSet;
    frpRelatorio: TfrReport;
    qryParcelascontrato: TIntegerField;
    qryParcelasate30dias: TFloatField;
    qryParcelasate60dias: TFloatField;
    qryParcelasate90dias: TFloatField;
    qryParcelasate120dias: TFloatField;
    qryParcelasate150dias: TFloatField;
    qryParcelasate180dias: TFloatField;
    qryParcelasmais180dias: TFloatField;
    qryParcelasnomeempreendimento: TStringField;
    qryParcelascliente: TIntegerField;
    qryParcelasnomecliente: TStringField;
    qryParcelasempreendimento: TIntegerField;
    frpRelatorioResumo: TfrReport;
    procedure frpRelatorioBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryParcelasBeforeOpen(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpRelatorioResumoBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    FCliente: Integer;
    FEmpreendimento: Integer;
{    FDataInicial: TDateTime;
    FDataFinal: TDateTime;}
    FDataBase: TDateTime;
    FNomeCliente: String;
    FNomeEmpreendimento: String;
    FTipoRelatorio: integer;
    { Private declarations }
  protected
{    procedure AtribuirPeriodo;}
  public
    { Public declarations }
{    property DataInicial : TDateTime read FDataInicial write FDataInicial;
    property DataFinal : TDateTime read FDataFinal write FDataFinal;}
    property DataBase  : TDateTime read FDataBase write FDataBase;
    property Empreendimento : Integer read FEmpreendimento write FEmpreendimento;
    property NomeEmpreendimento : String read FNomeEmpreendimento write FNomeEmpreendimento;
    property Cliente : Integer read FCliente write FCliente;
    property NomeCliente : String read FNomeCliente write FNomeCliente;
    property TipoRelatorio: integer read FTipoRelatorio write FTipoRelatorio;

    procedure ImprimirRelatorio;
  end;

var
  dtmrelatorioparcelasatraso: Tdtmrelatorioparcelasatraso;

implementation

{$R *.dfm}

{ Tdtmrelatorioparcelasatraso }


{ Tdtmrelatorioparcelasatraso }

procedure Tdtmrelatorioparcelasatraso.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
{  PeriodoRel,} ClienteRel, EmpRel : String;
begin

  qryParcelas.ParamByName('DataBase').AsString:= QuotedStr(FormatDateTime('yyyy-mm-dd',FDataBase));

  if FEmpreendimento > 0 then
    qryParcelas.MacroByName('Empreendimento').AsString := 'and vi.empreendimento = '+ IntToStr(FEmpreendimento)
  else
    qryParcelas.MacroByName('Empreendimento').AsString := '';

  if FCliente > 0 then
    qryParcelas.MacroByName('Cliente').AsString := 'AND (SELECT co.Cliente FROM Compradores co WHERE co.Contrato = vi.Contrato AND co.Principal) = '+ IntToStr(FCliente)
  else
    qryParcelas.MacroByName('Cliente').AsString := '';

  qryParcelas.Open;

  AtribuirParametrosBaseRelatorio;
  frVariables['Titulo']:= 'PARCELAS EM ATRASO EM '+ FormatDateTime('DD/MM/YYYY',FDataBase);

{  PeriodoRel  := 'PERÍODO '+DateToStr(FDataInicial)+' ATÉ '+ DateToStr(FDataFinal)+sLineBreak;}
  if FCliente > 0 then
    ClienteRel  := 'CLIENTE '+inttostr(FCliente)+' - '+ FNomeCliente + sLineBreak;
  if FEmpreendimento > 0  then
    EmpRel      := 'EMPREENDIMENTO '+ inttostr(FEmpreendimento)+' - '+FNomeEmpreendimento + sLineBreak;
  frVariables['Outras']:= {PeriodoRel +} ClienteRel + EmpRel;
  //frpRelatorio.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do
    begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.DoublePass:= True;

      case TipoRelatorio of
      0: begin
           frCompositeReport.Reports.Add(frpRelatorio);
           frCompositeReport.Reports.Add(frpRelatorioResumo);
         end;
      1: frCompositeReport.Reports.Add(frpRelatorioResumo);
      2: frCompositeReport.Reports.Add(frpRelatorio);
      end;
      Relatorio.Preview := frmPreview.frPreviewPadrao;
      Relatorio.ShowReport;
      frmPreview.ShowModal;
    end;
  finally
    frmPreview.Free;
    QRYPARCELAS.Close;
  end;
end;

procedure Tdtmrelatorioparcelasatraso.frpRelatorioBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorio, View);
end;

procedure Tdtmrelatorioparcelasatraso.qryParcelasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
{  AtribuirPeriodo;}
end;

{
procedure Tdtmrelatorioparcelasatraso.AtribuirPeriodo;
begin
  qryParcelas.ParamByName('DataInicial').AsString := QuotedStr(FormatDateTime('yyyy-mm-dd',FDataInicial));
  qryParcelas.ParamByName('DataFinal').AsString   := QuotedStr(FormatDateTime('yyyy-mm-dd',FDataFinal));
end;
}

procedure Tdtmrelatorioparcelasatraso.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
  Listar : TStringList;
  Arquivo: String;
begin
  inherited;
  Listar := TStringList.Create;
  Arquivo := 'C:\Lixo\parcelasatraso.sql';
  if FileExists(Arquivo) then
    Listar.LoadFromFile(Arquivo);
  Listar.Add('');
  Listar.Add(Sql);
  Listar.Add(Result);
  listar.SaveToFile(Arquivo);
  listar.Free;
end;

procedure Tdtmrelatorioparcelasatraso.frpRelatorioResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioResumo,View);
end;

end.
