unit dmlivrodiario;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, FR_Class,
  FR_DSet, FR_DBSet, fmpreviewpadrao, dmimprimetermos, biblio, ZTransact;

type
  TdtmLivroDiario = class(TdtmBasico)
    qryLivroDiario: TtecQuery;
    fdsLivroDiario: TfrDBDataSet;
    frpLivroDiario: TfrReport;
    qryLivroDiarioFiliais: TtecQuery;
    fdsLivroDiarioFiliais: TfrDBDataSet;
    qryLivroDiariodata: TDateField;
    qryLivroDiarionrlancto: TIntegerField;
    qryLivroDiariofilial: TIntegerField;
    qryLivroDiariohistorico: TIntegerField;
    qryLivroDiariodescricaohistoricocomplemento: TMemoField;
    qryLivroDiariocodigo: TIntegerField;
    qryLivroDiariodescricao: TStringField;
    qryLivroDiariovalordebito: TFloatField;
    qryLivroDiariovalorcredito: TFloatField;
    qryLivroDiarioordenacao: TStringField;
    qryLivroDiarioFiliaisdata: TDateField;
    qryLivroDiarioFiliaisnrlancto: TIntegerField;
    qryLivroDiarioFiliaisfilial: TIntegerField;
    qryLivroDiarioFiliaishistorico: TIntegerField;
    qryLivroDiarioFiliaisdescricaohistoricocomplemento: TMemoField;
    qryLivroDiarioFiliaiscodigo: TIntegerField;
    qryLivroDiarioFiliaisdescricao: TStringField;
    qryLivroDiarioFiliaisvalordebito: TFloatField;
    qryLivroDiarioFiliaisvalorcredito: TFloatField;
    qryLivroDiarioFiliaisordenacao: TStringField;
    qryLivroDiarioFiliaisrazao: TStringField;
    qryLivroDiarioFiliaiscnpj: TStringField;
    qryLivroDiarioFiliaisinscricaoestadual: TStringField;
    frpLivroDiarioFiliais: TfrReport;
    qryLivroDiarioSaldo: TtecQuery;
    qryLivroDiarioFiliaisSaldo: TtecQuery;
    frpLivroDiarioSaldo: TfrReport;
    frpLivroDiarioFiliaisSaldo: TfrReport;
    fdsLivroDiarioSaldo: TfrDBDataSet;
    fdsLivroDiarioFiliaisSaldo: TfrDBDataSet;
    qryLivroDiarioSaldodata: TDateField;
    qryLivroDiarioSaldosomadebitar: TFloatField;
    qryLivroDiarioSaldosomacreditar: TFloatField;
    qryLivroDiarioSaldosaldo: TFloatField;
    qryLivroDiarioFiliaisSaldofilial: TIntegerField;
    qryLivroDiarioFiliaisSaldorazao: TStringField;
    qryLivroDiarioFiliaisSaldocnpj: TStringField;
    qryLivroDiarioFiliaisSaldoinscricaoestadual: TStringField;
    qryLivroDiarioFiliaisSaldodata: TDateField;
    qryLivroDiarioFiliaisSaldosomadebito: TFloatField;
    qryLivroDiarioFiliaisSaldosomacredito: TFloatField;
    qryLivroDiarioFiliaisSaldosaldo: TFloatField;
    procedure frpLivroDiarioBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpLivroDiarioGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroDiarioFiliaisBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroDiarioFiliaisGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroDiarioSaldoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroDiarioFiliaisSaldoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroDiarioSaldoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroDiarioFiliaisSaldoGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
  protected
    ImpressaoTermos: TdtmImprimeTermos;    
    function DataLivro(Data: TDateTime; Completo: Boolean): String;
  public
    procedure ImprimirLivroDiario(TipoRelatorio, TotaisDiarios:Integer;
                                  OpcaoDiaNovaPagina, ConsolidarFiliais,
                                  TodasSelecionadas:Boolean;
                                  Livro, Pagina, Maximo, SaldoDebito, SaldoCredito,
                                  DataInicial, DataFinal, ListaFiliais: String);
    { Public declarations }
  end;

var
  dtmLivroDiario: TdtmLivroDiario;

implementation

{$R *.dfm}

{ TdtmLivroDiario }

procedure TdtmLivroDiario.ImprimirLivroDiario(TipoRelatorio, TotaisDiarios: Integer;
  OpcaoDiaNovaPagina, ConsolidarFiliais, TodasSelecionadas: Boolean;
  Livro, Pagina, Maximo, SaldoDebito, SaldoCredito, DataInicial, DataFinal, ListaFiliais: String);
const
  SQLFilial = 'and (filial in (%S))';

var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin

  if (pos(',',ListaFiliais)<>0) or TodasSelecionadas then
    AtribuirParametrosBaseRelatorio
  else
    AtribuirParametrosBaseRelatorio(ListaFiliais);

  if ConsolidarFiliais then
  begin
    if TotaisDiarios <> 2 then
    begin
      if TodasSelecionadas then
        qryLivroDiario.MacroByName('Filiais').AsString := ''
      else
        qryLivroDiario.MacroByName('Filiais').AsString := format(SQLFilial, [ListaFiliais]);
    end
    else
    begin
      if TodasSelecionadas then
        qryLivroDiarioSaldo.MacroByName('filiais').AsString := ''
      else
        qryLivroDiarioSaldo.MacroByName('Filiais').AsString := format(SQLFilial, [ListaFiliais]);
    end
  end
  else
  begin
    if TotaisDiarios <> 2 then
    begin
      if TodasSelecionadas then
        qryLivroDiarioFiliais.MacroByName('Filiais').AsString := ''
      else
        qryLivroDiarioFiliais.MacroByName('Filiais').AsString := format(SQLFilial, [ListaFiliais]);
    end
    else
    begin
      if TodasSelecionadas then
        qryLivroDiarioFiliaisSaldo.MacroByName('Filiais').AsString := ''
      else
        qryLivroDiarioFiliaisSaldo.MacroByName('Filiais').AsString := format(SQLFilial, [ListaFiliais]);
    end
  end;

  frVariables['DataExtensoInicial']:= DataExtenso(strtodatetime(DataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodatetime(DataFinal));
  frVariables['DataInicial']:= DataInicial;
  frVariables['DataFinal']:= DataFinal;
  frVariables['Titulo']:= 'LIVRO DIÁRIO';
  frVariables['subTitulo']:= 'PERÍODO DE ' + DataLivro(strtodate(DataInicial),false) +
                             ' A ' + DataLivro(strtodate(DataFinal),true);
  if Livro = '' then
    frVariables['Livro'] := 0
  else frVariables['Livro'] := Livro;
  frVariables['Pagina']:= Pagina;
  frVariables['Maximo']:= Maximo;
  frVariables['SaldoDebito_'] := SaldoDebito;
  frVariables['SaldoDebitoOriginal'] := SaldoDebito;
  frVariables['SaldoCredito_'] := SaldoCredito;
  frVariables['SaldoCreditoOriginal'] := SaldoCredito;
  frVariables['OpcaoTotaisDiarios'] := TotaisDiarios = 1;
  frVariables['OpcaoDiaNovaPagina'] := OpcaoDiaNovaPagina;
//  ReFazConsulta(qryLivroDiarioFiliaisSaldo, [0,1], [DataInicial, DataFinal]);
//  frpLivroDiarioFiliaisSaldo.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3;
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
     case TipoRelatorio of
     0: begin
          if ConsolidarFiliais then
          begin
            if TotaisDiarios <> 2 then
            begin
              ReFazConsulta(qryLivroDiario, [0,1], [DataInicial, DataFinal]);
              frCompositeReport.Reports.Clear;
              frCompositeReport.Reports.Add(frpLivroDiario);
            end
            else
            begin
              ReFazConsulta(qryLivroDiarioSaldo, [0,1], [DataInicial, DataFinal]);
              frCompositeReport.Reports.Clear;
              frCompositeReport.Reports.Add(frpLivroDiarioSaldo);
            end
          end
          else
          begin
            if TotaisDiarios <> 2 then
            begin
              RefazConsulta(qryLivroDiarioFiliais, [0,1], [DataInicial, DataFinal]);
              frCompositeReport.Reports.Clear;
              frCompositeReport.Reports.Add(frpLivroDiarioFiliais);
            end
            else
            begin
              RefazConsulta(qryLivroDiarioFiliaisSaldo, [0,1], [DataInicial, DataFinal]);
              frCompositeReport.Reports.Clear;
              frCompositeReport.Reports.Add(frpLivroDiarioFiliaisSaldo);
            end
          end;
        end;
     1: begin
          if not Assigned(ImpressaoTermos) then
           ImpressaoTermos := TdtmImprimeTermos.Create(Self);
//           ImpressaoTermos.frpTermos_R.DesignReport;
          frCompositeReport.Reports.Add(ImpressaoTermos.frpTermos_R);
        end;
     end;
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;

  finally

   frmPreview.Free;

  end;
end;

procedure TdtmLivroDiario.frpLivroDiarioBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroDiario,View);
end;

function TdtmLivroDiario.DataLivro(Data: TDateTime; Completo: Boolean): String;
var
  Dia, Mes, Ano: Word;
begin
  DecodeDate(Data, ano, mes, dia);
  if Completo then
    if dia < 10 then
      result := '0' + inttostr(dia) + '/' + ANSIUpperCase(copy(mesextenso(mes),0,3)) + '/' + copy(inttostr(ano),3,2)
    else
      result := inttostr(dia) + '/' + ANSIUpperCase(copy(mesextenso(mes),0,3)) + '/' + copy(inttostr(ano),3,2)
  else
    if dia < 10 then
      result := '0' + inttostr(dia) + '/' + ANSIUpperCase(copy(mesextenso(mes),0,3))
    else
      result := inttostr(dia) + '/' + ANSIUpperCase(copy(mesextenso(mes),0,3));
end;

procedure TdtmLivroDiario.frpLivroDiarioGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(ParName);
end;

procedure TdtmLivroDiario.frpLivroDiarioFiliaisBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroDiarioFiliais,View);
end;

procedure TdtmLivroDiario.frpLivroDiarioFiliaisGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(ParName);
end;

procedure TdtmLivroDiario.frpLivroDiarioSaldoBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroDiarioSaldo,View);
end;

procedure TdtmLivroDiario.frpLivroDiarioFiliaisSaldoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroDiarioFiliaisSaldo,View);
end;

procedure TdtmLivroDiario.frpLivroDiarioSaldoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(ParName);
end;

procedure TdtmLivroDiario.frpLivroDiarioFiliaisSaldoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(ParName);
end;


end.
