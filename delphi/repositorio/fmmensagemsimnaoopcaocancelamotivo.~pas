unit fmmensagemsimnaoopcaocancelamotivo;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, fmmensagemsimnaoopcaocancela, frconsulta,
  frconsultacodigo, ctconstantes, biblio;

type
  TfrmMensagemSimNaoopcaocancelamotivo = class(TfrmMensagemSimNaoOpcaoCancela)
    gbxMensagemmmo: TGroupBox;
    mmoMensagem: TMemo;
    gbxMotivo: TGroupBox;
    fraConsultaCodigoMotivoCancelamento: TfraConsultaCodigo;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


  end;

function MensagemSimNaoopcaocancelamotivo(
         AOwner: TComponent;
         mensagem, NomeOpcaoExtra: String;
         ExibirBotaoCancelar: boolean = true;
         DescricaoOpcaoSim : String = '&Sim';
         DescricaoOpcaoNao : String = '&Não';
         msgtexto: String = '';
         pDigitarTextommo : boolean = true;
         pInformarMotivo : Boolean = true;
         TipoMotivo : String = 'P'
       ): TModalResult;

var
  frmMensagemSimNaoopcaocancelamotivo: TfrmMensagemSimNaoopcaocancelamotivo;
  DigitarTextommo : boolean;
  InformarMotivo : Boolean;


implementation

uses Mask;

{$R *.dfm}

function MensagemSimNaoopcaocancelamotivo(
         AOwner: TComponent;
         mensagem, NomeOpcaoExtra: String;
         ExibirBotaoCancelar: boolean = true;
         DescricaoOpcaoSim : String = '&Sim';
         DescricaoOpcaoNao : String = '&Não';
         msgtexto: String = '';
         pDigitarTextommo : boolean = true;
         pInformarMotivo : Boolean = true;
         TipoMotivo : String = 'P'
       ): TModalResult;
begin
  frmMensagemSimNaoopcaocancelamotivo := TfrmMensagemSimNaoopcaocancelamotivo.create(AOwner);

  with frmMensagemSimNaoopcaocancelamotivo do
  begin
    btnCancelar.Visible := ExibirBotaoCancelar;
    lblMensagem.caption := mensagem;

    if NomeOpcaoExtra = '' then
      btnOpcao.Visible := false
    else
      btnOpcao.caption := NomeOpcaoExtra;

    btnSim.Caption := DescricaoOpcaoSim;
    btnNao.Caption := DescricaoOpcaoNao;
    mmoMensagem.Text := msgtexto;

    DigitarTextommo := pDigitarTextommo;

    if pDigitarTextommo then
    begin
      mmoMensagem.readonly := false;
      mmoMensagem.color := clWindow;
      gbxMensagemmmo.Caption := 'Observações';
    end
    else
    begin
      mmoMensagem.readonly := true;
      mmoMensagem.color := clBtnFace;
      gbxMensagemmmo.Caption := '';
    end;

    fraConsultaCodigoMotivoCancelamento.qryConsultaMotivos.ParamByname('tipomotivo').asString := TipoMotivo;
    fraConsultaCodigoMotivoCancelamento.qryProcuraMotivos.ParamByname('tipomotivo').asString := TipoMotivo;
    fraConsultaCodigoMotivoCancelamento.TipoPesquisa := pesMOTIVOS;

    AjustarTamanhos;

    InformarMotivo := pInformarMotivo;
    showmodal;
    vTextoJanelaMensagem := mmoMensagem.text;
    vMotivoJanelaMensagem := fraConsultaCodigoMotivoCancelamento.edfcodigo.text;
    result := modalresult;
    free;
  end;
end;

destructor TfrmMensagemSimNaoopcaocancelamotivo.Destroy;
begin
  inherited;
  frmMensagemSimNaoopcaocancelamotivo := nil;

end;

procedure TfrmMensagemSimNaoopcaocancelamotivo.FormShow(Sender: TObject);
begin
  inherited;
  if not btnCancelar.Visible then
    if assigned(frmMensagemSimNaoopcaocancelamotivo) then
    begin
      if DigitarTextommo then
      begin
        frmMensagemSimNaoopcaocancelamotivo.mmoMensagem.SetFocus;
        frmMensagemSimNaoopcaocancelamotivo.mmoMensagem.selectall;
      end
      else
      if InformarMotivo then
      begin
        frmMensagemSimNaoopcaocancelamotivo.fraConsultaCodigoMotivoCancelamento.edfCodigo.setfocus;
        frmMensagemSimNaoopcaocancelamotivo.fraConsultaCodigoMotivoCancelamento.edfCodigo.selectall;
      end
      else
        frmMensagemSimNaoopcaocancelamotivo.btnSim.SetFocus;
    end;
end;

procedure TfrmMensagemSimNaoopcaocancelamotivo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := true;
  if modalResult = mrYes then
  begin

    CanClose := not DigitarTextommo or (DigitarTextommo and (mmoMensagem.text<>''));
    if not canclose then
    begin
      messagedlg('Texto obrigatório.', mtInformation, [mbOk], 0);
      mmoMensagem.setfocus;
      mmoMensagem.selectall;
    end;

    if CanClose then
    begin

      CanClose := not InformarMotivo or (InformarMotivo and (fraConsultaCodigoMotivoCancelamento.edfCodigo.Text<>''));
      if not CanClose then
      begin
        messagedlg('Motivo obrigatório.', mtInformation, [mbOk], 0);
        fraConsultaCodigoMotivoCancelamento.edfCodigo.setfocus;
        fraConsultaCodigoMotivoCancelamento.edfCodigo.selectall;
      end;

    end;
  end;
end;

constructor TfrmMensagemSimNaoopcaocancelamotivo.Create(
  AOwner: TComponent);
begin
  inherited;
end;

end.
