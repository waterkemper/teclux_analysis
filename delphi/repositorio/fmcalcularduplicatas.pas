unit fmcalcularduplicatas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  fmnavcontroles, ExtCtrls, cpdata, StdCtrls, cpnumero, Buttons, {Qete,}
  cpeditioncontrolvalidation, frcomissao, biblio, ctconstantes;

type
  TfrmCalcularDuplicatas = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    sbnGerarParcelas: TSpeedButton;
    edtNrParcelas: TEditNumero;
    edtIntervalo: TEditNumero;
    edtVencimento: TEditData;
    ecvDuplicatas: TtecEditionControlValidation;
    gbxJuros: TGroupBox;
    rgbTipoJuros: TRadioGroup;
    edtValorJuros: TEditNumero;
    lblJuros: TLabel;
    gbxMulta: TGroupBox;
    rgbTipoMulta: TRadioGroup;
    edtValorMulta: TEditNumero;
    lblMulta: TLabel;
    gbxNrParcelas: TGroupBox;
    gbxVencto: TGroupBox;
    gbxIntervalo: TGroupBox;
    Label1: TLabel;
    lblTipoJuros: TLabel;
    lblTipoMulta: TLabel;
    procedure sbnGerarParcelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgbTipoMultaExit(Sender: TObject);
    procedure rgbTipoJurosExit(Sender: TObject);
    procedure edtValorJurosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FTipoJuros: Char;
    FTipoMulta: Char;
    FIntervalo: Integer;
    FJuros: Real;
    FMulta: Real;
    FVencimento: TDateTime;
    FNrParcelas: Integer;
    FDataEmissao: TDateTime;
  protected
    procedure LimparCampos;

  public
    destructor Destroy; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    property NrParcelas: Integer read FNrParcelas write FNrParcelas;
    property Intervalo: Integer read FIntervalo write FIntervalo;
    property Vencimento: TDateTime read FVencimento write FVencimento;
    property Juros: Real read FJuros write FJuros;
    property Multa: Real read FMulta write FMulta;
    property TipoJuros: Char read FTipoJuros write FTipoJuros;
    property TipoMulta: Char read FTipoMulta write FTipoMulta;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    procedure ExibirMensagemPadronizada;

  end;

var
  frmCalcularDuplicatas: TfrmCalcularDuplicatas;
  ControleAtivo: TWinControl;

implementation

{$R *.dfm}

{ TfrmCalcularDuplicatas }

procedure TfrmCalcularDuplicatas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F11: sbnGerarParcelas.Click;
  end;
end;

procedure TfrmCalcularDuplicatas.LimparCampos;
begin
  edtNrParcelas.Clear;
  edtVencimento.Clear;
  edtIntervalo.Clear;
  edtValorJuros.Clear;
  edtValorMulta.Clear;
end;

procedure TfrmCalcularDuplicatas.sbnGerarParcelasClick(Sender: TObject);
begin
  inherited;
  if edtIntervalo.Text='' then
    edtIntervalo.Text:='0';
  if ecvDuplicatas.Verify(pnlFundoJanela,ControleAtivo) then
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
      if edtValorJuros.Text <> '' then FJuros:= StrToFloat(edtValorJuros.Text)
      else                             FJuros:= 0;
      if edtValorMulta.Text <> '' then FMulta:= StrToFloat(edtValorMulta.Text)
      else                             FMulta:= 0;
      if rgbTipoJuros.ItemIndex = 1 then FTipoJuros := 'V'
      else                               FTipoJuros := '%';
      if rgbTipoMulta.ItemIndex = 1 then FTipoMulta := 'V'
      else                               FTipoMulta := '%';
      LimparCampos;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmCalcularDuplicatas.FormShow(Sender: TObject);
begin
  inherited;
  FTipoJuros:= 'V';
  FTipoMulta:= 'V';
  FIntervalo:= 0;
  FJuros:= 0;
  FMulta:= 0;
  FVencimento:= 0;
  FNrParcelas:= 0;
  edtNrParcelas.SetFocus;
  edtNrParcelas.SelectAll;
end;

procedure TfrmCalcularDuplicatas.rgbTipoMultaExit(Sender: TObject);
begin
  inherited;
  if rgbTipoMulta.ItemIndex = 1
  then lblMulta.Caption:= 'VALOR'
  else lblMulta.Caption:= 'PERCENTUAL';
end;

procedure TfrmCalcularDuplicatas.rgbTipoJurosExit(Sender: TObject);
begin
  inherited;
  if rgbTipoJuros.ItemIndex = 1
  then lblJuros.Caption:= 'VALOR'
  else lblJuros.Caption:= 'PERCENTUAL';
end;

procedure TfrmCalcularDuplicatas.ExibirMensagemPadronizada;
begin
  MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['de vencimento',
               edtvencimento.Text, 'emissão', datetostr(DataEmissao)]))
end;

destructor TfrmCalcularDuplicatas.Destroy;
begin
  inherited;
  frmCalcularDuplicatas := nil;
end;

procedure TfrmCalcularDuplicatas.edtValorJurosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_Return then
     sbnGerarParcelas.Click;

end;

end.
