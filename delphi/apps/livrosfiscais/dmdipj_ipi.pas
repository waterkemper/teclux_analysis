unit dmdipj_ipi;

interface

uses
  SysUtils, Classes, dmbasico, biblio, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  Controls, Forms, DateUtils, clparametrossistema, cpdatasource, ctconstantes,
  ACBrSpedContabil, variants, math, ZTransact, StrUtils;


type

  TdtmDIPJ_IPI = class(TdtmBasico)
    qrydipj_ipi: TtecQuery;
    dsrdipj_ipi: TtecDataSource;
    qrydipj_ipiexercicio: TStringField;
    qrydipj_ipinomearquivo: TStringField;
    qrydipj_ipidata: TDateTimeField;
    qrydipj_ipifilial: TIntegerField;
    qrydipj_ipi_f20: TtecQuery;
    dsrdipj_ipi_f20: TtecDataSource;
    qrydipj_ipi_f20exercicio: TStringField;
    qrydipj_ipi_f20filial: TIntegerField;
    qrydipj_ipi_f20mes: TStringField;
    qrydipj_ipi_f20saldocredoranterior: TFloatField;
    qrydipj_ipi_f20debito: TFloatField;
    qrydipj_ipi_f20credito: TFloatField;
    qrydipj_ipi_f20SaldoApurado: TCurrencyField;
    qrydipj_ipi_f20TipoSaldo: TStringField;
    qrydipj_ipi_f21: TtecQuery;
    dsrdipj_ipi_f21: TtecDataSource;
    qrydipj_ipi_f21exercicio: TStringField;
    qrydipj_ipi_f21filial: TIntegerField;
    qrydipj_ipi_f21discriminacao: TStringField;
    qrydipj_ipi_f21comcredito: TFloatField;
    qrydipj_ipi_f21semcredito: TFloatField;
    qrydipj_ipi_f21ipicreditado: TFloatField;
    qrydipj_ipi_f21_Discriminacao: TtecQuery;
    qrydipj_ipi_f21_Discriminacaocodigo: TStringField;
    qrydipj_ipi_f21_Discriminacaodiscriminacao: TStringField;
    qrydipj_ipi_f21_Discriminacaolcomcredito: TBooleanField;
    qrydipj_ipi_f21_Discriminacaolsemcredito: TBooleanField;
    qrydipj_ipi_f21_Discriminacaolipicreditado: TBooleanField;
    qrydipj_ipi_f21_Discriminacaotipo: TStringField;
    qrydipj_ipi_f22: TtecQuery;
    dsrdipj_ipi_f22: TtecDataSource;
    qrydipj_ipi_f22_Discriminacao: TtecQuery;
    qrydipj_ipi_f22exercicio: TStringField;
    qrydipj_ipi_f22filial: TIntegerField;
    qrydipj_ipi_f22discriminacao: TStringField;
    qrydipj_ipi_f22comdebito: TFloatField;
    qrydipj_ipi_f22semdebito: TFloatField;
    qrydipj_ipi_f22ipidebitado: TFloatField;
    qrydipj_ipi_f22_Discriminacaosequencia: TIntegerField;
    qrydipj_ipi_f22_Discriminacaocodigo: TStringField;
    qrydipj_ipi_f22_Discriminacaodiscriminacao: TStringField;
    qrydipj_ipi_f22_Discriminacaolcomdebito: TBooleanField;
    qrydipj_ipi_f22_Discriminacaolsemdebito: TBooleanField;
    qrydipj_ipi_f22_Discriminacaolipidebitado: TBooleanField;
    qrydipj_ipi_f22_Discriminacaotipo: TStringField;
    qrydipj_ipi_f20existemovto: TBooleanField;
    qryDadosIPI20: TtecQuery;
    qryDadosIPI20mes: TMemoField;
    qryDadosIPI20credito: TFloatField;
    qryDadosIPI20debito: TFloatField;
    qryDadosIPI20possuimovto: TBooleanField;
    qryDadosIPI21: TtecQuery;
    qryDadosIPI21discriminacao: TStringField;
    qryDadosIPI21comipi: TFloatField;
    qryDadosIPI21semipi: TFloatField;
    qryDadosIPI21ipicreditado: TFloatField;
    qryDadosIPI22: TtecQuery;
    qryDadosIPI22codigo: TStringField;
    qryDadosIPI22discriminacao: TStringField;
    qryDadosIPI22comipi: TFloatField;
    qryDadosIPI22semipi: TFloatField;
    qryDadosIPI21codigo: TStringField;
    qryDadosIPI22ipidebitado: TFloatField;
    qrydipj_ipi_f23: TtecQuery;
    qrydipj_ipi_f23cnpj: TStringField;
    qrydipj_ipi_f23basecalculo: TFloatField;
    qrydipj_ipi_f23st: TStringField;
    qrydipj_ipi_f23ri: TStringField;
    dsrdipj_ipi_f23: TtecDataSource;
    qrydipj_ipi_f24: TtecQuery;
    dsrdipj_ipi_f24: TtecDataSource;
    qrydipj_ipi_f25: TtecQuery;
    dsrdipj_ipi_f25: TtecDataSource;
    qrydipj_ipi_f26: TtecQuery;
    dsrdipj_ipi_f26: TtecDataSource;
    qrydipj_ipi_f21_Discriminacaosequencia: TIntegerField;
    qrydipj_ipi_f21sequencia: TIntegerField;
    qrydipj_ipi_f22sequencia: TIntegerField;
    qrydipj_ipi_f21codigo: TStringField;
    qrydipj_ipi_f22codigo: TStringField;
    qrydipj_ipi_f24classificacaofiscal: TStringField;
    qrydipj_ipi_f24extipi: TStringField;
    qrydipj_ipi_f24basecalculo: TFloatField;
    qrydipj_ipi_f24descricaoproduto: TStringField;
    qrydipj_ipi_f24st: TStringField;
    qrydipj_ipi_f21tipo: TStringField;
    qrydipj_ipi_f22tipo: TStringField;
    qryFiliais: TtecQuery;
    qryFiliaissuframa: TStringField;
    qryFiliaisind_perfil: TStringField;
    qryFiliaisind_ativ: TStringField;
    qryFiliaisrazao: TStringField;
    qryFiliaiscnpj: TStringField;
    qryFiliaisinscricaoestadual: TStringField;
    qryFiliaisinscricaomunicipal: TStringField;
    qryFiliaisestado: TStringField;
    qryFiliaiscidadeibge: TIntegerField;
    qryFiliaisfilialconsolidadoradime: TIntegerField;
    qryFiliaisjunta: TStringField;
    qryFiliaisjuntadata: TDateField;
    qryFiliaisnomecidade: TStringField;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisclassificacaoipi: TStringField;
    qrydipj_ipitipodeclaracao: TIntegerField;
    qryFiliaisregimesubstituicao: TIntegerField;
    qrydipj_ipi_f26classificacaofiscal: TStringField;
    qrydipj_ipi_f26extipi: TStringField;
    qrydipj_ipi_f26basecalculo: TFloatField;
    qrydipj_ipi_f26descricaoproduto: TStringField;
    qrydipj_ipi_f26st: TStringField;
    qrydipj_ipi_f25cnpj: TStringField;
    qrydipj_ipi_f25basecalculo: TFloatField;
    qrydipj_ipi_f25st: TStringField;
    qrydipj_ipi_f25ri: TStringField;
    procedure qrydipj_ipiAfterScroll(DataSet: TDataSet);
    procedure qrydipj_ipiNewRecord(DataSet: TDataSet);
    procedure dsrdipj_ipiDataChange(Sender: TObject; Field: TField);
    procedure qrydipj_ipi_f21AfterPost(DataSet: TDataSet);
    procedure qrydipj_ipi_f21AfterInsert(DataSet: TDataSet);
    procedure qrydipj_ipi_f20AfterInsert(DataSet: TDataSet);
    procedure qrydipj_ipi_f20AfterPost(DataSet: TDataSet);
    procedure qrydipj_ipi_f22AfterInsert(DataSet: TDataSet);
    procedure qrydipj_ipi_f22AfterPost(DataSet: TDataSet);
    procedure qrydipj_ipi_f21AfterScroll(DataSet: TDataSet);
    procedure qrydipj_ipi_f22AfterScroll(DataSet: TDataSet);
    procedure qrydipj_ipi_f20AfterOpen(DataSet: TDataSet);
  private
    FTipoRemessa: byte;
    FACBrSPEDContabilonError: TNotifyEvent;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FTotalObrigacoes: Currency;


    { Private declarations }


    {Nível 0}


  public
    { Public declarations }
    Erro: String;

    constructor Create(AOwner: TComponent); override;


    function GerarArquivo(NomeArquivo: String): Boolean;
    property TipoRemessa: byte read FTipoRemessa write FTipoRemessa;
    property DataInicial: TDateTime read FDataInicial write FDataInicial;
    property DataFinal: TDateTime read FDataFinal write FDataFinal;
    property ACBrSPEDContabilonError: TNotifyEvent read FACBrSPEDContabilonError write FACBrSPEDContabilonError;

    function  Incluirdipj_ipi: Boolean;
    function  Gravardipj_ipi: Boolean;
    function  Excluirdipj_ipi: Boolean;


    property TotalObrigacoes: Currency read FTotalObrigacoes write FTotalObrigacoes;

    procedure AtualizarSaldosIPI;
    procedure RecalcularSaldosF20(DesligarControles: Boolean);
    procedure RecalcularSaldosF21(DesligarControles: Boolean);
    procedure RecalcularSaldosF22(DesligarControles: Boolean);



  end;

var
  dtmDIPJ_IPI: TdtmDIPJ_IPI;

implementation



{$R *.dfm}

{ TdtmDIPJ_IPI }


{
    BLOCO 0: ABERTURA, IDENTIFICAÇÃO E REFERÊNCIAS
    BLOCO I: LANÇAMENTOS CONTÁBEIS
    BLOCO J: DEMONSTRAÇÕES CONTÁBEIS

}
function TdtmDIPJ_IPI.GerarArquivo(NomeArquivo: String): Boolean;
var

  vSequencia    : integer;
  vArquivo,Barra : String;
  vLinhaString : String;
  Arq: TextFile;
  i : integer;
  vTipo : integer;

  procedure GravarLinha_String(str : String);
  begin
  {$IFDEF LINUX}
   Writeln(Arq, str+#13);
  {$ELSE }
   Writeln(Arq, str);
  {$ENDIF}
  end;

begin
  result := true;
  vArquivo := ExportacaoDir;

  {$IFDEF LINUX}
    Barra := '/';
  {$ELSE }
    Barra := '\';
  {$ENDIF }

  vArquivo := vArquivo + Barra + NomeArquivo;

  try
    AssignFile(Arq, vArquivo);
    //    if FileExists(NomeArquivo) then
    Rewrite(Arq);
    // Registro Header

    GravarLinha_String('DIPJ' +
                       format('%-4s',['']) +
                       {qrydipj_ipiexercicio.AsString} '2011' +
                       format('%-362s',['']));
    // Ficha 19 - Estabelecimentos Industriais ou Equiparados - Tipo R19

    RefazConsultaPorNome(qryFiliais,['codigo'],[qrydipj_ipifilial.asinteger]);

    GravarLinha_String('R19' +
                       format('%-1s',['']) +
                       '0001' +
                       qryFiliaiscnpj.AsString +
                       copy(qrydipj_ipiexercicio.AsString,4,1) +
                       qrydipj_ipitipodeclaracao.AsString +
                       copy(qryFiliaiscnpj.AsString,8,6) +
                       qryFiliaisclassificacaoipi.AsString +
                       format('%-7s',['']) +
                       qryFiliaisregimesubstituicao.AsString +
                       '1' +
                       FormatDateTime('DDMM',DataInicial) +
                       FormatDateTime('DDMM',DataFinal) +
                       format('%-10s',['']));

   // Ficha 20 - Apuração do Saldo do IPI - Tipo R20

    GuardarRegistroAtual(qrydipj_ipi_f20,true);
    qrydipj_ipi_f20.First;
    while not qrydipj_ipi_f20.Eof do
    begin
      GravarLinha_String('R20' +
                         format('%-1s',['']) +
                         qrydipj_ipi_f20mes.AsString +
                         qryFiliaiscnpj.AsString +
                         copy(qrydipj_ipiexercicio.AsString,4,1) +
                         qrydipj_ipitipodeclaracao.AsString +
                         copy(qryFiliaiscnpj.AsString,8,6) +
                         ifthen(qrydipj_ipi_f20existemovto.AsBoolean, '1','2') +
                         formatfloat('00000000000000',round((qrydipj_ipi_f20saldocredoranterior.AsCurrency * 100))) +
                         formatfloat('00000000000000',round((qrydipj_ipi_f20debito.AsCurrency * 100))) +
                         formatfloat('00000000000000',round((qrydipj_ipi_f20credito.AsCurrency * 100))) +
                         formatfloat('00000000000000',round((qrydipj_ipi_f20SaldoApurado.AsCurrency * 100))) +
                         qrydipj_ipi_f20TipoSaldo.AsString  +
                         format('%-10s',['']));


      qrydipj_ipi_f20.next;
    end;
    VoltarRegistroAtual(qrydipj_ipi_f20);

    //Ficha 21 - Entradas e Créditos - Tipo R21

    GuardarRegistroAtual(qrydipj_ipi_f21,true);
    for vTipo:= 1 to 3 do
    begin
      for i:=1 to 18 do
      begin
        if qrydipj_ipi_f21.Locate('codigo',formatfloat('00',i) , []) then
        begin
          if i=1 then
            vLinhaString := vLinhaString + 'R21' +
                                            format('%-1s',['']) +
                                            '00' +
                                            formatfloat('00',vTipo) +
                                            qryFiliaiscnpj.AsString +
                                            copy(qrydipj_ipiexercicio.AsString,4,1) +
                                            qrydipj_ipitipodeclaracao.AsString +
                                            copy(qryFiliaiscnpj.AsString,8,6);
          case vTipo of
            1: vLinhaString := vLinhaString + formatfloat('00000000000000', round((qrydipj_ipi_f21comcredito.AsCurrency * 100)));
            2: vLinhaString := vLinhaString + formatfloat('00000000000000',round((qrydipj_ipi_f21semcredito.AsCurrency * 100)));
            3: vLinhaString := vLinhaString + formatfloat('00000000000000',round((qrydipj_ipi_f21ipicreditado.AsCurrency * 100)));
          end;

        end
        else
        begin
          MensagemErro(format('código %s do registro 21 não encontrado',[formatfloat('00',i)]));
          break;
        end;
      end;
      vLinhaString := vLinhaString + format('%-10s',['']);
      GravarLinha_String(vLinhaString);
      vLinhaString := '';
    end;
    VoltarRegistroAtual(qrydipj_ipi_f21);

    // Ficha 22 - Saídas e Débitos - Tipo R22

    GuardarRegistroAtual(qrydipj_ipi_f22,true);
    for vTipo:= 1 to 3 do
    begin
      for i:=1 to 19 do
      begin
        if qrydipj_ipi_f22.Locate('codigo',formatfloat('00',i) , []) then
        begin
          if i=1 then
            vLinhaString := vLinhaString + 'R22' +
                                            format('%-1s',['']) +
                                            '00' +
                                            formatfloat('00',vTipo) +
                                            qryFiliaiscnpj.AsString +
                                            copy(qrydipj_ipiexercicio.AsString,4,1) +
                                            qrydipj_ipitipodeclaracao.AsString +
                                            copy(qryFiliaiscnpj.AsString,8,6);
          case vTipo of
            1: vLinhaString := vLinhaString + formatfloat('00000000000000', round((qrydipj_ipi_f22comdebito.AsCurrency * 100)));
            2: vLinhaString := vLinhaString + formatfloat('00000000000000',round((qrydipj_ipi_f22semdebito.AsCurrency * 100)));
            3: vLinhaString := vLinhaString + formatfloat('00000000000000',round((qrydipj_ipi_f22ipidebitado.AsCurrency * 100)));
          end;

        end
        else
        begin
          MensagemErro(format('código %s do registro 22 não encontrado',[formatfloat('00',i)]));
          break;
        end;
      end;
      vLinhaString := vLinhaString + format('%-10s',['']);
      GravarLinha_String(vLinhaString);
      vLinhaString := '';
    end;
    VoltarRegistroAtual(qrydipj_ipi_f22);

    // Ficha 23 - Remetentes de Insumos/Mercadorias - Tipo R23

    GuardarRegistroAtual(qrydipj_ipi_f23,true);
    i := 1;
    qrydipj_ipi_f23.First;
    while not qrydipj_ipi_f23.Eof do
    begin
      GravarLinha_String('R23' +
                         format('%-1s',['']) +
                         formatfloat('0000',i) +
                         qryFiliaiscnpj.AsString +
                         copy(qrydipj_ipiexercicio.AsString,4,1) +
                         qrydipj_ipitipodeclaracao.AsString +
                         copy(qryFiliaiscnpj.AsString,8,6) +
                         qrydipj_ipi_f23cnpj.AsString +
                         formatfloat('00000000000000',round((qrydipj_ipi_f23basecalculo.AsCurrency * 100))) +
                         ifthen(qrydipj_ipi_f23st.AsString='S','1','0') +
                         ifthen(qrydipj_ipi_f23ri.AsString='S','1','0') +
                         format('%-10s',['']));

      qrydipj_ipi_f23.next;
      inc(i);
    end;
    VoltarRegistroAtual(qrydipj_ipi_f23);

    // Ficha 24 - Entradas de Insumos/Mercadorias - Tipo R24
    GuardarRegistroAtual(qrydipj_ipi_f24,true);
    i := 1;
    qrydipj_ipi_f24.First;
    while not qrydipj_ipi_f24.Eof do
    begin
      GravarLinha_String('R24' +
                         format('%-1s',['']) +
                         formatfloat('0000',i) +
                         qryFiliaiscnpj.AsString +
                         copy(qrydipj_ipiexercicio.AsString,4,1) +
                         qrydipj_ipitipodeclaracao.AsString +
                         copy(qryFiliaiscnpj.AsString,8,6) +
                         format('%-8s',[qrydipj_ipi_f24classificacaofiscal.AsString]) +
                         format('%-3s',[qrydipj_ipi_f24extipi.AsString]) +
                         format('%-50s',[qrydipj_ipi_f24descricaoproduto.asstring]) +
                         formatfloat('00000000000000',round((qrydipj_ipi_f24basecalculo.AsCurrency * 100))) +
                         ifthen(qrydipj_ipi_f24st.AsString='S','1','0') +
                         format('%-10s',['']));
      qrydipj_ipi_f24.next;
      inc(i);
    end;
    VoltarRegistroAtual(qrydipj_ipi_f24);


    // Ficha 25 - Destinatários de Produtos/Mercadorias/Insumos - Tipo R25

    GuardarRegistroAtual(qrydipj_ipi_f25,true);
    i := 1;
    qrydipj_ipi_f25.First;
    while not qrydipj_ipi_f25.Eof do
    begin
      GravarLinha_String('R25' +
                         format('%-1s',['']) +
                         formatfloat('0000',i) +
                         qryFiliaiscnpj.AsString +
                         copy(qrydipj_ipiexercicio.AsString,4,1) +
                         qrydipj_ipitipodeclaracao.AsString +
                         copy(qryFiliaiscnpj.AsString,8,6) +
                         qrydipj_ipi_f25cnpj.AsString +
                         formatfloat('00000000000000',round((qrydipj_ipi_f25basecalculo.AsCurrency * 100))) +
                         ifthen(qrydipj_ipi_f25st.AsString='S','1','0') +
                         ifthen(qrydipj_ipi_f25ri.AsString='S','1','0') +
                         format('%-10s',['']));

      qrydipj_ipi_f25.next;
      inc(i);
    end;
    VoltarRegistroAtual(qrydipj_ipi_f25);

    // Ficha 26 - Saídas de Produtos/Mercadorias/Insumos - Tipo R26
    GuardarRegistroAtual(qrydipj_ipi_f26,true);
    i := 1;
    qrydipj_ipi_f26.First;
    while not qrydipj_ipi_f26.Eof do
    begin
      GravarLinha_String('R26' +
                         format('%-1s',['']) +
                         formatfloat('0000',i) +
                         qryFiliaiscnpj.AsString +
                         copy(qrydipj_ipiexercicio.AsString,4,1) +
                         qrydipj_ipitipodeclaracao.AsString +
                         copy(qryFiliaiscnpj.AsString,8,6) +
                         format('%-8s',[qrydipj_ipi_f26classificacaofiscal.AsString]) +
                         format('%-3s',[qrydipj_ipi_f26extipi.AsString]) +
                         format('%-50s',[qrydipj_ipi_f26descricaoproduto.asstring]) +
                         formatfloat('00000000000000',round((qrydipj_ipi_f26basecalculo.AsCurrency * 100))) +
                         ifthen(qrydipj_ipi_f26st.AsString='S','1','0') +
                         format('%-10s',['']));
      qrydipj_ipi_f26.next;
      inc(i);
    end;
    VoltarRegistroAtual(qrydipj_ipi_f26);

 // Trailler da Declaração - Tipo T9
    GravarLinha_String('T9'+
                       format('%-100s',['']));

  except
    on E:EFCreateError do
    begin
      MensagemErro(E.Message);
      result := false;
    end;
  end;

  closefile(arq);

end;


constructor TdtmDIPJ_IPI.Create(AOwner: TComponent);
begin
  inherited;
  qrydipj_ipi.Tag := ctTabelas;
  qrydipj_ipi_f21_Discriminacao.Tag := ctTabelas;
  qrydipj_ipi_f22_Discriminacao.Tag := ctTabelas;
end;

function TdtmDIPJ_IPI.Excluirdipj_ipi: Boolean;
begin
  qrydipj_ipi.Delete;
  Perpetrar([qrydipj_ipi]);
  Result := True
end;

function TdtmDIPJ_IPI.Gravardipj_ipi: Boolean;
var
  ValorTotalDebito: Currency;
begin
  result := qrydipj_ipi.CheckRequiredFields;
  if result then
  begin
    qrydipj_ipi.Post;
    result := Perpetrar([qrydipj_ipi, qrydipj_ipi, qrydipj_ipi_f20, qrydipj_ipi_f21, qrydipj_ipi_f22]);
  end;
end;

function TdtmDIPJ_IPI.Incluirdipj_ipi: Boolean;
begin
//  qrydipj_ipi.Params[0].Clear;
  qrydipj_ipi.append;
  Result := True;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipiAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (qrydipj_ipifilial.asstring<>'') and
     (qrydipj_ipiexercicio.asstring<>'') then
  begin
    DataInicial := strtodate('01/01/'+qrydipj_ipiexercicio.asstring);
    DataFinal := strtodate('31/12/'+qrydipj_ipiexercicio.asstring);

    RefazConsultaPorNome(qrydipj_ipi_f20,['exercicio','filial'],
               [qrydipj_ipiexercicio.asinteger,qrydipj_ipifilial.asinteger]);

    RefazConsultaPorNome(qrydipj_ipi_f21,['exercicio','filial'],
               [qrydipj_ipiexercicio.asinteger,qrydipj_ipifilial.asinteger]);

    RefazConsultaPorNome(qrydipj_ipi_f22,['exercicio','filial'],
               [qrydipj_ipiexercicio.asinteger,qrydipj_ipifilial.asinteger]);

    RefazConsultaPorNome(qrydipj_ipi_f23,['datainicial','datafinal','filial'],
               [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

    RefazConsultaPorNome(qrydipj_ipi_f24,['datainicial','datafinal','filial'],
               [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

    RefazConsultaPorNome(qrydipj_ipi_f25,['datainicial','datafinal','filial'],
               [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

    RefazConsultaPorNome(qrydipj_ipi_f26,['datainicial','datafinal','filial'],
               [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

  end;

end;

procedure TdtmDIPJ_IPI.qrydipj_ipiNewRecord(DataSet: TDataSet);
begin
  inherited;
  qrydipj_ipidata.AsDateTime := now();
  qrydipj_ipitipodeclaracao.AsInteger := 0;
end;

procedure TdtmDIPJ_IPI.dsrdipj_ipiDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (field = qrydipj_ipiexercicio) or
     (field = qrydipj_ipifilial) then
  begin
    if (qrydipj_ipi.State = dsinsert) and
       ((qrydipj_ipiexercicio.AsString <> '') and
        (qrydipj_ipifilial.AsInteger <> 0)) then
    begin
      DataInicial := strtodate('01/01/'+qrydipj_ipiexercicio.asstring);
      DataFinal := strtodate('31/12/'+qrydipj_ipiexercicio.asstring);
//      qrydipj_ipiAfterScroll(nil);
//      AtualizarSaldosIPI;
    end;
    qrydipj_ipinomearquivo.AsString := 'dipj_ipi_'+
      qrydipj_ipifilial.AsString+'_'+
      qrydipj_ipiexercicio.AsString+'.TXT';
  end;

end;

procedure TdtmDIPJ_IPI.AtualizarSaldosIPI;
var
 vMes : String;
 vSequencia : integer;
 vNSequencia : integer;
begin

  //   REGISTRO F20
  RefazConsultaPorNome(qryDadosIPI20,['datainicial','datafinal','filial'],
             [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

  qrydipj_ipi_f20.AfterPost := nil;
  qrydipj_ipi_f20.AfterInsert := nil;

  qrydipj_ipi_f20.DisableControls;
  vMes := qrydipj_ipi_f20mes.AsString;
  qryDadosIPI20.First;
  while not qryDadosIPI20.Eof do
  begin
    if not qrydipj_ipi_f20.Locate('mes',qryDadosIPI20mes.AsString,[]) then
      qrydipj_ipi_f20.Append
    else
      qrydipj_ipi_f20.edit;

    qrydipj_ipi_f20exercicio.AsInteger            := qrydipj_ipiexercicio.AsInteger;
    qrydipj_ipi_f20filial.AsInteger               := qrydipj_ipifilial.AsInteger;
    qrydipj_ipi_f20mes.AsString                   := qryDadosIPI20mes.AsString;
    qrydipj_ipi_f20debito.AsCurrency              := qryDadosIPI20debito.AsCurrency;
    qrydipj_ipi_f20credito.AsCurrency             := qryDadosIPI20credito.AsCurrency;
    qrydipj_ipi_f20.Post;

    qryDadosIPI20.next;
  end;
  qrydipj_ipi_f20.AfterPost := qrydipj_ipi_f20AfterPost;
  qrydipj_ipi_f20.AfterInsert := qrydipj_ipi_f20AfterInsert;

  if qrydipj_ipi.State = dsinsert then
    RecalcularSaldosF20(false);

  if vMes<>'' then
    qrydipj_ipi_f20.Locate('mes',vMes,[]);
  qrydipj_ipi_f20.EnableControls;

  //REGISTRO F21

  vSequencia := qrydipj_ipi_f21sequencia.AsInteger;
  qrydipj_ipi_f21.AfterPost := nil;
  qrydipj_ipi_f21.AfterInsert := nil;

  qrydipj_ipi_f21.AfterScroll := nil;

  qrydipj_ipi_f21.DisableControls;

  if qrydipj_ipi_f21.IsEmpty then
  begin
    vNSequencia := 0;
    qrydipj_ipi_f21_Discriminacao.First;
    while not qrydipj_ipi_f21_Discriminacao.Eof do
    begin
      qrydipj_ipi_f21.Append;
      qrydipj_ipi_f21sequencia.AsInteger := vNSequencia + 1;
      qrydipj_ipi_f21tipo.AsString := qrydipj_ipi_f21_Discriminacaotipo.AsString;
      qrydipj_ipi_f21exercicio.AsInteger := qrydipj_ipiexercicio.AsInteger;
      qrydipj_ipi_f21filial.AsInteger    := qrydipj_ipifilial.AsInteger;
      qrydipj_ipi_f21sequencia.AsInteger := qrydipj_ipi_f21_Discriminacaosequencia.AsInteger;
      qrydipj_ipi_f21codigo.AsString     := qrydipj_ipi_f21_Discriminacaocodigo.AsString;
      qrydipj_ipi_f21discriminacao.AsString := qrydipj_ipi_f21_Discriminacaodiscriminacao.AsString;

      qrydipj_ipi_f21.Post;
      qrydipj_ipi_f21_Discriminacao.Next;
    end;
  end;

  RefazConsultaPorNome(qryDadosIPI21,['datainicial','datafinal','filial'],
             [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

  qryDadosIPI21.First;
  while not qryDadosIPI21.Eof do
  begin
    if qrydipj_ipi_f21.Locate('codigo',qryDadosIPI21codigo.AsString, []) then
    begin
      qrydipj_ipi_f21.edit;

      qrydipj_ipi_f21exercicio.AsInteger   := qrydipj_ipiexercicio.AsInteger;
      qrydipj_ipi_f21filial.AsInteger      := qrydipj_ipifilial.AsInteger;

      qrydipj_ipi_f21comcredito.AsCurrency := qryDadosIPI21comipi.AsCurrency;
      qrydipj_ipi_f21semcredito.AsCurrency := qryDadosIPI21semipi.AsCurrency;
      qrydipj_ipi_f21ipicreditado.AsCurrency := qryDadosIPI21ipicreditado.AsCurrency;

      qrydipj_ipi_f21.Post;
    end;
    qryDadosIPI21.next;
  end;

  RecalcularSaldosF21(false);

  if vSequencia<>0 then
    qrydipj_ipi_f21.Locate('sequencia',vSequencia,[]);

  qrydipj_ipi_f21.AfterPost := qrydipj_ipi_f21AfterPost;
  qrydipj_ipi_f21.AfterInsert := qrydipj_ipi_f21AfterInsert;
  qrydipj_ipi_f21.AfterScroll := qrydipj_ipi_f21AfterScroll;

  qrydipj_ipi_f21.EnableControls;


  //REGISTRO F22

  vSequencia := qrydipj_ipi_f22sequencia.AsInteger;
  qrydipj_ipi_f22.AfterPost := nil;
  qrydipj_ipi_f22.AfterInsert := nil;
  qrydipj_ipi_f22.AfterScroll := nil;

  qrydipj_ipi_f22.DisableControls;
  if qrydipj_ipi_f22.IsEmpty then
  begin
    vNSequencia := 0;
    qrydipj_ipi_f22_Discriminacao.First;
    while not qrydipj_ipi_f22_Discriminacao.Eof do
    begin
      qrydipj_ipi_f22.Append;
      qrydipj_ipi_f22sequencia.AsInteger := vNSequencia + 1;
      qrydipj_ipi_f22tipo.AsString := qrydipj_ipi_f22_Discriminacaotipo.AsString;
      qrydipj_ipi_f22exercicio.AsInteger := qrydipj_ipiexercicio.AsInteger;
      qrydipj_ipi_f22filial.AsInteger    := qrydipj_ipifilial.AsInteger;
      qrydipj_ipi_f22sequencia.AsInteger := qrydipj_ipi_f22_Discriminacaosequencia.AsInteger;
      qrydipj_ipi_f22codigo.AsString     := qrydipj_ipi_f22_Discriminacaocodigo.AsString;
      qrydipj_ipi_f22discriminacao.AsString := qrydipj_ipi_f22_Discriminacaodiscriminacao.AsString;

      qrydipj_ipi_f22.Post;
      qrydipj_ipi_f22_Discriminacao.Next;
    end;
  end;

  RefazConsultaPorNome(qryDadosIPI22,['datainicial','datafinal','filial'],
             [DataInicial,DataFinal,qrydipj_ipifilial.asinteger]);

  qryDadosIPI22.First;
  while not qryDadosIPI22.Eof do
  begin
    if qrydipj_ipi_f22.Locate('codigo',qryDadosIPI22codigo.AsString, []) then
    begin
      qrydipj_ipi_f22.edit;

      qrydipj_ipi_f22exercicio.AsInteger   := qrydipj_ipiexercicio.AsInteger;
      qrydipj_ipi_f22filial.AsInteger      := qrydipj_ipifilial.AsInteger;

      qrydipj_ipi_f22comdebito.AsCurrency := qryDadosIPI22comipi.AsCurrency;
      qrydipj_ipi_f22semdebito.AsCurrency := qryDadosIPI22semipi.AsCurrency;
      qrydipj_ipi_f22ipidebitado.AsCurrency := qryDadosIPI22ipidebitado.AsCurrency;

      qrydipj_ipi_f22.Post;
    end;
    qryDadosIPI22.next;
  end;

  RecalcularSaldosf22(false);

  if vSequencia<>0 then
    qrydipj_ipi_f22.Locate('sequencia',vSequencia,[]);

  qrydipj_ipi_f22.AfterPost := qrydipj_ipi_f22AfterPost;
  qrydipj_ipi_f22.AfterInsert := qrydipj_ipi_f22AfterInsert;
  qrydipj_ipi_f22.AfterScroll := qrydipj_ipi_f22AfterScroll;


  qrydipj_ipi_f22.EnableControls;


end;

procedure TdtmDIPJ_IPI.RecalcularSaldosF20(DesligarControles: Boolean);
var
  vSaldo: Currency;
  vTipoSaldo : String;
  vRegistroAtual : TBookMark;

  procedure CalcularSaldo;
  begin
    vSaldo := vSaldo +
              (qrydipj_ipi_f20debito.AsCurrency -
               (ifthen(qrydipj_ipi_f20mes.AsString = '01', qrydipj_ipi_f20saldocredoranterior.AsCurrency,0) +
                qrydipj_ipi_f20credito.AsCurrency));

    qrydipj_ipi_f20.Edit;
    qrydipj_ipi_f20TipoSaldo.AsString := ifthen(vSaldo<0, 'C','D');
    qrydipj_ipi_f20SaldoApurado.AsCurrency := abs(vSaldo);
    qrydipj_ipi_f20existemovto.AsBoolean := (qrydipj_ipi_f20debito.AsCurrency<>0) or
                                            (qrydipj_ipi_f20credito.AsCurrency<>0);
    qrydipj_ipi_f20.post;

  end;
begin
  vSaldo := 0;

  qrydipj_ipi_f20.AfterPost := nil;
  qrydipj_ipi_f20.AfterInsert := nil;

  vRegistroAtual := qrydipj_ipi_f20.GetBookmark;

  if DesligarControles then
    qrydipj_ipi_f20.DisableControls;

  qrydipj_ipi_f20.First;
  while not qrydipj_ipi_f20.Eof  do
  begin
    if qrydipj_ipi_f20mes.AsString <> '01' then
    begin
      qrydipj_ipi_f20.Edit;
      qrydipj_ipi_f20saldocredoranterior.AsCurrency := abs(vSaldo);
      qrydipj_ipi_f20.post;
    end;

    CalcularSaldo;
    qrydipj_ipi_f20.Next;

  end;
  qrydipj_ipi_f20.GotoBookmark(vRegistroAtual);
  qrydipj_ipi_f20.FreeBookmark(vRegistroAtual);

  if DesligarControles then
    qrydipj_ipi_f20.EnableControls;

  qrydipj_ipi_f20.AfterPost := qrydipj_ipi_f20AfterPost;
  qrydipj_ipi_f20.AfterInsert := qrydipj_ipi_f20AfterInsert;

end;

procedure TdtmDIPJ_IPI.RecalcularSaldosF21(DesligarControles: Boolean);
var
  vSequencia : integer;
  vTipo : String;
  vComCredito, vSemCredito, vIPICreditado : Currency;

  vAfterPostligado, vAfterSrollligado: Boolean;
begin
  vAfterPostligado := assigned(qrydipj_ipi_f21.AfterPost);
  vAfterSrollligado := assigned(qrydipj_ipi_f21.AfterScroll);

  qrydipj_ipi_f21.AfterPost := nil;
  qrydipj_ipi_f21.AfterScroll := nil;

  if DesligarControles then
    qrydipj_ipi_f21.DisableControls;

  GuardarRegistroAtual(qrydipj_ipi_f21,true);
  qrydipj_ipi_f21.First;
  while not qrydipj_ipi_f21.Eof do
  begin
    if qrydipj_ipi_f21_Discriminacao.Locate('sequencia',qrydipj_ipi_f21sequencia.AsInteger,[]) then
    begin
      if (qrydipj_ipi_f21_Discriminacaotipo.AsString<>'T') and
         (qrydipj_ipi_f21_Discriminacaotipo.AsString<>'V') and
         (qrydipj_ipi_f21_Discriminacaotipo.AsString<>'')  then
      begin
        vSequencia := qrydipj_ipi_f21sequencia.AsInteger;
        vTipo := qrydipj_ipi_f21_Discriminacaotipo.AsString;

        vComCredito := 0;
        vSemCredito := 0;
        vIPICreditado := 0;

        qrydipj_ipi_f21.First;
        while not qrydipj_ipi_f21.Eof do
        begin
          if pos(','+qrydipj_ipi_f21codigo.AsString+',',vTipo)<>0 then
          begin
            vComCredito   := vComCredito + qrydipj_ipi_f21comcredito.AsCurrency;
            vSemCredito   := vSemCredito + qrydipj_ipi_f21semcredito.AsCurrency;
            vIPICreditado := vIPICreditado + qrydipj_ipi_f21ipicreditado.AsCurrency;
          end;
          qrydipj_ipi_f21.Next;
          if vSequencia = qrydipj_ipi_f21sequencia.AsInteger then
          begin
            qrydipj_ipi_f21.Edit;
            if qrydipj_ipi_f21_Discriminacaolcomcredito.AsBoolean then
              qrydipj_ipi_f21comcredito.AsCurrency := vComCredito;

            if qrydipj_ipi_f21_Discriminacaolsemcredito.AsBoolean then
              qrydipj_ipi_f21semcredito.AsCurrency := vSemCredito;

            if qrydipj_ipi_f21_Discriminacaolipicreditado.AsBoolean then
              qrydipj_ipi_f21ipicreditado.AsCurrency := vIPICreditado;

            qrydipj_ipi_f21.post;

            break;
          end;
        end;
      end;
    end;
    qrydipj_ipi_f21.Next;
  end;
  VoltarRegistroAtual(qrydipj_ipi_f21);

  if DesligarControles then
    qrydipj_ipi_f21.EnableControls;

  if vAfterPostligado then
    qrydipj_ipi_f21.AfterPost := qrydipj_ipi_f21AfterPost;

  if vAfterSrollligado then
    qrydipj_ipi_f21.AfterScroll := qrydipj_ipi_f21AfterScroll;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f21AfterPost(DataSet: TDataSet);
begin
  inherited;
  RecalcularSaldosF21(true);
  qrydipj_ipi.edit;

end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f21AfterInsert(DataSet: TDataSet);
begin
  inherited;
  qrydipj_ipi_f21.Cancel;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f20AfterInsert(DataSet: TDataSet);
begin
  inherited;
  qrydipj_ipi_f20.Cancel;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f20AfterPost(DataSet: TDataSet);
begin
  inherited;
  RecalcularSaldosF20(true);
  qrydipj_ipi.edit;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f22AfterInsert(DataSet: TDataSet);
begin
  inherited;
  qrydipj_ipi_f22.Cancel;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f22AfterPost(DataSet: TDataSet);
begin
  inherited;
  RecalcularSaldosF22(true);
  qrydipj_ipi.edit;
  
end;

procedure TdtmDIPJ_IPI.RecalcularSaldosF22(DesligarControles: Boolean);
var
  vSequencia : integer;
  vTipo : String;
  vComDebito, vSemDebito, vIPIDebitado : Currency;

  vAfterPostligado, vAfterSrollligado: Boolean;
begin
  vAfterPostligado := assigned(qrydipj_ipi_f22.AfterPost);
  vAfterSrollligado := assigned(qrydipj_ipi_f22.AfterScroll);

  qrydipj_ipi_f22.AfterPost := nil;
  qrydipj_ipi_f22.AfterScroll := nil;

  if DesligarControles then
    qrydipj_ipi_f22.DisableControls;

  GuardarRegistroAtual(qrydipj_ipi_f22,true);
  qrydipj_ipi_f22.First;
  while not qrydipj_ipi_f22.Eof do
  begin
    if qrydipj_ipi_f22_Discriminacao.Locate('sequencia',qrydipj_ipi_f22sequencia.AsInteger,[]) then
    begin
      if (qrydipj_ipi_f22_Discriminacaotipo.AsString<>'T') and
         (qrydipj_ipi_f22_Discriminacaotipo.AsString<>'V') and
         (qrydipj_ipi_f22_Discriminacaotipo.AsString<>'')  then
      begin
        vSequencia := qrydipj_ipi_f22sequencia.AsInteger;
        vTipo := qrydipj_ipi_f22_Discriminacaotipo.AsString;

        vComDebito := 0;
        vSemDebito := 0;
        vIPIDebitado := 0;

        qrydipj_ipi_f22.First;
        while not qrydipj_ipi_f22.Eof do
        begin
          if pos(','+qrydipj_ipi_f22codigo.AsString+',',vTipo)<>0 then
          begin
            vComDebito   := vComDebito + qrydipj_ipi_f22comdebito.AsCurrency;
            vSemDebito   := vSemDebito + qrydipj_ipi_f22semdebito.AsCurrency;
            vIPIDebitado := vIPIDebitado + qrydipj_ipi_f22ipidebitado.AsCurrency;
          end;
          qrydipj_ipi_f22.Next;
          if vSequencia = qrydipj_ipi_f22sequencia.AsInteger then
          begin
            qrydipj_ipi_f22.Edit;
            if qrydipj_ipi_f22_Discriminacaolcomdebito.AsBoolean then
              qrydipj_ipi_f22comdebito.AsCurrency := vComDebito;

            if qrydipj_ipi_f22_Discriminacaolsemdebito.AsBoolean then
              qrydipj_ipi_f22semdebito.AsCurrency := vSemDebito;

            if qrydipj_ipi_f22_Discriminacaolipidebitado.AsBoolean then
              qrydipj_ipi_f22ipidebitado.AsCurrency := vIPIDebitado;

            qrydipj_ipi_f22.post;

            break;
          end;
        end;
      end;
    end;
    qrydipj_ipi_f22.Next;
  end;
  VoltarRegistroAtual(qrydipj_ipi_f22);

  if DesligarControles then
    qrydipj_ipi_f22.EnableControls;

  if vAfterPostligado then
    qrydipj_ipi_f22.AfterPost := qrydipj_ipi_f22AfterPost;

  if vAfterSrollligado then
    qrydipj_ipi_f22.AfterScroll := qrydipj_ipi_f22AfterScroll;

end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f21AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qrydipj_ipi_f21_Discriminacao.Locate('sequencia',qrydipj_ipi_f21sequencia.AsInteger,[]) then
  begin
     qrydipj_ipi_f21comcredito.ReadOnly := (qrydipj_ipi_f21_Discriminacaotipo.AsString<>'V') or not qrydipj_ipi_f21_Discriminacaolcomcredito.AsBoolean;
     qrydipj_ipi_f21semcredito.ReadOnly := (qrydipj_ipi_f21_Discriminacaotipo.AsString<>'V') or not qrydipj_ipi_f21_Discriminacaolsemcredito.AsBoolean;
     qrydipj_ipi_f21ipicreditado.ReadOnly := (qrydipj_ipi_f21_Discriminacaotipo.AsString<>'V') or not qrydipj_ipi_f21_Discriminacaolipicreditado.AsBoolean;
  end;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f22AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qrydipj_ipi_f22_Discriminacao.Locate('sequencia',qrydipj_ipi_f22sequencia.AsInteger,[]) then
  begin
     qrydipj_ipi_f22comdebito.ReadOnly := (qrydipj_ipi_f22_Discriminacaotipo.AsString<>'V') or not qrydipj_ipi_f22_Discriminacaolcomdebito.AsBoolean;
     qrydipj_ipi_f22semdebito.ReadOnly := (qrydipj_ipi_f22_Discriminacaotipo.AsString<>'V') or not qrydipj_ipi_f22_Discriminacaolsemdebito.AsBoolean;
     qrydipj_ipi_f22ipidebitado.ReadOnly := (qrydipj_ipi_f22_Discriminacaotipo.AsString<>'V') or not qrydipj_ipi_f22_Discriminacaolipidebitado.AsBoolean;
  end;
end;

procedure TdtmDIPJ_IPI.qrydipj_ipi_f20AfterOpen(DataSet: TDataSet);
begin
  inherited;
  RecalcularSaldosF20(true);
end;

end.


