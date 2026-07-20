unit fmemissaoboletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gbCobranca, ZTransact, ZPgSqlTr, cptransact, ZConnect, ctconstantes,
  ZPgSqlCon, cpdatabase, IniFiles, DB, ZQuery, ZPgSqlQuery, cpquery,StdCtrls;

type
  TfrmImpressaoBoletoCodigoBarras = class(TForm)
    boleto: TgbTitulo;
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
    procedure FormCreate(Sender: TObject);
    procedure qryParcelasCalcFields(DataSet: TDataSet);
  private
    FListaContratos: String;
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

implementation

{$R *.dfm}

procedure TfrmImpressaoBoletoCodigoBarras.AbrirParcelas;
begin
  qryParcelas.Close;
  qryparcelas.Params[0].AsString := ListaContratos;
  qryparcelas.Open;
end;

procedure TfrmImpressaoBoletoCodigoBarras.FormCreate(Sender: TObject);
begin
  LerArquivoCFG;
  AbrirParcelas;
  if qryParcelas.RecordCount <> 0 then
  begin

    if qryparcelas.RecordCount = 1 then
    begin
     ObterDados;
     boleto.Imprimir;
     //boleto.Visualizar;
    end
    else
    begin
      qryParcelas.First;
      while not qryparcelas.Eof do
      begin
        ObterDados;
        boleto.Imprimir;
       //boleto.visualizar;
        qryparcelas.Next;
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
begin
  NomeArquivoCFG := ExtractFilePath(Application.ExeName)+ ctNomeArquivoCFG;
  if ParamCount > 0 then
  begin
    login          := ParamStr(1);
    senha          := ParamStr(2);
    ListaContratos := ParamStr(3);
  end;

  {
  ShowMessage('p0:'+ ParamStr(0)+chr(13)+
              'p1:'+ ParamStr(1)+chr(13)+
              'p2:'+ ParamStr(2)+chr(13)+
              'p3:'+ ParamStr(3)+chr(13)+
  }

  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    dbaTecSoft.Host   := ArquivoCFG.ReadString(LoginSection, 'Host', '');
    dbaTecSoft.Database  := ArquivoCFG.ReadString(LoginSection, 'Banco', '');
    dbaTecSoft.Login  := login;
    dbaTecSoft.Password  := senha;
    dbaTecSoft.Connect;
  end

end;

procedure TfrmImpressaoBoletoCodigoBarras.ObterDados;
begin
  with boleto do
  begin
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
        bairro := qryParcelascedente_endereco_bairro.AsString;
        cep    := qryParcelascedente_endereco_cep.AsString;
        cidade := qryParcelascedente_endereco_cidade.AsString;
        estado := qryParcelascedente_endereco_estado.AsString;
        rua    := qryParcelascedente_endereco_rua.AsString;
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
        bairro := qryParcelassacado_endereco_bairro.AsString;
        cep    := qryParcelassacado_endereco_cep.AsString;
        cidade := qryParcelassacado_endereco_cidade.AsString;
        estado := qryParcelassacado_endereco_estado.AsString;
        rua    := qryParcelassacado_endereco_rua.AsString;
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

end.
