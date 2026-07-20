unit dmrazaoauxiliarfornecedores;

interface

uses
  SysUtils, Classes, dmbasico, DB, FR_DSet, FR_DBSet, FR_Class, ZQuery,
  ZPgSqlQuery, cpquery, fmpreviewpadrao, biblio, dmimprimetermos;

type
  TdtmRazaoAuxiliarFornecedores = class(TdtmBasico)
    qryRazaoAuxiliarFornecedores: TtecQuery;
    frpRazaoAuxiliarFornecedores: TfrReport;
    fdsRazaoAuxiliarFornecedores: TfrDBDataSet;
    qryRazaoAuxiliarFornecedoresemissao: TDateField;
    qryRazaoAuxiliarFornecedoresdatalancto: TDateField;
    qryRazaoAuxiliarFornecedoresnotafiscal: TIntegerField;
    qryRazaoAuxiliarFornecedoresdocumentopag: TIntegerField;
    qryRazaoAuxiliarFornecedoresfornecedor: TStringField;
    qryRazaoAuxiliarFornecedorescontrapartida: TMemoField;
    qryRazaoAuxiliarFornecedoreshistorico: TMemoField;
    qryRazaoAuxiliarFornecedoresdebito: TFloatField;
    qryRazaoAuxiliarFornecedorescredito: TFloatField;
    procedure frpRazaoAuxiliarFornecedoresBeforePrint(Memo: TStringList;
      View: TfrView);
  protected
    ImpressaoTermos: TdtmImprimeTermos;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRazaoAuxiliarFornecedores(TipoRelatorio: Integer;
                                 DataInicial, DataFinal, Livro, Pagina, Maximo: String;
                                 TodasFiliais: Boolean;
                                 ListaFiliais: String;
                                 SaldoDebito, SaldoCredito: Currency);
  end;

var
  dtmRazaoAuxiliarFornecedores: TdtmRazaoAuxiliarFornecedores;

implementation

{$R *.dfm}

{ TdtmRazaoAuxiliarFornecedores }

procedure TdtmRazaoAuxiliarFornecedores.ImprimirRazaoAuxiliarFornecedores(
  TipoRelatorio: Integer; DataInicial, DataFinal, Livro, Pagina,
  Maximo: String; TodasFiliais: Boolean;
  ListaFiliais: String;
  SaldoDebito, SaldoCredito: Currency);
const
SQLFilialEmissao = 'and (dp.filialemissao in (%S))';
SQLFilialPagamento = 'and (d.filialpagto in (%S))';
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  qryRazaoAuxiliarFornecedores.MacroByName('FilialEmissao').AsString := '';
  qryRazaoAuxiliarFornecedores.MacroByName('FilialPagamento').AsString := '';
  if Not TodasFiliais then
  begin
    qryRazaoAuxiliarFornecedores.MacroByName('FilialEmissao').AsString := format(SQLFilialEmissao, [ListaFiliais]);
    qryRazaoAuxiliarFornecedores.MacroByName('FilialPagamento').AsString := format(SQLFilialPagamento, [ListaFiliais]);
  end;

  frVariables['DataExtensoInicial']:= DataExtenso(strtodatetime(DataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodatetime(DataFinal));
  frVariables['DataInicial']:= DataInicial;
  frVariables['DataFinal']:= DataFinal;
  frVariables['SaldoDebito']:= SaldoDebito;
  frVariables['SaldoCredito']:= SaldoCredito;

  frVariables['Livro'] := Livro;
  frVariables['Pagina']:= Pagina;
  frVariables['Maximo']:= Maximo;

  frVariables['Titulo']:= 'LIVRO RAZÃO AUXILIAR DE FORNECEDORES';
  frVariables['subTitulo']:= 'ENTRE '+DataInicial+' E '+DataFinal;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
     case TipoRelatorio of
     0: begin
          ReFazConsulta(qryRazaoAuxiliarFornecedores,[0,1,2,3],
          [SaldoDebito,SaldoCredito,datainicial,datafinal]);
//          frpRazaoAuxiliarFornecedores.DesignReport;
          frCompositeReport.Reports.Clear;
          frCompositeReport.Reports.Add(frpRazaoAuxiliarFornecedores);
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

procedure TdtmRazaoAuxiliarFornecedores.frpRazaoAuxiliarFornecedoresBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRazaoAuxiliarFornecedores, view);
end;

end.
