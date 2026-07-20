unit dmrelatoriorecebimentoslongoprazo;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, fr_class, fr_dset, fr_dbset, fmpreviewpadrao,
  ZTransact;

type
  Tdtmrelatoriorecebimentoslongoprazo = class(TDtmBasico)
    qryParcelas: TtecQuery;
    dsrParcelas: TtecDataSource;
    qryParcelascontrato: TIntegerField;
    qryParcelasnomecliente: TStringField;
    qryParcelasvalorhistorico: TFloatField;
    qryParcelascorrecao: TFloatField;
    qryParcelasjuros: TFloatField;
    qryParcelastotal: TFloatField;
    fdsParcelas: TfrDBDataSet;
    frpRelatorio: TfrReport;
    qryParcelasempreendimento: TIntegerField;
    frpRelatorioResumo: TfrReport;
    qryParcelascliente: TIntegerField;
    qryParcelasnomeempreendimento: TStringField;
    procedure frpRelatorioBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryParcelasBeforeOpen(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpRelatorioResumoBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    FSoEmpreendimento: Boolean;
    FCliente: Integer;
    FEmpreendimento: Integer;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FDataBase: TDateTime;
    FNomeCliente: String;
    FNomeEmpreendimento: String;
    { Private declarations }
  protected
    procedure AtribuirPeriodo;
  public
    { Public declarations }
    property DataInicial : TDateTime read FDataInicial write FDataInicial;
    property DataFinal : TDateTime read FDataFinal write FDataFinal;
    property DataBase  : TDateTime read FDataBase write FDataBase;
    property Empreendimento : Integer read FEmpreendimento write FEmpreendimento;
    property NomeEmpreendimento : String read FNomeEmpreendimento write FNomeEmpreendimento;
    property Cliente : Integer read FCliente write FCliente;
    property NomeCliente : String read FNomeCliente write FNomeCliente;
    property SoEmpreendimento : Boolean read FSoEmpreendimento write FSoEmpreendimento;

    procedure ImprimirRelatorio;
  end;

var
  dtmrelatoriorecebimentoslongoprazo: Tdtmrelatoriorecebimentoslongoprazo;

implementation

{$R *.dfm}

{ Tdtmrelatoriorecebimentoslongoprazo }


{ Tdtmrelatoriorecebimentoslongoprazo }

procedure Tdtmrelatoriorecebimentoslongoprazo.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  PeriodoRel, ClienteRel, EmpRel : String;
begin
  qryParcelas.Close;
  qryParcelas.Open;
  AtribuirParametrosBaseRelatorio;
  frVariables['Titulo']:= 'RECEBIMENTOS A LONGO PRAZO EM '+ FormatDateTime('DD/MM/YYYY',FDataBase);
  PeriodoRel  := 'PERÍODO '+DateToStr(FDataInicial)+' ATÉ '+ DateToStr(FDataFinal)+sLineBreak;
  if FCliente > 0 then
    ClienteRel  := 'CLIENTE '+inttostr(FCliente)+' - '+ FNomeCliente + sLineBreak;
  if FEmpreendimento > 0  then
    EmpRel      := 'EMPREENDIMENTO '+ inttostr(FEmpreendimento)+' - '+FNomeEmpreendimento + sLineBreak;
  frVariables['Outras']:= PeriodoRel + ClienteRel + EmpRel;
  //frpRelatorio.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do
    begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.DoublePass:= True;
      if FSoEmpreendimento then
        frCompositeReport.Reports.Add(frpRelatorioResumo)
      else
        frCompositeReport.Reports.Add(frpRelatorio);
      Relatorio.Preview := frmPreview.frPreviewPadrao;
      Relatorio.ShowReport;
      frmPreview.ShowModal;
    end;
  finally
    frmPreview.Free
  end;
end;

procedure Tdtmrelatoriorecebimentoslongoprazo.frpRelatorioBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorio, View);
end;

procedure Tdtmrelatoriorecebimentoslongoprazo.qryParcelasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AtribuirPeriodo;
  qryParcelas.ParamByName('DataBaseParcela').AsString:= QuotedStr(FormatDateTime('yyyy-mm-dd',FDataBase));
  if FEmpreendimento > 0 then
    qryParcelas.MacroByName('Empreendimento').AsString := 'WHERE empreendimento = '+ IntToStr(FEmpreendimento)
  else
    qryParcelas.MacroByName('Empreendimento').AsString := '';
  if FCliente > 0 then
  begin
    if FEmpreendimento > 0 then
      qryParcelas.MacroByName('Cliente').AsString := 'AND Cliente = '+ IntToStr(FCliente)
    else
      qryParcelas.MacroByName('Cliente').AsString := 'WHERE Cliente = '+ IntToStr(FCliente);
  end
  else
    qryParcelas.MacroByName('Cliente').AsString := '';
end;

procedure Tdtmrelatoriorecebimentoslongoprazo.AtribuirPeriodo;
begin
  qryParcelas.ParamByName('DataInicial').AsString := QuotedStr(FormatDateTime('yyyy-mm-dd',FDataInicial));
  qryParcelas.ParamByName('DataFinal').AsString   := QuotedStr(FormatDateTime('yyyy-mm-dd',FDataFinal));
end;

procedure Tdtmrelatoriorecebimentoslongoprazo.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
  Listar : TStringList;
  Arquivo: String;
begin
  inherited;
  Listar := TStringList.Create;
  Arquivo := 'C:\Lixo\RecebimentosLongoPrazo.sql';
  if FileExists(Arquivo) then
    Listar.LoadFromFile(Arquivo);
  Listar.Add('');
  Listar.Add(Sql);
  Listar.Add(Result);
  listar.SaveToFile(Arquivo);
  listar.Free;
end;

procedure Tdtmrelatoriorecebimentoslongoprazo.frpRelatorioResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioResumo,View);
end;

end.
