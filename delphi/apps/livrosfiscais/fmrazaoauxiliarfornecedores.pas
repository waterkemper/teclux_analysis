unit fmrazaoauxiliarfornecedores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, frlistafiliais, StdCtrls, cpnumero, cpdata, Mask,
  ExtCtrls, Buttons, cpeditioncontrolvalidation, biblio, ctconstantes,
  dmrazaoauxiliarfornecedores, clparametrossistema;

type
  TfrmRazaoAuxiliarFornecedores = class(TfrmRelatorioPadrao)
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
  frmRazaoAuxiliarFornecedores: TfrmRazaoAuxiliarFornecedores;
  ControleValido: TWinControl;


implementation

{$R *.dfm}

{ TfrmRazaoAuxiliarFornecedores }

constructor TfrmRazaoAuxiliarFornecedores.Create(AOwner: TComponent);
begin
  dtmRazaoAuxiliarFornecedores := TdtmRazaoAuxiliarFornecedores.Create(Self);
  inherited;
  edtpagina.Text:='2';
  edtMaximo.Text:='499';
  edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(1));
  if ParSistema.LivrosFiscaisFolhaouPagina = 0 then
    lblPagina.Caption := ctFOLHA;
end;

destructor TfrmRazaoAuxiliarFornecedores.Destroy;
begin
  dtmRazaoAuxiliarFornecedores:=nil;
  inherited;
  frmRazaoAuxiliarFornecedores := nil;
end;

procedure TfrmRazaoAuxiliarFornecedores.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
    dtmRazaoAuxiliarFornecedores.ImprimirRazaoAuxiliarFornecedores(
      rgpRelatorio.ItemIndex,
      edtDataInicial.text,
      edtDataFinal.text,
      edtLivro.Text,
      edtPagina.Text,
      edtMaximo.Text,
      fraListaFiliais1.TodosMarcados,
      fraListaFiliais1.ListaSelecionada,
      edtSaldoDebito.ValorSemFormatacao,
      edtSaldoCredito.ValorSemFormatacao
      );
end;

function TfrmRazaoAuxiliarFornecedores.ValidarCamposSelecao: Boolean;
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

end.
