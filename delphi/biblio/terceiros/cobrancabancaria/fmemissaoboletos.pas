unit fmemissaoboletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gbCobranca, ZTransact, ZPgSqlTr, cptransact, ZConnect, ctconstantes,
  ZPgSqlCon, cpdatabase, IniFiles, DB, ZQuery, ZPgSqlQuery, cpquery,StdCtrls;

type
  TfrmImpressaoBoletoCodigoBarras = class(TForm)
    dbaTecSoft: TtecDatabase;
    tstTecSoft: TtecTransact;
    qryParcelas: TtecQuery;
    qryParcelascarteira: TStringField;
    qryParcelascedente_codigocedente: TStringField;
    qryParcelascedente_contabancaria_banco_codigo: TIntegerField;
    qryParcelascedente_contabancaria_digitoconta: TStringField;
    qryParcelascedente_contabancaria_numeroconta: TIntegerField;
    qryParcelascedente_endereco_bairro: TStringField;
    qryParcelascedente_endereco_cidade: TStringField;
    qryParcelascedente_endereco_estado: TStringField;
    qryParcelascedente_endereco_rua: TStringField;
    qryParcelascedente_nome: TStringField;
    qryParcelascedente_numerocpfcgc: TStringField;
    qryParcelasDataDesconto: TDateField;
    qryParcelasdatavencto: TDateField;
    qryParcelasdatadocumento: TDateField;
    qryParcelasDataMoraJuros: TDateField;
    qryParcelasdiasatraso1: TStringField;
    qryParcelaslocalpagamento: TStringField;
    qryParcelasnotafiscal: TIntegerField;
    qryParcelasqtnotafiscais: TLargeintField;
    qryParcelascontrato: TStringField;
    qryParcelasNumeroDocumento: TStringField;
    qryParcelassacado_endereco_bairro: TStringField;
    qryParcelassacado_endereco_cidade: TStringField;
    qryParcelassacado_endereco_estado: TStringField;
    qryParcelassacado_endereco_rua: TStringField;
    qryParcelassacado_nome: TStringField;
    qryParcelaspessoatipo: TStringField;
    qryParcelassacado_numerocpfcgc: TStringField;
    qryParcelasseunumero: TMemoField;
    qryParcelasvalordocumento: TFloatField;
    qryParcelascedente_contabancaria_codigoagencia: TIntegerField;
    qryParcelasinstrucoes: TStringField;
    qryParcelasnossonumero: TStringField;
    qryParcelaspercentualdesconto: TFloatField;
    qryParcelasValorDesconto: TCurrencyField;
    qryParcelaspercentualmorajuros: TFloatField;
    qryParcelasValorMoraJuros: TCurrencyField;
    qryParcelascedente_endereco_cep: TStringField;
    qryParcelassacado_endereco_cep: TStringField;
    qryParcelasusodobanco: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelascedente_endereco_numero: TIntegerField;
    qryParcelascedente_endereco_complemento: TStringField;
    qryParcelassacado_endereco_numero: TIntegerField;
    qryParcelassacado_endereco_complemento: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure qryParcelasCalcFields(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FListaContratos: String;
    ListaImprimir  : vString;
  private
    { Private declarations }
    function LerArquivoCFG: Boolean;
    Procedure AbrirParcelas;
    procedure ObterDados;
  public
    { Public declarations }
  end;

var
  frmImpressaoBoletoCodigoBarras: TfrmImpressaoBoletoCodigoBarras;
  ListaContratos: String;
  ListaParcelas: String;

implementation

{$R *.dfm}

procedure TfrmImpressaoBoletoCodigoBarras.AbrirParcelas;
const
  SQLParcelas= '(p.numero in (%s)) and';
var
 a,i,v: Integer;
 aux, parcela: String;
begin
  qryParcelas.Close;
  qryparcelas.Params[0].AsString := ListaContratos;
  qryParcelas.MacroByName('ListadeParcelas').AsString:= format(SQLParcelas,[Listaparcelas]);
  qryparcelas.Open;
end;

procedure TfrmImpressaoBoletoCodigoBarras.FormCreate(Sender: TObject);
var
 a: Integer;
begin
  //ListaParcelas:= '2,5,9,10,11,12,16';
  LerArquivoCFG;
  AbrirParcelas;
  if not qryParcelas.IsEmpty then
    begin
      for a:=0 to length(ListaImprimir)-1 do
      begin
         if qryParcelas.Locate('numero',ListaImprimir[a],[]) then
         begin
           ObterDados;
           boleto.Imprimir;
//           boleto.visualizar;
           //qryparcelas.Next;
         end;
      end;
    end
  else
    ShowMessage('Dados não encontrados');

  Application.Terminate;

end;

function TfrmImpressaoBoletoCodigoBarras.LerArquivoCFG: Boolean;
var
 ArquivoCFG: TIniFile;
 login, senha: String;
 i,v: Integer;
begin
  v:=0;
  if ParamCount > 0 then
  begin
    login          := ParamStr(1);
    senha          := ParamStr(2);
    ListaContratos := ParamStr(3);
    for i:= 4 to ParamCount do
    begin
      if i = 4 then
        ListaParcelas:= ParamStr(i)
      else
        ListaParcelas:= ListaParcelas+','+ParamStr(i);
      SetLength(ListaImprimir,(ParamCount - 3));
      ListaImprimir[v]:= ParamStr(i);
      inc(v);
    end;
  end;
{
  ShowMessage('p0:'+ ParamStr(0)+chr(13)+
              'login:'+ ParamStr(1)+chr(13)+
              'senha:'+ ParamStr(2)+chr(13)+
              'listacontratos:'+ ParamStr(3)+chr(13));

  ShowMessage('parcelas:'+ ListaParcelas);
}
  NomeArquivoCFG := ExtractFilePath(Application.ExeName)+ ctNomeArquivoCFG;
  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG          := TIniFile.Create(NomeArquivoCFG);
    dbaTecSoft.Host     := ArquivoCFG.ReadString(LoginSection, 'Host', '');
    dbaTecSoft.Database := ArquivoCFG.ReadString(LoginSection, 'Banco', '');
    dbaTecSoft.Login    := login;
    dbaTecSoft.Password := senha;
    dbaTecSoft.Connect;
  end;

end;

procedure TfrmImpressaoBoletoCodigoBarras.ObterDados;
begin
{  with FreeBoleto1 do
  begin
    LimparTudo;

    with Cedente do
    begin
      Nome          := qryParcelascedente_nome.AsString;
      CodigoBanco   := qryParcelascedente_contabancaria_banco_codigo.AsString;
      Agencia       := qryParcelascedente_contabancaria_codigoagencia.AsString;
      CodigoCedente := qryParcelascedente_codigocedente.AsString;
      ContaCorrente := qryParcelascedente_contabancaria_numeroconta.AsString;
      if qryParcelascedente_contabancaria_digitoconta.AsString <> '' then
        DigitoContaCorrente := qryParcelascedente_contabancaria_digitoconta.AsString[1];
    end;

    with Sacado do
    begin
      Nome     := qryParcelassacado_nome.AsString;
      Endereco := qryParcelassacado_endereco_rua.AsString;
      Bairro   := qryParcelassacado_endereco_bairro.AsString;
      Cidade   := qryParcelassacado_endereco_cidade.AsString;
      Estado   := qryParcelassacado_endereco_estado.AsString;
      Cep      := qryParcelassacado_endereco_cep.AsString;
      CNPJ_CPF := qryParcelascedente_numerocpfcgc.AsString;
      if qryParcelaspessoatipo.AsString <> 'F' then
        Pessoa := pFisica
      else
        Pessoa := pJuridica;
    end;

    Vencimento     := qryParcelasdatavencto.AsDateTime;
    Moeda          := '9';
    Valor          := qryParcelasvalordocumento.AsFloat;
    NossoNumero    := qryParcelasnossonumero.AsString;
    LocalPagamento := qryParcelaslocalpagamento.AsString;
    DataDocumento  := qryParcelasdatadocumento.AsDateTime;
    Documento      := qryParcelasNumeroDocumento.AsString;
    Especie        := 'R$';
    EspecieDoc     := 'DM';
    Carteira       := qryParcelascarteira.AsString;
    UsoDoBanco     := qryParcelasusodobanco.AsString;
    Instrucoes.Add(qryParcelasinstrucoes.AsString);

    Preparar;
  end;
}
  with boleto do
  begin
    LogoBanco         := lbLogoMarca;
    CorLogo           := clCOR;
    
    Carteira          := qryParcelascarteira.AsString;
    TecUsodoBanco     := qryParcelasusodobanco.AsString;
    TecEspecieDocumento := 'DM';
    with Cedente do
    begin
      CodigoCedente   := qryParcelascedente_codigocedente.AsString;
      with ContaBancaria do
      begin
        Banco.Codigo  := qryParcelascedente_contabancaria_banco_codigo.AsString;
        CodigoAgencia := qryParcelascedente_contabancaria_codigoagencia.AsString;
        DigitoConta   := qryParcelascedente_contabancaria_digitoconta.AsString;
        NumeroConta   := qryParcelascedente_contabancaria_numeroconta.AsString;
      end;

      with Endereco do
      begin
        Bairro := qryParcelascedente_endereco_bairro.AsString;
        CEP    := qryParcelascedente_endereco_cep.AsString;
        Cidade := qryParcelascedente_endereco_cidade.AsString;
        Estado := qryParcelascedente_endereco_estado.AsString;
        Rua    := qryParcelascedente_endereco_rua.AsString;
        Numero := qryParcelascedente_endereco_numero.AsString;
        Complemento := qryParcelascedente_endereco_complemento.AsString;
      end;

      Nome         := qryParcelascedente_nome.AsString;
      NumeroCPFCGC := qryParcelascedente_numerocpfcgc.AsString;
    end;
    DataDesconto   := qryParcelasDataDesconto.AsDateTime;
    DataDocumento  := qryParcelasdatadocumento.AsDateTime;
    DataMoraJuros  := qryParcelasDataMoraJuros.AsDateTime;
    DataProcessamento := Date;
    DataVencimento := qryParcelasdatavencto.AsDateTime;
    instrucoes.Clear;
    Instrucoes.Add(qryParcelasinstrucoes.AsString);
    NossoNumero    := qryParcelasnossonumero.AsString;
    NumeroDocumento:= qryParcelasNumeroDocumento.AsString;
    LocalPagamento := qryParcelaslocalpagamento.AsString;
    with Sacado do
    begin
      with Endereco do
      begin
        Bairro := qryParcelassacado_endereco_bairro.AsString;
        CEP    := qryParcelassacado_endereco_cep.AsString;
        Cidade := qryParcelassacado_endereco_cidade.AsString;
        Estado := qryParcelassacado_endereco_estado.AsString;
        Rua    := qryParcelassacado_endereco_rua.AsString;
        Numero := qryParcelassacado_endereco_numero.AsString;
        Complemento := qryParcelassacado_endereco_complemento.AsString;
      end;
      Nome         := qryParcelassacado_nome.AsString;
      NumeroCPFCGC := qryParcelassacado_numerocpfcgc.AsString;
      if qryParcelaspessoatipo.AsString = 'F' then
        TipoInscricao := tiPessoaFisica
      else
      if qryParcelaspessoatipo.AsString = 'J' then
        TipoInscricao := tiPessoaJuridica
      else
        TipoInscricao := tiOutro;
    end;

    SeuNumero := qryParcelasseunumero.AsString;
    ValorDesconto := qryParcelasvalordesconto.AsCurrency;
    ValorDocumento := qryParcelasvalordocumento.AsCurrency;
    ValorMoraJuros := qryParcelasvalormorajuros.AsCurrency;
  end;
end;

procedure TfrmImpressaoBoletoCodigoBarras.qryParcelasCalcFields(
  DataSet: TDataSet);
begin
  if qryParcelaspercentualdesconto.Ascurrency<>0 then
  begin
    qryParcelasValorDesconto.AsCurrency := ((qryParcelasvalordocumento.AsCurrency *
                                             qryParcelaspercentualdesconto.Ascurrency)/100)/30;
    qryParcelasDataDesconto.AsDateTime := qryParcelasdatavencto.AsDateTime - 1;
  end
  else
  begin
    qryParcelasValorDesconto.AsCurrency := 0.00;
    qryParcelasDataDesconto.Clear;
  end;

  if qryParcelaspercentualmorajuros.AsCurrency<>0 then
  begin
    if qryParcelasdiasatraso1.AsString<>'' then
      qryParcelasDataMoraJuros.AsDateTime := qryParcelasdatavencto.AsDateTime + strtoint(qryParcelasdiasatraso1.AsString)
    else
      qryParcelasDataMoraJuros.AsDateTime := qryParcelasdatavencto.AsDateTime + 1;
    qryParcelasValorMoraJuros.AsCurrency := ((qryParcelasvalordocumento.AsCurrency *
                                             qryParcelaspercentualmorajuros.Ascurrency)/100)/30
  end
  else
  begin
    qryParcelasDataMoraJuros.Clear;
    qryParcelasValorMoraJuros.AsCurrency := 0.00;
  end;

  case qryParcelasqtnotafiscais.AsInteger of
    0: qryParcelasNumeroDocumento.AsString := 'CT '+qryParcelascontrato.AsString;
    1: qryParcelasNumeroDocumento.AsString := 'NF '+qryParcelasnotafiscal.AsString;
  else
    qryParcelasNumeroDocumento.AsString := 'NF '+qryParcelasnotafiscal.AsString + 'e outras';
  end;
  
end;

procedure TfrmImpressaoBoletoCodigoBarras.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\Monitor.sql') then
    Listar.loadfromfile('c:\Monitor.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\Monitor.sql');
  listar.free;
end;

end.
