unit fmdiarioauxiliarfornecedores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, frlistafiliais, StdCtrls, cpnumero, cpdata, Mask,
  ExtCtrls, Buttons, cpeditioncontrolvalidation, biblio, ctconstantes,
  dmdiarioauxiliarfornecedores, clparametrossistema, Grids, DBGrids,
  cpdbgrid, ToolWin, ComCtrls;

type
  TfrmDiarioAuxiliarFornecedores = class(TFrmRelatorioPadrao)
    rgpRelatorio: TRadioGroup;
    gbxPeriodo: TGroupBox;
    gbxPeriodoInicial: TGroupBox;
    gbxPeriodoFinal: TGroupBox;
    edtDataFinal: TEditData;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    lblLivro: TLabel;
    lblPagina: TLabel;
    lblMaximo: TLabel;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    gbxSaldo: TGroupBox;
    lblSaldoDebito: TLabel;
    lblSaldoCredito: TLabel;
    edtSaldoCredito: TEditNumero;
    edtSaldoDebito: TEditNumero;
    edtDataInicial: TEditData;
    fraListaFiliais1: TfraListaFiliais;
    ecvValida: TtecEditionControlValidation;
    gbxCadastramentoSubcontas: TGroupBox;
    dbgCadastramentoContas: TtecDBGrid;
    gbxImprimir: TGroupBox;
    ckbLivroAuxiliar: TCheckBox;
    ckbCodigosEmitentes: TCheckBox;
    ckbResumoDiario: TCheckBox;
    procedure rgpRelatorioClick(Sender: TObject);
    procedure ckbResumoDiarioClick(Sender: TObject);
    procedure ckbLivroAuxiliarClick(Sender: TObject);
    procedure ckbCodigosEmitentesClick(Sender: TObject);
  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure InternoImpressao; override;
  end;

var
  frmDiarioAuxiliarFornecedores: TfrmDiarioAuxiliarFornecedores;
  ControleValido: TWinControl;


implementation

{$R *.dfm}

{ TfrmDiarioAuxiliarFornecedores }

constructor TfrmDiarioAuxiliarFornecedores.Create(AOwner: TComponent);
begin
  dtmDiarioAuxiliarFornecedores := TdtmDiarioAuxiliarFornecedores.Create(Self);
  inherited;
  edtpagina.Text:='2';
  edtMaximo.Text:='499';
  edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(1));
  if ParSistema.LivrosFiscaisFolhaouPagina = 0 then
    lblPagina.Caption := ctFOLHA;
end;

destructor TfrmDiarioAuxiliarFornecedores.Destroy;
begin
  dtmDiarioAuxiliarFornecedores:=nil;
  inherited;
  frmDiarioAuxiliarFornecedores := nil;
end;

procedure TfrmDiarioAuxiliarFornecedores.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
    dtmDiarioAuxiliarFornecedores.ImprimirDiarioAuxiliarFornecedores(
      rgpRelatorio.ItemIndex,
      edtDataInicial.text,
      edtDataFinal.text,
      edtLivro.Text,
      edtPagina.Text,
      edtMaximo.Text,
      fraListaFiliais1.TodosMarcados,
      fraListaFiliais1.ListaSelecionada,
      edtSaldoDebito.ValorSemFormatacao,
      edtSaldoCredito.ValorSemFormatacao,
      ckbLivroAuxiliar.Checked, ckbResumoDiario.Checked, ckbCodigosEmitentes.Checked
      );
end;

function TfrmDiarioAuxiliarFornecedores.ValidarCamposSelecao: Boolean;
begin
  result:=ecvValida.Verify(gbxNumeracao, ControleValido);
  if Result then
  begin
    Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
    if Result then
    begin
     Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
     if result then
     begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if Result then
      begin
        if (rgpRelatorio.ItemIndex=1) and (edtLivro.Text='') then
        begin
           Result:=False;
           MensagemAviso(ctPARAMETROSINEXISTENTES);
           edtLivro.SetFocus;
        end;
      end
      else
      begin
       MensagemAviso(ctDATAINVALIDA);
       edtDataInicial.SetFocus;
      end;
     end
     else
     begin
       MensagemAviso(ctDTINICIALMAIORDTFINAL);
       edtDataInicial.SetFocus;
     end;
    end;
  end;

end;

procedure TfrmDiarioAuxiliarFornecedores.rgpRelatorioClick(
  Sender: TObject);
begin
  inherited;
  case rgpRelatorio.ItemIndex of
  0: begin
       gbxImprimir.Enabled := True;
       ckbLivroAuxiliar.Enabled := True;
       ckbCodigosEmitentes.Enabled := True;
       ckbResumoDiario.Enabled := True;
     end;
  1: begin
       gbxImprimir.Enabled := False;
       ckbLivroAuxiliar.Enabled := False;
       ckbCodigosEmitentes.Enabled := False;
       ckbResumoDiario.Enabled := False;
     end;
  end;
end;

procedure TfrmDiarioAuxiliarFornecedores.ckbResumoDiarioClick(
  Sender: TObject);
begin
  inherited;
  if not ckbResumoDiario.Checked then
    if not ckbLivroAuxiliar.Checked and
       not ckbCodigosEmitentes.Checked then
         ckbLivroAuxiliar.Checked := true;

end;

procedure TfrmDiarioAuxiliarFornecedores.ckbLivroAuxiliarClick(
  Sender: TObject);
begin
  inherited;
  if not ckbLivroAuxiliar.Checked then
    if not ckbResumoDiario.Checked and
       not ckbCodigosEmitentes.Checked then
         ckbResumoDiario.Checked := true;
end;

procedure TfrmDiarioAuxiliarFornecedores.ckbCodigosEmitentesClick(
  Sender: TObject);
begin
  inherited;
  if not ckbCodigosEmitentes.Checked then
    if not ckbResumoDiario.Checked and
       not ckbLivroAuxiliar.Checked then
         ckbLivroAuxiliar.Checked := true;
end;

end.
