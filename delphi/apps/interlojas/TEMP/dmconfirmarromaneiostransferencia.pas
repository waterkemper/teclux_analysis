unit dmconfirmarromaneiostransferencia;

interface

uses
  SysUtils, Classes, Math, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, Variants, Forms, ZTransact,
  clparametrossistema, clusuario;

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
    dsrProdutosromaneios: TtecDataSource;
    qryProdutosTransferenciadescricao: TStringField;
    qryromaneiosTransferenciasdadofiscal: TIntegerField;
    qryProdutosTransferenciaprecovenda: TFloatField;
    qryromaneiosPag: TtecQuery;
    qryProdutosromaneiosPag: TtecQuery;
    spcromaneiosPagProximo: TtecQuery;
    spcromaneiosPagProximocodigo: TIntegerField;
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
    qryromaneiosPagcodigo: TIntegerField;
    qryromaneiosPagfornecedor: TIntegerField;
    qryromaneiosPagserie: TStringField;
    qryromaneiosPagnumero: TIntegerField;
    qryromaneiosPagtipofornecedor: TStringField;
    qryromaneiosPagfilial: TIntegerField;
    qryromaneiosPagcodigofiscal: TIntegerField;
    qryromaneiosPagcodigonatureza: TIntegerField;
    qryromaneiosPagsituacao: TStringField;
    qryromaneiosPagnatureza: TStringField;
    qryromaneiosPagdata: TDateField;
    qryromaneiosPagemissao: TDateField;
    qryromaneiosPagestado: TStringField;
    qryromaneiosPagvalornota: TFloatField;
    qryromaneiosPagcontrato: TStringField;
    qryromaneiosPagfreteexterno: TFloatField;
    qryromaneiosPagfreteinterno: TFloatField;
    qryromaneiosPagdesconto: TFloatField;
    qryromaneiosPagacrescimo: TFloatField;
    qryromaneiosPagseguro: TFloatField;
    qryromaneiosPagdespesasacessorias: TFloatField;
    qryromaneiosPagbaseicmssubstituicao: TFloatField;
    qryromaneiosPagvaloricmssubstituicao: TFloatField;
    qryromaneiosPagvaloripi: TFloatField;
    qryromaneiosPagvalorservicos: TFloatField;
    qryromaneiosPagdocumentopag: TIntegerField;
    qryromaneiosPagcnpj: TStringField;
    qryromaneiosPaginscricaoestadual: TStringField;
    qryromaneiosPagobservacoes: TStringField;
    qryromaneiosPagfrete: TStringField;
    qryromaneiosPagclientecontribicms: TBooleanField;
    qryromaneiosPagtotalvalorpis: TFloatField;
    qryromaneiosPagtotalvalorcofins: TFloatField;
    qryromaneiosPagchv_nfe: TStringField;
    qryromaneiosPagvalorpis: TFloatField;
    qryromaneiosPagvalorcofins: TFloatField;
    qryromaneiosPagbaseicmscalculada: TFloatField;
    qryromaneiosPagvaloricmscalculada: TFloatField;
    qryromaneiosPagbaseicmssubstituicaocalculada: TFloatField;
    qryromaneiosPagvaloricmssubstituicaocalculada: TFloatField;
    qryromaneiosPagvaloripicalculada: TFloatField;
    qryromaneiosPagvalornotacalculada: TFloatField;
    qryromaneiosPagvalorprodutos: TFloatField;
    qryromaneiosPagvbcstretdesp: TFloatField;
    qryromaneiosPagvicmsstretdesp: TFloatField;
    qryromaneiosPagicmsbasecalculo_dev: TFloatField;
    qryromaneiosPagicmsvalor_dev: TFloatField;
    qryromaneiosPagnaoutilizarobsautomaticas: TBooleanField;
    qryromaneiosPagbaseicmsstretantcalculada: TFloatField;
    qryromaneiosPagvaloricmsstretantcalculada: TFloatField;
    qryromaneiosPagmodelodocto: TStringField;
    qryromaneiosPagbaseicms: TFloatField;
    qryromaneiosPagvaloricms: TFloatField;
    qryromaneiosPagtotalprodutos: TFloatField;
    qryromaneiosPagvalorvista: TFloatField;
    qryromaneiosPagvcredicmssn: TFloatField;
    qryromaneiosPagvicmsstret: TFloatField;
    qryromaneiosPagvbcstret: TFloatField;
    qryromaneiosPaginfcomplementar: TStringField;
    qryFilialOrigemcontribicms: TBooleanField;
    qryDadosFiscaisregimetributario: TIntegerField;
    qryromaneiosPagcrt: TIntegerField;
    qryromaneiosPagvendatransferencia: TBooleanField;
    qryromaneiosPagdadofiscalreferenciado: TIntegerField;
    qryromaneiosTransferenciascodigofiscal: TIntegerField;
    qryromaneiosTransferenciasvendatransferencia: TBooleanField;
    qryVenctosDadosFiscaistiporecebimento: TIntegerField;
    qryVenctosDadosFiscaisformapagamento: TStringField;
    qryDadosFiscaisobservacoes: TStringField;
    qryromaneiosPagvfcp: TFloatField;
    qryromaneiosPagvfcpst: TFloatField;
    qryromaneiosPagvfcpstret: TFloatField;
    qryDadosFiscaisvfcp: TFloatField;
    qryDadosFiscaisvfcpst: TFloatField;
    qryDadosFiscaisvfcpstret: TFloatField;
    qryProdutosTransferenciaprodutovisual: TStringField;
    qryProdutosTransferenciadescricaoproduto: TStringField;
    qryPedidosFiliaisqtderecebida: TFloatField;
    qryromaneiosTransferenciaschv_nfe: TStringField;
    procedure qryromaneiosTransferenciasAfterScroll(DataSet: TDataSet);
    procedure qryProdutosTransferenciaAfterScroll(DataSet: TDataSet);
    //procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FDataInicial: String;
    FDataFinal: String;
    FOnScrollLinhaColunaGrade: TNotifyEvent;
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
    procedure ConfirmaTransferencia;
    function GerarConsultaromaneiosTransferencias: Boolean;
    procedure SelecionarRegistros;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property romaneioselecionada: Boolean read Getromaneioselecionada;
    property NrRegistros: Integer read GetNrRegistros;
    property  OnScrollLinhaColunaGrade    : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
    
  end;

//var
//  dtmConfirmarromaneiosTransferencia: TdtmConfirmarromaneiosTransferencia;

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
     (qryPedidosFiliais.RecordCount = qryProdutosromaneiosPag.RecordCount)} then
  begin
      qryProdutosromaneiosPag.First;
      if(ProdAnt<>qryProdutosromaneiosPag.FieldByName('produto').AsString) then
         quantidade:=qryProdutosromaneiosPag.FieldByName('quantidade').AsFloat;

      while not qryProdutosromaneiosPag.Eof do
      begin
       // Result:= (qryPedidosFiliais.Locate('produto',qryProdutosromaneiosPag.FieldByName('produto').AsString,[]));

       qryPedidosFiliais.First;
       while not qryPedidosFiliais.Eof do
       begin
          if(qryPedidosFiliaisproduto.AsString=qryProdutosromaneiosPag.FieldByName('produto').AsString) then
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
       qryProdutosromaneiosPag.Next;
      end;
  end
end;

procedure TdtmConfirmarromaneiosTransferencia.BloquearEstoque;
var
  Pos: TBookmark;
  WhereSQL: String;
begin
  Pos := qryProdutosromaneiosPag.GetBookmark;
  qryProdutosromaneiosPag.DisableControls;
  try
    if qryProdutosromaneiosPag.RecordCount = 0 then
      WhereSQL := 'false'
    else begin
      WhereSQL := '';
      qryProdutosromaneiosPag.First;
      while Not qryProdutosromaneiosPag.Eof do begin
        WhereSQL := WhereSQL +
        '((e.produto = ' + qryProdutosromaneiosPag.FieldByName('produto').AsString + ')and' +
        '(e.filial = '   + qryProdutosromaneiosPag.FieldByName('filial').AsString  + '))or';
        qryProdutosromaneiosPag.Next
      end;
      Delete(WhereSQL, Length(WhereSQL) - 1, 2);
    end
  finally
    qryProdutosromaneiosPag.GotoBookmark(Pos);
    qryProdutosromaneiosPag.FreeBookmark(Pos);
    qryProdutosromaneiosPag.EnableControls;
  end;
  qryEstoqueBloqueio.Sql[06] := WhereSQL;
  qryEstoqueBloqueio.Open;
end;

procedure TdtmConfirmarromaneiosTransferencia.ConfirmaTransferencia;
var
  Pos: TBookmark;
  OperacaoOk: Boolean;
begin
  if MensagemConfirmacao(ctCONFIRMARromaneiosTRANSFERENCIA) = smbOk then
  begin

    ReFazConsulta(qryNaturezasPadrao,[],[]);

    Pos:= qryromaneiosTransferencias.GetBookmark;
    qryromaneiosTransferencias.DisableControls;
    qryromaneiosTransferencias.First;
    try
      while not qryromaneiosTransferencias.eof do begin
        if qryromaneiosTransferenciasselecionar.AsBoolean then begin
          ReFazConsulta(qryDadosFiscais,        [0],[qryromaneiosTransferenciasdadofiscal.AsInteger]);
          ReFazConsulta(qryProdutosDadosFiscais,[0],[qryromaneiosTransferenciasdadofiscal.AsInteger]);

          if qryDadosFiscaisvendatransferencia.asboolean then
            RefazConsultaporNome(qryVenctosDadosFiscais, ['dadofiscal'], [qryromaneiosTransferenciasdadofiscal.AsInteger]);

          InicializarTabelas;
          IncluirNota;
          IncluirProdutos;

          if qryromaneiosTransferenciasvendatransferencia.AsBoolean then
            IncluirDocumentosPag;

          OperacaoOk := CalcularImpostos(qryProdutosromaneiosPag, qryromaneiospag, true, true, false, nil, nil, false, TransferenciaEntrada, false, true, nil, false, false, false);

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
            Perpetrar([qryDocumentosPag, qryDuplicatas, qryromaneiosPag, qryMovimentos, qryProdutosromaneiosPag, qryPedidosFiliais]);
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
    
  qryromaneiosTransferencias.Params[0].AsInteger:= FilialBase;
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
  Pos := qryProdutosromaneiosPag.GetBookmark;
  qryProdutosromaneiosPag.DisableControls;
  try
    for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do
    begin
      qryProdutosromaneiosPag.First;
      while not qryProdutosromaneiosPag.Eof do
      begin
        if FiltrarComposto(qryProdutosromaneiosPag.FieldByName('composto').AsBoolean ,SituacaoProduto) then
        begin
          if qryEstoqueBloqueio.Locate('produto;filial', VarArrayOf([qryProdutosromaneiosPag.FieldByName('produto').AsString,
                                                                     qryProdutosromaneiosPag.FieldByName('filial_estoque').AsInteger]) ,[]) then
          begin
              NovoMovimento(qryProdutosromaneiosPag.FieldByName('produto').AsString, qryProdutosromaneiosPag.FieldByName('filial').AsInteger,qryProdutosromaneiosPag.FieldByName('filial_estoque').AsInteger);
              qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryromaneiosPag.FieldByName('numero').AsInteger) +
                                                     ' S-' + qryromaneiosPag.FieldByName('serie').AsString + ' TRANSFERENCIA';
              qryMovimentosquantidade.ascurrency   := qryProdutosromaneiosPag.FieldByName('quantidade').ascurrency;
              qryMovimentostipomovimento.AsString := 'STC';
              qryMovimentosvalor.AsCurrency:= RoundTo((qryMovimentosquantidade.ascurrency *
                                                         qryProdutosromaneiosPag.FieldByName('precounitario').AsCurrency),-2);
              qryMovimentoscodigonota.AsInteger   := qryProdutosromaneiosPag.FieldByName('codigonota').AsInteger;
              qryMovimentosnumerocontrole.AsInteger := qryProdutosromaneiosPag.FieldByName('numero').AsInteger;
              qryMovimentos.Post;

              if qryEstoqueBloqueiofuturo.ascurrency > 0 then
              begin
                if (qryEstoqueBloqueiofuturo.ascurrency >= qryProdutosromaneiosPag.FieldByName('quantidade').ascurrency) then
                begin
                   NovoMovimento(qryProdutosromaneiosPag.FieldByName('produto').AsString, qryProdutosromaneiosPag.FieldByName('filial').AsInteger,qryProdutosromaneiosPag.FieldByName('filial_estoque').AsInteger);
                   qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryromaneiosPag.FieldByName('numero').AsInteger) +
                                                     ' S-' + qryromaneiosPag.FieldByName('serie').AsString + ' TRANSFERENCIA';
                   qryMovimentosquantidade.ascurrency   := qryProdutosromaneiosPag.FieldByName('quantidade').ascurrency;
                   qryMovimentostipomovimento.AsString := 'FTR';
                   qryMovimentosvalor.AsCurrency:= RoundTo((qryMovimentosquantidade.ascurrency *
                                                             qryProdutosromaneiosPag.FieldByName('precounitario').AsCurrency),-2)
                end
                else
                begin
                    NovoMovimento(qryProdutosromaneiosPag.FieldByName('produto').AsString, qryProdutosromaneiosPag.FieldByName('filial').AsInteger,qryProdutosromaneiosPag.FieldByName('filial_estoque').AsInteger);
                    qryMovimentosreferencia.AsString    := 'NF-' + IntToStr(qryromaneiosPag.FieldByName('numero').AsInteger) +
                                                     ' S-' + qryromaneiosPag.FieldByName('serie').AsString + ' TRANSFERENCIA';
                    qryMovimentosquantidade.ascurrency   := qryEstoqueBloqueiofuturo.ascurrency;
                    qryMovimentostipomovimento.AsString := 'FTR';
                    qryMovimentosvalor.AsCurrency:= RoundTo((qryMovimentosquantidade.ascurrency *
                                                             qryProdutosromaneiosPag.FieldByName('precounitario').AsCurrency),-2);
                end;
                qryMovimentoscodigonota.AsInteger   := qryProdutosromaneiosPag.FieldByName('codigonota').AsInteger;
                qryMovimentosnumerocontrole.AsInteger := qryProdutosromaneiosPag.FieldByName('numero').AsInteger;
                qryMovimentos.Post;
              end;

          end;
        end;
        qryProdutosromaneiosPag.Next;
      end;
    end;
  finally
    qryProdutosromaneiosPag.GotoBookmark(Pos);
    qryProdutosromaneiosPag.FreeBookmark(Pos);
    qryProdutosromaneiosPag.EnableControls;
  end;
end;


procedure TdtmConfirmarromaneiosTransferencia.IncluirNota;

  {
  procedure SelecionarCodigoNaturezaromaneiosPag(descricao: String);
  begin
    if qryNaturezasPadrao.Locate('descricao',descricao,[]) then
    begin
      qryromaneiosPagcodigonatureza.asinteger := qryNaturezasPadraonatureza.AsInteger;
      qryromaneiosPagnatureza.AsString       := qryNaturezasPadraodescricao.AsString;
      qryromaneiosPagcodigofiscal.AsInteger   := qryNaturezasPadraocodigofiscal.AsInteger;

      if HeUnidadeFederacao(qryromaneiosPag.FieldByName('estado').AsString) then
      begin
        if qryromaneiosPag.FieldByName('estado').AsString = EstadoFilialBase then
           qryromaneiosPagcodigofiscal.AsInteger := 1000 + qryromaneiosPagcodigofiscal.AsInteger mod 1000
        else
           qryromaneiosPagcodigofiscal.AsInteger := 2000 + qryromaneiosPagcodigofiscal.AsInteger mod 1000;
      end
      else
        qryromaneiosPagcodigofiscal.AsInteger := 3000 + qryromaneiosPagcodigofiscal.AsInteger mod 1000;
    end
    else
      MensagemAviso(ctNATUREZAPADRAONAOVINCULADA);
  end;
  }

begin
  ReFazConsulta(qryFilialOrigem,[0],[qryDadosFiscaisfilial.AsInteger]);
  qryromaneiosPag.append;
  spcromaneiosPagProximo.Open;
  qryromaneiosPag.FieldByName('codigo').AsInteger:= spcromaneiosPagProximocodigo.AsInteger;
  spcromaneiosPagProximo.Close;

  qryromaneiosPag.FieldByName('fornecedor').AsInteger       := qryDadosFiscaisfilial.AsInteger;
  qryromaneiosPag.FieldByName('tipofornecedor').AsString    := 'L';
  qryromaneiosPag.FieldByName('serie').AsString             := qryDadosFiscaisserie.AsString;
  qryromaneiosPag.FieldByName('numero').AsInteger           := qryDadosFiscaisnumeronota.AsInteger;
  qryromaneiosPag.FieldByName('filial').AsInteger           := qryDadosFiscaiscliente.AsInteger;
  qryromaneiosPag.FieldByName('estado').AsString            := qryDadosFiscaisestadofilial.AsString;
  qryromaneiosPag.FieldByName('modelodocto').AsString       := qryDadosFiscaismodelodocto.asString;
  qryromaneiosPag.FieldByName('chv_nfe').AsString           := qryDadosFiscaischv_nfe.asString;
  qryromaneiosPag.FieldByName('clientecontribicms').AsBoolean := qryFilialOrigemcontribicms.AsBoolean;
  qryromaneiosPag.FieldByName('crt').AsInteger := qryDadosFiscaisregimetributario.AsInteger;

//  SelecionarCodigoNaturezaromaneiosPag(noTRANSFERENCIAMERCADORIASENTRADA);

  qryromaneiosPag.FieldByName('emissao').AsDateTime         := qryDadosFiscaisdata.AsDateTime;
  qryromaneiosPag.FieldByName('data').AsDateTime            := DataServidor;
  qryromaneiosPag.FieldByName('cnpj').AsString              := qryFilialOrigemcnpj.AsString;
  qryromaneiosPag.FieldByName('inscricaoestadual').AsString := qryFilialOrigeminscricaoestadual.AsString;
  qryromaneiosPag.FieldByName('valornota').AsCurrency       := qryDadosFiscaisvalortotal.AsCurrency;

  qryromaneiosPag.FieldByName('baseicms').AsCurrency        := qryDadosFiscaisbaseicms.AsCurrency;
  qryromaneiosPag.FieldByName('valoricms').AsCurrency       := qryDadosFiscaisvaloricms.AsCurrency;

  qryromaneiosPag.FieldByName('baseicmssubstituicao').AsCurrency  := qryDadosFiscaistotalbaseicmssubstituicao.AsCurrency;
  qryromaneiosPag.FieldByName('valoricmssubstituicao').AsCurrency := qryDadosFiscaistotalvaloricmssubstituicao.AsCurrency;


  qryromaneiosPag.FieldByName('vfcp').AsCurrency  :=      qryDadosFiscaisvfcp.asCurrency;
  qryromaneiosPag.FieldByName('vfcpst').AsCurrency  :=    qryDadosFiscaisvfcpst.asCurrency;
  qryromaneiosPag.FieldByName('vfcpstret').AsCurrency  := qryDadosFiscaisvfcpstret.asCurrency;

  qryromaneiosPag.FieldByName('observacoes').asString := qryDadosFiscaisobservacoes.asString;

  // Campos para assegurar a origem de uma nota de venda/transferencia entre empresas do mesmo ramo, util no momento da exclusão, setando a situacao
  // de pedidos filiais para 'F", permitindo imputar a nota de entrada novamente
  qryromaneiosPagvendatransferencia.AsBoolean := true;
  qryromaneiosPagdadofiscalreferenciado.asinteger :=  qryDadosFiscaisnumero.asinteger;

  {
  valoripi
  despesasacessorias
  seguro
  freteinterno
  }

  qryromaneiosPag.FieldByName('situacao').AsString := 'N';

  if qryDadosFiscaisvendatransferencia.AsBoolean then
    SelecionarDadosNaturezaPadrao(noCOMPRAS_TRANSFERENCIA_ENTRE_EMPRESA, nil, nil, qryromaneiosPag, TransferenciaEntrada)
  else
  if eHNotaFiscalSaidaDevolucao(qryDadosFiscaiscodigofiscal.AsInteger) then
    SelecionarDadosNaturezaPadrao(noENTRADADEVOLUCAO_TRANSFERENCIA_ENTRE_EMPRESA, nil, nil, qryromaneiosPag, TransferenciaEntrada)
  else
    SelecionarDadosNaturezaPadrao(noTRANSFERENCIAMERCADORIASENTRADA, nil, nil, qryromaneiosPag, TransferenciaEntrada);

  qryromaneiosPag.Post;
  qryFilialOrigem.Close;
end;

procedure TdtmConfirmarromaneiosTransferencia.IncluirProdutos;
begin
  qryProdutosDadosFiscais.First;
  while not qryProdutosDadosFiscais.Eof do
  begin
    qryProdutosromaneiosPag.Insert;
    qryProdutosromaneiosPag.FieldByName('codigonota').AsInteger          := qryromaneiosPag.FieldByName('codigo').AsInteger;
    qryProdutosromaneiosPag.FieldByName('numero').AsInteger              := qryProdutosDadosFiscaisnumero.AsInteger;
    qryProdutosromaneiosPag.FieldByName('filial').AsInteger              := FilialBase;
    qryProdutosromaneiosPag.FieldByName('filial_estoque').AsInteger      :=FilialEstoque;
    qryProdutosromaneiosPag.FieldByName('produto').AsString            := qryProdutosDadosFiscaisproduto.AsString;
    qryProdutosromaneiosPag.FieldByName('dadofiscal').asInteger          := qryProdutosDadosFiscaisdadofiscal.asinteger;
    qryProdutosromaneiosPag.FieldByName('numeroprodutotabela').asInteger := qryProdutosDadosFiscaisnumero.AsInteger;
    {
    if qryDadosFiscaisvendatransferencia.AsBoolean then
      AtribuirDadosCalculosImpostos(qryromaneiosPag, nil, nil, qryProdutosromaneiosPag, TrasnferenciaEntrada, true,  )
      }
      
    AtribuirDadosProdutos(qryProdutosromaneiosPag, qryromaneiosPag, nil, false, TransferenciaEntrada, EstadoFilialBase, );

//    qryProdutosromaneiosPag.FieldByName('precounitario').AsCurrency := qryProdutosDadosFiscaisprecovenda.AsCurrency;
//    qryProdutosromaneiosPag.FiledByNmae('quantidade').ascurrency    := qryProdutosDadosFiscaisquantidade.Ascurrency;

//    if qryProdutosDadosFiscaisincidencia.AsString<>'' then
//    begin
//      qryProdutosromaneiosPagincidencia.AsString      := qryProdutosDadosFiscaisincidencia.AsString;   <> Atribuido o valor do cadastro de produtos
//      qryProdutosromaneiosPagcst_nf.AsString          := qryProdutosDadosFiscaisincidencia.AsString;
//    end;

//    if qryProdutosDadosFiscaiscsosn.AsString<>'' then
//    begin
//      qryProdutosromaneiosPagcsosn.AsString      := qryProdutosDadosFiscaiscsosn.AsString;
//      qryProdutosromaneiosPagcsosn_nf.AsString   := qryProdutosDadosFiscaiscsosn.AsString;
//    end;

//    qryProdutosromaneiosPagipicst.AsString          := qryNaturezasPadraoipicst.AsString;
//    qryProdutosromaneiosPagcofinscst.AsString       := qryNaturezasPadraocofinscst.AsString;
//    qryProdutosromaneiosPagpiscst.AsString          := qryNaturezasPadraopiscst.AsString;

//    qryProdutosromaneiosPagorigem.AsString          := qryProdutosDadosFiscaisorigem.AsString;

//    qryProdutosromaneiosPagaliquotaicms.AsFloat     := qryProdutosDadosFiscaisaliquotaicms.AsFloat;
//    qryProdutosromaneiosPagbaseicms.AsCurrency      := qryProdutosDadosFiscaisquantidade.Ascurrency * qryProdutosDadosFiscaisprecovenda.AsFloat;

//    qryProdutosromaneiosPagvaloricms.AsCurrency     := (qryProdutosromaneiosPagbaseicms.AsCurrency*qryProdutosromaneiosPagaliquotaicms.AsFloat)/100;

//    qryProdutosromaneiosPagicmsbasecalculo.AsCurrency := qryProdutosDadosFiscaisicmsbasecalculo.AsCurrency;

//    qryProdutosromaneiosPagicmsvalor.AsCurrency := qryProdutosDadosFiscaisicmsvalor.AsCurrency;

{    qryProdutosromaneiosPagaliquotaipi.AsFloat      := 0;
    qryProdutosromaneiosPagvaloripi.AsCurrency      := 0;
    qryProdutosromaneiosPagdesconto.AsCurrency      := 0;}

//    qryProdutosromaneiosPagipibasecalculo.AsCurrency := qryProdutosDadosFiscaisipibasecalculo.AsCurrency;
//    qryProdutosromaneiosPagaliquotaipi.AsFloat      := qryProdutosDadosFiscaisaliquotaipi.AsCurrency;
//    qryProdutosromaneiosPagvaloripi.AsCurrency      := qryProdutosDadosFiscaisvaloripi.AsCurrency;

//    qryProdutosromaneiosPagcofinsbasecalculo.AsCurrency := qryProdutosDadosFiscaiscofinsbasecalculo.AsCurrency;
//    qryProdutosromaneiosPagcofinsaliquota.AsCurrency    := qryProdutosDadosFiscaiscofinsaliquota.AsCurrency;
//    qryProdutosromaneiosPagcofinsvalor.AsCurrency       := qryProdutosDadosFiscaiscofinsvalor.AsCurrency;

//    qryProdutosromaneiosPagPisbasecalculo.AsCurrency := qryProdutosDadosFiscaisPisbasecalculo.AsCurrency;
//    qryProdutosromaneiosPagPisaliquota.AsCurrency    := qryProdutosDadosFiscaisPisaliquota.AsCurrency;
//    qryProdutosromaneiosPagPisvalor.AsCurrency       := qryProdutosDadosFiscaisPisvalor.AsCurrency;

//    qryProdutosromaneiosPagdesconto.AsCurrency      := qryProdutosDadosFiscaisdesconto.AsCurrency;
//    qryProdutosromaneiosPagvalordescontoitem.AsCurrency  := qryProdutosDadosFiscaisvalordescontoitem.AsCurrency;

//    qryProdutosromaneiosPagcomposto.AsBoolean       := qryProdutosDadosFiscaiscomposto.AsBoolean;

//    qryProdutosromaneiosPagcodigofiscal.AsInteger   := qryromaneiosPagcodigofiscal.AsInteger;
//    qryProdutosromaneiosPagnatureza.AsInteger       := qryromaneiosPagcodigonatureza.AsInteger;

//    qryProdutosromaneiosPagvalorreducaobase.AsCurrency := qryProdutosDadosFiscaisreducaobase.AsCurrency;
//    qryProdutosromaneiosPagpercentualreducaobase.AsCurrency := qryProdutosDadosFiscaispercentualreducaobase.AsCurrency;
//    qryProdutosromaneiosPagacrescimo.AsCurrency :=  qryProdutosDadosFiscaisacrescimo.AsCurrency  ;
//    qryProdutosromaneiosPagfrete.AsCurrency :=  qryProdutosDadosFiscaisfrete.AsCurrency  ;
//    qryProdutosromaneiosPagseguro.AsCurrency := qryProdutosDadosFiscaisseguro.AsCurrency  ;
//    qryProdutosromaneiosPagdespesasacessorias.AsCurrency := qryProdutosDadosFiscaisdespesasacessorias.AsCurrency  ;
//    qryProdutosromaneiosPagaliquotaicmsst.AsCurrency := qryProdutosDadosFiscaisaliquotaicmsst.AsCurrency  ;
//    qryProdutosromaneiosPagicmsbasecalculost.AsCurrency := qryProdutosDadosFiscaisicmsbasecalculost.AsCurrency  ;
//    qryProdutosromaneiosPagicmsvalorst.AsCurrency := qryProdutosDadosFiscaisicmsvalorst.AsCurrency  ;

//    qryProdutosromaneiosPagpcredsn.AsCurrency := qryProdutosDadosFiscaispcredsn.AsCurrency  ;
//    qryProdutosromaneiosPagvcredicmssn.AsCurrency := qryProdutosDadosFiscaisvcredicmssn.AsCurrency  ;

//    qryProdutosromaneiosPagfatorsubstituicao.AsCurrency :=  qryProdutosDadosFiscaisfatorsubstituicao.AsCurrency ;
//    qryProdutosromaneiosPagpredbcst.AsCurrency := qryProdutosDadosFiscaispredbcst.AsCurrency  ;
//    qryProdutosromaneiosPagreducaobasest.AsCurrency := qryProdutosDadosFiscaisreducaobasest.AsCurrency  ;
//    qryProdutosromaneiosPagvbcstret.AsCurrency :=  qryProdutosDadosFiscaisvbcstret.AsCurrency ;
//    qryProdutosromaneiosPagvicmsstret.AsCurrency := qryProdutosDadosFiscaisvicmsstret.AsCurrency  ;

//    qryProdutosromaneiosPagdescricaoproduto.AsString := qryProdutosDadosFiscaisdescricaoproduto.AsString;

//    qryProdutosromaneiosPagicmsisentas.AsCurrency := qryProdutosDadosFiscaisicmsisentas.AsCurrency  ;
//    qryProdutosromaneiosPagicmsoutras.AsCurrency := qryProdutosDadosFiscaisicmsoutras.AsCurrency  ;

//    qryProdutosromaneiosPagipioutras.AsCurrency :=  qryProdutosDadosFiscaisipioutras.AsCurrency  ;
//    qryProdutosromaneiosPagipiisentas.AsCurrency :=  qryProdutosDadosFiscaisipiisentas.AsCurrency  ;

//  qryProdutosromaneiosPagunidade.AsString := qryProdutosDadosFiscaisunidade.AsString;
//  qryProdutosromaneiosPagunidadenf.AsString := qryProdutosDadosFiscaisunidade.AsString;
//  qryProdutosromaneiosPagfatorconversao.AsCurrency := 1;
//  qryProdutosromaneiosPagqtdeestoque.ascurrency    := qryProdutosDadosFiscaisquantidade.Ascurrency;

    qryProdutosromaneiosPag.post;
    qryProdutosDadosFiscais.Next;
  end;
end;

procedure TdtmConfirmarromaneiosTransferencia.InicializarTabelas;
begin
  if qryromaneiosPag.Active then
    qryromaneiosPag.Close;
  qryromaneiosPag.Open;

  if qryProdutosromaneiosPag.Active then
    qryProdutosromaneiosPag.Close;
  qryProdutosromaneiosPag.Open;

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
  Data_1: String = '(d.data = ';
  Data_2: String = '(d.data between (';
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
  MarcarRegistros(qryromaneiosTransferencias,
                  qryromaneiosTransferenciasselecionar,
                  qryromaneiosTransferenciasvalortotal, False,False);
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
//  TCurrencyField(qryProdutosromaneiosPag.FieldByName('quantidade'))     .DisplayFormat := ParSistema.MascaraQuantidadeGrade;
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

      qryDocumentosPagfornecedor.AsInteger    := qryromaneiosPag.FieldByName('fornecedor').AsInteger;
      qryDocumentosPagtipofornecedor.AsString := qryromaneiosPag.FieldByName('tipofornecedor').AsString;

      qryDocumentosPagemissao.AsDateTime      := qryromaneiosPag.FieldByName('emissao').asDateTime;
      qryDocumentosPagcomplemento.AsString    := format('%-3s',[qryromaneiosPag.FieldByName('serie').AsString]) + '/' +
                                                  format('%6.6d',[qryromaneiosPag.FieldByName('numero').AsInteger]);
      qryDocumentosPagfilialemissao.AsInteger := qryromaneiosPag.FieldByName('filial').AsInteger;
      qryDocumentosPagprevisao.AsBoolean      := false;
//      qryDocumentosPagreferencia.AsString     := qryromaneiospagreferencia.AsString;
      qryDocumentosPagvalor.AsCurrency        := qryromaneiosPag.FieldByName('valornota').AsCurrency;
//      qryDocumentosPagevento.AsInteger        := qryromaneiosPagevento.AsInteger;
      qryDocumentosPagevento.AsInteger := parsistema.EventoPagtoDuplTransferenciaentreEmpresa;
      qryDocumentosPagdatalancto.AsDateTime   := qryromaneiosPag.FieldByName('data').AsDateTime;
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

  qryromaneiosPag.edit;
  qryromaneiosPag.fieldbyname('documentopag').AsInteger := qryDocumentosPagnumero.AsInteger;
  qryromaneiosPag.post;

end;

procedure TdtmConfirmarromaneiosTransferencia.DesbloquearEstoque;
begin
  qryEstoqueBloqueio.Sql[06] := 'false';
  Perpetrar([]); //unlock Row-level locks
end;

end.
