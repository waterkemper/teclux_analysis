unit fmImprimirPNs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls, dmtecsoft,
  DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource, Grids, DBGrids, cpdbgrid,
  ExcelExport, biblio, StdCtrls;

type
  TfrmImprimirPNs = class(TFrmRelatorioPadrao)
    qryImprimirPNs: TtecQuery;
    qryImprimirPNspn: TStringField;
    qryImprimirPNsorigem: TStringField;
    qryImprimirPNsrevisao: TStringField;
    qryImprimirPNscodigovisual: TStringField;
    qryImprimirPNscliente: TStringField;
    qryImprimirPNsproduto_cliente: TStringField;
    qryImprimirPNsfluxograma: TIntegerField;
    tecDBGrid1: TtecDBGrid;
    dsrImprimirPNs: TtecDataSource;
    ExcelExport1: TExcelExport;
    qryImprimirPNsfinalidade: TStringField;
    qryImprimirPNsdescricaoproduto: TStringField;
    cbbOpcao: TComboBox;
    GroupBox1: TGroupBox;
    qryImprimirPNsinativo: TDateField;
    gbxSelecionar: TGroupBox;
    procedure qryImprimirPNsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cbbOpcaoSelect(Sender: TObject);
  private
    { Private declarations }
     procedure InternoImpressao; override;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;

  end;

var
  frmImprimirPNs: TfrmImprimirPNs;

implementation

{$R *.dfm}

{ TfrmImprimirPNs }

constructor TfrmImprimirPNs.Create(Aowner: Tcomponent);
begin
  inherited;
  qryImprimirPNs.Open;
end;

destructor TfrmImprimirPNs.Destroy;
begin
  inherited;
  frmImprimirPNs:= nil;

end;

procedure TfrmImprimirPNs.InternoImpressao;
var
  vRegistroAtual : TbookMark;
begin
  inherited;
  vRegistroAtual := qryImprimirPNs.GetBookmark;
  qryImprimirPNs.DisableControls;
  ExcelExport1.ExportDataset;
  qryImprimirPNs.GotoBookmark(vRegistroAtual);
  qryImprimirPNs.FreeBookmark(vRegistroAtual);
  qryImprimirPNs.EnableControls;



end;

procedure TfrmImprimirPNs.qryImprimirPNsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if cbbOpcao.Text = 'ATIVOS' then
    Accept := qryImprimirPNsinativo.IsNull or (qryImprimirPNsinativo.AsDateTime > date)
  else
  if cbbOpcao.Text = 'INATIVOS' then
    Accept := not qryImprimirPNsinativo.IsNull and (qryImprimirPNsinativo.AsDateTime <= date)
  else
    Accept := true;

end;

procedure TfrmImprimirPNs.cbbOpcaoSelect(Sender: TObject);
begin
  inherited;
  qryImprimirPNs.First;
end;

end.
