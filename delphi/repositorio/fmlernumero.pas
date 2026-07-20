unit fmlernumero;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Controls, Forms, ExtCtrls,
  Buttons, StdCtrls, Mask,
  //Biblio
  ctconstantes,
  //Componentes
  cpdata,
  //Repositorio
  fmnavcontroles, cpnumero;

type

  TfrmLerNumero = class(TfrmNavControles)
    edtNumero: TEditNumero;
    lblNumero: TLabel;
    pnlSeparador: TPanel;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
  private
    procedure setNumero(const Value: Real);
  protected
    function GetNumero: Real;
  public
    constructor Create(AOwner: TComponent; Caption: String); reintroduce;
    property    Numero: Real read GetNumero write setNumero;
  end;

implementation

{$R *.dfm}

constructor TfrmLerNumero.Create(AOwner: TComponent; Caption: String);
begin
  inherited Create(AOwner);
  Self.Caption := Caption;
end;

function TfrmLerNumero.GetNumero: Real;
var
  Str: String;
begin
  Str := edtNumero.ValorSemFormatacao;
  try
    Result := StrToFloat(Str)
  except
    Result := 0
  end
end;

procedure TfrmLerNumero.setNumero(const Value: Real);
begin
  edtNumero.Text := FloatToStr(Value);
  edtNumero.SelectAll
end;

end.
