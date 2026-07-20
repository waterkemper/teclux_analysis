unit dmconfirmarromaneiostransferencia;

interface

uses
  SysUtils, Classes, Math, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, Variants, Forms, ZTransact,
  clparametrossistema, clusuario, fmPrincipalBasico;

type
  TdtmConfirmarromaneiosTransferencia = class(TdtmBasico)
    qryromaneiosTransferencias: TtecQuery;
    dsrromaneiosTransferencias: TtecDataSource;
    qryromaneiosTransferenciasfilialemissao: TIntegerField;
    qryromaneiosTransferenciasdata: TDateField;
    qryromaneiosTransferenciasvalortotal: TFloatField;
    qryromaneiosTransferenciasobservacoes: TStringField;
    qryromaneiosTransferenciasserie: TStringField;
    qryromaneiosTransferenciasnumero: TIntegerField;
    qryromaneiosTransferenciasnome: TStringField;
    qryProdutosTransferencia: TtecQuery;
    qryProdutosTransferencianumero: TIntegerField;
    qryProdutosTransferenciaproduto: TLargeintField;
    qryProdutosTransferenciaquantidade: TFloatField;
    dsrProdutosNotas: TtecDataSource;
    qryProdutosTransferenciadescricao: TStringField;
    qryromaneiosTransferenciasdadofiscal: TIntegerField;
    qryProdutosTransferenciaprecovenda: TFloatField;
    qryNotasPag: TtecQuery;
    qryProdutosNotasPag: TtecQuery;
    spcNotasPagProximo: TtecQuery;
    spcNotasPagProximocodigo: TIntegerField;
    qryEstoqueBloqueio: TtecQuery;
    qryEstoqueBloqueioproduto: TLargeintField;
    qryEstoqueBloqueiofilial: TIntegerField;
    qryEstoqueBloqueioemestoque: TFloatField;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentosreferencia: TStringField;
    qryMovimentosoperacao: TStringField;
    qryMovimentosemestoque: TFloatField;
    qryMovimentosreservado: TFloatField;
    qryMovimentostransito: TFloatField;
    qryMovimentosdemonstracao: TFloatField;
    qryMovimentosconserto: TFloatField;
    qryMovimentosfuturo: TFloatField;
    qryMovimentosdanificada: TFloatField;
    qryMovimentosfinanceiro: TFloatField;
    qryMovimentosvalor: TFloatField;
    qryMovimentosdata: TDateField;
    qryMovimentostrfproduto: TLargeintField;
    qryMovimentostrffilial: TIntegerField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
    qryDadosFiscais: TtecQuery;
    qryProdutosDadosFiscais: TtecQuery;
    qryProdutosDadosFiscaisdadofiscal: TIntegerField;
    qryProdutosDadosFiscaisnumero: TIntegerField;
    qryProdutosDadosFiscaisproduto: TLargeintField;
    qryDadosFiscaisnumero: TIntegerField;
    qryDadosFiscaisdata: TDateField;
    qryDadosFiscaisvalortotal: TFloatField;
    qryDadosFiscaiscodigofiscal: TIntegerField;
    qryDadosFiscaisestadocfo: TStringField;
    qryDadosFiscaisnatureza: TStringField;
    qryDadosFiscaiscliente: TIntegerField;
    qryDadosFiscaistipocliente: TStringField;
    qryDadosFiscaispessoanumero: TStringField;
    qryDadosFiscaisdocumento: TStringField;
    qryDadosFiscaisfilial: TIntegerField;
    qryDadosFiscaisserie: TStringField;
    qryDadosFiscaisnumeronota: TIntegerField;
    qryPedidosFiliais: TtecQuery;
    qryPedidosFiliaiscodigo: TIntegerField;
    qryPedidosFiliaisproduto: TLargeintField;
    qryPedidosFiliaisrequisitante: TIntegerField;
    qryPedidosFiliaisrequisitada: TIntegerField;
    qryromaneiosTransferenciasselecionar: TBooleanField;
    qryPedidosFiliaissituacao: TStringField;
    qryEstoqueBloqueiofuturo: TFloatField;

    qryMovimentoscodigonota: TIntegerField;
    qryFilialOrigem: TtecQuery;
    qryFilialOrigemcnpj: TStringField;
    qryFilialOrigeminscricaoestadual: TStringField;
    qryMovimentoscliente: TIntegerField;
    qryMovimentostipocliente: TStringField;
    qryProdutosTransferencialinha: TStringField;
    qryProdutosTransferenciacoluna: TStringField;
    qryProdutosTransferenciavalorgrade1: TStringField;
    qryProdutosTransferenciavalorgrade2: TStringField;
    qryDadosFiscaisestadofilial: TStringField;
    qryDadosFiscaiscodigonatureza: TIntegerField;
    qryNaturezasPadrao: TtecQuery;
    qryNaturezasPadraodescricao: TStringField;
    qryNaturezasPadraonatureza: TIntegerField;
    qryNaturezasPadraocodigofiscal: TIntegerField;
    qryNaturezasPadraodescricaonatureza: TStringField;
    qryNaturezasPadraopiscst: TStringField;
    qryNaturezasPadraocofinscst: TStringField;
    qryNaturezasPadraoipicst: TStringField;
    qryNaturezasPadraoicmscst: TStringField;
    qryDadosFiscaisbaseicms: TFloatField;
    qryDadosFiscaisvaloricms: TFloatField;
    qryMovimentosnumerocontrole: TIntegerField;
    qryDadosFiscaismodelodocto: TStringField;
    qryVenctosDadosFiscais: TtecQuery;
    qryVenctosDadosFiscaisnumero: TIntegerField;
    qryVenctosDadosFiscaisdatavencto: TDateField;
    qryVenctosDadosFiscaisvalorvencto: TFloatField;
    qryDocumentosPag: TtecQuery;
    qryDuplicatas: TtecQuery;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatasjuros: TFloatField;
    qryDuplicatastipojuros: TStringField;
    qryDuplicatasmulta: TFloatField;
    qryDuplicatastipomulta: TStringField;
    qryDuplicatasobservacao: TStringField;
    qryDuplicatasdatapagto: TDateField;
    qryDuplicatasvalorpagto: TFloatField;
    qryDuplicataschequepagto: TIntegerField;
    qryDuplicatasbancocobranca: TIntegerField;
    qryDuplicatascontacredito: TIntegerField;
    qryDuplicatasautorizado: TBooleanField;
    qryDuplicatasfilialpagto: TIntegerField;
    qryDuplicatasusuario: TIntegerField;
    qryDuplicatastipopagamento: TIntegerField;
    qryDuplicatascontapagto: TIntegerField;
    qryDuplicatassequencia: TIntegerField;
    qryDuplicatasevento: TIntegerField;
    qryDuplicatasdataautorizacaopagto: TDateField;
    qryDuplicatasnrlotecontabil: TLargeintField;
    qryDuplicatassequenciaevento: TIntegerField;
    qryDocumentosPagnumero: TIntegerField;
    qryDocumentosPagfornecedor: TIntegerField;
    qryDocumentosPagemissao: TDateField;
    qryDocumentosPagdatalancto: TDateField;
    qryDocumentosPagcomplemento: TStringField;
    qryDocumentosPagfilialemissao: TIntegerField;
    qryDocumentosPagpedido: TIntegerField;
    qryDocumentosPagevento: TIntegerField;
    qryDocumentosPagprevisao: TBooleanField;
    qryDocumentosPagreferencia: TStringField;
    qryDocumentosPagvalor: TFloatField;
    qryDocumentosPagirretido: TFloatField;
    qryDocumentosPaginssretido: TFloatField;
    qryDocumentosPagissretido: TFloatField;
    qryDocumentosPagcofinsretido: TFloatField;
    qryDocumentosPagpisretido: TFloatField;
    qryDocumentosPagcsllretido: TFloatField;
    qryDocumentosPagtipofornecedor: TStringField;
    qryDocumentosPagcreditar: TIntegerField;
    qryDocumentosPaghistorico: TIntegerField;
    qryDocumentosPagdocumentopagorigem: TIntegerField;
    qryDocumentosPagdatavenctoorigem: TDateField;
    qryDocumentosPagnumeroorigem: TIntegerField;
    qryDocumentosPagadministrador: TBooleanField;
    qryDocumentosPagfornecedorparaiss: TIntegerField;
    qryDocumentosPagfatogerador: TStringField;
    qryDocumentosPagpiscofinscsllretido: TFloatField;
    qryDocumentosPagadiantamento: TBooleanField;
    qryDocumentosPagdebitar: TIntegerField;
    qryDocumentosPagtipopagamento: TIntegerField;
    qryDocumentosPagcontapagto: TIntegerField;
    qryDocumentosPagchequepagto: TIntegerField;
    qryDocumentosPagsequencia: TIntegerField;
    qryDocumentosPagfilialcontabil: TIntegerField;
    qryDocumentosPagpiscst: TStringField;
    qryDocumentosPagpisbasecalculo: TFloatField;
    qryDocumentosPagpisaliquota: TFloatField;
    qryDocumentosPagpisvalor: TFloatField;
    qryDocumentosPagcofinscst: TStringField;
    qryDocumentosPagcofinsbasecalculo: TFloatField;
    qryDocumentosPagcofinsaliquota: TFloatField;
    qryDocumentosPagcofinsvalor: TFloatField;
    qryDocumentosPagnat_bc_cred: TStringField;
    qryDocumentosPagregimedecaixa: TBooleanField;
    qryDadosFiscaistotalbaseicmssubstituicao: TFloatField;
    qryDadosFiscaistotalvaloricmssubstituicao: TFloatField;
    qryDadosFiscaischv_nfe: TStringField;
    qryDadosFiscaisvendatransferencia: TBooleanField;
    spcDocumentosPagProximo: TtecQuery;
    spcDocumentosPagProximocodigo: TIntegerField;
    qryNotasPagcodigo: TIntegerField;
    qryNotasPagfornecedor: TIntegerField;
    qryNotasPagserie: TStringField;
    qryNotasPagnumero: TIntegerField;
    qryNotasPagtipofornecedor: TStringField;
    qryNotasPagfilial: TIntegerField;
    qryNotasPagcodigofiscal: TIntegerField;
    qryNotasPagcodigonatureza: TIntegerField;
    qryNotasPagsituacao: TStringField;
    qryNotasPagnatureza: TStringField;
    qryNotasPagdata: TDateField;
    qryNotasPagemissao: TDateField;
    qryNotasPagestado: TStringField;
    qryNotasPagvalornota: TFloatField;
    qryNotasPagcontrato: TStringField;
    qryNotasPagfreteexterno: TFloatField;
    qryNotasPagfreteinterno: TFloatField;
    qryNotasPagdesconto: TFloatField;
    qryNotasPagacrescimo: TFloatField;
    qryNotasPagseguro: TFloatField;
    qryNotasPagdespesasacessorias: TFloatField;
    qryNotasPagbaseicmssubstituicao: TFloatField;
    qryNotasPagvaloricmssubstituicao: TFloatField;
    qryNotasPagvaloripi: TFloatField;
    qryNotasPagvalorservicos: TFloatField;
    qryNotasPagdocumentopag: TIntegerField;
    qryNotasPagcnpj: TStringField;
    qryNotasPaginscricaoestadual: TStringField;
    qryNotasPagobservacoes: TStringField;
    qryNotasPagfrete: TStringField;
    qryNotasPagclientecontribicms: TBooleanField;
    qryNotasPagtotalvalorpis: TFloatField;
    qryNotasPagtotalvalorcofins: TFloatField;
    qryNotasPagchv_nfe: TStringField;
    qryNotasPagvalorpis: TFloatField;
    qryNotasPagvalorcofins: TFloatField;
    qryNotasPagbaseicmscalculada: TFloatField;
    qryNotasPagvaloricmscalculada: TFloatField;
    qryNotasPagbaseicmssubstituicaocalculada: TFloatField;
    qryNotasPagvaloricmssubstituicaocalculada: TFloatField;
    qryNotasPagvaloripicalculada: TFloatField;
    qryNotasPagvalornotacalculada: TFloatField;
    qryNotasPagvalorprodutos: TFloatField;
    qryNotasPagvbcstretdesp: TFloatField;
    qryNotasPagvicmsstretdesp: TFloatField;
    qryNotasPagicmsbasecalculo_dev: TFloatField;
    qryNotasPagicmsvalor_dev: TFloatField;
    qryNotasPagnaoutilizarobsautomaticas: TBooleanField;
    qryNotasPagbaseicmsstretantcalculada: TFloatField;
    qryNotasPagvaloricmsstretantcalculada: TFloatField;
    qryNotasPagmodelodocto: TStringField;
    qryNotasPagbaseicms: TFloatField;
    qryNotasPagvaloricms: TFloatField;
    qryNotasPagtotalprodutos: TFloatField;
    qryNotasPagvalorvista: TFloatField;
    qryNotasPagvcredicmssn: TFloatField;
    qryNotasPagvicmsstret: TFloatField;
    qryNotasPagvbcstret: TFloatField;
    qryNotasPaginfcomplementar: TStringField;
    qryFilialOrigemcontribicms: TBooleanField;
    qryDadosFiscaisregimetributario: TIntegerField;
    qryNotasPagcrt: TIntegerField;
    qryNotasPagvendatransferencia: TBooleanField;
    qryNotasPagdadofiscalreferenciado: TIntegerField;
    qryromaneiosTransferenciascodigofiscal: TIntegerField;
    qryromaneiosTransferenciasvendatransferencia: TBooleanField;
    qryVenctosDadosFiscaistiporecebimento: TIntegerField;
    qryVenctosDadosFiscaisformapagamento: TStringField;
    qryDadosFiscaisobservacoes: TStringField;
    qryNotasPagvfcp: TFloatField;
    qryNotasPagvfcpst: TFloatField;
    qryNotasPagvfcpstret: TFloatField;
    qryDadosFiscaisvfcp: TFloatField;
    qryDadosFiscaisvfcpst: TFloatField;
    qryDadosFiscaisvfcpstret: TFloatField;
    qryProdutosTransferenciaprodutovisual: TStringField;
    qryProdutosTransferenciadescricaoproduto: TStringField;
    qryPedidosFiliaisqtderecebida: TFloatField;
    qryromaneiosTransferenciaschv_nfe: TStringField;
    qryromaneiosTransferenciasromaneio: TIntegerField;
    qryromaneiosTransferenciasvolumes: TIntegerField;
    qryromaneiosTransferenciassituacaoromaneioentrada: TStringField;
    qryromaneiosTransferenciaslidos: TLargeintField;
    qryromaneiosTransferenciasaler: TLargeintField;
    qryromaneiosTransferenciassit_romaneio_df_entr: TStringField;
    qryRomaneios: TtecQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    BooleanField1: TBooleanField;
    IntegerField4: TIntegerField;
    BooleanField2: TBooleanField;
    StringField4: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField5: TStringField;
    LargeintField1: TLargeintField;
    LargeintField2: TLargeintField;
    StringField6: TStringField;
    qryAtualizarSituacaoRomaneio: TtecQuery;
    qryromaneiosTransferenciastiporomaneio: TStringField;
    qryromaneiosPassagem: TtecQuery;
    qryromaneiosPassagemromaneio: TIntegerField;
    qryromaneiosPassagemvolumes: TIntegerField;
    qryromaneiosPassagemlidos: TLargeintField;
    qryromaneiosPassagemaler: TLargeintField;
    qryromaneiosPassagemsituacaoromaneioentrada: TStringField;
    qryromaneiosPassagemsit_romaneio_df_entr: TStringField;
    qryromaneiosPassagemdadofiscal: TIntegerField;
    qryromaneiosPassagemfilialemissao: TIntegerField;
    qryromaneiosPassagemdata: TDateField;
    qryromaneiosPassagemvalortotal: TFloatField;
    qryromaneiosPassagemobservacoes: TStringField;
    qryromaneiosPassagemserie: TStringField;
    qryromaneiosPassagemnumero: TIntegerField;
    qryromaneiosPassagemchv_nfe: TStringField;
    qryromaneiosPassagemnome: TStringField;
    qryromaneiosPassagemcodigofiscal: TIntegerField;
    qryromaneiosPassagemvendatransferencia: TBooleanField;
    qryromaneiosPassagemtiporomaneio: TStringField;
    qryromaneiosPassagemselecionar: TBooleanField;
    qryromaneiosTransferenciasromaneiopassagem: TBooleanField;
    qryromaneiosPassagemromaneiopassagem: TBooleanField;
    qryromaneiosTransferenciascliente: TIntegerField;
    qryromaneiosPassagemcliente: TIntegerField;
    qryromaneiosTransferenciassituacao_romaneio: TStringField;
    qryromaneiosPassagemsituacao_romaneio: TStringField;
    qryromaneiosTransferenciassomavolumes: TLargeintField;
    qryromaneiosTransferenciastotalsomavolumes: TLargeintField;
    procedure qryromaneiosTransferenciasAfterScroll(DataSet: TDataSet);
    procedure qryProdutosTransferenciaAfterScroll(DataSet: TDataSet);
    procedure qryromaneiosTransferenciasAfterOpen(DataSet: TDataSet);
    procedure qryromaneiosTransferenciasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    //procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FDataInicial: String;
    FDataFinal: String;
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    fFiltrarRomaneiodePassagem: Boolean;
    function  Getromaneioselecionada: Boolean;
    function  GetNrRegistros: Integer;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
  protected
    function  AtualizarPedidosFiliais: Boolean;
    procedure BloquearEstoque;
    procedure DesbloquearEstoque;
    procedure IncluirNota;
//    procedure IncluirImpostos;
    procedure IncluirMovimentos;
    procedure IncluirProdutos;
    procedure IncluirDocumentosPag;
    procedure InicializarTabelas;
    procedure MontaIntervaloData;
    procedure NovoMovimento(Produto: String; Filial,FilialEstoque: Integer);
  public
    constructor create(AOwner: TComponent); override;
    function ConfirmaTransferencia: Boolean;
    function GerarConsultaromaneiosTransferencias: Boolean;
    procedure SelecionarRegistros;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property romaneioselecionada: Boolean read Getromaneioselecionada;
    property NrRegistros: Integer read GetNrRegistros;
    property OnScrollLinhaColunaGrade: TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
    procedure SomarQtMarcados;

    function VerificarSeRomaneiodePassagem(chv_nfe: String): Boolean;

    property FiltrarRomaneiodePassagem: Boolean read fFiltrarRomaneiodePassagem write fFiltrarRomaneiodePassagem;


  end;

var
  dtmConfirmarromaneiosTransferencia: TdtmConfirmarromaneiosTransferencia;

implementation


{$R *.dfm}

{ TdtmConfirmarromaneiosTransferencia }

function TdtmConfirmarromaneiosTransferencia.AtualizarPedidosFiliais: Boolean;
var
ProdAnt: String;
quantidade: Real;
begin
  Result:= False;
  ProdAnt:='';
  ReFazConsulta(qryPedidosFiliais,[0],[qryromaneiosTransferenciasdadofiscal.AsInteger]);
  if (qryPedidosFiliais.RecordCount > 0) {and
     (qryPedidosFiliais.RecordCount = qryProdutosNotasPag.RecordCount)} then
  begin
      qryProdutosNotasPag.First;
      if(ProdAnt<>qryProdutosNotasPag.FieldByName('produto').AsString) then
         quantidade:=qryProdutosNotasPag.FieldByName('quantidade').AsFloat;

      while not qryProdutosNotasPag.Eof do
      begin
       // Result:= (qryPedidosFiliais.Locate('produto',qryProdutosNotasPag.FieldByName('produto').AsString,[]));

       qryPedidosFiliais.First;
       while not qryPedidosFiliais.Eof do
       begin
          if(qryPedidosFiliaisproduto.AsString=qryProdutosNotasPag.FieldByName('produto').AsString) then
          begin
            qryPedidosFiliais.Edit;
            qryPedidosFiliaissituacao.AsString:= 'D';
            qryPedidosFiliais.Post;
            quantidade:=quantidade-qryPedidosFiliaisqtderecebida.AsFloat;
//            MensagemAviso(FloatToStr(quantidade));
          end;
          qryPedidosFiliais.next;
       end;
       if(quantidade>0) then
       begin
          Result:= False;
          Break;
       end
       else
          Result:=true;
       qryProdutosNotasPag.Next;
      end;
  end
end;

procedure TdtmConfirmarromaneiosTransferencia.BloquearEstoque;
var
  Pos: TBookmark;
  WhereSQL: String;
begin
  Pos := qryProdutosNotasPag.GetBookmark;
  qryProdutosNotasPag.DisableControls;
  try
    if qryProdutosNotasPag.RecordCount = 0 then
      WhereSQL := 'false'
    else begin
      WhereSQL := '';
      qryProdutosNotasPag.First;
      while Not qryProdutosNotasPag.Eof do begin
        WhereSQL := WhereSQL +
        '((e.produto = ' + qryProdutosNotasPag.FieldByName('produto').AsString + ')and' +
        '(e.filial = '   + qryProdutosNotasPag.FieldByName('filial').AsString  + '))or';
        qryProdutosNotasPag.Next
      end;
      Delete(WhereSQL, Length(WhereSQL) - 1, 2);
    end
  finally
    qryProdutosNotasPag.GotoBookmark(Pos);
    qryProdutosNotasPag.FreeBookmark(Pos);
    qryProdutosNotasPag.EnableControls;
  end;
  qryEstoqueBloqueio.Sql[06] := WhereSQL;
  qryEstoqueBloqueio.Open;
end;

function TdtmConfirmarromaneiosTransferencia.ConfirmaTransferencia: Boolean;
var
  Pos: TBookmark;
  OperacaoOk: Boolean;
begin
  result := false;
  if MensagemConfirmacao(ctCONFIRMARNOTASTRANSFERENCIA) = smbOk then
  begin

    ReFazConsulta(qryNaturezasPadrao,[],[]);

    Pos:= qryromaneiosTransferencias.GetBookmark;
    qryromaneiosTransferencias.DisableControls;
    qryromaneiosTransferencias.First;
    try
      while not qryromaneiosTransferencias.eof do
      begin
        if qryromaneiosTransferenciasselecionar.AsBoolean then
        begin

          ReFazConsulta(qryDadosFiscais,        [0],[qryromaneiosTransferenciasdadofiscal.AsInteger]);
          ReFazConsulta(qryProdutosDadosFiscais,[0],[qryromaneiosTransferenciasdadofiscal.AsInteger]);

          if qryDadosFiscaisvendatransferencia.asboolean then
            RefazConsultaporNome(qryVenctosDadosFiscais, ['dadofiscal'], [qryromaneiosTransferenciasdadofiscal.AsInteger]);

          InicializarTabelas;
          IncluirNota;
          IncluirProdutos;

          if qryromaneiosTransferenciasvendatransferencia.AsBoolean then
            IncluirDocumentosPag;

          OperacaoOk := CalcularImpostos(qryProdutosNotasPag, qryNotaspag, true, true, false, nil, nil, false, TransferenciaEntrada, false, true, nil, false, false, false);

          if OperacaoOk then
          begin
            BloquearEstoque;
            IncluirMovimentos;
            OperacaoOk := AtualizarPedidosFiliais;

            if not OperacaoOk then
            begin
              DesbloquearEstoque;
              MensagemAviso(Format(ctNOTANAOCONFIRMADA,[qryromaneiosTransferenciasnumero.AsString,
                                                        qryromaneiosTransferenciasserie.AsString,
                                                        qryromaneiosTransferenciasfilialemissao.AsString]));
            end;
          end;

          if OperacaoOk then
          begin
            result := Perpetrar([qryDocumentosPag, qryDuplicatas, qryNotaspag, qryMovimentos, qryProdutosNotasPag, qryPedidosFiliais]);
            if result then
            begin

              qryAtualizarSituacaoRomaneio.parambyname('romaneio').asinteger := qryromaneiosTransferenciasromaneio.AsInteger;
              qryAtualizarSituacaoRomaneio.execsql;
              perpetrar([]);

              TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Reabrir', qryromaneiosTransferenciasromaneio.AsInteger], 'TfrmCadastroRomaneio', True)

            end;
          end;

        end;
        qryromaneiosTransferencias.Next;
      end;

    finally
      qryromaneiosTransferencias.GotoBookmark(Pos);
      qryromaneiosTransferencias.FreeBookmark(Pos);
      qryromaneiosTransferencias.EnableControls;
    end;
    GerarConsultaromaneiosTransferencias;
    QtdeMarcados:= 0;
  end;
end;

function TdtmConfirmarromaneiosTransferencia.GerarConsultaromaneiosTransferencias: Boolean;
begin
  if qryromaneiosTransferencias.Active then
    qryromaneiosTransferencias.Close;
    
  qryromaneiosTransferencias.Parambyname('cliente').AsInteger := FilialBase;
  qryromaneiosTransferencias.Open;
  Result:= qryromaneiosTransferencias.IsEmpty;
  if Result then
    qryromaneiosTransferencias.Close;
end;

function TdtmConfirmarromaneiosTransferencia.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosTransferenciacoluna.AsString)
end;

function TdtmConfirmarromaneiosTransferencia.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosTransferencialinha.AsString)
end;

function TdtmConfirmarromaneiosTransferencia.Getromaneioselecionada: Boolean;
begin
  Result:= qryromaneiosTransferenciasselecionar.AsBoolean;
end;

function TdtmConfirmarromaneiosTransferencia.GetNrRegistros: Integer;
begin
  Result:= qryromaneiosTransferencias.RecordCount;
end;

procedure TdtmConfirmarromaneiosTransferencia.IncluirMovimentos;
var
  SituacaoProduto : TtecComposicao;
  Pos: TBookMark;
begin
  Pos := qryProdutosNotasPag.GetBookmark;
  qryProdutosNotasPag.DisableControls;
  try
    for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do
    begin
      qryProdutosNotasPag.First;
      while not qryProdutosNotasPag.Eof do
      begin
        if FiltrarComposto(qryProdutosNotasPag.FieldByName('composto').AsBoolean ,SituacaoProduto) then
        begin
          if qryEstoqueBloqueio.Locate('produto;filial', VarArrayOf([qryProdutosNotasPag.FieldByName('produto').AsString,
                                                                     qryProdutosNotasPag.FieldByName('filial_estoque').AsInteger]) ,[]) then
          begin
              NovoMovimento(qryProdutosNotasPag.FieldByName('produto').AsString, qryProdutosNotasPag.FieldByName('filial').AsInteger,qryProdutosNotasPag.FieldByName('filial_estoque').AsInteger);
              qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryNotaspag.FieldByName('numero').AsInteger) +
                                                     ' S-' + qryNotaspag.FieldByName('serie').AsString + ' TRANSFERENCIA';
              qryMovimentosquantidade.ascurrency   := qryProdutosNotasPag.FieldByName('quantidade').ascurrency;
              qryMovimentostipomovimento.AsString := 'STC';
              qryMovimentosvalor.AsCurrency:= RoundTo((qryMovimentosquantidade.ascurrency *
                                                         qryProdutosNotasPag.FieldByName('precounitario').AsCurrency),-2);
              qryMovimentoscodigonota.AsInteger   := qryProdutosNotasPag.FieldByName('codigonota').AsInteger;
              qryMovimentosnumerocontrole.AsInteger := qryProdutosNotasPag.FieldByName('numero').AsInteger;
              qryMovimentos.Post;

              if qryEstoqueBloqueiofuturo.ascurrency > 0 then
              begin
                if (qryEstoqueBloqueiofuturo.ascurrency >= qryProdutosNotasPag.FieldByName('quantidade').ascurrency) then
                begin
                   NovoMovimento(qryProdutosNotasPag.FieldByName('produto').AsString, qryProdutosNotasPag.FieldByName('filial').AsInteger,qryProdutosNotasPag.FieldByName('filial_estoque').AsInteger);
                   qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryNotaspag.FieldByName('numero').AsInteger) +
                                                     ' S-' + qryNotaspag.FieldByName('serie').AsString + ' TRANSFERENCIA';
                   qryMovimentosquantidade.ascurrency   := qryProdutosNotasPag.FieldByName('quantidade').ascurrency;
                   qryMovimentostipomovimento.AsString := 'FTR';
                   qryMovimentosvalor.AsCurrency:= RoundTo((qryMovimentosquantidade.ascurrency *
                                                             qryProdutosNotasPag.FieldByName('precounitario').AsCurrency),-2)
                end
                else
                begin
                    NovoMovimento(qryProdutosNotasPag.FieldByName('produto').AsString, qryProdutosNotasPag.FieldByName('filial').AsInteger,qryProdutosNotasPag.FieldByName('filial_estoque').AsInteger);
                    qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryNotaspag.FieldByName('numero').AsInteger) +
                                                     ' S-' + qryNotaspag.FieldByName('serie').AsString + ' TRANSFERENCIA';
                    qryMovimentosquantidade.ascurrency   := qryEstoqueBloqueiofuturo.ascurrency;
                    qryMovimentostipomovimento.AsString := 'FTR';
                    qryMovimentosvalor.AsCurrency:= RoundTo((qryMovimentosquantidade.ascurrency *
                                                             qryProdutosNotasPag.FieldByName('precounitario').AsCurrency),-2);
                end;
                qryMovimentoscodigonota.AsInteger   := qryProdutosNotasPag.FieldByName('codigonota').AsInteger;
                qryMovimentosnumerocontrole.AsInteger := qryProdutosNotasPag.FieldByName('numero').AsInteger;
                qryMovimentos.Post;
              end;

          end;
        end;
        qryProdutosNotasPag.Next;
      end;
    end;
  finally
    qryProdutosNotasPag.GotoBookmark(Pos);
    qryProdutosNotasPag.FreeBookmark(Pos);
    qryProdutosNotasPag.EnableControls;
  end;
end;


procedure TdtmConfirmarromaneiosTransferencia.IncluirNota;

  {
  procedure SelecionarCodigoNaturezaNotasPag(descricao: String);
  begin
    if qryNaturezasPadrao.Locate('descricao',descricao,[]) then
    begin
      qryNotaspagcodigonatureza.asinteger := qryNaturezasPadraonatureza.AsInteger;
      qryNotaspagnatureza.AsString       := qryNaturezasPadraodescricao.AsString;
      qryNotaspagcodigofiscal.AsInteger   := qryNaturezasPadraocodigofiscal.AsInteger;

      if HeUnidadeFederacao(qryNotaspag.FieldByName('estado').AsString) then
      begin
        if qryNotaspag.FieldByName('estado').AsString = EstadoFilialBase then
           qryNotaspagcodigofiscal.AsInteger := 1000 + qryNotaspagcodigofiscal.AsInteger mod 1000
        else
           qryNotaspagcodigofiscal.AsInteger := 2000 + qryNotaspagcodigofiscal.AsInteger mod 1000;
      end
      else
        qryNotaspagcodigofiscal.AsInteger := 3000 + qryNotaspagcodigofiscal.AsInteger mod 1000;
    end
    else
      MensagemAviso(ctNATUREZAPADRAONAOVINCULADA);
  end;
  }

begin
  ReFazConsulta(qryFilialOrigem,[0],[qryDadosFiscaisfilial.AsInteger]);
  qryNotaspag.append;
  spcNotasPagProximo.Open;
  qryNotaspag.FieldByName('codigo').AsInteger:= spcNotasPagProximocodigo.AsInteger;
  spcNotasPagProximo.Close;

  qryNotaspag.FieldByName('fornecedor').AsInteger       := qryDadosFiscaisfilial.AsInteger;
  qryNotaspag.FieldByName('tipofornecedor').AsString    := 'L';
  qryNotaspag.FieldByName('serie').AsString             := qryDadosFiscaisserie.AsString;
  qryNotaspag.FieldByName('numero').AsInteger           := qryDadosFiscaisnumeronota.AsInteger;
  qryNotaspag.FieldByName('filial').AsInteger           := qryDadosFiscaiscliente.AsInteger;
  qryNotaspag.FieldByName('estado').AsString            := qryDadosFiscaisestadofilial.AsString;
  qryNotaspag.FieldByName('modelodocto').AsString       := qryDadosFiscaismodelodocto.asString;
  qryNotaspag.FieldByName('chv_nfe').AsString           := qryDadosFiscaischv_nfe.asString;
  qryNotaspag.FieldByName('clientecontribicms').AsBoolean := qryFilialOrigemcontribicms.AsBoolean;
  qryNotaspag.FieldByName('crt').AsInteger := qryDadosFiscaisregimetributario.AsInteger;

//  SelecionarCodigoNaturezaNotasPag(noTRANSFERENCIAMERCADORIASENTRADA);

  qryNotaspag.FieldByName('emissao').AsDateTime         := qryDadosFiscaisdata.AsDateTime;
  qryNotaspag.FieldByName('data').AsDateTime            := DataServidor;
  qryNotaspag.FieldByName('cnpj').AsString              := qryFilialOrigemcnpj.AsString;
  qryNotaspag.FieldByName('inscricaoestadual').AsString := qryFilialOrigeminscricaoestadual.AsString;
  qryNotaspag.FieldByName('valornota').AsCurrency       := qryDadosFiscaisvalortotal.AsCurrency;

  qryNotaspag.FieldByName('baseicms').AsCurrency        := qryDadosFiscaisbaseicms.AsCurrency;
  qryNotaspag.FieldByName('valoricms').AsCurrency       := qryDadosFiscaisvaloricms.AsCurrency;

  qryNotaspag.FieldByName('baseicmssubstituicao').AsCurrency  := qryDadosFiscaistotalbaseicmssubstituicao.AsCurrency;
  qryNotaspag.FieldByName('valoricmssubstituicao').AsCurrency := qryDadosFiscaistotalvaloricmssubstituicao.AsCurrency;


  qryNotaspag.FieldByName('vfcp').AsCurrency  :=      qryDadosFiscaisvfcp.asCurrency;
  qryNotaspag.FieldByName('vfcpst').AsCurrency  :=    qryDadosFiscaisvfcpst.asCurrency;
  qryNotaspag.FieldByName('vfcpstret').AsCurrency  := qryDadosFiscaisvfcpstret.asCurrency;

  qryNotaspag.FieldByName('observacoes').asString := qryDadosFiscaisobservacoes.asString;

  // Campos para assegurar a origem de uma nota de venda/transferencia entre empresas do mesmo ramo, util no momento da exclusão, setando a situacao
  // de pedidos filiais para 'F", permitindo imputar a nota de entrada novamente
  qryNotaspagvendatransferencia.AsBoolean := true;
  qryNotaspagdadofiscalreferenciado.asinteger :=  qryDadosFiscaisnumero.asinteger;

  {
  valoripi
  despesasacessorias
  seguro
  freteinterno
  }

  qryNotaspag.FieldByName('situacao').AsString := 'N';

  if qryDadosFiscaisvendatransferencia.AsBoolean then
    SelecionarDadosNaturezaPadrao(noCOMPRAS_TRANSFERENCIA_ENTRE_EMPRESA, nil, nil, qryNotaspag, TransferenciaEntrada)
  else
  if eHNotaFiscalSaidaDevolucao(qryDadosFiscaiscodigofiscal.AsInteger) then
    SelecionarDadosNaturezaPadrao(noENTRADADEVOLUCAO_TRANSFERENCIA_ENTRE_EMPRESA, nil, nil, qryNotaspag, TransferenciaEntrada)
  else
    SelecionarDadosNaturezaPadrao(noTRANSFERENCIAMERCADORIASENTRADA, nil, nil, qryNotaspag, TransferenciaEntrada);

  qryNotaspag.Post;
  qryFilialOrigem.Close;
end;

procedure TdtmConfirmarromaneiosTransferencia.IncluirProdutos;
begin
  qryProdutosDadosFiscais.First;
  while not qryProdutosDadosFiscais.Eof do
  begin
    qryProdutosNotasPag.Insert;
    qryProdutosNotasPag.FieldByName('codigonota').AsInteger          := qryNotaspag.FieldByName('codigo').AsInteger;
    qryProdutosNotasPag.FieldByName('numero').AsInteger              := qryProdutosDadosFiscaisnumero.AsInteger;
    qryProdutosNotasPag.FieldByName('filial').AsInteger              := FilialBase;
    qryProdutosNotasPag.FieldByName('filial_estoque').AsInteger      :=FilialEstoque;
    qryProdutosNotasPag.FieldByName('produto').AsString            := qryProdutosDadosFiscaisproduto.AsString;
    qryProdutosNotasPag.FieldByName('dadofiscal').asInteger          := qryProdutosDadosFiscaisdadofiscal.asinteger;
    qryProdutosNotasPag.FieldByName('numeroprodutotabela').asInteger := qryProdutosDadosFiscaisnumero.AsInteger;
    {
    if qryDadosFiscaisvendatransferencia.AsBoolean then
      AtribuirDadosCalculosImpostos(qryNotaspag, nil, nil, qryProdutosNotasPag, TrasnferenciaEntrada, true,  )
      }
      
    AtribuirDadosProdutos(qryProdutosNotasPag, qryNotaspag, nil, false, TransferenciaEntrada, EstadoFilialBase, );

//    qryProdutosNotasPag.FieldByName('precounitario').AsCurrency := qryProdutosDadosFiscaisprecovenda.AsCurrency;
//    qryProdutosNotasPag.FiledByNmae('quantidade').ascurrency    := qryProdutosDadosFiscaisquantidade.Ascurrency;

//    if qryProdutosDadosFiscaisincidencia.AsString<>'' then
//    begin
//      qryProdutosNotasPagincidencia.AsString      := qryProdutosDadosFiscaisincidencia.AsString;   <> Atribuido o valor do cadastro de produtos
//      qryProdutosNotasPagcst_nf.AsString          := qryProdutosDadosFiscaisincidencia.AsString;
//    end;

//    if qryProdutosDadosFiscaiscsosn.AsString<>'' then
//    begin
//      qryProdutosNotasPagcsosn.AsString      := qryProdutosDadosFiscaiscsosn.AsString;
//      qryProdutosNotasPagcsosn_nf.AsString   := qryProdutosDadosFiscaiscsosn.AsString;
//    end;

//    qryProdutosNotasPagipicst.AsString          := qryNaturezasPadraoipicst.AsString;
//    qryProdutosNotasPagcofinscst.AsString       := qryNaturezasPadraocofinscst.AsString;
//    qryProdutosNotasPagpiscst.AsString          := qryNaturezasPadraopiscst.AsString;

//    qryProdutosNotasPagorigem.AsString          := qryProdutosDadosFiscaisorigem.AsString;

//    qryProdutosNotasPagaliquotaicms.AsFloat     := qryProdutosDadosFiscaisaliquotaicms.AsFloat;
//    qryProdutosNotasPagbaseicms.AsCurrency      := qryProdutosDadosFiscaisquantidade.Ascurrency * qryProdutosDadosFiscaisprecovenda.AsFloat;

//    qryProdutosNotasPagvaloricms.AsCurrency     := (qryProdutosNotasPagbaseicms.AsCurrency*qryProdutosNotasPagaliquotaicms.AsFloat)/100;

//    qryProdutosNotasPagicmsbasecalculo.AsCurrency := qryProdutosDadosFiscaisicmsbasecalculo.AsCurrency;

//    qryProdutosNotasPagicmsvalor.AsCurrency := qryProdutosDadosFiscaisicmsvalor.AsCurrency;

{    qryProdutosNotasPagaliquotaipi.AsFloat      := 0;
    qryProdutosNotasPagvaloripi.AsCurrency      := 0;
    qryProdutosNotasPagdesconto.AsCurrency      := 0;}

//    qryProdutosNotasPagipibasecalculo.AsCurrency := qryProdutosDadosFiscaisipibasecalculo.AsCurrency;
//    qryProdutosNotasPagaliquotaipi.AsFloat      := qryProdutosDadosFiscaisaliquotaipi.AsCurrency;
//    qryProdutosNotasPagvaloripi.AsCurrency      := qryProdutosDadosFiscaisvaloripi.AsCurrency;

//    qryProdutosNotasPagcofinsbasecalculo.AsCurrency := qryProdutosDadosFiscaiscofinsbasecalculo.AsCurrency;
//    qryProdutosNotasPagcofinsaliquota.AsCurrency    := qryProdutosDadosFiscaiscofinsaliquota.AsCurrency;
//    qryProdutosNotasPagcofinsvalor.AsCurrency       := qryProdutosDadosFiscaiscofinsvalor.AsCurrency;

//    qryProdutosNotasPagPisbasecalculo.AsCurrency := qryProdutosDadosFiscaisPisbasecalculo.AsCurrency;
//    qryProdutosNotasPagPisaliquota.AsCurrency    := qryProdutosDadosFiscaisPisaliquota.AsCurrency;
//    qryProdutosNotasPagPisvalor.AsCurrency       := qryProdutosDadosFiscaisPisvalor.AsCurrency;

//    qryProdutosNotasPagdesconto.AsCurrency      := qryProdutosDadosFiscaisdesconto.AsCurrency;
//    qryProdutosNotasPagvalordescontoitem.AsCurrency  := qryProdutosDadosFiscaisvalordescontoitem.AsCurrency;

//    qryProdutosNotasPagcomposto.AsBoolean       := qryProdutosDadosFiscaiscomposto.AsBoolean;

//    qryProdutosNotasPagcodigofiscal.AsInteger   := qryNotaspagcodigofiscal.AsInteger;
//    qryProdutosNotasPagnatureza.AsInteger       := qryNotaspagcodigonatureza.AsInteger;

//    qryProdutosNotasPagvalorreducaobase.AsCurrency := qryProdutosDadosFiscaisreducaobase.AsCurrency;
//    qryProdutosNotasPagpercentualreducaobase.AsCurrency := qryProdutosDadosFiscaispercentualreducaobase.AsCurrency;
//    qryProdutosNotasPagacrescimo.AsCurrency :=  qryProdutosDadosFiscaisacrescimo.AsCurrency  ;
//    qryProdutosNotasPagfrete.AsCurrency :=  qryProdutosDadosFiscaisfrete.AsCurrency  ;
//    qryProdutosNotasPagseguro.AsCurrency := qryProdutosDadosFiscaisseguro.AsCurrency  ;
//    qryProdutosNotasPagdespesasacessorias.AsCurrency := qryProdutosDadosFiscaisdespesasacessorias.AsCurrency  ;
//    qryProdutosNotasPagaliquotaicmsst.AsCurrency := qryProdutosDadosFiscaisaliquotaicmsst.AsCurrency  ;
//    qryProdutosNotasPagicmsbasecalculost.AsCurrency := qryProdutosDadosFiscaisicmsbasecalculost.AsCurrency  ;
//    qryProdutosNotasPagicmsvalorst.AsCurrency := qryProdutosDadosFiscaisicmsvalorst.AsCurrency  ;

//    qryProdutosNotasPagpcredsn.AsCurrency := qryProdutosDadosFiscaispcredsn.AsCurrency  ;
//    qryProdutosNotasPagvcredicmssn.AsCurrency := qryProdutosDadosFiscaisvcredicmssn.AsCurrency  ;

//    qryProdutosNotasPagfatorsubstituicao.AsCurrency :=  qryProdutosDadosFiscaisfatorsubstituicao.AsCurrency ;
//    qryProdutosNotasPagpredbcst.AsCurrency := qryProdutosDadosFiscaispredbcst.AsCurrency  ;
//    qryProdutosNotasPagreducaobasest.AsCurrency := qryProdutosDadosFiscaisreducaobasest.AsCurrency  ;
//    qryProdutosNotasPagvbcstret.AsCurrency :=  qryProdutosDadosFiscaisvbcstret.AsCurrency ;
//    qryProdutosNotasPagvicmsstret.AsCurrency := qryProdutosDadosFiscaisvicmsstret.AsCurrency  ;

//    qryProdutosNotasPagdescricaoproduto.AsString := qryProdutosDadosFiscaisdescricaoproduto.AsString;

//    qryProdutosNotasPagicmsisentas.AsCurrency := qryProdutosDadosFiscaisicmsisentas.AsCurrency  ;
//    qryProdutosNotasPagicmsoutras.AsCurrency := qryProdutosDadosFiscaisicmsoutras.AsCurrency  ;

//    qryProdutosNotasPagipioutras.AsCurrency :=  qryProdutosDadosFiscaisipioutras.AsCurrency  ;
//    qryProdutosNotasPagipiisentas.AsCurrency :=  qryProdutosDadosFiscaisipiisentas.AsCurrency  ;

//  qryProdutosNotasPagunidade.AsString := qryProdutosDadosFiscaisunidade.AsString;
//  qryProdutosNotasPagunidadenf.AsString := qryProdutosDadosFiscaisunidade.AsString;
//  qryProdutosNotasPagfatorconversao.AsCurrency := 1;
//  qryProdutosNotasPagqtdeestoque.ascurrency    := qryProdutosDadosFiscaisquantidade.Ascurrency;

    qryProdutosNotasPag.post;
    qryProdutosDadosFiscais.Next;
  end;
end;

procedure TdtmConfirmarromaneiosTransferencia.InicializarTabelas;
begin
  if qryNotaspag.Active then
    qryNotaspag.Close;
  qryNotaspag.Open;

  if qryProdutosNotasPag.Active then
    qryProdutosNotasPag.Close;
  qryProdutosNotasPag.Open;

  if qryromaneiosTransferenciasvendatransferencia.AsBoolean then
  begin
    if qryDocumentosPag.Active then
      qryDocumentosPag.Close;
    qryDocumentosPag.Open;

    if qryDuplicatas.Active then
      qryDuplicatas.Close;
    qryDuplicatas.Open;
  end;

  if qryMovimentos.Active then
    qryMovimentos.Close;
  qryMovimentos.Open;
end;

procedure TdtmConfirmarromaneiosTransferencia.MontaIntervaloData;
const
  Data_1: String = '(df.data = ';
  Data_2: String = '(df.data between (';
begin
  if not DataEmBranco(FDataInicial) then begin
    if DataEmBranco(FDataFinal) then
         qryromaneiosTransferencias.MacroByName('SQL').asString := Data_1 + '''' + FDataInicial + ''') and'
    else qryromaneiosTransferencias.MacroByName('SQL').asString := Data_2 + '''' + FDataInicial + ''') and (''' + FDataFinal + ''')) and';
  end
  else begin
    if not DataEmBranco(FDataFinal) then
         qryromaneiosTransferencias.MacroByName('SQL').asString := Data_1 + '''' + FDataFinal + ''') and'
    else qryromaneiosTransferencias.MacroByName('SQL').asString := '';
  end;
end;

procedure TdtmConfirmarromaneiosTransferencia.NovoMovimento(Produto: String; Filial,FilialEstoque: Integer);
begin
  qryMovimentos.Append;
  spcMovimentosProximo.Open;
  qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
  spcMovimentosProximo.Close;
  qryMovimentosproduto.AsString   := Produto;
  qryMovimentosfilial.AsInteger     := FilialEstoque;
  qryMovimentoscliente.AsInteger    := Filial;
  qryMovimentostipocliente.AsString := 'L';
end;

procedure TdtmConfirmarromaneiosTransferencia.qryromaneiosTransferenciasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryProdutosTransferencia,[0],[qryromaneiosTransferenciasdadofiscal.AsInteger]);

end;

procedure TdtmConfirmarromaneiosTransferencia.SelecionarRegistros;
begin
  if qryromaneiosTransferenciasromaneiopassagem.asBoolean then
  begin
    MensagemAviso('Este é um romaneio de passagem e não pode ser confirmado para a emissão.')
  end
  else
  begin
    if qryromaneiosTransferenciassituacaoromaneioentrada.asString = 'CONFIRMADA' then

      MarcarRegistros(qryromaneiosTransferencias,
                      qryromaneiosTransferenciasselecionar,
                      qryromaneiosTransferenciasvalortotal, False,False)

    else
      MensagemAviso('Este romaneio não está confirmado na sua totalidade. Faça a confirmação dos volumes!')
  end;
end;

procedure TdtmConfirmarromaneiosTransferencia.SetDataFinal(const Value: String);
begin
  if FDataFinal <> Value then
    FDataFinal:= Value;
  MontaIntervaloData;
end;

procedure TdtmConfirmarromaneiosTransferencia.SetDataInicial(const Value: String);
begin
  if FDataInicial <> Value then
    FDataInicial:= Value;
  MontaIntervaloData;
end;

procedure TdtmConfirmarromaneiosTransferencia.qryProdutosTransferenciaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(FOnScrollLinhaColunaGrade) then
  FOnScrollLinhaColunaGrade(DataSet)
end;

{procedure TdtmConfirmarromaneiosTransferencia.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 arquivo : String;
begin
  inherited;
  Listar := tStringlist.create;
  arquivo := 'c:\monitor.sql';
  if fileexists(arquivo) then
    Listar.loadfromfile(arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(arquivo);
  listar.free;
end;}
constructor TdtmConfirmarromaneiosTransferencia.create(AOwner: TComponent);
begin
  inherited;
  qryProdutosTransferenciaquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosquantidade           .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
//  TCurrencyField(qryProdutosNotasPag.FieldByName('quantidade'))     .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosconserto             .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosfuturo               .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryEstoqueBloqueiofuturo          .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosdanificada           .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryEstoqueBloqueioemestoque       .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosemestoque            .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosdemonstracao         .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentosreservado            .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryMovimentostransito             .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
end;

procedure TdtmConfirmarromaneiosTransferencia.IncluirDocumentosPag;
    procedure AtribuirdadosDocumentopag;
    begin
      if qryDocumentosPag.state = dsinsert then
      begin
        spcDocumentosPagProximo.Open;
        qryDocumentosPagnumero.AsInteger:= spcDocumentosPagProximocodigo.AsInteger;
        spcDocumentosPagProximo.Close;
      end;

      qryDocumentosPagfornecedor.AsInteger    := qryNotaspag.FieldByName('fornecedor').AsInteger;
      qryDocumentosPagtipofornecedor.AsString := qryNotaspag.FieldByName('tipofornecedor').AsString;

      qryDocumentosPagemissao.AsDateTime      := qryNotaspag.FieldByName('emissao').asDateTime;
      qryDocumentosPagcomplemento.AsString    := format('%-3s',[qryNotaspag.FieldByName('serie').AsString]) + '/' +
                                                  format('%6.6d',[qryNotaspag.FieldByName('numero').AsInteger]);
      qryDocumentosPagfilialemissao.AsInteger := qryNotaspag.FieldByName('filial').AsInteger;
      qryDocumentosPagprevisao.AsBoolean      := false;
//      qryDocumentosPagreferencia.AsString     := qryNotaspagreferencia.AsString;
      qryDocumentosPagvalor.AsCurrency        := qryNotaspag.FieldByName('valornota').AsCurrency;
//      qryDocumentosPagevento.AsInteger        := qryNotaspagevento.AsInteger;
      qryDocumentosPagevento.AsInteger := parsistema.EventoPagtoDuplTransferenciaentreEmpresa;
      qryDocumentosPagdatalancto.AsDateTime   := qryNotaspag.FieldByName('data').AsDateTime;
      qryDocumentosPagadministrador.AsBoolean := UsuarioLogin.Administrador;

      qryDocumentosPagadiantamento.AsBoolean := false;
      qryDocumentosPag.post;


      qryVenctosDadosFiscais.first;
      while not qryVenctosDadosFiscais.eof do
      begin
        qryDuplicatas.append;
        qryDuplicatasdocumentopag.AsInteger := qryDocumentosPagnumero.AsInteger;

{       Embora as chaves entre duplicatas (documentopag,numero) e parcelas (contrato, numero, datavencto) sejam diferentes
        é necessário gravar o numero da parcela na duplicata e não altera-la}

//        qryDuplicatasnumero.AsInteger := qryVenctosDadosFiscais.recno;
        qryDuplicatasnumero.AsInteger := qryVenctosDadosFiscaisnumero.AsInteger;

        qryDuplicatasdatavencto.AsDateTime := qryVenctosDadosFiscaisdatavencto.AsDateTime;
        qryDuplicatasvalorvencto.AsCurrency := qryVenctosDadosFiscaisvalorvencto.asCurrency;
        qryDuplicatasvalordesconto.AsCurrency := 0;
        qryDuplicatasjuros.AsCurrency := 0;
        qryDuplicatastipojuros.AsString := '%';
        qryDuplicatasmulta.AsCurrency := 0;
        qryDuplicatastipomulta.AsString := '%';
        qryDuplicatasobservacao.AsString := 'TRANSFERÊNCIA ENTRE FILIAIS';
        qryduplicatasevento.asinteger := qryDocumentosPagevento.asinteger;


        if (qryVenctosDadosFiscaisformapagamento.asString = 'T') or
           (qryDadosFiscaisvendatransferencia.asBoolean) then //transferencia crédito troca
        begin
          qryDuplicatasdatapagto.AsDateTime := qryVenctosDadosFiscaisdatavencto.AsDateTime;
          qryDuplicatasvalorpagto.AsCurrency := qryVenctosDadosFiscaisvalorvencto.asCurrency;
          qryDuplicatasfilialpagto.AsInteger := filialbase;
          qryDuplicatasautorizado.asboolean := true;
        end
        else
          qryDuplicatasautorizado.asboolean := false;

        qryDuplicatasusuario.AsInteger := UsuarioLogin.CodigoUsuario;
        qryDuplicatas.post;

        qryVenctosDadosFiscais.next;
      end;
    end;

begin
  qryDocumentospag.append;
  AtribuirdadosDocumentopag;

  qryNotaspag.edit;
  qryNotaspag.fieldbyname('documentopag').AsInteger := qryDocumentosPagnumero.AsInteger;
  qryNotaspag.post;

end;

procedure TdtmConfirmarromaneiosTransferencia.DesbloquearEstoque;
begin
  qryEstoqueBloqueio.Sql[06] := 'false';
  Perpetrar([]); //unlock Row-level locks
end;

procedure TdtmConfirmarromaneiosTransferencia.qryromaneiosTransferenciasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  SomarQtMarcados;
end;

procedure TdtmConfirmarromaneiosTransferencia.SomarQtMarcados;
begin

  try
    qryromaneiosTransferencias.DisableControls;
    qryromaneiosTransferencias.AfterScroll := nil;
    qryromaneiosTransferencias.GuardarRegistroAtual(true);
    qryromaneiosTransferencias.first;
    QtdeMarcados := 0;
    while not qryromaneiosTransferencias.eof do
    begin
      if qryromaneiosTransferenciasselecionar.asboolean then
        QtdeMarcados := QtdeMarcados + 1; 
      qryromaneiosTransferencias.next;
    end;

  finally
    qryromaneiosTransferencias.enableControls;
    qryromaneiosTransferencias.AfterScroll := qryromaneiosTransferencias.AfterScroll;
    qryromaneiosTransferencias.VoltarRegistro;
  end;

end;

function TdtmConfirmarromaneiosTransferencia.VerificarSeRomaneiodePassagem(chv_nfe: String): boolean;

begin
   result := true;

   qryromaneiosPassagem.close;
   qryromaneiosPassagem.parambyname('cliente').asinteger := FilialBase;
   qryromaneiosPassagem.MacroByName('SQL').asString := ' df.chv_nfe = '+quotedstr(chv_nfe)+' and ';
   qryromaneiosPassagem.open;

   if qryromaneiosPassagem.recordcount = 1 then
   begin
     if (qryromaneiosPassagemsituacaoromaneioentrada.asString = 'CONFIRMADA') and
        qryromaneiosPassagemromaneiopassagem.asBoolean then
     begin
       MensagemAviso('Esta nota fiscal já foi confirmada na filial de destino');
       result := false;
     end
     else
     begin

       if qryromaneiosPassagemromaneiopassagem.asBoolean then
       begin

         if MensagemSelecionaOpcao(format('Esta nota fiscal tem como destino a filail %s.'+chr(13)+
            'Confirma a inclusão do registro do ''Romaneio de Passagem'' nesta filial?',
            [qryromaneiosPassagemcliente.asString])) = smbYES then
           result := true
         else
           result := false;

       end;

       if result then
       begin

         if not qryromaneiosTransferencias.active then
         begin
           qryromaneiosTransferencias.MacroByName('SQL').asString := ' false and ';
           qryromaneiosTransferencias.open;
         end;

         CopiarRegistros(qryromaneiosPassagem, qryromaneiosTransferencias, true, true, true, true, false, false);
       end;
     end;
   end
   else
   begin
     MensagemAviso('Nota fiscal não encontrada.');
     result := false;
   end;

end;

procedure TdtmConfirmarromaneiosTransferencia.qryromaneiosTransferenciasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if FiltrarRomaneiodePassagem then
     Accept := qryromaneiosTransferenciasromaneiopassagem.asBoolean
  else
     Accept := not qryromaneiosTransferenciasromaneiopassagem.asBoolean;
end;

end.

