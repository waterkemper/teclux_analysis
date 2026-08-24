unit fmCobrancaPIX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ACBrPIXPSPSicoob,
  ACBrPIXPSPSicredi, ACBrPIXPSPShipay, ACBrPIXCD, ACBrPIXPSPItau,
  ACBrPIXPSPBancoDoBrasil, ACBrPIXPSPSantander, ACBrBase, clparametrossistema,
  biblio, TypInfo, DB, ZQuery, ZPgSqlQuery, cpquery, dmbasico, dmtecsoft,
  AdvSmoothProgressBar, ACBrPIXBase, AcbrImage, ACBrDelphiZXingQRCode, ACBrUtil,
  Buttons, versao;

const
  CMaxConsultas = 36;


type

  tOpPix = (OpPixCobranca, OpPixCancelamento);

  TFluxoPagtoDados = record
    TxID: String;
    E2E: String;
    QRCode: String;
    Total: Double;
    StatusCobranca: TACBrPIXStatusCobranca;
    StatusDevolucao: TACBrPIXStatusDevolucao;
    EmErro: Boolean;
    QtdConsultas: Integer;
  end;


type
  TfrmCobrancaPIX = class(TForm)
    imFluxoQRCode: TImage;
    pgcCobrancaPIX: TPageControl;
    tstQRCode: TTabSheet;
    tstLog: TTabSheet;
    mLog: TMemo;
    ACBrPixCD1: TACBrPixCD;
    ACBrPSPSantander1: TACBrPSPSantander;
    ACBrPSPBancoDoBrasil1: TACBrPSPBancoDoBrasil;
    ACBrPSPItau1: TACBrPSPItau;
    ACBrPSPShipay1: TACBrPSPShipay;
    ACBrPSPSicredi1: TACBrPSPSicredi;
    ACBrPSPSicoob1: TACBrPSPSicoob;
    qryContasCobrancaPIX: TtecQuery;
    qryContasCobrancaPIXbanco: TIntegerField;
    qryContasCobrancaPIXagencia: TIntegerField;
    AdvSmoothProgressBar1: TAdvSmoothProgressBar;
    qryContasCobrancaPIXpix_key: TStringField;
    qryContasCobrancaPIXtype_pix_key: TStringField;
    qryContasCobrancaPIXconsumer_key: TStringField;
    qryContasCobrancaPIXconsumer_secret: TStringField;
    qryContasCobrancaPIXpath_file_pixcertified: TStringField;
    qryContasCobrancaPIXpass_pixcertified: TStringField;
    qryContasCobrancaPIXambiente_cobranca_pix: TStringField;
    qryContasCobrancaPIXtempo_espera_cobranca_pix: TStringField;
    qryContasCobrancaPIXexpiracao_cobranca_pix: TStringField;
    edFluxoCopiaECola: TEdit;
    gbFluxoStatus: TGroupBox;
    pnFluxoStatus: TPanel;
    tmConsultarPagto: TTimer;
    tmConsultarDevolucao: TTimer;
    gbFluxoCliente: TGroupBox;
    pnFluxoCliente: TPanel;
    lbFluxoClienteNome: TLabel;
    lbFluxoClienteDoc: TLabel;
    edFluxoClienteNome: TEdit;
    edFluxoClienteDoc: TEdit;
    gbFluxoTotal: TGroupBox;
    pnFluxoTotalStr: TPanel;
    gbxPIX: TGroupBox;
    procedure tmConsultarPagtoTimer(Sender: TObject);
    procedure tmConsultarDevolucaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fdmbasico: TdtmBasico;
    fFluxoDados: TFluxoPagtoDados;
    fOperacaoPIX: tOpPix;
    { Private declarations }
    procedure AdicionarLinhaLog(AMensagem: String);
    procedure ConsultarCobranca;
    procedure ConsultarDevolucao;

    procedure AtualizarStatus(aStatus: TACBrPIXStatusCobranca = stcNENHUM;
      aStatusDevolucao: TACBrPIXStatusDevolucao = stdNENHUM);


    procedure AvaliarInterfaceFluxo;

    function FormatarJSON(const AJSON: String): String;

  protected
    Nome, Documento: String; ValorCobrado: Currency;
    procedure EfetuarCobrancaPIX;
    procedure ConfigurarACBrPIXCD;
    procedure ConfigurarACBrPSPs;
  public
    { Public declarations }

    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;

    property dmbasico : TdtmBasico read fdmbasico write fdmbasico;

    property FluxoDados: TFluxoPagtoDados read fFluxoDados;
    property OperacaoPIX: tOpPix read fOperacaoPIX write fOperacaoPIX;

  end;

  procedure EfetuarCobrancaPIX(Nome, Documento: String; ValorCobrado: Currency);

var
  frmCobrancaPIX: TfrmCobrancaPIX;

implementation

{$R *.dfm}

{ TfrmCobrancaPIX }

procedure TfrmCobrancaPIX.AdicionarLinhaLog(AMensagem: String);
begin
  if Assigned(mLog) then
    mLog.Lines.Add(AMensagem);
end;

procedure TfrmCobrancaPIX.AtualizarStatus(aStatus: TACBrPIXStatusCobranca;
  aStatusDevolucao: TACBrPIXStatusDevolucao);

  procedure AtualizarPanelPrincipal(aTexto: String; aCor: TColor);
  begin
    pnFluxoStatus.Color := aCor;
    pnFluxoStatus.Caption := aTexto;
  end;
  
begin
  if FluxoDados.EmErro then
  begin
    AtualizarPanelPrincipal('ERRO AO CONSULTAR', clRed);
    AvaliarInterfaceFluxo;
    Exit;
  end;

  fFluxoDados.StatusCobranca := aStatus;
  fFluxoDados.StatusDevolucao := aStatusDevolucao;
  AvaliarInterfaceFluxo;

  case FluxoDados.StatusDevolucao of
    stdDEVOLVIDO: AtualizarPanelPrincipal('PAGAMENTO DEVOLVIDO', $009A9A9A);
    stdEM_PROCESSAMENTO: AtualizarPanelPrincipal('DEVOLUÇAO PENDENTE', $00523C30);
    stdNAO_REALIZADO: AtualizarPanelPrincipal('DEVOLUÇÃO NÃO REALIZADA', $00523C30);
  else
    case FluxoDados.StatusCobranca of
      stcATIVA: AtualizarPanelPrincipal('AGUARDANDO PAGAMENTO', $001ADAE3);
      stcCONCLUIDA: AtualizarPanelPrincipal('PAGAMENTO FINALIZADO', $0009E31F);
      stcREMOVIDA_PELO_USUARIO_RECEBEDOR: AtualizarPanelPrincipal('PAGAMENTO CANCELADO', $000600EA);
      stcREMOVIDA_PELO_PSP: AtualizarPanelPrincipal('CANCELADO PELO PSP', $000600EA);
    else
      AtualizarPanelPrincipal('VENDENDO', clMenuHighlight);
    end;
  end;

end;

procedure TfrmCobrancaPIX.AvaliarInterfaceFluxo;
var
  wVendendo, wSemEstorno, wAguardandoPagto: Boolean;
begin
  with fFluxoDados do
  begin
    wSemEstorno := (StatusDevolucao = stdNENHUM);
    wAguardandoPagto := (StatusCobranca = stcATIVA);
    wVendendo := (StatusCobranca = stcNENHUM) and (StatusDevolucao = stdNENHUM);

//    gbFluxoCliente.Enabled := wVendendo;
//    gbFluxoItens.Enabled := wVendendo;

//    btFluxoPagar.Visible := wVendendo;
//    btFluxoPagar.Enabled := wVendendo and (Total > 0);

    imFluxoQRCode.Visible := wAguardandoPagto;
    edFluxoCopiaECola.Visible := wAguardandoPagto;
//    btFluxoCancelarCobranca.Visible := wAguardandoPagto;
//    btFluxoEstornarPagto.Visible := (StatusCobranca = stcCONCLUIDA) and wSemEstorno;
//    btFluxoNovaVenda.Visible := (StatusCobranca <> stcNENHUM) or (StatusDevolucao = stdDEVOLVIDO);
  end;

//  if gbFluxoItens.Enabled then
//    AvaliarInterfaceFluxoItem;
end;

procedure TfrmCobrancaPIX.ConfigurarACBrPIXCD;
begin

  dmbasico.RefazConsultaPorNome(qryContasCobrancaPIX, ['ContaCobrancaPIX'], [Parsistema.ContaCobrancaPIX], true);

  if qryContasCobrancaPIX.recordcount = 1 then
  begin

    if (qryContasCobrancaPIXambiente_cobranca_pix.asString<>'') and
       (qryContasCobrancaPIXtempo_espera_cobranca_pix.asString<>'') then
    begin
      AdicionarLinhaLog('  - ConfigurarACBrPIXCD');

      with ACBrPixCD1.DadosAutomacao do
      begin
        CNPJSoftwareHouse := '85280642000144';
        NomeAplicacao := 'TecLux.exe';
        NomeSoftwareHouse := 'TecSoft';
        VersaoAplicacao := GetVersao;
      end;

      ACBrPixCD1.Recebedor.Nome := FNomeFilialBase;
      ACBrPixCD1.Recebedor.CEP := FCEPFilialBase;
      ACBrPixCD1.Recebedor.Cidade := FCidadeFilialBase;
      ACBrPixCD1.Recebedor.UF := FEstadoFilialBase;
      //ACBrPixCD1.Recebedor.CodCategoriaComerciante := seRecebedorMCC.Value;


      ACBrPixCD1.Ambiente := TACBrPixCDAmbiente(GetEnumValue(TypeInfo(TACBrPixCDAmbiente),
        qryContasCobrancaPIXambiente_cobranca_pix.asString ));

      ACBrPixCD1.TimeOut := strtoint(qryContasCobrancaPIXtempo_espera_cobranca_pix.asString);

    {
      ACBrPixCD1.Proxy.Host := edtProxyHost.Text;
      ACBrPixCD1.Proxy.Port := seProxyPorta.Text;
      ACBrPixCD1.Proxy.User := edtProxyUser.Text;
      ACBrPixCD1.Proxy.Pass := edtProxySenha.Text;
    }

      ACBrPixCD1.ArqLOG := ExtractFilePath(Application.ExeName) + 'log\pix_log'+formatdatetime('yyyy-MM-dd', date())+'.txt';
      ACBrPixCD1.NivelLog := 4;



      if qryContasCobrancaPIX.recordcount = 1 then
      begin

         case qryContasCobrancaPIXBanco.AsInteger of   {Banco do Brasil}
         001: ACBrPixCD1.PSP := ACBrPSPBancoDoBrasil1;
         341: ACBrPixCD1.PSP := ACBrPSPItau1;
         033: ACBrPixCD1.PSP := ACBrPSPSantander1;
         748: ACBrPixCD1.PSP := ACBrPSPSicredi1;
         756: ACBrPixCD1.PSP := ACBrPSPSicoob1;
   (*    ???: ACBrPixCD1.PSP := ACBrPSPShipay1; *)
        else
          raise Exception.Create('PSP configurado é inválido');
        end;

      end
      else
      begin
        MensagemAviso(Format('Conta Bancária %s para cobrança PIX inexistente.',[Parsistema.ContaCobrancaPIX]));
        Abort;
      end;

    end
    else
    begin
      MensagemAviso('Favor configurar os parametros do PIX');
      Abort;
    end;

  end
  else
  begin
    MensagemAviso(Format('Conta Bancária %s para cobrança PIX inexistente.',[Parsistema.ContaCobrancaPIX]));
    Abort;
  end;


end;

procedure TfrmCobrancaPIX.ConfigurarACBrPSPs;
begin
  if ACBrPixCD1.PSP = ACBrPSPBancoDoBrasil1 then
  begin

  end
  else
  if ACBrPixCD1.PSP = ACBrPSPItau1          then
  begin

  end
  else
  if ACBrPixCD1.PSP = ACBrPSPSantander1     then
  begin
    ACBrPSPSantander1.ChavePIX := qryContasCobrancaPIXpix_key.asString;
    ACBrPSPSantander1.ConsumerKey := qryContasCobrancaPIXconsumer_key.asString;
    ACBrPSPSantander1.ConsumerSecret := qryContasCobrancaPIXconsumer_secret.asString;
    ACBrPSPSantander1.SenhaPFX := qryContasCobrancaPIXpass_pixcertified.asString;
    ACBrPSPSantander1.ArquivoPFX := qryContasCobrancaPIXpath_file_pixcertified.asString;
  end
  else
  if ACBrPixCD1.PSP = ACBrPSPSicredi1       then
  begin

  end
  else
  if ACBrPixCD1.PSP = ACBrPSPSicoob1        then
  begin

  end;

end;

procedure TfrmCobrancaPIX.ConsultarCobranca;
begin
  if EstaVazio(fFluxoDados.TxID) then
  begin
    ShowMessage('Nenhum TxID para ser consultado');
    Exit;
  end;

  try
    if (not ACBrPixCD1.PSP.epCob.ConsultarCobrancaImediata(fFluxoDados.TxID)) then
    begin
      fFluxoDados.EmErro := True;
      ShowMessage('Erro ao consultar cobrança' + sLineBreak +
        ACBrPixCD1.PSP.epCob.Problema.title + sLineBreak +
        ACBrPixCD1.PSP.epCob.Problema.detail);
    end;

    if (ACBrPixCD1.PSP.epCob.CobCompleta.pix.Count > 0) then
      fFluxoDados.E2E := ACBrPixCD1.PSP.epCob.CobCompleta.pix[0].endToEndId;
    AtualizarStatus(ACBrPixCD1.PSP.epCob.CobCompleta.status);
  finally
  
  end;

end;

constructor TfrmCobrancaPIX.Create(Aowner: Tcomponent);
begin
  inherited;
  if not assigned(dmbasico) then
    dmbasico := TdtmBasico.create(self);

end;

destructor TfrmCobrancaPIX.Destroy;
begin

  inherited;
end;

procedure EfetuarCobrancaPIX(Nome, Documento: String; ValorCobrado: Currency);
begin
  if not assigned(frmCobrancaPIX) then
    frmCobrancaPIX := TfrmCobrancaPIX.Create(frmCobrancaPIX);

  frmCobrancaPIX.nome := nome;

  frmCobrancaPIX.edFluxoClienteNome.text := nome;

  frmCobrancaPIX.Documento := documento;
  frmCobrancaPIX.edFluxoClienteDoc.text := Documento;

  frmCobrancaPIX.ValorCobrado := ValorCobrado;
  frmCobrancaPIX.pnFluxoTotalStr.Caption := FormatFloatBr(ValorCobrado, 'R$ ,0.00');

  frmCobrancaPIX.OperacaoPIX := OpPixCobranca;



  frmCobrancaPIX.showmodal;


{
  frmConferenciaDocumentos.qryTabelaDadosFiscais := qryTabelaDadosFiscais;
  frmConferenciaDocumentos.NomeCampoRomaneio     := NomeCampoRomaneio;
  frmConferenciaDocumentos.NomeCampoDadoFiscal   := NomeCampoDadoFiscal;

  frmConferenciaDocumentos.Tipo                  := Tipo;
  frmConferenciaDocumentos.CodigoDocumento       := CodigoDocumento;
  frmConferenciaDocumentos.TipoRomaneio          := TipoRomaneio;
  frmConferenciaDocumentos.LereGravar := LereGravar;
}
end;

procedure TfrmCobrancaPIX.EfetuarCobrancaPIX;
var
  wDoc: String;
begin
  ConfigurarACBrPIXCD;
  ConfigurarACBrPSPs;

  try
    with ACBrPixCD1.PSP.epCob.CobSolicitada do
    begin
      Clear;
      chave := ACBrPixCD1.PSP.ChavePIX;
      calendario.expiracao := qryContasCobrancaPIXexpiracao_cobranca_pix.asinteger;

      if (Nome <> EmptyStr) then
      begin
        devedor.nome := Nome;
        wDoc := SomenteNumero(Documento);

        if (wDoc = EmptyStr) then
        begin
          ShowMessage('CPF/CNPJ do cliente não foi informado.');
          Exit;
        end
        else if (Length(wDoc) > 11) then
          devedor.cnpj := wDoc
        else
          devedor.cpf := wDoc;
      end;

      // PSP Shipay necessita enviar os itens
      (*
      if (ACBrPixCD1.PSP is TACBrPSPShipay) then
      begin
        with infoAdicionais.New do
        begin
          nome := 'order_ref';
          valor := FormatDateTime('yymmddhhnnss', Now);
        end;

        for I := 1 to Pred(gdFluxoItens.RowCount) do
          with infoAdicionais.New do
          begin
            nome := 'item_' + IntToStr(I);
            valor := '{' +
              '"ean": "' + gdFluxoItens.Cells[0, I] + '", ' +
              '"item_title": "' + gdFluxoItens.Cells[1, I] + '", ' +
              '"quantity": 1, ' +
              '"sku": "' + gdFluxoItens.Cells[0, I] + '", ' +
              '"unit_price": ' + StringReplace(gdFluxoItens.Cells[2, I], '.', '', []) + '}';
          end;
      end;
      *)

      valor.original := ValorCobrado;
    end;

    if ACBrPixCD1.PSP.epCob.CriarCobrancaImediata then
    begin
      fFluxoDados.TxID := ACBrPixCD1.PSP.epCob.CobGerada.txId;
      fFluxoDados.QRCode := Trim(ACBrPixCD1.PSP.epCob.CobGerada.pixCopiaECola);

      if (fFluxoDados.QRCode = EmptyStr) then
        fFluxoDados.QRCode := ACBrPixCD1.GerarQRCodeDinamico(ACBrPixCD1.PSP.epCob.CobGerada.location);

      edFluxoCopiaECola.Text := fFluxoDados.QRCode;
      AcbrImage.PintarQRCode(fFluxoDados.QRCode, imFluxoQRCode.Picture.Bitmap, qrUTF8BOM);
      ConsultarCobranca;
    end
    else
    begin
      fFluxoDados.EmErro := True;
      ShowMessage('Erro ao criar cobrança: ' + sLineBreak +
        FormatarJSON(ACBrPixCD1.PSP.epCob.Problema.AsJSON));
    end;

    tmConsultarPagto.Enabled := True;
  finally
//    HabilitarInterface(True);
  end;

end;

function TfrmCobrancaPIX.FormatarJSON(const AJSON: String): String;
{$IfDef FPC}
var
  jpar: TJSONParser;
  j: TJsonObject;
{$EndIf}
begin
  Result := AJSON;
  {$IfDef FPC}
  try
    j := TJSONObject.Create();
    try
      Result := j.Decode(Result);
    finally
      j.Free;
    end;
    jpar := TJSONParser.Create(Result, [joUTF8]);
    try
      Result := jpar.Parse.FormatJSON([], 2);
    finally
      jpar.Free;
    end;
  except
    Result := AJSON;
  end;
  {$EndIf}
end;

procedure TfrmCobrancaPIX.tmConsultarPagtoTimer(Sender: TObject);
begin
  tmConsultarPagto.Enabled := False;
  try
    if EstaVazio(FluxoDados.TxID) then
    begin
      ShowMessage('Nenhuma cobrança a ser consultada');
      Exit;
    end;

    ConsultarCobranca;
    fFluxoDados.QtdConsultas := fFluxoDados.QtdConsultas + 1;
  finally
    if (FluxoDados.StatusCobranca = stcATIVA) and
       (not fFluxoDados.EmErro) and
       (fFluxoDados.QtdConsultas <= CMaxConsultas) then
      tmConsultarPagto.Enabled := True;
  end;

end;

procedure TfrmCobrancaPIX.tmConsultarDevolucaoTimer(Sender: TObject);
begin
  tmConsultarDevolucao.Enabled := False;
  try
    if EstaVazio(FluxoDados.E2E) then
    begin
      ShowMessage('Nenhum pagamento a ser consultado (E2E)');
      Exit;
    end;

    ConsultarDevolucao;
  finally
    if (FluxoDados.StatusDevolucao = stdEM_PROCESSAMENTO) then
      tmConsultarDevolucao.Enabled := True;
  end;
end;

procedure TfrmCobrancaPIX.ConsultarDevolucao;
begin
begin
  if EstaVazio(fFluxoDados.E2E) then
  begin
    ShowMessage('Nenhum E2E para ser consultar');
    Exit;
  end;

//  HabilitarInterface(False);
  try
    if (not ACBrPixCD1.PSP.epPix.ConsultarPix(fFluxoDados.E2E)) then
    begin
      fFluxoDados.EmErro := True;
      ShowMessage('Erro ao consultar devolucao' + sLineBreak +
        ACBrPixCD1.PSP.epPix.Problema.title + sLineBreak +
        ACBrPixCD1.PSP.epPix.Problema.detail);
    end;

    if (ACBrPixCD1.PSP.epPix.Pix.devolucoes.Count > 0) then
      AtualizarStatus(stcNENHUM, ACBrPixCD1.PSP.epPix.Pix.devolucoes[0].status);
  finally
//    HabilitarInterface(True);
  end;
end;

end;

procedure TfrmCobrancaPIX.FormShow(Sender: TObject);
begin
  case OperacaoPIX of
    OpPixCobranca : frmCobrancaPIX.EfetuarCobrancaPIX;
  end;
end;

end.
