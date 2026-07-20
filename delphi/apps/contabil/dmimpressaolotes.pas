unit dmimpressaolotes;

interface

uses
  SysUtils, Classes, dmbasico, FR_Class, FR_DSet, FR_DBSet, DB, ZQuery,
  ZPgSqlQuery, cpquery, biblio, fmpreviewpadrao, ctconstantes, ZTransact,
  cpdatasource, dmtecsoft;

type
  TdtmImpressaoLotes = class(TdtmBasico)
    qryImpressaoLotes: TtecQuery;
    qryImpressaoLotesdata: TDateField;
    qryImpressaoLotesnrlancto: TIntegerField;
    qryImpressaoLotesfilial: TIntegerField;
    qryImpressaoLoteshistorico: TIntegerField;
    qryImpressaoLotesdescricaohistoricocomplemento: TMemoField;
    qryImpressaoLotescodigo: TIntegerField;
    qryImpressaoLotesdescricao: TStringField;
    qryImpressaoLotesvalordebito: TFloatField;
    qryImpressaoLotesvalorcredito: TFloatField;
    qryImpressaoLotesordenacao: TStringField;
    fdsImpressaoLotes: TfrDBDataSet;
    frpImpressaoLotes: TfrReport;
    qryImpressaoLotesorigem: TStringField;
    qryImpressaoLotesnrorigem: TLargeintField;
    qryImpressaoLotesdescricaonrorigem: TStringField;
    qryImpressaoLotesordenacaodescricaonrorigem: TStringField;
    qryImpressaoTotaisLotes: TtecQuery;
    dsrImpressaoLotes: TtecDataSource;
    fdsImpressaoTotaisLotes: TfrDBDataSet;
    frpImpressaoTotaisLotes: TfrReport;
    qryImpressaoTotaisLotesdescricaonrorigem: TStringField;
    qryImpressaoTotaisLotesvalordebito: TFloatField;
    qryImpressaoTotaisLotesvalorcredito: TFloatField;
    qryImpressaoTotaisLotescodigo: TIntegerField;
    qryImpressaoTotaisLotesdescricao: TStringField;
    qryImpressaoTotaisLotesclassificacao: TStringField;
    procedure frpImpressaoLotesBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpImpressaoTotaisLotesBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirLotes(DataInicial, DataFinal,
                            DataInicialAlteracao, DataFinalAlteracao,
                            LoteInicial, LoteFinal,
                            OrigemConsulta, Conta,
                            Classificacao, tipo,
                            descricaoconta: String;
                            ExcetoConta, TotaisporLote: boolean;
                            Ordenacao: integer);
  end;

var
  dtmImpressaoLotes: TdtmImpressaoLotes;

implementation

{$R *.dfm}

{ TdtmImpressaoLotes }

procedure TdtmImpressaoLotes.ImprimirLotes(DataInicial, DataFinal,
  DataInicialAlteracao, DataFinalAlteracao,
  LoteInicial, LoteFinal, OrigemConsulta, Conta,
  Classificacao, tipo, descricaoconta : String;
  ExcetoConta, TotaisPorLote: Boolean; Ordenacao: integer);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  subtitulo : String;
  i : integer;
const
  SQLClassificacao = 'and position(%s in pl.classificacao)=1';
  SQLExcetoClassificacao = 'and not (position(%s in pl.classificacao)=1)';

  SQLConta = 'and (pl.codigo = %s)';
  SQLExcetoConta = 'and (pl.codigo <> %s)';

begin
  qryImpressaoLotes.ParamByName('Filial').AsInteger := FilialBase;
  qryImpressaoLotes.MacroByName('datalancto').Asstring :=
    MontarIntervaloData('l.data',DataInicial,DataFinal);
  qryImpressaoLotes.MacroByName('dataalteracao').Asstring :=
    MontarIntervaloData('l.alteracao',DataInicialAlteracao,DataFinalAlteracao);


  subtitulo:= 'FILIAL '+inttostr(FilialBase)+#13;

  if (DataInicial<>'') and (DataFinal<>'') then
    subtitulo := subtitulo +  'LANÇAMENTOS DE '+ DataInicial+
                              ' A ' + DataFinal+#13
  else
  if DataInicial<>'' then
    subtitulo := subtitulo +  'LANÇAMENTOS EM '+ DataInicial+#13
  else
  if DataFinal<>'' then
    subtitulo := subtitulo + 'LANÇAMENTOS EM '+ DataFinal+#13;


  if (DataInicialAlteracao<>'') and (DataFinalAlteracao<>'') then
    subtitulo := subtitulo +  'ALTERADOS DE '+ DataInicialAlteracao+
                              ' A ' + DataFinalAlteracao+#13
  else
  if DataInicialAlteracao<>'' then
    subtitulo := subtitulo +  'ALTERADOS EM '+ DataInicialAlteracao+#13
  else
  if DataFinalAlteracao<>'' then
    subtitulo := subtitulo + 'ALTERADOS EM '+ DataFinalAlteracao+#13;

  if OrigemConsulta <> '' then
  begin
    qryImpressaoLotes.MacroByName('origem').AsString := ' and l.origem in (' + OrigemConsulta + ')';
    subtitulo := subtitulo + 'ORIGEM '+OrigemConsulta;
  end
  else
    qryImpressaoLotes.MacroByName('origem').AsString := '';

  if (LoteInicial<>'') and (LoteFinal<>'') then
  begin
    qryImpressaoLotes.MacroByName('lotes').AsString := ' and l.origem in (''L'',''X'') and l.nrorigem between '+LoteInicial+' and '+LoteFinal;
    if LoteInicial=LoteFinal then
      subtitulo := subtitulo + ' LOTE '+LoteInicial+#13
    else
      subtitulo := subtitulo + ' LOTES DE '+LoteInicial+' A '+LoteFinal+#13;

  end
  else
  if (LoteInicial<>'') and (LoteFinal='') then
  begin
    qryImpressaoLotes.MacroByName('lotes').AsString := ' and l.origem in (''L'',''X'') and l.nrorigem >= '+LoteInicial;
    subtitulo := subtitulo + ' LOTES A PARTIR DE '+LoteInicial+#13;
  end
  else
  if (LoteInicial='') and (LoteFinal<>'') then
  begin
    qryImpressaoLotes.MacroByName('lotes').AsString := ' and l.origem in (''L'',''X'') and l.nrorigem <= '+LoteFinal;
    subtitulo := subtitulo + ' LOTES ATÉ '+LoteFinal+#13;
  end
  else
    qryImpressaoLotes.MacroByName('lotes').AsString := '';

  qryImpressaoLotes.MacroByName('conta').AsString := '';
  if conta <> '' then
  begin
   if tipo = 'A' then
   begin
    if ExcetoConta then
    begin
      qryImpressaoLotes.MacroByName('conta').AsString := Format(SQLExcetoConta, [conta]);
      subtitulo := subtitulo + 'EXCETO CONTA: '+descricaoconta;
    end
    else
    begin
      qryImpressaoLotes.MacroByName('conta').AsString := Format(SQLConta, [conta]);
      subtitulo := subtitulo + 'CONTA: '+descricaoconta;
    end;
   end
   else
   begin
     if ExcetoConta then
     begin
       qryImpressaoLotes.MacroByName('conta').AsString := Format(SQLExcetoClassificacao, [quotedstr(classificacao)]);
       subtitulo := subtitulo + 'EXCETO CONTA: '+descricaoconta;
     end
     else
     begin
       qryImpressaoLotes.MacroByName('conta').AsString := Format(SQLClassificacao, [quotedstr(classificacao)]);
       subtitulo := subtitulo + 'CONTA: '+descricaoconta;
     end;
   end;
  end;
  qryImpressaoLotes.parambyName('ordenacaopordata').Asboolean := ordenacao = 0;
  qryImpressaoLotes.Close;
  qryImpressaoLotes.Open;
  if TotaisporLote then
  begin
    qryImpressaoTotaisLotes.Macros :=  qryImpressaoLotes.Macros;
    qryImpressaoTotaisLotes.Params := qryImpressaoLotes.Params;
    qryImpressaoTotaisLotes.Close;
    qryImpressaoTotaisLotes.Open;
  end;

  if (qryImpressaoLotes.RecordCount > 0) then
  begin
    frVariables['Titulo']:= 'LOTES DE LANÇAMENTO';
    frVariables['TituloTotais']:= 'LOTES - TOTAIS POR CONTA';
    frVariables['subTitulo']:= subtitulo;

//   frpImpressaoTotaisLotes.DesignReport;

    frmPreview := TfrmPreviewPadrao.create(self);
    frmPreview.cmbZoom.ItemIndex := 3;
    try
     Relatorio := frmPreview.frCompositeReport;
     frmPreview.frCompositeReport.Reports.Clear;
     frmPreview.frCompositeReport.Reports.Add(frpImpressaoLotes);
     if TotaisporLote then
       frmPreview.frCompositeReport.Reports.Add(frpImpressaoTotaisLotes);
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
    finally
     frmPreview.Free;
    end;
  end
  else
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, ['lançamento']));
end;

procedure TdtmImpressaoLotes.frpImpressaoLotesBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpImpressaoLotes, view);
end;


procedure TdtmImpressaoLotes.frpImpressaoTotaisLotesBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpImpressaoTotaisLotes, view);
end;

end.
