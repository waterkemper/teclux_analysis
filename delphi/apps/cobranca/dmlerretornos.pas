unit dmLerRetornos;

interface

uses
  SysUtils, Classes, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  dmbasico,

  Types, Graphics, Controls, Forms, Dialogs,
  StdCtrls,
  biblio,ctConstantes, FR_DSet, FR_DBSet, FR_Class,
  clparametrossistema,
  Variants, DateUtils, QCheckLst,cltextprinter, FR_Desgn, ZTransact, ACBrBoleto,
  ACBrBase, Provider, DBClient, PixRetornoSantander, ACBrUtil;

type
  tstContrato = (OUTROS, ORCADO);

type
  tTipoArquivo = (Boleto, PIX);

type
  TdtmLerRetornos = class(TdtmBasico)
    dsrParcelas: TtecDataSource;
    qryParcelas: TtecQuery;
    qryParcelasContrato: TStringField;
    qryParcelasNumero: TIntegerField;
    qryParcelasDataVencto: TDateField;
    qryParcelasValorVencto: TFloatField;
    qryParcelasDataPagto: TDateField;
    qryParcelasValorPagto: TFloatField;
    qryParcelasremessa: TStringField;
    qryParcelasCliente: TIntegerField;
    qryParcelasNome: TStringField;
    qryParcelasfilialvenda: TIntegerField;
    qryParcelasfaturamento: TDateField;
    qryParcelaspessoatipo: TStringField;
    qryParcelasdocumento: TStringField;
    qryParcelasrua: TStringField;
    qryParcelasinscricao: TStringField;
    qryParcelascep: TIntegerField;
    qryParcelasNomefilial: TStringField;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisNome: TStringField;
    qryFiliaisinscricaoestadual: TStringField;
    dsrFiliais: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisNome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryParcelasmotivo: TStringField;
    qryParcelasFormaPagamento: TStringField;
    qryContas: TtecQuery;
    qryContasBanco: TIntegerField;
    qryContasAgencia: TIntegerField;
    qryContasConta: TIntegerField;
    qryContasDigito: TStringField;
    qryContasTitular: TStringField;
    qryContasSigla: TStringField;
    qryContasNome: TStringField;
    qryContasModeloCheque: TIntegerField;
    dsrContas: TtecDataSource;
    qryConsultaContas: TtecQuery;
    qryConsultaContasSigla: TStringField;
    qryConsultaContasNome: TStringField;
    qryConsultaContasConta: TIntegerField;
    qryConsultaContasDigito: TStringField;
    qryConsultaContasTitular: TStringField;
    qryConsultaContasAgencia: TIntegerField;
    qryConsultaContasBanco: TIntegerField;
    qryParcelas_Cliente_USA_Contrato: TtecQuery;
    qryParcelas_Cliente_NFE_NAO_USA_Contrato: TtecQuery;
    qryParcelasnrdocumento: TIntegerField;
    qryContasbancoreferencia: TStringField;
    qryParcelassituacaoContrato: TStringField;
    qryContasvariacao_carteira: TStringField;
    qryContasformatacao_convenio: TStringField;
    qryContasformatacao_nosso_Numero: TStringField;
    qryContasvalor_isencao_taxa: TFloatField;
    qryContasagenciareferencia: TIntegerField;
    qryContascnpj_agencia_referencia: TStringField;
    qryContascedente_Nome: TStringField;
    qryContascodigo_singular: TLargeintField;
    qryFiliaiscnpj: TStringField;
    ACBrBoleto1: TACBrBoleto;
    qryParcelasNossoNumero: TLargeintField;
    qryContasTipoRecebimento: TIntegerField;
    spcTransacaoProximo: TtecQuery;
    spcTransacaoProximotransacao: TIntegerField;
    spcRecebimentosProximo: TtecQuery;
    spcRecebimentosProximocodigo: TIntegerField;
    qryRecebimentos: TtecQuery;
    qryRecebimentoscodigo: TIntegerField;
    qryRecebimentosTipoRecebimento: TIntegerField;
    qryRecebimentostransacao: TIntegerField;
    qryRecebimentosvalorlancto: TFloatField;
    qryRecebimentosdatalancto: TDateTimeField;
    qryRecebimentoscheque: TStringField;
    qryRecebimentossituacao: TStringField;
    qryRecebimentosfilial: TIntegerField;
    qryRecebimentosDataVencto: TDateField;
    qryRecebimentoscontrole: TIntegerField;
    qryParcelasTransacao: TIntegerField;
    qryParcelasFilialPagto: TIntegerField;
    qryParcelasTipoRecebimento: TIntegerField;
    qryInserirParcelaParcial: TtecQuery;
    spcParcelasProximo: TtecQuery;
    spcParcelasProximoNumero: TIntegerField;
    qryParcelasParcelaOrigem: TStringField;
    qryParcelasParcelaOriginal: TIntegerField;
    qryParcelasDesmembrada: TBooleanField;
    qryParcelasPagamentoExtraCaixa: TBooleanField;
    qryParcelasJaVerificada: TBooleanField;
    qryParcelasevento: TIntegerField;
    qryParcelascontaboleto: TIntegerField;
    qryParcelasContratoatual: TBooleanField;
    qryParcelasexistepedidosite: TStringField;
    qryParcelasDataPagtoboleto: TDateField;
    qryParcelasValorPagtoboleto: TFloatField;
    qryRecebimentostef: TStringField;
    qryRecebimentoscontrolerecebimento: TIntegerField;
    qryContasconvenio: TLargeintField;
    qryParcelascontratos_atual: TBooleanField;
    qryParcelasatual: TStringField;
    qryParcelas_log: TtecQuery;
    qryParcelas_loglistacontrato: TMemoField;
    cdsParcelas: TClientDataSet;
    dspParcelas: TDataSetProvider;
    cdsParcelasTotalvencto: TAggregateField;
    cdsParcelasTotalPagto: TAggregateField;
    dsrcdsParcelas: TDataSource;
    cdsParcelasTotalRecebidoBoleto: TAggregateField;
    qryParcelasdatacredito: TDateField;
    qryemail_boleto_pago: TtecQuery;
    qryemail_boleto_pagocontrato: TStringField;
    qryContasfilial: TIntegerField;
    qryretorno_cobranca: TtecQuery;
    qryretorno_cobrancacodigo: TLargeintField;
    qryretorno_cobrancanomearquivo: TStringField;
    qryretorno_cobrancadatahora: TDateTimeField;
    dsrretorno_cobranca: TtecDataSource;
    qryretorno_cobranca_titulo: TtecQuery;
    dsrretorno_cobranca_titulo: TtecDataSource;
    qryretorno_cobranca_tituloretorno_cobranca: TLargeintField;
    qryretorno_cobranca_titulosequencia: TIntegerField;
    qryretorno_cobranca_tituloseunumero: TStringField;
    qryretorno_cobranca_titulonossonumero: TStringField;
    qryretorno_cobranca_tituloqualehnossonumero: TLargeintField;
    qryretorno_cobranca_titulodataocorrencia: TDateField;
    qryretorno_cobranca_titulonumerodocumento: TStringField;
    qryretorno_cobranca_titulovencimento: TDateField;
    qryretorno_cobranca_titulovalordocumento: TFloatField;
    qryretorno_cobranca_titulovalorrecebido: TFloatField;
    qryretorno_cobranca_titulodatacredito: TDateField;
    qryretorno_cobranca_tituloobservacao: TStringField;
    qryretorno_cobranca_proximocodigo: TtecQuery;
    qryretorno_cobranca_proximocodigocodigo_retorno: TLargeintField;
    qryRetornoCobrancaTexto: TtecQuery;
    qryRetornoCobrancaTextoconteudoarquivo: TMemoField;
    qryRetornoCobrancaTextocodigo: TLargeintField;
    qryretorno_cobranca_titulocontrato: TStringField;
    qryretorno_cobrancaconta: TIntegerField;
    qryretorno_cobrancanomebanco: TStringField;
    qryretorno_cobrancatotalrecebidoboleto: TFloatField;
    qryretorno_cobrancatotalvencto: TFloatField;
    qryretorno_cobrancatotalpagto: TFloatField;
    procedure qryParcelasAfterOpen(DataSet: TDataSet);
    procedure qryretorno_cobranca_tituloBeforeCancel(DataSet: TDataSet);
    procedure qryretorno_cobranca_tituloAfterCancel(DataSet: TDataSet);
    procedure qryretorno_cobrancaAfterScroll(DataSet: TDataSet);
  private
    fPIxRetorno: TPixRetornoSantander;
    fTipoArquivo: tTipoArquivo;
    Fretorno_cobrancaAfterScroll: TNotifyEvent;

  protected
    FFiliais: String;
    FContas:  String;
//    DtmCadCtr : TDataModule;

//    vPagamentosViaSite: TStringList;
    vTotalRegistroViaSite: Integer;
    vTotalValorRecebidoViaSite: Currency;



    Function  GetConsultarFiliais:  TTecQuery;
    Function  GetConsultarContas:   TTecQuery;

  public
    ModoIntermitente : Boolean;
    constructor Create(AOwner: TComponent); Override;
    destructor Destroy; override;

    procedure Selecionar(TipoPesquisa: TtecGerarRemessas);
    procedure AbreTabelaConsulta(TipoPesquisa: TtecGerarRemessas);
    procedure FechaTabelaConsulta(TipoPesquisa: TtecGerarRemessas);

    function  ExisteFiliais(NomeCampo, Codigo: string): Boolean;
    function  ExisteConta  (NomeCampo, Codigo: String): boolean;
    function  QualEhNossoNumero(Objeto, Banco: integer): LongInt;


    property ConsultarFiliais:  TTecQuery read GetConsultarFiliais;
    property ConsultarContas:   TTecQuery read GetConsultarContas;
    procedure SetFiliais(const Value: string);
    procedure SetContas(const Value: String);
    function AbrirParcelas: Boolean;
    property Filiais: string read fFiliais write SetFiliais;
    property Contas: String read FContas write FContas;
    property PixRetorno: TPixRetornoSantander read fPIxRetorno write fPixRetorno;
    function ValorPago(ind: integer): Currency;
    function DatadoCredito(ind: integer): TDateTime;

    property TipoArquivo: tTipoArquivo read fTipoArquivo write fTipoArquivo default boleto;


    function AtualizarParcelasBradescoACBR (NomeArquivo: String): boolean;
    function AtualizarParcelasPIX: boolean;
    function AtualizarParcelasPIXSantander: Boolean;

    function VerificarInformacoesdoArquivo(NomeArquivo: String): boolean;

    function proximoNumeroParcela(Contrato: string): integer;
    procedure QuitarParcelas(ValorPagamento: Currency; Datapagamento: tDatetime; DataCredito: tDatetime; Comentario: String; ViaSite: boolean = false);
    procedure Adicionar_retorno_cobranca(Arquivo: String);
    procedure Adicionar_retorno_cobranca_Titulo(Sequencia: Integer;
          vqualehnossonumero: int64;
          seunumero: String;
          nossonumero: String;
          dataocorrencia: tDateTime;
          numerodocumento: String;
          vencimento: tDateTime;
          valordocumento: Currency;
          valorrecebido: Currency;
          datacredito: tDateTime;
          observacao: String);

    procedure abrirLogRetornos(DataInicial, DataFinal, contrato: String);


//    procedure EnviarEmailQuitacaoViaSite;

    procedure reabrirRetornos;


    property retorno_cobrancaAfterScroll: TNotifyEvent
           read Fretorno_cobrancaAfterScroll
             write Fretorno_cobrancaAfterScroll;


  end;


var
  dtmLerRetornos: TdtmLerRetornos;
  Arquivo: File;
  NrLidos, NrRegOK: Integer;
  ContratosParcelas: String;
  Erro: Boolean;

implementation

uses dmtecsoft,Math;

{$R *.dfm}

function TdtmLerRetornos.QualEhNossoNumero(Objeto, Banco:  integer): LongInt;
var Inicio:  integer;
    Tamanho: integer;
begin
   if TipoArquivo = Boleto then
   begin

     with ACBrBoleto1.ListaDeBoletos.Objects[Objeto] do
     begin
        case Banco of
           001:      begin Inicio:= Length(NossoNumero)-6; Tamanho:= 7; end; {Banco do Brasil}
           033, 353: begin Inicio:= Length(NossoNumero)-7; Tamanho:= 7; end; {Santander}
           748:      begin Inicio:= Length(NossoNumero)-5; Tamanho:= 5; end; {Sicredi}
           756:      begin Inicio:= Length(NossoNumero)-7; Tamanho:= 7; end {cobBancoob...Sicob};
           else      begin Inicio:= Length(NossoNumero)-5; Tamanho:= 6; end;
         end;
         Result:= FLVal(Copy(NossoNumero, Inicio, Tamanho));
     end;
   end
   else
   if TipoArquivo = PIX then
   begin
     if banco = 33 then
     begin

     end;
   end

end;

procedure TdtmLerRetornos.AbreTabelaConsulta(TipoPesquisa: TtecGerarRemessas);
begin
  case TipoPesquisa of
    grsFILIAIS: Abre(ctConsultaFiliais);
    grsCONTAS:  Abre(ctConsultaContas);
  end;
end;

constructor TdtmLerRetornos.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Params[0].AsInteger:= FilialBase;
  qryFiliais.Tag:= ctTabelas;
  qryContas. Tag:= ctTabelas;

  qryConsultaFiliais.Tag:= ctConsultaFiliais;
  qryConsultaContas. Tag:= ctConsultaContas;

  qryParcelas.Tag:= ctTabelas;
  qryretorno_cobranca.Tag:= ctTabelas;
  qryretorno_cobranca_titulo.Tag:= ctTabelas;

  PixRetorno := TPixRetornoSantander.create;
end;

Function TdtmLerRetornos.ExisteFiliais(NomeCampo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais,NomeCampo,Codigo);
end;

Function TdtmLerRetornos.ExisteConta(NomeCampo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaContas,NomeCampo,Codigo);
end;

procedure TdtmLerRetornos.FechaTabelaConsulta(TipoPesquisa: TtecGerarRemessas);
begin
  case TipoPesquisa of
    grsFILIAIS: Fecha(ctConsultaFiliais);
    grsCONTAS:  Fecha(ctConsultaContas);
  end;
end;

Function TdtmLerRetornos.GetConsultarFiliais: TTecQuery;
begin
  Result:= qryConsultaFiliais;
end;

Function TdtmLerRetornos.GetConsultarContas: TTecQuery;
begin
  Result:= qryConsultaContas;
end;

procedure TdtmLerRetornos.Selecionar(TipoPesquisa: TtecGerarRemessas);
begin
   case TipoPesquisa of
      grsFILIAIS: RefazConsulta(qryFiliais, [0], [qryConsultaFiliaisCodigo.AsInteger]);
      grsCONTAS:  RefazConsulta(qryContas,  [0], [qryConsultaContasConta.  AsInteger]);
   end;
end;

procedure TdtmLerRetornos.SetFiliais(const Value: string);
begin
  FFiliais := Value;
{colocado em comentario - JR 18/03 - FILIAL DE PAGAMENTO SERA A INFORMADA NO FILTRO)}
{  if (Value <> '') then
    qryParcelas.MacroByName('filial').AsString := 'and (ct.filialvenda = ' + Value + ')'
  else
    qryParcelas.MacroByName('filial').AsString := ''}
end;

procedure TdtmLerRetornos.SetContas(const Value: string);
begin
  FContas:= Value;
end;

Function TdtmLerRetornos.AbrirParcelas: Boolean;
begin
  ReFazConsulta(qryParcelas,[],[]);
  Result := not qryParcelas.IsEmpty;
end;


function TdtmLerRetornos.AtualizarParcelasBradescoACBR(NomeArquivo: String): boolean;
var vDir         : string;
    i            : integer;
    vNossoNumero : longInt;
    vTstContrato : tstContrato;
    vComentario  : String;

    vContinuar : boolean;

    function CondicaoQuitacao_F_N_P: boolean;
    begin
      result :=  (((qryParcelasSituacaoContrato.AsString = 'F') or
                   (qryParcelasSituacaoContrato.AsString = 'N') or
                   (qryParcelasSituacaoContrato.AsString = 'P')) and (vTstContrato = OUTROS));
    end;

    function CondicaoQuitacao_O_R: boolean;
    begin
      result :=  (((qryParcelasSituacaoContrato.AsString = 'O') or
                   (qryParcelasSituacaoContrato.AsString = 'R')) and
                   (vTstContrato = ORCADO));
    end;


    function DataCredito_: TDateTime;
    begin
      result :=  ACBRBoleto1.ListadeBoletos.Objects[i].DataCredito;
      if (ACBrBoleto1.banco.TipoCobranca = cobBancoob) then
        if ACBRBoleto1.ListadeBoletos.Objects[i].DataCredito = 0 then
          result :=  ACBRBoleto1.ListadeBoletos.Objects[i].DataOcorrencia;
    end;

begin

   Result:= false;
   Erro  := false;


   with ACBrBoleto1 do begin
      NomeArqRetorno:= ExtractFileName(NomeArquivo);
      vdir := ExtractFilePath(NomeArquivo);
      delete(vdir,length(vdir),1);
      DirArqRetorno := vdir;

      with Banco do begin
         case qryContasBanco.AsInteger of
            001:           TipoCobranca := cobBancoDoBrasil;
            021:           TipoCobranca := cobBanestes;
            033, 008, 353: TipoCobranca := cobSantander;
            041:           TipoCobranca := cobBanrisul;
            104:           TipoCobranca:= cobCaixaSiCob;
//          104:           TipoCobranca:= cobCaixaEconomica;            {Aparentemente, este modelo}
//                                                                      {está desatualizado        }
            237,087:       TipoCobranca := cobBradesco;
            341:           TipoCobranca := cobItau;
            389:           TipoCobranca := cobBancoMercantil;
            399:           TipoCobranca := cobHSBC;
            748:           TipoCobranca := cobSicred;
            085:           TipoCobranca := cobBancoCECRED;
            756:           TipoCobranca := cobBancoob;
         end;
      end;

      with Cedente do begin
         Agencia    := qryContasAgencia.AsString;
         Conta      := qryContasConta.  AsString;
         ContaDigito:= qryContasDigito. AsString;
         CNPJCPF    := SomenteNumero(qryContasCNPJ_Agencia_Referencia.AsString);
      end;
      LerRetorno;

      ContratosParcelas:= '';
      for i:= 0 to ListadeBoletos.Count-1 do
      begin
          vNossoNumero := QualEhNossoNumero(i, qryContasBanco.AsInteger);

          if (vNossoNumero <> 0)
          then ContratosParcelas:= ContratosParcelas + '(p.NossoNumero = ' + FStr(vNossoNumero,$00) + ') OR ';
      end;
   end;

   if ContratosParcelas = '' then begin
      MensagemAviso(ctNAOFOISELECIONADOPARCELAS);
      Exit;
   end;

   Delete(ContratosParcelas, Length(ContratosParcelas)-3, 4);

   if ContratosParcelas <> ''  then begin
      ContratosParcelas := 'AND (' + ContratosParcelas + ')';
      qryParcelas.MacroByName('ContratosParcelas').AsString:= ContratosParcelas;
   end;

   qryParcelas.Close;
   qryParcelas.Open;


   if qryParcelas.IsEmpty then begin
      //MensagemAviso(ctNAOFOISELECIONADOPARCELAS);
      //exit;
      Erro  := true;
      Result:= false;
   end;

   vTotalRegistroViaSite     := 0;
   vTotalValorRecebidoViaSite:= 0;


 //comentario jr 20/05 - estava passando 2x pelo arquivo e deixando as parcelas todas como ja quitadas, nao entendi o pq deste for.

 //Necessário devido ao fato de que a quitação qdo via site se dá pelo Contrato, executando o perpetrar lá mesmo, inclusive qdo o pagamento for parcial,
 //neste caso poderia perpetrar duas vezes incluindo duas parcelas, por isso a quitação é feita em duas partes.

   for vTstContrato := OUTROS TO ORCADO do begin
       for i:= 0 to  ACBrBoleto1.ListadeBoletos.Count-1 do
       begin


           if (ACBrBoleto1.banco.TipoCobranca = cobSicred) then
           begin
             if (ACBRBoleto1.ListadeBoletos.Objects[i].OcorrenciaOriginal.Tipo = toRetornoRegistroConfirmado) or
                (ACBRBoleto1.ListadeBoletos.Objects[i].OcorrenciaOriginal.Tipo = toRetornoDebitoTarifas) then
               vContinuar := false
             else
               vContinuar := true;
           end
           else
             vContinuar := true;

           if vContinuar then
           begin


             vNossoNumero:= QualEhNossoNumero(i, qryContasBanco.AsInteger);



             if not qryParcelas.Locate('NossoNumero', vNossoNumero, []) then
             begin
                if vTstContrato = OUTROS       {Para só exibir a mensagem uma vez}
                then
                begin
                  RefazConsultaPorNome(qryParcelas_log, ['nossonumero'], [vNossoNumero]);
                  if qryParcelas_loglistacontrato.asSTring<>'' then
                    vComentario :=

                    {MensagemAviso}(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s não foi encontrada, no entanto foi encontrada no registro de log no contrato "%s" ',
                    [FStr(vNossoNumero,$00),
                     formatfloat('R$ ###,##0.00',ValorPago(i)),
                     formatDateTime('dd/mm/yy',DatadoCredito(i)),
                     qryParcelas_loglistacontrato.asSTring]))

                  else
                    vComentario :=
                    {MensagemAviso}(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s não foi encontrada',
                    [FStr(vNossoNumero,$00),
                     formatfloat('R$ ###,##0.00',ValorPago(i)),
                     formatDateTime('dd/mm/yy',DatadoCredito(i))]));

                end;
             end
             else
             if qryParcelassituacaoContrato.asString = 'C' then
             begin

               if vTstContrato = OUTROS       {Para só exibir a mensagem uma vez}
               then vComentario := {MensagemAviso}(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s esta presente no contrato "%s" que esta cancelado',
                                   [FStr(vNossoNumero,$00),
                                    formatfloat('R$ ###,##0.00',ValorPago(i)),
                                    formatDateTime('dd/mm/yy',DatadoCredito(i)),
                                    qryParcelasContrato.asString]));
             end
             else
             if not qryParcelascontratos_atual.asboolean then
             begin
               if vTstContrato = OUTROS       {Para só exibir a mensagem uma vez}
               then vComentario := {MensagemAviso}(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s esta presente no contrato "%s" que foi renegociado tendo como contrato atual o número "%s"',
                               [FStr(vNossoNumero,$00),
                                formatfloat('R$ ###,##0.00',ValorPago(i)),
                                formatDateTime('dd/mm/yy',DatadoCredito(i)),
                                qryParcelasContrato.asString,qryParcelasatual.asString]));
             end
             else
             begin
                qryParcelas.Edit;
                if CondicaoQuitacao_F_N_P or
                   CondicaoQuitacao_O_R then
                begin
                  qryParcelasMotivo.clear;

                  vContinuar := true;

                  if qryParcelasDataPagtoboleto.isnull then
                    qryParcelasDataPagtoboleto. AsDateTime:= ACBRBoleto1.ListadeBoletos.Objects[i].DataOcorrencia
                  else
                  if ACBRBoleto1.ListadeBoletos.Objects[i].ValorRecebido <> 0 then
                    qryParcelasDataPagtoboleto. AsDateTime:= ACBRBoleto1.ListadeBoletos.Objects[i].DataOcorrencia;

                  if qryParcelasDataCredito.isnull then
                    qryParcelasDataCredito. AsDateTime:= DataCredito_ {ACBRBoleto1.ListadeBoletos.Objects[i].DataCredito}
                  else
                  if ACBRBoleto1.ListadeBoletos.Objects[i].ValorRecebido <> 0 then
                    qryParcelasDataCredito. AsDateTime:= DataCredito_ {ACBRBoleto1.ListadeBoletos.Objects[i].DataCredito} ;  

                  if qryParcelasValorPagtoboleto.AsCurrency = 0 then
                    qryParcelasValorPagtoboleto.AsCurrency := ACBRBoleto1.ListadeBoletos.Objects[i].ValorRecebido
                  else
                  if ACBRBoleto1.ListadeBoletos.Objects[i].ValorRecebido <> 0 then
                    qryParcelasValorPagtoboleto.AsCurrency := ACBRBoleto1.ListadeBoletos.Objects[i].ValorRecebido;

                  if ACBrBoleto1.Banco.TipoCobranca=cobitau then
                     qryParcelasValorPagtoboleto.AsCurrency:=qryParcelasValorPagtoboleto.AsCurrency+ACBRBoleto1.ListadeBoletos.Objects[i].ValorDespesaCobranca;

                  if qryParcelasValorPagtoboleto.AsCurrency = 0 then
                     qryParcelasDataCredito.clear;

                  if not qryParcelasContratoAtual.AsBoolean then
                  begin
                    if qryParcelasMotivo.AsString <> '' then
                       qryParcelasMotivo.AsString:= qryParcelasMotivo.AsString + ' | contrato renegociado'
                    else qryParcelasMotivo.AsString:= 'Contrato renegociado';
                    vContinuar := false;
                  end;

                  if  (qryParcelasSituacaoContrato.AsString = 'C') Then
                  begin
                    if qryParcelasMotivo.AsString <> '' then
                    begin
                      if qryParcelasSituacaoContrato.AsString = 'C' then
                         qryParcelasMotivo.AsString:= qryParcelasMotivo.AsString + ' | contrato cancelado '
                    end
                    else
                      if qryParcelasSituacaoContrato.AsString = 'C' then
                        qryParcelasMotivo.AsString := 'Contrato cancelado ';

                    vContinuar := false;
                  end;

                  if qryParcelasValorPagto.AsCurrency <> 0 then
                  begin
                    if qryParcelasMotivo.AsString <> '' then
                       qryParcelasMotivo.AsString := qryParcelasMotivo.AsString + ' | a parcela já está paga'
                    else qryParcelasMotivo.AsString := 'A parcela já está paga';
                    vContinuar := false;
                  end;

                  if vContinuar then
                  begin
                    vContinuar := qryParcelasValorPagtoboleto.AsCurrency <> 0;
                    if ACBRBoleto1.ListadeBoletos.Objects[i].OcorrenciaOriginal.Descricao <> '' then
                    begin

                      if qryParcelasMotivo.AsString = '' then
                        qryParcelasMotivo.AsString := ACBRBoleto1.ListadeBoletos.Objects[i].OcorrenciaOriginal.Descricao
                      else
                        qryParcelasMotivo.AsString := qryParcelasMotivo.AsString +' | '+ACBRBoleto1.ListadeBoletos.Objects[i].OcorrenciaOriginal.Descricao;
                    end;
                  end;
                end;

                if vContinuar then
                begin
                  if (qryParcelasDataCredito.AsDateTime = 0) or (formatdatetime('yyyy-mm-dd',qryParcelasDataCredito. AsDateTime)='1899-12-30') then
                  begin
                    vContinuar := false;
                    if qryParcelasMotivo.AsString <> '' then
                      qryParcelasMotivo.AsString:= qryParcelasMotivo.AsString + ' | Data de crédito em branco '
                    else
                      qryParcelasMotivo.AsString := 'Data de crédito em branco';

                    qryParcelasDataCredito.clear;

                  end;
                end;

                if ACBRBoleto1.ListadeBoletos.Objects[i].DescricaoMotivoRejeicaoComando.Count > 0 then
                  vComentario:= ACBRBoleto1.ListadeBoletos.Objects[i].DescricaoMotivoRejeicaoComando[0]
                else
                if qryParcelasMotivo.AsString <> '' then
                  vComentario := qryParcelasMotivo.AsString
                else
                  vComentario:= 'OCORRÊNCIA NÃO ENCONTRADA';

                if vContinuar then
                begin

                   if CondicaoQuitacao_F_N_P then
                     QuitarParcelas(qryParcelasValorPagtoboleto.AsCurrency, qryParcelasDataPagtoboleto. AsDateTime, qryParcelasDataCredito. AsDateTime, vComentario)
                   else
                     if CondicaoQuitacao_O_R then
                       if GravarContratoViaSite(self, {DtmCadCtr,} qryParcelasContrato.AsString, tOGCVendasViaSite,
                                                      qryParcelasDataPagtoboleto. AsDateTime,
                                                      qryParcelasDataCredito. AsDateTime,
                                                      qryParcelasValorPagtoboleto.AsCurrency,
                                                      qryParcelasContrato.AsString, qryParcelasNumero.AsInteger,
                                                      qryContasTipoRecebimento.AsInteger, StrToInt(Filiais), qryContasConta.AsInteger)

                        then QuitarParcelas(qryParcelasValorPagtoboleto.AsCurrency,
                                               qryParcelasDataPagtoboleto. AsDateTime, qryParcelasDataCredito. AsDateTime, vComentario, True);
                end;
             end;

             if vTstContrato = OUTROS then

               Adicionar_retorno_cobranca_Titulo(i+1, vNossoNumero,
                  ACBRBoleto1.ListadeBoletos.Objects[i].SeuNumero,
                  ACBRBoleto1.ListadeBoletos.Objects[i].NossoNumero,
                  ACBRBoleto1.ListadeBoletos.Objects[i].DataOcorrencia,
                  ACBRBoleto1.ListadeBoletos.Objects[i].NumeroDocumento,
                  ACBRBoleto1.ListadeBoletos.Objects[i].Vencimento,
                  ACBRBoleto1.ListadeBoletos.Objects[i].ValorDocumento,
                  ACBRBoleto1.ListadeBoletos.Objects[i].ValorRecebido,
                  DataCredito_ {ACBRBoleto1.ListadeBoletos.Objects[i].DataCredito},
                  vComentario);

           end;

           if qryParcelas.State in [dsEdit, dsInsert]
           then qryParcelas.Post;

       end;
   end;

//   perpetrar([qryretorno_cobranca_titulo]);

   if Erro
   then Exit

   else
   begin
{      EnviarEmailQuitacaoViaSite;
      if Assigned(dtmCadCtr) then
         dtmCadCtr.free;
 }
     Result:= true;
     cdsParcelas.close;
     cdsParcelas.open;

   end;
end;


function TdtmLerRetornos.proximoNumeroParcela(Contrato: string): integer;
begin
  spcParcelasProximo.ParamByName('Contrato').AsString := Contrato;
  spcParcelasProximo.Open;
  Result := spcParcelasProximoNumero.AsInteger;
  spcParcelasProximo.Close;
end;



procedure TdtmLerRetornos.QuitarParcelas(ValorPagamento: currency;
                                         DataPagamento:  tDatetime;
                                         DataCredito:  tDatetime;
                                         Comentario:     string;
                                         ViaSite:        boolean);
var vSaldoParcela: Currency;
    vNossoNumero:  LongInt;
begin
   spcTransacaoProximo.Open;

   vSaldoParcela:= 0;
   vNossoNumero := qryParcelasNossoNumero.AsInteger;

   if (ValorPagamento > 0) and
      (ValorPagamento < qryParcelasValorVencto.AsFloat)
   then vSaldoParcela:= qryParcelasValorVencto.AsFloat - ValorPagamento;

   qryParcelas.Edit;

   if vSaldoParcela <> 0 then begin
      qryParcelasValorVencto.Value    := ValorPagamento;
    //estava fora deste begin, ficando todas as parcelas em vermelho.
      qryParcelasDesmembrada.AsBoolean:= true;
   end;

   if ValorPagamento > 0 then begin
      qryParcelasDataPagto.          AsDateTime:= DataPagamento;
      qryParcelasDataCredito.          AsDateTime:= DataCredito;
      qryParcelasValorPagto.         AsCurrency:= ValorPagamento;
      qryParcelasFilialPagto.        AsInteger := StrToInt(Filiais);
      qryParcelasPagamentoExtraCaixa.AsBoolean := true;
      qryParcelasFormaPagamento.     AsString  := 'X';  // D->Dinheiro  C->Cartão  Crédito  B->Cartão Débito  H-> Cheque N->Banco
      qryParcelasevento.             AsString  := ParSistema.EventoQuitacaoArqRetornoBoletos;
      qryParcelascontaboleto.        AsString  := qryContasConta.AsString;
   end;
   qryParcelasMotivo.      AsString :=  Comentario;
   qryParcelasTransacao.   AsInteger:= spcTransacaoProximotransacao.AsInteger;
   qryParcelasJaVerificada.AsBoolean:= True;

   qryParcelas.Post;

   if vSaldoParcela <> 0 then begin
      qryInserirParcelaParcial.ParamByName('Contrato').       Value:= qryParcelasContrato.Value;
      qryInserirParcelaParcial.ParamByName('Numero').         Value:= proximoNumeroParcela(qryParcelasContrato.Value);
      qryInserirParcelaParcial.ParamByName('DataVencto').     Value:= qryParcelasDataVencto.Value;
      qryInserirParcelaParcial.ParamByName('ValorVencto').    Value:= vSaldoParcela;
      qryInserirParcelaParcial.ParamByName('ParcelaOrigem').  Value:= qryParcelasParcelaOrigem.  Value;
      qryInserirParcelaParcial.ParamByName('ParcelaOriginal').Value:= qryParcelasNumero.         Value;
      qryInserirParcelaParcial.ParamByName('TipoRecebimento').Value:= qryParcelasTipoRecebimento.Value;
      qryInserirParcelaParcial.ParamByName('FormaPagamento'). Value:= qryParcelasFormaPagamento. Value;
      qryInserirParcelaParcial.ParamByName('Cliente').        Value:= qryParcelasCliente.        Value;
      qryInserirParcelaParcial.ParamByName('Nome').           Value:= qryParcelasNome.           Value;

      qryParcelas.Next;
      if qryParcelas.eof then qryParcelas.Append
                         else qryParcelas.Insert;

      qryParcelasContrato.       Value:= qryInserirParcelaParcial.ParamByName('Contrato').Value;
      qryParcelasNumero.         Value:= proximoNumeroParcela(qryParcelasContrato.Value);
      qryParcelasDataVencto.     Value:= qryInserirParcelaParcial.ParamByName('DataVencto').     Value;
      qryParcelasValorVencto.    Value:= qryInserirParcelaParcial.ParamByName('ValorVencto').    Value;
      qryParcelasParcelaOrigem.  Value:= qryInserirParcelaParcial.ParamByName('ParcelaOrigem').  Value;
      qryParcelasParcelaOriginal.Value:= qryInserirParcelaParcial.ParamByName('ParcelaOriginal').Value;
      qryParcelasTipoRecebimento.Value:= qryInserirParcelaParcial.ParamByName('TipoRecebimento').Value;
      qryParcelasFormaPagamento. Value:= qryInserirParcelaParcial.ParamByName('FormaPagamento'). Value;
      qryParcelasCliente.        Value:= qryInserirParcelaParcial.ParamByName('Cliente').        Value;
      qryParcelasNome.           Value:= qryInserirParcelaParcial.ParamByName('Nome').           Value;

      qryParcelasPagamentoExtraCaixa.AsBoolean:= false;
      qryParcelasTipoRecebimento.    AsInteger:= qryContasTipoRecebimento.AsInteger;
      qryParcelasJaVerificada.       AsBoolean:= true;
      qryParcelasDesmembrada.        AsBoolean:= true;
      qryParcelasMotivo.             AsString := 'SALDO DE PARCELA' ;

      qryParcelas.Post;
   end;

   if not qryRecebimentos.Active
   then qryRecebimentos.Open;

   qryRecebimentos.Append;

   spcRecebimentosProximo.Open;
   qryRecebimentoscodigo.AsInteger := spcRecebimentosProximocodigo.AsInteger;
   spcRecebimentosProximo.Close;

   qryRecebimentosfilial.AsInteger       := StrToInt(Filiais);
   qryRecebimentossituacao.AsString      := 'N';
   qryRecebimentosdatalancto.AsDateTime  := DataServidor;
   qryRecebimentosvalorlancto.AsCurrency := ValorPagamento;

   if DataCredito <> 0 then
     qryRecebimentosDataVencto.AsDateTime  := DataCredito
   else
     qryRecebimentosDataVencto.AsDateTime  := DataPagamento;

   qryRecebimentosTipoRecebimento.AsInteger := qryContasTipoRecebimento.AsInteger;
   qryRecebimentoscontrole.AsInteger     := 0;
   qryRecebimentoscontrolerecebimento.AsInteger := qryRecebimentoscodigo.AsInteger;

   qryRecebimentostransacao.AsInteger    := spcTransacaoProximotransacao.AsInteger;
   qryRecebimentos.Post;

   spcTransacaoProximo.Close;

   if not ViaSite
   then Perpetrar([qryParcelas, qryRecebimentos]);

   qryParcelas.Locate('NossoNumero', vNossoNumero,[]);

   if ViaSite then
   begin
      if not qryemail_boleto_pago.active then
        qryemail_boleto_pago.Open;

      qryemail_boleto_pago.append;
      qryemail_boleto_pagocontrato.AsString := qryParcelasContrato. AsString;
      qryemail_boleto_pago.post;

      perpetrar([qryemail_boleto_pago]);

        {
      if not Assigned(vPagamentosViaSite) then begin
         vPagamentosViaSite := TStringList.create;
         vPagamentosViaSite.Append('<html> <head> <title>Relação de Cobrança Via Site </title> </head> <body> ');
         vPagamentosViaSite.Append('<h1>Relação de Contratos de Venda do Site Quitados  </h1>');
         vPagamentosViaSite.Append('<table style="border:1px solid #ddd;"> <tr> <th align="center" width="130" bgcolor="#eee"> Contrato </th> <th align="center" width="130" bgcolor="#eee">PARCELA </th> '+
                                   '<th align="center" width="130" bgcolor="#eee"> DATA </th> <th align="right" width="140" bgcolor="#eee"> VALOR </th> </tr>');
      end;
      vTotalRegistroViaSite := vTotalRegistroViaSite + 1;
      vTotalValorRecebidoViaSite := vTotalValorRecebidoViaSite + qryParcelasValorPagto.AsCurrency;

      vPagamentosViaSite.append('<tr><td align="center"> ' + qryParcelasContrato. AsString + '</td><td align="center"> ' + qryParcelasNumero.AsString +
                                '</td><td align="center"> '+ qryParcelasDataPagto.AsString + '</td><td align="right"> '  + formatfloat('###,###,##0.00',qryParcelasValorPagto.Ascurrency) + '</td></tr>');
}

   end;
end;

{
procedure TdtmLerRetornos.EnviarEmailQuitacaoViaSite;
begin

  if assigned(vPagamentosViaSite) then
  begin
    if vPagamentosViaSite.Count <> 3 then
    Begin
      vPagamentosViaSite.Append('<tr bgcolor="#eee"><td>Total de Registros:'+ inttostr(vTotalRegistroViaSite) +'</td><td /><td align="center" colspan="2"> Total Recebido: R$ ' + floattostr(vTotalValorRecebidoViaSite)+'</td></tr></table>');
      vPagamentosViaSite.Append('<p><small> E-mail gerado automaticamente pelo TecLUX. </small><a href="http://www.tecsoft.com.br" target="_blank"><img href="http://rot.tecsoft.com.br/images/logo_tecsoft.png" width="179" height="53" /></a></p></body></html>');
      EnviarEmail('COBRANÇA VIA SITE', qryFiliaisNome.AsString, qryParcelasDataPagto.AsDateTime, vPagamentosViaSite);
      vPagamentosViaSite.SaveToFile('c:\cobranca.html');
    end;
    vPagamentosViaSite.Free;
  end;

end;
}

destructor TdtmLerRetornos.Destroy;
begin
{
  if Assigned(dtmCadCtr) then
    dtmCadCtr.free;}
  FecharDmGravarContratoViaSite;

  inherited;
end;


function TdtmLerRetornos.ValorPago(ind: integer): Currency;
begin
  case TipoArquivo of
  Boleto : result := ACBrBoleto1.ListaDeBoletos.Objects[ind].ValorRecebido;
  PIX    : result := PixRetorno.TransacaoList.Items[ind].VALOR_PAGO;
  end;
end;

function TdtmLerRetornos.DatadoCredito(ind: integer): TDateTime;
begin


  case TipoArquivo of
  Boleto : result := ACBrBoleto1.ListaDeBoletos.Objects[ind].DataCredito;
  PIX    : result := PixRetorno.TransacaoList.Items[ind].DATA_DO_MOVIMENTO;
  end;

end;

procedure TdtmLerRetornos.qryParcelasAfterOpen(DataSet: TDataSet);
begin
  inherited;
     cdsParcelas.close;
     cdsParcelas.open;
end;

function TdtmLerRetornos.VerificarInformacoesdoArquivo(
  NomeArquivo: String): boolean;
var
  vDir : String;
  SNomeArquivo: TStringList;
  vTipo_da_Operacao: String;

begin
   result := True;
   SNomeArquivo := TStringList.Create;
   SNomeArquivo.LoadFromFile(NomeArquivo);

   if SNomeArquivo.Count < 1 then
   begin
      result := false;
      raise exception.Create(ACBrStr('O Arquivo de Retorno:'+sLineBreak+
                                     NomeArquivo + sLineBreak+
                                     'está vazio.'+sLineBreak+
                                     ' Não há dados para processar'));
   end;

   case Length(SNomeArquivo.Strings[0]) of
     750 :
     begin
       TipoArquivo := PIX;
       with PixRetorno do
       begin
          NomeArqRetorno:= ExtractFileName(NomeArquivo);
          vdir := ExtractFilePath(NomeArquivo);
          delete(vdir,length(vdir),1);
          DirArqRetorno := vdir;
          LerRetorno;

          if Header.CONTA <> '' then
          begin
            qrycontas.close;
            qrycontas.parambyname('conta').asString := Header.CONTA;
            qrycontas.open;
          end;

          qryFiliais.close;
          qryfiliais.parambyname('codigo').asinteger := qryContasfilial.asinteger;
          qryFiliais.open;

          if qrycontas.recordcount = 0 then
          begin
            result := false;
            MensagemAviso(format('A conta %s existente no arquivo selecionado não esta cadastrada!', [Header.CONTA]));
            exit;
          end;

          if qryFiliais.recordcount = 0 then
          begin
            result := false;
            MensagemAviso(format('Nenhuma filial esta vinculada a conta %s existente no arquivo selecionado!', [Header.CONTA]));
            exit;
          end;
       end;
     end;

     240, 400 :
     begin
       TipoArquivo := Boleto;

       if Length(SNomeArquivo.Strings[0]) = 240 then
       begin
         vTipo_da_Operacao := copy(SNomeArquivo.Strings[1], 9, 1);
         if vTipo_da_Operacao <> 'T' then
         begin
           result := false;
           exit;
         end;
       end;

       with ACBrBoleto1 do
       begin
          NomeArqRetorno:= ExtractFileName(NomeArquivo);
          vdir := ExtractFilePath(NomeArquivo);
          delete(vdir,length(vdir),1);
          DirArqRetorno := vdir;

          LerRetorno;

          if Cedente.conta <> '' then
          begin
            qrycontas.close;
            qrycontas.parambyname('conta').asString := Cedente.conta;
            qrycontas.open;
          end
          else
          if (Cedente.CodigoCedente <> '') and
             (Banco.TipoCobranca = cobSicred) then {Sicredi não tem informação da conta, porém vi que o codigocedente é a conta}
          begin
            qrycontas.close;
            qrycontas.parambyname('conta').asString := Cedente.CodigoCedente;
            qrycontas.open;
          end;

          qryFiliais.close;
          qryfiliais.parambyname('codigo').asinteger := qryContasfilial.asinteger;
          qryFiliais.open;

          if qrycontas.recordcount = 0 then
          begin
            result := false;
            MensagemAviso(format('A conta %s existente no arquivo selecionado não esta cadastrada!', [Cedente.conta]));
            exit;
          end;

          if qryFiliais.recordcount = 0 then
          begin
            result := false;
            MensagemAviso(format('Nenhuma filial esta vinculada a conta %s existente no arquivo selecionado!', [Cedente.conta]));
            exit;
          end;

       end;
     end;
   end;
end;

function TdtmLerRetornos.AtualizarParcelasPIX: boolean;
begin
  case qryContasBanco.AsInteger of
    033: result := AtualizarParcelasPIXSantander;
  end;
end;

function TdtmLerRetornos.AtualizarParcelasPIXSantander: boolean;
var vDir         : string;
    i            : integer;
    vNossoNumero : longInt;
    vTstContrato : tstContrato;
    vComentario  : String;
    vContinuar : boolean;

    function CondicaoQuitacao_F_N_P: boolean;
    begin
      result :=  (((qryParcelasSituacaoContrato.AsString = 'F') or
                   (qryParcelasSituacaoContrato.AsString = 'N') or
                   (qryParcelasSituacaoContrato.AsString = 'P')) and (vTstContrato = OUTROS));
    end;

    function CondicaoQuitacao_O_R: boolean;
    begin
      result :=  (((qryParcelasSituacaoContrato.AsString = 'O') or
                   (qryParcelasSituacaoContrato.AsString = 'R')) and
                   (vTstContrato = ORCADO));
    end;
begin

   Result:= false;
   Erro  := false;

   with PixRetorno do
   begin
      ContratosParcelas:= '';
      for i:= 0 to TransacaoList.Count-1 do
      begin
          vNossoNumero := StrToInt64(TransacaoList.Items[i].IDENTIFICADOR);
          if (vNossoNumero <> 0)
          then ContratosParcelas:= ContratosParcelas + '(p.NossoNumero = ' + FStr(vNossoNumero,$00) + ') OR ';
      end;
   end;

   if ContratosParcelas = '' then
   begin
      MensagemAviso(ctNAOFOISELECIONADOPARCELAS);
      Exit;
   end;

   Delete(ContratosParcelas, Length(ContratosParcelas)-3, 4);

   if ContratosParcelas <> ''  then begin
      ContratosParcelas := 'AND (' + ContratosParcelas + ')';
      qryParcelas.MacroByName('ContratosParcelas').AsString:= ContratosParcelas;
   end;

   qryParcelas.Close;
   qryParcelas.Open;


   if qryParcelas.IsEmpty then
   begin
      //MensagemAviso(ctNAOFOISELECIONADOPARCELAS);
      //exit;
      Erro  := true;
      Result:= false;
   end;

   vTotalRegistroViaSite     := 0;
   vTotalValorRecebidoViaSite:= 0;

 //comentario jr 20/05 - estava passando 2x pelo arquivo e deixando as parcelas todas como ja quitadas, nao entendi o pq deste for.

 //Necessário devido ao fato de que a quitação qdo via site se dá pelo Contrato, executando o perpetrar lá mesmo, inclusive qdo o pagamento for parcial,
 //neste caso poderia perpetrar duas vezes incluindo duas parcelas, por isso a quitação é feita em duas partes.

   for vTstContrato := OUTROS TO ORCADO do
   begin
     for i:= 0 to  PixRetorno.TransacaoList.Count-1 do
     begin

       vNossoNumero:= StrToInt64(PixRetorno.TransacaoList.Items[i].IDENTIFICADOR);
       if not qryParcelas.Locate('NossoNumero', vNossoNumero, []) then
       begin
          if vTstContrato = OUTROS       {Para só exibir a mensagem uma vez}
          then
          begin
            RefazConsultaPorNome(qryParcelas_log, ['nossonumero'], [vNossoNumero]);
            if qryParcelas_loglistacontrato.asSTring<>'' then
              MensagemAviso(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s não foi encontrada, no entanto foi encontrada no registro de log no contrato "%s" ',
              [FStr(vNossoNumero,$00),
               formatfloat('R$ ###,##0.00',ValorPago(i)),
               formatDateTime('dd/mm/yy',DatadoCredito(i)),
               qryParcelas_loglistacontrato.asSTring]))
            else
              MensagemAviso(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s não foi encontrada',
              [FStr(vNossoNumero,$00),
               formatfloat('R$ ###,##0.00',ValorPago(i)),
               formatDateTime('dd/mm/yy',DatadoCredito(i))]));
          end;
       end
       else
       if qryParcelassituacaoContrato.asString = 'C' then
       begin

         if vTstContrato = OUTROS       {Para só exibir a mensagem uma vez}
         then MensagemAviso(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s esta presente no contrato "%s" que esta cancelado',
                             [FStr(vNossoNumero,$00),
                              formatfloat('R$ ###,##0.00',ValorPago(i)),
                              formatDateTime('dd/mm/yy',DatadoCredito(i)),
                              qryParcelasContrato.asString]));
       end
       else
       if not qryParcelascontratos_atual.asboolean then
       begin
         if vTstContrato = OUTROS       {Para só exibir a mensagem uma vez}
         then MensagemAviso(format('A parcela com "NOSSO NÚMERO:" %s, "VALOR DE PAGAMENTO:" %s e "DATA DO CRÉDITO:" %s esta presente no contrato "%s" que foi renegociado tendo como contrato atual o número "%s"',
                         [FStr(vNossoNumero,$00),
                          formatfloat('R$ ###,##0.00',ValorPago(i)),
                          formatDateTime('dd/mm/yy',DatadoCredito(i)),
                          qryParcelasContrato.asString,qryParcelasatual.asString]));
       end
       else
       begin
          qryParcelas.Edit;
          if CondicaoQuitacao_F_N_P or
             CondicaoQuitacao_O_R then
          begin
            qryParcelasMotivo.clear;

            vContinuar := true;

            if qryParcelasDataPagtoboleto.isnull then
              qryParcelasDataPagtoboleto. AsDateTime:= PixRetorno.TransacaoList.Items[i].DATA_DO_MOVIMENTO
            else
            if PixRetorno.TransacaoList.Items[i].VALOR_PAGO <> 0 then
              qryParcelasDataPagtoboleto. AsDateTime:= PixRetorno.TransacaoList.Items[i].DATA_DO_MOVIMENTO;

            if qryParcelasDataCredito.isnull then
              qryParcelasDataCredito. AsDateTime:= PixRetorno.TransacaoList.Items[i].DATA_DO_MOVIMENTO
            else
            if PixRetorno.TransacaoList.Items[i].VALOR_PAGO <> 0 then
              qryParcelasDataCredito. AsDateTime:= PixRetorno.TransacaoList.Items[i].DATA_DO_MOVIMENTO;

            if qryParcelasValorPagtoboleto.AsCurrency = 0 then
              qryParcelasValorPagtoboleto.AsCurrency := PixRetorno.TransacaoList.Items[i].VALOR_PAGO
            else
            if PixRetorno.TransacaoList.Items[i].VALOR_PAGO <> 0 then
              qryParcelasValorPagtoboleto.AsCurrency := PixRetorno.TransacaoList.Items[i].VALOR_PAGO;

//            if ACBrBoleto1.Banco.TipoCobranca=cobitau then
//               qryParcelasValorPagtoboleto.AsCurrency:=qryParcelasValorPagtoboleto.AsCurrency+ACBRBoleto1.ListadeBoletos.Objects[i].ValorDespesaCobranca;


            if qryParcelasValorPagtoboleto.AsCurrency = 0 then
               qryParcelasDataCredito.clear;

            if not qryParcelasContratoAtual.AsBoolean then
            begin
              if qryParcelasMotivo.AsString <> '' then
                 qryParcelasMotivo.AsString:= qryParcelasMotivo.AsString + ' | contrato renegociado'
              else qryParcelasMotivo.AsString:= 'Contrato renegociado';
              vContinuar := false;
            end;

            if  (qryParcelasSituacaoContrato.AsString = 'C') Then
            begin
              if qryParcelasMotivo.AsString <> '' then
              begin
                if qryParcelasSituacaoContrato.AsString = 'C' then
                   qryParcelasMotivo.AsString:= qryParcelasMotivo.AsString + ' | contrato cancelado '
              end
              else
                if qryParcelasSituacaoContrato.AsString = 'C' then
                  qryParcelasMotivo.AsString := 'Contrato cancelado ';

              vContinuar := false;
            end;

            if qryParcelasValorPagto.AsCurrency <> 0 then
            begin
              if qryParcelasMotivo.AsString <> '' then
                 qryParcelasMotivo.AsString := qryParcelasMotivo.AsString + ' | a parcela já está paga'
              else qryParcelasMotivo.AsString := 'A parcela já está paga';
              vContinuar := false;
            end;

            if vContinuar then
            begin
              vContinuar := qryParcelasValorPagtoboleto.AsCurrency <> 0;
              if PixRetorno.TransacaoList.Items[i].MENSAGEM_PAGADOR_FINAL <> '' then
              begin

                if qryParcelasMotivo.AsString = '' then
                  qryParcelasMotivo.AsString := PixRetorno.TransacaoList.Items[i].MENSAGEM_PAGADOR_FINAL
                else
                  qryParcelasMotivo.AsString := qryParcelasMotivo.AsString +' | '+PixRetorno.TransacaoList.Items[i].MENSAGEM_PAGADOR_FINAL;
              end;
            end;

          end;

          if vContinuar then
          begin
            if (qryParcelasDataCredito.AsDateTime = 0) or (formatdatetime('yyyy-mm-dd',qryParcelasDataCredito. AsDateTime)='1899-12-30') then
            begin
              vContinuar := false;
              if qryParcelasMotivo.AsString <> '' then
                qryParcelasMotivo.AsString:= qryParcelasMotivo.AsString + ' | Data de crédito em branco '
              else
                qryParcelasMotivo.AsString := 'Data de crédito em branco';

              qryParcelasDataCredito.clear;

            end;
          end;

          if vContinuar then
          begin
              {
             if ACBRBoleto1.ListadeBoletos.Objects[i].DescricaoMotivoRejeicaoComando.Count > 0 then
               vComentario:= ACBRBoleto1.ListadeBoletos.Objects[i].DescricaoMotivoRejeicaoComando[0]
             else
             }
             if qryParcelasMotivo.AsString <> '' then
               vComentario := qryParcelasMotivo.AsString
             else
               vComentario:= 'OCORRÊNCIA NÃO ENCONTRADA';



             if CondicaoQuitacao_F_N_P then
               QuitarParcelas(qryParcelasValorPagtoboleto.AsCurrency, qryParcelasDataPagtoboleto. AsDateTime, qryParcelasDataCredito. AsDateTime, vComentario)
             else
               if CondicaoQuitacao_O_R then
                 if GravarContratoViaSite(self, {DtmCadCtr,} qryParcelasContrato.AsString, tOGCVendasViaSite,
                                                qryParcelasDataPagtoboleto. AsDateTime,
                                                qryParcelasDataCredito. AsDateTime,
                                                qryParcelasValorPagtoboleto.AsCurrency,
                                                qryParcelasContrato.AsString, qryParcelasNumero.AsInteger,
                                                qryContasTipoRecebimento.AsInteger, StrToInt(Filiais), qryContasConta.AsInteger)

                  then QuitarParcelas(qryParcelasValorPagtoboleto.AsCurrency,
                                         qryParcelasDataPagtoboleto. AsDateTime, qryParcelasDataCredito. AsDateTime, vComentario, True);
          end;
       end;

       if qryParcelas.State in [dsEdit, dsInsert] then
         qryParcelas.Post;
     end;
   end;

   if Erro then
     Exit
   else
   begin
     Result:= true;
     cdsParcelas.close;
     cdsParcelas.open;
   end;
end;

procedure TdtmLerRetornos.Adicionar_retorno_cobranca(
  Arquivo: String);
begin
  try

    qryretorno_cobranca.AfterScroll := nil;

    qryretorno_cobranca_proximocodigo.close;
    qryretorno_cobranca_proximocodigo.open;

    qryretorno_cobranca.append;
    qryretorno_cobrancacodigo.asInteger :=
      qryretorno_cobranca_proximocodigocodigo_retorno.asinteger;
    qryretorno_cobrancanomearquivo.asString := ExtractFileName(Arquivo);
    qryretorno_cobrancadatahora.AsDateTime := DataHoraServidor;
    qryretorno_cobrancaconta.AsString := ACBrBoleto1.Cedente.Conta;
    qryretorno_cobranca.post;

    perpetrar([qryretorno_cobranca]);

    RefazConsultaPorNome(qryRetornoCobrancaTexto, ['codigo'],
       [qryretorno_cobrancacodigo.asInteger]);

    qryRetornoCobrancaTexto.edit;
    qryRetornoCobrancaTextoconteudoarquivo.LoadFromFile(Arquivo);
    qryRetornoCobrancaTexto.post;
    perpetrar([qryRetornoCobrancaTexto]);
  finally
    qryretorno_cobranca.AfterScroll := qryretorno_cobrancaAfterScroll;
  end;



  

  

end;

procedure TdtmLerRetornos.Adicionar_retorno_cobranca_Titulo(
          Sequencia: Integer;
          vqualehnossonumero: int64;
          seunumero: String;
          nossonumero: String;
          dataocorrencia: tDateTime;
          numerodocumento: String;
          vencimento: tDateTime;
          valordocumento: Currency;
          valorrecebido: Currency;
          datacredito: tDateTime;
          observacao: String);
begin

  try
//    qryretorno_cobranca_titulo.MasterSource := nil;

    if not qryretorno_cobranca_titulo.locate('retorno_cobranca;sequencia',
          VarArrayOf([qryretorno_cobrancacodigo.AsString, Sequencia ]),[]) then
       qryretorno_cobranca_titulo.append
    else
       qryretorno_cobranca_titulo.edit;

    qryretorno_cobranca_tituloretorno_cobranca.AsLargeInt := qryretorno_cobrancacodigo.AsLargeInt;
    qryretorno_cobranca_titulosequencia.asinteger := Sequencia;
    qryretorno_cobranca_tituloseunumero.asString := seunumero;
    qryretorno_cobranca_titulonossonumero.asString := nossonumero;
    qryretorno_cobranca_tituloqualehnossonumero.asLargeint := vqualehnossonumero;
    qryretorno_cobranca_titulodataocorrencia.asDateTime := dataocorrencia;
    qryretorno_cobranca_titulonumerodocumento.asString := numerodocumento;
    qryretorno_cobranca_titulovencimento.asDateTime := vencimento;
    qryretorno_cobranca_titulovalordocumento.asCurrency := valordocumento;
    qryretorno_cobranca_titulovalorrecebido.asCurrency := valorrecebido;
    qryretorno_cobranca_titulodatacredito.asDateTime := datacredito;
    qryretorno_cobranca_tituloobservacao.asString := observacao;
    qryretorno_cobranca_titulo.post;

    perpetrar([qryretorno_cobranca_titulo]);

  finally
//    qryretorno_cobranca_titulo.MasterSource := dsrretorno_cobranca;
  end;

//  perpetrar([qryretorno_cobranca_titulo]);

end;

procedure TdtmLerRetornos.qryretorno_cobranca_tituloBeforeCancel(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmLerRetornos.qryretorno_cobranca_tituloAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmLerRetornos.abrirLogRetornos(DataInicial, DataFinal, contrato: String);

begin
  qryretorno_cobranca.close;
  qryretorno_cobranca_titulo.close;

  if (DataInicial<>'') and  (DataFinal<>'') then
    qryretorno_cobranca.macrobyname('condicao').asString := ' and cast(datahora as date) between :datainicial and :datafinal '
  else
  if (DataInicial<>'') and  (DataFinal='') then
    qryretorno_cobranca.macrobyname('condicao').asString := ' and cast(datahora as date) >= :datainicial '
  else
  if (DataInicial='') and  (DataFinal<>'') then
    qryretorno_cobranca.macrobyname('condicao').asString := ' and cast(datahora as date) <= :datafinal '
  else
    qryretorno_cobranca.macrobyname('condicao').asString := '';

  if DataInicial <> '' then
    qryretorno_cobranca.parambyname('datainicial').AsDateTime := strtodate(DataInicial)
  else
    qryretorno_cobranca.parambyname('datainicial').AsDateTime := 0;

  if DataFinal <> '' then
    qryretorno_cobranca.parambyname('datafinal').AsDateTime := strtodate(DataFinal)
  else
    qryretorno_cobranca.parambyname('datafinal').AsDateTime := 0;

  if contrato <> '' then
    qryretorno_cobranca.macrobyname('condicao').asString :=
      qryretorno_cobranca.macrobyname('condicao').asString +
    ' and rcob.codigo in (select rcobt.retorno_cobranca ' +
    '    from (retorno_cobranca_titulo rcobt   ' +
    '          left join parcelas p            ' +
    '      on rcobt.qualehnossonumero = p.nossonumero) '+
    '  where p.contrato = '+quotedstr(contrato) + ')';



  qryretorno_cobranca_titulo.macros := qryretorno_cobranca.macros;
  qryretorno_cobranca_titulo.params := qryretorno_cobranca.params;

  qryretorno_cobranca.open;
  qryretorno_cobranca_titulo.open;

  if contrato <> '' then
    qryretorno_cobranca_titulo.locate('contrato', contrato, []);

  qryretorno_cobranca.macrobyname('condicao').asString := 'false';
  qryretorno_cobranca_titulo.macrobyname('condicao').asString := 'false';





end;

procedure TdtmLerRetornos.reabrirRetornos;
var
 vLIstaRetornos: String;
begin
  if qryretorno_cobranca.recordcount <> 0 then
  begin
    vListaRetornos := RetornarLista(qryretorno_cobranca, qryretorno_cobrancacodigo, nil, false);
    qryretorno_cobranca.macrobyname('condicao').asString := 'and rcob.codigo in ('+vListaRetornos+')';
    qryretorno_cobranca_titulo.macrobyname('condicao').asString := 'and rcob.codigo in ('+vListaRetornos+')';
    qryretorno_cobranca.close;
    qryretorno_cobranca.open;

    qryretorno_cobranca_titulo.close;
    qryretorno_cobranca_titulo.open;


  end;
end;

procedure TdtmLerRetornos.qryretorno_cobrancaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  retorno_cobrancaAfterScroll(DataSet);
end;

end.
