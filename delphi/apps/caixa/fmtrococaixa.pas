unit fmtrococaixa;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, Buttons, cpnumero;

type
  TfrmTrocoCaixa = class(TfrmNavControles)
    gbxValores: TGroupBox;
    lblPagamentoDinheiro: TLabel;
    lblRecebido: TLabel;
    lblTroco: TLabel;
    lblValorTroco: TLabel;
    edtValorRecebido: TEditNumero;
    lblValorTotalEmDinheiro: TLabel;
    bbnOK: TBitBtn;
    procedure bbnOKClick(Sender: TObject);
    procedure edtValorRecebidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPagoEmDinheiro: Currency;
    procedure setPagoEmDinheiro(const Value: Currency);
    function GetTroco: String;
  public

    destructor Destroy; override;

    property PagoEmDinheiro: Currency write setPagoEmDinheiro;
    property Troco : String read GetTroco;
  end;

var
  frmTrocoCaixa : TfrmTrocoCaixa;  

implementation

Uses
  //Biblio
  biblio;

{$R *.dfm}

procedure TfrmTrocoCaixa.bbnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK
end;

procedure TfrmTrocoCaixa.setPagoEmDinheiro(const Value: Currency);
begin
  FPagoEmDinheiro                 := Value;
  lblValorTotalEmDinheiro.Caption := FormatFloat('#0,' + ThousandSeparator + '00', Value)
end;

procedure TfrmTrocoCaixa.edtValorRecebidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Valor: Currency;
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
  begin
    try
      Valor := StrToFloat(edtValorRecebido.ValorSemFormatacao)
    except
      Valor := 0;
    end;
    if FPagoEmDinheiro > 0 then
      if Valor > FPagoEmDinheiro then
        lblValorTroco.Caption := FormatFloat('#0,' + ThousandSeparator + '00', Valor - FPagoEmDinheiro)
      else
        lblValorTroco.Caption := FormatFloat('#0,' + ThousandSeparator + '00', 0)
  end
end;

function TfrmTrocoCaixa.GetTroco: String;
begin
  Result:= (FormatFloat('#0,' + ThousandSeparator + '00', strtofloat(edtValorRecebido.Text) - FPagoEmDinheiro));
end;

destructor TfrmTrocoCaixa.Destroy;
begin
  inherited;
  frmTrocoCaixa := nil;
end;

end.
