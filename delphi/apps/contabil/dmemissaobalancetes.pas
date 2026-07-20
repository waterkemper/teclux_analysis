unit dmemissaobalancetes;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, biblio,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, fmpreviewpadrao, clparametrossistema,
  QCheckLst, ZTransact, dateutils, dmlancamentocontabilidade,
  ctconstantes, variants;

const
  filial = 1;

type
  TdtmEmissaoBalancetes = class(TdtmBasico)
    fdbImprimirBalanco: TfrDBDataSet;
    frpNormalCompleto: TfrReport;
    frpSomenteSaldo: TfrReport;
    frpNormalSC: TfrReport;
    frpLivroCompleto: TfrReport;
    frpLivroSC: TfrReport;
    frpSomenteSaldoSC: TfrReport;
    qryImprimirBalanco: TtecQuery;
    frpNormalCompletoAgrupado: TfrReport;
    frpLivroCompletoAgrupado: TfrReport;
    frpNormalAgrupadoSC: TfrReport;
    frpLivroAgrupadoSC: TfrReport;
    frpSomenteSaldoAgrupado: TfrReport;
    frpSomenteSaldoAgrupadoSC: TfrReport;
    qryImprimirBalancodescricao: TStringField;
    qryImprimirBalancodescricaoedentada: TStringField;
    qryImprimirBalancoclassificacao: TStringField;
    qryImprimirBalancotipo: TStringField;
    qryImprimirBalancoultimolancto: TDateField;
    qryImprimirBalancosaldoanterior: TFloatField;
    qryImprimirBalancodebitos: TFloatField;
    qryImprimirBalancocreditos: TFloatField;
    qryImprimirBalancofilial: TIntegerField;
    qryImprimirBalancorazao: TStringField;
    qryImprimirBalancocnpj: TStringField;
    qryImprimirBalancoinscricaoestadual: TStringField;
    qryImprimirBalancosaldoatual: TFloatField;
    qryProcuraFiliais: TtecQuery;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryProcuraFiliaisexercicio: TStringField;
    qryProcuraFiliaisresultadosintetica: TStringField;
    qryProcuraFiliaisresultadoanalitica: TStringField;
    qryProcuraFiliaishistoricoencerramento: TStringField;
    qryAcumularSaldosContabeis: TtecQuery;
    qryImprimirBalanco_Consolidado: TtecQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField1: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField4: TFloatField;
    procedure frpNormalCompletoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroCompletoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpNormalSCBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpLivroSCBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpSomenteSaldoBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpSomenteSaldoSCBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpNormalCompletoAgrupadoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroCompletoAgrupadoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpNormalAgrupadoSCBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroAgrupadoSCBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpSomenteSaldoAgrupadoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpSomenteSaldoAgrupadoSCBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpNormalCompletoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroCompletoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpNormalSCGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroSCGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpSomenteSaldoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpSomenteSaldoSCGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpNormalCompletoAgrupadoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroCompletoAgrupadoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroAgrupadoSCGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpNormalAgrupadoSCGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpSomenteSaldoAgrupadoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpSomenteSaldoAgrupadoSCGetValue(const ParName: String;
      var ParValue: Variant);

  private

    FCabecalho: String;
    FForma: integer;
    procedure VerificarCabecalho(Relatorio: TfrReport; View: TfrView);
    { Private declarations }
  public
    { Public declarations }
    ListadeFiliais: array [1..2] of TStringList;
    procedure ImprimirBalanco(Forma, Funcao: Integer;
      MesInicial, MesFinal,
      Livro, Pagina, Maximo, Filiais, ContaSintetica,
      ClassificacaoContaSintetica, ListaAnalitica: String;
      ListaSintetica: vString;
      SomenteSaldo, ComSaldo, Classificacao,
      ImprimirCodigoReduzido, TodasFiliais, Consolidar,
      LinhaBranco, UltimoMovto, DataResponsavel, OrdenarporCodigoReduzido: Boolean;
      ListaFiliaisSelecionadas, ListaGeraldeFiliais: TStringList);
    procedure LimparParametros;
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;

  end;

var dtmEmissaoBalancetes: TdtmEmissaoBalancetes;
    Exercicio: integer;

implementation

{$R *.dfm}

{ TdtmEmissaoBalancetes }



procedure TdtmEmissaoBalancetes.ImprimirBalanco(Forma, Funcao: Integer;
  MesInicial, MesFinal, Livro, Pagina, Maximo, Filiais, ContaSintetica,
  ClassificacaoContaSintetica, ListaAnalitica: String;
  ListaSintetica: vString;  SomenteSaldo, ComSaldo,
  Classificacao, ImprimirCodigoReduzido, TodasFiliais, Consolidar, LinhaBranco,
  UltimoMovto, DataResponsavel, OrdenarporCodigoReduzido: Boolean;
  ListaFiliaisSelecionadas, ListaGeraldeFiliais: TStringList);
var
{
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;}
  i:integer;
  data : TDateTime;

const
  SQLClassificacao = 'and position(CAST(%s AS VARCHAR) in CAST(pc.classificacao AS VARCHAR))=1';
  SQLClassificacao2 = 'and position(CAST(%s AS VARCHAR) in CAST(pc2.classificacao AS VARCHAR))=1';

  FiltroFiliais = ' AND ( sc.filial IN (%s)) ' +#13#10;
  FiltroFiliais2 = ' AND ( sc2.filial IN (%s)) ' +#13#10;

  FiltroContasAnaliticas = ' ( pc.codigo IN (%s)) ' +#13#10;
  FiltroContasAnaliticas2 = ' ( pc2.codigo IN (%s)) ' +#13#10;

  FiltroContasSinteticas = ' (position(CAST(%s AS VARCHAR) in CAST(%s.classificacao AS VARCHAR))=1) ';

  function CondicaoListaSintetica(alias: String): String;
  var
    a: Integer;
    SQL: String;
  begin
    SQL := '';
    for a := 0 to High(ListaSintetica) do
      SQL := SQL + format(FiltroContasSinteticas,[quotedstr(ListaSintetica[a]),alias]) + 'OR';
    Delete(SQL,length(sql)-1,2);
    result := SQL;
  end;

  function TotalSaldoDC(alias, tiposaldo: String): String;
  var
    i: integer;
  begin
    result := '';
    for i:=StrToInt(copy(MesInicial,1,2)) to StrToInt(copy(MesFinal,1,2)) do
    begin
      if result <> '' then
        result := result + '+';

      if tiposaldo = 'D' then
        result := result + alias + '.debitos[' + inttostr(i) + ']'
      else
      if tiposaldo = 'C' then
        result := result + alias + '.creditos[' + inttostr(i) + ']'
    end;
  end;

begin
  qryImprimirBalanco.ParamByName('ImprimirCodigoReduzido').AsBoolean := ImprimirCodigoReduzido;
  qryImprimirBalanco.ParamByName('ContaComSaldo').AsBoolean := ComSaldo;

  if Funcao = 3 then
  begin

    ListadeFiliais[filial].Clear;

    data := strtodatetime(inttostr(DaysInMonth(strtodatetime('01/'+MesFinal)))+'/'+MesFinal);
    if ListaFiliaisSelecionadas.Count<>0 then
      ListadeFiliais[filial] := ListaFiliaisSelecionadas
    else
      ListadeFiliais[filial] := ListaGeraldeFiliais;

    for i:=0 to ListadeFiliais[filial].count -1 do
      RefazConsultaPorNome(qryAcumularSaldosContabeis,['Exercicio','Filial','OrigemX'],
                                     [yearOf(strtodatetime('01/'+MesFinal)), ListadeFiliais[filial].strings[i], False  ]);
  end;

  FForma := forma;
  AtribuirParametrosBaseRelatorio;
  frVariables['DataExtensoFinal']:= DataExtenso(strtodatetime(
     inttostr(DaysInMonth(strtodate('01/'+MesFinal)))+'/'+MesFinal));
  frVariables['DataResponsavel'] := DataResponsavel;
  if (pos(',',Filiais)<>0) or  TodasFiliais then
    AtribuirParametrosBaseRelatorio
  else
    AtribuirParametrosBaseRelatorio(Filiais);

  if Livro = '' then
    frVariables['Livro'] := 0
  else frVariables['Livro'] := Livro;
  frVariables['PAGINA'] := Pagina;

  frVariables['Maximo'] := Maximo;

  if TodasFiliais then
  begin
    qryImprimirBalanco.MacroByName('WHEREFILIAL').AsString := '';
    qryImprimirBalanco.MacroByName('WHEREFILIAL2').AsString := '';
    FCabecalho := 'Balancete Consolidado';
  end
  else
  begin
    qryImprimirBalanco.MacroByName('WHEREFILIAL').AsString := Format(FiltroFiliais, [Filiais]);
    qryImprimirBalanco.MacroByName('WHEREFILIAL2').AsString := Format(FiltroFiliais2, [Filiais]);
  end;

  if funcao=0 then
  begin
    if ((ListaAnalitica <> '') and (length(ListaSintetica) <> 0)) then
    begin
      qryImprimirBalanco.MacroByName('listadecontas').AsString :=
         'AND (' + Format(FiltroContasAnaliticas,[listaAnalitica]) + 'OR (' +
         CondicaoListaSintetica('pc')+'))';

      qryImprimirBalanco.MacroByName('listadecontas2').AsString :=
         'AND (' + Format(FiltroContasAnaliticas,[listaAnalitica]) + 'OR (' +
         CondicaoListaSintetica('pc2')+'))';
    end
    else
    if (ListaAnalitica <> '') then
    begin
      qryImprimirBalanco.MacroByName('listadecontas').AsString := 'AND' + Format(FiltroContasAnaliticas,[listaAnalitica]);
      qryImprimirBalanco.MacroByName('listadecontas2').AsString := 'AND' + Format(FiltroContasAnaliticas2,[listaAnalitica]);
    end
    else
    if (length(ListaSintetica) <> 0) then
    begin
      qryImprimirBalanco.MacroByName('listadecontas').AsString :=
         'AND (' + CondicaoListaSintetica('pc')+')';

      qryImprimirBalanco.MacroByName('listadecontas2').AsString :=
         'AND (' + CondicaoListaSintetica('pc2')+')';
    end
  end
  else
  begin
    qryImprimirBalanco.MacroByName('listadecontas').AsString := '';
    qryImprimirBalanco.MacroByName('listadecontas2').AsString := '';
  end;

  if ClassificacaoContaSintetica<>'' then
  begin
    qryImprimirBalanco.MacroByName('WHERECONTA').AsString := Format(SQLClassificacao, [ClassificacaoContaSintetica]);
    qryImprimirBalanco.MacroByName('WHERECONTA2').AsString := Format(SQLClassificacao2, [ClassificacaoContaSintetica]);
    if not assigned(dtmlancamentocontabilidade) then
      dtmLancamentoContabilidade := TdtmLancamentoContabilidade.Create(self);
    dtmLancamentoContabilidade.AtualizarParametrosContaResultado(strtoint(ContaSintetica));
  end
  else
  begin
    qryImprimirBalanco.MacroByName('WHERECONTA').AsString := '';
    qryImprimirBalanco.MacroByName('WHERECONTA2').AsString := '';
  end;

  if Funcao = 1 then
    qryImprimirBalanco.MacroByName('sintetico').AsString := 'and pc.tipo = ''S'''
  else
    qryImprimirBalanco.MacroByName('sintetico').AsString := '';

  if ComSaldo then
  begin
    if SomenteSaldo then
      qryImprimirBalanco.MacroByName('SubConta').AsString := 'where ((coalesce(saldos.saldoanterior,0) + coalesce(saldos.debitos,0) - coalesce(saldos.creditos,0)) <> 0) '+
                                                             ' or SinteticaComSaldonasAnaliticas'

    else
      qryImprimirBalanco.MacroByName('SubConta').AsString := 'where (coalesce(saldos.saldoanterior,0) <> 0) or (coalesce(saldos.debitos,0) <> 0)' +
                                                               ' or (coalesce(saldos.creditos,0) <> 0) or SinteticaComSaldonasAnaliticas';
  end
  else
  begin
    qryImprimirBalanco.MacroByName('SubConta').AsString := '';

//    qryImprimirBalanco.MacroByName('sintetico').AsString := '';  //segundo bug#2217
  end;


  qryImprimirBalanco.ParamByName('ultimomes').AsDateTime := UltimoDiaMesAnterior(StrToDate('28/'+MesInicial));

  qryImprimirBalanco.macroByName('MesesDebitos_sc').AsString := TotalSaldoDC('sc','D');
  qryImprimirBalanco.macroByName('MesesCreditos_sc').AsString := TotalSaldoDC('sc','C');
  qryImprimirBalanco.macroByName('MesesDebitos_sc2').AsString := TotalSaldoDC('sc2','D');
  qryImprimirBalanco.macroByName('MesesCreditos_sc2').AsString := TotalSaldoDC('sc2','C');

  frVariables['Linha_em_Branco'] := LinhaBranco;
  if OrdenarporCodigoReduzido then
    qryImprimirBalanco.MacroByName('Ordenacao').AsString := 'Order By filial, classificacao, codigo'
  else
    qryImprimirBalanco.MacroByName('Ordenacao').AsString := 'Order By filial, classificacao, UPPER(TO_ASCII(DescricaoConta,''LATIN1''))';

//  RefazConsulta(qryImprimirBalanco, [2], [copy(Periodo,4,4)]);
//  frpSomenteSaldoAgrupado.DesignReport;

  Exercicio:= FLVal(Copy(MesInicial,4,4));
//  frmPreview := TfrmPreviewPadrao.Create(Self);
  try
//    Relatorio := frmPreview.frCompositeReport;
//    with frmPreview do
    begin
      RefazConsultaPorNome(qryImprimirBalanco, ['exercicio'], [copy(MesInicial,4,4)]);
//      frCompositeReport.Reports.Clear;

      frVariables['Linha_em_Branco'] := LinhaBranco;

      if Consolidar then
      begin
        if Forma = 0 then
        begin
          if MesInicial = MesFinal then
            frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                        ' DE ' + copy(MesInicial,4,4)
          else
            frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                        ' A ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                        ' DE ' + copy(MesFinal,4,4);

          case funcao of
          0: frVariables['TITULO'] := 'BALANCETE ANALÍTICO';
          1: frVariables['TITULO'] := 'BALANCETE SINTÉTICO';
          2: begin
              frVariables['TITULO'] := 'BALANÇO PATRIMONIAL';
              frVariables['SUBTITULO'] := ' EM ' + inttostr(DaysInMonth(strtodate('01/'+MesFinal)))+
                                          ' DE ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                          ' DE ' + copy(MesFinal,4,4);
             end;
          3: frVariables['TITULO'] := 'DEMONSTRATIVO DE RESULTADOS';
          end;

          if not SomenteSaldo then
          begin
            if Classificacao then
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalCompleto], false, self)
//                frCompositeReport.Reports.Add(frpNormalCompleto)
              else
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroCompleto], false, self);
//                frCompositeReport.Reports.Add(frpLivroCompleto);
            end
            else
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalSC], false, self)
//                frCompositeReport.Reports.Add(frpNormalSC)
              else
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroSC], false, self)
//                frCompositeReport.Reports.Add(frpLivroSC);
            end;
          end
          else
          begin
            if Classificacao then
            begin
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldo], false, self);
//              frCompositeReport.Reports.Add(frpSomenteSaldo)
            end
            else
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldoSC], false, self);
//              frCompositeReport.Reports.Add(frpSomenteSaldoSC);
          end;
        end
        else
        begin
          case funcao of
          0,1: begin
                 frVariables['TITULO'] := 'LIVRO DIÁRIO';
                 if MesInicial = MesFinal then
                   frVariables['SUBTITULO'] := 'BALANCETE SUSPENSÃO/REDUÇÃO - ' +
                                     ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                     ' DE ' + copy(MesInicial,4,4)
                 else
                   frVariables['SUBTITULO'] := 'BALANCETE SUSPENSÃO/REDUÇÃO - ' +
                                     ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                        ' A ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                        ' DE ' + copy(MesFinal,4,4);

               end;
          2: begin
               frVariables['TITULO'] := 'BALANÇO PATRIMONIAL';
               frVariables['SUBTITULO'] := ' EM ' + inttostr(DaysInMonth(strtodate('01/'+MesFinal)))+
                                           ' DE ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                           ' DE ' + copy(MesFinal,4,4);
             end;
          3: begin
                 frVariables['TITULO'] := 'DEMONSTRATIVO DE RESULTADOS';
                 frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                        ' A ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                        ' DE ' + copy(MesFinal,4,4);

             end;

          end;

          if not SomenteSaldo then
          begin
            if Classificacao then
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalCompleto], false, self)
//                frCompositeReport.Reports.Add(frpNormalCompleto)
              else
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroCompleto], false, self);
//                frCompositeReport.Reports.Add(frpLivroCompleto);
            end
            else
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalSC], false, self)
//                frCompositeReport.Reports.Add(frpNormalSC)
              else
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroSC], false, self)
//                frCompositeReport.Reports.Add(frpLivroSC);
            end
          end
          else
          begin
            if Classificacao then
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldo], false, self)
//              frCompositeReport.Reports.Add(frpSomenteSaldo)
            else
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldoSC], false, self)
//              frCompositeReport.Reports.Add(frpSomenteSaldoSC);
          end;
        end
      end
      else        //CONSOLIDAR(NÃO AGRUPAR) NÃO MARCADO
      begin
        if Forma = 0 then
        begin
          if MesInicial = MesFinal then
            frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                        ' DE ' + copy(MesInicial,4,4)
          else
            frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                        ' A ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                        ' DE ' + copy(MesFinal,4,4);
          case funcao of
          0: frVariables['TITULO'] := 'BALANCETE ANALÍTICO';
          1: frVariables['TITULO'] := 'BALANCETE SINTÉTICO';
          2: begin
              frVariables['TITULO'] := 'BALANÇO PATRIMONIAL';
              frVariables['SUBTITULO'] := ' EM ' + inttostr(DaysInMonth(strtodate('01/'+MesFinal)))+
                                          ' DE ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                          ' DE ' + copy(MesFinal,4,4);
             end;
          3: frVariables['TITULO'] := 'DEMONSTRATIVO DE RESULTADOS';
          end;

          if not SomenteSaldo then
          begin
            if Classificacao then
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalCompletoAgrupado], false, self)
//                frCompositeReport.Reports.Add(frpNormalCompletoAgrupado)
              else
              begin
//              frpLivroCompletoAgrupado.DesignReport;
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroCompletoAgrupado], false, self)
//                frCompositeReport.Reports.Add(frpLivroCompletoAgrupado);
              end;
            end
            else
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalAgrupadoSC], false, self)
//                frCompositeReport.Reports.Add(frpNormalAgrupadoSC)
              else
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroAgrupadoSC], false, self)
//                frCompositeReport.Reports.Add(frpLivroAgrupadoSC);
            end;
          end
          else
          begin
            if Classificacao then
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldoAgrupado], false, self)
//              frCompositeReport.Reports.Add(frpSomenteSaldoAgrupado)
            else
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldoAgrupadoSC], false, self)
//              frCompositeReport.Reports.Add(frpSomenteSaldoAgrupadoSC);
          end;
        end
        else
        begin
          case funcao of
          0,1: begin
                 frVariables['TITULO'] := 'LIVRO DIÁRIO';
                 if MesInicial = MesFinal then
                   frVariables['SUBTITULO'] := 'BALANCETE SUSPENSÃO/REDUÇÃO - ' +
                                     ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                     ' DE ' + copy(MesInicial,4,4)
                 else
                   frVariables['SUBTITULO'] := 'BALANCETE SUSPENSÃO/REDUÇÃO - ' +
                                     ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                     ' A ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                     ' DE ' + copy(MesFinal,4,4);
               end;

          2: begin
               frVariables['TITULO'] := 'BALANÇO PATRIMONIAL';
               frVariables['SUBTITULO'] := ' EM ' + inttostr(DaysInMonth(strtodate('01/'+MesFinal)))+
                                           ' DE ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                           ' DE ' + copy(MesFinal,4,4);
             end;
          3: begin
                 frVariables['TITULO'] := 'DEMONSTRATIVO DE RESULTADOS';
                 if MesInicial = MesFinal then
                   frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                                ' DE ' + copy(MesInicial,4,4)
                 else
                   frVariables['SUBTITULO'] := ANSIUpperCase(MesExtenso(strtoint(copy(MesInicial,0,2)))) +
                                     ' A ' + ANSIUpperCase(MesExtenso(strtoint(copy(MesFinal,0,2)))) +
                                     ' DE ' + copy(MesFinal,4,4);
             end;
          end;

          if not SomenteSaldo then
          begin
            if Classificacao then
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalCompletoAgrupado], false, self)
//                frCompositeReport.Reports.Add(frpNormalCompletoAgrupado)
              else
              begin
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroCompletoAgrupado], false, self)
//                frCompositeReport.Reports.Add(frpLivroCompletoAgrupado);
              end;
            end
            else
            begin
              if UltimoMovto then
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpNormalAgrupadoSC], false, self)
//                frCompositeReport.Reports.Add(frpNormalAgrupadoSC)
              else
                ImprimirRelatoriofast(null, null, MSimples, 0, [frpLivroAgrupadoSC], false, self)
//                frCompositeReport.Reports.Add(frpLivroAgrupadoSC);
            end
          end
          else
          begin
            if Classificacao then
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldoAgrupado], false, self)
//              frCompositeReport.Reports.Add(frpSomenteSaldoAgrupado)
            else
              ImprimirRelatoriofast(null, null, MSimples, 0, [frpSomenteSaldoAgrupadoSC], false, self)
//              frCompositeReport.Reports.Add(frpSomenteSaldoAgrupadoSC);
          end;
        end;
      end;
    end;

    qryImprimirBalanco.Close;
    qryImprimirBalanco.Open;

    if Funcao = 3 then
    begin
      for i:=0 to ListadeFiliais[filial].count -1 do
        RefazConsultaPorNome(qryAcumularSaldosContabeis,['Exercicio','Filial','OrigemX'],
                                       [yearOf(strtodatetime('01/'+MesFinal)), ListadeFiliais[filial].strings[i], True ]);

    end;
    perpetrar([]);
//    Relatorio.Preview := frmPreview.frPreviewPadrao;
//    Relatorio.ShowReport;
//    frmPreview.ShowModal;
  finally//    frmPreview.Free;
    LimparParametros;
  end;
end;


procedure TdtmEmissaoBalancetes.frpNormalCompletoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpNormalCompleto,View);
  VerificarCabecalho  (frpNormalCompleto,View);
end;

procedure TdtmEmissaoBalancetes.frpLivroCompletoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroCompleto,View);
  VerificarCabecalho(frpLivroCompleto,View);
end;

procedure TdtmEmissaoBalancetes.frpNormalSCBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpNormalSC,View);
  VerificarCabecalho(frpNormalSC,View);
end;

procedure TdtmEmissaoBalancetes.frpLivroSCBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroSC,View);
  VerificarCabecalho(frpLivroSC,View);

end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpSomenteSaldo,View);
  VerificarCabecalho(frpSomenteSaldo,View);

end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoSCBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpSomenteSaldoSC,View);
  VerificarCabecalho(frpSomenteSaldoSC,View);

end;

procedure TdtmEmissaoBalancetes.LimparParametros;
begin
  qryImprimirBalanco.ParamByName('ultimomes').Asstring := '';

  qryImprimirBalanco.macroByName('MesesDebitos_sc').AsString := '';
  qryImprimirBalanco.macroByName('MesesCreditos_sc').AsString := '';
  qryImprimirBalanco.macroByName('MesesDebitos_sc2').AsString := '';
  qryImprimirBalanco.macroByName('MesesCreditos_sc2').AsString := '';

  qryImprimirBalanco.MacroByName('wherefilial').AsString := '';
  qryImprimirBalanco.MacroByName('wherefilial2').AsString := '';
  qryImprimirBalanco.MacroByName('sintetico').AsString := '';
  qryImprimirBalanco.MacroByName('SubConta').AsString := '';
end;

procedure TdtmEmissaoBalancetes.frpNormalCompletoAgrupadoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpNormalCompletoAgrupado, View);
  VerificarCabecalho  (frpNormalCompletoAgrupado,View);
end;

procedure TdtmEmissaoBalancetes.frpLivroCompletoAgrupadoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroCompletoAgrupado, View);
  VerificarCabecalho  (frplivroCompletoAgrupado,View);
end;

procedure TdtmEmissaoBalancetes.frpNormalAgrupadoSCBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpNormalAgrupadoSC, View);
  VerificarCabecalho  (frpNormalAgrupadoSC,View);
end;

procedure TdtmEmissaoBalancetes.frpLivroAgrupadoSCBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroAgrupadoSC, View);
  VerificarCabecalho  (frpLivroAgrupadoSC, View);
end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoAgrupadoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpSomenteSaldoAgrupado, View);
  VerificarCabecalho  (frpSomenteSaldoAgrupado, View);
end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoAgrupadoSCBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpSomenteSaldoAgrupadoSC, View);
  VerificarCabecalho  (frpSomenteSaldoAgrupadoSC, View);
end;

procedure TdtmEmissaoBalancetes.frpNormalCompletoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpLivroCompletoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpNormalSCGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpLivroSCGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoSCGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpNormalCompletoAgrupadoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpLivroCompletoAgrupadoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpLivroAgrupadoSCGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpNormalAgrupadoSCGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoAgrupadoGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;

procedure TdtmEmissaoBalancetes.frpSomenteSaldoAgrupadoSCGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  ParValue := ParametroRelatorio(parname);
end;


destructor TdtmEmissaoBalancetes.Destroy;
begin
  inherited;
  if assigned(dtmlancamentocontabilidade) then
    dtmLancamentoContabilidade := nil;
end;

procedure TdtmEmissaoBalancetes.VerificarCabecalho(Relatorio: TfrReport; View: TfrView);
begin
  case FForma of
  0: begin
      if view.Name = 'mmoQUADROPAGINA' then view.visible := false;
      if view.Name = 'mmoROTULOPAGINA' then view.visible := false;
      if view.Name = 'mmoPAGINA' then view.visible := false;
      if view.Name = 'mmoLIVRO' then view.visible := false;
      if view.Name = 'mmoROTULOLIVRO' then view.visible := false;

      if view.Name = 'mmoDATANORMAL' then view.visible := true;
      if view.Name = 'mmoPAGINANORMAL' then view.visible := true;
     end;
  1: begin
      if view.Name = 'mmoQUADROPAGINA' then view.visible := true;
      if view.Name = 'mmoROTULOPAGINA' then view.visible := true;
      if view.Name = 'mmoPAGINA' then view.visible := true;
      if view.Name = 'mmoLIVRO' then view.visible := true;
      if view.Name = 'mmoROTULOLIVRO' then view.visible := true;

      if view.Name = 'mmoDATANORMAL' then view.visible := false;
      if view.Name = 'mmoPAGINANORMAL' then view.visible := false;
     end;
  end;
end;

constructor TdtmEmissaoBalancetes.Create(AOwner: TComponent);
begin
  inherited;
  ListadeFiliais[filial] := TStringList.Create;
end;

end.
