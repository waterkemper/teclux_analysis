unit dmFCI;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, dmtecsoft, DB, cpdatasource, ctconstantes,
  ZQuery, ZPgSqlQuery, cpquery, fr_dset, fr_dbset, fr_class, fmpreviewpadrao, biblio;

type
  TdtmFCI = class(TdtmBasico)
    qryDadosFCI: TtecQuery;
    dsrDadosFCI: TtecDataSource;
    qryDadosFCIpn: TStringField;
    qryDadosFCIcodigo: TLargeintField;
    qryDadosFCIcodigovisual: TStringField;
    qryDadosFCIdescricao: TStringField;
    qryDadosFCIvalorimportacao: TFloatField;
    qryDadosFCIprecovenda: TFloatField;
    qryDadosFCIpercimportacao: TFloatField;
    qryDadosFCIncm: TStringField;
    qryDadosFCIunidade: TStringField;
    qryDadosFCIDescricaoErro: TStringField;
    qryDadosFCImarcar: TBooleanField;
    qryDadosFCIDesconsiderar: TBooleanField;
    qryfci: TtecQuery;
    qryfcinumero: TIntegerField;
    qryfcidata: TDateField;
    qryfcinumerofci: TStringField;
    qryfcidt_recepcao_arquivo: TStringField;
    qryfcicod_recepcao_arquivo: TStringField;
    qryfcidt_validacao_arquivo: TStringField;
    qryfciin_validacao_arquivo: TStringField;
    qryFCIProximo: TtecQuery;
    qryFCIProximonumero: TIntegerField;
    qryfcihora: TTimeField;
    qryFCIProdutos: TtecQuery;
    qryFCIProdutosfci: TIntegerField;
    qryFCIProdutosproduto: TLargeintField;
    qryFCIProdutosncm: TStringField;
    qryFCIProdutosunidade: TStringField;
    qryFCIProdutosvalorimportacao: TFloatField;
    qryFCIProdutosvalorsaida: TFloatField;
    qryFCIProdutospercimportacao: TFloatField;
    qryProtocolo: TtecQuery;
    qryProtocolonumero: TIntegerField;
    qryProtocolodata: TDateField;
    qryProtocolonumerofci: TStringField;
    qryProtocolodt_recepcao_arquivo: TStringField;
    qryProtocolocod_recepcao_arquivo: TStringField;
    qryProtocolodt_validacao_arquivo: TStringField;
    qryProtocoloin_validacao_arquivo: TStringField;
    qryProtocolohora: TTimeField;
    qryFCIRetorno: TtecQuery;
    qryFCIRetornonumero: TIntegerField;
    qryFCIRetornodata: TDateField;
    qryFCIRetornonumerofci: TStringField;
    qryFCIRetornodt_recepcao_arquivo: TStringField;
    qryFCIRetornocod_recepcao_arquivo: TStringField;
    qryFCIRetornodt_validacao_arquivo: TStringField;
    qryFCIRetornoin_validacao_arquivo: TStringField;
    qryFCIRetornohora: TTimeField;
    qryFCIRetornoProdutos: TtecQuery;
    qryFCIRetornoProdutosfci: TIntegerField;
    qryFCIRetornoProdutosproduto: TLargeintField;
    qryFCIRetornoProdutosncm: TStringField;
    qryFCIRetornoProdutosunidade: TStringField;
    qryFCIRetornoProdutosvalorimportacao: TFloatField;
    qryFCIRetornoProdutosvalorsaida: TFloatField;
    qryFCIRetornoProdutospercimportacao: TFloatField;
    qryFCIRetornoProdutoscodigovisual: TStringField;
    qryFCIRetornoProdutoscodigo_fci: TStringField;
    qryFCIRetornoProdutosin_validacao_ficha: TStringField;
    qryFCIRetornoProdutospn: TStringField;
    qryFCIRetornoProdutosdescricao: TStringField;
    dsrFCIRetornoProdutos: TtecDataSource;
    qryfciArquivoTexto: TtecQuery;
    IntegerField1: TIntegerField;
    qryFCIRetornoArquivoTexto: TtecQuery;
    qryFCIRetornoArquivoTextonumero: TIntegerField;
    qryfciArquivoTextoarquivofciremessa: TMemoField;
    qryFCIRetornoArquivoTextoarquivofciretorno: TMemoField;
    qryDadosFCIgtin: TStringField;
    qryFCIProdutosgtin: TStringField;
    qryFCIRetornoProdutosgtin: TStringField;
    procedure qryDadosFCICalcFields(DataSet: TDataSet);
    procedure qryDadosFCIAfterScroll(DataSet: TDataSet);
    procedure qryDadosFCImarcarChange(Sender: TField);
    procedure qryFCIRetornoAfterScroll(DataSet: TDataSet);
  private
    fListadePNsSelecionadasAleatoriamente: String;
    FParametroCabecalho: String;
    fNumeroFCI: integer;
    procedure SetListadePNsSelecionadasAleatoriamente(const Value: String);
    function GetNumeroFCI: integer;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    property ListadePNsSelecionadasAleatoriamente: String read fListadePNsSelecionadasAleatoriamente write SetListadePNsSelecionadasAleatoriamente;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    function AbrirConsultas: Boolean;
    function GerarArquivo(NomeArquivo: String; ExtTXT: boolean = true): boolean;
    procedure MarcarRegistrosFCI(marcar, Todos: boolean);
    property NumeroFCI: integer read GetNumeroFCI write fNumeroFCI;
    function GuardarNumeroProtocolo(Numero: String): boolean;
    function ProcessarRetorno(Arquivo: String): boolean;





  end;

var
  dtmFCI: TdtmFCI;

implementation

{$R *.dfm}

{ TdtmFCI }

function TdtmFCI.AbrirConsultas: Boolean;
begin
   QtdeMarcados := 0;
   ReFazConsultaporNome(qryDadosFCI,['filialbase'],[filialbase]);
   result := not qryDadosFCI.IsEmpty;

end;

constructor TdtmFCI.Create(AOwner: TComponent);
begin
  inherited;
  qryfci.tag := cttabelas;
end;

function TdtmFCI.GerarArquivo(NomeArquivo: String; ExtTXT: boolean): boolean;
var

  vSequencia    : integer;
  vArquivo,Barra : String;
  vLinhaString : String;
  Arq: TextFile;
  i : integer;
  vTipo, vRegistros5020Marcados : integer;

  procedure GravarLinha_String(str : String);
  begin
   Writeln(Arq, UTF8Encode(str));
  end;

begin
  result := true;
  vArquivo := ExportacaoDir;

  Barra := '\';

  vArquivo := vArquivo + Barra + NomeArquivo;

  try
    AssignFile(Arq, vArquivo);
    //    if FileExists(NomeArquivo) then
    Rewrite(Arq);
    Write(Arq, #239+#187+#191);

    // BLOCO 0
    // Registro 0000 - Identificação do contribuinte
    GravarLinha_String('0000'          + '|' +
                       CNPJFilialBase  + '|' +
                       RazaoFilialBase + '|' +
                       '1.0' );

    //Registro 0001 – Identificação do inicio do Bloco

    GravarLinha_String('0001'          + '|' +
//                       'Texto em caracteres UTF-8: (dígrafo BR)''ção'',(dígrafo espanhol-enhe)''ñ'',(trema)''Ü'',(ordinais)''ªº'',(ligamento s+z alemão)''ß''.');
                       NomeArquivo);



    //Registro 0010 – Informações do estabelecimento/Contribuinte informante

    GravarLinha_String('0010'          + '|' +
                       CNPJFilialBase  + '|' +
                       RazaoFilialBase + '|' +
                       somentenumero(InscricaoEstadualFilialBase) + '|' +
                       RuaComNumeroFilialBase  + '|' +
                       CEPFilialBase + '|' +
                       CidadeFilialBase + '|' +
                       EstadoFilialBase);

    //Registro 0990 – Finalização do Bloco 0
    GravarLinha_String('0990|4');

    //Bloco 5
    //Registro 5001 – Inicio do bloco de produtos e mercadorias
    GravarLinha_String('5001');

    //Registro Tipo 5020 Informações dos Produtos/Mercadorias
    vRegistros5020Marcados := 0;
    GuardarRegistroAtual(qryDadosFCI,true);
    qryDadosFCI.First;
    while not qryDadosFCI.Eof do
    begin
      if qryDadosFCImarcar.AsBoolean then
      begin
        GravarLinha_String('5020' + '|' +
                           qryDadosFCIdescricao.AsString + '|' +
                           SomenteNumero(qryDadosFCIncm.AsString)  + '|' +
                           qryDadosFCIcodigovisual.AsString  + '|' +
                           qryDadosFCIgtin.AsString  + '|' +
                           qryDadosFCIunidade.AsString  + '|' +

                           formatfloat('0.00',qryDadosFCIprecovenda.AsCurrency) + '|' +
                           formatfloat('0.00',qryDadosFCIvalorimportacao.AsCurrency) + '|' +
                           formatfloat('0.00',qryDadosFCIpercimportacao.AsCurrency)
                          );
        inc(vRegistros5020Marcados);
      end;
      qryDadosFCI.Next;
    end;
    VoltarRegistroAtual(qryDadosFCI);

    //Registro Tipo 5990 – FINALIZAÇÃO DO BLOCO 5
    GravarLinha_String('5990' + '|' + inttostr(2+vRegistros5020Marcados));

    //Bloco 9 – Totalização de Registros
    GravarLinha_String('9001');
    GravarLinha_String('9900' + '|' + '0000' + '|' + '1');
    GravarLinha_String('9900' + '|' + '0010' + '|' + '1');
    GravarLinha_String('9900' + '|' + '5020' + '|' + inttostr(vRegistros5020Marcados));

    //REGISTRO 9990: ENCERRAMENTO DO BLOCO 9
    GravarLinha_String('9990'+ '|' + '5');

    //REGISTRO 9999: ENCERRAMENTO DO ARQUIVO DIGITAL
    GravarLinha_String('9999'+ '|' + inttostr(12+vRegistros5020Marcados));

  except
    on E:EFCreateError do
    begin
      MensagemErro(E.Message);
      result := false;
    end;
  end;


  closefile(arq);

  if result then
  begin
    qryFCIProximo.Open;

    qryfci.Append;
    qryfcinumero.AsInteger := qryFCIProximonumero.AsInteger;
    qryfcidata.AsDateTime := DataServidor;
    qryfcihora.AsDateTime := HoraServidor;
    qryfcinumerofci.AsInteger := fNumeroFCI;
    qryfci.post;

    qryFCIProximo.close;

    RefazConsultaPorNome(qryfciprodutos, ['fci'], [qryfcinumero.Asinteger]);
    GuardarRegistroAtual(qryDadosFCI,true);
    qryDadosFCI.First;
    while not qryDadosFCI.Eof do
    begin
      if qryDadosFCImarcar.AsBoolean then
      begin
        qryFCIProdutos.Append;
        qryFCIProdutosfci.AsInteger := qryfcinumero.AsInteger;
        qryFCIProdutosproduto.AsLargeInt := qryDadosFCIcodigo.AsLargeInt;
        qryFCIProdutosncm.AsString := qryDadosFCIncm.AsString;
        qryFCIProdutosgtin.AsVariant := qryDadosFCIgtin.AsVariant;
        qryFCIProdutosunidade.AsString := qryDadosFCIunidade.AsString;
        qryFCIProdutosvalorimportacao.AsCurrency := qryDadosFCIvalorimportacao.AsCurrency;
        qryFCIProdutosvalorsaida.AsCurrency := qryDadosFCIprecovenda.AsCurrency;
        qryFCIProdutospercimportacao.AsCurrency := qryDadosFCIpercimportacao.AsFloat;
        qryFCIProdutos.post;
      end;
      qryDadosFCI.Next;
    end;

    VoltarRegistroAtual(qryDadosFCI);
    result := Perpetrar([qryfci,qryfciprodutos]);

    if result then
    begin
      RefazConsultaPorNome(qryfciArquivoTexto,['numero'],[qryfcinumero.AsInteger]);
      qryfciArquivoTexto.edit;
      qryfciArquivoTextoarquivofciremessa.LoadFromFile(vArquivo);
      qryfciArquivoTexto.post;
      result :=  Perpetrar([qryfciArquivoTexto]);
    end;

  end;

end;


procedure TdtmFCI.SetListadePNsSelecionadasAleatoriamente(
  const Value: String);

const
SQLFCIListaPNs = 'and p.codigo in (select cp.produto from clientesprodutos cp where cp.pn in (%s))';
begin
  fListadePNsSelecionadasAleatoriamente := Value;
  if Value<>'' then
  begin
   qryDadosFCI.Macrobyname('ListadePNs').AsString := format(SQLFCIListaPNs, [Value]);
   FParametroCabecalho:=FParametroCabecalho+' Lista de PNs: '+Value;
  end
  else
   qryDadosFCI.Macrobyname('ListadePNs').AsString := '';
end;

procedure TdtmFCI.qryDadosFCICalcFields(DataSet: TDataSet);
begin
  inherited;
  qryDadosFCIDescricaoErro.clear;
  if ((qryDadosFCI.FieldByName('precovenda').isnull) or
      (qryDadosFCI.FieldByName('precovenda').value = 0)) and
     ((qryDadosFCI.FieldByName('valorimportacao').isnull) or
      (qryDadosFCI.FieldByName('valorimportacao').value = 0)) then
    qryDadosFCIDescricaoErro.AsString := 'Não há preço de venda ou valor importado'
  else
  if ((qryDadosFCI.FieldByName('precovenda').isnull) or
      (qryDadosFCI.FieldByName('precovenda').value = 0)) then
    qryDadosFCIDescricaoErro.AsString := 'Não há preço de venda'
  else
  if (qryDadosFCI.FieldByName('valorimportacao').isnull) or
     (qryDadosFCI.FieldByName('valorimportacao').value = 0) then
    qryDadosFCIDescricaoErro.AsString := 'Não há valor importado'
  else
  if ((qryDadosFCI.FieldByName('precovenda').value <> 0) and
      (qryDadosFCI.FieldByName('valorimportacao').value <> 0) and
      (qryDadosFCI.FieldByName('precovenda').ascurrency <
       qryDadosFCI.FieldByName('valorimportacao').ascurrency)) then
    qryDadosFCIDescricaoErro.AsString := 'O valor importado é maior do que o preço de venda'
  else
  if ((qryDadosFCI.FieldByName('percimportacao').isnull) or
      (qryDadosFCI.FieldByName('percimportacao').value = 0)) then
    qryDadosFCIDescricaoErro.AsString := 'Não há percentual de importação'
  else
  if (qryDadosFCI.FieldByName('ncm').isnull) or (length(trim(qryDadosFCI.FieldByName('ncm').asstring))<>8) then
    qryDadosFCIDescricaoErro.AsString := 'NCM tem que possuir oito dígitos';
  qryDadosFCIDesconsiderar.AsBoolean := not qryDadosFCIDescricaoErro.isnull;    
end;

procedure TdtmFCI.qryDadosFCIAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryDadosFCI.ReadOnly := not qryDadosFCIDescricaoErro.IsNull;
end;

procedure TdtmFCI.MarcarRegistrosFCI(marcar, Todos: boolean);
begin
  if todos then
  begin
    qryDadosFCImarcar.OnChange := nil;
    MarcarRegistros(qryDadosFCI, qryDadosFCImarcar, qryDadosFCIDesconsiderar, marcar, Todos);
    qryDadosFCImarcar.OnChange := qryDadosFCImarcarChange;
  end
  else
  begin
    if qryDadosFCImarcar.asboolean then
      inc(fQtdeMarcados)
    else
      dec(fQtdeMarcados);
  end;
end;

procedure TdtmFCI.qryDadosFCImarcarChange(Sender: TField);
begin
  inherited;
  MarcarRegistrosFCI(qryDadosFCImarcar.AsBoolean, False);
end;

function TdtmFCI.GetNumeroFCI: integer;
begin
  qryfci.Last;
  if qryfci.recordcount = 0 then
    fNumeroFCI := 1
  else
    fNumeroFCI := qryfcinumerofci.AsInteger + 1;
  Result := fNumeroFCI;
end;

function TdtmFCI.GuardarNumeroProtocolo(Numero: String): boolean;
begin
   result := true;
   RefazConsultaPorNome(qryProtocolo,['cod_recepcao_arquivo'],[Numero]);
   if qryProtocolo.recordcount <> 0 then
   begin
     result := false;
     MensagemErro('Este número de protocolo já foi cadastrado em '+qryProtocolodata.AsString+' '+qryProtocolohora.AsString)
   end
   else
   begin
     qryfci.Edit;
     qryfcicod_recepcao_arquivo.AsString := Numero;
     qryfci.post;
     result := Perpetrar([dtmFCI.qryfci]);
   end;
end;

function TdtmFCI.ProcessarRetorno(Arquivo: String): boolean;
var
 vArquivo : TStringList;
 vRegistro0000, vRegistro5020: TStringList;
 i : integer;
begin
  result := true;

  vArquivo := tStringlist.create;
  vArquivo.Delimiter := '|';
//  vArquivo.strictdelimiter := true;
//  vArquivo.QuoteChar := '|';

  vRegistro0000 := tStringlist.create;
  vRegistro0000.Delimiter := '|';
//  vRegistro0000.strictdelimiter:=true;

  vRegistro5020 := tStringlist.create;
  vRegistro5020.Delimiter := '|';
//  vRegistro5020.QuoteChar := '|';

//  vRegistro5020.strictdelimiter:=true;

  if fileexists(Arquivo) then
    vArquivo.loadfromfile(Arquivo);

  for i:=0 to varquivo.Count-1 do
  begin

    //Verificar cnpj empresa
    if copy(varquivo[i],1,4)='0000' then
    begin
      vRegistro0000.Clear;
      ExtractStrings(['|'], [], pchar(vArquivo[i]), vRegistro0000);
      if not (PossuiSomenteNumero(vRegistro0000[1]) and
          (vRegistro0000[1] = cnpjFilialBase)) then
      begin
        MensagemErro(format('O CNPJ %s contido no arquivo esta diferente do CNPJ %s da empresa',[FormatarCPFouCGC(vRegistro0000[1]), FormatarCPFouCGC(cnpjfilialbase)] ));
        result := false;
        break;

      end
      else
      begin
        if trim(vRegistro0000[6]) = '' then
        begin
          MensagemErro('O arquivo de retorno não possui o ''CÓDIGO DO PROTOCOLO DE RECEPÇÃO''');
          result := false;
          break;
        end
        else
        begin
          RefazConsultaPorNome(qryFCIRetorno,['cod_recepcao_arquivo'],[vRegistro0000[6]]);
          if qryFCIRetorno.IsEmpty then
          begin
            MensagemErro(format(' O ''CÓDIGO DO PROTOCOLO DE RECEPÇÃO'' %s não esta cadastrado ',[vRegistro0000[6]]));
            result := false;
            break;
          end;
        end;
      end;
    end;

    if copy(varquivo[i],1,4)='5020' then
    begin
      vRegistro5020.Clear;
      ExtractStrings(['|'], ['|'], pchar(trocar(vArquivo[i],'||','|'+quotedstr('')+'|')), vRegistro5020);

      if qryFCIRetornoProdutos.Locate('codigovisual',vRegistro5020[3],[]) then
      begin
        qryFCIRetornoProdutos.Edit;
        qryFCIRetornoProdutoscodigo_fci.AsString := vRegistro5020[9];
        qryFCIRetornoProdutosin_validacao_ficha.AsString := vRegistro5020[10];
        qryFCIRetornoProdutos.Post;
      end
      else
      begin
        MensagemErro(format(' O produto %s não esta presente nesta remessa ',[vRegistro5020[3]+' - '+vRegistro5020[1]]));
        result := false;
        break;
      end;

    end;


  end;

  if result then
  begin
    qryfciretorno.Edit;
    qryFCIRetornodt_recepcao_arquivo.AsString :=  vRegistro0000[5];
    qryFCIRetornocod_recepcao_arquivo.AsString := vRegistro0000[6];
    qryFCIRetornodt_validacao_arquivo.AsString := vRegistro0000[7];
    qryFCIRetornoin_validacao_arquivo.AsString := vRegistro0000[8];
    qryfciretorno.Post;

    result := perpetrar([qryfciRetorno, qryFCIRetornoProdutos]);

    if result then
    begin
      RefazConsultaPorNome(qryFCIRetornoArquivoTexto,['numero'],[qryfciRetornonumero.AsInteger]);
      qryfciRetornoArquivoTexto.edit;
      qryFCIRetornoArquivoTextoarquivofciretorno.LoadFromFile(Arquivo);
      qryfciRetornoArquivoTexto.post;
      result :=  Perpetrar([qryfciRetornoArquivoTexto]);
    end;

  end
  else
  begin
    qryFCIRetornoProdutos.Close;
    qryFCIRetorno.Close;
  end;

  varquivo.free;
  vRegistro0000.free;
  vRegistro5020.free;

end;

procedure TdtmFCI.qryFCIRetornoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryFCIRetornoProdutos,['fci'],[qryFCIRetornonumero.AsInteger]);
end;

end.
