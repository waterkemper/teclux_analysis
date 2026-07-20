unit dmdiarioauxiliarfornecedores;

interface

uses
  SysUtils, Classes, dmbasico, DB, FR_DSet, FR_DBSet, FR_Class, ZQuery,
  ZPgSqlQuery, cpquery, fmpreviewpadrao, biblio, dmimprimetermos,
  cpdatasource, ctconstantes, ZTransact, dmtecsoft;

type
  TdtmDiarioAuxiliarFornecedores = class(TdtmBasico)
    qryDiarioAuxiliarFornecedores_anterior: TtecQuery;
    frpDiarioAuxiliarFornecedores_anterior: TfrReport;
    fdsDiarioAuxiliarFornecedores_anterior: TfrDBDataSet;
    qryDiarioAuxiliarFornecedores: TtecQuery;
    frpDiarioAuxiliarFornecedores: TfrReport;
    fdsDiarioAuxiliarFornecedores: TfrDBDataSet;
    frpDiarioAuxiliarFornecedoresTotal: TfrReport;
    qryParametrosFiliais: TtecQuery;
    qryParametrosFiliaisparametro: TIntegerField;
    qryParametrosFiliaisvalor: TStringField;
    qryParametrosFiliaisnome: TStringField;
    dsrParametrosFiliais: TtecDataSource;
    qryDiarioAuxiliarFornecedoresemissao: TDateField;
    qryDiarioAuxiliarFornecedoresdatalancto: TDateField;
    qryDiarioAuxiliarFornecedoresdocumentopag: TIntegerField;
    qryDiarioAuxiliarFornecedoresnomefornecedor: TStringField;
    qryDiarioAuxiliarFornecedoresfornecedor: TIntegerField;
    qryDiarioAuxiliarFornecedorescodigodaconta: TStringField;
    qryDiarioAuxiliarFornecedorescodigodaconta_ordem: TIntegerField;
    qryDiarioAuxiliarFornecedoresdescricaoevento: TStringField;
    qryDiarioAuxiliarFornecedoresdebito: TFloatField;
    qryDiarioAuxiliarFornecedorescredito: TFloatField;
    qryCodigosEmitentes: TtecQuery;
    qryCodigosEmitentesfornecedor: TIntegerField;
    qryCodigosEmitentestipofornecedor: TStringField;
    qryCodigosEmitentesnome: TStringField;
    qryCodigosEmitentesestado: TStringField;
    qryCodigosEmitentescnpj: TStringField;
    qryCodigosEmitentesinscricaoestadual: TStringField;
    fdsCodigosEmitentes: TfrDBDataSet;
    frpCodigosEmitentes: TfrReport;
    procedure frpDiarioAuxiliarFornecedores_anteriorBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpDiarioAuxiliarFornecedoresTotalBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure qryParametrosFiliaisCalcFields(DataSet: TDataSet);
    procedure qryParametrosFiliaisAfterInsert(DataSet: TDataSet);
    procedure frpCodigosEmitentesBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpDiarioAuxiliarFornecedoresGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpDiarioAuxiliarFornecedoresTotalGetValue(
      const ParName: String; var ParValue: Variant);
    procedure frpCodigosEmitentesGetValue(const ParName: String;
      var ParValue: Variant);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  protected
    ImpressaoTermos: TdtmImprimeTermos;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirDiarioAuxiliarFornecedores(TipoRelatorio: Integer;
                                 DataInicial, DataFinal, Livro, Pagina, Maximo: String;
                                 TodasFiliais: Boolean;
                                 ListaFiliais: String;
                                 SaldoDebito, SaldoCredito: Currency;
                                 LivroAuxiliar, ResumoDiario, CodigosEmitentes: Boolean);
    constructor Create(AOwner: TComponent); override;
  end;

var
  dtmDiarioAuxiliarFornecedores: TdtmDiarioAuxiliarFornecedores;

implementation

{$R *.dfm}

{ TdtmDiarioAuxiliarFornecedores }

procedure TdtmDiarioAuxiliarFornecedores.ImprimirDiarioAuxiliarFornecedores(
  TipoRelatorio: Integer; DataInicial, DataFinal, Livro, Pagina,
  Maximo: String; TodasFiliais: Boolean;
  ListaFiliais: String;
  SaldoDebito, SaldoCredito: Currency;
  LivroAuxiliar, ResumoDiario, CodigosEmitentes: Boolean);
const
SQLFilialEmissao = 'and (dp.filialemissao in (%S))';
SQLFilialPagamento = 'and (d.filialpagto in (%S))';
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  qryDiarioAuxiliarFornecedores.MacroByName('FilialEmissao').AsString := '';
  qryDiarioAuxiliarFornecedores.MacroByName('FilialPagamento').AsString := '';
  qryCodigosEmitentes.MacroByName('FilialEmissao').AsString := '';
  qryCodigosEmitentes.MacroByName('FilialPagamento').AsString := '';
  if Not TodasFiliais then
  begin
    qryDiarioAuxiliarFornecedores.MacroByName('FilialEmissao').AsString := format(SQLFilialEmissao, [ListaFiliais]);
    qryDiarioAuxiliarFornecedores.MacroByName('FilialPagamento').AsString := format(SQLFilialPagamento, [ListaFiliais]);
    qryCodigosEmitentes.MacroByName('FilialEmissao').AsString := format(SQLFilialEmissao, [ListaFiliais]);
    qryCodigosEmitentes.MacroByName('FilialPagamento').AsString := format(SQLFilialPagamento, [ListaFiliais]);
  end;

  frVariables['DataExtensoInicial']:= DataExtenso(strtodatetime(DataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodatetime(DataFinal));
  frVariables['DataInicial']:= DataInicial;
  frVariables['DataFinal']:= DataFinal;
  frVariables['SaldoDebito']:= SaldoDebito;
  frVariables['SaldoCredito']:= SaldoCredito;
  if Livro = '' then
    frVariables['Livro'] := 0
  else
    frVariables['Livro'] := Livro;
  frVariables['Pagina']:= Pagina;
  frVariables['Maximo']:= Maximo;

  frVariables['Titulo']:= 'LIVRO DIÁRIO AUXILIAR DE FORNECEDORES';
  frVariables['subTitulo']:= 'ENTRE '+DataInicial+' E '+DataFinal;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
     case TipoRelatorio of
     0: begin
          if CodigosEmitentes then
            with qryCodigosEmitentes do
            begin
              ParamByName('datainicial').AsString := datainicial;
              ParamByName('datafinal').AsString := DataFinal;
              close;
              open;
            end;

          if LivroAuxiliar or CodigosEmitentes then
            with qryDiarioAuxiliarFornecedores do
            begin
              ParamByName('saldodebito').AsCurrency := SaldoDebito;
              ParamByName('saldocredito').AsCurrency := SaldoCredito;
              ParamByName('datainicial').AsString := datainicial;
              ParamByName('datafinal').AsString := DataFinal;

              qryParametrosFiliais.First;
              while not qryParametrosFiliais.Eof do
              begin
                if qryParametrosFiliaisnome.AsString = 'FORNECEDOR' then
                begin
                  if qryParametrosFiliaisvalor.AsString<>'' then
                    ParamByName('FORNECEDOR').AsString := qryParametrosFiliaisvalor.AsString
                  else
                    ParamByName('FORNECEDOR').AsString := qryParametrosFiliaisnome.AsString;
                end;

                if qryParametrosFiliaisnome.AsString = 'JUROS' then
                begin
                  if qryParametrosFiliaisvalor.AsString<>'' then
                    ParamByName('JUROS').AsString := qryParametrosFiliaisvalor.AsString
                  else
                    ParamByName('JUROS').AsString := qryParametrosFiliaisnome.AsString;
                end;

                if qryParametrosFiliaisnome.AsString = 'DESCONTOS' then
                begin
                  if qryParametrosFiliaisvalor.AsString<>'' then
                    ParamByName('DESCONTOS').AsString := qryParametrosFiliaisvalor.AsString
                  else
                    ParamByName('DESCONTOS').AsString := qryParametrosFiliaisnome.AsString;
                end;
                qryParametrosFiliais.Next;
              end;
              close;
              open;
            end;

          Perpetrar([qryParametrosFiliais]);

//          frpDiarioAuxiliarFornecedores.DesignReport;
//          frpDiarioAuxiliarFornecedoresTotal.DesignReport;

          frVariables['FORNECEDORES'] := qryDiarioAuxiliarFornecedores.parambyname('FORNECEDOR').AsString;
          frVariables['JUROS']        := qryDiarioAuxiliarFornecedores.parambyname('JUROS').AsString;
          frVariables['DESCONTOS']    := qryDiarioAuxiliarFornecedores.parambyname('DESCONTOS').AsString;

//frpDiarioAuxiliarFornecedores.DesignReport;
//frpDiarioAuxiliarFornecedoresTotal.DesignReport;
//frpCodigosEmitentes.DesignReport;
          frCompositeReport.Reports.Clear;
          if LivroAuxiliar then
            frCompositeReport.Reports.Add(frpDiarioAuxiliarFornecedores);
          if ResumoDiario then
            frCompositeReport.Reports.Add(frpDiarioAuxiliarFornecedoresTotal);
          if CodigosEmitentes then
            frCompositeReport.Reports.Add(frpCodigosEmitentes);
        end;
     1: begin
          if not Assigned(ImpressaoTermos) then
           ImpressaoTermos := TdtmImprimeTermos.Create(Self);
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
procedure TdtmDiarioAuxiliarFornecedores.frpDiarioAuxiliarFornecedores_anteriorBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpDiarioAuxiliarFornecedores, view);
end;

procedure TdtmDiarioAuxiliarFornecedores.frpDiarioAuxiliarFornecedoresTotalBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpDiarioAuxiliarFornecedoresTotal, view);
end;

procedure TdtmDiarioAuxiliarFornecedores.qryParametrosFiliaisCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryParametrosFiliaisparametro.asinteger = 265 then  //fornecedor
    qryParametrosFiliaisnome.asstring := 'FORNECEDOR'
  else
  if qryParametrosFiliaisparametro.asinteger = 266 then  //juro
    qryParametrosFiliaisnome.asstring := 'JUROS'
  else
  if qryParametrosFiliaisparametro.asinteger = 267 then  //desconto
    qryParametrosFiliaisnome.asstring := 'DESCONTOS';
end;

constructor TdtmDiarioAuxiliarFornecedores.Create(AOwner: TComponent);
begin
  inherited;
  qryParametrosFiliais.tag := ctTabelas;
end;

procedure TdtmDiarioAuxiliarFornecedores.qryParametrosFiliaisAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryParametrosFiliais.cancel;
end;

procedure TdtmDiarioAuxiliarFornecedores.frpCodigosEmitentesBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpCodigosEmitentes, view);

end;

procedure TdtmDiarioAuxiliarFornecedores.frpDiarioAuxiliarFornecedoresGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  parValue := parametrorelatorio(ParName);
end;

procedure TdtmDiarioAuxiliarFornecedores.frpDiarioAuxiliarFornecedoresTotalGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  parValue := parametrorelatorio(ParName);

end;

procedure TdtmDiarioAuxiliarFornecedores.frpCodigosEmitentesGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  parValue := parametrorelatorio(ParName);

end;

procedure TdtmDiarioAuxiliarFornecedores.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\diaauxfor.sql') then
    Listar.loadfromfile('c:\diaauxfor.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\diaauxfor.sql');
  listar.free;
end;

end.
