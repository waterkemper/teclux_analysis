unit dmgerarremessassoacred;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, biblio, ctconstantes, VKDBFDataSet, ZTransact, dmtecsoft;

type
  TdtmGerarRemessasSoacred = class(TdtmBasico)
    qryContratosParcelas: TtecQuery;
    dsrContratosParcelas: TtecDataSource;
    qryClientes: TtecQuery;
    dsrClientes: TtecDataSource;
    qryVendas: TtecQuery;
    dsrVendas: TtecDataSource;
    qryClientescodigo: TIntegerField;
    qryClientespessoanumero: TStringField;
    qryClientesnome: TStringField;
    qryClientesnascto: TDateField;
    qryClientespai: TStringField;
    qryClientesmae: TStringField;
    qryClientesnaturalcidade: TStringField;
    qryClientesnaturalestado: TStringField;
    qryClientesnacionalidade: TMemoField;
    qryClientesidestado: TStringField;
    qryClientesiddocumento: TStringField;
    qryClientesidorgao: TStringField;
    qryClientesiddata: TDateField;
    qryClientesrua: TStringField;
    qryClientesbairro: TStringField;
    qryClientescidade: TStringField;
    qryClientesestado: TStringField;
    qryClientescep: TIntegerField;
    qryClientesfoneddd: TIntegerField;
    qryClientesfonenumero: TIntegerField;
    qryClientesfone2numero: TIntegerField;
    qryClientescivil: TStringField;
    qryClientessexo: TStringField;
    qryClientesconnome: TStringField;
    qryClientesempresa: TStringField;
    qryClientesempfonenumero: TIntegerField;
    qryClientesempadmissao: TDateField;
    qryClientescargo: TStringField;
    qryClientesemprendavalor: TFloatField;
    qryClientesconempresa: TStringField;
    qryClientescargoconjuge: TStringField;
    qryClientesreferencia: TStringField;
    qryClientesref1fone: TMemoField;
    qryClientesref1tipo: TStringField;
    qryClientesdatacadastro: TDateField;
    qryClientesultimaalteracao: TDateField;
    qryVendascontrato: TStringField;
    qryVendascliente: TIntegerField;
    qryVendasnome: TStringField;
    qryVendasfaturamento: TDateField;
    qryVendasvalorvista: TFloatField;
    qryVendasvalorprazo: TFloatField;
    qryContratosParcelascontrato: TStringField;
    qryContratosParcelasparcela: TIntegerField;
    qryContratosParcelasdatavencto: TDateField;
    qryContratosParcelasdatapagto: TDateField;
    qryContratosParcelasvalorvencto: TFloatField;
    qryContratosParcelasvalorpagto: TFloatField;
    qryContratosParcelasmora: TFloatField;
    qryContratosParcelasformapagamento: TStringField;
    qryContratosParcelascliente: TIntegerField;
    qryClientesultimaconsulta: TDateField;
    qryVendasvendedor: TStringField;
    qryContratosParcelasnome: TStringField;
    qryContratosParcelasfaturamento: TDateField;
    qryVendascan_data: TDateField;
    qryVendasmodalidade: TStringField;
    qryVendasplano: TMemoField;
    procedure qryVendasBeforeInsert(DataSet: TDataSet);
  private
    procedure SalvarSoacredIni(Diretorio, Loja, Agente, Conceito:String);
    function GetTabelaContratosParcelasVazia: Boolean;
    function MontarData(Campo, DataInicial, DataFinal: String): String;
    function GetTabelaClientesVazia: Boolean;
    function GetTabelaVendasVazia: Boolean;
    function CheckRequiredFieldsVendas: Boolean;
    { Private declarations }
  public
    procedure ConsultaParcelas(PagtoInicial, PagtoFinal, FaturamentoInicial, FaturamentoFinal,
                               Alteracaoinicial, AlteracaoFinal, Filial, Agente, Conceito: String);
    function GravarArquivos(Diretorio, CodigoLoja, Agente, Conceito: String): Boolean;
    procedure FecharTabelas;
    property  TabelaContratosParcelasVazia: Boolean read GetTabelaContratosParcelasVazia;
    property  TabelaClientesVazia: Boolean read GetTabelaClientesVazia;
    property  TabelaVendasVazia: Boolean read GetTabelaVendasVazia;
    { Public declarations }
  end;

var
  dtmGerarRemessasSoacred: TdtmGerarRemessasSoacred;

implementation

uses
//CLX
  inifiles
//VCL
  {$IFDEF MSWINDOWS}, Windows {$ENDIF};

{$R *.dfm}

{ TdtmGerarRemessasSoacred }

procedure TdtmGerarRemessasSoacred.ConsultaParcelas(PagtoInicial, PagtoFinal,
           FaturamentoInicial, FaturamentoFinal, AlteracaoInicial, AlteracaoFinal,
           Filial, Agente, Conceito: String);
begin
  qryContratosParcelas.MacroByName('faturamento').Value := 'and ((c.faturamento between (''' + FaturamentoInicial + ''') and (''' + FaturamentoFinal + ''')) or' + #13#10 +
                                                           '    (p.datapagto between (''' + PagtoInicial + ''') and (''' + PagtoFinal + ''')))';

  qryVendas.MacroByName('faturamento').Value            := MontarIntervaloData('c.faturamento',FaturamentoInicial, FaturamentoFinal);

  if Agente <> '' then
  begin
    qryContratosParcelas.MacroByName('agente').Value    := 'and c.agente = ' + Agente;
    qryVendas.MacroByName('agente').Value               := 'and c.agente = ' + Agente;
  end
  else
  begin
    qryContratosParcelas.MacroByName('agente').Value    := '';
    qryVendas.MacroByName('agente').Value               := '';
  end;
  if Conceito <> '' then
  begin
    qryContratosParcelas.MacroByName('conceito').Value  := 'and c.conceito = ' + Conceito;
    qryClientes.MacroByName('conceito').Value           := 'and cl.conceito = ' + Conceito;
    qryVendas.MacroByName('conceito').Value             := 'and c.conceito = ' + Conceito;
  end
  else
  begin
    qryContratosParcelas.MacroByName('conceito').Value  := '';
    qryClientes.MacroByName('conceito').Value           := '';
    qryVendas.MacroByName('conceito').Value             := '';
  end;
  if Filial <> '' then
  begin
    qryContratosParcelas.MacroByName('filial').Value    := 'and c.filialvenda = ' + Filial;
    qryVendas.MacroByName('filial').Value               := 'and c.filialvenda = ' + Filial;
    qryClientes.MacroByName('datas').Value := 'and cl.codigo in (select distinct c.cliente' + #13#10 +
                                              '                  from contratos c' + #13#10 +
                                              '                  where c.filialvenda = ' + Filial + #13#10 +
                                              '                    and c.tipocliente = ''C''' + #13#10 +
                                              '		           ' + MontarIntervaloData('c.faturamento',FaturamentoInicial, FaturamentoFinal) + #13#10 +
                                              '		            or c.numero in (select p.contrato' + #13#10 +
                                              '				            from parcelas p' + #13#10 +
                                              '				            where p.contrato is not null' + #13#10 +
                                              '                                     ' + MontarIntervaloData('p.datapagto',PagtoInicial,PagtoInicial) + #13#10 +
                                              '                                     )' + #13#10 +
                                              '                  )';
  end
  else
  begin
    qryContratosParcelas.MacroByName('filial').Value    := '';
    qryVendas.MacroByName('filial').Value               := '';
    qryClientes.MacroByName('datas').Value := 'and cl.codigo in (select distinct c.cliente' + #13#10 +
                                              '                  from contratos c' + #13#10 +
                                              '                  where c.tipocliente = ''C''' + #13#10 +
                                              '		           ' + MontarIntervaloData('c.faturamento',FaturamentoInicial, FaturamentoFinal) + #13#10 +
                                              '		            or c.numero in (select p.contrato' + #13#10 +
                                              '				            from parcelas p' + #13#10 +
                                              '				            where p.contrato is not null' + #13#10 +
                                              '                                     ' + MontarIntervaloData('p.datapagto',PagtoInicial,PagtoInicial) + #13#10 +
                                              '                                     )' + #13#10 +
                                              '                  )';
  end;
  qryClientes.Params[0].AsString := FaturamentoInicial;
  qryClientes.Params[1].AsString := FaturamentoFinal;
  qryClientes.MacroByName('alteracao').Value := MontarData('cl.ultimaalteracao', Alteracaoinicial, AlteracaoFinal);


  if qryContratosParcelas.Active then
    qryContratosParcelas.Close;
  qryContratosParcelas.Open;
  if qryClientes.Active then
    qryClientes.Close;
  qryClientes.Open;
  if qryVendas.Active then
    qryVendas.Close;
  qryVendas.Open;
  if (qryContratosParcelas.RecordCount = 0) and
     (qryClientes.RecordCount          = 0) and
     (qryVendas.RecordCount            = 0) then
    MensagemAviso(ctCONSULTAVAZIA);
end;

function TdtmGerarRemessasSoacred.GetTabelaContratosParcelasVazia: Boolean;
begin
  Result := qryContratosParcelas.IsEmpty;
end;

function TdtmGerarRemessasSoacred.GravarArquivos(Diretorio, CodigoLoja, Agente, Conceito: String): Boolean;
var
  Arquivo  : TextFile;
  Origem,
  LojaSN,
  SemDV,
  HoraCerta: String;
  i,j      : Byte;
  ClientesDbf : array [1..49] of TStringList;
  ParcelasDbf : array [1..15] of TStringList;
  VendasDbf   : array [1..15] of TStringList;
  ObservaDbf  : array [1..5]  of TStringList;
  AutorizaDbf : array [1..11] of TStringList;
  dbfTable : TVKDBFNTX;
begin
  if CheckRequiredFieldsVendas then
  begin
    Result := True;
    SalvarSoacredIni(Diretorio, CodigoLoja, Agente, Conceito);
    //Para evitar c:\\
    if (Length(Diretorio)=3) then
       Diretorio := Diretorio + FormatDateTime('yyyy-mm-dd',DataServidor) + '\'
    else
       Diretorio := Diretorio + '\'+ FormatDateTime('yyyy-mm-dd',DataServidor) + '\';
    CreateDir(Diretorio);
  //-------------GERAR O ARQUIVO ORIGEM.TXT
    LojaSN := CodigoLoja;
    j     := length(LojaSN);
    for i := 1 to j do
      if Copy(LojaSN,i,1) = '-' then
        delete(LojaSN,i,1);
    SemDV := Copy(LojaSN,0,3);
    Origem := Diretorio + 'ORIGEM.TXT';
    AssignFile(Arquivo, Origem);
    ReWrite(Arquivo); { CRIA UM NOVO ARQUIVO }
    try
      Write(Arquivo, LojaSN + '(' +  FormatDateTime('yyymmdd', DataServidor) + ')');
    finally
      CloseFile(Arquivo)
    end;
  //-------------CRIACAO DA ESTRUTURA DA TABELA CLIENTES
    for i := 1 to High(ClientesDbf) do
      ClientesDbf[i] := TStringList.Create;

    ClientesDbf[1].Add('CodigoCli');   ClientesDbf[1].Add('C');   ClientesDbf[1].Add('9');    ClientesDbf[1].Add('0');
    ClientesDbf[2].Add('CliChq');      ClientesDbf[2].Add('C');   ClientesDbf[2].Add('1');    ClientesDbf[2].Add('0');
    ClientesDbf[3].Add('CpfCgc');      ClientesDbf[3].Add('C');   ClientesDbf[3].Add('14');   ClientesDbf[3].Add('0');
    ClientesDbf[4].Add('Nome');        ClientesDbf[4].Add('C');   ClientesDbf[4].Add('40');   ClientesDbf[4].Add('0');
    ClientesDbf[5].Add('DtNasc');      ClientesDbf[5].Add('D');   ClientesDbf[5].Add('8');    ClientesDbf[5].Add('0');
    ClientesDbf[6].Add('Filiacao');    ClientesDbf[6].Add('C');   ClientesDbf[6].Add('50');   ClientesDbf[6].Add('0');
    ClientesDbf[7].Add('NomeMae');     ClientesDbf[7].Add('C');   ClientesDbf[7].Add('50');   ClientesDbf[7].Add('0');
    ClientesDbf[8].Add('NatCidade');   ClientesDbf[8].Add('C');   ClientesDbf[8].Add('20');   ClientesDbf[8].Add('0');
    ClientesDbf[9].Add('NatEstado');   ClientesDbf[9].Add('C');   ClientesDbf[9].Add('2');    ClientesDbf[9].Add('0');
    ClientesDbf[10].Add('Nacional');   ClientesDbf[10].Add('C');  ClientesDbf[10].Add('15');  ClientesDbf[10].Add('0');
    ClientesDbf[11].Add('EstEmissao'); ClientesDbf[11].Add('C');  ClientesDbf[11].Add('2');   ClientesDbf[11].Add('0');
    ClientesDbf[12].Add('Nrident');    ClientesDbf[12].Add('C');  ClientesDbf[12].Add('10');  ClientesDbf[12].Add('0');
    ClientesDbf[13].Add('OrgaoEmis');  ClientesDbf[13].Add('C');  ClientesDbf[13].Add('10');  ClientesDbf[13].Add('0');
    ClientesDbf[14].Add('DataEmis');   ClientesDbf[14].Add('D');  ClientesDbf[14].Add('8');   ClientesDbf[14].Add('0');
    ClientesDbf[15].Add('Endereco');   ClientesDbf[15].Add('C');  ClientesDbf[15].Add('40');  ClientesDbf[15].Add('0');
    ClientesDbf[16].Add('Numero');     ClientesDbf[16].Add('C');  ClientesDbf[16].Add('5');   ClientesDbf[16].Add('0');
    ClientesDbf[17].Add('Complem');    ClientesDbf[17].Add('C');  ClientesDbf[17].Add('10');  ClientesDbf[17].Add('0');
    ClientesDbf[18].Add('Bairro');     ClientesDbf[18].Add('C');  ClientesDbf[18].Add('20');  ClientesDbf[18].Add('0');
    ClientesDbf[19].Add('Cidade');     ClientesDbf[19].Add('C');  ClientesDbf[19].Add('30');  ClientesDbf[19].Add('0');
    ClientesDbf[20].Add('Estado');     ClientesDbf[20].Add('C');  ClientesDbf[20].Add('2');   ClientesDbf[20].Add('0');
    ClientesDbf[21].Add('Cep');        ClientesDbf[21].Add('C');  ClientesDbf[21].Add('8');   ClientesDbf[21].Add('0');
    ClientesDbf[22].Add('DDD');        ClientesDbf[22].Add('C');  ClientesDbf[22].Add('3');   ClientesDbf[22].Add('0');
    ClientesDbf[23].Add('Telefone');   ClientesDbf[23].Add('C');  ClientesDbf[23].Add('8');   ClientesDbf[23].Add('0');
    ClientesDbf[24].Add('Celular');    ClientesDbf[24].Add('C');  ClientesDbf[24].Add('8');   ClientesDbf[24].Add('0');
    ClientesDbf[25].Add('EstCivil');   ClientesDbf[25].Add('C');  ClientesDbf[25].Add('1');   ClientesDbf[25].Add('0');
    ClientesDbf[26].Add('Sexo');       ClientesDbf[26].Add('C');  ClientesDbf[26].Add('8');   ClientesDbf[26].Add('0');
    ClientesDbf[27].Add('Conjuge');    ClientesDbf[27].Add('C');  ClientesDbf[27].Add('40');  ClientesDbf[27].Add('0');
    ClientesDbf[28].Add('Empregador'); ClientesDbf[28].Add('C');  ClientesDbf[28].Add('30');  ClientesDbf[28].Add('0');
    ClientesDbf[29].Add('FoneComl');   ClientesDbf[29].Add('C');  ClientesDbf[29].Add('8');   ClientesDbf[29].Add('0');
    ClientesDbf[30].Add('DtEmpreg');   ClientesDbf[30].Add('D');  ClientesDbf[30].Add('8');   ClientesDbf[30].Add('0');
    ClientesDbf[31].Add('Cargo');      ClientesDbf[31].Add('C');  ClientesDbf[31].Add('30');  ClientesDbf[31].Add('0');
    ClientesDbf[32].Add('RendaMes');   ClientesDbf[32].Add('N');  ClientesDbf[32].Add('10');  ClientesDbf[32].Add('2');
    ClientesDbf[33].Add('EmprConj');   ClientesDbf[33].Add('C');  ClientesDbf[33].Add('20');  ClientesDbf[33].Add('0');
    ClientesDbf[34].Add('CargoConj');  ClientesDbf[34].Add('C');  ClientesDbf[34].Add('20');  ClientesDbf[34].Add('0');
    ClientesDbf[35].Add('Ref1');       ClientesDbf[35].Add('C');  ClientesDbf[35].Add('30');  ClientesDbf[35].Add('0');
    ClientesDbf[36].Add('FoneRef1');   ClientesDbf[36].Add('C');  ClientesDbf[36].Add('15');  ClientesDbf[36].Add('0');
    ClientesDbf[37].Add('Relac1');     ClientesDbf[37].Add('C');  ClientesDbf[37].Add('20');  ClientesDbf[37].Add('0');
    ClientesDbf[38].Add('Ref2');       ClientesDbf[38].Add('C');  ClientesDbf[38].Add('30');  ClientesDbf[38].Add('0');
    ClientesDbf[39].Add('FoneRef2');   ClientesDbf[39].Add('C');  ClientesDbf[39].Add('15');  ClientesDbf[39].Add('0');
    ClientesDbf[40].Add('Relac2');     ClientesDbf[40].Add('C');  ClientesDbf[40].Add('20');  ClientesDbf[40].Add('0');
    ClientesDbf[41].Add('ValMoveis');  ClientesDbf[41].Add('N');  ClientesDbf[41].Add('10');  ClientesDbf[41].Add('2');
    ClientesDbf[42].Add('ValImoveis'); ClientesDbf[42].Add('N');  ClientesDbf[42].Add('10');  ClientesDbf[42].Add('0');
    ClientesDbf[43].Add('Conceito');   ClientesDbf[43].Add('C');  ClientesDbf[43].Add('1');   ClientesDbf[43].Add('0');
    ClientesDbf[44].Add('DtCadas');    ClientesDbf[44].Add('D');  ClientesDbf[44].Add('8');   ClientesDbf[44].Add('0');
    ClientesDbf[45].Add('DtAltera');   ClientesDbf[45].Add('D');  ClientesDbf[45].Add('8');   ClientesDbf[45].Add('0');
    ClientesDbf[46].Add('Autoriz1');   ClientesDbf[46].Add('C');  ClientesDbf[46].Add('30');  ClientesDbf[46].Add('0');
    ClientesDbf[47].Add('Autoriz2');   ClientesDbf[47].Add('C');  ClientesDbf[47].Add('30');  ClientesDbf[47].Add('0');
    ClientesDbf[48].Add('Autoriz3');   ClientesDbf[48].Add('C');  ClientesDbf[48].Add('30');  ClientesDbf[48].Add('0');
    ClientesDbf[49].Add('Consulta');   ClientesDbf[49].Add('D');  ClientesDbf[49].Add('8');   ClientesDbf[49].Add('0');
  //-----------CRIAR TABELA CLIENTES.DBF
    dbfTable := TVKDBFNTX.Create(Self);
    try
      dbfTable.DBFFileName := Diretorio + 'CLIENTES.DBF';

      for i:=1 to High(ClientesDbf) do
        with dbfTable.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          Name := ClientesDbf[i].Strings[0];
          field_type := ClientesDbf[i].Strings[1][1];
          len := StrToInt(Trim(ClientesDbf[i].Strings[2]));
          dec := StrToInt(Trim(ClientesDbf[i].Strings[3]));
        end;
      dbfTable.CreateTable;
  //-----------POPULAR A TABELA CLIENTES.DBF
      if not qryClientes.IsEmpty then
      begin
        dbfTable.AccessMode.AccessMode := 66;    //ReadWrite and Share
        dbfTable.Active := true;
        // if we use Share mode we have to lock table
        dbfTable.FLock;  //lock table from other net users
        //switch on BUFFER
        dbfTable.BeginAddBuffered(qryClientes.RecordCount);
        try
          GuardarRegistroAtual(qryClientes,true);
          qryClientes.First;
          while not qryClientes.Eof do
          begin
            dbfTable.Append;
            dbfTable.FieldByName('CodigoCli').AsString := SemDV + preencheString(qryClientescodigo.AsString,'0',6,False);
            dbfTable.FieldByName('CliChq').AsString    := 'S';  //INFORMAR SEMPRE SIM
            dbfTable.FieldByName('CpfCgc').AsString    := qryClientespessoanumero.AsString;
            dbfTable.FieldByName('Nome').AsString      := qryClientesnome.AsString;
            dbfTable.FieldByName('DtNasc').AsString    := qryClientesnascto.AsString;
            dbfTable.FieldByName('Filiacao').AsString  := qryClientespai.AsString;
            dbfTable.FieldByName('NomeMae').AsString   := qryClientesmae.AsString;
            dbfTable.FieldByName('NatCidade').AsString := qryClientesnaturalcidade.AsString;
            dbfTable.FieldByName('NatEstado').AsString := qryClientesnaturalestado.AsString;
            dbfTable.FieldByName('Nacional').AsString  := qryClientesnacionalidade.AsString;
            dbfTable.FieldByName('EstEmissao').AsString:= qryClientesidestado.AsString;
            dbfTable.FieldByName('NrIdent').AsString   := qryClientesiddocumento.AsString;
            dbfTable.FieldByName('OrgaoEmis').AsString := qryClientesidorgao.AsString;
            dbfTable.FieldByName('DataEmis').AsString  := qryClientesiddata.AsString;
            dbfTable.FieldByName('Endereco').AsString  := qryClientesrua.AsString;
            dbfTable.FieldByName('Numero').AsString    := '';  //CONFIRMAR SE FICARA ASSIM MESMO
            dbfTable.FieldByName('Complem').AsString   := '';  //CONFIRMAR SE FICARA ASSIM MESMO
            dbfTable.FieldByName('Bairro').AsString    := qryClientesbairro.AsString;
            dbfTable.FieldByName('Cidade').AsString    := qryClientescidade.AsString;
            dbfTable.FieldByName('Estado').AsString    := qryClientesestado.AsString;
            dbfTable.FieldByName('Cep').AsString       := qryClientescep.AsString;
            dbfTable.FieldByName('DDD').AsString       := qryClientesfoneddd.AsString;
            dbfTable.FieldByName('Telefone').AsString  := qryClientesfonenumero.AsString;
            dbfTable.FieldByName('Celular').AsString   := qryClientesfone2numero.AsString;
            dbfTable.FieldByName('EstCivil').AsString  := qryClientescivil.AsString;
            dbfTable.FieldByName('Sexo').AsString      := qryClientessexo.AsString;
            dbfTable.FieldByName('Conjuge').AsString   := qryClientesconnome.AsString;
            dbfTable.FieldByName('Empregador').AsString:= qryClientesempresa.AsString;
            dbfTable.FieldByName('FoneComl').AsString  := qryClientesempfonenumero.AsString;
            dbfTable.FieldByName('DtEmpreg').AsString  := qryClientesempadmissao.Asstring;
            dbfTable.FieldByName('Cargo').AsString     := qryClientescargo.AsString;
            dbfTable.FieldByName('RendaMes').AsFloat   := qryClientesemprendavalor.AsFloat;
            dbfTable.FieldByName('EmprConj').AsString  := qryClientesconempresa.AsString;
            dbfTable.FieldByName('CargoConj').AsString := qryClientescargoconjuge.AsString;
            dbfTable.FieldByName('Ref1').AsString      := qryClientesreferencia.AsString;
            dbfTable.FieldByName('FoneRef1').AsString  := qryClientesref1fone.AsString;
            dbfTable.FieldByName('Relac1').AsString    := qryClientesref1tipo.AsString;
            dbfTable.FieldByName('Ref2').AsString      := '';  //NAO EXISTE TAL CAMPO NO TECLUX
            dbfTable.FieldByName('FoneRef2').AsString  := '';  //NAO EXISTE TAL CAMPO NO TECLUX
            dbfTable.FieldByName('Relac2').AsString    := '';  //NAO EXISTE TAL CAMPO NO TECLUX
            dbfTable.FieldByName('ValMoveis').AsFloat  := 0;   //NAO EXISTE TAL CAMPO NO TECLUX
            dbfTable.FieldByName('ValImoveis').AsFloat := 0;   //NAO EXISTE TAL CAMPO NO TECLUX
            dbfTable.FieldByName('Conceito').AsString  := 'S'; //INFORMAR SEMPRE SUSPENSO
            dbfTable.FieldByName('DtCadas').AsString   := qryClientesdatacadastro.AsString;
            dbfTable.FieldByName('DtAltera').AsString  := qryClientesultimaalteracao.AsString;
            dbfTable.FieldByName('Autoriz1').AsString  := '';  //DESATIVADO
            dbfTable.FieldByName('Autoriz2').AsString  := '';  //DESATIVADO
            dbfTable.FieldByName('Autoriz3').AsString  := '';  //DESATIVADO
            dbfTable.FieldByName('Consulta').AsString  := qryClientesultimaconsulta.AsString;
            dbfTable.Post;
            qryClientes.Next;
          end;
        finally
          VoltarRegistroAtual(qryClientes);
          dbfTable.EndAddBuffered;  // close add buffer
          dbfTable.UnLock;          // unlock table for other users
        end;
      end;
    finally
      FreeAndNil(dbfTable);
    end;
  //----------CRIA A ESTRUTURA DA TABELA PARCELAS.DBF
    for i := 1 to High(ParcelasDbf) do
      ParcelasDbf[i] := TStringList.Create;

    ParcelasDbf[1].Add('Contrato');    ParcelasDbf[1].Add('C');  ParcelasDbf[1].Add('9');  ParcelasDbf[1].Add('0');
    ParcelasDbf[2].Add('NrParcela');   ParcelasDbf[2].Add('C');  ParcelasDbf[2].Add('2');  ParcelasDbf[2].Add('0');
    ParcelasDbf[3].Add('DtVenc');      ParcelasDbf[3].Add('D');  ParcelasDbf[3].Add('8');  ParcelasDbf[3].Add('0');
    ParcelasDbf[4].Add('ValParc');     ParcelasDbf[4].Add('N');  ParcelasDbf[4].Add('10'); ParcelasDbf[4].Add('2');
    ParcelasDbf[5].Add('DtPag');       ParcelasDbf[5].Add('D');  ParcelasDbf[5].Add('8');  ParcelasDbf[5].Add('0');
    ParcelasDbf[6].Add('ComPer');      ParcelasDbf[6].Add('N');  ParcelasDbf[6].Add('10'); ParcelasDbf[6].Add('2');
    ParcelasDbf[7].Add('Multa');       ParcelasDbf[7].Add('N');  ParcelasDbf[7].Add('10'); ParcelasDbf[7].Add('2');
    ParcelasDbf[8].Add('ValRec');      ParcelasDbf[8].Add('N');  ParcelasDbf[8].Add('10'); ParcelasDbf[8].Add('2');
    ParcelasDbf[9].Add('FormaPag');    ParcelasDbf[9].Add('C');  ParcelasDbf[9].Add('1');  ParcelasDbf[9].Add('0');
    ParcelasDbf[10].Add('CodigoCli');  ParcelasDbf[10].Add('C'); ParcelasDbf[10].Add('9'); ParcelasDbf[10].Add('0');
    ParcelasDbf[11].Add('CodigoLoj');  ParcelasDbf[11].Add('C'); ParcelasDbf[11].Add('4'); ParcelasDbf[11].Add('0');
    ParcelasDbf[12].Add('PagoLojist'); ParcelasDbf[12].Add('L'); ParcelasDbf[12].Add('1'); ParcelasDbf[12].Add('0');
    ParcelasDbf[13].Add('CodigoRec');  ParcelasDbf[13].Add('C'); ParcelasDbf[13].Add('4'); ParcelasDbf[13].Add('0');
    ParcelasDbf[14].Add('Capital');    ParcelasDbf[14].Add('N'); ParcelasDbf[14].Add('10'); ParcelasDbf[14].Add('2');
    ParcelasDbf[15].Add('Alterada');   ParcelasDbf[15].Add('D'); ParcelasDbf[15].Add('8'); ParcelasDbf[15].Add('0');
    //-----------CRIAÇÃO DA TABELA PARCELAS.DBF
    dbfTable := TVKDBFNTX.Create(Self);
    try
      dbfTable.DBFFileName := Diretorio + 'PARCELAS.DBF';

      for i:=1 to High(ParcelasDbf) do
        with dbfTable.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          Name := ParcelasDbf[i].Strings[0];
          field_type := ParcelasDbf[i].Strings[1][1];
          len := StrToInt(Trim(ParcelasDbf[i].Strings[2]));
          dec := StrToInt(Trim(ParcelasDbf[i].Strings[3]));
        end;
      dbfTable.CreateTable;
  //-----------POPULAR A TABELA PARCELAS.DBF
      if not qryContratosParcelas.IsEmpty then
      begin
        dbfTable.AccessMode.AccessMode := 66;    //ReadWrite and Share
        dbfTable.Active := true;
        // if we use Share mode we have to lock table
        dbfTable.FLock;  //lock table from other net users
        //switch on BUFFER
        dbfTable.BeginAddBuffered(qryContratosParcelas.RecordCount);
        try
          GuardarRegistroAtual(qryContratosParcelas,true);
          qryContratosParcelas.First;
          while not qryContratosParcelas.Eof do
          begin
            dbfTable.Append;
            dbfTable.FieldByName('Contrato').AsString   := SemDV + preencheString(qryContratosParcelascontrato.AsString,'0',6,False);
            if qryContratosParcelasparcela.AsInteger < 10 then
              dbfTable.FieldByName('NrParcela').AsString  := '0' + qryContratosParcelasparcela.AsString
            else
              dbfTable.FieldByName('NrParcela').AsString  := qryContratosParcelasparcela.AsString;
            dbfTable.FieldByName('DtVenc').AsString     := qryContratosParcelasdatavencto.AsString;
            dbfTable.FieldByName('ValParc').AsFloat     := qryContratosParcelasvalorvencto.AsFloat;
            dbfTable.FieldByName('DtPag').AsString      := qryContratosParcelasdatapagto.AsString;
            dbfTable.FieldByName('ComPer').AsFloat      := qryContratosParcelasmora.AsFloat;
            dbfTable.FieldByName('Multa').AsFloat       := 0;  //NAO EXISTE TAL CAMPO NO TECLUX
            dbfTable.FieldByName('ValRec').AsFloat      := qryContratosParcelasvalorpagto.AsFloat;
            dbfTable.FieldByName('FormaPag').AsString   := qryContratosParcelasformapagamento.AsString; //VERIFICAR SE O CAIXA OBEDECE A REGRA
            dbfTable.FieldByName('CodigoCli').AsString  := SemDV + preencheString(qryContratosParcelascliente.AsString,'0',6,False);
            dbfTable.FieldByName('CodigoLoj').AsString  := LojaSN;
            dbfTable.FieldByName('PagoLojist').AsBoolean:= False;  //INFORMAR SEMPRE FALSE
            if qryContratosParcelasvalorpagto.AsFloat > 0 then
              dbfTable.FieldByName('CodigoRec').AsString  := LojaSN
            else
              dbfTable.FieldByName('CodigoRec').AsString  := '';
            dbfTable.FieldByName('Capital').AsFloat     := qryContratosParcelasvalorpagto.AsFloat;
            dbfTable.FieldByName('Alterada').AsString   := qryContratosParcelasdatapagto.AsString;
            dbfTable.Post;
            qryContratosParcelas.Next;
          end;
        finally
          VoltarRegistroAtual(qryContratosParcelas);
          dbfTable.EndAddBuffered;  // close add buffer
          dbfTable.UnLock;          // unlock table for other users
        end;
      end;
    finally
      FreeAndNil(dbfTable);
    end;

  //----------CRIA A ESTRUTURA DA TABELA VENDAS.DBF
    for i := 1 to High(VendasDbf) do
      VendasDbf[i] := TStringList.Create;

    VendasDbf[1].Add('CodigoCli');   VendasDbf[1].Add('C');  VendasDbf[1].Add('9');   VendasDbf[1].Add('0');
    VendasDbf[2].Add('Nome');        VendasDbf[2].Add('C');  VendasDbf[2].Add('20');  VendasDbf[2].Add('0');
    VendasDbf[3].Add('CodigoLoj');   VendasDbf[3].Add('C');  VendasDbf[3].Add('4');   VendasDbf[3].Add('0');
    VendasDbf[4].Add('DtVenda');     VendasDbf[4].Add('D');  VendasDbf[4].Add('8');   VendasDbf[4].Add('0');
    VendasDbf[5].Add('ValVenda');    VendasDbf[5].Add('N');  VendasDbf[5].Add('10');  VendasDbf[5].Add('2');
    VendasDbf[6].Add('ValTotal');    VendasDbf[6].Add('N');  VendasDbf[6].Add('10');  VendasDbf[6].Add('2');
    VendasDbf[7].Add('PlanoPag');    VendasDbf[7].Add('C');  VendasDbf[7].Add('3');   VendasDbf[7].Add('0');
    VendasDbf[8].Add('Contrato');    VendasDbf[8].Add('C');  VendasDbf[8].Add('9');   VendasDbf[8].Add('0');
    VendasDbf[9].Add('Modalidade');  VendasDbf[9].Add('C');  VendasDbf[9].Add('1');   VendasDbf[9].Add('0');
    VendasDbf[10].Add('Autorizado'); VendasDbf[10].Add('C'); VendasDbf[10].Add('6');  VendasDbf[10].Add('0');
    VendasDbf[11].Add('Ocorrencia'); VendasDbf[11].Add('C'); VendasDbf[11].Add('6');  VendasDbf[11].Add('0');
    VendasDbf[12].Add('Excluida');   VendasDbf[12].Add('D'); VendasDbf[12].Add('8');  VendasDbf[12].Add('0');
    VendasDbf[13].Add('Liquidada');  VendasDbf[13].Add('L'); VendasDbf[13].Add('1');  VendasDbf[13].Add('0');
    VendasDbf[14].Add('Alterada');   VendasDbf[14].Add('D'); VendasDbf[14].Add('8');  VendasDbf[14].Add('0');
    VendasDbf[15].Add('Status');     VendasDbf[15].Add('C'); VendasDbf[15].Add('1');  VendasDbf[15].Add('0');
  //-----------CRIAÇÃO DA TABELA VENDAS.DBF
    dbfTable := TVKDBFNTX.Create(Self);
    try
      dbfTable.DBFFileName := Diretorio + 'VENDAS.DBF';

      for i:=1 to High(VendasDbf) do
        with dbfTable.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          Name := VendasDbf[i].Strings[0];
          field_type := VendasDbf[i].Strings[1][1];
          len := StrToInt(Trim(VendasDbf[i].Strings[2]));
          dec := StrToInt(Trim(VendasDbf[i].Strings[3]));
        end;
      dbfTable.CreateTable;
  //-----------POPULAR A TABELA VENDAS.DBF
      if not qryVendas.IsEmpty then
      begin
        dbfTable.AccessMode.AccessMode := 66;    //ReadWrite and Share
        dbfTable.Active := true;
        // if we use Share mode we have to lock table
        dbfTable.FLock;  //lock table from other net users
        //switch on BUFFER
        dbfTable.BeginAddBuffered(qryVendas.RecordCount);
        try
          GuardarRegistroAtual(qryVendas,true);
          qryVendas.First;
          while not qryVendas.Eof do
          begin
            dbfTable.Append;
            dbfTable.FieldByName('CodigoCli').AsString  := SemDV + preencheString(qryVendascliente.AsString,'0',6,False);
            dbfTable.FieldByName('Nome').AsString       := qryVendasnome.AsString;
            dbfTable.FieldByName('CodigoLoj').AsString  := LojaSN;
            dbfTable.FieldByName('DtVenda').AsString    := qryVendasfaturamento.AsString;
            dbfTable.FieldByName('ValVenda').AsFloat    := qryVendasvalorvista.AsFloat;
            dbfTable.FieldByName('ValTotal').AsFloat    := qryVendasvalorprazo.AsFloat;
            dbfTable.FieldByName('PlanoPag').AsString   := preencheString(qryVendasplano.AsString, '0', 3, False);
            dbfTable.FieldByName('Contrato').AsString   := SemDV + preencheString(qryVendascontrato.AsString,'0',6,False);
            dbfTable.FieldByName('Modalidade').AsString := Copy(qryVendasmodalidade.AsString,1,1); //1=CARNE 2=CHEQUE
            dbfTable.FieldByName('Autorizado').AsString := qryVendasvendedor.AsString;
            dbfTable.FieldByName('Ocorrencia').AsString := '';  //DEIXAR EM BRANCO
            dbfTable.FieldByName('Excluida').AsString   := qryVendascan_data.AsString;  //DATA DO CANCELAMENTO
            dbfTable.FieldByName('Liquidada').AsBoolean := False;  //SEMPRE FALSE
            dbfTable.FieldByName('Alterada').AsString   := qryVendasfaturamento.AsString;  //DATA DO FATURAMENTO
            dbfTable.FieldByName('Status').AsString     := '1'; //INFORMAR SEMPRE 1
            dbfTable.Post;
            qryVendas.Next;
          end;
        finally
          VoltarRegistroAtual(qryVendas);
          dbfTable.EndAddBuffered;  // close add buffer
          dbfTable.UnLock;          // unlock table for other users
        end;
      end;
    finally
      FreeAndNil(dbfTable);
    end;
  //----------CRIA A ESTRUTURA DA TABELA OBSERVA.DBF
    for i := 1 to High(ObservaDbf) do
      ObservaDbf[i] := TStringList.Create;

    ObservaDbf[1].Add('CodigoCli'); ObservaDbf[1].Add('C');  ObservaDbf[1].Add('9');   ObservaDbf[1].Add('0');
    ObservaDbf[2].Add('DataObs');   ObservaDbf[2].Add('D');  ObservaDbf[2].Add('8');   ObservaDbf[2].Add('0');
    ObservaDbf[3].Add('Descricao'); ObservaDbf[3].Add('C');  ObservaDbf[3].Add('40');  ObservaDbf[3].Add('0');
    ObservaDbf[4].Add('Chave');     ObservaDbf[4].Add('C');  ObservaDbf[4].Add('6');   ObservaDbf[4].Add('0');
    ObservaDbf[5].Add('Alterada');  ObservaDbf[5].Add('D');  ObservaDbf[5].Add('8');   ObservaDbf[5].Add('0');
  //-----------CRIAÇÃO DA TABELA OBSERVA.DBF
    dbfTable := TVKDBFNTX.Create(Self);
    try
      dbfTable.DBFFileName := Diretorio + 'OBSERVA.DBF';

      for i:=1 to High(ObservaDbf) do
        with dbfTable.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          Name := ObservaDbf[i].Strings[0];
          field_type := ObservaDbf[i].Strings[1][1];
          len := StrToInt(Trim(ObservaDbf[i].Strings[2]));
          dec := StrToInt(Trim(ObservaDbf[i].Strings[3]));
        end;
      dbfTable.CreateTable;
  {
  //-----------POPULAR A TABELA OBSERVA.DBF
      dbfTable.AccessMode.AccessMode := 66;    //ReadWrite and Share
      dbfTable.Active := true;
      // if we use Share mode we have to lock table
      dbfTable.FLock;  //lock table from other net users
      //switch on BUFFER
      dbfTable.BeginAddBuffered(qry.RecordCount);
      try
        GuardarRegistroAtual(qry,true);
        qry.First;
        while not qry.Eof do
        begin
          dbfTable.Append;
          dbfTable.FieldByName('CodigoCli').AsString  := SemDV + preencheString(CodigoCli.AsString ,'0',6,False);
          dbfTable.FieldByName('DataObs').AsString    := '';
          dbfTable.FieldByName('Descricao').AsString  := '';
          dbfTable.FieldByName('Chave').AsString      := '';
          dbfTable.FieldByName('Alterada').AsString   := '';
          dbfTable.Post;
          qry.Next;
        end;
      finally
        VoltarRegistroAtual(qry);
        dbfTable.EndAddBuffered;  // close add buffer
        dbfTable.UnLock;          // unlock table for other users
      end;}
    finally
      FreeAndNil(dbfTable);
    end;
  //----------CRIA A ESTRUTURA DA TABELA AUTORIZA.DBF
    for i := 1 to High(AutorizaDbf) do
      AutorizaDbf[i] := TStringList.Create;

    AutorizaDbf[1].Add('CodigoCli');  AutorizaDbf[1].Add('C');  AutorizaDbf[1].Add('9');   AutorizaDbf[1].Add('0');
    AutorizaDbf[2].Add('DtInclu');    AutorizaDbf[2].Add('D');  AutorizaDbf[2].Add('8');   AutorizaDbf[2].Add('0');
    AutorizaDbf[3].Add('DtAltera');   AutorizaDbf[3].Add('D');  AutorizaDbf[3].Add('8');   AutorizaDbf[3].Add('0');
    AutorizaDbf[4].Add('Autorizado'); AutorizaDbf[4].Add('C');  AutorizaDbf[4].Add('40');  AutorizaDbf[4].Add('0');
    AutorizaDbf[5].Add('RgAutoriz');  AutorizaDbf[5].Add('C');  AutorizaDbf[5].Add('15');  AutorizaDbf[5].Add('0');
    AutorizaDbf[6].Add('CpfAutoriz'); AutorizaDbf[6].Add('C');  AutorizaDbf[6].Add('11');  AutorizaDbf[6].Add('0');
    AutorizaDbf[7].Add('Validade');   AutorizaDbf[7].Add('D');  AutorizaDbf[7].Add('8');   AutorizaDbf[7].Add('0');
    AutorizaDbf[8].Add('CodigoLoj');  AutorizaDbf[8].Add('C');  AutorizaDbf[8].Add('4');   AutorizaDbf[8].Add('0');
    AutorizaDbf[9].Add('ChaveUsu');   AutorizaDbf[9].Add('C');  AutorizaDbf[9].Add('6');   AutorizaDbf[9].Add('0');
    AutorizaDbf[10].Add('Recebida');  AutorizaDbf[10].Add('C'); AutorizaDbf[10].Add('1');  AutorizaDbf[10].Add('0');
    AutorizaDbf[11].Add('Marca');     AutorizaDbf[11].Add('C'); AutorizaDbf[11].Add('1');  AutorizaDbf[11].Add('0');
  //-----------CRIAÇÃO DA TABELA AUTORIZA.DBF
    dbfTable := TVKDBFNTX.Create(Self);
    try
      dbfTable.DBFFileName := Diretorio + 'AUTORIZA.DBF';

      for i:=1 to High(AutorizaDbf) do
        with dbfTable.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          Name := AutorizaDbf[i].Strings[0];
          field_type := AutorizaDbf[i].Strings[1][1];
          len := StrToInt(Trim(AutorizaDbf[i].Strings[2]));
          dec := StrToInt(Trim(AutorizaDbf[i].Strings[3]));
        end;
      dbfTable.CreateTable;
  {
  //-----------POPULAR A TABELA AUTORIZA.DBF
      dbfTable.AccessMode.AccessMode := 66;    //ReadWrite and Share
      dbfTable.Active := true;
      // if we use Share mode we have to lock table
      dbfTable.FLock;  //lock table from other net users
      //switch on BUFFER
      dbfTable.BeginAddBuffered(qry.RecordCount);
      try
        GuardarRegistroAtual(qry,true);
        qry.First;
        while not qry.Eof do
        begin
          dbfTable.Append;
          dbfTable.FieldByName('CodigoCli').AsString  := SemDV + preencheString(CodigoCli.AsString,'0',6,False);
          dbfTable.FieldByName('DtInclu').AsString    := '';
          dbfTable.FieldByName('DtAltera').AsString   := '';
          dbfTable.FieldByName('Autorizado').AsString := '';
          dbfTable.FieldByName('RgAutoriz').AsString  := '';
          dbfTable.FieldByName('CpfAutoriz').AsString  := '';
          dbfTable.FieldByName('Validade').AsString  := '';
          dbfTable.FieldByName('CodigoLoj').AsString  := '';
          dbfTable.FieldByName('ChaveUsu').AsString  := '';
          dbfTable.FieldByName('Recebida').AsString  := '';
          dbfTable.FieldByName('Marca').AsString  := '';
          dbfTable.Post;
          qry.Next;
        end;
      finally
        VoltarRegistroAtual(qry);
        dbfTable.EndAddBuffered;  // close add buffer
        dbfTable.UnLock;          // unlock table for other users
      end;}
    finally
      FreeAndNil(dbfTable);
    end;
  //-------------FAZER A COMPACTACAO DOS ARQUIVOS PRESENTES NO DIRETÓRIO ESPECIFICADO
    DateTimeToString(HoraCerta,'hhnn', DataHoraLocal); {Formata o horario e guarda na var HoraCerta}
  {$IFDEF MSWINDOWS}
    Result := CreateProcessSimple('cmd.exe /c arj a "' +  Diretorio + 'A' + SemDV + HoraCerta + '.ARJ" "' + Diretorio + '*.*"');
    if FileExists(Diretorio + 'A' + SemDV + HoraCerta + '.ARJ') then
      MensagemAviso('O arquivo ' + Diretorio + 'A' + SemDV + HoraCerta + '.ARJ foi gerado com sucesso.')
    else
      MensagemAviso('Ocorreu um problema durante a geração do arquivo '+ Diretorio + 'A' + SemDV + HoraCerta + '.ARJ.' + #13#10 +
                    'Por favor tente novamente.');
  {$ENDIF}
  end
  else
    Result := False;
end;

procedure TdtmGerarRemessasSoacred.FecharTabelas;
begin
  qryContratosParcelas.Close;
  qryClientes.Close;
  qryVendas.Close;
end;

function TdtmGerarRemessasSoacred.MontarData(Campo, DataInicial, DataFinal: String): String;
var
  Data_1, Data_2: String;
begin
  Data_1:= 'or (' + Campo + ' = ';
  Data_2:= 'or (' + Campo + ' between (';
  if not DataEmBranco(DataInicial) then begin
    if DataEmBranco(DataFinal) then
         Result:= Data_1 + QuotedStr(DataInicial) + ')'
    else Result:= Data_2 + QuotedStr(DataInicial) + ') and (' + QuotedStr(DataFinal) + '))';
  end
  else begin
    if not DataEmBranco(DataFinal) then
         Result:= Data_1 + QuotedStr(DataFinal) + ')'
    else Result:= '';
  end;
end;

procedure TdtmGerarRemessasSoacred.SalvarSoacredIni(Diretorio, Loja, Agente, Conceito:String);
var
  ArquivoCFG: TIniFile;
begin
  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
      ArquivoCFG.WriteString(SoacredSection, 'loja', Loja);
      ArquivoCFG.WriteString(SoacredSection, 'dir' , Diretorio);
      if Agente <> '' then
        ArquivoCFG.WriteString(SoacredSection, 'agente', Agente);
      if Conceito <> '' then
        ArquivoCFG.WriteString(SoacredSection, 'conceito', Conceito);
    finally
      ArquivoCFG.UpdateFile;
      ArquivoCFG.Free;
    end;
  end;
end;


function TdtmGerarRemessasSoacred.GetTabelaClientesVazia: Boolean;
begin
  Result := qryClientes.IsEmpty;
end;

function TdtmGerarRemessasSoacred.GetTabelaVendasVazia: Boolean;
begin
  Result := qryVendas.IsEmpty;
end;

function TdtmGerarRemessasSoacred.CheckRequiredFieldsVendas: Boolean;
var
  pos : TBookmark;
begin
  Result := True;
  pos := qryVendas.GetBookmark;
  qryVendas.DisableControls;
  qryVendas.First;
  while not qryVendas.Eof do
  begin
    if qryVendas.CheckRequiredFields then
      qryVendas.Next
    else
    begin
      Result := False;
      Break;
    end;
  end;
  if Result then
    qryVendas.GotoBookmark(pos);
  qryVendas.FreeBookmark(pos);
  qryVendas.EnableControls;
end;

procedure TdtmGerarRemessasSoacred.qryVendasBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

end.
