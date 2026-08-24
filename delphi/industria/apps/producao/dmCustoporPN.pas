unit dmCustoporPN;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, cpdatasource, ZQuery, Forms,
  ZPgSqlQuery, cpquery, clparametrossistema, biblio, OleServer, ExcelXP, Graphics, ctconstantes;

type
  TdtmCustoporPN = class(TdtmBasico)
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscodigo: TLargeintField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutosrazao: TStringField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutosfluxograma: TIntegerField;
    qryClientesProdutostamloteproducao: TIntegerField;
    qryClientesProdutosexcedentepermitido: TIntegerField;
    qryClientesProdutostipoexcedente: TStringField;
    qryClientesProdutosorigem: TStringField;
    qryClientesProdutosrevisao: TStringField;
    qryComponenteProdutosCompostos_N1: TtecQuery;
    qryComponenteProdutosCompostos_N1composto: TLargeintField;
    qryComponenteProdutosCompostos_N1ordem: TIntegerField;
    qryComponenteProdutosCompostos_N1unidade: TStringField;
    qryProdutosCompostosFios: TtecQuery;
    qryProdutosCompostosFitas: TtecQuery;
    qryProdutosCompostosFitascomposto: TLargeintField;
    qryProdutosCompostosFitascomponente: TStringField;
    qryProdutosCompostosFitasordem: TIntegerField;
    qryProdutosCompostosFitasquantidade: TFloatField;
    qryProdutosCompostosFitasespessura: TStringField;
    qryProdutosCompostosFitaslargura: TStringField;
    qryProdutosCompostosFitasliga: TStringField;
    qryProdutosCompostosFitasnrvoltas: TIntegerField;
    qryProdutosCompostosFitasgramasporpeca: TFloatField;
    qryProdutosCompostosFitasdescricaocomponente: TStringField;
    qryProdutosCompostosFitassequencia: TIntegerField;
    qryClientesProdutoscodigovisual: TStringField;
    qryClientesProdutosdescricao: TStringField;
    qryComponenteProdutosCompostos_N1descricaocomponente: TStringField;
    qryComponenteProdutosCompostos_N1origemmercadoria: TIntegerField;
    qryComponenteProdutosCompostos_N1valormoeda: TFloatField;
    qryComponenteProdutosCompostos_N1cotacao: TFloatField;
    qryComponenteProdutosCompostos_N1moeda: TStringField;
    qryComponenteProdutosCompostos_N1desmembrarcomponente: TBooleanField;
    qryComponenteProdutosCompostos_N1ehcomposto: TBooleanField;
    qryComponenteProdutosCompostos_N2: TtecQuery;
    qryComponenteProdutosCompostos_N1componente: TLargeintField;
    qryComponenteProdutosCompostos_N1componentevisual: TStringField;
    qryProdutosCompostosFiosproduto: TLargeintField;
    qryProdutosCompostosFioscomponentevisual: TStringField;
    qryProdutosCompostosFiosgramasporpeca: TFloatField;
    qryProdutosCompostosFioscomponente: TLargeintField;
    qryProdutosCompostosFiosordem: TIntegerField;
    qryProdutosCompostosFioscodigovisual: TStringField;
    qryProdutosCompostosFiosdescricaocomponente: TStringField;
    qryProdutosCompostosFiosorigemmercadoria: TIntegerField;
    qryProdutosCompostosFiosvalormoeda: TFloatField;
    qryProdutosCompostosFioscotacao: TFloatField;
    qryClientesProdutossetorproducao: TStringField;
    qryClientesProdutosembalagem_pri: TLargeintField;
    qryClientesProdutosqttabuleiro_pri: TIntegerField;
    qryClientesProdutostabuleiro_pri: TLargeintField;
    qryClientesProdutosqtcaixa_pri: TIntegerField;
    qryClientesProdutosvalormoedaembalagem: TFloatField;
    qryClientesProdutoscotacaoembalagem: TFloatField;
    qryClientesProdutosvalormoedatabuleiro: TFloatField;
    qryClientesProdutoscotacaotabuleiro: TFloatField;
    qryClientesProdutosembalagemvisual_pri: TStringField;
    qryClientesProdutostabuleirovisual_pri: TStringField;
    qryFluxogramas: TtecQuery;
    dsrFluxogramas: TtecDataSource;
    qryFluxogramasOperacoes: TtecQuery;
    qryFluxogramasfluxograma: TIntegerField;
    qryFluxogramasdescricao: TStringField;
    qryFluxogramassequencia: TIntegerField;
    qryFluxogramasOperacoesfluxograma: TIntegerField;
    qryFluxogramasOperacoesoperacao: TIntegerField;
    qryFluxogramasOperacoessequencia: TStringField;
    qryFluxogramasOperacoestipooperacao: TStringField;
    qryFluxogramasOperacoesorigemoperacaoalternativa: TIntegerField;
    qryFluxogramasOperacoesoperacaoemgrupocomanterior: TBooleanField;
    qryFluxogramasOperacoesinformarterminodoprocesso: TBooleanField;
    qryFluxogramasOperacoesoperacaoconjugada: TBooleanField;
    qryFluxogramasOperacoespercentualoperador: TFloatField;
    qryFluxogramasOperacoesdescricaooperacao: TStringField;
    qryFluxogramasOperacoestempopadrao: TFloatField;
    qryClientesProdutoscotacaoeuro: TFloatField;
    qryParametrosProducao: TtecQuery;
    qryParametrosProducaoqtcargagas: TIntegerField;
    qryParametrosProducaofornecedorgas: TIntegerField;
    qryParametrosProducaoprodutoplaca: TLargeintField;
    qryParametrosProducaoqtplacascarga: TIntegerField;
    qryParametrosProducaociclodevidadaplaca: TIntegerField;
    qryParametrosProducaoperccustoadimpprod: TFloatField;
    qryParametrosProducaoperccustoestoque: TFloatField;
    qryParametrosProducaoperccustoadimpgeral: TFloatField;
    qryParametrosProducaopercmargemlucro: TFloatField;
    qryParametrosProducaoperccustovenda: TFloatField;
    qryParametrosProducaoperccustoadm: TFloatField;
    qryParametrosProducaoperccustodesenv: TFloatField;
    qryFluxogramasOperacoestipo: TStringField;
    qryFluxogramasOperacoesnome: TStringField;
    qryFluxogramasOperacoesc01: TStringField;
    qryFluxogramasOperacoesc02: TStringField;
    qryFluxogramasOperacoesc03: TStringField;
    qryFluxogramasOperacoescusto: TBooleanField;
    qryFluxogramasOperacoesmediatempopadrao: TFloatField;
    qryComponenteProdutosCompostos_N2queima: TBooleanField;
    qryComponenteProdutosCompostos_N2descricaocomponente: TStringField;
    qryComponenteProdutosCompostos_N2qtdecento: TFloatField;
    qryComponenteProdutosCompostos_N2valormoedamassa: TFloatField;
    qryComponenteProdutosCompostos_N2valorfrete: TFloatField;
    qryComponenteProdutosCompostos_N2valorqueima: TFloatField;
    qryComponenteProdutosCompostos_N2valoramortizacao: TFloatField;
    qryComponenteProdutosCompostos_N2valormoeda: TFloatField;
    qryComponenteProdutosCompostos_N3: TtecQuery;
    qryComponenteProdutosCompostos_N3composto: TLargeintField;
    qryComponenteProdutosCompostos_N3ordem: TIntegerField;
    qryComponenteProdutosCompostos_N3unidade: TStringField;
    qryComponenteProdutosCompostos_N3componente: TLargeintField;
    qryComponenteProdutosCompostos_N3componentevisual: TStringField;
    qryComponenteProdutosCompostos_N3descricaocomponente: TStringField;
    qryComponenteProdutosCompostos_N3origemmercadoria: TIntegerField;
    qryComponenteProdutosCompostos_N3valormoeda: TFloatField;
    qryComponenteProdutosCompostos_N3cotacao: TFloatField;
    qryComponenteProdutosCompostos_N3moeda: TStringField;
    qryComponenteProdutosCompostos_N3desmembrarcomponente: TBooleanField;
    qryComponenteProdutosCompostos_N3ehcomposto: TBooleanField;
    qryComponenteProdutosCompostos_N1percperda: TFloatField;
    qryComponenteProdutosCompostos_N1qtdecento: TFloatField;
    qryComponenteProdutosCompostos_N2origemmercadoria: TIntegerField;
    qryComponenteProdutosCompostos_N2cotacao: TFloatField;
    qryComponenteProdutosCompostos_N2ehcomposto: TBooleanField;
    qryComponenteProdutosCompostos_N2componente: TLargeintField;
    qryComponenteProdutosCompostos_N2componentevisual: TStringField;
    qryComponenteProdutosCompostos_N3qtdecento: TFloatField;
    qryParametrosProducaoorigemmercadoriaplaca: TIntegerField;
    qryComponenteProdutosCompostos_N2desmembrarcomponente: TBooleanField;
    qryComponenteProdutosCompostos_N1data: TDateField;
    qryComponenteProdutosCompostos_N1datacotacao: TDateField;
    qryComponenteProdutosCompostos_N2data: TDateField;
    qryComponenteProdutosCompostos_N2datacotacao: TDateField;
    qryComponenteProdutosCompostos_N3data: TDateField;
    qryComponenteProdutosCompostos_N3datacotacao: TDateField;
    qryComponenteProdutosCompostos_N2moeda: TStringField;
    qryProdutosCompostosFiosdata: TDateField;
    qryProdutosCompostosFiosdatacotacao: TDateField;
    qryProdutosCompostosFiosmoeda: TStringField;
    qryFluxogramastitulocusto: TStringField;
    qryClientesProdutosdatacotacaoeuro: TDateField;
    qryComponenteProdutosCompostos_N2percperda: TFloatField;
    qryComponenteProdutosCompostos_N3percperda: TFloatField;
    qryClientesProdutosembalagem_pri_contadocliente: TBooleanField;
    qryClientesProdutostabuleiro_pri_contadocliente: TBooleanField;
    qryFluxogramascustohomemhora: TFloatField;
    qryFluxogramasfatorcusto: TFloatField;
    qryFluxogramascorplanilhacusto: TStringField;
    qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes: TBooleanField;
    qryComponenteProdutosCompostos_N2quantidadeehsomatoriodoscomponentes: TBooleanField;
    qryComponenteProdutosCompostos_N3quantidadeehsomatoriodoscomponentes: TBooleanField;
    qryClientesProdutosembalagem_ter: TLargeintField;
    qryClientesProdutosqttabuleiro_ter: TIntegerField;
    qryClientesProdutostabuleiro_ter: TLargeintField;
    qryClientesProdutosqtcaixa_ter: TIntegerField;
    qryClientesProdutosvalormoedaembalagempallet: TFloatField;
    qryClientesProdutoscotacaoembalagempallet: TFloatField;
    qryClientesProdutosvalormoedatabuleiropallet: TFloatField;
    qryClientesProdutoscotacaotabuleiropallet: TFloatField;
    qryClientesProdutosembalagemvisual_ter: TStringField;
    qryClientesProdutostabuleirovisual_ter: TStringField;
    qryClientesProdutosembalagem_ter_contadocliente: TBooleanField;
    qryClientesProdutostabuleiro_ter_contadocliente: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure ExportarExcel(cliente: integer; tipocliente: string; produto: String);
  end;

var
  dtmCustoporPN: TdtmCustoporPN;

implementation

uses ComObj;

{$R *.dfm}

{ TdtmCustoporPN }

constructor TdtmCustoporPN.Create(AOwner: TComponent);
begin
  inherited;
  qryParametrosProducao.tag := ctTabelas;
end;

procedure TdtmCustoporPN.ExportarExcel(cliente: integer; tipocliente,
  produto: String);

var
  Excel, oWB, oSheet: Variant;
  Linha, LinhaAux, Previsoes, Coluna, p, vLinhaComposto_N1, vLinhaComposto_N1_E1, vLinhaComposto_N2, vLinhaComposto_N2_E2, LinhaProdutos,
  QtdeProdutos, Planilhas, produtos, NovaLinha: integer;
  TotalProdutos: Currency;
  vFormulaProdutosImportados, vFormulaCustoMateriais,
  {vFormulaSomatorioProdutos,}
  vFormulaSomatorioProdutos2, vNomeArquivo, vFormulaSomatorioTempoPadrao, vFormulaProcessos, vFormulaCustosdeProducao: String;

{  vFormulaComposto_F_N1, vFormulaComposto_H_N1,
  vFormulaComposto_F_N2, vFormulaComposto_H_N2: String;}

  vSomaComposto_E_N1, vSomaComposto_F_N1, vSomaComposto_H_N1,
  vSomaComposto_E_N2, vSomaComposto_F_N2, vSomaComposto_H_N2: double;

begin
  vLinhaComposto_N1 := 0;
  vLinhaComposto_N1_E1 := 0;

  vLinhaComposto_N2 := 0;
  vLinhaComposto_N2_E2 := 0;

  RefazConsultaPorNome(qryClientesProdutos, ['cliente','tipocliente','produto','filialbase'],[cliente, tipocliente, produto, filialbase]);
  RefazConsultaPorNome(qryComponenteProdutosCompostos_N1, ['produto','filialbase'],[produto,filialbase]);
  RefazConsultaPorNome(qryProdutosCompostosFios, ['produto','filialbase'],[produto,filialbase]);
  //RefazConsultaPorNome(qryProdutosCompostosFitas, ['produto'],[produto]);

  RefazConsultaPorNome(qryFluxogramas, ['cliente','tipocliente','produto'],[cliente, tipocliente, produto]);
  RefazConsultaPorNome(qryFluxogramasOperacoes, ['cliente','tipocliente','produto'],[cliente, tipocliente, produto]);

  Excel:= CreateOleObject('Excel.Application');
  Excel.Visible:= False;

  oWB := Excel.Workbooks.Add;
  oSheet := oWB.ActiveSheet;

//  Excel.WorkBooks.Open(ExtractFilePath(Application.ExeName)+'Pedidos.xls');



//  Excel.WorkBooks[1].Sheets[1].Range['A1','G1'].columns.Autofit;

{
  Excel.workbooks[1].Sheets[1].columns[1].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[2].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[3].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[4].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[5].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[6].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[7].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[8].Borders.LineStyle   := xlContinuous;

  Excel.workbooks[1].Sheets[1].columns[9].Borders.LineStyle   := xlContinuous;
  Excel.workbooks[1].Sheets[1].columns[10].Borders.LineStyle   := xlContinuous;
}

//  Excel.workbooks[1].Sheets[1].columns[11].Borders.LineStyle   := xlContinuous;

{
  Excel.Cells.Select;
  Excel.Selection.Columns.Borders.LineStyle   := xlContinuous;
  }


//  Excel.WorkBooks[1].Sheets[1].Rows[1].Hidden := True;

  Excel.WorkBooks[1].Sheets[1].columns[1].NumberFormat := '@';

  Excel.WorkBooks[1].Sheets[1].Range['A1','B1'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Cells[1,1] := 'Kunde         :';
  Excel.WorkBooks[1].Sheets[1].Cells[1,3] := qryClientesProdutosrazao.AsString;
  Excel.WorkBooks[1].Sheets[1].Cells[1,6] := 'Erstellt  :';
  Excel.WorkBooks[1].Sheets[1].Cells[1,8] := Now;

  Excel.WorkBooks[1].Sheets[1].Range['A2','B2'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Cells[2,1] := 'Typ / Projekt :';
  Excel.WorkBooks[1].Sheets[1].Cells[2,3] := qryClientesProdutoscodigovisual.AsString + ' - ' + qryClientesProdutosdescricao.AsString;
  Excel.WorkBooks[1].Sheets[1].Cells[2,6] := 'Nr.       :';

  Excel.WorkBooks[1].Sheets[1].Range['A3','B3'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Cells[3,1] := 'PN            :';
  Excel.WorkBooks[1].Sheets[1].Cells[3,3] := qryClientesProdutospn.AsString;
  Excel.WorkBooks[1].Sheets[1].Cells[3,6] := 'Ersteller :';
  Excel.WorkBooks[1].Sheets[1].Cells[3,8] := 'TAR1';

  Excel.workbooks[1].Sheets[1].range['A1:E3'].Borders.LineStyle := xlContinuous;
  Excel.workbooks[1].Sheets[1].range['A1:E3'].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.workbooks[1].Sheets[1].range['A1:E3'].font.bold := true;

  Excel.workbooks[1].Sheets[1].range['F1:H3'].Borders.LineStyle := xlContinuous;
  Excel.workbooks[1].Sheets[1].range['F1:H3'].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.workbooks[1].Sheets[1].range['A1:H3'].Interior.Color := $00C6FFFF;
//  Excel.workbooks[1].Sheets[1].range['A1:H3'].Borders.LineStyle   := xlContinuous;

  Excel.WorkBooks[1].Sheets[1].Range['A4','H4'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Range['A4','H4'].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.WorkBooks[1].Sheets[1].Range['A5','B5'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Cells[5,1].font.bold := true;
  Excel.WorkBooks[1].Sheets[1].Cells[5,1] := 'Kundenbedarf / Laufzeit';

  Excel.WorkBooks[1].Sheets[1].Range['A6','B6'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Cells[6,3].font.bold := true;
  Excel.WorkBooks[1].Sheets[1].Cells[6,3] := 'KRAH-ICE';

  Excel.WorkBooks[1].Sheets[1].Range['A7','H7'].MergeCells:= true;
  Excel.workbooks[1].Sheets[1].range['A5:H7'].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['A5','H7'].BorderAround(xlContinuous, xlThick, Color := clblack);


  Excel.WorkBooks[1].Sheets[1].Range['A8','A9'].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Cells[8,1] := 'Nr.';
  Excel.WorkBooks[1].Sheets[1].Range['A8','A9'].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['A8','H9'].font.bold := true;

  Excel.WorkBooks[1].Sheets[1].Cells[8,2] := 'Materialkosten';
  Excel.WorkBooks[1].Sheets[1].Range['B8','H8'].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.workbooks[1].Sheets[1].range['B9:H9'].Borders.Weight := xlThick;
  Excel.workbooks[1].Sheets[1].range['B9:H9'].Borders.Color := clBlack;


  Excel.WorkBooks[1].Sheets[1].Cells[9,2] := 'Artikel';
  Excel.WorkBooks[1].Sheets[1].Cells[9,3] := 'Artikel-Nr.';
  Excel.WorkBooks[1].Sheets[1].Cells[9,4] := 'ME';
  Excel.WorkBooks[1].Sheets[1].Cells[9,5] := 'Menge/%';
  Excel.WorkBooks[1].Sheets[1].Cells[9,6] := 'EK-Preis (R$)';
  Excel.WorkBooks[1].Sheets[1].Cells[9,7] := 'MTZ';
  Excel.WorkBooks[1].Sheets[1].Cells[9,8] := 'MEK (R$/%)';
  Excel.WorkBooks[1].Sheets[1].Cells[9,9] := 'Data NF';
  Excel.WorkBooks[1].Sheets[1].Cells[9,10] := 'Moeda';
  Excel.WorkBooks[1].Sheets[1].Cells[9,11] := 'Preço';
  Excel.WorkBooks[1].Sheets[1].Cells[9,12] := '% Perda';

  Excel.WorkBooks[1].Sheets[1].Range['C9:K9'].HorizontalAlignment := 3; {- Center}



  Linha := 10;

  vFormulaProdutosImportados := '';
  {vFormulaSomatorioProdutos := '';}
  vFormulaSomatorioProdutos2 := '=SUM(H10:';

  qryComponenteProdutosCompostos_N1.First;
  while not qryComponenteProdutosCompostos_N1.Eof do
  begin
    //vFormulaSomatorioProdutos := vFormulaSomatorioProdutos + 'H'+inttostr(Linha)+'+';

    if(qryComponenteProdutosCompostos_N1origemmercadoria.AsInteger  in [1]) then     // IMPORTADO
    begin
      Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Interior.Color := $00E1E1FF;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := qryComponenteProdutosCompostos_N1.recno;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N1descricaocomponente.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N1qtdecento.asfloat;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N1valormoeda.AsFloat * qryComponenteProdutosCompostos_N1cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100);
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

      if not qryComponenteProdutosCompostos_N1data.isnull then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N1data.AsDateTime;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N1moeda.AsString;

      if uppercase(qryComponenteProdutosCompostos_N1moeda.AsString) <> 'REAL' then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N1valormoeda.AsCurrency;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N1percperda.Asfloat/100;

      vFormulaProdutosImportados := vFormulaProdutosImportados + 'H'+inttostr(Linha)+'+';
    end
    else
    if  (qryComponenteProdutosCompostos_N1origemmercadoria.AsInteger <> 1) and  // NACIONAL
        not qryComponenteProdutosCompostos_N1ehcomposto.AsBoolean then
    begin
        //NACIONAL
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := qryComponenteProdutosCompostos_N1.recno;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N1descricaocomponente.AsString;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N1qtdecento.asfloat;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N1valormoeda.AsFloat;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

        if not qryComponenteProdutosCompostos_N1data.isnull then
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N1data.AsDateTime;

        Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N1moeda.AsString;

        if uppercase(qryComponenteProdutosCompostos_N1moeda.AsString) <> 'REAL' then
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N1valormoeda.AsCurrency;

        Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N1percperda.Asfloat/100;
    end
    else
    if qryComponenteProdutosCompostos_N1ehcomposto.AsBoolean then
    begin

      RefazConsultaPorNome(qryComponenteProdutosCompostos_N2, ['filialbase', 'fornecedorgas', 'qtCargaGas',
                                                              'produtoplaca', 'qtPlacasCarga', 'CiclodeVidadaPlaca',
                                                              'componente'],

                                                             [filialbase,
                                                              qryParametrosProducaofornecedorgas.Asinteger,
                                                              qryParametrosProducaoqtcargagas.AsInteger,
                                                              qryParametrosProducaoprodutoplaca.AsString,
                                                              qryParametrosProducaoqtplacascarga.AsInteger,
                                                              qryParametrosProducaociclodevidadaplaca.asInteger,
                                                              qryComponenteProdutosCompostos_N1componente.asstring]);
      qryComponenteProdutosCompostos_N2.first;


      if not qryComponenteProdutosCompostos_N2queima.AsBoolean then
      begin
        // Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := qryComponenteProdutosCompostos_N2queima.AsBoolean;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := qryComponenteProdutosCompostos_N1.RecNo;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N1descricaocomponente.AsString;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;

//        if not qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes.AsBoolean then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N1qtdecento.asfloat;

        vLinhaComposto_N1 := Linha;

        if qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes.asboolean then
          vLinhaComposto_N1_E1 := Linha
        else
          vLinhaComposto_N1_E1 := 0;


        if qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean {or
           qryComponenteProdutosCompostos_N2queima.AsBoolean} then
        begin
          inc(linha);
          vLinhaComposto_N1 := 0;
        end;

      end
      else
      begin
        vLinhaComposto_N1 := 0;
        vLinhaComposto_N1_E1 := 0;

      end;

      vSomaComposto_E_N1 := 0;
      vSomaComposto_F_N1 := 0;
      vSomaComposto_H_N1 := 0;

      {vFormulaComposto_F_N1 := '';
       vFormulaComposto_H_N1 := '';}


      while not qryComponenteProdutosCompostos_N2.eof do
      begin
        if qryComponenteProdutosCompostos_N2queima.AsBoolean then
        begin

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.1';

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString+' - Masse';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N2qtdecento.asfloat;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valormoedamassa.asfloat;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

          if not qryComponenteProdutosCompostos_N2data.isnull then
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

          if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;

          {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
           vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';

//          Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}
          linha := LInha + 1;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.2';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString+' - Transport';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N2qtdecento.asfloat;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valorfrete.asfloat;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

          if not qryComponenteProdutosCompostos_N2data.isnull then
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

          if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;

          {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
          vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
          Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}
          linha := LInha + 1;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.3';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString+' - Brennen-Kosten';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 100;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valorqueima.asfloat;
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

          if not qryComponenteProdutosCompostos_N2data.isnull then
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

          if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

          Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;

          {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
          vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
          Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}
          linha := LInha + 1;

          if qryParametrosProducaoorigemmercadoriaplaca.AsInteger  = 1 then //IMPORTAÇÃO
          begin
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
            Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Interior.Color := $00E1E1FF;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.4';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString+' - Platte Amortisierungskosten';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 100;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valoramortizacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100);
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

            if not qryComponenteProdutosCompostos_N2data.isnull then
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

            if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
               Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;

            vFormulaProdutosImportados := vFormulaProdutosImportados + 'H'+inttostr(Linha)+'+';
            {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
            vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
            Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}
          end
          else
          begin
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.4';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString+' - Platte Amortisierungskosten';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N1componentevisual.AsString;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 100;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valoramortizacao.asfloat;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

            if not qryComponenteProdutosCompostos_N2data.isnull then
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

            if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
               Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;

            {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
            vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
            Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}
          end;

        end
        else
        if  (qryComponenteProdutosCompostos_N2origemmercadoria.AsInteger  in [1]) then     // IMPORTADO
        begin

          if qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes.AsBoolean then
            vSomaComposto_E_N1 := vSomaComposto_E_N1 +  qryComponenteProdutosCompostos_N2qtdecento.asfloat;

          if qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean then
          begin
            Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Interior.Color := $00E1E1FF;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.'+inttostr(qryComponenteProdutosCompostos_N2.recno) ;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N2componentevisual.AsString;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N2qtdecento.asfloat;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valormoeda.AsFloat * qryComponenteProdutosCompostos_N2cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100);
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

            if not qryComponenteProdutosCompostos_N2data.isnull then
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

            if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
               Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;

            vFormulaProdutosImportados := vFormulaProdutosImportados + 'H'+inttostr(Linha)+'+';
          end
          else
          begin
            vSomaComposto_F_N1 := vSomaComposto_F_N1 + (qryComponenteProdutosCompostos_N2valormoeda.AsFloat * qryComponenteProdutosCompostos_N2cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100));
            vSomaComposto_H_N1 := vSomaComposto_H_N1 + (qryComponenteProdutosCompostos_N2qtdecento.asfloat * (qryComponenteProdutosCompostos_N2valormoeda.AsFloat * qryComponenteProdutosCompostos_N2cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100)));
          end;

          {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
          vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
          Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}

          if not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean then
          begin
            if qryComponenteProdutosCompostos_N2.recno = 1 then
            begin
              if vLinhaComposto_N1 <> 0 then
              begin
                if not qryComponenteProdutosCompostos_N2data.isnull then
                  Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

                Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

                if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
                   Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

                Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,12].NumberFormat := '##0,00%';
                Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;
              end;
            end;
          end;

        end
        else
        if  (qryComponenteProdutosCompostos_N2origemmercadoria.AsInteger <> 1) and  // NACIONAL
            not qryComponenteProdutosCompostos_N2ehcomposto.AsBoolean then
        begin
            //NACIONAL
            if qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes.AsBoolean then
              vSomaComposto_E_N1 := vSomaComposto_E_N1 +  qryComponenteProdutosCompostos_N2qtdecento.asfloat;

            if qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean then
            begin
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.'+inttostr(qryComponenteProdutosCompostos_N2.recno);
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString;
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N2componentevisual.AsString;
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N2qtdecento.asfloat;
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N2valormoeda.AsFloat;
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

              if not qryComponenteProdutosCompostos_N2data.isnull then
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

              Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

              if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
                 Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

              Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
              Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;
            end
            else
            begin
              vSomaComposto_F_N1 := vSomaComposto_F_N1 + qryComponenteProdutosCompostos_N2valormoeda.AsFloat;
              vSomaComposto_H_N1 := vSomaComposto_H_N1 + (qryComponenteProdutosCompostos_N2qtdecento.asfloat * qryComponenteProdutosCompostos_N2valormoeda.AsFloat);
            end;

            {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
            vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
            Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}

            if not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean then
            begin
              if qryComponenteProdutosCompostos_N2.recno = 1 then
              begin
                if vLinhaComposto_N1 <> 0 then
                begin
                  if not qryComponenteProdutosCompostos_N2data.isnull then
                    Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,9] := qryComponenteProdutosCompostos_N2data.AsDateTime;

                  Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,10] := qryComponenteProdutosCompostos_N2moeda.AsString;

                  if uppercase(qryComponenteProdutosCompostos_N2moeda.AsString) <> 'REAL' then
                     Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,11] := qryComponenteProdutosCompostos_N2valormoeda.AsCurrency;

                  Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,12].NumberFormat := '##0,00%';
                  Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,12] := qryComponenteProdutosCompostos_N2percperda.Asfloat/100;
                end;
              end;
            end;


        end
        else
        if qryComponenteProdutosCompostos_N2ehcomposto.AsBoolean then
        begin

          if qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean then
          begin
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.RecNo)+'.'+inttostr(qryComponenteProdutosCompostos_N2.RecNo);
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N2descricaocomponente.AsString;
            Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N2componentevisual.AsString;

            Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N2qtdecento.asfloat;
            {vFormulaComposto_F_N1 := vFormulaComposto_F_N1 + 'F'+inttostr(linha) + '+';
            vFormulaComposto_H_N1 := vFormulaComposto_H_N1 + 'H'+inttostr(linha) + '+';
            Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean;}

            if qryComponenteProdutosCompostos_N2quantidadeehsomatoriodoscomponentes.asboolean then
              vLinhaComposto_N2_E2 := Linha
            else
              vLinhaComposto_N2_E2 := 0;

            vLinhaComposto_N2 := Linha;
            if qryComponenteProdutosCompostos_N2desmembrarcomponente.asboolean then
            begin
              inc(linha);
              vLinhaComposto_N2 := 0;
            end;
          end
          else
          begin
            vLinhaComposto_N2 := 0;
            vLinhaComposto_N2_E2 := 0;
          end;


          {vFormulaComposto_F_N2 := '';
          vFormulaComposto_H_N2 := '';}

          vSomaComposto_E_N2 := 0;
          vSomaComposto_F_N2 := 0;
          vSomaComposto_H_N2 := 0;

          RefazConsultaPorNome(qryComponenteProdutosCompostos_N3, ['produto','filialbase'],[qryComponenteProdutosCompostos_N2componente.asString, Filialbase]);
          qryComponenteProdutosCompostos_N3.first;
          while not qryComponenteProdutosCompostos_N3.eof do
          begin
            if  (qryComponenteProdutosCompostos_N3origemmercadoria.AsInteger  in [1]) then     // IMPORTADO
            begin

              if qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes.AsBoolean then
                vSomaComposto_E_N1 := vSomaComposto_E_N1 +  qryComponenteProdutosCompostos_N3qtdecento.asfloat;

              if qryComponenteProdutosCompostos_N2quantidadeehsomatoriodoscomponentes.AsBoolean then
                vSomaComposto_E_N2 := vSomaComposto_E_N2 +  qryComponenteProdutosCompostos_N3qtdecento.asfloat;

              if qryComponenteProdutosCompostos_N2desmembrarcomponente.AsBoolean then
              begin
                Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Interior.Color := $00E1E1FF;
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.'+inttostr(qryComponenteProdutosCompostos_N2.recno)+'.'+inttostr(qryComponenteProdutosCompostos_N3.recno);
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N3descricaocomponente.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N3componentevisual.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N3qtdecento.asfloat;
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N3valormoeda.AsFloat * qryComponenteProdutosCompostos_N3cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100);
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

                if not qryComponenteProdutosCompostos_N3data.isnull then
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N3data.AsDateTime;

                Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N3moeda.AsString;

                if uppercase(qryComponenteProdutosCompostos_N3moeda.AsString) <> 'REAL' then
                   Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N3valormoeda.AsCurrency;

                Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
                Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N3percperda.Asfloat/100;

                vFormulaProdutosImportados := vFormulaProdutosImportados + 'H'+inttostr(Linha)+'+';
                {
                vFormulaComposto_F_N2 := vFormulaComposto_F_N2 + 'F'+inttostr(linha) + '+';
                vFormulaComposto_H_N2 := vFormulaComposto_H_N2 + 'H'+inttostr(linha) + '+';
                Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N2desmembrarcomponente.AsBoolean;}
              end
              else
              begin

                vSomaComposto_F_N1 := vSomaComposto_F_N1 + (qryComponenteProdutosCompostos_N3valormoeda.AsFloat * qryComponenteProdutosCompostos_N3cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100));
                vSomaComposto_H_N1 := vSomaComposto_H_N1 + (qryComponenteProdutosCompostos_N3qtdecento.asfloat * (qryComponenteProdutosCompostos_N3valormoeda.AsFloat * qryComponenteProdutosCompostos_N3cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100)));

                vSomaComposto_F_N2 := vSomaComposto_F_N2 + (qryComponenteProdutosCompostos_N3valormoeda.AsFloat * qryComponenteProdutosCompostos_N3cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100));
                vSomaComposto_H_N2 := vSomaComposto_H_N2 + (qryComponenteProdutosCompostos_N3qtdecento.asfloat * (qryComponenteProdutosCompostos_N3valormoeda.AsFloat * qryComponenteProdutosCompostos_N3cotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100)));
              end;
            end
            else
            if  (qryComponenteProdutosCompostos_N3origemmercadoria.AsInteger <> 1) and  // NACIONAL
                not qryComponenteProdutosCompostos_N3ehcomposto.AsBoolean then
            begin
                //NACIONAL

                if qryComponenteProdutosCompostos_N1quantidadeehsomatoriodoscomponentes.AsBoolean then
                  vSomaComposto_E_N1 := vSomaComposto_E_N1 +  qryComponenteProdutosCompostos_N3qtdecento.asfloat;

                if qryComponenteProdutosCompostos_N2quantidadeehsomatoriodoscomponentes.AsBoolean then
                  vSomaComposto_E_N2 := vSomaComposto_E_N2 +  qryComponenteProdutosCompostos_N3qtdecento.asfloat;

                if qryComponenteProdutosCompostos_N2desmembrarcomponente.AsBoolean then
                begin
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := inttostr(qryComponenteProdutosCompostos_N1.recno)+'.'+inttostr(qryComponenteProdutosCompostos_N2.recno)+'.'+inttostr(qryComponenteProdutosCompostos_N3.recno);
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryComponenteProdutosCompostos_N3descricaocomponente.AsString;
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryComponenteProdutosCompostos_N3componentevisual.AsString;
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryComponenteProdutosCompostos_N3qtdecento.asfloat;
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryComponenteProdutosCompostos_N3valormoeda.AsFloat;
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

                  if not qryComponenteProdutosCompostos_N3data.isnull then
                    Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryComponenteProdutosCompostos_N3data.AsDateTime;

                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryComponenteProdutosCompostos_N3moeda.AsString;

                  if uppercase(qryComponenteProdutosCompostos_N3moeda.AsString) <> 'REAL' then
                     Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryComponenteProdutosCompostos_N3valormoeda.AsCurrency;

                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,12].NumberFormat := '##0,00%';
                  Excel.WorkBooks[1].Sheets[1].Cells[Linha,12] := qryComponenteProdutosCompostos_N3percperda.Asfloat/100;

                  {
                  vFormulaComposto_F_N2 := vFormulaComposto_F_N2 + 'F'+inttostr(linha) + '+';
                  vFormulaComposto_H_N2 := vFormulaComposto_H_N2 + 'H'+inttostr(linha) + '+';
                  Excel.WorkBooks[1].Sheets[1].Rows[Linha].Hidden := not qryComponenteProdutosCompostos_N2desmembrarcomponente.AsBoolean;}
                end
                else
                begin
                  vSomaComposto_F_N1 := vSomaComposto_F_N1 + qryComponenteProdutosCompostos_N3valormoeda.AsFloat;
                  vSomaComposto_H_N1 := vSomaComposto_H_N1 + (qryComponenteProdutosCompostos_N3qtdecento.asfloat * qryComponenteProdutosCompostos_N3valormoeda.AsFloat);

                  vSomaComposto_F_N2 := vSomaComposto_F_N2 + qryComponenteProdutosCompostos_N3valormoeda.AsFloat;
                  vSomaComposto_H_N2 := vSomaComposto_H_N2 + (qryComponenteProdutosCompostos_N3qtdecento.asfloat * qryComponenteProdutosCompostos_N3valormoeda.AsFloat);

                end;
            end
            else
            if qryComponenteProdutosCompostos_N3ehcomposto.AsBoolean then
            begin
              ;
              {Nivel 4}
            end;
            qryComponenteProdutosCompostos_N3.next;

            if not qryComponenteProdutosCompostos_N3.eof then
              linha := LInha + 1
            else
            begin
              {
              if vFormulaComposto_F_N2<>'' then
              begin
                delete(vFormulaComposto_F_N2,length(vFormulaComposto_F_N2),1);
                vFormulaComposto_F_N2 := '='+vFormulaComposto_F_N2;
              end;

              if vFormulaComposto_H_N2<>'' then
              begin
                delete(vFormulaComposto_H_N2,length(vFormulaComposto_H_N2),1);
                vFormulaComposto_H_N2 := '='+vFormulaComposto_H_N2;
              end;
              }

              if vLinhaComposto_N2_E2 <> 0 then
                Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N2_E2,5] := vSomaComposto_E_N2;


              if vLinhaComposto_N2 <> 0 then
              begin
//              Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N2,6] := vFormulaComposto_F_N2;
//              Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N2,8] := vFormulaComposto_H_N2;
                Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N2,6] := vSomaComposto_F_N2;
                Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N2,8] := vSomaComposto_H_N2;
              end;
            end;
          end;
        end;

        qryComponenteProdutosCompostos_N2.next;
        if not qryComponenteProdutosCompostos_N2.eof then
        begin
          if qryComponenteProdutosCompostos_N1desmembrarcomponente.AsBoolean then
            linha := LInha + 1;
        end
        else
        begin
          {
          if vFormulaComposto_F_N1<>'' then
          begin
            delete(vFormulaComposto_F_N1,length(vFormulaComposto_F_N1),1);
            vFormulaComposto_F_N1 := '='+vFormulaComposto_F_N1;
          end;

          if vFormulaComposto_H_N1<>'' then
          begin
            delete(vFormulaComposto_H_N1,length(vFormulaComposto_H_N1),1);
            vFormulaComposto_H_N1 := '='+vFormulaComposto_H_N1;
          end;
          }

          if vLinhaComposto_N1_E1 <> 0 then
            Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1_E1,5] := vSomaComposto_E_N1;

          if vLinhaComposto_N1 <> 0 then
          begin
//            Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,6] := vFormulaComposto_F_N1;
//            Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,8] := vFormulaComposto_H_N1;
            Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,6] := vSomaComposto_F_N1;
            Excel.WorkBooks[1].Sheets[1].Cells[vLinhaComposto_N1,8] := vSomaComposto_H_N1;
          end;
        end;

      end;


    end;
    qryComponenteProdutosCompostos_N1.Next;

    linha := LInha + 1;
  end;

  LinhaProdutos := qryComponenteProdutosCompostos_N1.recordcount;

  qryProdutosCompostosFios.First;
  while not qryProdutosCompostosFios.Eof do
  begin
    //vFormulaSomatorioProdutos := vFormulaSomatorioProdutos + 'H'+inttostr(Linha)+'+';
    // IMPORTADO
    if (qryProdutosCompostosFiosorigemmercadoria.AsInteger in [1]) then
    begin
      Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Interior.Color := $00E1E1FF;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := LinhaProdutos + qryProdutosCompostosFios.recno;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryProdutosCompostosFiosdescricaocomponente.AsString;
      if qryProdutosCompostosFioscomponentevisual.AsString = qryProdutosCompostosFioscodigovisual.AsString then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryProdutosCompostosFioscomponentevisual.AsString
      else
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryProdutosCompostosFioscomponentevisual.AsString+'/'+qryProdutosCompostosFioscodigovisual.AsString;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := (qryProdutosCompostosFiosgramasporpeca.asfloat/1000) * 100;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryProdutosCompostosfiosvalormoeda.AsFloat * qryProdutosCompostosfioscotacao.AsFloat * (1 + qryParametrosProducaoperccustoadimpprod.AsFloat/100);
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

      if not qryProdutosCompostosfiosdata.isnull then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryProdutosCompostosfiosdata.AsDateTime;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryProdutosCompostosfiosmoeda.AsString;

      if uppercase(qryProdutosCompostosfiosmoeda.AsString) <> 'REAL' then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryProdutosCompostosFiosvalormoeda.AsCurrency;

      vFormulaProdutosImportados := vFormulaProdutosImportados + 'H'+inttostr(Linha)+'+';
    end
    else
    if not qryProdutosCompostosFiosorigemmercadoria.isnull then
    begin
      //NACIONAL
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := LinhaProdutos + qryProdutosCompostosFios.recno;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryProdutosCompostosfiosdescricaocomponente.AsString;
      if qryProdutosCompostosFioscomponentevisual.AsString = qryProdutosCompostosFioscodigovisual.AsString then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryProdutosCompostosFioscomponentevisual.AsString
      else
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryProdutosCompostosFioscomponentevisual.AsString+'/'+qryProdutosCompostosFioscodigovisual.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := (qryProdutosCompostosFiosgramasporpeca.asfloat/1000) * 100;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryProdutosCompostosfiosvalormoeda.AsFloat;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

      if not qryProdutosCompostosfiosdata.isnull then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryProdutosCompostosfiosdata.AsDateTime;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryProdutosCompostosfiosmoeda.AsString;

      if uppercase(qryProdutosCompostosfiosmoeda.AsString) <> 'REAL' then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryProdutosCompostosFiosvalormoeda.AsCurrency;

    end
    else
    begin
    //NAO ENCONTRADO
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := LinhaProdutos + qryProdutosCompostosFios.recno;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryProdutosCompostosfiosdescricaocomponente.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryProdutosCompostosfioscomponentevisual.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := (qryProdutosCompostosFiosgramasporpeca.asfloat/1000) * 100;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := qryProdutosCompostosfiosvalormoeda.AsFloat;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

      if not qryProdutosCompostosfiosdata.isnull then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := qryProdutosCompostosfiosdata.AsDateTime;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,10] := qryProdutosCompostosfiosmoeda.AsString;
      
      if uppercase(qryProdutosCompostosfiosmoeda.AsString) <> 'REAL' then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,11] := qryProdutosCompostosFiosvalormoeda.AsCurrency;

    end;
    qryProdutosCompostosfios.Next;

//    if not qryProdutosCompostosfios.eof then
      linha := LInha + 1;
  end;

  //EMBALAGENS

  LinhaProdutos := LinhaProdutos + qryProdutosCompostosfios.recordcount + 1;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := LinhaProdutos;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Verpackung';

  Excel.WorkBooks[1].Sheets[1].Range['E10:H'+inttostr(linha)].NumberFormat := '###.###.##0,0000';

  if (qryclientesprodutosembalagem_pri.AsString <> '') then
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryClientesProdutosembalagemvisual_pri.AsString
  else
  if (qryClientesProdutostabuleiro_pri.AsString <> '') then
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryClientesProdutostabuleirovisual_pri.AsString;

  Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 100;
  if qryClientesProdutosqtcaixa_pri.AsFloat<> 0 then
  begin
    if not qryClientesProdutosembalagem_pri_contadocliente.AsBoolean or
       not qryClientesProdutostabuleiro_pri_contadocliente.AsBoolean then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := (((qryClientesProdutosvalormoedaembalagem.AsFloat * qryClientesProdutoscotacaoembalagem.asfloat) +
                                                     (qryClientesProdutosvalormoedatabuleiro.AsFloat * qryClientesProdutoscotacaotabuleiro.asfloat * qryClientesProdutosqttabuleiro_pri.AsFloat)) * 100)/ qryClientesProdutosqtcaixa_pri.AsFloat
    else
    if not qryClientesProdutosembalagem_pri_contadocliente.AsBoolean or
           qryClientesProdutostabuleiro_pri_contadocliente.AsBoolean then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := ((qryClientesProdutosvalormoedaembalagem.AsFloat * qryClientesProdutoscotacaoembalagem.asfloat) {+
                                                      (qryClientesProdutosvalormoedatabuleiro.AsFloat * qryClientesProdutoscotacaotabuleiro.asfloat * qryClientesProdutosqttabuleiro_pri.AsFloat)}  * 100)/ qryClientesProdutosqtcaixa_pri.AsFloat
    else
    if qryClientesProdutosembalagem_pri_contadocliente.AsBoolean or
       not qryClientesProdutostabuleiro_pri_contadocliente.AsBoolean then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := (({(qryClientesProdutosvalormoedaembalagem.AsFloat * qryClientesProdutoscotacaoembalagem.asfloat) +}
                                                     (qryClientesProdutosvalormoedatabuleiro.AsFloat * qryClientesProdutoscotacaotabuleiro.asfloat * qryClientesProdutosqttabuleiro_pri.AsFloat)) * 100)/ qryClientesProdutosqtcaixa_pri.AsFloat
    else
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 0
  end
  else
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 0;

  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);

  inc(Linha);

  // PALLET

  if not qryClientesProdutosembalagemvisual_ter.isnull or
     not qryClientesProdutostabuleirovisual_ter.isnull then
  begin
    LinhaProdutos := LinhaProdutos + 1;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := LinhaProdutos;
  //  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Verpackung';

    Excel.WorkBooks[1].Sheets[1].Range['E10:H'+inttostr(linha)].NumberFormat := '###.###.##0,0000';

    if (qryclientesprodutosembalagem_ter.AsString <> '') then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryClientesProdutosembalagemvisual_ter.AsString
    else
    if (qryClientesProdutostabuleiro_ter.AsString <> '') then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryClientesProdutostabuleirovisual_ter.AsString;

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 100;
    if qryClientesProdutosqtcaixa_ter.AsFloat<> 0 then
    begin
      if not qryClientesProdutosembalagem_ter_contadocliente.AsBoolean or
         not qryClientesProdutostabuleiro_ter_contadocliente.AsBoolean then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := (((qryClientesProdutosvalormoedaembalagempallet.AsFloat * qryClientesProdutoscotacaoembalagempallet.asfloat) +
                                                       (qryClientesProdutosvalormoedatabuleiropallet.AsFloat * qryClientesProdutoscotacaotabuleiropallet.asfloat * qryClientesProdutosqttabuleiro_ter.AsFloat))
                                                       * 100)/ qryClientesProdutosqtcaixa_ter.AsFloat
      else
      if not qryClientesProdutosembalagem_ter_contadocliente.AsBoolean or
             qryClientesProdutostabuleiro_ter_contadocliente.AsBoolean then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := ((qryClientesProdutosvalormoedaembalagempallet.AsFloat * qryClientesProdutoscotacaoembalagempallet.asfloat)
                                                        * 100)/ qryClientesProdutosqtcaixa_ter.AsFloat
      else
      if qryClientesProdutosembalagem_ter_contadocliente.AsBoolean or
         not qryClientesProdutostabuleiro_ter_contadocliente.AsBoolean then
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := (((qryClientesProdutosvalormoedatabuleiropallet.AsFloat * qryClientesProdutoscotacaotabuleiropallet.asfloat * qryClientesProdutosqttabuleiro_ter.AsFloat))
                                                         * 100)/ qryClientesProdutosqtcaixa_ter.AsFloat
      else
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 0
    end
    else
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 0;

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=E'+inttostr(Linha)+'*'+'F'+inttostr(Linha);
  end;

//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;

  Excel.workbooks[1].Sheets[1].range['A10:H'+inttostr(Linha)].Borders.LineStyle := xlContinuous;

  Excel.WorkBooks[1].Sheets[1].Range['B10','B'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['C10','C'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['D10','D'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['E10','E'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['F10','F'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['G10','G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['H10','H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);


  linha := LInha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Summe Materialeinzelkosten';

  {
  if vFormulaSomatorioProdutos<>'' then
  begin
    delete(vFormulaSomatorioProdutos,length(vFormulaSomatorioProdutos),1);
    vFormulaSomatorioProdutos := '='+vFormulaSomatorioProdutos;
  end;
  }
  vFormulaSomatorioProdutos2 := vFormulaSomatorioProdutos2 + 'H'+inttostr(Linha-1)+')';


  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := vFormulaSomatorioProdutos2; (*'=SUM(H10:H'+inttostr(Linha-1)+')';*)
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.###.##0,00';

  vFormulaCustoMateriais := 'H'+inttostr(Linha)+'+';

  linha := LInha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'MGK-Satz';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '##0,00%';
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].SpecialCells(xlCellTypeFormulas)
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := qryParametrosProducaoperccustoestoque.AsFloat/100;

  linha := LInha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'MGK';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(linha-2)+'* H'+inttostr(linha-1)+')';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.###.##0,00';
  vFormulaCustoMateriais := vFormulaCustoMateriais + 'H'+inttostr(Linha)+'+';

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(Linha-2),'G'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-2),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.workbooks[1].Sheets[1].range['H'+inttostr(Linha-2),'H'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-2),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  linha := LInha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Importnebenkosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '##0,00%';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := qryParametrosProducaoperccustoadimpgeral.AsFloat/100;

  if vFormulaProdutosImportados<>'' then
  begin
    delete(vFormulaProdutosImportados,length(vFormulaProdutosImportados),1);
    insert('(',vFormulaProdutosImportados,0);
    insert(')',vFormulaProdutosImportados,length(vFormulaProdutosImportados)+1);
    vFormulaProdutosImportados := '='+vFormulaProdutosImportados + '* H'+inttostr(Linha);
  end;

  linha := LInha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Importnebenkosten-Gemeinkosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.###.##0,00';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := vFormulaProdutosImportados;

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(Linha-1),'G'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-1),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.workbooks[1].Sheets[1].range['H'+inttostr(Linha-1),'H'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-1),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

//  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-1),'H'+inttostr(Linha)]
  Excel.workbooks[1].Sheets[1].range['H'+inttostr(linha-1)+':H'+inttostr(linha)].Interior.Color := $00E1E1FF;

  vFormulaCustoMateriais := vFormulaCustoMateriais + 'H'+inttostr(Linha)+'+';

  if vFormulaCustoMateriais<>'' then
  begin
    delete(vFormulaCustoMateriais,length(vFormulaCustoMateriais),1);
    insert('=(',vFormulaCustoMateriais,0);
    insert(')',vFormulaCustoMateriais,length(vFormulaCustoMateriais)+1);
  end;

  linha := LInha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].font.bold := true;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Materialkosten';

  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := vFormulaCustoMateriais;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].font.bold := true;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].font.color := $000000CC;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].font.size := 12;

  vFormulaCustosdeProducao := 'H'+inttostr(Linha)+' + ';

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(Linha),'G'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.workbooks[1].Sheets[1].range['H'+inttostr(Linha),'H'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  // PRODUÇÃO
  vFormulaProcessos := '';
  qryFluxogramas.First;
  while not qryFluxogramas.Eof do
  begin

    linha := LInha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Fertigungskosten ' + qryFluxogramastitulocusto.AsString;

    if qryFluxoGramascorplanilhacusto.asstring<> '' then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := StringtoColor(qryFluxoGramascorplanilhacusto.asstring);

    {
    case qryFluxogramas.recno of
    1: Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := $007ABCBC;
    2: Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := $00FFE0C1;
    3: Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := $00FF93C9;
    end;}

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].font.bold := true;

    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 'BT';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,5].HorizontalAlignment := xlCenter;

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,5].font.bold := true;

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := 'HA';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].font.bold := true;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].HorizontalAlignment := xlCenter;

    Excel.workbooks[1].Sheets[1].range['B'+inttostr(Linha),'D'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

    Excel.workbooks[1].Sheets[1].range['E'+inttostr(Linha),'G'+inttostr(Linha)].Borders.LineStyle := xlContinuous;
    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

    Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

    linha := LInha + 1;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Arbeitsgang';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 'te (min./%)';

    Excel.workbooks[1].Sheets[1].Cells[Linha,6].Interior.Color := clYellow;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 'LK/STD';
    Excel.workbooks[1].Sheets[1].Cells[Linha,7].Interior.Color := clYellow;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := 'Kalk.-Wert';

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := 'te (min./%)';

    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(linha)+':H'+inttostr(linha)].HorizontalAlignment := 3; {- Center}

    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.LineStyle := xlContinuous;

    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.Weight := xlThick;
    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.Color := clBlack;
    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].font.bold := true;

    linha := LInha + 1;

    qryFluxogramasOperacoes.First;
    vFormulaSomatorioTempoPadrao :='=SUM(G'+inttostr(Linha)+':G';
    while not qryFluxogramasOperacoes.Eof do
    begin
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1].NumberFormat := '@';
      Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'C'+inttostr(Linha)].MergeCells:= true;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := strtofloat(trocar(qryFluxogramasOperacoessequencia.asstring,'.',','));

      if qryFluxoGramascorplanilhacusto.asstring<> '' then
      begin
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := StringtoColor(qryFluxoGramascorplanilhacusto.asstring);
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,4].Interior.color := StringtoColor(qryFluxoGramascorplanilhacusto.asstring);
      end;  

      {
      case qryFluxogramas.recno mod 3  of
      1: begin
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := $007ABCBC;
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,4].Interior.color := $007ABCBC;
         end;
      2: begin
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := $00FFE0C1;
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,4].Interior.color := $00FFE0C1;
         end;
      0: begin
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,2].Interior.color := $00FF93C9;
           Excel.WorkBooks[1].Sheets[1].Cells[Linha,4].Interior.color := $00FF93C9;
         end;
      end;
      }
      
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := qryFluxogramasOperacoesnome.AsString+' - '+qryFluxogramasOperacoesdescricaooperacao.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := qryFluxogramasOperacoestipo.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := qryFluxogramasOperacoesmediatempopadrao.AsFloat;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5].NumberFormat := '###.###.##0,00';

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6].NumberFormat := '##0,00%';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 1;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := '=(E'+inttostr(Linha)+'* F'+inttostr(Linha)+')';

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '###.###.##0,00';

  //    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '';
      qryFluxogramasOperacoes.next;
      if qryFluxogramasOperacoes.eof then
        vFormulaSomatorioTempoPadrao := vFormulaSomatorioTempoPadrao + inttostr(Linha)+')';

      Linha := Linha + 1;
    end;

//    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;

    LinhaAux := Linha - qryFluxogramasOperacoes.recordcount;

    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linhaAux)+':H'+inttostr(linha-1)].Borders.LineStyle := xlContinuous;

    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(LinhaAux),'D'+inttostr(Linha-1)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(LinhaAux),'E'+inttostr(Linha-1)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['F'+inttostr(LinhaAux),'F'+inttostr(Linha-1)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['G'+inttostr(LinhaAux),'G'+inttostr(Linha-1)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(LinhaAux),'H'+inttostr(Linha-1)].BorderAround(xlContinuous, xlThick, Color := clblack);


//    Linha := Linha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Summealfwand';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '###.##0,00';

    if qryFluxoGramascorplanilhacusto.asstring<> '' then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := StringtoColor(qryFluxoGramascorplanilhacusto.asstring);
      
    {
    case qryFluxogramas.recno mod 3  of
    1: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $007ABCBC;
    2: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $00FFE0C1;
    0: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $00FF93C9;
    end;
    }

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := vFormulaSomatorioTempoPadrao;

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := trocar(vFormulaSomatorioTempoPadrao,'G','H');

    Linha := Linha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := format('Lohnfaktor Produktion  (R$ %s/hora = R$ %s/min)',[formatfloat('###0.00',qryFluxogramascustohomemhora.Asfloat), formatfloat('###0.0000',qryFluxogramascustohomemhora.Asfloat/60)]);
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := qryFluxogramascustohomemhora.Asfloat/60;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '###.##0,0000';

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,0000';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := trocar(vFormulaSomatorioTempoPadrao,'G','H');

    Linha := Linha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Fertigungseinzelkosten';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := '=(G'+inttostr(Linha-2)+'* G'+inttostr(Linha-1)+')';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-2)+'* H'+inttostr(Linha-1)+')';

    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha-2)+':H'+inttostr(linha)].Borders.LineStyle := xlContinuous;

    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-2),'D'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(Linha-2),'E'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['F'+inttostr(Linha-2),'F'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['G'+inttostr(Linha-2),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-2),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    

    Linha := Linha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'FGK-Satz';

    if qryFluxoGramascorplanilhacusto.asstring<> '' then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := StringtoColor(qryFluxoGramascorplanilhacusto.asstring);

    {
    case qryFluxogramas.recno mod 3  of
    1: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $007ABCBC;
    2: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $00FFE0C1;
    0: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $00FF93C9;
    end;
    }

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '##0,00%';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := qryFluxogramasfatorcusto.AsFloat/100;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-2)+'* H'+inttostr(Linha-1)+')';


    Linha := Linha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Fertigungsgemeinkosten';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := '=(G'+inttostr(Linha-2)+'* G'+inttostr(Linha-1)+')';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-2)+'/100 * H'+inttostr(Linha-1)+')';

    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha-1)+':H'+inttostr(linha)].Borders.LineStyle := xlContinuous;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-1),'D'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(Linha-1),'E'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['F'+inttostr(Linha-1),'F'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['G'+inttostr(Linha-1),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-1),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

    Linha := Linha + 1;
    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'D'+inttostr(Linha)].MergeCells:= true;
//    Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Fertigungskosten';
    vFormulaProcessos := vFormulaProcessos + 'G'+inttostr(Linha)+'+';

    if qryFluxoGramascorplanilhacusto.asstring<> '' then
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := StringtoColor(qryFluxoGramascorplanilhacusto.asstring);

    {
    case qryFluxogramas.recno mod 3  of
    1: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $007ABCBC;
    2: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $00FFE0C1;
    0: Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].Interior.color := $00FF93C9;
    end;
    }

    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].font.bold := true;
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := '=(G'+inttostr(Linha-3)+'+ G'+inttostr(Linha-1)+')';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-3)+'+ H'+inttostr(Linha-1)+')';

{    Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].BorderAround(xlContinuous, xlThick, Color := clblack);}



    Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha)+':D'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
    Excel.WorkBooks[1].Sheets[1].Range['E'+inttostr(Linha)+':E'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
//    Excel.WorkBooks[1].Sheets[1].Range['F'+inttostr(Linha)+':F'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
//    Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha)+':H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);


  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
//    Excel.WorkBooks[1].Sheets[1].Range['G'+inttostr(Linha)+':G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clRed);

    Excel.workbooks[1].Sheets[1].range['G'+inttostr(Linha)+':G'+inttostr(Linha)].Borders.Weight := xlThick;
    Excel.workbooks[1].Sheets[1].range['G'+inttostr(Linha)+':G'+inttostr(Linha)].Borders.Color := clRed;



    qryFluxogramas.Next;
  end;

  if vFormulaProcessos <> '' then
  begin
    delete(vFormulaProcessos,length(vFormulaProcessos),1);
    vFormulaProcessos := '=('+vFormulaProcessos+')';
  end;

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Summe Fertigungskosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := vFormulaProcessos;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].font.color := $000000CC;
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].font.size := 12;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';
  vFormulaCustosdeProducao := '=('+vFormulaCustosdeProducao + 'H'+inttostr(Linha)+' )';


//  Linha := Linha + 1;
//  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
//  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Herstellkosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := vFormulaCustosdeProducao;
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.workbooks[1].Sheets[1].range['B'+inttostr(Linha)+':H'+inttostr(Linha)].font.bold := true;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Verwaltungskosten - Gemeinkosten-Satz';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := qryParametrosProducaoperccustoadm.AsFloat/100;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '##0,00%';

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Verwaltungskosten-Gemeinkosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-2)+' * H'+inttostr(Linha-1)+')';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha-1)+':H'+inttostr(linha)].Borders.LineStyle := xlContinuous;

  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-1),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-1),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);


  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Vertrieskosten-Gemeinkosten-Satz';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := qryParametrosProducaoperccustovenda.AsFloat/100;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '##0,00%';

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Vertrieskosten-Gemeinkosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-4)+' * H'+inttostr(Linha-1)+')';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha-1)+':H'+inttostr(linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-1),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-1),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);


  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Entwicklungskosten-Gemeinkosten-Satz';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := qryParametrosProducaoperccustodesenv.AsFloat/100;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '##0,00%';

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Entwicklungskosten-Gemeinkosten';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-6)+' * H'+inttostr(Linha-1)+')';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha-1)+':H'+inttostr(linha)].Borders.LineStyle := xlContinuous;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha-1),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha-1),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);


  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['D'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Vertriesfaktoren';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryParametrosProducaopercmargemlucro.AsFloat;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3].NumberFormat := '##0,00';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := '%';

  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=100/(100-C'+inttostr(Linha)+')';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);


  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Selbstkosten R$/%';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=(H'+inttostr(Linha-8)+' + H'+inttostr(Linha-6)+ ' + H'+inttostr(Linha-4)+ '+  H'+inttostr(Linha-2)+ ') * H'+inttostr(Linha-1);
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Excel.WorkBooks[1].Sheets[1].Range['B'+inttostr(Linha),'G'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);
  Excel.WorkBooks[1].Sheets[1].Range['H'+inttostr(Linha),'H'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Range['D'+inttostr(Linha),'G'+inttostr(Linha)].MergeCells:= true;
//  Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha-9;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := 'Selbstkosten €/%';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := qryClientesProdutoscotacaoeuro.asfloat;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := qryClientesProdutosdatacotacaoeuro.AsDateTime;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,4].HorizontalAlignment := 3; {- Center}
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3].NumberFormat := '###.##0,00';

  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := '=H' + inttostr(Linha-1) + ' / C' + inttostr(Linha);
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8].NumberFormat := '###.##0,00';

  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.Weight := xlThick;
  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.Color := clBlack;
  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].font.bold := true;


  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.Weight := xlThick;
  Excel.workbooks[1].Sheets[1].range['B'+inttostr(linha)+':H'+inttostr(linha)].Borders.Color := clBlack;
  Excel.WorkBooks[1].Sheets[1].Range['A10:A'+inttostr(Linha)].BorderAround(xlContinuous, xlThick, Color := clblack);

  Excel.WorkBooks[1].Sheets[1].Name:= 'Custo PN';

  Excel.Cells.Select;
  Excel.Selection.Columns.AutoFit;


//  if FileExists(ParSistema.DiretorioImagens+'logoExcel.bmp') then
//    Excel.WorkBooks[1].Sheets[1].Shapes.AddPicture(ParSistema.DiretorioImagens+'logoExcel.bmp',0, 1, 25, 40, 150, 40);

//  Excel.WorkBooks[1].SaveAs('c:\custo.xls' {LocalGravacao});

//  Excel.Application.Workbooks[1].SaveAs('c:\Custo.xls');

//  Excel.WorkBooks.Open('c:\custo.xls'{LocalGravacao});

  vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas';

  if not DirectoryExists(vNomeArquivo) then
    if not CreateDir(vNomeArquivo) then
      raise Exception.Create('Impossível criar o diretório '+vNomeArquivo);

  vNomeArquivo := vNomeArquivo+'\Custo_PN_'+qryClientesProdutospn.asstring+'.xls';

  try
  oWB.SaveAs(vNomeArquivo); except end;

  Excel.Visible:= True;
end;

end.
