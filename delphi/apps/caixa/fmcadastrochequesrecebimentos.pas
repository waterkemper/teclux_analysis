unit fmcadastrochequesrecebimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmajudabt, cpnumero, cpdata, DBCtrls, cpdbtext, Mask,
  cpdbfindcontrols, frcmc7, ComCtrls, Buttons, ExtCtrls, biblio, ToolWin;

type
  TfrmCadastroChequesRecebimentos = class(TfrmAjudaBt)
    fraCMC7: TfraCMC7;
    gbxCheques: TGroupBox;
    gbxObservacoes: TGroupBox;
    mmoObservacaoCheque1: TMemo;
    sbnImprimirCheque: TSpeedButton;
    gbxTitular: TGroupBox;
    edtTitularCheque: TEdit;
    gbxVencimento: TGroupBox;
    edtVencimentoCheque: TEditData;
    gbxValor: TGroupBox;
    edtValorCheque: TEditNumero;
    sbnGravar: TSpeedButton;
    procedure fraCMC7edtCMC7Exit(Sender: TObject);
    procedure fraCMC7edtManual3Exit(Sender: TObject);
    procedure sbnImprimirChequeClick(Sender: TObject);
    procedure sbnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fraCMC7edtManual1Exit(Sender: TObject);
    procedure fraCMC7edtManual2Exit(Sender: TObject);
  private
    function getNumeroCheque: String;
    procedure SetTitular(const Value: String);
    procedure SetDataVencto(const Value: TDateTime);
    procedure SetValorVencto(const Value: Currency);
    function GetDataVencto: TDateTime;
    { Private declarations }
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure ImprimirCheque;
    function GravarCheque: Boolean;
    function ChequeOK: Boolean;
    function DadosCompletosCheque: Boolean;
    function VerificarCheque: boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    property Titular     : String write SetTitular;
    property ValorVencto : Currency write SetValorVencto;
    property DataVencto  : TDateTime read GetDataVencto write SetDataVencto;
    property NumeroCheque: String read getNumeroCheque;
    { Public declarations }
  end;

var
  frmCadastroChequesRecebimentos: TfrmCadastroChequesRecebimentos;

implementation

uses
  dmautenticacoes, fmlerdatanumero, ctconstantes;

{$R *.dfm}

procedure TfrmCadastroChequesRecebimentos.fraCMC7edtCMC7Exit(
  Sender: TObject);
begin
  inherited;
  fraCMC7.edtCMC7Exit(Sender);
  VerificarCheque;
  {
  if fraCMC7.ChequeValido then
    if not ChequeOK then begin
      fraCMC7.LimparCampos;
//      gbxCheques.Enabled:= False;
    end
  }
end;

procedure TfrmCadastroChequesRecebimentos.fraCMC7edtManual3Exit(
  Sender: TObject);
begin
  inherited;
  fraCMC7.edtManual3Exit(Sender);
  VerificarCheque
{
  fraCMC7.edtManual3Exit(Sender);
  if fraCMC7.ChequeValido then
    if not ChequeOK then
      fraCMC7.LimparCampos;
}
end;

procedure TfrmCadastroChequesRecebimentos.ImprimirCheque;
begin
  if Trim(fraCMC7.edtBanco.Text) = '' then begin
    frmLerDataNumero := TfrmLerDataNumero.Create(Self, 'Cheque', 'Valor');
    frmLerDataNumero.edtNumero.Decimais := True;
    if frmLerDataNumero.ShowModal = mrOK then
      dtmautenticacoes.ImprimirCheque('001', frmLerDataNumero.Numero, frmLerDataNumero.Data);
    frmLerDataNumero.Free;
  end else if Trim(edtValorCheque.Text) =  '' then
    MensagemAviso(format(ctVALORNAOPREENCHIDO,[ctCHEQUE]))
  else if Trim(edtVencimentoCheque.Text) = '' then
    MensagemAviso(ctDATACHEQUENAOPREENCHIDO)
  else
    dtmautenticacoes.ImprimirCheque(fraCMC7.edtBanco.ValorSemFormatacao, edtValorCheque.ValorSemFormatacao, edtVencimentoCheque.Text);
end;

procedure TfrmCadastroChequesRecebimentos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not (Shift = [ssCtrl]) and not (Shift = [ssShift]) then
    case key of
      VK_F9 : begin
                 ImprimirCheque;
               end;
      VK_F5 : begin
                 if GravarCheque then
                 begin
                   ModalResult := mrOK;
//                   Close;
                 end;
               end;
    end;
end;

procedure TfrmCadastroChequesRecebimentos.sbnImprimirChequeClick(
  Sender: TObject);
begin
  inherited;
  ImprimirCheque;
end;

function TfrmCadastroChequesRecebimentos.ChequeOK: Boolean;
begin
  inherited;
  Result:= True;
  with dtmautenticacoes do
  begin
    if ChequeCadastrado(fraCMC7.NumeroCheque) then
    begin
      if ChequeAutenticado then
        MensagemAviso(ctCHEQUEAUTENTICADO)
      else if not SituacaoChequeNormal then
        MensagemAviso(ctCHEQUENAONORMAL)
      else
        MensagemAviso(ctNUMEROCHEQUECADASTRADO);

      fraCMC7.LimparCampos;
      Result:= False;
    end
    else
    begin

      AtribuirClienteParcelasAbertoEmCheque;
    {  if dtmautenticacoes.TipoCliente[paCLIENTESCHEQUES] = tcCLIENTE then
        edtTitularCheque.Text := dtmautenticacoes.NomeCliente
      else
        edtTitularCheque.Text := dtmautenticacoes.NomeFornecedor;
    }

//      ReFazConsultaClientes(paCLIENTESCHEQUES);
    end;
  end;
end;

procedure TfrmCadastroChequesRecebimentos.sbnGravarClick(Sender: TObject);
begin
  inherited;

  fraCMC7.edtCMC7Exit(Self);
  fraCMC7.edtManual3Exit(Self);
  if VerificarCheque then
  begin
    if GravarCheque then
      ModalResult := mrOK;
  end;

end;

function TfrmCadastroChequesRecebimentos.GravarCheque: Boolean;
begin
  Result := False;
  if fraCMC7.ChequeValido then begin
    if DadosCompletosCheque then
      result := dtmautenticacoes.CadastrarChequeRecebimentos(fraCMC7.NumeroCheque,
                   edtTitularCheque.Text, edtVencimentoCheque.Text,
                   edtValorCheque.ValorSemFormatacao,
                   mmoObservacaoCheque1.Text, true)
  end
  else
    MensagemErro(ctERRORCHEQUENUMERO);
end;

function TfrmCadastroChequesRecebimentos.getNumeroCheque: String;
begin
  Result := fraCMC7.NumeroCheque;
end;

function TfrmCadastroChequesRecebimentos.DadosCompletosCheque: Boolean;
begin
  Result := False;
{  if ActiveControl = flkCodigoClienteCheques then begin
    if not flkCodigoClienteCheques.Exist then begin
      MensagemAviso(Format(ctNAOCADASTRADO,['Cliente',flkCodigoClienteCheques.Text]));
      flkCodigoClienteCheques.SetFocus;
      Exit;
    end;
  end;
  if flkCodigoClienteCheques.Text = '' then begin
    MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO, ['Cliente']));
    flkCodigoClienteCheques.SetFocus;
  end else }if (edtTitularCheque.Text = '') then begin
    MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO, ['Titular']));
    edtTitularCheque.SetFocus;
  end else if (edtVencimentoCheque.Text = '') then begin
    MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO, ['Vencimento']));
    edtVencimentoCheque.SetFocus;
  end else if (edtValorCheque.Text = '') then begin
    MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO, ['Valor']));
    edtValorCheque.SetFocus;
  end else
    result := true;
end;

procedure TfrmCadastroChequesRecebimentos.SetTitular(const Value: String);
begin
  edtTitularCheque.Text := Value;
end;

procedure TfrmCadastroChequesRecebimentos.SetDataVencto(
  const Value: TDateTime);
begin
  edtVencimentoCheque.Text := DateToStr(Value);
end;

procedure TfrmCadastroChequesRecebimentos.SetValorVencto(
  const Value: Currency);
begin
  edtValorCheque.Text := CurrToStr(Value);
end;

constructor TfrmCadastroChequesRecebimentos.Create(AOwner: TComponent);
begin
  inherited;
  fraCMC7.LimparCampos;
  edtTitularCheque.Clear;
  edtVencimentoCheque.Clear;
  edtValorCheque.Clear;
  mmoObservacaoCheque1.Clear;
//  fraCMC7.edtCMC7.SetFocus;
end;

function TfrmCadastroChequesRecebimentos.GetDataVencto: TDateTime;
begin
  Result := StrToDate(edtVencimentoCheque.Text);
end;

destructor TfrmCadastroChequesRecebimentos.Destroy;
begin
  inherited;
  frmCadastroChequesRecebimentos := nil;
end;

procedure TfrmCadastroChequesRecebimentos.FormShow(Sender: TObject);
begin
  inherited;
  fraCMC7.LimparCampos;
  fraCMC7.edtCMC7.SetFocus;
end;


procedure TfrmCadastroChequesRecebimentos.fraCMC7edtManual1Exit(
  Sender: TObject);
begin
  inherited;
  fraCMC7.edtManual1Exit(Sender);

end;

procedure TfrmCadastroChequesRecebimentos.fraCMC7edtManual2Exit(
  Sender: TObject);
begin
  inherited;
  fraCMC7.edtManual2Exit(Sender);

end;

function TfrmCadastroChequesRecebimentos.VerificarCheque: boolean;
begin
  result := true;
  if fraCMC7.ChequeValido then
  begin
    if dtmautenticacoes.ChequeCadastrado(fraCMC7.NumeroCheque) then
    begin
      if dtmautenticacoes.qryCheque.RecordCount > 0 then
      begin
        if dtmautenticacoes.ChequeAutenticado then
          MensagemAviso(ctCHEQUEAUTENTICADO)
        else
        if not dtmautenticacoes.SituacaoChequeNormal then
          MensagemAviso(ctCHEQUENAONORMAL)
        else
          MensagemAviso(ctNUMEROCHEQUECADASTRADO);
      end
      else
        MensagemAviso(ctNUMEROCHEQUECADASTRADO);

      fraCMC7.LimparCampos;
      result := false;
    end else
      fraCMC7.edtBanco.ReadOnly := True;
  end;
end;

end.

