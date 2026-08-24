unit fmcadastrocontas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  Mask, DBCtrls, cptexto, ComCtrls,  Buttons,
  ExtCtrls, DB, Windows,{Qete,}

  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes, biblio,
  // Componentes
  cpdbfindcontrols, cpdocumento, cpdbtext, cpdbgrid, cpdbdata,
  cpcnpj,
  //Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmcadastrobancos, cpnumero, cpdbmemo, frconsulta, frconsultacodigo,
  frconsultacontabil, frconsultacodigocontabil, ToolWin, cpcpfcnpj,
  cpdbradiogroup, cpdbcombobox, DBMaplistCombobox, frendereco,
  frenderecoeditor, Spin, cpdbspinedit, ACBrPIXCD, ACBrUtil, ACBrPIXBase,
  ACBrOpenSSLUtils, TypInfo, ACBrBase, ImgList;


type
  Tfrmcadastrocontas = class(TfrmCadastroPadrao)
    plnFundoJanela: TPanel;
    edtConta: TDBEditNumero;
    edtDigito: TDBEditTexto;
    lblDigito: TLabel;
    dtxSigla: TtecDBText;
    dtxNomeAgencia: TtecDBText;
    edtTitular: TDBEditTexto;
    gbxBancoConta: TGroupBox;
    gbxAgenciaConta: TGroupBox;
    gbxContaCorrente: TGroupBox;
    gbxTitular: TGroupBox;
    gbxConvenio: TGroupBox;
    edtConvenio: TDBEditNumero;
    gbxCedente: TGroupBox;
    edtCedente: TDBEditTexto;
    gbxContaContabil: TGroupBox;
    gbxInstrucoesBoleto: TGroupBox;
    gbxLocalPagamento: TGroupBox;
    edtLocal_1: TDBEditTexto;
    mmoInstrucoesBoleto: TtecDBMemo;
    gbxUsoDoBanco: TGroupBox;
    edtusodobanco: TDBEditTexto;
    gbxCarteira: TGroupBox;
    edtcarteira: TDBEditTexto;
    ckbincluircontanofluxodecaixa: TDBCheckBox;
    fraConsultaContaContabil: TfraConsultaCodigoContabil;
    gbxSelecaoFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxViasBoleto: TGroupBox;
    edtViasBoleto: TDBEditNumero;
    edtLocal_2: TDBEditTexto;
    gbxTaxaBoleto: TGroupBox;
    edtTaxaBoleto: TDBEditNumero;
    gbxVariacaoCarteira: TGroupBox;
    edtVaricaoCarteira: TDBEditTexto;
    gbxFormatacaoConvenio: TGroupBox;
    edtFormatacaoConvenio: TDBEditTexto;
    gbxContrato: TGroupBox;
    edtContrato: TDBEditTexto;
    gbxFormatacaoNossoNumero: TGroupBox;
    edtFormatacaoNossoNumero: TDBEditTexto;
    gbxIsentoTaxaBoleto: TGroupBox;
    edtIsentoTaxaBoleto: TDBEditNumero;
    gbxBancoReferencia: TGroupBox;
    edtBancoReferencia: TDBEditTexto;
    gbxAgenciaReferencial: TGroupBox;
    edtAgenciaReferencia: TDBEditTexto;
    gbxCNPJ: TGroupBox;
    edtCNPJ: TDBEditCPFCNPJ;
    gbxNomeCedente: TGroupBox;
    edtNomeCedente: TDBEditTexto;
    gbxCodSingular: TGroupBox;
    edtCodSingular: TDBEditTexto;
    grxTipoRecebimento: TGroupBox;
    fraConsultaTipoRecebimentos: TfraConsultaCodigo;
    gbxInformacoesReferenciais: TGroupBox;
    gbxInformacoesBoleto: TGroupBox;
    lblFluxoCaixa: TLabel;
    lblIsentoTaxa: TLabel;
    chkIncluirInstrucoesArquivoBanco: TDBCheckBox;
    lblTaxa: TLabel;
    lblPadrao: TLabel;
    rgpCNAB: TtecDBRadioGroup;
    rbn240: TtecRadioButton;
    rbn400: TtecRadioButton;
    gbxEspecieDocto: TGroupBox;
    gbxCodProtesto: TGroupBox;
    gbxNrDiasProtesto: TGroupBox;
    DBEditNumero1: TDBEditNumero;
    cmbEspecieDocto: TDBMaplistCombobox;
    cmbCodigoProtesto: TDBMaplistCombobox;
    gbxInativa: TGroupBox;
    edtDataInicial: TDBEditData;
    chkIncluirEmailNoArquivoBanco: TDBCheckBox;
    gbxDiasBaixaAutomatica: TGroupBox;
    DBEditNumero2: TDBEditNumero;
    gbxCodigoTipoMora: TGroupBox;
    edtCodigoTipoMora: TDBEditTexto;
    pgcDetalheContas: TPageControl;
    tstCedenteGerais: TTabSheet;
    tstDadosCedente: TTabSheet;
    fraEnderecoResidencia: TfraEnderecoEditor;
    gbxCPNJCedente: TGroupBox;
    DBEditCPFCNPJ1: TDBEditCPFCNPJ;
    gbxChaveFixa: TGroupBox;
    edtchave_fixa_sicredi: TDBEditTexto;
    gbxSequencialdaRemessa: TGroupBox;
    edtSequencialdaRemessa: TDBEditTexto;
    ckbReiniciarSequencialNovaData: TDBCheckBox;
    tecSimples: TtecRadioButton;
    tecVinculada: TtecRadioButton;
    tecCaucionada: TtecRadioButton;
    tecDescontada: TtecRadioButton;
    rbnTipoCobranca_: TtecDBRadioGroup;
    tecVendor: TtecRadioButton;
    ckbIntegracaoNexxera: TDBCheckBox;
    pgcConta: TPageControl;
    tstBoletos: TTabSheet;
    tstCobrancaPIX: TTabSheet;
    lbSantanderChavePIX: TLabel;
    lbSantanderTipoChave: TLabel;
    lbSantanderConsumerKey: TLabel;
    lbSantanderConsumerSecret: TLabel;
    imSantanderErroChavePIX: TImage;
    sbAcharCertificadoPFX: TSpeedButton;
    lbSantanderArqCertificadoPFX: TLabel;
    lbErroCertificadoPFX: TLabel;
    lbSantanderSenhaCertificado: TLabel;
    sbVerSenhaPFX: TSpeedButton;
    edChavePIX: TDBEditTexto;
    cbxTipoChave: TDBMaplistCombobox;
    edConsumerKey: TDBEditTexto;
    edConsumerSecret: TDBEditTexto;
    edArqCertificadoPFX: TDBEditTexto;
    edSenhaCertificadoPFX: TDBEditTexto;
    Label15: TLabel;
    cbxAmbiente: TDBMaplistCombobox;
    Label17: TLabel;
    seTimeout: TDBSpinEdit;
    Label47: TLabel;
    seCobrancaExpiracao: TDBSpinEdit;
    imErroCertificadoPFX: TImage;
    OpenDialog1: TOpenDialog;
    ACBrOpenSSLUtils1: TACBrOpenSSLUtils;
    ImageList1: TImageList;

    procedure FormShow(Sender: TObject);
    procedure sbAcharCertificadoPFXClick(Sender: TObject);
    procedure sbVerSenhaPFXClick(Sender: TObject);

 protected
    dtmCadastroBancos: TdtmCadastroBancos;
    function  InternoIncluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoExcluir: Boolean; override;

  private
    { Private declarations }
    procedure ValidarCertificadoPSP;
    procedure InicializarBitmaps;

  public
    { Public declarations }
    procedure  SetDataModulo(Dtm: TdtmCadastroBancos);
    constructor Create(AOwner: TComponent); Override;
    destructor Destroy; override;
    Function  ValidaControles: Boolean;

  end;

var
  frmcadastrocontas: Tfrmcadastrocontas;
  TipoPesquisa: TtecProcuraBancos;

implementation

uses fmnavcontroles;

{$R *.dfm}


procedure TfrmCadastroContas.SetDataModulo(Dtm: TdtmCadastroBancos);
begin
  dtmCadastroBancos := Dtm;

  cbxAmbiente.ItemIndex := cbxAmbiente.Items.IndexOf(dtmCadastroBancos.qryContasambiente_cobranca_pix.asString);
  cbxTipoChave.itemINdex := cbxTipoChave.Items.IndexOf(dtmCadastroBancos.qryContastype_pix_key.asString);
  
end;

function TfrmCadastroContas.InternoIncluir: Boolean;
begin
  Result:= False;
  if not CtrlOn then
    Result:= dtmCadastroBancos.IncluirContas(False);
end;

function TfrmCadastroContas.InternoGravar: Boolean;
begin
  if not ValidaControles then
     Exit;

  Result:= False;
  if not CtrlOn then
      Result:= dtmCadastroBancos.GravarConta;
end;

function TfrmCadastroContas.InternoExcluir: Boolean;
begin
  Result:= False;
  if not CtrlOn then
    with dtmCadastroBancos do
      Result:= ExcluirContas;
end;

destructor TfrmCadastroContas.Destroy;
begin
  inherited;
  frmCadastroContas := nil;
end;


procedure Tfrmcadastrocontas.FormShow(Sender: TObject);
begin
  inherited;
  with dtmCadastroBancos do begin
    qryContasBanco.Value   := qryBancosCodigo.Value;
    qryContasAgencia.Value := qryAgenciasCodigo.Value;
    edtConta.SetFocus;
  end;
end;

Function Tfrmcadastrocontas.ValidaControles: Boolean;
begin
  Result:=False;
  Result := dtmCadastroBancos.qryContas.CheckRequiredFields;
end;


constructor Tfrmcadastrocontas.Create(AOwner: TComponent);
var
  j: TACBrPixCDAmbiente;
  k: TACBrPIXTipoChave;
  

begin
  inherited;
  fraConsultaContaContabil.TipoContaContabilCreditoSelecionavel := 'A';
  fraConsultaContaContabil.TipoContaContabilConsultaSelecionavel := 'A';
  fraConsultaContaContabil.TipoPesquisa := pesCONTACREDITO;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaTipoRecebimentos.TipoPesquisa := pesTIPORECEBIMENTO;

  edtCNPJ.Tipo := 'J';



  cbxAmbiente.Items.Clear;
  for j := Low(TACBrPixCDAmbiente) to High(TACBrPixCDAmbiente) do
     cbxAmbiente.Items.Add( GetEnumName(TypeInfo(TACBrPixCDAmbiente), integer(j) ));
  cbxAmbiente.ItemValues.Assign(cbxAmbiente.Items);


  cbxTipoChave.Items.Clear;
  for k := Low(TACBrPIXTipoChave) to High(TACBrPIXTipoChave) do
     cbxTipoChave.Items.Add( GetEnumName(TypeInfo(TACBrPIXTipoChave), integer(k) ));
  cbxTipoChave.ItemValues.Assign(cbxTipoChave.Items);

  InicializarBitmaps;


end;

procedure Tfrmcadastrocontas.sbAcharCertificadoPFXClick(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
    edArqCertificadoPFX.Text := {RemoverPathAplicacao(}OpenDialog1.FileName{)};
  ValidarCertificadoPSP;

end;

procedure Tfrmcadastrocontas.ValidarCertificadoPSP;
var
  a, e: String;
begin
  a := {AdicionarPathAplicacao(}edArqCertificadoPFX.Text{)};
  e := 'OK';
  if (a = '') then
    e := ACBrStr('Arquivo não informado')
  else if (not FileExists(a)) then
    e := ACBrStr('Arquivo não encontrado')
  else if EstaVazio(edSenhaCertificadoPFX.Text) then
    e := ACBrStr('Senha do Certificado PFX não informada')
  else
  begin
    try
      // Verifica se o arquivo PFX é válido
      ACBrOpenSSLUtils1.LoadPFXFromFile(a, edSenhaCertificadoPFX.Text);
    except
      On Ex: Exception do
        e := Ex.Message;
    end;
  end;

  lbErroCertificadoPFX.Caption := e;
  imErroCertificadoPFX.Visible := (e <> 'OK');
end;

procedure Tfrmcadastrocontas.sbVerSenhaPFXClick(Sender: TObject);
begin
  inherited;
  {$IfDef FPC}
  if sbVerSenhaPFX.Down then
    edSenhaCertificadoPFX.EchoMode := emNormal
  else
    edSenhaCertificadoPFX.EchoMode := emPassword;
  {$Else}
  if sbVerSenhaPFX.Down then
    edSenhaCertificadoPFX.PasswordChar := #0
  else
    edSenhaCertificadoPFX.PasswordChar := '*';
  {$EndIf}

end;

procedure Tfrmcadastrocontas.InicializarBitmaps;
begin
  ImageList1.GetBitmap(7, sbVerSenhaPFX.Glyph);
  ImageList1.GetBitmap(9, sbAcharCertificadoPFX.Glyph);
end;

end.
