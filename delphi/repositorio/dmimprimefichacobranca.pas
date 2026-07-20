unit dmimprimefichacobranca;                           

interface

uses
  SysUtils, Classes, dmbasico, FR_DSet, FR_DBSet, FR_Class, DB, ZQuery,
  ZPgSqlQuery, cpquery, fmpreviewpadrao, ZTransact, biblio, StrUtils;

type
  TdtmImprimeFichaCobranca = class(TdtmBasico)
    qryDadosClientes: TtecQuery;
    qryDadosClientescodigo: TIntegerField;
    qryDadosClientesnome: TStringField;
    qryDadosClientesiddocumento: TStringField;
    qryDadosClientesnascto: TDateField;
    qryDadosClientesnomeconceito: TStringField;
    qryDadosClientessexo: TMemoField;
    qryDadosClientesestadocivil: TMemoField;
    qryDadosClientesresidencia_rua_1: TStringField;
    qryDadosClientesestado: TStringField;
    qryDadosClientescep: TIntegerField;
    qryDadosClientesbairroresidencia: TStringField;
    qryDadosClientesempresa: TStringField;
    qryDadosClientesemprego_rua_1: TStringField;
    qryDadosClientesemprendavalor: TFloatField;
    qryDadosClientesempadmissao: TDateField;
    qryDadosClientescargocliente: TStringField;
    qryDadosClientesconnome: TStringField;
    qryDadosClientesconempresa: TStringField;
    qryDadosClientesempregoconjuge_rua_1: TStringField;
    qryDadosClientesconrendavalor: TFloatField;
    qryDadosClientesconadmissao: TDateField;
    qryDadosClientesconnascto: TDateField;
    qryDadosClientescargoconjuge: TStringField;
    qryDadosClientespai: TStringField;
    qryDadosClientesmae: TStringField;
    qryDadosClientesnomecidadenatural: TStringField;
    qryDadosClientesnaturalestado: TStringField;
    qryDadosClientesreferencia: TStringField;
    qryDadosClientestiporeferencia: TMemoField;
    qryDadosClientesobservacoes_1: TMemoField;
    qryDadosClientesobservacoes_2: TMemoField;
    qryDadosClientesobservacoes_3: TMemoField;
    qryDadosClientesobservacoes_4: TMemoField;
    qryDadosClientesobservacoes_5: TMemoField;
    qryDadosClientesspc: TDateField;
    qryContratosFichaCobrancaImprimir: TtecQuery;
    qryContratosFichaCobrancaImprimirnumero: TStringField;
    qryContratosFichaCobrancaImprimircliente: TIntegerField;
    qryContratosFichaCobrancaImprimirdata: TDateField;
    qryContratosFichaCobrancaImprimirvalorprazo: TFloatField;
    qryContratosFichaCobrancaImprimirfilialvenda: TIntegerField;
    qryContratosFichaCobrancaImprimiravalista: TIntegerField;
    qryContratosFichaCobrancaImprimirentestado: TStringField;
    qryContratosFichaCobrancaImprimircidadeentrega: TStringField;
    qryContratosFichaCobrancaImprimirbairroentrega: TStringField;
    qryContratosFichaCobrancaImprimirselecionar: TBooleanField;
    qryContratosFichaCobrancaImprimirnome: TStringField;
    qryContratosFichaCobrancaImprimircidaderesidencia: TStringField;
    qryContratosFichaCobrancaImprimirbairroresidencia: TStringField;
    qryContratosFichaCobrancaImprimirnomeavalista: TStringField;
    qryContratosFichaCobrancaImprimirestadoavalista: TStringField;
    qryContratosFichaCobrancaImprimircidadeavalista: TStringField;
    qryContratosFichaCobrancaImprimirbairroavalista: TStringField;
    qryContratosFichaCobrancaImprimircepentrega: TIntegerField;
    qryContratosFichaCobrancaImprimircepavalista: TIntegerField;
    qryContratosFichaCobrancaImprimirtipocliente: TStringField;
    qryParcelasFichaCobrancaQuitadas: TtecQuery;
    qryParcelasFichaCobrancaQuitadasnumero: TLargeintField;
    qryParcelasFichaCobrancaQuitadasdatavencto: TDateField;
    qryParcelasFichaCobrancaQuitadasvalorvencto: TFloatField;
    qryParcelasFichaCobrancaQuitadasdatapagto: TDateField;
    qryParcelasFichaCobrancaQuitadasvalorpagto: TFloatField;
    qryProdutosFichaCobranca: TtecQuery;
    qryProdutosFichaCobrancaproduto: TLargeintField;
    qryProdutosFichaCobrancadescricao: TStringField;
    qryNotasFichaCobranca: TtecQuery;
    qryNotasFichaCobrancanotafiscal: TIntegerField;
    frpContratosFichaCobrancaImprimir: TfrReport;
    fdsContratosFichaCobranca: TfrDBDataSet;
    fdsParcelasFichaCobrancaQuitadas: TfrDBDataSet;
    fdsProdutosFichaCobranca: TfrDBDataSet;
    qryCuponsFichaCobranca: TtecQuery;
    qryCuponsFichaCobrancacupomfiscal: TIntegerField;
    fdsNotasFichaCobranca: TfrDBDataSet;
    fdsCuponsFichaCobranca: TfrDBDataSet;
    qryDadosClientespessoanumero: TStringField;
    qryContratosFichaCobrancaImprimirfoneentrega: TStringField;
    qryContratosFichaCobrancaImprimirfoneavalista: TStringField;
    qryDadosClientesfone: TStringField;
    qryDadosClientesfone2: TStringField;
    qryDadosClientesfoneempresa: TStringField;
    qryDadosClientesfoneconjuge: TStringField;
    qryDadosClientesfonereferencia: TStringField;
    qryDadosClientescidaderesidencia: TStringField;
    qryParcelasFichaCobrancaVencidas: TtecQuery;
    qryParcelasFichaCobrancaaVencer: TtecQuery;
    qryParcelasFichaCobrancaVencidasnumero: TLargeintField;
    qryParcelasFichaCobrancaVencidasdatavencto: TDateField;
    qryParcelasFichaCobrancaVencidasvalorvencto: TFloatField;
    qryParcelasFichaCobrancaVencidasdatapagto: TDateField;
    qryParcelasFichaCobrancaVencidasvalorpagto: TFloatField;
    qryParcelasFichaCobrancaaVencernumero: TLargeintField;
    qryParcelasFichaCobrancaaVencerdatavencto: TDateField;
    qryParcelasFichaCobrancaaVencervalorvencto: TFloatField;
    qryParcelasFichaCobrancaaVencerdatapagto: TDateField;
    qryParcelasFichaCobrancaaVencervalorpagto: TFloatField;
    fdsParcelasFichaCobrancaVencidas: TfrDBDataSet;
    fdsParcelasFichaCobrancaaVencer: TfrDBDataSet;
    qryProdutosFichaCobrancaquantidade: TFloatField;
    qryDadosClientesrua_residencia: TStringField;
    qryDadosClientesnumero_residencia: TIntegerField;
    qryDadosClientescomplemento_residencia: TStringField;
    qryDadosClientesrua_emprego: TStringField;
    qryDadosClientesnumero_emprego: TIntegerField;
    qryDadosClientescomplemento_emprego: TStringField;
    qryDadosClientesrua_empregoconjuge: TStringField;
    qryDadosClientesnumero_empregoconjuge: TIntegerField;
    qryDadosClientescomplemento_empregoconjuge: TStringField;
    qryContratosFichaCobrancaImprimirrua_entrega: TStringField;
    qryContratosFichaCobrancaImprimirnumero_residencia: TIntegerField;
    qryContratosFichaCobrancaImprimircomplemento_residencia: TStringField;
    qryContratosFichaCobrancaImprimirrua_avalista: TStringField;
    qryContratosFichaCobrancaImprimirnumero_avalista: TIntegerField;
    qryContratosFichaCobrancaImprimircomplemento_avalista: TStringField;
    qryContratosFichaCobrancaImprimirtotalaberto: TFloatField;
    qryContratosFichaCobrancaImprimirentrega_rua_1: TStringField;
    qryContratosFichaCobrancaImprimiravalista_rua_1: TStringField;
    procedure qryContratosFichaCobrancaImprimirAfterScroll(
      DataSet: TDataSet);
    procedure qryDadosClientesCalcFields(DataSet: TDataSet);
    procedure qryContratosFichaCobrancaImprimirCalcFields(
      DataSet: TDataSet);
  public
    procedure ImprimirFichaFinanceira(Contratos: String); overload;
    procedure ImprimirFichaFinanceira(Contratos, Ordenacao, Vencimentos: String); overload;

  end;

var
  dtmImprimeFichaCobranca: TdtmImprimeFichaCobranca;

implementation

{$R *.dfm}

{ TdtmImprimeFichaCobranca }

procedure TdtmImprimeFichaCobranca.ImprimirFichaFinanceira(Contratos: String) overload;
Var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;

begin
  qryContratosFichaCobrancaImprimir.MacroByName('Contratos').AsString:= 'where (t.numero in (' + Contratos + '))';
  qryContratosFichaCobrancaImprimir.Open;
  if not qryContratosFichaCobrancaImprimir.IsEmpty then begin
    frmPreview := TfrmPreviewPadrao.create(self.owner);
    try
//      frpContratosFichaCobrancaImprimir.DesignReport;
      Relatorio := frmPreview.frCompositeReport;
      frmPreview.frCompositeReport.Reports.Clear;
      frmPreview.frCompositeReport.Reports.Add(frpContratosFichaCobrancaImprimir);
      Relatorio.Preview := frmPreview.frPreviewPadrao;
      Relatorio.ShowReport;
      frmPreview.ShowModal;
    finally
      frmPreview.Free
    end;
  end;
end;

procedure TdtmImprimeFichaCobranca.ImprimirFichaFinanceira(Contratos,
  Ordenacao, Vencimentos: String);
Var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;

begin
  qryContratosFichaCobrancaImprimir.MacroByName('Vencimentos').ASString := Vencimentos;
//  qryParcelasFichaCobranca.Sql[21] := Vencimentos;
  qryContratosFichaCobrancaImprimir.MacroByName('Contratos').ASString := 'Where (t.numero in (' + Contratos + '))';
  qryContratosFichaCobrancaImprimir.MacroByName('Ordenacao').ASString := ordenacao;

  qryContratosFichaCobrancaImprimir.Open;
  if not qryContratosFichaCobrancaImprimir.IsEmpty then begin
    frmPreview := TfrmPreviewPadrao.create(self.owner);
    try
      Relatorio := frmPreview.frCompositeReport;
      frmPreview.frCompositeReport.Reports.Clear;
//      frpContratosFichaCobrancaImprimir.DesignReport;
      frmPreview.frCompositeReport.Reports.Add(frpContratosFichaCobrancaImprimir);
      Relatorio.Preview := frmPreview.frPreviewPadrao;
      Relatorio.ShowReport;
      frmPreview.ShowModal;
    finally
      frmPreview.Free
    end;
  end;
end;

procedure TdtmImprimeFichaCobranca.qryContratosFichaCobrancaImprimirAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryDadosClientes,[0,1],[qryContratosFichaCobrancaImprimircliente.AsInteger,
                                        qryContratosFichaCobrancaImprimirtipocliente.AsString]);
  ReFazConsulta(qryParcelasFichaCobrancaQuitadas,[0],[qryContratosFichaCobrancaImprimirnumero.AsString]);
  ReFazConsulta(qryParcelasFichaCobrancaVencidas,[0],[qryContratosFichaCobrancaImprimirnumero.AsString]);
  ReFazConsulta(qryParcelasFichaCobrancaaVencer,[0],[qryContratosFichaCobrancaImprimirnumero.AsString]);
  ReFazConsulta(qryProdutosFichaCobranca,[0],[qryContratosFichaCobrancaImprimirnumero.AsString]);
  RefazConsulta(qryNotasFichaCobranca,   [0],[qryContratosFichaCobrancaImprimirnumero.AsVariant]);
  RefazConsulta(qryCuponsFichaCobranca,  [0],[qryContratosFichaCobrancaImprimirnumero.AsVariant]);
  //c
end;

procedure TdtmImprimeFichaCobranca.qryDadosClientesCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  qryDadosClientesresidencia_rua_1.asstring :=
    qryDadosClientesrua_residencia.asstring +
     ifthen(qryDadosClientesnumero_residencia.AsString<>'', ', ' +
            qryDadosClientesnumero_residencia.AsString,'') +
     ifthen(qryDadosClientescomplemento_residencia.AsString<>'', ' ' +
            qryDadosClientescomplemento_residencia.AsString,'');

  qryDadosClientesemprego_rua_1.asstring :=
    qryDadosClientesrua_emprego.asstring +
     ifthen(qryDadosClientesnumero_emprego.AsString<>'', ', ' +
            qryDadosClientesnumero_emprego.AsString,'') +
     ifthen(qryDadosClientescomplemento_emprego.AsString<>'', ' ' +
            qryDadosClientescomplemento_emprego.AsString,'');

  qryDadosClientesempregoconjuge_rua_1.asstring :=
    qryDadosClientesrua_empregoconjuge.asstring +
    ifthen(qryDadosClientesnumero_empregoconjuge.AsString<>'', ', ' +
           qryDadosClientesnumero_empregoconjuge.AsString,'') +
    ifthen(qryDadosClientescomplemento_empregoconjuge.AsString<>'', ' ' +
           qryDadosClientescomplemento_empregoconjuge.AsString,'');
end;

procedure TdtmImprimeFichaCobranca.qryContratosFichaCobrancaImprimirCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  qryContratosFichaCobrancaImprimirentrega_rua_1.asstring :=
    qryContratosFichaCobrancaImprimirrua_entrega.asstring +
     ifthen(qryContratosFichaCobrancaImprimirnumero_residencia.AsString<>'', ', ' +
            qryContratosFichaCobrancaImprimirnumero_residencia.AsString,'') +
     ifthen(qryContratosFichaCobrancaImprimircomplemento_residencia.AsString<>'', ' ' +
            qryContratosFichaCobrancaImprimircomplemento_residencia.AsString,'');

  qryContratosFichaCobrancaImprimiravalista_rua_1.asstring :=
    qryContratosFichaCobrancaImprimirrua_avalista.asstring +
     ifthen(qryContratosFichaCobrancaImprimirnumero_avalista.AsString<>'', ', ' +
            qryContratosFichaCobrancaImprimirnumero_avalista.AsString,'') +
     ifthen(qryContratosFichaCobrancaImprimircomplemento_avalista.AsString<>'', ' ' +
            qryContratosFichaCobrancaImprimircomplemento_avalista.AsString,'');
            

end;

end.
