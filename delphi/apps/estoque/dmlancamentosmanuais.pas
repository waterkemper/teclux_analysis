unit dmlancamentosmanuais;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Constantes
  ctconstantes, biblio, clusuario,
  // Componentes
  cpdatasource, cpquery,
  // Repositorio
  dmbasico, dmtecsoft, clparametrossistema, ZTransact;

type
  TdtmLancamentosManuais = class(TdtmBasico)
    qryMovimentosAnteriores: TtecQuery;

    qryMovimentosAnterioresemestoque: TFloatField;
    qryMovimentosAnterioresreservado: TFloatField;
    qryMovimentosAnteriorestransito: TFloatField;
    qryMovimentosAnterioresdemonstracao: TFloatField;
    qryMovimentosAnterioresfuturo: TFloatField;
    qryMovimentosAnterioresdanificada: TFloatField;
    qryMovimentosAnterioresconserto: TFloatField;
    qryMovimentosAnterioresquantidade: TFloatField;


    qryMovimentosAnterioresfinanceiro: TFloatField;
    dsrMovimentosAnteriores: TtecDataSource;
    dsrMovimentos: TtecDataSource;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentosdata: TDateField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentosvalor: TFloatField;
    qryMovimentosreferencia: TStringField;
    qryExisteEstoque: TtecQuery;
    qryProcuraFiliais: TtecQuery;
    qryProcuraTiposMovimentos: TtecQuery;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryProcuraTiposMovimentoscodigo: TStringField;
    dsrProcuraFiliais: TtecDataSource;
    dsrProcuraTiposMovimentos: TtecDataSource;
    qryConsultaTiposMovimentos: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaTiposMovimentoscodigo: TStringField;
    qryConsultaTiposMovimentosdescricao: TStringField;
    qryMovimentosAnterioresdata: TDateField;
    qryMovimentosAnteriorestipomovimento: TStringField;
    qryMovimentosAnterioresreferencia: TStringField;

    qryMovimentosAnterioresvalor: TFloatField;
    qryProcuraTiposMovimentostransferencia: TStringField;
    qryMovimentosfilialtrasnferencia: TIntegerField;
    qryProcuraTiposMovimentosoperacao: TStringField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
    qryProcuraFiliaisTransferencia: TtecQuery;
    dsrProcuraFiliaisTransferencia: TtecDataSource;
    qryProcuraFiliaisTransferenciacodigo: TIntegerField;
    qryProcuraFiliaisTransferencianome: TStringField;
    
    qryExisteEstoqueemestoque: TFloatField;
    qryExisteEstoquereservado: TFloatField;
    qryExisteEstoquetransito: TFloatField;
    qryExisteEstoquedemonstracao: TFloatField;
    qryExisteEstoqueconserto: TFloatField;
    qryExisteEstoquefuturo: TFloatField;
    qryExisteEstoquedanificada: TFloatField;
    qryExisteEstoquereservaprevia: TFloatField;
    qryExisteEstoqueestoquefisico: TFloatField;

    qryMovimentosAnterioresprecosemicms: TFloatField;
    qryMovimentosAnterioresprecocomicms: TFloatField;
    qryMovimentosprecosemicms: TFloatField;
    qryMovimentosprecocomicms: TFloatField;
    qryMovimentosaliquotaipi: TFloatField;
    qryProcuraTiposMovimentosdescricao: TStringField;
    qryExisteEstoqueprecocomicms: TFloatField;
    qryExisteEstoqueprecosemicms: TFloatField;
    qryExisteEstoquecustomedio: TFloatField;
    dsrExisteEstoque: TtecDataSource;
    qryExisteEstoquefinanceiro: TFloatField;
    qryMovimentosprodutovisual: TStringField;
    qryMovimentosusuariologado: TIntegerField;
    qryMovimentosusuarioautorizacao: TIntegerField;
    qryMovimentosvalorultimacompra: TFloatField;
    qryAtualizaValorUltimaCompra: TtecQuery;
    qryExisteEstoquevalorultimacompra: TFloatField;
    qryMovimentosAux: TtecQuery;
    qryMovimentosAuxcustomedio: TFloatField;
    qryMovimentosinsercaocancelada: TBooleanField;
    qryMovimentos_Copia: TtecQuery;
    qryMovimentos_Copianumero: TIntegerField;
    qryMovimentos_Copiaproduto: TLargeintField;
    qryMovimentos_Copiaprodutovisual: TStringField;
    qryMovimentos_Copiafilial: TIntegerField;
    qryMovimentos_Copiadata: TDateField;
    qryMovimentos_Copiatipomovimento: TStringField;
    qryMovimentos_Copiaquantidade: TFloatField;
    qryMovimentos_Copiavalor: TFloatField;
    qryMovimentos_Copiaprecosemicms: TFloatField;
    qryMovimentos_Copiaprecocomicms: TFloatField;
    qryMovimentos_Copiaaliquotaipi: TFloatField;
    qryMovimentos_Copiareferencia: TStringField;
    qryMovimentos_Copiausuariologado: TIntegerField;
    qryMovimentos_Copiausuarioautorizacao: TIntegerField;
    qryMovimentos_Copiafilialtrasnferencia: TIntegerField;
    qryMovimentos_Copiavalorultimacompra: TFloatField;
    qryMovimentos_Copiainsercaocancelada: TBooleanField;
    qryMovimentosnrlote: TStringField;
    qryMovimentosfabricacao: TDateField;
    qryMovimentosvalidade: TDateField;
    qryExisteEstoqueLotes: TtecQuery;
    dsrExisteEstoqueLotes: TtecDataSource;
    qryExisteEstoqueLotesemestoque: TFloatField;
    qryExisteEstoqueLotesreservado: TFloatField;
    qryExisteEstoqueLotestransito: TFloatField;
    qryExisteEstoqueLotesdemonstracao: TFloatField;
    qryExisteEstoqueLotesconserto: TFloatField;
    qryExisteEstoqueLotesfuturo: TFloatField;
    qryExisteEstoqueLotesdanificada: TFloatField;
    qryExisteEstoqueLotesreservaprevia: TFloatField;
    qryExisteEstoqueLotesestoquefisico: TFloatField;
    qryExisteEstoqueLotesprecocomicms: TFloatField;
    qryExisteEstoqueLotesprecosemicms: TFloatField;
    qryExisteEstoqueLotesfinanceiro: TFloatField;
    qryExisteEstoqueLotescustomedio: TFloatField;
    qryExisteEstoqueLotesvalorultimacompra: TFloatField;
    qryMovimentosloteproduto: TLargeintField;
    qryMovimentosAnterioresnrlote: TStringField;
    procedure dsrMovimentosDataChange(Sender: TObject; Field: TField);
    procedure qryMovimentosfilialChange(Sender: TField);
    procedure qryMovimentosNewRecord(DataSet: TDataSet);
    procedure qryMovimentosAfterInsert(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryProcuraItemProdutosAfterOpen(DataSet: TDataSet);
  private
    fqryProcuraItemProdutos: TtecQuery;
    function GetqryProcuraItemProdutos: TtecQuery;
  protected
    vFilialdigitada: integer;
    vTipoDigitado : String;
    vDataDigitada : TDateTime;
    vReferenciaDigitada : String;
    function GetConsultarFilial: TZDataSet;
    function GetConsultarTipoMovimento: TZDataSet;
    function GetOperacoesMovimento: String;
    function GetTabelaMovimentos: TZDataSet;
    function GetTransferencia: Boolean;
  public
    procedure AbrirTabelaPesquisa (Pesquisa: TtecLancamentosManuais);
    constructor Create (AOnwer: TComponent); override;
    function  ExisteEstoque: boolean;
    function  ExisteFilial(Campo, Codigo: string): Boolean;
    function  ExisteTipoMovimento(Campo, Codigo: string): Boolean;
    function  ExisteTransferencia: Boolean;
    procedure FecharTabelas;
    procedure FecharTabelaPesquisa (Pesquisa: TtecLancamentosManuais);
    function  GravarLancamento: Boolean;
    function  PermitirLancamentoAvulso: Boolean;
    function  IncluirLancamento: Boolean;
    procedure Selecionar(Pesquisa: TtecLancamentosManuais);

    property ConsultarFilial: TZDataSet read GetConsultarFilial;
    property ConsultarTipoMovimento: TZDataSet read GetConsultarTipoMovimento;
    property OperacoesMovimento: String read GetOperacoesMovimento;
    property TabelaMovimentos: TZDataSet read GetTabelaMovimentos;
    property Transferencia: Boolean read GetTransferencia;
    procedure GravarValorUltimaCompra(Valor: Currency);

    property qryProcuraItemProdutos: TtecQuery read GetqryProcuraItemProdutos write fqryProcuraItemProdutos;

  end;

var
  dtmLancamentosManuais: TdtmLancamentosManuais;
  FUsuarioLogado, FUsuarioAutenticacao : Integer;
implementation

uses fmLancamentosManuais;

{$R *.dfm}

procedure TdtmLancamentosManuais.AbrirTabelaPesquisa(Pesquisa: TtecLancamentosManuais);
begin
  case Pesquisa of
    lamFILIAIS,
    lamFILIAISTRANSF  : Abre(ctPesquisaFilial);
    lamTIPOSMOVIMENTOS: Abre(ctPesquisaTiposMovimentos);
  end;
end;

constructor TdtmLancamentosManuais.Create(AOnwer: TComponent);
begin
  inherited;
  qryMovimentos.Tag              := ctTabelas;
  qryConsultaFiliais.Tag         := ctPesquisaFilial;
  qryConsultaTiposMovimentos.Tag := ctPesquisaTiposMovimentos;

  qryExisteEstoqueemestoque.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoquereservado.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoquetransito.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoquedemonstracao.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueconserto.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoquefuturo.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoquedanificada.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoquereservaprevia.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueestoquefisico.displayformat := parsistema.mascaraquantidadegrade;

  qryExisteEstoqueLotesemestoque.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesreservado.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotestransito.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesdemonstracao.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesconserto.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesfuturo.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesdanificada.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesreservaprevia.displayformat := parsistema.mascaraquantidadegrade;
  qryExisteEstoqueLotesestoquefisico.displayformat := parsistema.mascaraquantidadegrade;

  qryMovimentosAnterioresemestoque.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnterioresreservado.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnteriorestransito.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnterioresdemonstracao.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnterioresconserto.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnterioresfuturo.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnterioresdanificada.displayformat := parsistema.mascaraquantidadegrade;
  qryMovimentosAnterioresquantidade.displayformat := parsistema.mascaraquantidadegrade;
end;

procedure TdtmLancamentosManuais.dsrMovimentosDataChange(Sender: TObject; Field: TField);
begin
 inherited;
  if (((Field = qryMovimentosproduto) or (Field = qryMovimentosfilial)) and (qryMovimentosfilial.AsInteger>0)) then
  begin

    ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                           qryMovimentosfilial.AsInteger]);

     if qryExisteEstoqueCUSTOMEDIO.AsCurrency <> 0  then
       qryMovimentosValor.AsCurrency := qryExisteEstoqueCUSTOMEDIO.AsCurrency
     else
       qryMovimentosValor.AsCurrency := qryExisteEstoquevalorultimacompra.AsCurrency;

     if qryExisteEstoquePRECOSEMICMS.AsCurrency <> 0  then
        qryMovimentosPRECOSEMICMS.AsCurrency := qryExisteEstoquePRECOSEMICMS.AsCurrency;

     if qryExisteEstoquePRECOCOMICMS.AsCurrency <> 0  then
        qryMovimentosPRECOCOMICMS.AsCurrency := qryExisteEstoquePRECOCOMICMS.AsCurrency;

  end
  else
  if field = qryMovimentostipomovimento then
  begin
    if (copy(qryProcuraTiposMovimentosoperacao.AsString,11,1)='=') then
    begin
       if not qryMovimentosproduto.isnull and qryProcuraItemProdutos.Fieldbyname('composto').asBoolean then
         qryMovimentosvalorultimacompra.ReadOnly := true
       else
         qryMovimentosvalorultimacompra.ReadOnly := false;
    end
    else
       qryMovimentosvalorultimacompra.ReadOnly := true;
  end;


  if ((Field = qryMovimentosproduto) or
      (Field = qryMovimentosfilial) or
      (Field = qryMovimentosdata)) then
  begin
    if not qryMovimentosdata.IsNull then
    begin
      if (qryMovimentosdata.AsString = '30/12/1899') then
        RefazConsultaPorNome(qryMovimentosAux, ['produto','filial','data'],
          [qryMovimentosproduto.AsLargeInt,
           qryMovimentosfilial.AsInteger, strtodate('01/01/0001')])
      else
        RefazConsultaPorNome(qryMovimentosAux, ['produto','filial','data'],
          [qryMovimentosproduto.AsLargeInt,
           qryMovimentosfilial.AsInteger,
           qryMovimentosdata.AsDateTime]);

    end;
  end;


end;

function TdtmLancamentosManuais.ExisteEstoque: boolean;
var
  EstoqueInsuficiente: Integer;

  function VerificarEstoque: Integer;
  var
    Estoque: array[1..7] of Currency;
    a: Integer;
  begin
    Result := 0;
    Estoque[1] := qryExisteEstoqueemestoque.AsCurrency;
    Estoque[2] := qryExisteEstoquereservado.AsCurrency;
    Estoque[3] := qryExisteEstoquetransito.AsCurrency;
    Estoque[4] := qryExisteEstoquedemonstracao.AsCurrency;
    Estoque[5] := qryExisteEstoqueconserto.AsCurrency;
    Estoque[6] := qryExisteEstoquefuturo.AsCurrency;
    Estoque[7] := qryExisteEstoquedanificada.AsCurrency;
    for a := 1 to 7 do
      case qryProcuraTiposMovimentosoperacao.AsString[a] of
        '-': if (Estoque[a] < qryMovimentosquantidade.AsCurrency) then begin
               Result := a;
               break
             end
      end
  end;

begin
  ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                        qryMovimentosfilial.AsInteger]);
  Result := qryExisteEstoque.RecordCount > 0;
  if Result then begin
    EstoqueInsuficiente := VerificarEstoque;
    if EstoqueInsuficiente > 0 then begin
      MensagemAviso(Format(ctSEMESTOQUELANCAMENTOMANUAL, [TotalizadoresEstoque[EstoqueInsuficiente]]));
      Result := False
    end
  end else begin
    qryExisteEstoque.Close;
    MensagemAviso(format(ctPRODUTONAOCADASTRADO,[qryMovimentosproduto.AsString,qryMovimentosfilial.AssTRING]));
  end
end;

function TdtmLancamentosManuais.ExisteFilial(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmLancamentosManuais.ExisteTipoMovimento(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaTiposMovimentos, Campo, Codigo);
end;

function TdtmLancamentosManuais.ExisteTransferencia: Boolean;
begin
  Result := not qryProcuraTiposMovimentostransferencia.IsNull;
end;

procedure TdtmLancamentosManuais.FecharTabelas;
begin
  ReFazConsulta(qryMovimentos,   [0],  [0]);
//  ReFazConsulta(qryVMovimentos,  [0,1],[0,0]);
  ReFazConsulta(qryExisteEstoque,[0,1],[0,0]);
  ReFazConsulta(qryExisteEstoqueLotes,[0,1,2],[0,0,0]);

end;

procedure TdtmLancamentosManuais.FecharTabelaPesquisa(Pesquisa: TtecLancamentosManuais);
begin
  case Pesquisa of
    lamPRODUTOS       : Fecha(ctPesquisaProdutos);
    lamFILIAIS,
    lamFILIAISTRANSF  : Fecha(ctPesquisaFilial);
    lamTIPOSMOVIMENTOS: Fecha(ctPesquisaTiposMovimentos);
  end;
end;

function TdtmLancamentosManuais.GetConsultarFilial: TZDataSet;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmLancamentosManuais.GetConsultarTipoMovimento: TZDataSet;
begin
  Result:= qryConsultaTiposMovimentos;
end;

function TdtmLancamentosManuais.GetOperacoesMovimento: String;
begin
  Result:= qryProcuraTiposMovimentosoperacao.AsString
end;

function TdtmLancamentosManuais.GetTabelaMovimentos: TZDataSet;
begin
  Result:= qryMovimentos;
end;

function TdtmLancamentosManuais.GetTransferencia: Boolean;
begin
  Result:= (qryProcuraTiposMovimentostransferencia.AsString <> '');
  if not Result then begin
    qryMovimentosfilialtrasnferencia.Clear;
    qryProcuraFiliaisTransferenciacodigo.Clear;
  end;
end;

function TdtmLancamentosManuais.GravarLancamento: Boolean;
begin
  Result:= False;
  if PermitirLancamentoAvulso then
  begin
    if qryMovimentos.CheckRequiredFields then
    begin
      if (qryMovimentos.State = dsEdit) and not qryMovimentosinsercaocancelada.asboolean then
        qryMovimentos.Cancel
      else
      begin
        if qryMovimentosinsercaocancelada.asboolean then
        begin
          qryMovimentos_Copia.Open;
          CopiarRegistros(qryMovimentos,qryMovimentos_copia);
          refazconsulta(qryMovimentos,[0],[0]);
          CopiarRegistros(qryMovimentos_copia,qryMovimentos);
          qryMovimentos_Copia.close;
          qryMovimentos.edit;
          ReFazConsulta(qryProcuraTiposMovimentos,[0],[qrymovimentostipomovimento.asstring]);
          ReFazConsulta(qryProcuraFiliaisTransferencia,[0],[qrymovimentosfilialtrasnferencia.asinteger]);



        end;

        // Teste se ambas as filiais sÊo iguais.
        Result:= (qryMovimentosfilialtrasnferencia.AsInteger = 0) or
                 (qryMovimentosfilial.AsInteger <> qryMovimentosfilialtrasnferencia.AsInteger);
        if not Result then
          MensagemAviso(Format(ctVALORESNAOPODEMSERIGUAIS,['Filial', 'Filial de Transferência']));

        // Teste se o produto esta cadastrado na filial de tranfer¦ncia.
        if Result and (qryMovimentosfilialtrasnferencia.AsInteger > 0) then
        begin
          ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                                qryMovimentosfilialtrasnferencia.AsInteger]);

          ReFazConsulta(qryExisteEstoqueLotes,[0,1,2],[
                                                qryMovimentosproduto.AsLargeInt,
                                                qryMovimentosLoteProduto.AsLargeInt,
                                                qryMovimentosfilialtrasnferencia.AsInteger]);

          Result:= not qryExisteEstoque.IsEmpty;
  //        qryExisteEstoque.Close;
          if not Result then
            MensagemAviso(format(ctPRODUTONAOCADASTRADO,[qryMovimentosproduto.AsString,qryMovimentosfilialtrasnferencia.AsString]));
        end;
        if Result then begin
          if ExisteEstoque then
          begin
            if not qryMovimentosinsercaocancelada.asboolean then
            begin
              spcMovimentosProximo.Open;
              qryMovimentosnumero.AsInteger:= spcMovimentosProximonumero.AsInteger;
              spcMovimentosProximo.Close;
            end;
//            qryMovimentosdata.Value:= DataServidor;
            //Atribui Usuario ao Movimento
            if FUsuarioAutenticacao > 0 then
              qryMovimentosusuarioautorizacao.AsInteger:= FUsuarioAutenticacao;
            if FUsuarioLogado > 0 then
              qryMovimentosusuariologado.AsInteger := FUsuarioLogado;

            if not qryMovimentosvalorultimacompra.ReadOnly then
              GravarValorUltimaCompra(qryMovimentosvalorultimacompra.AsCurrency);

            qryMovimentosinsercaocancelada.asboolean := false;
            qryMovimentos.Post;

            if VerificaOcorrencia(dtmLancamentosManuais.OperacoesMovimento,
                                                             Ord(opFinanceiro),
                                                             Ord(opVazio),
                                                             ['*','C']) then
            begin
              Perpetrar([qryMovimentos]);
              ReFazConsulta(qryMovimentosAnteriores,[0,1],[qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger]);
              ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                                   qryMovimentosfilial.AsInteger]);

              ReFazConsulta(qryExisteEstoqueLotes,[0,1,2],[
                                                    qryMovimentosproduto.AsLargeInt,
                                                    qryMovimentosLoteProduto.AsLargeInt,
                                                    qryMovimentosfilial.AsInteger]);



              Result:= True;
            end
            else
            begin
              Perpetrar([qryMovimentos], AguardareTerminarDentroDm);
              ReFazConsulta(qryMovimentosAnteriores,[0,1],[qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger]);
              ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                                   qryMovimentosfilial.AsInteger]);

              ReFazConsulta(qryExisteEstoqueLotes,[0,1,2],[
                                                    qryMovimentosproduto.AsLargeInt,
                                                    qryMovimentosLoteProduto.AsLargeInt,
                                                    qryMovimentosfilial.AsInteger]);

              if ((qryExisteEstoquecustomedio.AsCurrency > qryMovimentosAuxcustomedio.AsCurrency) and
                  (MensagemConfirmacao('Custo médio anterior: '+ formatfloat('###,##0.00', qryMovimentosAuxcustomedio.AsCurrency) +chr(13) +
                                       'Custo médio atual: '+ formatfloat('###,##0.00', qryExisteEstoquecustomedio.AsCurrency) +chr(13) +
                                       'O valor do custo médio ficará acima em '+ floattostr(PercentualMarkup(qryExisteEstoquecustomedio.AsCurrency, qryMovimentosAuxcustomedio.AsCurrency))+ '%') = smbOK)) or

                 ((qryMovimentosAuxcustomedio.AsCurrency > qryExisteEstoquecustomedio.AsCurrency) and
                  (MensagemConfirmacao('Custo médio anterior: '+ formatfloat('###,##0.00', qryMovimentosAuxcustomedio.AsCurrency) +chr(13) +
                                       'Custo médio atual: '+ formatfloat('###,##0.00', qryExisteEstoquecustomedio.AsCurrency) +chr(13) +
                                       'O valor do custo médio ficará abaixo em '+ floattostr(PercentualMarkup(qryExisteEstoquecustomedio.AsCurrency, qryMovimentosAuxcustomedio.AsCurrency)) + '%') = smbOK)) or

                 (qryExisteEstoquecustomedio.AsCurrency = qryMovimentosAuxcustomedio.AsCurrency) then
              begin
                Perpetrar([qryMovimentos]);
                Result:= True;
              end
              else
              begin
                Rollback([qryMovimentos]);
//                refazconsulta(qryMovimentos,[0],[0]);
                qryMovimentos.edit;
                qryMovimentosinsercaocancelada.asboolean := true;
                ReFazConsulta(qryMovimentosAnteriores,[0,1],[qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger]);
                ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                                     qryMovimentosfilial.AsInteger]);

                ReFazConsulta(qryExisteEstoqueLotes,[0,1,2],[
                                                      qryMovimentosproduto.AsLargeInt,
                                                      qryMovimentosLoteProduto.AsLargeInt,
                                                      qryMovimentosfilial.AsInteger]);


                Result:= False;
              end;
            end;

          end else
            Result := False
        end
      end;
    end;
  end;
end;

function TdtmLancamentosManuais.IncluirLancamento: Boolean;
begin
  vFilialdigitada := FilialBase;
  vDataDigitada := now();
  if not qryMovimentos.IsEmpty then
  begin
    vFilialdigitada := qryMovimentosfilial.AsInteger;
    vTipoDigitado   := qryMovimentostipomovimento.asstring;
    if not qryMovimentosdata.IsNull then
      vDataDigitada   := qryMovimentosdata.AsDateTime;
    vReferenciaDigitada := qryMovimentosreferencia.AsString;
    if vFilialdigitada = 0 then
      vFilialdigitada := filialbase;
    qryMovimentos.Close;
  end;

  qryMovimentos.Open;
  qryMovimentos.Insert;
  Result:= True;
end;

procedure TdtmLancamentosManuais.Selecionar(Pesquisa: TtecLancamentosManuais);
begin
  case Pesquisa of
    lamFILIAIS        : qryMovimentosfilial.AsInteger := qryConsultaFiliaiscodigo.AsInteger;
    lamFILIAISTRANSF  : qryMovimentosfilialtrasnferencia.AsInteger:= qryConsultaFiliaiscodigo.AsInteger;
    lamTIPOSMOVIMENTOS: qryMovimentostipomovimento.AsString := qryConsultaTiposMovimentoscodigo.AsString;
  end;
end;


procedure TdtmLancamentosManuais.qryMovimentosfilialChange(Sender: TField);
begin
  inherited;
{
      ReFazConsulta(qryExisteEstoque,[0,1],[qryMovimentosproduto.AsLargeInt,
                                           qryMovimentosfilial.AsInteger]);

     if qryExisteEstoqueCUSTOMEDIO.AsCurrency <> 0  then
        qryMovimentosValor.AsCurrency := qryExisteEstoqueCUSTOMEDIO.AsCurrency;

     if qryExisteEstoquePRECOSEMICMS.AsCurrency <> 0  then
        qryMovimentosPRECOSEMICMS.AsCurrency := qryExisteEstoquePRECOSEMICMS.AsCurrency;

     if qryExisteEstoquePRECOCOMICMS.AsCurrency <> 0  then
        qryMovimentosPRECOCOMICMS.AsCurrency := qryExisteEstoquePRECOCOMICMS.AsCurrency;
}
end;

function TdtmLancamentosManuais.PermitirLancamentoAvulso: Boolean;
var
  UsrAut: TtecUsuarios;
  Complemento: String;
begin
  FUsuarioLogado:= UsuarioLogin.CodigoUsuario;
  if ParSistema.ExigirSenhaLancamentoAvulso or Not UsuarioLogin.GerenteEstoque then
  begin
    Complemento := '';
    UsrAut := ObterAutorizacao(taLOGIN, ctLANCAMENTOAVULSO, ctGERENTEESTOQUE, Complemento);
    if Assigned(UsrAut) then
    begin
      FUsuarioAutenticacao:= UsrAut.CodigoUsuario;
      Result := Assigned(UsrAut) and UsrAut.GerenteEstoque;
      if Assigned(UsrAut) and Not UsrAut.GerenteEstoque then
      begin
        MensagemAviso(ctUSUARIOSEMPERMISSAO);
        Result := False
      end;
    end
    else
      result := False;
  end
  else
    Result := True;
end;

procedure TdtmLancamentosManuais.qryMovimentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryMovimentosdata.AsDateTime := DataHoraLocal;
  qryMovimentosinsercaocancelada.asboolean := false;
end;

procedure TdtmLancamentosManuais.qryMovimentosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryMovimentosfilial.AsInteger := vFilialdigitada;
  qryMovimentostipomovimento.asstring := vTipoDigitado;
  qryMovimentosdata.AsDateTime := vDataDigitada;
  qryMovimentosreferencia.AsString := vReferenciaDigitada;
end;

procedure TdtmLancamentosManuais.GravarValorUltimaCompra(Valor: Currency);
begin
  qryAtualizaValorUltimaCompra.Params[0].AsCurrency := Valor;
  qryAtualizaValorUltimaCompra.Params[1].AsString   := qryMovimentosproduto.AsString;
  qryAtualizaValorUltimaCompra.ExecSql;
  Perpetrar([qryAtualizaValorUltimaCompra]);
end;

procedure TdtmLancamentosManuais.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 arquivo: String;
begin
  inherited;
  Listar := tStringlist.Create;
  arquivo := 'c:\lancamentosprodutos.sql';
  if fileexists(arquivo) then
    Listar.loadfromfile(arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(arquivo);
  listar.free;
end;

procedure TdtmLancamentosManuais.qryProcuraItemProdutosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryMovimentosnrlote.required := qryProcuraItemProdutos.fieldbyname('gerenciarloteevalidade').asBoolean;
  qryMovimentosloteProduto.required := qryProcuraItemProdutos.fieldbyname('gerenciarloteevalidade').asBoolean;


  if (copy(qryProcuraTiposMovimentosoperacao.AsString,11,1)='=') then
  begin
     if not qryMovimentosproduto.isnull and qryProcuraItemProdutos.fieldbyname('composto').asBoolean then
       qryMovimentosvalorultimacompra.ReadOnly := true
     else
       qryMovimentosvalorultimacompra.ReadOnly := false;
  end
  else
     qryMovimentosvalorultimacompra.ReadOnly := true;
end;


function TdtmLancamentosManuais.GetqryProcuraItemProdutos: TtecQuery;
begin

  Result := TfrmLancamentosManuais(self.owner).fraConsultaProduto1.fraConsultaItemProduto.qryProcuraItemProdutos;
end;

end.

