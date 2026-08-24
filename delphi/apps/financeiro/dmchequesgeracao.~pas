unit dmchequesgeracao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, DB,
  // Constantes
  ctconstantes, biblio, clparametrossistema,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Componentes
  cpdatasource,  cpquery,
  // Projeto
  dmbasico, dmtecsoft;

type
  TdtmChequesGeracao = class(TdtmBasico)
    qryCheques: TtecQuery;
    qryChequesbanco: TStringField;
    qryChequesagencia: TStringField;
    qryChequesdigito2: TStringField;
    qryChequescompensacao: TStringField;
    qryChequescheque: TStringField;
    qryChequestipificacao: TStringField;
    qryChequesdigito1: TStringField;
    qryChequesconta: TStringField;
    qryChequesdigito3: TStringField;
    qryChequesvalor: TFloatField;
    qryCabecalho: TtecQuery;
    qryCabecalhototal: TFloatField;
  protected
  public
    function  ExisteCheque: Boolean;
    function  ConverteAgencia(Agencia:string):string;
    function  ConverteValor(Total:string; Comprimento: Integer):string;
    procedure MontaArquivoMagnetico(NomeArquivo:String);
    procedure porRemessa(Remessa: String);
    procedure porDataRemessa(DataRemessa: String);
    procedure porPeriodo(DataInicio,DataFinal:String);
    procedure porTipoCheque(TipoCheque: Integer);
    constructor Create(AOwner: TComponent); override;
  end;

var
  dtmChequesGeracao: TdtmChequesGeracao;

implementation

{$R *.dfm}

{ TdtmChequesDevolvidos }

Type

  T_BRAHeader = Record
    BRAAgencia:     Array[01..04] of Char;         // Agencia do depósito - PARAMETROS AGENCIA;
    BRAFiller_0:    Array[05..08] of Char;   {0}   // Campo sem uso
    BRATotal:       Array[09..22] of Char;         // Total dos cheques da remessa
    BRAFiller:      Array[23..46] of Char;   {0}   // Campo sem uso
    BRACrLf:        Array[47..48] of Char;   {CrLf}
  End;

  T_BRADetalhe = Record
    BRABanco:       Array[01..03] of Char;         // Bannco           (número do cheque)
    BRAAgencia:     Array[04..07] of Char;         // Agência          (número do cheque)
    BRADigito2:     Array[08..08] of Char;         // Digito2          (número do cheque)
    BRACompensacao: Array[09..11] of Char;         // Compensação      (número do cheque)
    BRACheque:      Array[12..17] of Char;         // Número do cheque (nvmero do cheque)
    BRATipificacao: Array[18..18] of Char;         // Tipificação      (número do cheque)
    BRADigito1:     Array[19..19] of Char;         // Digito1          (número do cheque)
    BRAConta:       Array[20..29] of Char;         // Conta            (número do cheque)
    BRADigito3:     Array[30..30] of Char;         // Digito3          (número do cheque)
    BRAFiller:      Array[31..33] of Char;   {0}   // Campo sem uso
    BRAValor:       Array[34..46] of Char;         // Valor do Cheque
    BRACrLf:        Array[47..48] of Char;   {CrLf}
  End;

const
   ChequeWhereBase        = 10;
   ChequeWhereTipoCheque  = ChequeWhereBase + 1;
   ChequeWhereDataRemessa = ChequeWhereBase + 2;
   ChequeWhereRemessa     = ChequeWhereBase + 3;
   ChequeWherePeriodo     = ChequeWhereBase + 4;

   CabecalhoWhereBase        = 01;
   CabecalhoWhereTipoCheque  = CabecalhoWhereBase + 1;
   CabecalhoWhereRemessa     = CabecalhoWhereBase + 2;
   CabecalhoWhereDataRemessa = CabecalhoWhereBase + 3;
   CabecalhoWherePeriodo     = CabecalhoWhereBase + 4;

var
  Detalhe          : T_BRADetalhe;
  Header           : T_BRAHeader;

constructor TdtmChequesGeracao.Create(AOwner: TComponent);
begin
  inherited;
  qryCheques.Tag               := ctChequesDetalhe;
  qryCabecalho.Tag             := ctChequesCabecalho;
end;

procedure TdtmChequesGeracao.porPeriodo(DataInicio, DataFinal: String);
const
  Data_1: String = 'and (vencto = ';
  Data_2: String = 'and (vencto between (';
begin
  if not DataEmBranco(DataInicio) then begin
    if DataEmBranco(DataFinal) then begin
      qryCheques.SQL[ChequeWherePeriodo]     := Data_1 + '''' + DataInicio + ''')';
      qryCabecalho.SQL[CabecalhoWherePeriodo]:= Data_1 + '''' + DataInicio + ''')';
    end
    else begin
      qryCheques.SQL[ChequeWherePeriodo]     := Data_2 + '''' + DataInicio + ''') and (''' + DataFinal + '''))';
      qryCabecalho.Sql[CabecalhoWherePeriodo]:= Data_2 + '''' + DataInicio + ''') and (''' + DataFinal + '''))';
    end;
  end
  else begin
    if not DataEmBranco(DataFinal) then begin
      qryCheques.SQL[ChequeWherePeriodo]     := Data_1 + '''' + DataFinal + ''')';
      qryCabecalho.Sql[CabecalhoWherePeriodo]:= Data_1 + '''' + DataFinal + ''')';
    end
    else begin
      qryCheques.SQL[ChequeWherePeriodo]     := '';
      qryCabecalho.Sql[CabecalhoWherePeriodo]:= '';
    end;
  end;
end;

procedure TdtmChequesGeracao.porTipoCheque(TipoCheque: Integer);
const
  Tipo_0: String = ('Where ((data = vencto) or (data <> vencto))');
  Tipo_1: String = ('Where (data =  vencto)');
  Tipo_2: String = ('Where (data <> vencto)');
begin
  case TipoCheque of
    0: begin
         qryCheques.SQL[ChequeWhereTipoCheque]     := Tipo_0;
         qryCabecalho.Sql[CabecalhoWhereTipoCheque]:= Tipo_0;
       end;
    1: begin
         qryCheques.SQL[ChequeWhereTipoCheque]     := Tipo_1;
         qryCabecalho.SQL[CabecalhoWhereTipoCheque]:= Tipo_1;
       end;
    2: begin
         qryCheques.SQL[ChequeWhereTipoCheque]     := Tipo_2;
         qryCabecalho.SQL[CabecalhoWhereTipoCheque]:= Tipo_2;
       end;
  end;
end;

procedure TdtmChequesGeracao.porDataRemessa(DataRemessa: String);
begin
  if DataEmBranco(DataRemessa) then begin
    qryCheques.SQL[ChequeWhereDataRemessa]     := '';
    qryCabecalho.Sql[CabecalhoWhereDataRemessa]:= '';
  end else begin
    qryCheques.SQL[ChequeWhereDataRemessa]     := ('and remessadata = ''' + DataRemessa + '''');
    qryCabecalho.Sql[CabecalhoWhereDataRemessa]:= ('and remessadata = ''' + DataRemessa + '''');
  end;
end;

procedure TdtmChequesGeracao.porRemessa(Remessa: String);
begin
  if (Trim(Remessa) <> '') then begin
    qryCheques.SQL[ChequeWhereRemessa]     := ('and remessanumero = ' + Trim(Remessa) + '');
    qryCabecalho.Sql[CabecalhoWhereRemessa]:= ('and remessanumero = ' + Trim(Remessa) + '');
  end else begin
    qryCheques.SQL[ChequeWhereRemessa]     := '';
    qryCabecalho.Sql[CabecalhoWhereRemessa]:= '';
  end;
end;

procedure TdtmChequesGeracao.MontaArquivoMagnetico(NomeArquivo: String);
var
  Arquivo: file of T_BRAHeader;
  Linha  : String;
begin
  AssignFile(Arquivo,NomeArquivo);
  {$I-}
  Rewrite(Arquivo);
  {$I+}
  if IOResult = 0 then begin

    Linha:= ConverteAgencia(IntToSTr(ParSistema.Agencia));
    Move(Linha[1],Header.BRAAgencia,SizeOf(Header.BRAAgencia));
    Linha:='0000';
    Move(Linha[1],Header.BRAFiller_0,SizeOf(Header.BRAFiller_0));
    Linha:= ConverteValor(qryCabecalhoTotal.AsString, 14);
    Move(Linha[1],Header.BRATotal,SizeOf(Header.BRATotal));
    Linha:='000000000000000000000000';
    Move(Linha[1],Header.BRAFiller,SizeOf(Header.BRAFiller));
    Header.BRACrLf:=#13+#10;
    BlockWrite(Arquivo,Header,1);

    Abre(ctChequesDetalhe);
    qryCheques.First;
    while not qryCheques.Eof do begin
      Linha := qryChequesbanco.AsString;
      Move(Linha[1],detalhe.BRABanco,SizeOf(detalhe.BRABanco));
      Linha := qryChequesagencia.AsString;
      Move(Linha[1],detalhe.BRAAgencia,SizeOf(detalhe.BRAAgencia));
      Linha := qryChequesdigito2.AsString;
      Move(Linha[1],detalhe.BRADigito2,SizeOf(detalhe.BRADigito2));
      Linha := qryChequescompensacao.AsString;
      Move(Linha[1],detalhe.BRACompensacao,SizeOf(detalhe.BRACompensacao));
      Linha := qryChequescheque.AsString;
      Move(Linha[1],detalhe.BRACheque,SizeOf(detalhe.BRACheque));
      Linha := qryChequestipificacao.AsString;
      Move(Linha[1],detalhe.BRATipificacao,SizeOf(detalhe.BRATipificacao));
      Linha := qryChequesdigito1.AsString;
      Move(Linha[1],detalhe.BRADigito1,SizeOf(detalhe.BRADigito1));
      Linha := qryChequesconta.AsString;
      Move(Linha[1],detalhe.BRAConta,SizeOf(detalhe.BRAConta));
      Linha := qryChequesdigito3.AsString;
      Move(Linha[1],detalhe.BRADigito3,SizeOf(detalhe.BRADigito3));
      Detalhe.BRAFiller:='000';
      Linha:= ConverteValor(qryChequesvalor.AsString, 13);
      Move(linha[1],detalhe.BRAValor,SizeOf(detalhe.BRAValor));
      Linha:=#13+#10;
      Move(linha[1],detalhe.BRACrLf,SizeOf(detalhe.BRACrLf));
      BlockWrite(Arquivo,Detalhe,1);
      qryCheques.Next;
    end;
    Fecha(ctChequesCabecalho);
    Fecha(ctChequesDetalhe);
    Closefile(Arquivo);
  end;
end;

function TdtmChequesGeracao.ConverteAgencia(Agencia: string): string;
var
  a: Integer;
begin
  for a:= 1 to 4-Length(Agencia) do
    Agencia:='0' + Agencia;
  Result:= Agencia;
end;

function TdtmChequesGeracao.ConverteValor(Total:string; Comprimento: Integer):string;
var
  Str: String;
  a  : Integer;
begin
  Result := '';
  Str := FloatToStrF(StrToFloat(Total),ffFixed,13,2);
  for a := 1 to Length(Str) do
    if (Str[a] <> '.') and (Str[a] <> ',') then
      Result := Result + Str[a];
  for a := 1 to Comprimento - Length(Result) do
    Result := '0' + Result;
end;

function TdtmChequesGeracao.ExisteCheque: Boolean;
begin
  Abre(ctChequesCabecalho);
  Result:= qryCabecalhoTotal.AsCurrency > 0;
end;

end.
