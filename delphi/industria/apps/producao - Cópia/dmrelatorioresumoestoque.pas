unit dmrelatorioresumoestoque;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  cpdatasource, ctconstantes, variants, biblio, Forms, fr_dset, fr_dbset,
  fr_class, fmPreviewPadrao, ZTransact;

type
  TdtmRelatorioResumoEstoque = class(TdtmBasico)
    qryMovimentacao: TtecQuery;
    qryMovimentacaotipomovimento: TStringField;
    qryMovimentacaogrupo: TStringField;
    qryMovimentacaovalor: TFloatField;
    qryEstoquePeriodo: TtecQuery;
    qryEstoqueAnterior: TtecQuery;
    qryResumoEstoqueKrahIce: TtecQuery;
    qryEstoquePeriodogrupo: TStringField;
    qryEstoquePeriodofinanceiro: TFloatField;
    qryEstoqueAnteriorgrupo: TStringField;
    qryEstoqueAnteriorfinanceiro: TFloatField;
    dsrResumoEstoqueKrahIce: TtecDataSource;
    qryResumoEstoqueKrahIcedatainicial: TDateField;
    qryResumoEstoqueKrahIcedatafinal: TDateField;
    qryResumoEstoqueKrahIceconsumo_materiaprima: TFloatField;
    qryResumoEstoqueKrahIceconsumo_porcelana: TFloatField;
    qryResumoEstoqueKrahIceconsumo_embalagem: TFloatField;
    qryResumoEstoqueKrahIcefabricados_consumo: TFloatField;
    qryResumoEstoqueKrahIcefabricados_estoque: TFloatField;
    qryResumoEstoqueKrahIceestoque_resistores_acabados: TFloatField;
    qryResumoEstoqueKrahIceestoque_resistores_semiacabados: TFloatField;
    qryResumoEstoqueKrahIceestoque_materia_prima: TFloatField;
    qryResumoEstoqueKrahIceestoque_porcelana: TFloatField;
    qryResumoEstoqueKrahIceestoque_embalagem: TFloatField;
    qryResumoEstoqueKrahIceestoque_materia_prima_anterior: TFloatField;
    qryResumoEstoqueKrahIcecompra_materiaprima: TFloatField;
    qryResumoEstoqueKrahIceretorno_materiaprima: TFloatField;
    qryResumoEstoqueKrahIceTOTAL_CONSUMO: TCurrencyField;
    qryResumoEstoqueKrahIceTOTAL_ESTOQUERESISTORES: TCurrencyField;
    qryResumoEstoqueKrahIceTOTAL_ESTOQUE: TCurrencyField;
    qryResumoEstoqueKrahIceTOTAL_RESUMO: TCurrencyField;
    frpResumoEstoqueKrahIce: TfrReport;
    fdsResumoEstoqueKrahIce: TfrDBDataSet;
    procedure qryResumoEstoqueKrahIceCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure AtualizarValores(DataInicial, DataFinal: String);
    procedure GravarRelatorioResumo;
    procedure ExcluirRelatorioResumo;
    procedure ImprimirRelatorio;


  end;

var
  dtmRelatorioResumoEstoque: TdtmRelatorioResumoEstoque;

implementation

{$R *.dfm}

procedure TdtmRelatorioResumoEstoque.AtualizarValores(DataInicial, DataFinal: String);

  procedure EditarResumo;
  begin
    if not (qryResumoEstoqueKrahIce.State in [dsedit, dsinsert]) then
      qryResumoEstoqueKrahIce.Edit;
  end;
begin
  if (DataInicial<>'') and (datafinal<>'') then
  begin
    RefazConsultaPorNome(qryMovimentacao,   ['datainicial', 'datafinal'],[formatdateTime('yyyy-mm-dd',strtodate(datainicial)),
                                                                          formatdateTime('yyyy-mm-dd',strtodate(datafinal))]);
    RefazConsultaPorNome(qryEstoquePeriodo, ['datafinal'],   [formatdateTime('yyyy-mm-dd',strtodate(datafinal))]);
    RefazConsultaPorNome(qryEstoqueAnterior,['datainicial'], [formatdateTime('yyyy-mm-dd',strtodate(datainicial))]);

    EditarResumo;
    qryResumoEstoqueKrahIcedatainicial.AsDateTime := strtodate(DataInicial);
    qryResumoEstoqueKrahIcedatafinal.AsDateTime := strtodate(DataFinal);

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['SAI','GERL']),[])
    then qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency:= abs(qryMovimentacaovalor.AsCurrency)
    else qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency:= 0;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['SAI','MTPR']),[])) then
       qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency := qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                                 abs(qryMovimentacaovalor.AsCurrency);

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['SAI','QUIM']),[]) then
       qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency := qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                                 abs(qryMovimentacaovalor.AsCurrency);

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AF-','GERL']),[]) then
       qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency := qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AF-','MTPR']),[])) then
       qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency := qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AF-','QUIM']),[]) then
       qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency := qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['SAI','PORC']),[])
    then qryResumoEstoqueKrahIceconsumo_porcelana.AsCurrency := abs(qryMovimentacaovalor.AsCurrency)
    else qryResumoEstoqueKrahIceconsumo_porcelana.AsCurrency := 0;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['SAI','EMB']),[])
    then qryResumoEstoqueKrahIceconsumo_embalagem.AsCurrency := abs(qryMovimentacaovalor.AsCurrency)
    else qryResumoEstoqueKrahIceconsumo_embalagem.AsCurrency := 0;

    if qryEstoquePeriodo.Locate('grupo','GERL',[]) then
      qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency := qryEstoquePeriodofinanceiro.AsCurrency
    else
      qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency := 0;

    if (StrToDate(DataFinal) > StrToDate('31/05/2012')) and
       (qryEstoquePeriodo.Locate('grupo','MTPR',[])) then
       qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency := qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency +
                                                                  qryEstoquePeriodofinanceiro.AsCurrency;

    if qryEstoquePeriodo.Locate('grupo','QUIM',[]) then
       qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency := qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency +
                                                                  qryEstoquePeriodofinanceiro.AsCurrency;

    if qryEstoquePeriodo.Locate('grupo','PORC',[]) then
       qryResumoEstoqueKrahIceestoque_porcelana.AsCurrency := qryEstoquePeriodofinanceiro.AsCurrency;

    if qryEstoquePeriodo.Locate('grupo','EMB',[])
    then qryResumoEstoqueKrahIceestoque_embalagem.AsCurrency := qryEstoquePeriodofinanceiro.AsCurrency
    else qryResumoEstoqueKrahIceestoque_embalagem.AsCurrency := 0;

    if qryEstoqueAnterior.Locate('grupo','GERL',[]) then
      qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency := qryEstoqueAnteriorfinanceiro.AsCurrency
    else
      qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency := 0;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryEstoqueAnterior.Locate('grupo','MTPR',[])) then
       qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency := qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency +
                                                                           qryEstoqueAnteriorfinanceiro.AsCurrency;

    if qryEstoqueAnterior.Locate('grupo','QUIM',[]) then
       qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency := qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency +
                                                                           qryEstoqueAnteriorfinanceiro.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['ENT','GERL']),[])  then
      qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryMovimentacaovalor.AsCurrency
    else
      qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := 0;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['ENT','QUIM']),[]) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['ENT','MTPR']),[])) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;
(*
    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['EN2','GERL']),[])) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['EN2','MTPR']),[])) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;
*)
     if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AF+','GERL']),[]) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AF+','QUIM']),[]) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AF+','MTPR']),[])) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['FRT','GERL']),[]) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['FRT','QUIM']),[]) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['FRT','MTPR']),[])) then
       qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency := qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency +
                                                                qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['RET','GERL']),[])
    then qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := qryMovimentacaovalor.AsCurrency
    else qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := 0;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['RET','QUIM']),[]) then
       qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['RET','MTPR']),[])) then
       qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AQV','GERL']),[]) then
       qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if (StrToDate(DataInicial) > StrToDate('31/05/2012')) and
       (qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AQV','MTPR']),[])) then
       qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;

    if qryMovimentacao.Locate('tipomovimento;grupo',VarArrayof(['AQV','QUIM']),[]) then
       qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency := qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency +
                                                                 qryMovimentacaovalor.AsCurrency;


    qryResumoEstoqueKrahIce.Post;
  end;
end;

constructor TdtmRelatorioResumoEstoque.Create(AOwner: TComponent);
begin
  inherited;
  qryResumoEstoqueKrahIce.Tag := cttabelas;
end;

destructor TdtmRelatorioResumoEstoque.Destroy;
begin

  inherited;
end;

procedure TdtmRelatorioResumoEstoque.ExcluirRelatorioResumo;
begin
  if not qryResumoEstoqueKrahIce.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o RESUMO'])) = smbOk) then
    begin
       qryResumoEstoqueKrahIce.Delete;
       Perpetrar([qryResumoEstoqueKrahIce]);
    end;
end;

procedure TdtmRelatorioResumoEstoque.GravarRelatorioResumo;
begin
  qryResumoEstoqueKrahIce.Post;
  perpetrar([qryResumoEstoqueKrahIce]);
end;

procedure TdtmRelatorioResumoEstoque.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  AtribuirParametrosBaseRelatorio;
  frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Titulo']:= 'RESUMO DO ESTOQUE';
  frVariables['Outras']:= 'PERÍODO ENTRE '+
  FormatDateTime('dd/mm/yy', qryResumoEstoqueKrahIcedatainicial.AsDateTime)+
  ' E '+FormatDateTime('dd/mm/yy', qryResumoEstoqueKrahIcedatafinal.AsDateTime);
  frVariables['DataAnterior'] := datetostr(qryResumoEstoqueKrahIcedatainicial.AsDateTime-1);
  frVariables['DataInicial'] := qryResumoEstoqueKrahIcedatainicial.AsString;
  frVariables['DataFinal'] := qryResumoEstoqueKrahIcedatafinal.AsString;
  frVariables['DataExtenso'] := DataExtenso(qryResumoEstoqueKrahIcedatafinal.AsDateTime);


  frmPreview := TfrmPreviewPadrao.create(self);

  try
//   frpResumoEstoqueKrahIce.DesignReport;
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    frCompositeReport.Reports.Add(frpResumoEstoqueKrahIce);
   end;
   frmPreview.cmbZoom.ItemIndex:= 3;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
end;

procedure TdtmRelatorioResumoEstoque.qryResumoEstoqueKrahIceCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryResumoEstoqueKrahIceTOTAL_CONSUMO.AsCurrency := qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                     qryResumoEstoqueKrahIceconsumo_porcelana.AsCurrency +
                                                     qryResumoEstoqueKrahIceconsumo_embalagem.AsCurrency;

  qryResumoEstoqueKrahIceTOTAL_ESTOQUERESISTORES.AsCurrency := qryResumoEstoqueKrahIceestoque_resistores_acabados.AsCurrency +
                                                               qryResumoEstoqueKrahIceestoque_resistores_semiacabados.AsCurrency;


  qryResumoEstoqueKrahIceTOTAL_ESTOQUE.AsCurrency :=  qryResumoEstoqueKrahIceestoque_materia_prima.AsCurrency +
                                                      qryResumoEstoqueKrahIceestoque_porcelana.AsCurrency +
                                                      qryResumoEstoqueKrahIceestoque_embalagem.AsCurrency;


  qryResumoEstoqueKrahIceTOTAL_RESUMO.AsCurrency :=  qryResumoEstoqueKrahIceestoque_materia_prima_anterior.AsCurrency +
                                                     qryResumoEstoqueKrahIcecompra_materiaprima.AsCurrency -
                                                     qryResumoEstoqueKrahIceconsumo_materiaprima.AsCurrency +
                                                     qryResumoEstoqueKrahIceretorno_materiaprima.AsCurrency;

end;


end.
