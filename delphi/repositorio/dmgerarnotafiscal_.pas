unit dmgerarnotafiscal;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  ctconstantes, Variants, biblio, clparametrossistema;
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
    procedure qryCalculosNotasPagNewRecord(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisNewRecord(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisCalcFields(DataSet: TDataSet);
    procedure qryCalculosNotasPagCalcFields(DataSet: TDataSet);
    procedure qryCalculosNotasPagBeforeInsert(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaisBeforeInsert(DataSet: TDataSet);
    procedure qryCalculosDadosFiscaistipoChange(Sender: TField);
    procedure qryCalculosNotasPagtipoChange(Sender: TField);
  private
    NroUltimoImposto : integer;
    { Private declarations }
  public
    procedure AtribuirValoresImpostos(Operacao: TipoNotaFiscal; var ValorBaseICMS, ValorICMS, ValorIPI, ValorISS: Real);
    procedure CalcularDadosFiscais(Operacao: TipoNotaFiscal;
                                 DadoFiscal,
                                 CodigoFiscal: integer;
                                 Frete, ICMSFrete: Real;  RatearFrete: Boolean;
                                 Seguro, ICMSSeguro: Real; RatearSeguro: Boolean;
                                 DespesasAcessorias,
                                 Desconto,
                                 Acrescimo,
                                 ValorTotalNota,
                                 TotalProdutos: Real;
                                 qryProdutosDadosFiscais,
                                 qryProdutosDadosFiscaisCompostos,
                                 qryServicosDadosFiscais : TtecQuery;
                                 IncluirServico,
                                 ECF,
                                 CreditarICMS: Boolean;
                                 Estado,
                                 PessoaTipo: String;
                                 ValorICMSSubstituicao: Real;
                                 VendaConsumidorFinal: Boolean;
                                 IPISuspenso: Boolean = False);
    { Public declarations }
  end;

var
  dtmGerarNotaFiscal: TdtmGerarNotaFiscal;

implementation

{$R *.dfm}

{ TdtmGerarNotaFiscal }

procedure TdtmGerarNotaFiscal.AtribuirValoresImpostos(
  Operacao: TipoNotaFiscal; var ValorBaseICMS, ValorICMS, ValorIPI,
  ValorISS: Real);
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
  Operacao: TipoNotaFiscal; DadoFiscal, CodigoFiscal: integer; Frete,
  ICMSFrete: Real; RatearFrete: Boolean; Seguro, ICMSSeguro: Real;
  RatearSeguro: Boolean; DespesasAcessorias, Desconto, Acrescimo,
  ValorTotalNota, TotalProdutos: Real; qryProdutosDadosFiscais,
  qryProdutosDadosFiscaisCompostos, qryServicosDadosFiscais: TtecQuery;
  IncluirServico, ECF, CreditarICMS: Boolean; Estado, PessoaTipo: String;
  ValorICMSSubstituicao: Real; VendaConsumidorFinal,
  IPISuspenso: Boolean);

var
  QP, QS, NC: Integer;
  TabelaCalculo: TTecQuery;
  AliquotaICMSProprio,
  TotalDescontoFinanceiro : Real;

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
    IPIOutras: Real;
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
          TabelaCalculo.FieldByName('outras').AsFloat  := TabelaCalculo.FieldByName('outras').AsFloat  + Produtos[i].ICMSOutras + Produtos[i].IPIValor;
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
          TabelaCalculo.FieldByName('numero').AsInteger    := NC;
          TabelaCalculo.FieldByName('tipo').AsString       := 'M';
          TabelaCalculo.FieldByName('aliquota').AsFloat := Produtos[i].ICMSAliquota;
          TabelaCalculo.FieldByName('base').AsFloat     := Produtos[i].ICMSBase;
          TabelaCalculo.FieldByName('outras').AsFloat   := Produtos[i].ICMSOutras + Produtos[i].IPIValor;
          TabelaCalculo.FieldByName('isentas').AsFloat  := Produtos[i].ICMSIsentas;
          TabelaCalculo.FieldByName('valor').AsFloat    := Produtos[i].ICMSValor;
          TabelaCalculo.FieldByName('codigofiscal').Asinteger := Produtos[i].CFOP;
          TabelaCalculo.FieldByName('codigonatureza').Asinteger := Produtos[i].Natureza;
        end;
        TabelaCalculo.Post;
      end;

    if contribipi then
      for i:=0 to QP-1 do  // GERA OS REGISTROS PARA IPI
      begin
        if not TabelaCalculo.IsEmpty and
           TabelaCalculo.Locate('tipo,aliquota,codigofiscal,codigonatureza',
             VarArrayOF(['P',
                         Produtos[i].ICMSAliquota,
                         Produtos[i].CFOP,
                         Produtos[i].Natureza]),[]) then
        begin
          TabelaCalculo.Edit;
          TabelaCalculo.FieldByName('base').AsFloat    := TabelaCalculo.FieldByName('base').AsFloat    + Produtos[i].IPIBase;
          TabelaCalculo.FieldByName('outras').AsFloat  := TabelaCalculo.FieldByName('outras').AsFloat  + Produtos[i].IPIOutras;
          TabelaCalculo.FieldByName('isentas').AsFloat := TabelaCalculo.FieldByName('isentas').AsFloat + Produtos[i].IPIIsentas;
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
          TabelaCalculo.FieldByName('numero').AsInteger    := NC;
          TabelaCalculo.FieldByName('tipo').AsString       := 'P';
          TabelaCalculo.FieldByName('aliquota').AsFloat := Produtos[i].IPIAliquota;
          TabelaCalculo.FieldByName('base').AsFloat     := Produtos[i].IPIBase;
          TabelaCalculo.FieldByName('outras').AsFloat   := Produtos[i].IPIOutras;
          TabelaCalculo.FieldByName('isentas').AsFloat  := Produtos[i].IPIIsentas;
          TabelaCalculo.FieldByName('valor').AsFloat    := Produtos[i].IPIValor;
          TabelaCalculo.FieldByName('codigofiscal').Asinteger := Produtos[i].CFOP;
          TabelaCalculo.FieldByName('codigonatureza').Asinteger := Produtos[i].Natureza;
        end;
        TabelaCalculo.Post;
      end;
  end;

  procedure CalcularAliquotasProduto(Tabela: TtecQuery);
  var
    PrecoProduto,
    PrecoItem,
    ValorReducaoBase: Real;
    DescontoRateadoItem : Real;
  begin
    DescontoRateadoItem := 0;

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
      PrecoItem := (PrecoProduto *
                    Tabela.fieldbyname('quantidade').AsFloat) -
                   Tabela.fieldbyname('valordescontoitem').AsFloat;

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
    end
    else
      PrecoItem := PrecoProduto *
                   Tabela.fieldbyname('quantidade').AsFloat;

    Inc(QP);
    SetLength(Produtos,QP);

    if not ECF and (ContribIPI or (Operacao = nfENTRADA)) then
    begin
      Produtos[QP-1].CFOP     := Tabela.fieldbyname('codigofiscal').AsInteger;
      Produtos[QP-1].Natureza := Tabela.fieldbyname('natureza').AsInteger;

      Produtos[QP-1].IPIAliquota := Tabela.fieldbyname('aliquotaipi').AsFloat;
      if (Tabela.fieldbyname('ipicst').AsString = '00') or
         (Tabela.fieldbyname('ipicst').AsString = '50') or
         (Tabela.fieldbyname('ipicst').AsString = '51') then
      begin
        Produtos[QP-1].IPIBase  := Truncar(PrecoItem,2);
        Produtos[QP-1].IPIValor := Truncar(PrecoItem * Tabela.fieldbyname('aliquotaipi').AsFloat/100,2);
      end
      else
      if (Tabela.fieldbyname('ipicst').AsString = '52') or
         (Tabela.fieldbyname('ipicst').AsString = '53') then
        Produtos[QP-1].IPIIsentas := Truncar(PrecoItem,2)
      else {if (Tabela.fieldbyname('ipicst').AsString = '54') or
              (Tabela.fieldbyname('ipicst').AsString = '55') then }
        Produtos[QP-1].IPIOutras  := Truncar(PrecoItem,2);
{
      Tabela.FieldByName('ipibasecalculo').AsFloat := Produtos[QP-1].IPIBase;
      Tabela.FieldByName('valoripi').AsFloat       := Produtos[QP-1].IPIValor;
}
    end;

    if ContribICMS or (Operacao = nfENTRADA) then
    begin
      Produtos[QP-1].CFOP     := Tabela.fieldbyname('codigofiscal').AsInteger;
      Produtos[QP-1].Natureza := Tabela.fieldbyname('natureza').AsInteger;
      Produtos[QP-1].ICMSAliquota := Tabela.fieldbyname('aliquotaicms').AsFloat;
      with Produtos[QP-1] do
      begin
        case StrToInt(Tabela.fieldbyname('incidencia').AsString) of
          00 : begin   // TRIBUTADA INTEGRALMENTE
                 ICMSBase     := Truncar(PrecoItem,2);
                 ICMSValor    := Truncar(ICMSBase * ICMSAliquota/100,2);
               end;
          10 : begin    // COBRANÇA POR SUBSTITUICAO TRIBUTARIA
{
                 if (OptanteSimples <> 'N') then      //SIMPLES
                 begin
                  if ICMSAliquota = 0 then
                    ICMSIsentas := Truncar(PrecoItem,2)
                  else
                    ICMSOutras  := Truncar(PrecoItem,2);

                  if (PessoaTipo = 'J') and (not VendaConsumidorFinal) then
                  begin
                    ReFazConsulta(qryEstadosIPI,[0],[Tabela.fieldbyname('ipi').AsInteger]);
                    if (qryEstadosIPI.Locate('estado',Estado,[])) then
                    begin
                      if Estado = EstadoFilialBase then
                        AliquotaICMSProprio := ParSistema.ICMSaDestacarDentroEstado
                      else
                        AliquotaICMSProprio := ParSistema.ICMSaDestacarForaEstado;
                      {
                      FreteRateadoItem    := PrecoItem * Frete    / TotalProdutos;
                      SeguroRateadoItem   := PrecoItem * Seguro   / TotalProdutos;
                      DescontoRateadoItem := PrecoItem * Desconto / TotalProdutos;
                      DespesaRateadaItem  := PrecoItem * DespesasAcessorias / TotalProdutos;
                      }
{
                      if (OptanteSimples <> 'N') then      //SIMPLES
                        ICMSOutras := Truncar((((PrecoItem +
                                                (PrecoItem * Frete    / TotalProdutos) +
                                                (PrecoItem * Seguro   / TotalProdutos) +
                                                (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                                (PrecoItem * Desconto / TotalProdutos)) *
                                                Tabela.FieldByName('fatorsubstituicao').AsFloat) * 0.25) -
                                               ((PrecoItem +
                                                (PrecoItem * Frete    / TotalProdutos) +
                                                (PrecoItem * Seguro   / TotalProdutos) +
                                                (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                                (PrecoItem * Desconto / TotalProdutos)) *
                                               AliquotaICMSProprio),2) //VALOR ICMS SUBSTITUICAO
                      else
                        ICMSBase := Truncar((((PrecoItem +
                                              (PrecoItem * Frete    / TotalProdutos) +
                                              (PrecoItem * Seguro   / TotalProdutos) +
                                              (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                              (PrecoItem * Desconto / TotalProdutos)) *
                                              Tabela.FieldByName('fatorsubstituicao').AsFloat) * 0.25) -
                                             ((PrecoItem +
                                              (PrecoItem * Frete    / TotalProdutos) +
                                              (PrecoItem * Seguro   / TotalProdutos) +
                                              (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                              (PrecoItem * Desconto / TotalProdutos)) *
                                             AliquotaICMSProprio),2) //VALOR ICMS SUBSTITUICAO
                    end
                  end
                end
                else
                begin
}
                  if ICMSAliquota = 0 then
                    ICMSIsentas := Truncar(PrecoItem,2)
                  else
                    ICMSOutras  := Truncar(PrecoItem,2);

                  if (PessoaTipo = 'J') and (not VendaConsumidorFinal)then
                  begin
                    ReFazConsulta(qryEstadosIPI,[0],[Tabela.fieldbyname('ipi').AsInteger]);
                    if (qryEstadosIPI.Locate('estado',Estado,[])) then
                    begin
                      if Estado = EstadoFilialBase then
                        AliquotaICMSProprio := ParSistema.ICMSaDestacarDentroEstado
                      else
                        AliquotaICMSProprio := ParSistema.ICMSaDestacarForaEstado;
                      {
                      FreteRateadoItem    := PrecoItem * Frete    / TotalProdutos;
                      SeguroRateadoItem   := PrecoItem * Seguro   / TotalProdutos;
                      DescontoRateadoItem := PrecoItem * Desconto / TotalProdutos;
                      DespesaRateadaItem  := PrecoItem * DespesasAcessorias / TotalProdutos;
                      }
                      ICMSOutras := Truncar((((PrecoItem +
                                              (PrecoItem * Frete    / TotalProdutos) +
                                              (PrecoItem * Seguro   / TotalProdutos) +
                                              (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                              (PrecoItem * Desconto / TotalProdutos)) *
                                              Tabela.FieldByName('fatorsubstituicao').AsFloat) * 0.25) -
                                             ((PrecoItem +
                                              (PrecoItem * Frete    / TotalProdutos) +
                                              (PrecoItem * Seguro   / TotalProdutos) +
                                              (PrecoItem * DespesasAcessorias / TotalProdutos) -
                                              (PrecoItem * Desconto / TotalProdutos)) *
                                             AliquotaICMSProprio),2); //VALOR ICMS SUBSTITUICAO
                      if ICMSAliquota = 0 then
                        ICMSIsentas := Truncar(PrecoItem,2)
                      else
                        ICMSBase    := Truncar(PrecoItem,2);
                    end;
                  end;
{
                end}
               end;
          20 : begin   // REDUCAO DE BASE DE CALCULO
                 if ICMSAliquota = 0 then
                  ICMSIsentas := Truncar(PrecoItem,2)
                 else
                 begin
                   if not ECF then
                   begin
                     ICMSBase    := Truncar(PrecoItem - ValorReducaoBase,2);
                     ICMSIsentas := Truncar(ValorReducaoBase,2);
                   end
                   else
                     ICMSBase    := Truncar(PrecoItem,2);
                 end;
               end;
          30,          // ISENTA OU NAO TRIBUTADA COM SUBSTITUICAO
          40,          // ISENTA
          41 :  begin  // NAO TRIBUTADA
                  ICMSIsentas := Truncar(PrecoItem,2);
                end;
          50,        // COM SUSPENSAO DO ICMS
          51,        // DIFERIMENTO
          60 : begin // COBRADO ANTERIORMENTE POR SUBSTITUICAO TRIBUTARIA
                 ICMSOutras := Truncar(PrecoItem,2);
               end;
          70 : begin  // REDUCAO DE BASE E COM SUBSTITUICAO TRIBUTARIA
                 if not ECF then
                 begin
                   ICMSIsentas := Truncar(PrecoItem - ValorReducaoBase,2);
                   ICMSOutras  := Truncar(ValorReducaoBase,2);
                 end
                 else
                   ICMSIsentas := Truncar(PrecoItem,2);
               end;
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
    Servicos[QS-1].ISSAliquota  := Tabela.fieldbyname('aliquotaissqn').AsFloat;
    if Servicos[QS-1].ISSAliquota = 0 then
      Servicos[QS-1].ISSIsentas := Truncar(Tabela.fieldbyname('valorservico').AsFloat *
                                           Tabela.fieldbyname('quantidade').AsFloat,2)
    else
      Servicos[QS-1].ISSBase    := Truncar(Tabela.fieldbyname('valorservico').AsFloat *
                                           Tabela.fieldbyname('quantidade').AsFloat,2);
    Servicos[QS-1].ISSValor     := Truncar(Tabela.fieldbyname('valorissqn').AsFloat,2);
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
  end;

begin
  QP := 0;  QS := 0;  NC := 0;
  TotalDescontoFinanceiro := 0;
  case Operacao of
   nfENTRADA,nfDEVOLUCAO: TabelaCalculo := qryCalculosNotasPag;
   nfSAIDA  : TabelaCalculo := qryCalculosDadosFiscais;
  end;

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
              GuardarRegistroAtual(qryProdutosDadosFiscaisCompostos,True);
              try
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
              finally
                VoltarRegistroAtual(qryProdutosDadosFiscaisCompostos);
              end;
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

end.



