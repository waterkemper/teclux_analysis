unit fmlivrodiario;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, cpnumero, cpdata, ExtCtrls, Buttons,
  dmlivrodiario, biblio, clparametrossistema, cpeditioncontrolvalidation,
  ctconstantes, Mask, frlistafiliais, ToolWin, ComCtrls;

type
  TfrmLivroDiario = class(TfrmRelatorioPadrao)
    rgpRelatorio: TRadioGroup;
    gbxOpcoes: TGroupBox;
    ckbDiaNovaPagina: TCheckBox;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    edtSaldoDebito: TEditNumero;
    ecvValida: TtecEditionControlValidation;
    edtMaximo: TEditNumero;
    gbxPeriodo: TGroupBox;
    fraListaFiliais: TfraListaFiliais;
    edtSaldoCredito: TEditNumero;
    ckbConsolidarFiliais: TCheckBox;
    rgpTotaisDiarios: TRadioGroup;
    gbxNrLivro: TGroupBox;
    gbxPagina: TGroupBox;
    gbxMaximo: TGroupBox;
    gbxSaldoDebito: TGroupBox;
    gbxSaldoCredito: TGroupBox;
    edtDataInicial: TEditData;
    lblA: TLabel;
    edtDataFinal: TEditData;
    stxRelatorio: TStaticText;
    stxTotaisDiarios: TStaticText;
    stxMudarDia: TStaticText;
    function  ValidarCamposSelecao: Boolean;
    procedure fraListaFiliaissbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaFiliaissbnDesmarcarFiliaisClick(Sender: TObject);
    procedure rgpTotaisDiariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;
    procedure InternoImpressao; override;
    { Public declarations }
  end;

var
  frmLivroDiario: TfrmLivroDiario;
  ControleValido: TWinControl;

implementation

{$R *.dfm}

{ TfrmLivroDiario }

constructor TfrmLivroDiario.Create(AOwner: TComponent);
begin
  dtmLivroDiario := TdtmLivroDiario.Create(Self);
  inherited;
  if ParSistema.LivrosFiscaisFolhaouPagina = 0 then
    gbxPagina.Caption := 'FOLHA' {ctFOLHA}
  else
    gbxPagina.Caption := 'PÁGINA'; {ctPAGINA;}
  edtPagina.Text := '2';
  edtMaximo.Text := '499';
  edtSaldoDebito.Text := '0,00';
  edtSaldoCredito.Text := '0,00';
  edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(1));
  fraListaFiliais.gbxFiliais.Font.Height:= -11;
end;

destructor TfrmLivroDiario.Destroy;
begin
  dtmLivroDiario:=nil;
  inherited;
  frmLivroDiario := nil;
end;

procedure TfrmLivroDiario.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
    dtmLivroDiario.ImprimirLivroDiario(rgpRelatorio.ItemIndex,
                                       rgpTotaisDiarios.ItemIndex,
                                       ckbDiaNovaPagina.Checked,
                                       ckbConsolidarFiliais.Checked,
                                       fraListaFiliais.TodosMarcados,
                                       edtLivro.Text, edtPagina.Text,
                                       edtMaximo.Text, edtSaldoDebito.Text,
                                       edtSaldoCredito.Text,
                                       edtDataInicial.Text, edtDataFinal.Text,
                                       fraListaFiliais.ListaSelecionada);

end;

function TfrmLivroDiario.ValidarCamposSelecao: Boolean;
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
        if not Result then
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

procedure TfrmLivroDiario.fraListaFiliaissbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais.sbnMarcarFiliaisClick(Sender);
end;

procedure TfrmLivroDiario.fraListaFiliaissbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais.sbnDesmarcarFiliaisClick(Sender);
end;

procedure TfrmLivroDiario.rgpTotaisDiariosClick(Sender: TObject);
begin
  inherited;
  gbxOpcoes.Enabled := rgpTotaisDiarios.ItemIndex <> 2;
end;

end.
