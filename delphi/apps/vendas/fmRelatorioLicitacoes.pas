unit fmRelatorioLicitacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  StdCtrls, cpdata, frselecaoaleatoriaclientes,
  frselecaoaleatoriavendedores, biblio, ctconstantes;

type
  TfrmRelatorioLicitacoes = class(TFrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    rgpResumo: TRadioGroup;
    gbxListadeClientes: TGroupBox;
    fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes;
    gbxSituacaoLicitacoes: TGroupBox;
    ckbLicitacaoAberta: TCheckBox;
    ckbLicitacaoFinalizada: TCheckBox;
    ckbLicitacaoCancelada: TCheckBox;
    ckbLicitacaoExpirada: TCheckBox;
    rgbTipoRelatorio: TRadioGroup;
    gbxListaCondicionalVendedores: TGroupBox;
    fraSelecaoAleatoriavendedores: TfraSelecaoAleatoriavendedores;
    ckbCustoMaiorVenda: TCheckBox;
  protected
    procedure internoimpressao; override;
    function  ValidarCamposSelecao: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmRelatorioLicitacoes: TfrmRelatorioLicitacoes;

implementation

uses dmRelatorioLicitacoes;

{$R *.dfm}

{ TfrmRelatorioLicitacoes }

constructor TfrmRelatorioLicitacoes.Create(AOwner: TComponent);
begin
  dtmRelatorioLicitacoes:= TdtmRelatorioLicitacoes.Create(Self);
  inherited;

end;

destructor TfrmRelatorioLicitacoes.Destroy;
begin

  inherited;
end;

procedure TfrmRelatorioLicitacoes.internoimpressao;
begin
  inherited;
  if ValidarCamposSelecao then
    dtmRelatorioLicitacoes.GerarRelatorio(
      edtDataInicial.text,
      edtDataFinal.text,
      fraSelecaoAleatoriaClientes1.ListaCondicional,
      fraSelecaoAleatoriavendedores.ListaCondicional,
      ckbLicitacaoAberta.checked,
      ckbLicitacaoFinalizada.Checked,
      ckbLicitacaoCancelada.Checked,
      ckbLicitacaoExpirada.Checked,
      rgpResumo.ItemIndex,
      rgbTipoRelatorio.ItemIndex,
      ckbCustoMaiorVenda.checked);

end;

function TfrmRelatorioLicitacoes.ValidarCamposSelecao: Boolean;
begin

  Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
  if Result then
  begin
    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);

    if not result then
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
    end;
  end;

end;

end.
