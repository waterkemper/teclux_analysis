unit fmcontrolenotasfiscaiseletronicas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, ComCtrls, Buttons, ExtCtrls, frconsulta,
  frconsultacodigo, cpdata, dmcontrolenotasfiscaiseletronicas, Grids,
  DBGrids, cpdbgrid, clparametrossistema, ctconstantes, cpnumero, Windows,
  ActnList, biblio, ToolWin, fmselecionarimpressoras;

type
  TfrmControleNotasFiscaisEletronicas = class(TfrmAjudaBt)
    pnlFiltros: TPanel;
    gbxEmissao: TGroupBox;
    gbxEmissaoDe: TGroupBox;
    edtEmissaoInicial: TEditData;
    gbxEmissaoAte: TGroupBox;
    edtEmissaoFinal: TEditData;
    pnlTotalizadores: TPanel;
    sbnGerar: TSpeedButton;
    gbxCliente: TGroupBox;
    fraConsultaCodigoCliente: TfraConsultaCodigo;
    sbnEnviar: TSpeedButton;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    edtQtdeTotal: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblTotalMarcados: TLabel;
    edtValorTotal: TEditNumero;
    edtValorMarcados: TEditNumero;
    ActionList1: TActionList;
    Action1: TAction;
    gbxNota: TGroupBox;
    gbxSerieNota: TGroupBox;
    gbxNumeroNota: TGroupBox;
    edtSerieNota: TEditNumero;
    edtNumeroNota: TEditNumero;
    dbgNotas: TtecDBGrid;
    ckbSelecionarTodos: TCheckBox;
    ckbExibirMensagensNFe: TCheckBox;
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgNotasEntradaDblClick(Sender: TObject);
    procedure dbgNotasEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNotasSaidaDblClick(Sender: TObject);
    procedure dbgNotasSaidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnEnviarClick(Sender: TObject);
    procedure Action1Update(Sender: TObject);
    procedure dbgNotasDblClick(Sender: TObject);
    procedure dbgNotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure ckbExibirMensagensNFeClick(Sender: TObject);
  private
    fdtmControleNotasFiscaisEletronicas: TdtmControleNotasFiscaisEletronicas;
    procedure SelecionarRegistro;
    procedure EnviarSelecionadas;
    procedure AtualizarContadores(Selecionadas: Boolean);
    procedure IniciarValores;
    { Private declarations }
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure OperacaoPadrao(Value: Array of Variant); override;
    property dtmControleNotasFiscaisEletronicas: TdtmControleNotasFiscaisEletronicas read fdtmControleNotasFiscaisEletronicas write fdtmControleNotasFiscaisEletronicas;
    { Public declarations }
  end;

var
  frmControleNotasFiscaisEletronicas: TfrmControleNotasFiscaisEletronicas;

implementation

{$R *.dfm}

constructor TfrmControleNotasFiscaisEletronicas.Create(AOwner: TComponent);
begin
  inherited;
  self.dtmControleNotasFiscaisEletronicas := TdtmControleNotasFiscaisEletronicas.Create(Self);
  dtmControleNotasFiscaisEletronicas.Abre(ctTabelas);
  fraConsultaCodigoCliente.TipoCliente     := 'C';
  fraConsultaCodigoCliente.Tipovfornecedor := 'C';
  fraConsultaCodigoCliente.TipoPesquisa    := pesCLIENTES;
  IniciarValores;
  AtualizarContadores(False);
end;

procedure TfrmControleNotasFiscaisEletronicas.sbnGerarClick(
  Sender: TObject);
begin
  inherited;

  if dtmControleNotasFiscaisEletronicas.SelecionarGeral(edtEmissaoInicial.Text, edtEmissaoFinal.Text,
      edtSerieNota.Text, edtNumeroNota.Text,fraConsultaCodigoCliente.edfCodigo.Text) then
      dbgNotas.SetFocus
  else
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['registro']));
  AtualizarContadores(False);
end;

procedure TfrmControleNotasFiscaisEletronicas.dbgNotasEntradaDblClick(
  Sender: TObject);
begin
  inherited;
  SelecionarRegistro;
end;

procedure TfrmControleNotasFiscaisEletronicas.SelecionarRegistro;
begin
  dtmControleNotasFiscaisEletronicas.SelecionarRegistro;
  AtualizarContadores(True);
end;

procedure TfrmControleNotasFiscaisEletronicas.dbgNotasEntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and
     (Key   = VK_SPACE) then
    SelecionarRegistro;
end;

procedure TfrmControleNotasFiscaisEletronicas.dbgNotasSaidaDblClick(
  Sender: TObject);
begin
  inherited;
  SelecionarRegistro;
end;

procedure TfrmControleNotasFiscaisEletronicas.dbgNotasSaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and
     (Key   = VK_SPACE) then
    SelecionarRegistro;
end;

procedure TfrmControleNotasFiscaisEletronicas.sbnEnviarClick(
  Sender: TObject);
var
  Imp: String;
begin
  inherited;

  if dtmControleNotasFiscaisEletronicas.ImpressoraDanfe = '' then
  begin
    Imp := 'selecionar';
    frmSelecionarImpressoras := TfrmSelecionarImpressoras.Create(frmSelecionarImpressoras, ' ');
    if frmSelecionarImpressoras.ShowModal = mrok then
    begin
      Imp:= frmSelecionarImpressoras.NomeImpressora;
      dtmControleNotasFiscaisEletronicas.ImpressoraDanfe := Imp;
    end;
    frmSelecionarImpressoras.Free;
  end;  

  EnviarSelecionadas;
end;

procedure TfrmControleNotasFiscaisEletronicas.EnviarSelecionadas;
begin

  if dtmControleNotasFiscaisEletronicas.EnviarGeral then
    dtmControleNotasFiscaisEletronicas.SelecionarGeral(edtEmissaoInicial.Text, edtEmissaoFinal.Text,
        edtSerieNota.Text, edtNumeroNota.Text, fraConsultaCodigoCliente.edfCodigo.Text);

  AtualizarContadores(False);
end;

procedure TfrmControleNotasFiscaisEletronicas.AtualizarContadores(Selecionadas: Boolean);
begin

  with dtmControleNotasFiscaisEletronicas do
  begin
    if not Selecionadas then begin
      edtQtdeTotal.Text  := IntToStr(QtdeNotas);
      edtValorTotal.Text := Format('%8.2m', [ValorNotas]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtValorMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;

end;

procedure TfrmControleNotasFiscaisEletronicas.Action1Update(
  Sender: TObject);
begin
  inherited;
  if edtQtdeMarcados.Text <> '' then
    sbnEnviar.Enabled := StrToInt(edtQtdeMarcados.Text) > 0;
end;

procedure TfrmControleNotasFiscaisEletronicas.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Escape: begin
                  dtmControleNotasFiscaisEletronicas.FecharTabelas;
                  IniciarValores;
                  AtualizarContadores(False);
                end;
    VK_F6    : if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
    VK_F7    : if not CtrlOn and sbnEnviar.Enabled then sbnEnviar.Click;
  end;
end;

procedure TfrmControleNotasFiscaisEletronicas.IniciarValores;
begin
  edtEmissaoInicial.Text := DateToStr(dtmControleNotasFiscaisEletronicas.DataServidor - 7);
  edtEmissaoFinal.Text   := DateToStr(dtmControleNotasFiscaisEletronicas.DataServidor);
//  edtSerieNota.Text      := dtmControleNotasFiscaisEletronicas.SerieSugestao;
  edtNumeroNota.Text     := '';
  fraConsultaCodigoCliente.edfCodigo.Text := '';
  fraConsultaCodigoCliente.edfCodigo.Exist;
end;

procedure TfrmControleNotasFiscaisEletronicas.dbgNotasDblClick(
  Sender: TObject);
begin
  inherited;
  SelecionarRegistro;
end;

procedure TfrmControleNotasFiscaisEletronicas.dbgNotasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and
     (Key   = VK_SPACE) then
    SelecionarRegistro;

end;

procedure TfrmControleNotasFiscaisEletronicas.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmControleNotasFiscaisEletronicas.MarcarNotas(ckbSelecionarTodos.Checked, true);
  AtualizarContadores(True);

end;

procedure TfrmControleNotasFiscaisEletronicas.ckbExibirMensagensNFeClick(
  Sender: TObject);
begin
  inherited;
  dtmControleNotasFiscaisEletronicas.ExibirMsgNfe := ckbExibirMensagensNFe.checked;
end;

procedure TfrmControleNotasFiscaisEletronicas.OperacaoPadrao(
  Value: array of Variant);
begin
  inherited;
  edtEmissaoInicial.text := Value[0];
  edtEmissaoFinal.text := Value[1];
  sbnGerarClick(nil);
end;

end.
