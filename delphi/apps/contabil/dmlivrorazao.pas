unit dmlivrorazao;

interface

uses
  SysUtils, Classes, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  //projetos
   ctconstantes, clparametrossistema, dmbasico, fmpreviewpadrao,
   dmimprimetermos,biblio,
  //terceiros
  FR_DSet, FR_DBSet, FR_Class, ZTransact, Provider, DBClient;

type
  TdtmLivroRazao = class(TdtmBasico)
    qryLivroRazao: TtecQuery;
    fdsLivroRazao: TfrDBDataSet;
    qryLivroRazaonrlancto: TIntegerField;
    qryLivroRazaodata: TDateField;
    qryLivroRazaoorigem: TStringField;
    qryLivroRazaocontrapartida: TIntegerField;
    qryLivroRazaovalordebito: TFloatField;
    qryLivroRazaovalorcredito: TFloatField;
    qryLivroRazaohistorico: TIntegerField;
    qryLivroRazaocodigo: TIntegerField;
    qryLivroRazaodescricao: TStringField;
    qryLivroRazaoclassificacao: TStringField;
    qryLivroRazaodescricaohistoricocomplemento: TStringField;
    frpLivroRazao: TfrReport;
    qryLivroRazaonlinhas: TLargeintField;
    qryLivroRazaoFilial: TtecQuery;
    qryLivroRazaoFilialnrlancto: TIntegerField;
    qryLivroRazaoFilialdata: TDateField;
    qryLivroRazaoFilialorigem: TStringField;
    qryLivroRazaoFilialcontrapartida: TIntegerField;
    qryLivroRazaoFilialvalordebito: TFloatField;
    qryLivroRazaoFilialvalorcredito: TFloatField;
    qryLivroRazaoFilialhistorico: TIntegerField;
    qryLivroRazaoFilialdescricaohistoricocomplemento: TStringField;
    qryLivroRazaoFilialcodigo: TIntegerField;
    qryLivroRazaoFilialdescricao: TStringField;
    qryLivroRazaoFilialclassificacao: TStringField;
    qryLivroRazaoFilialfilial: TIntegerField;
    qryLivroRazaoFilialnlinhas: TLargeintField;
    frpLivroRazaoFilial: TfrReport;
    fdsLivroRazaoFilial: TfrDBDataSet;
    qryLivroRazaoFilialrazao: TStringField;
    qryLivroRazaoFilialcnpj: TStringField;
    qryLivroRazaoFilialinscricaoestadual: TStringField;
    qryLivroRazaodescricaocontrapartida: TStringField;
    qryLivroRazaoFilialdescricaocontrapartida: TStringField;
    qryLivroRazaototaldebito: TFloatField;
    qryLivroRazaototalcredito: TFloatField;
    qryLivroRazaoSaldo: TtecQuery;
    qryLivroRazaoSaldodata: TDateField;
    qryLivroRazaoSaldovalordebito: TFloatField;
    qryLivroRazaoSaldovalorcredito: TFloatField;
    qryLivroRazaoSaldocodigo: TIntegerField;
    qryLivroRazaoSaldodescricao: TStringField;
    qryLivroRazaoSaldoclassificacao: TStringField;
    frpLivroRazaoSaldo: TfrReport;
    fdsLivroRazaoSaldo: TfrDBDataSet;
    qryLivroRazaoFilialtotaldebito: TFloatField;
    qryLivroRazaoFilialtotalcredito: TFloatField;
    qryLivroRazaoFilialSaldo: TtecQuery;
    frpLivroRazaoFilialSaldo: TfrReport;
    fdsLivroRazaoFilialSaldo: TfrDBDataSet;
    qryLivroRazaoFilialSaldodata: TDateField;
    qryLivroRazaoFilialSaldovalordebito: TFloatField;
    qryLivroRazaoFilialSaldovalorcredito: TFloatField;
    qryLivroRazaoFilialSaldocodigo: TIntegerField;
    qryLivroRazaoFilialSaldodescricao: TStringField;
    qryLivroRazaoFilialSaldoclassificacao: TStringField;
    qryLivroRazaoFilialSaldofilial: TIntegerField;
    qryLivroRazaoFilialSaldorazao: TStringField;
    qryLivroRazaoFilialSaldocnpj: TStringField;
    qryLivroRazaoFilialSaldoinscricaoestadual: TStringField;
    qryLivroRazaovalorevento: TFloatField;
    qryLivroRazaoFilialvalorevento: TFloatField;
    procedure frpLivroRazao_BeforePrint(Memo: TStringList; View: TfrView);
    procedure qryLivroRazaoAfterScroll(DataSet: TDataSet);
    procedure frpLivroRazaoFilialBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroRazaoGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroRazaoFilialGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpLivroRazaoSaldoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpLivroRazaoFilialSaldoBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    procedure CalcularSaldoLivroRazao;
    procedure CalcularSaldoLivroRazaoFilial;

  Protected
    ImpressaoTermos: TdtmImprimeTermos;
    FOpcaoSaldoDiario : Integer;

  public
    { Public declarations }
    procedure ImprimirLivroRazao(TipoRelatorio, OpcaoSaldoDiario, Ordenacao: Integer;
                                 DataInicial, DataFinal, Conta, Tipo, Classificacao, descricaoconta, Livro, Pagina, Maximo: String;
                                 SoComMovto, SoComSaldo, TodasFiliais, AgruparFiliais, ExcetoConta: Boolean;
                                 ListaFiliais: String);

  end;

var
  dtmLivroRazao: TdtmLivroRazao;
  Exercicio:     Integer;

implementation

{$R *.dfm}

{ TdtmLivroRazao }


procedure TdtmLivroRazao.ImprimirLivroRazao(
  TipoRelatorio, OpcaoSaldoDiario, Ordenacao: Integer;
  DataInicial, DataFinal, Conta, tipo, Classificacao, descricaoconta, Livro, Pagina,  Maximo: String;
  SoComMovto, SoComSaldo, TodasFiliais, AgruparFiliais, ExcetoConta: Boolean;
         ListaFiliais: String);
const
SQLClassificacao = 'and position(CAST(%s AS VARCHAR) in CAST(pl.classificacao AS VARCHAR))=1';
SQLExcetoClassificacao = 'and not (position(CAST(%s AS VARCHAR) in CAST(pl.classificacao AS VARCHAR))=1)';

SQLConta       = 'AND (pl.Codigo = %s)';
SQLExcetoConta = 'AND (pl.Codigo <> %s)';

SQLFilial_sc = 'AND (sc.Filial IN (%S))';
SQLFilial_l  = 'AND (l.Filial IN (%S))';
SQLFilial_ld = 'AND (ld.Filial IN (%S))';
SQLFilial_lc = 'AND (lc.Filial IN (%S))';

SQLSoComMovtos        = ' WHERE ContaComMovto(Codigo, :DataInicial, :DataFinal) ';
SQLSoComMovtosFilial  = ' WHERE ContaComMovto(Codigo, Filial, :DataInicial, :DataFinal) ';
SQLSoComMovtosFiliais = ' WHERE ContaComMovto(Codigo, %s, :DataInicial, :DataFinal) ';


SQLSoComSaldos        = ' ((SaldoContabil(COALESCE(Codigo,0), :DataSaldo) <> 0) OR' +
                         ' (SaldoContabil(COALESCE(Codigo,0), :DataFinal) <> 0)) ';

SQLSoComSaldosFilial  = ' ((SaldoContabil(COALESCE(Codigo,0), Filial, :DataSaldo, :Exercicio) <> 0) OR' +
                         ' (SaldoContabil(COALESCE(Codigo,0), Filial, :DataFinal, :Exercicio) <> 0)) ';

SQLSoComSaldosFiliais = ' ((SaldoContabil(COALESCE(Codigo,0), %s, :DataSaldo) <> 0) OR' +
                         ' (SaldoContabil(COALESCE(Codigo,0), %s, :DataFinal) <> 0)) ';





var Relatorio: TfrReport;
    frmPreview: TfrmPreviewPadrao;
    DataSaldo: TDateTime;
    SubTitulo : String;
begin
  frVariables['TRANSPORTAR']:= False;
  FOpcaoSaldoDiario := OpcaoSaldoDiario;
  DataSaldo := Strtodate(DataInicial) -1;
  Exercicio := FLVal(Copy(DataInicial,7,4));

  SubTitulo := ' ENTRE '+DataInicial+' E '+DataFinal+#13;

  if (pos(',',ListaFiliais)<>0) or TodasFiliais then
    AtribuirParametrosBaseRelatorio
  else
    AtribuirParametrosBaseRelatorio(ListaFiliais);

  if AgruparFiliais then
  begin
    qryLivroRazao.MacroByName('Filiais_sc').AsString := '';
    qryLivroRazao.MacroByName('Filiais_ld').AsString := '';
    qryLivroRazao.MacroByName('Filiais_lc').AsString := '';
    try
      qryLivroRazao.MacroByName('Filiais_l').AsString := '';
    except end;

    if Not TodasFiliais then
    begin
      qryLivroRazao.MacroByName('Filiais_sc').AsString := format(SQLFilial_sc, [ListaFiliais]);
      qryLivroRazao.MacroByName('Filiais_ld').AsString := format(SQLFilial_ld, [ListaFiliais]);
      qryLivroRazao.MacroByName('Filiais_lc').AsString := format(SQLFilial_lc, [ListaFiliais]);
      try
        qryLivroRazao.MacroByName('Filiais_l').AsString := format(SQLFilial_l, [ListaFiliais]);
      except end;
    end;

    qryLivroRazao.MacroByName('conta').AsString := '';
    if conta <> '' then
    begin
     if tipo = 'A' then
     begin
      if ExcetoConta then
      begin
        qryLivroRazao.MacroByName('conta').AsString := Format(SQLExcetoConta, [conta])
      end
      else
        qryLivroRazao.MacroByName('conta').AsString := Format(SQLConta, [conta]);
     end
     else
     begin
       if ExcetoConta then
       begin
         qrylivroRazao.MacroByName('conta').AsString := Format(SQLExcetoClassificacao, [quotedstr(classificacao)]);
         SubTitulo := SubTitulo + 'EXCETO CONTA: '+descricaoconta;
       end
       else
       begin
         qryLivroRazao.MacroByName('conta').AsString := Format(SQLClassificacao, [quotedstr(classificacao)]);
         SubTitulo := SubTitulo + 'CONTA: '+descricaoconta;
       end;
     end;
    end;

    qryLivroRazao.MacroByName('Movtos').AsString := '';
    if SoComMovto then
      if TodasFiliais then
        qryLivroRazao.MacroByName('Movtos').AsString := SQLSoComMovtos
      else
        qryLivroRazao.MacroByName('Movtos').AsString := format(SQLSoComMovtosFiliais, [ListaFiliais]);

    if SoComSaldo then begin
       if length(qryLivroRazao.MacroByName('Movtos').AsString) <> 0
       then if TodasFiliais
            then qryLivroRazao.MacroByName('Movtos').AsString:= qryLivroRazao.MacroByName('Movtos').AsString + ' OR ' + SQLSoComSaldos
            else qryLivroRazao.MacroByName('Movtos').AsString:= qryLivroRazao.MacroByName('Movtos').AsString + ' OR ' +
                                                                Format(SQLSoComSaldosFiliais, [ListaFiliais, ListaFiliais])
       else if TodasFiliais
            then qryLivroRazao.MacroByName('Movtos').AsString :=' WHERE ' + SQLSoComSaldos
            else qryLivroRazao.MacroByName('Movtos').AsString :=' WHERE ' + Format(SQLSoComSaldosFiliais, [ListaFiliais, ListaFiliais]);
    end;

    case OpcaoSaldoDiario of
    0,1: begin
          case Ordenacao of
            0: qryLivroRazao.MacroByName('ordenacao').AsString := 'order by classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, data, nrlancto';
            1: qryLivroRazao.MacroByName('ordenacao').AsString := 'order by UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, classificacao, data, nrlancto';
            2: qryLivroRazao.MacroByName('ordenacao').AsString := 'order by codigo, UPPER(TO_ASCII(Descricao,''LATIN1'')), classificacao, data, nrlancto';
          end;
         end;
    2: begin
          case Ordenacao of
            0: qryLivroRazao.MacroByName('ordenacao').AsString := 'order by classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, data';
            1: qryLivroRazao.MacroByName('ordenacao').AsString := 'order by UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, classificacao, data';
            2: qryLivroRazao.MacroByName('ordenacao').AsString := 'order by codigo, UPPER(TO_ASCII(Descricao,''LATIN1'')), classificacao, data';
          end;
       end;
    end;
  end
  else
  begin
    qryLivroRazao.MacroByName('Filiais_sc').AsString := '';
    qryLivroRazao.MacroByName('Filiais_ld').AsString := '';
    qryLivroRazao.MacroByName('Filiais_lc').AsString := '';
    try
      qryLivroRazao.MacroByName('Filiais_l').AsString := '';
    except end;

    if Not TodasFiliais then
    begin
      qryLivroRazao.MacroByName('Filiais_sc').AsString := format(SQLFilial_sc, [ListaFiliais]);
      qryLivroRazao.MacroByName('Filiais_ld').AsString := format(SQLFilial_ld, [ListaFiliais]);
      qryLivroRazao.MacroByName('Filiais_lc').AsString := format(SQLFilial_lc, [ListaFiliais]);
      try
        qryLivroRazao.MacroByName('Filiais_l').AsString := format(SQLFilial_l, [ListaFiliais]);
      except end;
    end;

    qryLivroRazaoFilial.MacroByName('conta').AsString := '';
    if conta <> '' then
    begin
     if tipo = 'A' then
     begin
      if ExcetoConta then
        qryLivroRazaoFilial.MacroByName('conta').AsString := Format(SQLExcetoConta, [conta])
      else
        qryLivroRazaoFilial.MacroByName('conta').AsString := Format(SQLConta, [conta]);
     end
     else
     begin
       if ExcetoConta then
       begin
         qryLivroRazaoFilial.MacroByName('conta').AsString := Format(SQLExcetoClassificacao, [quotedstr(classificacao)]);
         SubTitulo := SubTitulo + 'EXCETO CONTA: '+descricaoconta;
       end
       else
       begin
         qryLivroRazaoFilial.MacroByName('conta').AsString := Format(SQLClassificacao, [quotedstr(classificacao)]);
         SubTitulo := SubTitulo + 'CONTA: '+descricaoconta;
       end;
     end;
    end;

    qryLivroRazaoFilial.MacroByName('Movtos').AsString := '';
    if SoComMovto then
      qryLivroRazaoFilial.MacroByName('Movtos').AsString := SQLSoComMovtosFilial;

    if SoComSaldo then
    begin
      if length(qryLivroRazaoFilial.MacroByName('Movtos').AsString)<>0 then
          qryLivroRazaoFilial.MacroByName('Movtos').AsString :=
            qryLivroRazaoFilial.MacroByName('Movtos').AsString+' or '+SQLSoComSaldosFilial
      else
        qryLivroRazaoFilial.MacroByName('Movtos').AsString :=' Where '+SQLSoComSaldosFilial;
    end;

    case OpcaoSaldoDiario of
    0,1: begin
          case Ordenacao of
            0: qryLivroRazaofilial.MacroByName('ordenacao').AsString := 'order by filial, classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, data, nrlancto';
            1: qryLivroRazaofilial.MacroByName('ordenacao').AsString := 'order by filial, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, classificacao, data, nrlancto';
            2: qryLivroRazaofilial.MacroByName('ordenacao').AsString := 'order by filial, codigo, UPPER(TO_ASCII(Descricao,''LATIN1'')), classificacao, data, nrlancto';
          end;
         end;
    2: begin
          case Ordenacao of
            0: qryLivroRazaofilial.MacroByName('ordenacao').AsString := 'order by filial, classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, data';
            1: qryLivroRazaofilial.MacroByName('ordenacao').AsString := 'order by filial, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo, classificacao, data';
            2: qryLivroRazaofilial.MacroByName('ordenacao').AsString := 'order by filial, codigo, UPPER(TO_ASCII(Descricao,''LATIN1'')), classificacao, data';
          end;
       end;
    end;

  end;

  frVariables['DataExtensoInicial']:= DataExtenso(strtodatetime(DataInicial));
  frVariables['DataExtensoFinal']:= DataExtenso(strtodatetime(DataFinal));
  frVariables['DataInicial']:= DataInicial;
  frVariables['DataFinal']:= DataFinal;
  if Livro = '' then
    frVariables['Livro'] := 0
  else frVariables['Livro'] := Livro;

  frVariables['Pagina']:= Pagina;
  frVariables['Maximo']:= Maximo;
  frVariables['OpcaoSaldoDiario']:= OpcaoSaldoDiario;

  frVariables['Titulo']:= 'LIVRO RAZÃO';

  frVariables['SubTitulo']:= SubTitulo;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
     case TipoRelatorio of
     0: begin
          frCompositeReport.Reports.Clear;
          if AgruparFiliais then
          begin
            case OpcaoSaldoDiario of
            0,1: begin
                  ReFazConsulta(qryLivroRazao, [0,1,2,3], [DataSaldo, Exercicio, DataInicial, DataFinal]);
                  CalcularSaldoLivroRazao;
                  //frpLivroRazao.DesignReport;
                  frCompositeReport.Reports.Add(frpLivroRazao);
                 end;
            2: begin
                 qryLivroRazaoSaldo.Params := qryLivroRazao.Params;
                 qryLivroRazaoSaldo.Macros := qryLivroRazao.Macros;
                 refazconsulta(qryLivroRazaoSaldo,[0,1,2, 3], [DataSaldo, Exercicio, DataInicial, DataFinal]);
                // frpLivroRazaoSaldo.DesignReport;
                 frCompositeReport.Reports.Add(frpLivroRazaoSaldo);
               end;
            end;
          end
          else
          begin
            case OpcaoSaldoDiario of
            0,1: begin
                   ReFazConsulta(qryLivroRazaoFilial, [0,1,2,3], [DataSaldo, Exercicio, DataInicial, DataFinal]);
                   CalcularSaldoLivroRazaoFilial;
                   //frpLivroRazaoFilial.DesignReport;
                   frCompositeReport.Reports.Add(frpLivroRazaoFilial);
                 end;
            2 :  begin
                   qryLivroRazaoFilialSaldo.Params := qryLivroRazaoFilial.Params;
                   qryLivroRazaoFilialSaldo.Macros := qryLivroRazaoFilial.Macros;
                   refazconsulta(qryLivroRazaoFilialSaldo,[0,1,2,3], [DataSaldo, DataInicial, DataFinal, Exercicio]);
                   //frpLivroRazaoFilialSaldo.DesignReport;
                   frCompositeReport.Reports.Add(frpLivroRazaoFilialSaldo);
                 end;
            end;
          end;
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


procedure TdtmLivroRazao.frpLivroRazao_BeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroRazao, view);
end;

procedure TdtmLivroRazao.qryLivroRazaoAfterScroll(DataSet: TDataSet);
{
const
SQL = 'and (position(p.classificacao in %s)=1)';
}
begin
  inherited;
  {
  if FImprimindoRelatorio and not qryLivroRazao.Eof then
  begin
   VerificarAgrupamentoLivroRazao;
   if not qryLivroRazaototalizado.AsBoolean then
     TotalizarRelatorio;
  end;
  }
{
  qryConsultaContas.MacroByName('contasvinculadas').AsString :=
    format(SQL,[qrylivrorazaoclassificacao.asstring]);
  qryconsultacontas.close;
  qryconsultacontas.open;
  }
end;


procedure TdtmLivroRazao.frpLivroRazaoFilialBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroRazaoFilial, view);
end;

procedure TdtmLivroRazao.frpLivroRazaoGetValue(const ParName: String;
  var ParValue: Variant);
var
  codigo : integer;
  data: String;
begin
  inherited;
  Parvalue := ParametroRelatorio(ParName);
  if ANSIUpperCase(ParName) = 'SALDODEVEDOR' then
  begin
   codigo := qryLivroRazaocodigo.AsInteger;
   data := qryLivroRazaodata.AsString;
   qryLivroRazao.Next;
   if codigo <> qryLivroRazaocodigo.AsInteger then
   begin
     qryLivroRazao.Prior;
     ParValue := qryLivroRazaototaldebito.AsCurrency;
   end
   else
   begin
     if (data <> qrylivrorazaodata.AsString) and
        (FOpcaoSaldoDiario = 1) then
     begin
       qryLivroRazao.Prior;
       ParValue := qryLivroRazaototaldebito.AsCurrency;
     end
     else
     begin
       if not qrylivrorazao.Eof then
       begin
         qryLivroRazao.Prior;
         qryLivroRazao.Prior;
         ParValue := qryLivroRazaototaldebito.AsCurrency;
         qryLivroRazao.Next;
       end
       else
         ParValue := qryLivroRazaototaldebito.AsCurrency;
     end;
   end;
  end
  else
  if ANSIUpperCase(ParName) = 'SALDOCREDOR' then
  begin
   codigo := qryLivroRazaocodigo.AsInteger;
   data := qryLivroRazaodata.AsString;
   qryLivroRazao.Next;
   if codigo <> qryLivroRazaocodigo.AsInteger then
   begin
     qryLivroRazao.Prior;
     ParValue := qryLivroRazaototalcredito.AsCurrency;
   end
   else
   begin
     if (data <> qrylivrorazaodata.AsString) and
        (FOpcaoSaldoDiario = 1) then
     begin
       qryLivroRazao.Prior;
       ParValue := qryLivroRazaototalcredito.AsCurrency;
     end
     else
     begin
       if not qrylivrorazao.Eof then
       begin
         qryLivroRazao.Prior;
         qryLivroRazao.Prior;
         ParValue := qryLivroRazaototalcredito.AsCurrency;
         qryLivroRazao.Next;
       end
       else
         ParValue := qryLivroRazaototalcredito.AsCurrency;
     end;
   end;
  end;
end;

procedure TdtmLivroRazao.frpLivroRazaoFilialGetValue(const ParName: String;
  var ParValue: Variant);
var
  codigo,filial : integer;
  data: String;
begin
  inherited;
  Parvalue := ParametroRelatorio(ParName);
  if ANSIUpperCase(ParName) = 'SALDODEVEDOR' then
  begin
   codigo := qryLivroRazaoFilialcodigo.AsInteger;
   filial := qryLivroRazaoFilialfilial.AsInteger;
   data := qryLivroRazaoFilialdata.AsString;
   qryLivroRazaoFilial.Next;
   if (codigo <> qryLivroRazaoFilialcodigo.AsInteger) or
      (filial <> qryLivroRazaoFilialfilial.AsInteger) then
   begin
     qryLivroRazaoFilial.Prior;
     ParValue := qryLivroRazaoFilialtotaldebito.AsCurrency;
   end
   else
   begin
     if (data <> qrylivrorazaoFilialdata.AsString) and
        (FOpcaoSaldoDiario = 1) then
     begin
       qryLivroRazaofilial.Prior;
       ParValue := qryLivroRazaoFilialtotaldebito.AsCurrency;
     end
     else
     begin
       if not qryLivroRazaoFilial.Eof then
       begin
         qryLivroRazaoFilial.Prior;
         qryLivroRazaoFilial.Prior;
         ParValue := qryLivroRazaoFilialtotaldebito.AsCurrency;
         qryLivroRazaoFilial.Next;
       end
       else
         ParValue := qryLivroRazaoFilialtotaldebito.AsCurrency;
     end;
   end;
  end
  else
  if ANSIUpperCase(ParName) = 'SALDOCREDOR' then
  begin
   codigo := qryLivroRazaoFilialcodigo.AsInteger;
   filial := qryLivroRazaoFilialfilial.AsInteger;
   data := qryLivroRazaoFilialdata.AsString;
   qryLivroRazaoFilial.Next;
   if (codigo <> qryLivroRazaoFilialcodigo.AsInteger) or
      (filial <> qryLivroRazaoFilialfilial.AsInteger) then
   begin
     qryLivroRazaoFilial.Prior;
     ParValue := qryLivroRazaoFilialtotalcredito.AsCurrency;
   end
   else
   begin
     if (data <> qrylivrorazaoFilialdata.AsString) and
        (FOpcaoSaldoDiario = 1) then
     begin
       qryLivroRazaofilial.Prior;
       ParValue := qryLivroRazaoFilialtotalcredito.AsCurrency;
     end
     else
     begin
       if not qryLivroRazaoFilial.Eof then
       begin
         qryLivroRazaoFilial.Prior;
         qryLivroRazaoFilial.Prior;
         ParValue := qryLivroRazaoFilialtotalcredito.AsCurrency;
         qryLivroRazaoFilial.Next;
       end
       else
         ParValue := qryLivroRazaoFilialtotalcredito.AsCurrency;
     end;
   end;
  end;
end;


procedure TdtmLivroRazao.CalcularSaldoLivroRazao;
var
  TotalDebito, TotalCredito : Currency;
  codigo : Integer;
begin
  codigo := 0;
  TotalDebito := 0;
  TotalCredito := 0;
  qryLivroRazao.First;
  while not qryLivroRazao.Eof do
  begin
    if (codigo = 0) or
       (codigo <> qryLivroRazaocodigo.AsInteger) then
    begin
      codigo := qryLivroRazaocodigo.AsInteger;
      TotalDebito := 0;
      TotalCredito := 0;
    end;

    if (codigo = qryLivroRazaocodigo.AsInteger) then
    begin
      TotalDebito := TotalDebito + qryLivroRazaovalordebito.AsCurrency;
      TotalCredito:= TotalCredito + qryLivroRazaovalorcredito.AsCurrency;
      qryLivroRazao.Edit;
      qryLivroRazaototaldebito.AsCurrency := TotalDebito;
      qryLivroRazaototalcredito.AsCurrency := TotalCredito;
      qryLivroRazao.Post;
    end;

    qryLivroRazao.Next;
  end;
end;

procedure TdtmLivroRazao.frpLivroRazaoSaldoBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroRazaoSaldo, view);
end;

procedure TdtmLivroRazao.CalcularSaldoLivroRazaoFilial;
var
  TotalDebito, TotalCredito : Currency;
  filial, codigo : Integer;
begin
  filial := 0;
  codigo := 0;
  TotalDebito := 0;
  TotalCredito := 0;
  qryLivroRazaoFilial.First;
  while not qryLivroRazaoFilial.Eof do
  begin
    if (codigo = 0) or
       (filial = 0) or
       (codigo <> qryLivroRazaoFilialcodigo.AsInteger) or
       (filial <> qryLivroRazaoFilialfilial.AsInteger) then
    begin
      filial := qryLivroRazaoFilialfilial.AsInteger;
      codigo := qryLivroRazaoFilialcodigo.AsInteger;
      TotalDebito := 0;
      TotalCredito := 0;
    end;

    if (codigo = qryLivroRazaoFilialcodigo.AsInteger) and
       (filial = qryLivroRazaoFilialfilial.AsInteger) then
    begin
      TotalDebito := TotalDebito + qryLivroRazaoFilialvalordebito.AsCurrency;
      TotalCredito:= TotalCredito + qryLivroRazaoFilialvalorcredito.AsCurrency;
      qryLivroRazaoFilial.Edit;
      qryLivroRazaoFilialtotaldebito .AsCurrency := TotalDebito;
      qryLivroRazaoFilialtotalcredito.AsCurrency := TotalCredito;
      qryLivroRazaoFilial.Post;
    end;

    qryLivroRazaoFilial.Next;
  end;
end;

procedure TdtmLivroRazao.frpLivroRazaoFilialSaldoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpLivroRazaoFilialSaldo, view);
end;

end.
