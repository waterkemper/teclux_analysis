unit fmcalcularparcelas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  fmnavcontroles, ExtCtrls, cpdata, StdCtrls, cpnumero, Buttons, {Qete,}
  cpeditioncontrolvalidation, frcomissao, biblio, ctconstantes;

type
  TfrmCalcularParcelas = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxParametros: TGroupBox;
    sbnGerarParcelas: TSpeedButton;
    edtNrParcelas: TEditNumero;
    edtIntervalo: TEditNumero;
    edtVencimento: TEditData;
    ecvParcelas: TtecEditionControlValidation;
    gbxNrParcelas: TGroupBox;
    gbxVencto: TGroupBox;
    gbxIntervalo: TGroupBox;
    Label1: TLabel;
    procedure sbnGerarParcelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtIntervaloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIntervalo: Integer;
    FVencimento: TDateTime;
    FNrParcelas: Integer;
    FDataEmissao: TDateTime;
  protected
    procedure LimparCampos;

  public
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    property NrParcelas: Integer read FNrParcelas write FNrParcelas;
    property Intervalo: Integer read FIntervalo write FIntervalo;
    property Vencimento: TDateTime read FVencimento write FVencimento;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    procedure ExibirMensagemPadronizada;

  end;

var
  frmCalcularParcelas: TfrmCalcularParcelas;
  ControleAtivo: TWinControl;

implementation

{$R *.dfm}

{ TfrmCalcularParcelas }

procedure TfrmCalcularParcelas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F11: sbnGerarParcelas.Click;
  end;
end;

procedure TfrmCalcularParcelas.LimparCampos;
begin
  edtNrParcelas.Clear;
  edtVencimento.Clear;
  edtIntervalo.Clear;
end;

procedure TfrmCalcularParcelas.sbnGerarParcelasClick(Sender: TObject);
begin
  inherited;
  if edtIntervalo.Text='' then
    edtIntervalo.Text:='0';
  if ecvParcelas.Verify(gbxParametros,ControleAtivo) then
  begin
    FNrParcelas := StrToInt(edtNrParcelas.Text);
    FIntervalo  := StrToInt(edtIntervalo.Text);
    FVencimento := StrToDate(edtVencimento.Text);
    if (FNrParcelas > 1) and (FIntervalo = 0) then
    begin
      MensagemAviso('Informe o nº de dias entre as parcelas.');
      edtIntervalo.SetFocus;
      edtIntervalo.SelectAll;
    end
    else
    begin
      LimparCampos;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmCalcularParcelas.FormShow(Sender: TObject);
begin
  inherited;
  FIntervalo:= 0;
  FVencimento:= 0;
  FNrParcelas:= 0;
  edtNrParcelas.SetFocus;
  edtNrParcelas.SelectAll;
end;

procedure TfrmCalcularParcelas.ExibirMensagemPadronizada;
begin
  MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['de vencimento',
               edtvencimento.Text, 'emissão', datetostr(DataEmissao)]))
end;

procedure TfrmCalcularParcelas.edtIntervaloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_Return then
    sbnGerarParcelas.Click;
end;

end.
