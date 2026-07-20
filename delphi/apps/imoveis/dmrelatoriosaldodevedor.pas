unit dmrelatoriosaldodevedor;

interface

uses
  SysUtils, Classes, dmbasico, fr_class, fr_dset, fr_dbset, DB,
  cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  biblio, clparametrossistema, fmpreviewpadrao, ZTransact;

type
  Tdtmrelatoriosaldodevedor = class(TdtmBasico)
    qryRelatorioporEmp: TtecQuery;
    dsrRelatorioporEmp: TtecDataSource;
    fdsEmp: TfrDBDataSet;
    frpRelatorioEmp: TfrReport;
    qryRelatorioporEmpcontrato: TIntegerField;
    qryRelatorioporEmpempreendimento: TIntegerField;
    qryRelatorioporEmpnomeempreendimento: TStringField;
    qryRelatorioporEmpimovelnumero: TStringField;
    qryRelatorioporEmpimovelbloco: TStringField;
    qryRelatorioporEmpcliente: TIntegerField;
    qryRelatorioporEmpnomecliente: TStringField;
    qryRelatorioporEmpvalorhistorico: TFloatField;
    qryRelatorioporEmpcorrecao: TFloatField;
    qryRelatorioporEmpjuros: TFloatField;
    procedure qryRelatorioporEmpBeforeOpen(DataSet: TDataSet);
    procedure frpRelatorioEmpBeforePrint(Memo: TStringList; View: TfrView);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FEmpreendimento: Integer;
    FData: TDateTime;
    { Private declarations }
  public
    property Data : TDateTime read FData write FData;
    property Empreendimento : Integer read FEmpreendimento write FEmpreendimento;

    procedure ImprimirRelatorio;
    { Public declarations }
  end;

var
  dtmrelatoriosaldodevedor: Tdtmrelatoriosaldodevedor;

implementation

{$R *.dfm}

{ Tdtmrelatoriosaldodevedor }

procedure Tdtmrelatoriosaldodevedor.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  ShowProcessando('Criando Relatório');
  qryRelatorioporEmp.Close;
  qryRelatorioporEmp.Open;
  AtribuirParametrosBaseRelatorio;
  frVariables['Titulo']:= 'SALDOS DEVEDORES EM '+FormatDateTime('DD/MM/YYYY',FData);
  frVariables['FDATA']:= FormatDateTime('DD/MM/YYYY',FData);
  //frpRelatorioEmp.DesignReport;
  ShowProcessando;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
     frCompositeReport.Reports.Clear;
     frCompositeReport.DoublePass:= True;
     frCompositeReport.Reports.Add(frpRelatorioEmp);
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
   end;
  finally
   frmPreview.Free
  end;

end;

procedure Tdtmrelatoriosaldodevedor.qryRelatorioporEmpBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryRelatorioporEmp.ParamByName('Data').AsDateTime:= FData;
  if FEmpreendimento > 0 then
    qryRelatorioporEmp.MacroByName('WhereEmpreendimento').AsString:= 'AND ep.Codigo = '+IntToStr(FEmpreendimento)
  else
    qryRelatorioporEmp.MacroByName('WhereEmpreendimento').AsString:= '';
end;

procedure Tdtmrelatoriosaldodevedor.frpRelatorioEmpBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioEmp, View);
end;

procedure Tdtmrelatoriosaldodevedor.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
  Listar : TStringList;
  Arquivo: String;
begin
  inherited;
  Listar := TStringList.Create;
  Arquivo := 'C:\Lixo\SaldosDevedores.sql';
  if FileExists(Arquivo) then
    Listar.LoadFromFile(Arquivo);
  Listar.Add('');
  Listar.Add(Sql);
  Listar.Add(Result);
  listar.SaveToFile(Arquivo);
  listar.Free;
end;

end.
