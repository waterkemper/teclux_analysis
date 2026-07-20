unit dmgerarnotafiscal;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  ctconstantes, Variants, biblio, clparametrossistema, Math, ZTransact;
type
  TdtmGerarNotaFiscal = class(TdtmBasico)
    qryCalculosDadosFiscais: TtecQuery;
    qryCalculosDadosFiscaisdadofiscal: TIntegerField;
    qryCalculosDadosFiscaisnumero: TIntegerField;
    qryCalculosDadosFiscaistipo: TStringField;
    qryCalculosDadosFiscaiscodigofiscal: TIntegerField;
    qryCalculosDadosFiscaiscodigonatureza: TIntegerField;
    qryCalculosDadosFiscaisaliquota: TFloatField;
    qryCalculosDadosFiscaisbase: TFloatField;
    qryCalculosDadosFiscaisisentas: TFloatField;
    qryCalculosDadosFiscaisoutras: TFloatField;
    qryCalculosDadosFiscaisvalor: TFloatField;
    qryCalculosDadosFiscaisnomeimposto: TStringField;
    qryCalculosDadosFiscaisTotal: TCurrencyField;
    qryCalculosNotasPag: TtecQuery;
    qryCalculosNotasPagcodigonota: TIntegerField;
    qryCalculosNotasPagnumero: TIntegerField;
    qryCalculosNotasPagtipo: TStringField;
    qryCalculosNotasPagcodigofiscal: TIntegerField;
    qryCalculosNotasPagcodigonatureza: TIntegerField;
    qryCalculosNotasPagaliquota: TFloatField;
    qryCalculosNotasPagbase: TFloatField;
    qryCalculosNotasPagisentas: TFloatField;
    qryCalculosNotasPagoutras: TFloatField;
    qryCalculosNotasPagvalor: TFloatField;
    qryCalculosNotasPagnomeimposto: TStringField;
    qryCalculosNotasPagTotal: TCurrencyField;
    qryEstadosIPI: TtecQuery;
    qryEstadosIPIestado: TStringField;
    qryNaturezas: TtecQuery;
    qryNaturezasicmssobreipi: TBooleanField;
    qryNaturezascodigo: TIntegerField;
    qryCalculosNotasPagtotaltipo: TFloatField;
    procedure qryCalculosNotasPagNewRecord(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisNewRecord(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisCalcFields(DataSet: TDataSet);
    procedure qryCalculosNotasPagCalcFields(DataSet: TDataSet);
    procedure qryCalculosNotasPagBeforeInsert(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisBeforeInsert(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaistipoChange(Sender: TField);
    procedure qryCalculosNotasPagtipoChange(Sender: TField);
    procedure qryCalculosDadosFiscaisFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryCalculosNotasPagAfterPost(DataSet: TDataSet);
  private
{    fTotaldaNota: TtecValorRetorno;}
    function GetICMSSobreIPI(natureza: integer): boolean;
  private
    NroUltimoImposto : integer;
    FCodigoNatureza: TTecIntegerRetorno;
    FCodigoFiscal: TTecIntegerRetorno;
    FChaveNotas: TTecIntegerRetorno;
    { Private declarations }
    function TipoNotaSaida(codfiscal:integer): TtecTipoNotaSaida;
    property ICMSSobreIPI[natureza: integer]: boolean read GetICMSSobreIPI ;


  public
    procedure AtribuirValoresImpostos(Operacao: TipoNotaFiscal; var ValorBaseICMS, ValorICMS, ValorIPI, ValorISS: Currency);
    procedure CalcularTotalImpostos(Operacao: TipoNotaFiscal; ForcarFechamentoIPI: Boolean = false; TotaldaNota : Currency = 0.00);
    property CodigoFiscal: TTecIntegerRetorno read FCodigoFiscal write FCodigoFiscal;
    property CodigoNatureza: TTecIntegerRetorno read FCodigoNatureza write FCodigoNatureza;
    property ChaveNotas: TTecIntegerRetorno read FChaveNotas write FChaveNotas;
{    property TotaldaNota: TtecValorRetorno read fTotaldaNota write fTotaldaNota;}
    procedure CalcularDadosFiscais(Operacao: TipoNotaFiscal;
                                 DadoFiscal,
                                 CodigoFiscal: integer;
                                 Frete, ICMSFrete: Currency;  RatearFrete: Boolean;
                                 Seguro, ICMSSeguro: Currency; RatearSeguro: Boolean;
                                 DespesasAcessorias,
                                 Desconto,
                                 Acrescimo,
                                 ValorTotalNota,
                                 TotalProdutos: Currency;
                                 qryProdutosDadosFiscais,
                                 qryProdutosDadosFiscaisCompostos,
                                 qryServicosDadosFiscais : TtecQuery;
                                 IncluirServico,
                                 ECF,
                                 CreditarICMS: Boolean;
                                 Estado,
                                 PessoaTipo: String;
                                 ValorICMSSubstituicao: Currency;
                                 VendaConsumidorFinal: Boolean;
                                 IPISuspenso: Boolean = False;
                                 CodigoNatureza: integer = 0);
    { Public declarations }
  end;

var
  dtmGerarNotaFiscal: TdtmGerarNotaFiscal;

implementation

{$R *.dfm}

{ TdtmGerarNotaFiscal }

procedure TdtmGerarNotaFiscal.AtribuirValoresImpostos(
  Operacao: TipoNotaFiscal; var ValorBaseICMS, ValorICMS, ValorIPI,
  ValorISS: Currency);
var
  TabelaCalculo : TtecQuery;
begin
  ValorBaseICMS := 0;  ValorICMS := 0;  ValorIPI := 0;  ValorISS := 0;
  case Operacao of
    nfENTRADA,nfDEVOLUCAO: TabelaCalculo := qryCalculosNotasPag;
  else
    TabelaCalculo := qryCalculosDadosFiscais;
  end;
  GuardarRegistroAtual(TabelaCalculo,true);
  try
    TabelaCalculo.First;
    while not TabelaCalculo.Eof do
    begin
      if TabelaCalculo.FieldByName('tipo').AsString='M' then
      begin
        ValorBaseICMS := ValorBaseICMS +
                         TabelaCalculo.FieldByName('base').AsFloat;
        ValorICMS     := ValorICMS     +
                         TabelaCalculo.FieldByName('valor').AsFloat;
      end
      else
      if TabelaCalculo.FieldByName('tipo').AsString='P' then
        ValorIPI      := ValorIPI +
                         TabelaCalculo.FieldByName('valor').AsFloat
      else
      if TabelaCalculo.FieldByName('tipo').AsString='S' then
        ValorISS      := ValorISS +
                         TabelaCalculo.FieldByName('valor').AsFloat;
      TabelaCalculo.Next;
    end;
  finally
    VoltarRegistroAtual(TabelaCalculo);
  end;
end;

procedure TdtmGerarNotaFiscal.CalcularDadosFiscais(
  Operacao: TipoNotaFiscal; DadoFiscal, CodigoFiscal: integer;
  Frete, ICMSFrete: Currency; RatearFrete: Boolean; Seguro, ICMSSeguro: Currency;
  RatearSeguro: Boolean; DespesasAcessorias, Desconto, Acrescimo,
  ValorTotalNota, TotalProdutos: Currency; qryProdutosDadosFiscais,
  qryProdutosDadosFiscaisCompostos, qryServicosDadosFiscais: TtecQuery;
  IncluirServico, ECF, CreditarICMS: Boolean; Estado, PessoaTipo: String;
  ValorICMSSubstituicao: Currency; VendaConsumidorFinal,
  IPISuspenso: Boolean;
  CodigoNatureza: Integer);


var
  QP, QS, NC, QPS: Integer;
  TabelaCalculo: TTecQuery;
  AliquotaICMSProprio,
  SomaPrecoSubstituicao,
  RateioICMSSubstituicao :Real;
  ExistemItens: Boolean;

//  TotalDescontoFinanceiro :

  Produtos: array of record
    CFOP,
    Natureza: Integer;
    ICMSAliquota,
    ICMSBase,
    ICMSValor,
    ICMSIsentas,
    ICMSOutras,
    IPIAliquota,
    IPIBase,
    IPIValor,
    IPIIsentas,
    IPIOutras,
    PrecoProduto: Real;
    Incidencia: String;
    DestacarIPI,
    ICMSSobreIPI,
    Importacao: Boolean;
  end;

  Servicos: array of record
    CFOP,
    Natureza: Integer;
    ISSAliquota,
    ISSBase,
    ISSValor,
    ISSIsentas,
    ISSOutras: Real;
  end;
{
  Impostos: array of record
    Tipo: String;
    CFOP,
    Natureza: Integer;
    Aliquota,
    Base,
    Valor,
    Isentas,
    Outras: Real;
  end;
}
  procedure AdicionarCalculoProdutos;
  var
    i: Integer;
  begin
    if contribicms then
      for i:=0 to QP-1 do  // GERA OS REGISTROS PARA ICMS
      begin
        if not TabelaCalculo.IsEmpty and
           TabelaCalculo.Locate('tipo,aliquota,codigofiscal,codigonatureza',
             VarArrayOF(['M',
                         Produtos[i].ICMSAliquota,
                         Produtos[i].CFOP,
                         Produtos[i].Natureza]),[]) then
        begin
          TabelaCalculo.Edit;
          TabelaCalculo.FieldByName('base').AsFloat    := TabelaCalculo.FieldByName('base').AsFloat    + Produtos[i].ICMSBase;
          TabelaCalculo.FieldByName('outras').AsFloat  := TabelaCalculo.FieldByName('outras').AsFloat  + Produtos[i].ICMSOutras +
                                                          ifthen(produtos[i].ICMSSobreIPI, 0, Produtos[i].IPIValor);
          TabelaCalculo.FieldByName('isentas').AsFloat := TabelaCalculo.FieldByName('isentas').AsFloat + Produtos[i].ICMSIsentas;
          TabelaCalculo.FieldByName('valor').AsFloat   := TabelaCalculo.FieldByName('valor').AsFloat   + Produtos[i].ICMSValor;
        end
        else
        begin
          Inc(NC);
          TabelaCalculo.Append;
          case Operacao of
           nfENTRADA,nfDEVOLUCAO: TabelaCalculo.FieldByName('codigonota').AsInteger := DadoFiscal;
           nfSAIDA: TabelaCalculo.FieldByName('dadofiscal').AsInteger := DadoFiscal;
          end;
          TabelaCalculo.FieldByName('numero').AsInteger := NC;
          TabelaCalculo.FieldByName('tipo').AsString    := 'M';
          TabelaCalculo.FieldByName('aliquota').AsFloat := Produtos[i].ICMSAliquota;
          TabelaCalculo.FieldByName('base').AsFloat     := Produtos[i].ICMSBase;
          TabelaCalculo.FieldByName('outras').AsFloat   := Produtos[i].ICMSOutras +
                                                           ifthen(produtos[i].ICMSSobreIPI, 0, Produtos[i].IPIValor);
          TabelaCalculo.FieldByName('isentas').AsFloat  := Produtos[i].ICMSIsentas;
          TabelaCalculo.FieldByName('valor').AsFloat    := Produtos[i].ICMSValor;
          TabelaCalculo.FieldByName('codigofiscal').Asinteger := Produtos[i].CFOP;
          TabelaCalculo.FieldByName('codigonatureza').Asinteger := Produtos[i].Natureza;
        end;
        if (ValorICMSSubstituicao > 0) and  // RATEIO DO VALOR DA SUBSTITUICAO TRIBUTARIA NA NOTA DE ENTRADA
           ((Produtos[i].Incidencia = ctCOBRADOSUSTITUICAO)      or
            (Produtos[i].Incidencia = ctREDUCAOBASESUBSTITUICAO) or
            (Produtos[i].Incidencia = ctISENTASUBSTITUICAO)      or
            (Produtos[i].Incidencia = ctTRIBUTADASUBSTITUICAO))  then
        begin
          Dec(QPS);
          if QPS = 0 then
            TabelaCalculo.FieldByName('outras').AsFloat := TabelaCalculo.FieldByName('outras').AsFloat + RateioICMSSubstituicao
          else
          begin
            TabelaCalculo.FieldByName('outras').AsFloat := TabelaCalculo.FieldByName('outras').AsFloat +
                                                          Truncar((Produtos[i].PrecoProduto*SomaPrecoSubstituicao) / ValorICMSSubstituicao,2);
            RateioICMSSubstituicao := RateioICMSSubstituicao -
                                      Truncar((Produtos[i].PrecoProduto*SomaPrecoSubstituicao) / ValorICMSSubstituicao,2);
          end;
        end;
        TabelaCalculo.Post;
      end;

    //if contribipi then
      for i:=0 to QP-1 do  // GERA OS REGISTROS PARA IPI
      begin
        if contribIPI or Produtos[i].DestacarIPI then
        begin
          if not TabelaCalculo.IsEmpty and
             TabelaCalculo.Locate('tipo,aliquota,codigofiscal,codigonatureza',
               VarArrayOF(['P',
                           Produtos[i].IPIAliquota,
                           Produtos[i].CFOP,
                           Produtos[i].Natureza]),[]) then
          begin
            TabelaCalculo.Edit;
            TabelaCalculo.FieldByName('base').AsFloat    := TabelaCalculo.FieldByName('base').AsFloat    + Produtos[i].IPIBase;
            TabelaCalculo.FieldByName('outras').AsFloat  := TabelaCalculo.FieldByName('outras').AsFloat  + Produtos[i].IPIOutras;
            TabelaCalculo.FieldByName('isentas').AsFloat := TabelaCalculo.FieldByName('isentas').AsFloat + Produtos[i].IPIIsentas+
                                                            ifthen(Produtos[i].Importacao,Produtos[i].icmsvalor,0);

            TabelaCalculo.FieldByName('valor').AsFloat   := TabelaCalculo.FieldByName('valor').AsFloat   + Produtos[i].IPIValor;
          end
          else
          begin
            Inc(NC);
            TabelaCalculo.Append;
            case Operacao of
             nfENTRADA,nfDEVOLUCAO: TabelaCalculo.FieldByName('codigonota').AsInteger := DadoFiscal;
             nfSAIDA: TabelaCalculo.FieldByName('dadofiscal').AsInteger := DadoFiscal;
            end;
            TabelaCalculo.FieldByName('numero').AsInteger := NC;
            TabelaCalculo.FieldByName('tipo').AsString    := 'P';
            TabelaCalculo.FieldByName('aliquota').AsFloat := Produtos[i].IPIAliquota;
            TabelaCalculo.FieldByName('base').AsFloat     := Produtos[i].IPIBase;
            TabelaCalculo.FieldByName('outras').AsFloat   := Produtos[i].IPIOutras;
            TabelaCalculo.FieldByName('isentas').AsFloat  := Produtos[i].IPIIsentas+
                                                             ifthen(Produtos[i].Importacao,Produtos[i].icmsvalor,0);
            TabelaCalculo.FieldByName('valor').AsFloat    := Produtos[i].IPIValor;
            TabelaCalculo.FieldByName('codigofiscal').Asinteger := Produtos[i].CFOP;
            TabelaCalculo.FieldByName('codigonatureza').Asinteger := Produtos[i].Natureza;
          end;
          TabelaCalculo.Post;
        end;
      end;
  end;

  procedure CalcularAliquotasProduto(Tabela: TtecQuery);
  var
    PrecoProduto,
    PrecoItem,
    BaseICMS,
    ValorReducaoBase: Real;
    DescontoRateadoItem : Real;
    HeImportacao : Boolean;
  begin
    DescontoRateadoItem := 0;
    BaseICMS := 0;
    HeImportacao := tabela.fieldbyname('codigofiscal').asinteger - (tabela.fieldbyname('codigofiscal').asinteger mod 1000) = 3000;

    if Operacao = nfSAIDA then
    begin
      PrecoProduto := Tabela.fieldbyname('precovenda').AsFloat;
      ValorReducaoBase := Tabela.fieldbyname('ReducaoBase').AsFloat;
    end
    else  // nfENTRADA, nfDEVOLUCAO
    begin
      PrecoProduto := Tabela.fieldbyname('precounitario').AsFloat;
      ValorReducaoBase := Tabela.fieldbyname('ValorReducaoBase').AsFloat;
    end;

    if (Operacao = nfSAIDA) and
       (Tabela.Name <> 'qryProdutosDadosFiscaisCompostos') then
    begin

      PrecoItem := truncar((PrecoProduto * Tabela.fieldbyname('quantidade').AsFloat) -
                           Tabela.fieldbyname('valordescontoitem').AsFloat -
                           Tabela.fieldbyname('desconto').AsFloat,2);



{
      DescontoRateadoItem := truncar((PrecoItem * Desconto / TotalProdutos),2);
      TotalDescontoFinanceiro := TotalDescontoFinanceiro + DescontoRateadoItem;
      if Tabela.RecNo = tabela.RecordCount then
      begin
        if Tabela.RecordCount = 1 then
          DescontoRateadoItem := desconto
        else
        begin
          if TotalDescontoFinanceiro < desconto then
            DescontoRateadoItem := DescontoRateadoItem + (desconto - TotalDescontoFinanceiro)
          else
            if TotalDescontoFinanceiro > desconto then
              DescontoRateadoItem := DescontoRateadoItem - (TotalDescontoFinanceiro - desconto);
        end;
      end;
      PrecoItem := PrecoItem - DescontoRateadoItem;
}
    end
    else
    begin
      if HeImportacao then
        PrecoItem := PrecoProduto *
                     Tabela.fieldbyname('quantidade').AsFloat -
                     Tabela.fieldbyname('desconto').AsFloat
      else
        PrecoItem := truncar(PrecoProduto *
                             Tabela.fieldbyname('quantidade').AsFloat -
                             Tabela.fieldbyname('desconto').AsFloat,2);
    end;

    Inc(QP);
    SetLength(Produtos,QP);
    Produtos[QP-1].ICMSSobreIPI := false;
    Produtos[QP-1].Importacao := HeImportacao;


    if not ECF and (ContribIPI or (Operacao = nfENTRADA) or ((Tabela.FindField('destacaripi') <> nil) and Tabela.fieldbyname('destacaripi').AsBoolean)) then
    begin
      Produtos[QP-1].CFOP     := Tabela.fieldbyname('codigofiscal').AsInteger;
      Produtos[QP-1].Natureza := Tabela.fieldbyname('natureza').AsInteger;

      Produtos[QP-1].IPIAliquota := Tabela.fieldbyname('aliquotaipi').AsFloat;
      if Tabela.FindField('destacaripi') <> nil then
        Produtos[QP-1].DestacarIPI := Tabela.FieldByName('destacarIPI').AsBoolean
      else
        Produtos[QP-1].DestacarIPI := False;
      if (Tabela.fieldbyname('ipicst').AsString = '00') or
         (Tabela.fieldbyname('ipicst').AsString = '49') or
         (Tabela.fieldbyname('ipicst').AsString = '50') or
         (Tabela.fieldbyname('ipicst').AsString = '51') then
      begin
        if HeImportacao then
        begin
          Produtos[QP-1].IPIBase  := Tabela.fieldbyname('ipibasecalculo').AsFloat;
          Produtos[QP-1].IPIValor := Tabela.fieldbyname('valoripi').AsFloat;
        end
        else
        begin
          Produtos[QP-1].IPIBase  := PrecoItem;
          Produtos[QP-1].IPIValor := truncar((Produtos[QP-1].IPIBase * Tabela.fieldbyname('aliquotaipi').AsFloat/100),2);
        end
      end
      else
      if (Tabela.fieldbyname('ipicst').AsString = '52') or
         (Tabela.fieldbyname('ipicst').AsString = '53') then
      begin
        if HeImportacao then
          Produtos[QP-1].IPIIsentas := Tabela.fieldbyname('ipibasecalculo').AsFloat
        else
          Produtos[QP-1].IPIIsentas := PrecoItem;
      end
      else {if (Tabela.fieldbyname('ipicst').AsString = '54') or
              (Tabela.fieldbyname('ipicst').AsString = '55') then }
      begin
        if HeImportacao then
          Produtos[QP-1].IPIOutras  := Tabela.fieldbyname('ipibasecalculo').AsFloat
        else
          Produtos[QP-1].IPIOutras  := PrecoItem;
      end;

      if Operacao = nfENTRADA then
        if HeImportacao then
          Produtos[QP-1].IPIOutras := Produtos[QP-1].IPIOutras +
                                      Tabela.fieldbyname('naotribipi').AsFloat +
                                      Tabela.fieldbyname('despesasacessorias').AsFloat -
                                      Tabela.fieldbyname('embalagem').AsFloat - {já estão inclusas na base do ipi}
                                      Tabela.fieldbyname('thc').AsFloat


        else
          Produtos[QP-1].IPIOutras := Produtos[QP-1].IPIOutras +
                                      Tabela.fieldbyname('frete').AsFloat +
                                      Tabela.fieldbyname('seguro').AsFloat +
                                      Tabela.fieldbyname('despesasacessorias').AsFloat;

      if Operacao = nfSAIDA then
      begin
        if Tabela.FindField('acrescimo') <> nil then
          Produtos[QP-1].IPIOutras := Produtos[QP-1].IPIOutras + Tabela.fieldbyname('acrescimo').AsFloat;

        { Alterado por : Gedovar
          Data : 11/08/2010
          Razão: O CÁLCULO DO IPI ESTAVA SEM FRETE E SEGURO NA KRAHICE }

        Produtos[QP-1].IPIOutras := Produtos[QP-1].IPIOutras + Tabela.fieldbyname('frete').AsFloat +
                                                               Tabela.fieldbyname('seguro').AsFloat;
      end;
{
      Tabela.FieldByName('ipibasecalculo').AsFloat := Produtos[QP-1].IPIBase;
      Tabela.FieldByName('valoripi').AsFloat       := Produtos[QP-1].IPIValor;
}
    end;

    (* RECALCULA O VALOR DAS VARIAVEIS POIS O FRETE INFLUENCIA O CALCULO DO ICMS *)
    if Operacao = nfSAIDA then
    begin
      PrecoProduto := Tabela.fieldbyname('precovenda').AsFloat;
      ValorReducaoBase := Tabela.fieldbyname('ReducaoBase').AsFloat;
    end
    else  // nfENTRADA, nfDEVOLUCAO
    begin
      PrecoProduto := Tabela.fieldbyname('precounitario').AsFloat;
      ValorReducaoBase := Tabela.fieldbyname('ValorReducaoBase').AsFloat;
    end;

    if (Operacao = nfSAIDA) and
       not ECF and
       ((Tabela.FindField('baseicms')<> nil) and (Tabela.fieldbyname('baseicms').Value > 0)) then
    begin
      PrecoItem := truncar(Tabela.fieldbyname('baseicms').AsFloat *
                           Tabela.fieldbyname('quantidade').AsFloat, 2);
      BaseICMS := (PrecoProduto * Tabela.fieldbyname('quantidade').AsFloat) -
                  Tabela.fieldbyname('desconto').AsFloat -
                  PrecoItem;
    end
    else
    if (Tabela.Name = 'qryProdutosDadosFiscaisCompostos') then
      PrecoItem := truncar((PrecoProduto * Tabela.fieldbyname('quantidade').AsFloat),2)
    else
    if (Operacao = nfSAIDA) then
    begin
      PrecoItem := truncar((PrecoProduto *
                    Tabela.fieldbyname('quantidade').AsFloat) -
                    Tabela.fieldbyname('valordescontoitem').AsFloat -
                    Tabela.fieldbyname('desconto').AsFloat +
                    Tabela.fieldbyname('frete').AsFloat +
                    Tabela.fieldbyname('seguro').AsFloat,2);
      if Tabela.FindField('despesasacessorias') <> nil then
        PrecoItem := PrecoItem + Tabela.fieldbyname('despesasacessorias').AsFloat;
    end
    else
    begin
      PrecoItem := truncar(PrecoProduto *
                   Tabela.fieldbyname('quantidade').AsFloat +
                   Tabela.fieldbyname('frete').AsFloat +
                   Tabela.fieldbyname('seguro').AsFloat -
                   Tabela.fieldbyname('desconto').AsFloat,2);

      if Tabela.FindField('despesasacessorias') <> nil then
        PrecoItem := PrecoItem + Tabela.fieldbyname('despesasacessorias').AsFloat;

      if Tabela.FindField('iivalor') <> nil then
        PrecoItem := PrecoItem + Tabela.fieldbyname('iivalor').AsFloat;


      if Icmssobreipi[Tabela.FieldByName('natureza').Asinteger] then
      begin
         Produtos[QP-1].ICMSSobreIPI := true;
         PrecoItem := PrecoItem + Produtos[QP-1].IPIValor;
      end;

      if HeImportacao then
        {PrecoItem := PrecoItem /(1-tabela.FieldByName('aliquotaicms').AsCurrency/100);}
        PrecoItem := tabela.FieldByName('icmsbasecalculo').AsCurrency +
                     tabela.FieldByName('naotribicms').AsCurrency

    end;

    if ContribICMS or (Operacao = nfENTRADA) then
    begin
      Produtos[QP-1].CFOP     := Tabela.fieldbyname('codigofiscal').AsInteger;
      Produtos[QP-1].Natureza := Tabela.fieldbyname('natureza').AsInteger;
      Produtos[QP-1].ICMSAliquota := Tabela.fieldbyname('aliquotaicms').AsFloat;
      Produtos[QP-1].Incidencia   := Tabela.fieldbyname('incidencia').AsString;
      Produtos[QP-1].PrecoProduto := PrecoProduto * Tabela.fieldbyname('quantidade').AsCurrency;
      with Produtos[QP-1] do
      begin
        if (regimetributario = 1) then //SIMPLES
        begin
          ICMSOutras := PrecoItem;
          if (Operacao = nfSaida) and (Tabela.fieldbyname('incidencia').AsString = ctTRIBUTADASUBSTITUICAO) then
          begin
            if (PessoaTipo = 'J') and (not VendaConsumidorFinal)then
            begin
              ReFazConsulta(qryEstadosIPI,[0],[Tabela.fieldbyname('ipi').AsInteger]);
              if (qryEstadosIPI.Locate('estado',Estado,[])) then
              begin
                AliquotaICMSProprio := Tabela.FieldByName('AliquotaICMS').AsFloat/100;
                ICMSOutras := Truncar((((PrecoItem +
                                (PrecoItem * Frete    / TotalProdutos) +
                                (PrecoItem * Seguro   / TotalProdutos) +
                                (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                (PrecoItem * Desconto / TotalProdutos)) *
                                Tabela.FieldByName('fatorsubstituicao').AsFloat) * (Tabela.FieldByName('AliquotaICMSST').AsFloat/100)) -
                               ((PrecoItem +
                                (PrecoItem * Frete    / TotalProdutos) +
                                (PrecoItem * Seguro   / TotalProdutos) +
                                (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                (PrecoItem * Desconto / TotalProdutos)) *
                               AliquotaICMSProprio),2); //VALOR ICMS SUBSTITUICAO
              end;
            end;
          end;
        end
        else
        case StrToInt(Tabela.fieldbyname('incidencia').AsString) of
          00 : begin   // TRIBUTADA INTEGRALMENTE
                 ICMSBase     := PrecoItem;
                 ICMSValor    := ifthen(HeImportacao, tabela.FieldByName('icmsvalor').AsCurrency, truncar((ICMSBase * ICMSAliquota/100),2));
               end;
          10 : begin    // COBRANÇA POR SUBSTITUICAO TRIBUTARIA
                  ICMSBase  := PrecoItem;
                  if (PessoaTipo = 'J') and (not VendaConsumidorFinal)then
                  begin
                    ReFazConsulta(qryEstadosIPI,[0],[Tabela.fieldbyname('ipi').AsInteger]);
                    if (qryEstadosIPI.Locate('estado',Estado,[])) then
                    begin
                      AliquotaICMSProprio := Tabela.FieldByName('AliquotaICMS').AsFloat/100;
                      ICMSValor    := ifthen(HeImportacao, tabela.FieldByName('icmsvalor').AsCurrency, truncar((ICMSBase * ICMSAliquota/100),2));
                      ICMSOutras := Truncar((((PrecoItem +
                                      (PrecoItem * Frete    / TotalProdutos) +
                                      (PrecoItem * Seguro   / TotalProdutos) +
                                      (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                      (PrecoItem * Desconto / TotalProdutos)) *
                                      Tabela.FieldByName('fatorsubstituicao').AsFloat) * (Tabela.FieldByName('AliquotaICMSST').AsFloat/100)) -
                                     ((PrecoItem +
                                      (PrecoItem * Frete    / TotalProdutos) +
                                      (PrecoItem * Seguro   / TotalProdutos) +
                                      (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                      (PrecoItem * Desconto / TotalProdutos)) *
                                     AliquotaICMSProprio),2); //VALOR ICMS SUBSTITUICAO
                    end;
                  end;
{
                end}
               end;
          20 : begin   // REDUCAO DE BASE DE CALCULO
                 if ICMSAliquota = 0 then
                  ICMSIsentas := PrecoItem
                 else
                 begin
                   if not ECF then
                   begin
                     ICMSBase    := PrecoItem - ValorReducaoBase;
                     ICMSValor   := ifthen(HeImportacao, tabela.FieldByName('icmsvalor').AsCurrency, truncar((ICMSBase * ICMSAliquota/100),2));
                     ICMSIsentas := ValorReducaoBase;
                   end
                   else
                     ICMSBase    := PrecoItem;
                 end;
               end;
          30,          // ISENTA OU NAO TRIBUTADA COM SUBSTITUICAO
          40 : begin   // ISENTA
                  ICMSIsentas := PrecoItem;
               end;

          41,        // NAO TRIBUTADA
          50,        // COM SUSPENSAO DO ICMS
          51,        // DIFERIMENTO
          60 : begin // COBRADO ANTERIORMENTE POR SUBSTITUICAO TRIBUTARIA
                 ICMSOutras := PrecoItem;
               end;
          70 : begin  // REDUCAO DE BASE E COM SUBSTITUICAO TRIBUTARIA
                 if not ECF then
                 begin
                   ICMSIsentas := PrecoItem - ValorReducaoBase;
                   ICMSOutras  := ValorReducaoBase;
                 end
                 else
                   ICMSIsentas := PrecoItem;
               end;
        end;
        if Tabela.FindField('acrescimo') <> nil then
          ICMSIsentas := ICMSIsentas + Tabela.fieldbyname('acrescimo').AsFloat;
        if Operacao = nfSAIDA then
        begin
          if BaseICMS > 0 then
            ICMSOutras := ICMSOutras + BaseICMS;
        end
        else // nfENTRADA
        if (ValorICMSSubstituicao > 0) and  // USADO NO RATEIO DO VALOR DA SUBSTITUICAO TRIBUTARIA
           ((Tabela.FieldByName('incidencia').AsString = ctCOBRADOSUSTITUICAO)      or
            (Tabela.FieldByName('incidencia').AsString = ctREDUCAOBASESUBSTITUICAO) or
            (Tabela.FieldByName('incidencia').AsString = ctISENTASUBSTITUICAO)      or
            (Tabela.FieldByName('incidencia').AsString = ctTRIBUTADASUBSTITUICAO))  then
        begin
          SomaPrecoSubstituicao := SomaPrecoSubstituicao + Produtos[QP-1].PrecoProduto;
          Inc(QPS);
        end;
      end;
{
      Tabela.FieldByName('icmsbasecalculo').AsFloat := Produtos[QP-1].ICMSBase;
      Tabela.FieldByName('icmsvalor').AsFloat       := Produtos[QP-1].ICMSValor;
}
    end;
  end;

  procedure AdicionarCalculoServicos;
  var
    i: Integer;
  begin
    for i:=0 to QS-1 do  // GERA OS REGISTROS PARA ISS
    begin
      if not TabelaCalculo.IsEmpty and
         TabelaCalculo.Locate('tipo,aliquota,codigofiscal,codigonatureza',
           VarArrayOF(['S',
                       Servicos[i].ISSAliquota,
                       Servicos[i].CFOP,
                       Servicos[i].Natureza]),[]) then
      begin
        TabelaCalculo.Edit;
        TabelaCalculo.FieldByName('base').AsFloat    := TabelaCalculo.FieldByName('base').AsFloat    + Servicos[i].ISSBase;

        TabelaCalculo.FieldByName('outras').AsFloat  := TabelaCalculo.FieldByName('outras').AsFloat  + Servicos[i].ISSOutras;

        TabelaCalculo.FieldByName('isentas').AsFloat := TabelaCalculo.FieldByName('isentas').AsFloat + Servicos[i].ISSIsentas;
        TabelaCalculo.FieldByName('valor').AsFloat   := TabelaCalculo.FieldByName('valor').AsFloat   + Servicos[i].ISSValor;
      end
      else
      begin
        Inc(NC);
        TabelaCalculo.Append;
        case Operacao of
         nfENTRADA,nfDEVOLUCAO: TabelaCalculo.FieldByName('codigonota').AsInteger := DadoFiscal;
         nfSAIDA: TabelaCalculo.FieldByName('dadofiscal').AsInteger := DadoFiscal;
        end;
        TabelaCalculo.FieldByName('numero').AsInteger    := NC;
        TabelaCalculo.FieldByName('tipo').AsString       := 'S';
        TabelaCalculo.FieldByName('aliquota').AsFloat := Servicos[i].ISSAliquota;
        TabelaCalculo.FieldByName('base').AsFloat     := Servicos[i].ISSBase;
        TabelaCalculo.FieldByName('outras').AsFloat   := Servicos[i].ISSOutras;
        TabelaCalculo.FieldByName('isentas').AsFloat  := Servicos[i].ISSIsentas;
        TabelaCalculo.FieldByName('valor').AsFloat    := Servicos[i].ISSValor;
        TabelaCalculo.FieldByName('codigofiscal').Asinteger   := Servicos[i].CFOP;
        TabelaCalculo.FieldByName('codigonatureza').Asinteger := Servicos[i].Natureza;
      end;
      TabelaCalculo.Post;
    end;
  end;

  procedure CalcularAliquotasServico(Tabela: TtecQuery);
  begin
    Inc(QS);
    SetLength(Servicos,QS);
    Servicos[QS-1].CFOP     := Tabela.fieldbyname('codigofiscal').AsInteger;
    Servicos[QS-1].Natureza := Tabela.fieldbyname('natureza').AsInteger;
    Servicos[QS-1].ISSAliquota  := Tabela.fieldbyname('aliquotaissqn').AsFloat;
    if Servicos[QS-1].ISSAliquota = 0 then
      Servicos[QS-1].ISSIsentas := Tabela.fieldbyname('valorservico').AsFloat *
                                   Tabela.fieldbyname('quantidade').AsFloat
    else
      Servicos[QS-1].ISSBase    := Tabela.fieldbyname('valorservico').AsFloat *
                                   Tabela.fieldbyname('quantidade').AsFloat;
    Servicos[QS-1].ISSValor     := Tabela.fieldbyname('valorissqn').AsFloat;
  end;

  procedure AcertarValorOutras;
  var
    ICMSBase,
    IPIValor,
    ISSBase: Real;
  begin
    ICMSBase := 0; IPIValor := 0; ISSBase := 0;
    TabelaCalculo.First;
    while not TabelaCalculo.Eof do
    begin
      if TabelaCalculo.FieldByName('tipo').AsString = 'M' then
        ICMSBase := TabelaCalculo.FieldByName('base').AsFloat
      else
        if TabelaCalculo.FieldByName('tipo').AsString = 'P' then
          IPIValor := TabelaCalculo.FieldByName('valor').AsFloat
      else
        if TabelaCalculo.FieldByName('tipo').AsString = 'S' then
          ISSBase := TabelaCalculo.FieldByName('base').AsFloat;
      TabelaCalculo.Next;
    end;

    if TabelaCalculo.Locate('tipo','M',[]) then
      TabelaCalculo.FieldByName('outras').AsFloat := TabelaCalculo.FieldByName('outras').AsFloat +
                                                        ISSBase;
    if TabelaCalculo.Locate('tipo','P',[]) then
      TabelaCalculo.FieldByName('outras').AsFloat := TabelaCalculo.FieldByName('outras').AsFloat +
                                                        ISSBase;
    if TabelaCalculo.Locate('tipo','S',[]) then
      TabelaCalculo.FieldByName('outras').AsFloat := TabelaCalculo.FieldByName('outras').AsFloat +
                                                        ICMSBase + IPIValor;
    TabelaCalculo.First;
    while not TabelaCalculo.Eof do
    begin
      TabelaCalculo.FieldByName('base').AsFloat    := ROUNDTO(TabelaCalculo.FieldByName('base').AsFloat,-2);
      TabelaCalculo.FieldByName('outras').AsFloat  := ROUNDTO(TabelaCalculo.FieldByName('outras').AsFloat,-2);
      TabelaCalculo.FieldByName('isentas').AsFloat := ROUNDTO(TabelaCalculo.FieldByName('isentas').AsFloat,-2);
      TabelaCalculo.FieldByName('valor').AsFloat   := ROUNDTO(TabelaCalculo.FieldByName('valor').AsFloat,-2);

      TabelaCalculo.Next;
    end;
  end;

  procedure AdicionarCalculosIsentos;
  begin
    if contribicms then
    begin
      TabelaCalculo.Append;
      case Operacao of
       nfENTRADA, nfDEVOLUCAO: TabelaCalculo.FieldByName('codigonota').AsInteger := Dadofiscal;
       nfSAIDA: TabelaCalculo.FieldByName('dadofiscal').AsInteger := Dadofiscal;
      end;
      TabelaCalculo.FieldByName('numero').AsInteger  := 1;
      TabelaCalculo.FieldByName('tipo').AsString     := 'M';
      TabelaCalculo.FieldByName('aliquota').AsFloat  := 0;
      TabelaCalculo.FieldByName('base').AsFloat      := 0;
      TabelaCalculo.FieldByName('isentas').AsFloat   := truncar(ValorTotalNota,2);
      TabelaCalculo.FieldByName('outras').AsFloat    := 0;
      TabelaCalculo.FieldByName('valor').AsFloat     := 0;
      TabelaCalculo.FieldByName('codigofiscal').Asinteger := CodigoFiscal;
      TabelaCalculo.FieldByName('codigonatureza').Asinteger := CodigoNatureza;
      TabelaCalculo.Post;
    end;

    if not ECF and contribipi then
    begin
      TabelaCalculo.Append;
      case Operacao of
       nfENTRADA,nfDEVOLUCAO: TabelaCalculo.FieldByName('codigonota').AsInteger := Dadofiscal;
       nfSAIDA: TabelaCalculo.FieldByName('dadofiscal').AsInteger := Dadofiscal;
      end;
      TabelaCalculo.FieldByName('numero').AsInteger  := 2;
      TabelaCalculo.FieldByName('tipo').AsString     := 'P';
      TabelaCalculo.FieldByName('aliquota').AsFloat  := 0;
      TabelaCalculo.FieldByName('base').AsFloat      := 0;
      TabelaCalculo.FieldByName('isentas').AsFloat   := truncar(ValorTotalNota,2);
      TabelaCalculo.FieldByName('outras').AsFloat    := 0;
      TabelaCalculo.FieldByName('valor').AsFloat     := 0;
      TabelaCalculo.FieldByName('codigofiscal').Asinteger := CodigoFiscal;
      TabelaCalculo.FieldByName('codigonatureza').Asinteger := CodigoNatureza;
      TabelaCalculo.Post;
    end;

  end;


begin
  QP := 0;  QS := 0;  NC := 0;  QPS := 0;
  SomaPrecoSubstituicao := 0;  RateioICMSSubstituicao := ValorICMSSubstituicao;
//  TotalDescontoFinanceiro := 0;
  case Operacao of
   nfENTRADA, nfDEVOLUCAO:
   begin
     TabelaCalculo := qryCalculosNotasPag;
     qrycalculosnotaspag.AfterPost := nil;
   end;
   nfSAIDA  : TabelaCalculo := qryCalculosDadosFiscais;
  end;

  ExistemItens := false;
  if qryProdutosDadosFiscais<>nil then
    ExistemItens := qryProdutosDadosFiscais.RecordCount<>0;

  if not ExistemItens then
    if qryProdutosDadosFiscaisCompostos<>nil then
      ExistemItens := qryProdutosDadosFiscaisCompostos.RecordCount<>0;

  if not ExistemItens then
    if qryServicosDadosFiscais<>nil then
      ExistemItens := qryServicosDadosFiscais.RecordCount<>0;

  if ExistemItens then
  begin

    Produtos := nil;

    if qryProdutosDadosFiscais <> nil then
    begin
      GuardarRegistroAtual(qryProdutosDadosFiscais,True);
      try
        qryProdutosDadosFiscais.First;
        while Not qryProdutosDadosFiscais.Eof do
        begin
          if ((Operacao = nfSAIDA) and
              (qryProdutosDadosFiscais.fieldbyname('dadofiscal').AsInteger = DadoFiscal))
              or
              ((Operacao in [nfENTRADA,nfDEVOLUCAO]) and
               (qryProdutosDadosFiscais.fieldbyname('codigonota').AsInteger = DadoFiscal)) then
          begin
            if (qryProdutosDadosFiscaisCompostos <> nil) and
               (qryProdutosDadosFiscais.fieldbyname('composto').AsBoolean) and
               (((qryProdutosDadosFiscais.fieldbyname('discriminarcomposto').AsString = 'C')
                 and qryProdutosDadosFiscais.fieldbyname('discriminarpreco').AsBoolean
                ) or
                (qryProdutosDadosFiscais.fieldbyname('discriminarcomposto').AsString = 'S')
               ) then
            begin
              if qryProdutosDadosFiscaisCompostos <> nil then
              begin
//                GuardarRegistroAtual(qryProdutosDadosFiscaisCompostos,True);
//                try
                  qryProdutosDadosFiscaisCompostos.First;
                  while not qryProdutosDadosFiscaisCompostos.Eof do
                  begin
                    if (qryProdutosDadosFiscaisCompostos.fieldbyname('dadofiscal').AsInteger =
                        qryProdutosDadosFiscais.fieldbyname('dadofiscal').AsInteger)           and
                       (qryProdutosDadosFiscaisCompostos.fieldbyname('composto').AsString =
                        qryProdutosDadosFiscais.fieldbyname('produto').AsString)               then
                      CalcularAliquotasProduto(qryProdutosDadosFiscaisCompostos);
                    qryProdutosDadosFiscaisCompostos.Next;
                  end;
//                finally
//                  VoltarRegistroAtual(qryProdutosDadosFiscaisCompostos);
//                end;
              end;
            end
            else
              CalcularAliquotasProduto(qryProdutosDadosFiscais);
          end;
          qryProdutosDadosFiscais.Next;
        end;
      finally
        VoltarRegistroAtual(qryProdutosDadosFiscais);
      end;
      AdicionarCalculoProdutos;
    end;

    if qryServicosDadosFiscais <> nil then
    begin
      GuardarRegistroAtual(qryServicosDadosFiscais,True);
      try
        qryServicosDadosFiscais.First;
        while Not qryServicosDadosFiscais.Eof do
        begin
          if qryServicosDadosFiscais.fieldbyname('dadofiscal').AsInteger = DadoFiscal then
            CalcularAliquotasServico(qryServicosDadosFiscais);
          qryServicosDadosFiscais.Next
        end;
      finally
        VoltarRegistroAtual(qryServicosDadosFiscais);
      end;
      AdicionarCalculoServicos;
    end;

    AcertarValorOutras;
  end
  else
    AdicionarCalculosIsentos;


  case Operacao of
   nfENTRADA, nfDEVOLUCAO:
     CalcularTotalImpostos(operacao,
     (codigofiscal - (codigofiscal mod 1000) = 3000) and contribipi //forçar fechamento de ipi qdo Importação
     , ValorTotalNota);
  end;

end;

procedure TdtmGerarNotaFiscal.qryCalculosNotasPagNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCalculosNotasPagnumero.AsInteger := NroUltimoImposto + 1;
end;

procedure TdtmGerarNotaFiscal.qryCalculosDadosFiscaisNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCalculosDadosFiscaisnumero.AsInteger := NroUltimoImposto + 1;
  if assigned(CodigoFiscal) then
    qryCalculosDadosFiscaiscodigofiscal.AsInteger := CodigoFiscal;
    
  if assigned(CodigoNatureza) then
  qryCalculosDadosFiscaiscodigonatureza.AsInteger := CodigoNatureza;
end;

procedure TdtmGerarNotaFiscal.qryCalculosDadosFiscaisCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qryCalculosDadosFiscaistipo.AsString = 'M') or
     (qryCalculosDadosFiscaistipo.AsString = 'S') then
    qryCalculosDadosFiscaisTotal.AsFloat := qryCalculosDadosFiscaisbase.AsFloat +
                                           qryCalculosDadosFiscaisisentas.AsFloat +
                                           qryCalculosDadosFiscaisoutras.AsFloat
  else
  if (qryCalculosDadosFiscaistipo.AsString = 'P') then
    qryCalculosDadosFiscaisTotal.AsFloat := qryCalculosDadosFiscaisbase.AsFloat +
                                           qryCalculosDadosFiscaisisentas.AsFloat +
                                           qryCalculosDadosFiscaisoutras.AsFloat +
                                           qryCalculosDadosFiscaisvalor.AsFloat;
end;

procedure TdtmGerarNotaFiscal.qryCalculosNotasPagCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qryCalculosNotasPagtipo.AsString = 'M') or
     (qryCalculosNotasPagtipo.AsString = 'S') then
    qryCalculosNotasPagTotal.AsFloat := qryCalculosNotasPagbase.AsFloat +
                                           qryCalculosNotasPagisentas.AsFloat +
                                           qryCalculosNotasPagoutras.AsFloat
  else
  if (qryCalculosNotasPagtipo.AsString = 'P') then
    qryCalculosNotasPagTotal.AsFloat := qryCalculosNotasPagbase.AsFloat +
                                           qryCalculosNotasPagisentas.AsFloat +
                                           qryCalculosNotasPagoutras.AsFloat +
                                           qryCalculosNotasPagvalor.AsFloat;
end;

procedure TdtmGerarNotaFiscal.qryCalculosNotasPagBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryCalculosNotasPag.Last;
  NroUltimoImposto := qryCalculosNotasPagnumero.AsInteger;
end;

procedure TdtmGerarNotaFiscal.qryCalculosDadosFiscaisBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryCalculosDadosFiscais.Last;
  NroUltimoImposto := qryCalculosDadosFiscaisnumero.AsInteger;
end;

procedure TdtmGerarNotaFiscal.qryCalculosDadosFiscaistipoChange(
  Sender: TField);
begin
  inherited;
  if qryCalculosDadosFiscaistipo.AsString = 'M' then
    qryCalculosDadosFiscaisnomeimposto.AsString := 'ICMS'
  else if qryCalculosDadosFiscaistipo.AsString = 'P' then
    qryCalculosDadosFiscaisnomeimposto.AsString := 'IPI'
  else if qryCalculosDadosFiscaistipo.AsString = 'S' then
    qryCalculosDadosFiscaisnomeimposto.AsString := 'ISS'
end;

procedure TdtmGerarNotaFiscal.qryCalculosNotasPagtipoChange(
  Sender: TField);
begin
  inherited;
  if qryCalculosNotasPagtipo.AsString = 'M' then
    qryCalculosNotasPagnomeimposto.AsString := 'ICMS'
  else if qryCalculosNotasPagtipo.AsString = 'P' then
    qryCalculosNotasPagnomeimposto.AsString := 'IPI'
  else if qryCalculosNotasPagtipo.AsString = 'S' then
    qryCalculosNotasPagnomeimposto.AsString := 'ISS'
end;

function TdtmGerarNotaFiscal.TipoNotaSaida(
  codfiscal: integer): TtecTipoNotaSaida;
begin
  codfiscal := codfiscal mod 1000;
  if (codfiscal = ctCFOTRANSFERENCIA_150) or
     (codfiscal = ctCFOTRANSFERENCIA_151) or
     (codfiscal = ctCFOTRANSFERENCIA_152) or
     (CodFiscal = ctCFOTRANSFERENCIANAOTRANS) or
     (CodFiscal = ctCFOTRANSFERENCIASUBSTITUICAO)
  then
    Result := tnsTRANSFERENCIA
  else if (CodFiscal = ctCFOTRANSFERENCIACREDITOICMS) or (CodFiscal = ctCFOTRANSFERENCIASALDOCREDORICMS) or
          (CodFiscal = ctCFOTRANSFERENCIASALDODEVEDORICMS)
  then
    Result := tnsTRANSFERENCIAICMS
  else if (CodFiscal = ctCFODEVOLUCAOSUBSTITUICAO) then
    result := tnsDEVOLUCAOFORNECEDORST
  else if (CodFiscal = ctDEVOLUCAO) then
    result := tnsDEVOLUCAOFORNECEDOR
  else
    Result := tnsNORMAL
end;


procedure TdtmGerarNotaFiscal.qryCalculosDadosFiscaisFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if assigned(ChaveNotas) then
    Accept := qryCalculosDadosFiscaisdadofiscal.AsInteger = ChaveNotas;
end;


function TdtmGerarNotaFiscal.GetICMSSobreIPI(natureza: integer): boolean;
begin
  if qryNaturezas.RecordCount > 0 then
  begin
    if qryNaturezascodigo.AsInteger <> natureza then
      RefazConsultaPorNome(qrynaturezas, ['natureza'], [natureza]);
  end
  else
    RefazConsultaPorNome(qrynaturezas, ['natureza'], [natureza]);

  result := qryNaturezasicmssobreipi.AsBoolean;
end;

procedure TdtmGerarNotaFiscal.CalcularTotalImpostos(
  Operacao: TipoNotaFiscal; ForcarFechamentoIPI: Boolean = false; TotaldaNota : Currency = 0.00);
var
  Tipo: String;
  TotalNota, TotalFechamentoIPI, TotalNovoFechamentoIPI, TotalBaseIPI, diferenca: Currency;
  vEOF: Boolean;
begin
  if Operacao = nfENTRADA then
  begin
    qrycalculosnotaspag.AfterPost := nil;
//    qryCalculosNotasPag.SortByField('tipo,aliquota,codigofiscal');
    TotalNota := 0;
    TotalBaseIPI := 0;
    TotalFechamentoIPI := 0;

    qrycalculosnotaspag.first;
    tipo := qryCalculosNotasPagtipo.AsString;
    while not qryCalculosNotasPag.Eof do
    begin
      if qryCalculosNotasPagtipo.AsString = 'M' then
        TotalNota := TotalNota + (qryCalculosNotasPagbase.AsCurrency + qryCalculosNotasPagisentas.AsCurrency + qryCalculosNotasPagoutras.AsCurrency)
      else
        if qryCalculosNotasPagtipo.AsString = 'P' then
        begin
          TotalNota := TotalNota + (qryCalculosNotasPagbase.AsCurrency +
                                    qryCalculosNotasPagisentas.AsCurrency +
                                    qryCalculosNotasPagoutras.AsCurrency +
                                    qryCalculosNotasPagvalor.AsCurrency);
          TotalFechamentoIPI := TotalNota;
          TotalBaseIPI := TotalBaseIPI + qryCalculosNotasPagbase.AsCurrency;
        end;
      qryCalculosNotasPag.Edit;
      qryCalculosNotasPagtotaltipo.Clear;
      qryCalculosNotasPag.Next;

      vEOF := qryCalculosNotasPag.Eof;

      if (qryCalculosNotasPagtipo.AsString <> tipo) or vEOF then
      begin
        if not qryCalculosNotasPag.Eof then
          qryCalculosNotasPag.Prior;

        qryCalculosNotasPag.Edit;
        qryCalculosNotasPagtotaltipo.AsCurrency := TotalNota;
        qryCalculosNotasPag.Post;

        Totalnota := 0;
        if not vEof then
          qryCalculosNotasPag.next
        else
          break;
        tipo := qryCalculosNotasPagtipo.AsString;
      end;
    end;
    qrycalculosnotaspag.AfterPost := qrycalculosnotaspagAfterPost;
  end;


  if forcarfechamentoIPI then
  begin
    qrycalculosnotaspag.AfterPost := nil;
    diferenca := TotaldaNota - TotalFechamentoIPI;
    TotalNovoFechamentoIPI := 0;
    if diferenca <> 0 then
    begin
      qryCalculosNotasPag.First;
      while not qrycalculosnotaspag.Eof do
      begin
        if qryCalculosNotasPagtipo.AsString = 'P' then
        begin
          if qryCalculosNotasPagtotaltipo.AsCurrency<>0 then  // este é o último registro do tipi 'P'
          begin
            qryCalculosNotasPag.Edit;

            if TotalNovoFechamentoIPI = 0 then  // neste caso possui somente 1 do tipo 'P'
              qryCalculosNotasPagbase.AsCurrency := qryCalculosNotasPagbase.AsCurrency +  diferenca
            else
              qryCalculosNotasPagbase.AsCurrency := qryCalculosNotasPagbase.AsCurrency +
                                                    (TotaldaNota -
                                                     (TotalNovoFechamentoIPI + qryCalculosNotasPagbase.AsCurrency +
                                                                                qryCalculosNotasPagisentas.AsCurrency +
                                                                                qryCalculosNotasPagoutras.AsCurrency +
                                                                                qryCalculosNotasPagvalor.AsCurrency));
            qryCalculosNotasPagtotaltipo.AsCurrency := Totaldanota;                                                                                

            qrycalculosnotaspag.Post;
          end
          else
          begin
            qryCalculosNotasPag.Edit;
            qryCalculosNotasPagbase.AsCurrency := qryCalculosNotasPagbase.AsCurrency + truncar(qryCalculosNotasPagbase.AsCurrency * diferenca / TotalFechamentoIPI,2);
            qrycalculosnotaspag.Post;

            TotalNovoFechamentoIPI := TotalNovoFechamentoIPI + (qryCalculosNotasPagbase.AsCurrency +
                                      qryCalculosNotasPagisentas.AsCurrency +
                                      qryCalculosNotasPagoutras.AsCurrency +
                                      qryCalculosNotasPagvalor.AsCurrency);
          end;
          qrycalculosnotaspag.Next;

        end
        else
          qrycalculosnotaspag.Next;

      end
    end;
    qrycalculosnotaspag.AfterPost := qrycalculosnotaspagAfterPost;
  end;
end;

procedure TdtmGerarNotaFiscal.qryCalculosNotasPagAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  CalcularTotalImpostos(nfENTRADA);
end;


end.



