unit dmimportacaofolhasenior;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, clparametrossistema, dateutils, ZTransact;

type
  TValores = record
    datallote : TDateTime;
    TotalDebitolote  : Currency;
    TotalCreditolote : Currency;
  end;
  
type
  TdtmImportacaoFolhaSenior = class(TdtmBasico)
    qryLancamentos: TtecQuery;
    qryLancamentosexercicio: TIntegerField;
    qryLancamentosfilial: TIntegerField;
    qryLancamentosdata: TDateField;
    qryLancamentosorigem: TStringField;
    qryLancamentosnrorigem: TLargeintField;
    qryLancamentosdebitar: TIntegerField;
    qryLancamentoscreditar: TIntegerField;
    qryLancamentosvalor: TFloatField;
    qryLancamentoshistorico: TIntegerField;
    qryLancamentoserroimportacao: TStringField;
    dsrLancamentos: TtecDataSource;
    qryLancamentosdata_string: TStringField;
    qryLancamentosdebitar_string: TStringField;
    qryLancamentoscreditar_string: TStringField;
    qryLancamentoshistorico_string: TStringField;
    qryLancamentosvalor_string: TStringField;
    spcLotesProximo: TtecQuery;
    spcLotesProximocodigo: TIntegerField;
    qryProcuraConta: TtecQuery;
    qryProcuraContacodigo: TIntegerField;
    qryProcuraHistorico: TtecQuery;
    qryProcuraHistoricocodigo: TIntegerField;
    qryTotal: TtecQuery;
    qryTotaldata: TDateField;
    qryTotaldebito: TFloatField;
    qryTotalcredito: TFloatField;
    qryLancamentosnumero: TIntegerField;
    qryLancamentoscomplemento: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    fExisteErro: Boolean;
    NrLote: Integer;
    procedure ImportarArquivo(NomeArquivo: String; Estilo: Integer);
    procedure AtualizaNrLote;
    function GravarLancamentos: Boolean;
  end;

var
  dtmImportacaoFolhaSenior: TdtmImportacaoFolhaSenior;

implementation

{$R *.dfm}

{ TdtmImportacaoFolhaSenior }

procedure TdtmImportacaoFolhaSenior.AtualizaNrLote;
begin
  spcLotesProximo.ParamByName('Exercicio').AsInteger:= ParSistema.EXERCICIOCONTABILIDADE;
  spcLotesProximo.ParamByName('Filial').AsInteger:= FilialBase;
  spcLotesProximo.Open;
  NrLote := spcLotesProximocodigo.AsInteger;
  spcLotesProximo.Close;
end;

function TdtmImportacaoFolhaSenior.GravarLancamentos: Boolean;
begin
  
  spcLotesProximo.ParamByName('Exercicio').AsInteger:= ParSistema.EXERCICIOCONTABILIDADE;
  spcLotesProximo.ParamByName('Filial').AsInteger:= FilialBase;
  spcLotesProximo.Open;
  NrLote := spcLotesProximocodigo.AsInteger;
  spcLotesProximo.Close;

  qryLancamentos.DisableControls;
  qryLancamentos.First;
  while not qryLancamentos.Eof do
  begin
    qrylancamentos.Edit;
    qryLancamentosnrorigem.AsLargeInt := NrLote;
    qrylancamentos.Post;
    qrylancamentos.Next;
  end;
  qrylancamentos.EnableControls;
  result := Perpetrar([qrylancamentos]);
  if result then
    qrylancamentos.Close;
end;

procedure TdtmImportacaoFolhaSenior.ImportarArquivo(NomeArquivo: String; Estilo: Integer);
var
  Arquivo: TStringList;
  ContaDebito, ContaCredito, CodigoHistorico, i, tam: integer;
  data : TDateTime;
  Valor, TotalDebito, TotalCredito: Currency;
  erro: String;
  Valores : array of TValores;


  D_ou_C, ComplementoHistorico : String;

  procedure TotalizarDebitosCreditos;
  begin
    if qryTotal.Locate('data',data,[]) then
    begin
      qryTotal.edit;
      if ContaDebito<>0 then
        qryTotaldebito.AsCurrency := qryTotaldebito.AsCurrency + Valor;
      if ContaCredito<>0 then
        qryTotalcredito.AsCurrency := qryTotalcredito.AsCurrency + Valor;
      qryTotal.Post;
    end
    else
    begin
      qryTotal.Append;
      qryTotaldata.AsDateTime := data;
      if ContaDebito<>0 then
        qryTotaldebito.AsCurrency := Valor;
      if ContaCredito<>0 then
        qryTotalcredito.AsCurrency := Valor;
      qryTotal.Post;
    end;
  end;

  procedure VerificarErroSaldos;
  begin
    qryTotal.First;
    while not qryTotal.Eof do
    begin
      if qryTotaldebito.AsCurrency <> qryTotalcredito.AsCurrency then
      begin
        qryLancamentos.First;
        while not qryLancamentos.Eof do
        begin
          if qryLancamentosdata.AsDateTime = qryTotaldata.AsDateTime then
          begin
            qryLancamentos.Edit;
            qryLancamentoserroimportacao.AsString := Concatenarstring(
                 qryLancamentoserroimportacao.AsString, 'diferença entre débito e crédito', ', ');
            qryLancamentos.Post;
            fExisteErro := true;
          end;
          qryLancamentos.Next;
        end;
      end;
      qryTotal.Next;
    end;
  end;

begin
  fExisteErro := false;
  Arquivo := TStringList.Create;
  Arquivo.LoadFromFile(NomeArquivo);
  ReFazConsulta(qryLancamentos,[],[]);
  ReFazConsulta(qryTotal,[],[]);
  qrylancamentos.DisableControls;
  Valores := nil;

  for i:=0 to arquivo.Count-1 do
  begin
    qryLancamentos.Append;
    qryLancamentosnumero.AsInteger := i+1;
    erro := '';
    case Estilo of
    0: begin      //SENIOR
          try
            qryLancamentosdata_string.AsString := copy(arquivo[i],3,8);
            data :=  encodedate(strtoint(copy(qryLancamentosdata_string.AsString,5,4)),
                                strtoint(copy(qryLancamentosdata_string.AsString,3,2)),
                                strtoint(copy(qryLancamentosdata_string.AsString,1,2)));

            if YearOf(data) <> ParSistema.EXERCICIOCONTABILIDADE then
              erro := 'campo "data" fora do exercício'
          except
            erro := 'campo "data" inválido';
          end;

          try
            qryLancamentosdebitar_string.AsString := copy(arquivo[i],12,7);
            ContaDebito := strtoint(qryLancamentosdebitar_string.AsString);
            RefazConsultaPorNome(qryProcuraConta,['codigo'],[contadebito]);
            if qryProcuraConta.IsEmpty and (ContaDebito<>0) then
              erro := ConcatenarString(erro, 'campo "debitar" não cadastrado', ', ');
          except
            erro := ConcatenarString(erro, 'campo "debitar" inválido', ', ');
          end;

          try
            qryLancamentoscreditar_string.AsString := copy(arquivo[i],20,7);
            ContaCredito := strtoint(qryLancamentoscreditar_string.AsString);
            RefazConsultaPorNome(qryProcuraConta,['codigo'],[contacredito]);
            if qryProcuraConta.IsEmpty and (contacredito<>0)then
              erro := ConcatenarString(erro, 'campo "creditar" não cadastrado', ', ');
          except
            erro := ConcatenarString(erro, 'campo "creditar" inválido', ', ');
          end;

          if (contaDebito=0) and (ContaCredito=0) then
            erro := Concatenarstring(erro, 'não há contas informadas', ', ');

          try
            qryLancamentosvalor_string.AsString := copy(arquivo[i],28,15);
            Valor := StrToCurr(qryLancamentosvalor_string.AsString);
            if valor = 0 then
              erro := ConcatenarString(erro, 'campo "valor" igual a zero', ', ');
          except
            erro := ConcatenarString(erro, 'campo "valor" inválido', ', ');
          end;

          try
            qryLancamentoshistorico_string.AsString := copy(arquivo[i],44,4);
            CodigoHistorico := strtoint(qryLancamentoshistorico_string.AsString);
            RefazConsultaPorNome(qryProcuraHistorico,['codigo'],[codigoHistorico]);
            if qryProcuraHistorico.IsEmpty and (CodigoHistorico<>0) then
              erro := ConcatenarString(erro, 'campo "histórico" não cadastrado', ', ');
          except
            erro := ConcatenarString(erro, 'campo "histórico" inválido', ', ');
          end;

          if erro='' then
          begin
            qryLancamentosexercicio.AsInteger := ParSistema.EXERCICIOCONTABILIDADE;
            qryLancamentosfilial.AsInteger := ParSistema.Filial;
            qryLancamentosorigem.AsString := 'I';
        //      qryLancamentosnrorigem.AsLargeInt :=
            qryLancamentosdata.AsDateTime := data;
            if ContaDebito<>0 then
              qryLancamentosdebitar.AsInteger := ContaDebito;

            if ContaCredito<>0 then
              qryLancamentoscreditar.AsInteger := ContaCredito;
            qryLancamentosvalor.AsCurrency := Valor;

            if CodigoHistorico<>0 then
              qryLancamentoshistorico.AsInteger := CodigoHistorico;
          end
          else
          begin
            qryLancamentoserroimportacao.AsString := erro;
            fExisteErro := true;
          end;
       end;
    1: begin  //SIENGE
          try
            qryLancamentosdata_string.AsString := copy(arquivo[i],91,8);
            data :=  encodedate(strtoint(copy(qryLancamentosdata_string.AsString,1,4)),
                                strtoint(copy(qryLancamentosdata_string.AsString,5,2)),
                                strtoint(copy(qryLancamentosdata_string.AsString,7,2)));

            if YearOf(data) <> ParSistema.EXERCICIOCONTABILIDADE then
              erro := 'campo "data" fora do exercício'
          except
            erro := 'campo "data" inválido';
          end;

          D_ou_C := copy(arquivo[i],115,1);
          if (D_ou_C=' ') or ((D_ou_C<>'D') and (D_ou_C<>'C')) then
            erro := ConcatenarString(erro, 'campo "sinal D/C" em branco ou incorreto', ', ');

          if D_ou_C = 'D' then
          begin
            try
              qryLancamentosdebitar_string.AsString := trim(copy(arquivo[i],4,28));
              ContaDebito := strtoint(qryLancamentosdebitar_string.AsString);
              ContaCredito := 0;
              RefazConsultaPorNome(qryProcuraConta,['codigo'],[contadebito]);
              if qryProcuraConta.IsEmpty and (ContaDebito<>0) then
                erro := ConcatenarString(erro, 'campo "debitar" não cadastrado', ', ');
            except
              erro := ConcatenarString(erro, 'campo "debitar" inválido', ', ');
            end;
          end;


          if D_ou_C = 'C' then
          begin
            try
              qryLancamentoscreditar_string.AsString := trim(copy(arquivo[i],4,28));
              ContaCredito := strtoint(qryLancamentoscreditar_string.AsString);
              ContaDebito := 0;
              RefazConsultaPorNome(qryProcuraConta,['codigo'],[contacredito]);
              if qryProcuraConta.IsEmpty and (contacredito<>0)then
                erro := ConcatenarString(erro, 'campo "creditar" não cadastrado', ', ');
            except
              erro := ConcatenarString(erro, 'campo "creditar" inválido', ', ');
            end;
          end;


          if (contaDebito=0) and (ContaCredito=0) then
            erro := Concatenarstring(erro, 'não há contas informadas', ', ');

          try
            qryLancamentosvalor_string.AsString := copy(arquivo[i],99,16);
            Valor := StrToCurr(trocar(qryLancamentosvalor_string.AsString,'.',','));
            if valor = 0 then
              erro := ConcatenarString(erro, 'campo "valor" igual a zero', ', ');
          except
            erro := ConcatenarString(erro, 'campo "valor" inválido', ', ');
          end;

          {
          try
            qryLancamentoshistorico_string.AsString := copy(arquivo[i],214,4);
            CodigoHistorico := strtoint(qryLancamentoshistorico_string.AsString);
            RefazConsultaPorNome(qryProcuraHistorico,['codigo'],[codigoHistorico]);
            if qryProcuraHistorico.IsEmpty and (CodigoHistorico<>0) then
              erro := ConcatenarString(erro, 'campo "histórico" não cadastrado', ', ');
          except
            erro := ConcatenarString(erro, 'campo "histórico" inválido', ', ');
          end;
          }
          qryLancamentoscomplemento.AsString := trim(copy(arquivo[i],214,259));

          if erro='' then
          begin
            qryLancamentosexercicio.AsInteger := ParSistema.EXERCICIOCONTABILIDADE;
            qryLancamentosfilial.AsInteger := ParSistema.Filial;
            qryLancamentosorigem.AsString := 'I';
        //      qryLancamentosnrorigem.AsLargeInt :=
            qryLancamentosdata.AsDateTime := data;
            if ContaDebito<>0 then
              qryLancamentosdebitar.AsInteger := ContaDebito;

            if ContaCredito<>0 then
              qryLancamentoscreditar.AsInteger := ContaCredito;
            qryLancamentosvalor.AsCurrency := Valor;

            if CodigoHistorico<>0 then
              qryLancamentoshistorico.AsInteger := CodigoHistorico;
          end
          else
          begin
            qryLancamentoserroimportacao.AsString := erro;
            fExisteErro := true;
          end;
       end;
    end;
    qryLancamentos.Post;

    TotalizarDebitosCreditos;
  end;

  VerificarErroSaldos;

  qrylancamentos.EnableControls;

  if not fExisteErro then
    AtualizaNrLote;
end;

end.

