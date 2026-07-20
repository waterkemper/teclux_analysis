unit dmespelhocarne;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, FR_DSet,
  FR_DBSet, FR_Class, fmpreviewpadrao;

type
  TdtmEspelhoCarne = class(TdtmBasico)
    frpEspelhoCarnes: TfrReport;
    fdsContratosParcelas: TfrDBDataSet;
    qryContratosParcelas: TtecQuery;
    qryContratosParcelascliente: TIntegerField;
    qryContratosParcelasnome: TStringField;
    qryContratosParcelasfaturamento: TDateField;
    qryContratosParcelasnumero: TStringField;
    qryParcelas: TtecQuery;
    qryParcelasnumero: TIntegerField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelasdatapagto: TDateField;
    qryParcelasvalorpagto: TFloatField;
    qryParcelasparcelaorigem: TStringField;
    fdsParcelas: TfrDBDataSet;
    procedure frpEspelhoCarnesBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryContratosParcelasAfterScroll(DataSet: TDataSet);
  private
    FImprimindo: Boolean;
    FSubTitulo: String;
    procedure ImprimirRelatorio(Filial, FilialNome, Agente, AgenteNome,
                                DataInicial, DataFinal: String);
    { Private declarations }
  public
    function GerarEspelho(Filial, FilialNome, Agente, AgenteNome,
                          DataInicial, DataFinal: String;
                          Carnes: Integer): Boolean;
    { Public declarations }
  end;

var
  dtmEspelhoCarne: TdtmEspelhoCarne;

implementation

{$R *.dfm}

{ TdtmEspelhoCarne }

function TdtmEspelhoCarne.GerarEspelho(Filial, FilialNome, Agente, AgenteNome,
        DataInicial, DataFinal: String; Carnes: Integer): Boolean;
begin
  if Filial <> '' then
    qryContratosParcelas.MacroByName('FILIAL').AsString := 'AND c.filialvenda = ' + Filial
  else
    qryContratosParcelas.MacroByName('FILIAL').AsString := '';

  if Agente <> '' then
    qryContratosParcelas.MacroByName('AGENTE').AsString := 'AND c.agente = ' + Agente
  else
    qryContratosParcelas.MacroByName('AGENTE').AsString := '';

  qryContratosParcelas.MacroByName('PERIODO').AsString  := 'AND (c.faturamento between (''' + DataInicial + ''') and (''' + DataFinal + '''))';

  if Carnes = 0 then
  begin
    qryContratosParcelas.MacroByName('CARNES').AsString := '';
    qryParcelas.MacroByName('QUITADOS').AsString := '';
  end
  else
  begin
    qryContratosParcelas.MacroByName('CARNES').AsString := 'AND EXISTS (SELECT p.numero FROM parcelas p WHERE p.contrato = c.numero AND p.datapagto IS NULL)';
    qryParcelas.MacroByName('QUITADOS').AsString := 'AND p.datapagto IS NULL';
  end;

  if qryContratosParcelas.Active then
    qryContratosParcelas.Close;
  qryContratosParcelas.Open;

  Result := not qryContratosParcelas.IsEmpty;

  if Result then
    ImprimirRelatorio(Filial, FilialNome, Agente, AgenteNome, DataInicial, DataFinal);
end;

procedure TdtmEspelhoCarne.ImprimirRelatorio(Filial, FilialNome, Agente,
  AgenteNome, DataInicial,  DataFinal: String);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  FImprimindo := True;
  frVariables['titulo']:= 'EMISSÃO DE IMAGENS DE CARNÊS';
  FSubTitulo := 'FILIAL : ' + Filial + ' - ' + FilialNome;
  if Agente <> '' then
    FSubTitulo := FSubTitulo + #13#10 + 'AGENTE : ' + Agente + ' - ' + AgenteNome;
  FSubTitulo := FSubTitulo + #13#10 + 'PERÍODO : ' + DataInicial + ' À ' + DataFinal;
  frVariables['subtitulo']:= FSubTitulo;
//  frpEspelhoCarnes.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3;
  try
   Relatorio := frmPreview.frCompositeReport;
   frmPreview.frCompositeReport.Reports.Clear;
   frmPreview.frCompositeReport.Reports.Add(frpEspelhoCarnes);
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free;
   FImprimindo := False;
  end;
end;

procedure TdtmEspelhoCarne.frpEspelhoCarnesBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpEspelhoCarnes,View);
end;

procedure TdtmEspelhoCarne.qryContratosParcelasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if FImprimindo then
    RefazConsulta(qryParcelas,[0],[qryContratosParcelasnumero.AsVariant]);
end;

end.
