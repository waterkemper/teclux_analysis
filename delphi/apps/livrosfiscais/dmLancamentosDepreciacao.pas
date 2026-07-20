unit dmLancamentosDepreciacao;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery, biblio, dmtecsoft, variants,
  clparametrossistema, ctconstantes;

type
  TdtmLancamentosDepreciacao = class(TdtmBasico)
    qryApagarLancamentosDepreciacao: TtecQuery;
    qryValorDepreciacao: TtecQuery;
    qryImobilizado: TtecQuery;
    qryValorDepreciacaovalor: TFloatField;
    qryLancamentos: TtecQuery;
    qryLancamentosexercicio: TIntegerField;
    qryLancamentosnrlancto: TIntegerField;
    qryLancamentosfilial: TIntegerField;
    qryLancamentosdata: TDateField;
    qryLancamentosorigem: TStringField;
    qryLancamentosnrorigem: TLargeintField;
    qryLancamentosdebitar: TIntegerField;
    qryLancamentoscreditar: TIntegerField;
    qryLancamentosvalor: TFloatField;
    qryLancamentoshistorico: TIntegerField;
    qryLancamentoscomplemento: TStringField;
    qryLancamentosalteracao: TDateField;
    qryImobilizadonumero: TIntegerField;
    qryImobilizadodata_entrada: TDateField;
    qryImobilizadofilialcontribuinte: TIntegerField;
    qryImobilizadocodigobem: TLargeintField;
    qryImobilizadonumlre: TStringField;
    qryImobilizadofolhalre: TStringField;
    qryImobilizadoicmsvalor: TFloatField;
    qryImobilizadoicmsvalorst: TFloatField;
    qryImobilizadoicmsvalorfrt: TFloatField;
    qryImobilizadoicmsvalordif: TFloatField;
    qryImobilizadodata_saida: TDateField;
    qryImobilizadonmeses: TIntegerField;
    qryImobilizadotipomovimentosaida: TStringField;
    qryImobilizadovalordobem: TFloatField;
    qryImobilizadoidentificacao: TStringField;
    qryImobilizadoinfcomplementar: TStringField;
    qryImobilizadodatagarantia: TDateField;
    qryImobilizadotipoconta: TStringField;
    qryImobilizadodepreciar: TStringField;
    qryImobilizadovalordepreciar: TFloatField;
    qryImobilizadotaxadepreciacao: TFloatField;
    qryImobilizadodepreciacaoacumulada: TFloatField;
    qryImobilizadoobsdepreciacao: TStringField;
    qryImobilizadofuncaobemnaempresa: TStringField;
    qryImobilizadovidautil: TIntegerField;
    qryImobilizadoiniciouso: TDateField;
    qryImobilizadocodigonota: TIntegerField;
    qryImobilizadoccdobem: TIntegerField;
    qryImobilizadoccdepreciacaoacumulada: TIntegerField;
    qryImobilizadocccorrecaomonetaria: TIntegerField;
    qryImobilizadoccdepreciacao: TIntegerField;
    qryImobilizadocentrodecusto: TIntegerField;
    qryImobilizadodadofiscal: TIntegerField;
    qryImobilizadovalorresidual: TFloatField;
    qryImobilizadodescricaocontadobem: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarLancamentos(Exercicio: Integer; MesInicial, MesFinal, CodigoHistorico, ListaBens: String): boolean;
    function ExcluirLancamentosDepreciacao(Perguntar: boolean; Exercicio: Integer; DataInicial, DataFinal: TDateTime): boolean;

  end;

var
  dtmLancamentosDepreciacao: TdtmLancamentosDepreciacao;

implementation

{$R *.dfm}

{ TdtmLancamentosDepreciacao }

function TdtmLancamentosDepreciacao.ExcluirLancamentosDepreciacao(
  Perguntar: boolean; Exercicio: Integer; DataInicial, DataFinal: TDateTime): boolean;

  function ApagarLancamentos: boolean;
  begin
    result := true;
    try
      qryApagarLancamentosDepreciacao.parambyname('exercicio').asinteger := exercicio;
      qryApagarLancamentosDepreciacao.parambyname('datainicial').asDateTime := DataInicial;
      qryApagarLancamentosDepreciacao.parambyname('datafinal').asDateTime := DataFinal;      

      qryApagarLancamentosDepreciacao.ExecSql;
    except
      result := false;
    end;

    if result then
      result := perpetrar([]);
  end;

begin
  result := true;
  if not perguntar then
    result := ApagarLancamentos
  else
    if MensagemConfirmacao('Confirma a exclusão dos lançamentos de depreciação do exercicio '+inttostr(parsistema.EXERCICIOCONTABILIDADE)+' ?')=smbOK then
    begin
      result := ApagarLancamentos;
      MensagemAviso('Lançamentos de depreciação excluidos com sucesso.');
    end;
end;

function TdtmLancamentosDepreciacao.GerarLancamentos(Exercicio: Integer; MesInicial, MesFinal,
  CodigoHistorico, ListaBens: String): boolean;
var
  vmes_inicial, vmes_final, i : byte;
  vDataInicial, vDataFinal: TDateTime;
  vValorDepreciacao : Currency;
begin
   result := false;
  vmes_inicial := strtoint(Mesinicial);
  vmes_final := strtoint(Mesfinal);

  vDataInicial := strtodate('01/'+preencheString(MesInicial,'0',2,false)+'/'+inttostr(Exercicio));
  vDataInicial := UltimoDiaMes(strtodate('01/'+preencheString(MesFinal,'0',2,false)+'/'+inttostr(Exercicio)));


  // Apagar lançamentos do tipo z -> depreciação
  ExcluirLancamentosDepreciacao(false, exercicio, vDataInicial, vDataFinal);

  qryImobilizado.close;
  if ListaBens <> '' then
    qryImobilizado.MacroByName('ListadeBens').AsString := 'and i.numero in ('+ListaBens+')'
  else
    qryImobilizado.MacroByName('ListadeBens').AsString := '';
  qryImobilizado.open;

  if qryImobilizado.IsEmpty then
    MensagemAviso('Nenhuma conta de depreciação foi selecionada.')
  else
  begin
    refazconsulta(qryLancamentos,[],[]);

    for i:=vMes_inicial to vMes_final do
    begin
      vDataFinal := UltimoDiaMes(strtodate('01/'+preencheString(inttostr(i),'0',2,false)+'/'+inttostr(Exercicio)));
      qryImobilizado.first;
      while not qryimobilizado.Eof do
      begin
        RefazConsultaPorNome(qryValorDepreciacao, ['CodigoBem','Data'], [qryImobilizado.FieldByName('numero').AsInteger, vDataFinal]);
        vValorDepreciacao := qryValorDepreciacaovalor.AsCurrency;
        if vValorDepreciacao <> 0 then
        begin
          if qryLancamentos.Locate('debitar;creditar;data;complemento',
             VarArrayOf([qryImobilizadoccdepreciacaoacumulada.asinteger,
                         qryImobilizadoccdepreciacao.asinteger, vDataFinal,
                         qryImobilizadoccdobem.asstring + ' - ' + trim(qryImobilizadodescricaocontadobem.asString)]), []) then
            qryLancamentos.edit
          else
            qryLancamentos.append;

          qryLancamentosexercicio.AsInteger := Exercicio;
          qryLancamentosfilial.AsInteger := ParSistema.Filial;
          qryLancamentosorigem.AsString := 'Z';
          qryLancamentosdata.asdatetime := vDataFinal;
  //        qryLancamentosnrorigem: TLargeintField;
          qryLancamentosdebitar.asinteger := qryImobilizadoccdepreciacaoacumulada.asinteger;
          qryLancamentoscreditar.asinteger := qryImobilizadoccdepreciacao.asinteger;
          qryLancamentosvalor.ascurrency := qryLancamentosvalor.ascurrency + vValorDepreciacao;
          if CodigoHistorico<>'' then
            qryLancamentoshistorico.asString := CodigoHistorico;

          if pos(qryImobilizadoccdobem.asstring + ' - ' + trim(qryImobilizadodescricaocontadobem.asString), qryLancamentoscomplemento.asstring)=0 then
          begin
            if qryLancamentoscomplemento.asstring = '' then
              qryLancamentoscomplemento.asstring := qryImobilizadoccdobem.asstring + ' - ' + trim(qryImobilizadodescricaocontadobem.asString)
            else
              qryLancamentoscomplemento.asstring := qryLancamentoscomplemento.asstring + ', '+qryImobilizadoccdobem.asstring + ' - ' + trim(qryImobilizadodescricaocontadobem.asString);
          end;
  //        qryLancamentosalteracao: TDateField;
          qryLancamentos.post;
        end;
        qryImobilizado.next;
      end;
    end;

    result := perpetrar([qryLancamentos]);
    if result then
      MensagemAviso('Os lançamentos de depreciação foram gerados com sucesso!');
  end;

end;

end.
