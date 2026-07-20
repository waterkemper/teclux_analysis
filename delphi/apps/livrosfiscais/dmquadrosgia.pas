unit dmquadrosgia;

interface

uses
  //CLX
  SysUtils, Classes, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Repositorio
  dmtecsoft, dmbasico,
  //Biblio
  ctconstantes,
  //Componentes
  cpquery, cpdatasource, ZTransact;

type
  TdtmQuadrosGIA = class(TdtmBasico)
    qryProcuraFilial: TtecQuery;
    qryProcuraFilialcodigo: TIntegerField;
    qryProcuraFilialnome: TStringField;
    dsrProcuraFilial: TtecDataSource;
    qryQuadrosGIA: TtecQuery;
    qryquadrosgiafilial: TIntegerField;
    qryQuadrosGIAperiodo: TStringField;
    qryQuadrosGIAfaturamento: TFloatField;
    qryQuadrosGIAqtdadeempregados: TIntegerField;
    qryQuadrosGIAacrescimofinanceiro: TFloatField;
    qryQuadrosGIAdespesamensalpessoal: TFloatField;
    qryQuadrosGIAdebdiferencialaliquota: TFloatField;
    qryQuadrosGIAdebtransferencia: TFloatField;
    qryQuadrosGIAdebestornocredito: TFloatField;
    qryQuadrosGIAdebestornoativoimobilizado: TFloatField;
    qryQuadrosGIAoutrosdebitos: TFloatField;
    qryQuadrosGIAdebapuracaoconsolidada: TFloatField;
    qryQuadrosGIAcreddifaliquotaativoimobil: TFloatField;
    qryQuadrosGIAcreddifaliquotamaterialconsumo: TFloatField;
    qryQuadrosGIAcredtransferencia: TFloatField;
    qryQuadrosGIAcredpresumidos: TFloatField;
    qryQuadrosGIAcredincetivosfiscais: TFloatField;
    qryQuadrosGIAcredpagtoocasiaofatogerador: TFloatField;
    qryQuadrosGIAoutroscreditos: TFloatField;
    qryQuadrosGIAcredapuracaoconsolidada: TFloatField;
    qryQuadrosGIAsubstbasecalculo: TFloatField;
    qryQuadrosGIAsubstimpostoretido: TFloatField;
    qryQuadrosGIAsubstcreditos: TFloatField;
    qryQuadrosGIAsubstressarcimentoicms: TFloatField;
    qryQuadrosGIAimpostorecolher: TFloatField;
    qryQuadrosGIAtotaldebitos: TFloatField;
    qryQuadrosGIAtotalcreditos: TFloatField;
    qryQuadrosGIAsubtotaldebitos: TFloatField;
    qryQuadrosGIAsubtotalcreditos: TFloatField;
    dsrQuadrosGIA: TtecDataSource;
    qryImpostosPagar: TtecQuery;
    qryImpostosPagarfilial: TIntegerField;
    qryImpostosPagarreceitatributaria: TIntegerField;
    qryImpostosPagarvencto: TDateField;
    qryImpostosPagarvalor: TFloatField;
    qryImpostosPagarclassepagto: TIntegerField;
    dsrImpostosPagar: TtecDataSource;
    qrySaidas: TtecQuery;
    dsrSaidas: TtecDataSource;
    qryEntradas: TtecQuery;
    qryEntradascodigofiscal: TIntegerField;
    qryEntradasvalorcontabil: TFloatField;
    qryEntradasbase: TFloatField;
    qryEntradasisentas: TFloatField;
    qryEntradasoutras: TFloatField;
    qryEntradasvalor: TFloatField;
    dsrEntradas: TtecDataSource;
    qryTotaisSaidas: TtecQuery;
    dsrTotaisSaidas: TtecDataSource;
    qryTotalEntradas: TtecQuery;
    qryTotalEntradasvalorcontabil: TFloatField;
    qryTotalEntradasbase: TFloatField;
    qryTotalEntradasisentas: TFloatField;
    qryTotalEntradasoutras: TFloatField;
    qryTotalEntradasvalor: TFloatField;
    dsrTotalEntradas: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qrySaldoMesAnterior: TtecQuery;
    dsrSaldoMesAnterior: TtecDataSource;
    qryQuadrosGIAsaldocredoparaperiodoseguinte: TFloatField;
    qryImpostosPagardescricaoreceitatributaria: TStringField;
    qryImpostosPagardescricaoclassepagto: TStringField;
    qryQuadrosGIAsubstsaldocredorperiodosequinte: TFloatField;
    qryQuadrosGIAdebitopelassaidas: TFloatField;
    qryProcuraFilialregime: TIntegerField;
    qryCodigosComplementares: TtecQuery;
    qryCodigosComplementarescodigo: TIntegerField;
    qryCodigosComplementaresdescricao: TStringField;
    dsrCodigosComplementares: TtecDataSource;
    qryComplementares: TtecQuery;
    qryComplementaresfilial: TIntegerField;
    qryComplementaresperiodo: TStringField;
    qryComplementarescodigo: TIntegerField;
    qryComplementaresvalor: TFloatField;
    qryCodigosComplementaresvalor: TFloatField;
    qryQuadrosGIAsubstsubsaldocredor: TFloatField;
    qryQuadrosGIAsubstsubsaldodebitos: TFloatField;
    qryQuadrosGIAsubstimpostorecolher: TFloatField;
    qryQuadrosGIAsubsttotaldebitos: TFloatField;
    qryQuadrosGIAsubsttotalcreditos: TFloatField;
    qryConsultaReceitasTributarias: TtecQuery;
    qryConsultaReceitasTributariascodigo: TIntegerField;
    qryConsultaReceitasTributariasdescricao: TStringField;
    qryProcuraReceitasTributarias: TtecQuery;
    qryProcuraReceitasTributariascodigo: TIntegerField;
    qryProcuraReceitasTributariasdescricao: TStringField;
    dsrProcuraReceitasTributarias: TtecDataSource;
    qryConsultaClassesPagto: TtecQuery;
    qryConsultaClassesPagtodescricao: TStringField;
    qryConsultaClassesPagtocodigo: TIntegerField;
    qryProcuraClassePagto: TtecQuery;
    qryProcuraClassePagtocodigo: TIntegerField;
    qryProcuraClassePagtodescricao: TStringField;
    dsrProcuraClassePagto: TtecDataSource;
    qryImpostosPagarperiodo: TStringField;
    qryConsultaQuadroGia: TtecQuery;
    qryQuadrosGIAobservacao: TStringField;
    qrySaidascodigofiscal: TIntegerField;
    qrySaidasvalorcontabil: TFloatField;
    qrySaidasbase: TFloatField;
    qrySaidasvalor: TFloatField;
    qrySaidasisentas: TFloatField;
    qrySaidasoutras: TFloatField;
    qryTotaisSaidasvalorcontabil: TFloatField;
    qryTotaisSaidasbase: TFloatField;
    qryTotaisSaidasvalor: TFloatField;
    qryTotaisSaidasisentas: TFloatField;
    qryTotaisSaidasoutras: TFloatField;
    qrySaldoMesAnteriorfilial: TIntegerField;
    qrySaldoMesAnteriordebdiferencialaliquota: TFloatField;
    qrySaldoMesAnteriordebtransferencia: TFloatField;
    qrySaldoMesAnteriordebestornocredito: TFloatField;
    qrySaldoMesAnteriordebestornoativoimobilizado: TFloatField;
    qrySaldoMesAnterioroutrosdebitos: TFloatField;
    qrySaldoMesAnteriordebapuracaoconsolidada: TFloatField;
    qrySaldoMesAnteriorcreddifaliquotaativoimobil: TFloatField;
    qrySaldoMesAnteriorcreddifaliquotamaterialconsumo: TFloatField;
    qrySaldoMesAnteriorcredtransferencia: TFloatField;
    qrySaldoMesAnteriorcredpresumidos: TFloatField;
    qrySaldoMesAnteriorcredincetivosfiscais: TFloatField;
    qrySaldoMesAnteriorcredpagtoocasiaofatogerador: TFloatField;
    qrySaldoMesAnteriorcredapuracaoconsolidada: TFloatField;
    qrySaldoMesAnterioroutroscreditos: TFloatField;
    qrySaldoMesAnteriorsubstbasecalculo: TFloatField;
    qrySaldoMesAnteriorsubstimpostoretido: TFloatField;
    qrySaldoMesAnteriorsubstcreditos: TFloatField;
    qrySaldoMesAnteriorsubstressarcimentoicms: TFloatField;
    qrySaldoMesAnteriordebitospelasaida: TFloatField;
    qrySaldoMesAnteriorcreditopelasentradas: TFloatField;
    qrySaldoMesAnteriorsaldoperiodoanterior: TCurrencyField;
    qrySaldoMesAnteriorsubstsaldoperiodoanterior: TCurrencyField;
    qryConsultaQuadroGiafilial: TIntegerField;
    qryConsultaQuadroGianomefilial: TStringField;
    qryConsultaQuadroGiaperiodo: TStringField;
    qryQuadrosGIAnumeroguia1: TStringField;
    qryQuadrosGIAdataguia1: TDateField;
    qryQuadrosGIAvalorguia1: TFloatField;
    qryQuadrosGIAorgaoguia1: TStringField;
    qryQuadrosGIAnumeroguia2: TStringField;
    qryQuadrosGIAdataguia2: TDateField;
    qryQuadrosGIAvalorguia2: TFloatField;
    qryQuadrosGIAorgaoguia2: TStringField;
    qryQuadrosGIAnumeroguia3: TStringField;
    qryQuadrosGIAdataguia3: TDateField;
    qryQuadrosGIAvalorguia3: TFloatField;
    qryQuadrosGIAorgaoguia3: TStringField;
    qryQuadrosGIAnumeroguia4: TStringField;
    qryQuadrosGIAdataguia4: TDateField;
    qryQuadrosGIAvalorguia4: TFloatField;
    qryQuadrosGIAorgaoguia4: TStringField;
    procedure qryQuadrosGIACalcFields(DataSet: TDataSet);
    procedure qryQuadrosGIAAfterScroll(DataSet: TDataSet);
    procedure qrySaldoMesAnteriorCalcFields(DataSet: TDataSet);
    procedure qryCodigosComplementaresBeforeEdit(DataSet: TDataSet);
    procedure qryCodigosComplementaresCancel(DataSet: TDataSet);
    procedure dsrCodigosComplementaresDataChange(Sender: TObject;  Field: TField);
    procedure qryImpostosPagarNewRecord(DataSet: TDataSet);
    procedure qryQuadrosGIABeforeClose(DataSet: TDataSet);
    procedure dsrImpostosPagarDataChange(Sender: TObject; Field: TField);
  private
    function getTabelaConsultaQuadroGIA: TZDataset;
    procedure SetQuadrosGIAFilial(const Value: integer);
    function getTabelaConsultaFilial: TZDataset;
  protected
    function getImpostoPagar: Real;
    function GetTabelaConsultaClassesPagto: TZDataSet;
    function GetTabelaConsultaReceitasTributarias: TZDataSet;
    function getTabelaImpostoPagar: TZDataset;
    function getTabelaQuadroGIA: TZDataset;
  public
    procedure AbrirTabelasConsulta(Tabela: TtecTabelasGIA);
    procedure CalcularSaldoAnterior;
    function  CancelarQuadrosGIA: Boolean;
    constructor Create(AOwner: TComponent); override;
    function  ExcluirImpostoPagar: Boolean;
    function  ExcluirQuadroGIA: Boolean;
    function  ExisteClassesPagto(campo, codigo: String): Boolean;
    function  ExisteQuadroGIA(campo, codigo: String): Boolean;
    function  ExisteReceitasTributarias(campo, codigo: String): Boolean;
    procedure FecharTabelasConsulta(Tabela: TtecTabelasGIA);
    function  GravarImpostoPagar: Boolean;
    function  GravarQuadroGIA: Boolean;
    function  IncluirEditarImpostoPagar(Incluir: Boolean): Boolean;
    function  IncluirQuadroGIA: Boolean;
    procedure Selecionar(Tabela: TtecTabelasGIA);
    procedure SelecionarEntradasSaidas;
    procedure SelecionarQuadrosGIA;
    procedure SelecionarFilial;
    property QuadrosGIAFilial: integer write SetQuadrosGIAFilial;
    property ImpostoPagar: Real read getImpostoPagar;
    property TabelaConsultaClassesPagto: TZDataSet read GetTabelaConsultaClassesPagto;
    property TabelaConsultaReceitasTributarias: TZDataSet read GetTabelaConsultaReceitasTributarias;
    property TabelaConsultaQuadroGIA: TZDataset read getTabelaConsultaQuadroGIA;
    property TabelaConsultaFilial: TZDataset read getTabelaConsultaFilial;
    property TabelaImpostoPagar: TZDataset read getTabelaImpostoPagar;
    property TabelaQuadroGIA: TZDataset read getTabelaQuadroGIA;
  end;

var
  dtmQuadrosGIA: TdtmQuadrosGIA;

implementation

Uses
  //Componentes
  clparametrossistema;

{$R *.dfm}

procedure TdtmQuadrosGIA.AbrirTabelasConsulta(Tabela: TtecTabelasGIA);
begin
  case Tabela of
    tbgCLASSESPAGTO:        Abre(ctLIVTabelaConsultaClassesPagto);
    tbgRECEITASTRIBUTARIAS: Abre(ctLIVTabelaConsultaReceitasTributarias);
  end;
end;

procedure TdtmQuadrosGIA.CalcularSaldoAnterior;
var
  Mes,
  Filial: Integer;
  Data: String;
begin
  inherited;
  if qryQuadrosGIA.ParamCount > 1 then
    Filial := qryQuadrosGIA.Params[0].AsInteger
  else
    Filial := 0;
  if qryQuadrosGIA.ParamCount > 1 then begin
    try
      Mes  := StrToInt(Copy(qryQuadrosGIA.Params[1].AsString, 1, 2)) - 1;
      if StrToInt(Copy(qryQuadrosGIA.Params[1].AsString, 4, 4)) > 0 then begin
        Data := IntToStr(Mes) + Copy(qryQuadrosGIA.Params[1].AsString, 3, 5);
        if Mes < 10 then
          Data := '0' + Data;
      end
    except
      Data := '';
    end;
  end else
    Data := '';
  ReFazConsulta(qrySaldoMesAnterior, [0, 1], [Data, Filial]);
  if qryQuadrosGIA.State in [dsEdit, dsInsert] then
    qryQuadrosGIAcredtransferencia.AsFloat := 0
  else begin
    qryQuadrosGIA.Edit;
    qryQuadrosGIA.Cancel;
  end
end;

function TdtmQuadrosGIA.CancelarQuadrosGIA: Boolean;
begin
  qryQuadrosGIA.Cancel;
  SelecionarEntradasSaidas;
  Result := True
end;

constructor TdtmQuadrosGIA.Create(AOwner: TComponent);
begin
  inherited;
  qryQuadrosGIA.Tag                       := ctLIVTabelaQuadrosGIA;
  qryConsultaQuadroGia.Tag                := ctLIVTabelaConsultaQuadrosGIA;
  qryConsultaFiliais.Tag                  := ctLIVTabelaConsultaFiliais;
  qryConsultaReceitasTributarias.Tag      := ctLIVTabelaConsultaReceitasTributarias;
  qryConsultaClassesPagto.Tag             := ctLIVTabelaConsultaClassesPagto;
end;

procedure TdtmQuadrosGIA.dsrCodigosComplementaresDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryCodigosComplementaresvalor then begin
    dsrCodigosComplementares.OnDataChange := nil;
    if qryProcuraFilialregime.AsInteger = 2 then
      if qryCodigosComplementarescodigo.AsInteger =  1303 then
        qryQuadrosGIAoutrosdebitos.AsFloat := qryCodigosComplementaresvalor.AsFloat
      else if qryCodigosComplementarescodigo.AsInteger =  1104 then
        qryQuadrosGIAcredpresumidos.AsFloat  := qryCodigosComplementaresvalor.AsFloat;
    if qryCodigosComplementarescodigo.AsInteger =  1402 then begin
      if qryQuadrosGIAcredincetivosfiscais.AsFloat > qryCodigosComplementaresvalor.AsFloat then
        qryQuadrosGIAcredincetivosfiscais.AsFloat  := qryCodigosComplementaresvalor.AsFloat
    end else if qryCodigosComplementarescodigo.AsInteger =  1404 then
      if qryQuadrosGIAcredincetivosfiscais.AsFloat > qryCodigosComplementaresvalor.AsFloat then
        qryQuadrosGIAcredincetivosfiscais.AsFloat  := qryCodigosComplementaresvalor.AsFloat;
    dsrCodigosComplementares.OnDataChange := dsrCodigosComplementaresDataChange;
  end
end;

procedure TdtmQuadrosGIA.dsrImpostosPagarDataChange(Sender: TObject;Field: TField);
begin
  inherited;
  if Field = qryImpostosPagarreceitatributaria then
    qryImpostosPagardescricaoreceitatributaria.AsString := qryProcuraReceitasTributariasdescricao.AsString
  else if Field = qryImpostosPagarclassepagto then
    qryImpostosPagardescricaoclassepagto.AsString := qryProcuraClassePagtodescricao.AsString
end;

function TdtmQuadrosGIA.ExcluirImpostoPagar: Boolean;
begin
  if qryImpostosPagar.RecordCount > 0 then begin
    qryQuadrosGIA.Edit;
    qryImpostosPagar.Delete;
    Result := True
  end else
    Result := False
end;

function TdtmQuadrosGIA.ExcluirQuadroGIA: Boolean;
begin
  if qryQuadrosGIA.RecordCount > 0 then begin
    while qryImpostosPagar.RecordCount > 0 do
      qryImpostosPagar.Delete;
    while qryComplementares.RecordCount > 0 do
      qryComplementares.Delete;
    qryQuadrosGIA.Delete;
    Perpetrar([qryImpostosPagar, qryComplementares, qryQuadrosGIA]);
    Result := True
  end else
    Result := False
end;

function TdtmQuadrosGIA.ExisteClassesPagto(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaClassesPagto, campo, codigo)
end;

function TdtmQuadrosGIA.ExisteQuadroGIA(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaQuadroGia, campo, codigo)
end;

function TdtmQuadrosGIA.ExisteReceitasTributarias(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaReceitasTributarias, campo, codigo)
end;

procedure TdtmQuadrosGIA.FecharTabelasConsulta(Tabela: TtecTabelasGIA);
begin
  case Tabela of
    tbgCLASSESPAGTO:        Fecha(ctLIVTabelaConsultaClassesPagto);
    tbgRECEITASTRIBUTARIAS: Fecha(ctLIVTabelaConsultaReceitasTributarias);
  end;
end;

function TdtmQuadrosGIA.getImpostoPagar: Real;
begin
  Result := qryQuadrosGIAimpostorecolher.AsFloat
end;

function TdtmQuadrosGIA.GetTabelaConsultaClassesPagto: TZDataSet;
begin
  Result := qryConsultaClassesPagto
end;

function TdtmQuadrosGIA.getTabelaConsultaFilial: TZDataset;
begin
 result := qryConsultaFiliais;
end;

function TdtmQuadrosGIA.getTabelaConsultaQuadroGIA: TZDataset;
begin
  Result := qryConsultaQuadroGia
end;

function TdtmQuadrosGIA.GetTabelaConsultaReceitasTributarias: TZDataSet;
begin
  Result := qryConsultaReceitasTributarias
end;

function TdtmQuadrosGIA.getTabelaImpostoPagar: TZDataset;
begin
  Result := qryImpostosPagar
end;

function TdtmQuadrosGIA.getTabelaQuadroGIA: TZDataset;
begin
  Result := qryQuadrosGIA
end;

function TdtmQuadrosGIA.GravarImpostoPagar: Boolean;
begin
  if qryImpostosPagar.CheckRequiredFields then begin
    qryImpostosPagar.Post;
    Result := True
  end else
    Result := False
end;

function TdtmQuadrosGIA.GravarQuadroGIA: Boolean;
var
  Pos: TBookmark;
  Existe: Boolean;
begin
  if qryQuadrosGIA.CheckRequiredFields then begin
    Pos := qryCodigosComplementares.GetBookmark;
    qryCodigosComplementares.DisableControls;
    qryQuadrosGIA.Post;
    try
      qryCodigosComplementares.First;
      while Not qryCodigosComplementares.Eof do begin
        Existe := qryComplementares.Locate('codigo', qryCodigosComplementarescodigo.AsInteger, []);
        if (qryCodigosComplementaresvalor.IsNull) or (qryCodigosComplementaresvalor.AsFloat = 0) then begin
          if Existe then
            qryComplementares.Delete
        end else if Not Existe then begin
          qryComplementares.Append;
          qryComplementaresfilial.AsInteger := qryQuadrosGIAfilial.AsInteger;
          qryComplementaresperiodo.AsString := qryQuadrosGIAperiodo.AsString;
          qryComplementarescodigo.AsInteger := qryCodigosComplementarescodigo.AsInteger;
          qryComplementaresvalor.AsFloat    := qryCodigosComplementaresvalor.AsFloat;
          qryComplementares.Post
        end;
        qryCodigosComplementares.Next
      end
    finally
      qryCodigosComplementares.GotoBookmark(Pos);
      qryCodigosComplementares.FreeBookmark(Pos);
      qryCodigosComplementares.EnableControls
    end;
    Perpetrar([qryQuadrosGIA, qryComplementares, qryImpostosPagar]);
    Result := True;
  end else
    Result := False
end;

function TdtmQuadrosGIA.IncluirEditarImpostoPagar(Incluir: Boolean): Boolean;
begin
  qryQuadrosGIA.Edit;
  if Incluir then
    qryImpostosPagar.Append
  else
    qryImpostosPagar.Edit;
  Result := True
end;

function TdtmQuadrosGIA.IncluirQuadroGIA: Boolean;
begin
  qryQuadrosGIA.Insert;
  Result := True;
end;

procedure TdtmQuadrosGIA.qryCodigosComplementaresBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  qryQuadrosGIA.Edit
end;

procedure TdtmQuadrosGIA.qryCodigosComplementaresCancel(DataSet: TDataSet);
begin
  inherited;
  qryCodigosComplementares.Cancel
end;

procedure TdtmQuadrosGIA.qryImpostosPagarNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryImpostosPagarfilial.AsInteger := qryQuadrosGIAfilial.AsInteger;
  qryImpostosPagarperiodo.AsString := qryQuadrosGIAperiodo.AsString;
end;

procedure TdtmQuadrosGIA.qryQuadrosGIAAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryQuadrosGIA.RecordCount > 0 then
    SelecionarEntradasSaidas
end;

procedure TdtmQuadrosGIA.qryQuadrosGIABeforeClose(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryComplementares, [0, 1], [0, '']);
  ReFazConsulta(qryImpostosPagar, [0, 1], [0, '']);
  ReFazConsulta(qryCodigosComplementares, [0, 1], [0, '']);
  ReFazConsulta(qryEntradas, [0, 1], [0, '']);
  ReFazConsulta(qrySaidas, [0, 1], [0, '']);
  ReFazConsulta(qryTotalEntradas, [0, 1], [0, '']);
  ReFazConsulta(qryTotaisSaidas, [0, 1], [0, '']);
end;

procedure TdtmQuadrosGIA.qryQuadrosGIACalcFields(DataSet: TDataSet);
var
  ImpostoRecolher, SaldoCredor: Real;
begin
  inherited;
  qryQuadrosGIA.OnCalcFields := nil;
  qryQuadrosGIAdebitopelassaidas.AsFloat := qryTotaisSaidasvalor.AsFloat;
  qryQuadrosGIAsubtotaldebitos.AsFloat  := qryQuadrosGIAdebitopelassaidas.AsFloat +
                                           qryQuadrosGIAdebdiferencialaliquota.AsFloat +
                                           qryQuadrosGIAdebtransferencia.AsFloat +
                                           qryQuadrosGIAdebestornocredito.AsFloat +
                                           qryQuadrosGIAdebestornoativoimobilizado.AsFloat +
                                           qryQuadrosGIAoutrosdebitos.AsFloat;
  qryQuadrosGIAsubtotalcreditos.AsFloat := qrySaldoMesAnteriorsaldoperiodoanterior.AsFloat +
                                           qryTotalEntradasvalor.AsFloat +
                                           qryQuadrosGIAcreddifaliquotaativoimobil.AsFloat +
                                           qryQuadrosGIAcreddifaliquotamaterialconsumo.AsFloat +
                                           qryQuadrosGIAcredtransferencia.AsFloat +
                                           qryQuadrosGIAcredpresumidos.AsFloat +
                                           qryQuadrosGIAcredincetivosfiscais.AsFloat +
                                           qryQuadrosGIAoutroscreditos.AsFloat +
                                           qryQuadrosGIAcredpagtoocasiaofatogerador.AsFloat;
  SaldoCredor     := qryQuadrosGIAsubtotaldebitos.AsFloat + qryQuadrosGIAdebapuracaoconsolidada.AsFloat;
  ImpostoRecolher := qryQuadrosGIAsubtotalcreditos.AsFloat + qryQuadrosGIAcredapuracaoconsolidada.AsFloat;
  if ImpostoRecolher > SaldoCredor then begin
    qryQuadrosGIAsaldocredoparaperiodoseguinte.AsFloat := ImpostoRecolher - SaldoCredor;
    qryQuadrosGIAimpostorecolher.AsFloat               := 0;
  end else begin
    qryQuadrosGIAsaldocredoparaperiodoseguinte.AsFloat := 0;
    qryQuadrosGIAimpostorecolher.AsFloat               := SaldoCredor - ImpostoRecolher;
  end;
  qryQuadrosGIAtotaldebitos.AsFloat     := qryQuadrosGIAsubtotaldebitos.AsFloat +
                                           qryQuadrosGIAdebapuracaoconsolidada.AsFloat +
                                           qryQuadrosGIAsaldocredoparaperiodoseguinte.AsFloat;
  qryQuadrosGIAtotalcreditos.AsFloat    := qryQuadrosGIAsubtotalcreditos.AsFloat +
                                           qryQuadrosGIAcredapuracaoconsolidada.AsFloat +
                                           qryQuadrosGIAimpostorecolher.AsFloat;

  qryQuadrosGIAsubstsubsaldocredor.AsFloat := qrySaldoMesAnteriorsubstsaldoperiodoanterior.AsFloat +
                                              qryQuadrosGIAsubstcreditos.AsFloat +
                                              qryQuadrosGIAsubstressarcimentoicms.AsFloat;
  qryQuadrosGIAsubstsubsaldodebitos.AsFloat := qryQuadrosGIAsubstimpostoretido.AsFloat;
  if qryQuadrosGIAsubstsubsaldocredor.AsFloat > qryQuadrosGIAsubstsubsaldodebitos.AsFloat then
    qryQuadrosGIAsubstsaldocredorperiodosequinte.AsFloat := qryQuadrosGIAsubstsubsaldocredor.AsFloat - qryQuadrosGIAsubstsubsaldodebitos.AsFloat
  else
    qryQuadrosGIAsubstimpostorecolher.AsFloat := qryQuadrosGIAsubstsubsaldodebitos.AsFloat - qryQuadrosGIAsubstsubsaldocredor.AsFloat;

  qryQuadrosGIAsubsttotaldebitos.AsFloat  := qryQuadrosGIAsubstsubsaldodebitos.AsFloat + qryQuadrosGIAsubstsaldocredorperiodosequinte.AsFloat;
  qryQuadrosGIAsubsttotalcreditos.AsFloat := qryQuadrosGIAsubstsubsaldocredor.AsFloat + qryQuadrosGIAsubstimpostorecolher.AsFloat;

  qryQuadrosGIA.OnCalcFields             := qryQuadrosGIACalcFields;
end;

procedure TdtmQuadrosGIA.qrySaldoMesAnteriorCalcFields(DataSet: TDataSet);
var
  SubTotalDebito, SubTotalCredito, SubstSubTotalCredito: Real;
begin
  inherited;
  qrySaldoMesAnterior.OnCalcFields := nil;

  SubTotalDebito  := qrySaldoMesAnteriordebitospelasaida.AsFloat +
                     qrySaldoMesAnteriordebdiferencialaliquota.AsFloat +
                     qrySaldoMesAnteriordebtransferencia.AsFloat +
                     qrySaldoMesAnteriordebestornocredito.AsFloat +
                     qrySaldoMesAnteriordebestornoativoimobilizado.AsFloat +
                     qrySaldoMesAnterioroutrosdebitos.AsFloat +
                     qrySaldoMesAnteriordebapuracaoconsolidada.AsFloat;
  SubTotalCredito := qrySaldoMesAnteriorcreditopelasentradas.AsFloat +
                     qrySaldoMesAnteriorcreddifaliquotaativoimobil.AsFloat +
                     qrySaldoMesAnteriorcreddifaliquotamaterialconsumo.AsFloat +
                     qrySaldoMesAnteriorcredtransferencia.AsFloat +
                     qrySaldoMesAnteriorcredpresumidos.AsFloat +
                     qrySaldoMesAnteriorcredincetivosfiscais.AsFloat +
                     qrySaldoMesAnterioroutroscreditos.AsFloat +
                     qrySaldoMesAnteriorcredapuracaoconsolidada.AsFloat +
                     qrySaldoMesAnteriorcredpagtoocasiaofatogerador.AsFloat;
  if SubTotalCredito > SubTotalDebito then
    qrySaldoMesAnteriorsaldoperiodoanterior.AsFloat := SubTotalCredito - SubTotalDebito
  else
    qrySaldoMesAnteriorsaldoperiodoanterior.AsFloat := 0;

  SubstSubTotalCredito := qrySaldoMesAnteriorsubstcreditos.AsFloat +
                          qrySaldoMesAnteriorsubstressarcimentoicms.AsFloat;
  if SubstSubTotalCredito > qrySaldoMesAnteriorsubstimpostoretido.AsFloat then
    qrySaldoMesAnteriorsubstsaldoperiodoanterior.AsFloat := SubstSubTotalCredito - qrySaldoMesAnteriorsubstimpostoretido.AsFloat
  else
    qrySaldoMesAnteriorsubstsaldoperiodoanterior.AsFloat := 0;

  qrySaldoMesAnterior.OnCalcFields := qrySaldoMesAnteriorCalcFields;
end;

procedure TdtmQuadrosGIA.Selecionar(Tabela: TtecTabelasGIA);
begin
  if qryImpostosPagar.State in [dsEdit, dsInsert] then
    qryImpostosPagar.Edit;
  case Tabela of
    tbgCLASSESPAGTO:        begin
                              qryImpostosPagarclassepagto.AsInteger         := qryConsultaClassesPagtocodigo.AsInteger;
                              qryImpostosPagardescricaoclassepagto.AsString := qryProcuraClassePagtodescricao.AsString
                            end;
    tbgRECEITASTRIBUTARIAS: begin
                              qryImpostosPagarreceitatributaria.AsInteger         := qryConsultaReceitasTributariascodigo.AsInteger;
                              qryImpostosPagardescricaoreceitatributaria.AsString := qryProcuraReceitasTributariasdescricao.AsString
                            end
  end;
end;

procedure TdtmQuadrosGIA.SelecionarEntradasSaidas;
begin
  ReFazConsulta(qryComplementares, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
  if ParSistema.NumeroProcessoAutorizacao = '' then
    qryCodigosComplementares.Sql[7] := 'where c.codigo <> 1502'
  else
    qryCodigosComplementares.Sql[7] := '';
  ReFazConsulta(qryImpostosPagar, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
  ReFazConsulta(qryCodigosComplementares, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
  ReFazConsulta(qryEntradas, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
  ReFazConsulta(qrySaidas, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
  ReFazConsulta(qryTotalEntradas, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
  ReFazConsulta(qryTotaisSaidas, [0, 1], [qryQuadrosGIAfilial.AsInteger, qryQuadrosGIAperiodo.AsString]);
end;

procedure TdtmQuadrosGIA.SelecionarFilial;
begin
  QuadrosGIAFilial := qryConsultaFiliaiscodigo.AsInteger;
end;

procedure TdtmQuadrosGIA.SelecionarQuadrosGIA;
begin
  ReFazConsulta(qryQuadrosGIA, [0, 1], [qryConsultaQuadroGiafilial.AsInteger, qryConsultaQuadroGiaperiodo.AsString]);
  SelecionarEntradasSaidas;
  CalcularSaldoAnterior;
end;

procedure TdtmQuadrosGIA.SetQuadrosGIAFilial(const Value: integer);
begin
  if Not (qryQuadrosGIA.State in [dsInsert, dsEdit]) then
    qryQuadrosGIA.Edit;
  qryquadrosgiafilial.AsInteger := Value
end;

end.
