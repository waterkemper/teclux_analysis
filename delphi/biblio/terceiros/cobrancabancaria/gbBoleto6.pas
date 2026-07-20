unit gbBoleto6;

interface

uses Classes, Controls, ExtCtrls, QuickRpt, Qrctrls, Graphics;

type
  TBoleto = class(TQuickRep)
    bandDetalhe: TQRBand;
    txtNomeBanco: TQRLabel;
    lblReciboSacado: TQRLabel;
    txtNomeCedente: TQRLabel;
    txtDataDocumento: TQRLabel;
    txtNumeroDocumento: TQRLabel;
    txtEspecieDocumento: TQRLabel;
    txtAceite: TQRLabel;
    txtUsoBanco: TQRLabel;
    txtCarteira: TQRLabel;
    txtQuantidadeMoeda: TQRLabel;
    txtEspecieMoeda: TQRLabel;
    txtSacadoNome: TQRLabel;
    txtSacadoRuaNumeroComplemento: TQRLabel;
    txtSacadoCEPBairroCidadeEstado: TQRLabel;
    txtSacadoCPFCGC: TQRLabel;
    txtCodigoBaixa: TQRLabel;
    txtLocalPagamento: TQRLabel;
    txtValorCobrado: TQRLabel;
    txtValorMoraMultaB: TQRLabel;
    txtValorMoraMulta: TQRLabel;
    txtValorDescontoAbatimentoB: TQRLabel;
    txtValorDescontoAbatimento: TQRLabel;
    txtValorDocumento: TQRLabel;
    txtNossoNumero: TQRLabel;
    txtAgenciaCodigoCedente: TQRLabel;
    txtDataVencimento: TQRLabel;
    txtDataProcessamento: TQRLabel;
    txtValorMoeda: TQRLabel;
    lblLocalPagamento: TQRLabel;
    lblDataDocumento: TQRLabel;
    lblNumeroDocumento: TQRLabel;
    lblDataVencimento: TQRLabel;
    lblAgenciaCodigoCedente: TQRLabel;
    lblNossoNumero: TQRLabel;
    lblEspecieDocumento: TQRLabel;
    lblAceite: TQRLabel;
    lblDataProcessamento: TQRLabel;
    lblUsoBanco: TQRLabel;
    lblCarteira: TQRLabel;
    lblEspecieMoeda: TQRLabel;
    lblQuantidadeMoeda: TQRLabel;
    lblValorMoeda: TQRLabel;
    lblValorDocumento: TQRLabel;
    lblInstrucoes: TQRLabel;
    lblValorDescontoAbatimento: TQRLabel;
    lblValorMoraMulta: TQRLabel;
    lblValorCobrado: TQRLabel;
    lblSacado: TQRLabel;
    lblCodigoBaixa: TQRLabel;
    lblSacadoCPFCGC: TQRLabel;
    lblNomeCedente: TQRLabel;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRImage6: TQRImage;
    QRImage7: TQRImage;
    QRImage8: TQRImage;
    QRImage9: TQRImage;
    QRImage11: TQRImage;
    QRImage10: TQRImage;
    QRImage12: TQRImage;
    QRImage13: TQRImage;
    QRImage14: TQRImage;
    QRImage15: TQRImage;
    QRImage16: TQRImage;
    QRImage17: TQRImage;
    txtCodigoBanco: TQRLabel;
    lblAutenticacaoMecanica: TQRLabel;
    lblRecebidoComCheque: TQRLabel;
    lblRecebidoComChequeB: TQRLabel;
    lblRecebidoComChequeC: TQRLabel;
    QRShape2: TQRShape;
    txtNomeBanco3: TQRLabel;
    txtLinhaDigitavel3: TQRLabel;
    txtNomeCedente3: TQRLabel;
    txtDataDocumento3: TQRLabel;
    txtNumeroDocumento3: TQRLabel;
    txtEspecieDocumento3: TQRLabel;
    txtAceite3: TQRLabel;
    txtUsoBanco3: TQRLabel;
    txtCarteira3: TQRLabel;
    txtQuantidadeMoeda3: TQRLabel;
    txtEspecieMoeda3: TQRLabel;
    txtSacadoNome3: TQRLabel;
    txtSacadoRuaNumeroComplemento3: TQRLabel;
    txtSacadoCEPBairroCidadeEstado3: TQRLabel;
    txtSacadoCPFCGC3: TQRLabel;
    txtCodigoBaixa3: TQRLabel;
    txtLocalPagamento3: TQRLabel;
    txtValorCobrado3: TQRLabel;
    txtValorMoraMultaB3: TQRLabel;
    txtValorMoraMulta3: TQRLabel;
    txtValorDescontoAbatimentoB3: TQRLabel;
    txtValorDescontoAbatimento3: TQRLabel;
    txtValorDocumento3: TQRLabel;
    txtNossoNumero3: TQRLabel;
    txtAgenciaCodigoCedente3: TQRLabel;
    txtDataVencimento3: TQRLabel;
    txtDataProcessamento3: TQRLabel;
    txtValorMoeda3: TQRLabel;
    lblLocalPagamento3: TQRLabel;
    lblDataDocumento3: TQRLabel;
    lblNumeroDocumento3: TQRLabel;
    lblDataVencimento3: TQRLabel;
    lblAgenciaCodigoCedente3: TQRLabel;
    lblNossoNumero3: TQRLabel;
    lblEspecieDocumento3: TQRLabel;
    lblAceite3: TQRLabel;
    lblDataProcessamento3: TQRLabel;
    lblUsoBanco3: TQRLabel;
    lblCarteira3: TQRLabel;
    lblEspecieMoeda3: TQRLabel;
    lblQuantidadeMoeda3: TQRLabel;
    lblValorMoeda3: TQRLabel;
    lblValorDocumento3: TQRLabel;
    lblInstrucoes3: TQRLabel;
    lblValorDescontoAbatimento3: TQRLabel;
    lblMoraMulta3: TQRLabel;
    lblValorCobrado3: TQRLabel;
    lblSacado3: TQRLabel;
    lblCodigoBaixa3: TQRLabel;
    lblSacadoCPFCGC3: TQRLabel;
    lblNomeCedente3: TQRLabel;
    QRImage36: TQRImage;
    QRImage37: TQRImage;
    QRImage38: TQRImage;
    QRImage39: TQRImage;
    QRImage40: TQRImage;
    QRImage41: TQRImage;
    QRImage42: TQRImage;
    QRImage43: TQRImage;
    QRImage44: TQRImage;
    QRImage45: TQRImage;
    QRImage46: TQRImage;
    QRImage47: TQRImage;
    QRImage48: TQRImage;
    QRImage49: TQRImage;
    QRImage50: TQRImage;
    QRImage51: TQRImage;
    txtCodigoBanco3: TQRLabel;
    lblAutenticacaoMecanica3: TQRLabel;
    imgCodigoBarras3: TQRImage;
    txtInstrucoes: TQRMemo;
    txtInstrucoes3: TQRMemo;
    imgLogo1: TQRImage;
    imgLogo3: TQRImage;
    QRImage1: TQRImage;
    QRImage18: TQRImage;
    QRLabel1: TQRLabel;
  private

  public

  end;

var
  Boleto: TBoleto;

implementation

{$R *.DFM}

end.

