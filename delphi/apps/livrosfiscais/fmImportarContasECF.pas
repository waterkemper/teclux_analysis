unit fmImportarContasECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, dmecf, dateutils, ExtCtrls, Buttons;

type
  TfrmImportarContasECF = class(TForm)
    gbxExercicio: TGroupBox;
    edtAnoExercicio: TSpinEdit;
    rbnOpcao: TRadioGroup;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;
  end;

var
  frmImportarContasECF: TfrmImportarContasECF;

implementation

{$R *.dfm}

{ TfrmImportarContasECF }

constructor TfrmImportarContasECF.Create(AOwner: TComponent);
begin
  inherited;
  edtAnoExercicio.Value := dtmecf.qryecfexercicio.asinteger - 1;
  edtAnoExercicio.MaxValue := dtmecf.qryecfexercicio.asinteger + 3;
  edtAnoExercicio.MinValue := dtmecf.qryecfexercicio.asinteger - 3;

end;

destructor TfrmImportarContasECF.Destroy;
begin

  inherited;
end;

end.
