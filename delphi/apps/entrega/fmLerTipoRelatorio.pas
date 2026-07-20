unit fmLerTipoRelatorio;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, fmnavcontroles, Buttons;

type
  TfrmLerTipoRelatorio = class(TFrmNavControles)
    pnlFundoJanela: TPanel;
    rgpTipodeRelatorio: TRadioGroup;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    ckbInclurCancelados: TCheckBox;
    lblRelatorio: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor destroy; override;

  end;

var
  frmLerTipoRelatorio: TfrmLerTipoRelatorio;

implementation

{$R *.dfm}

{ TfrmLerTipoRelatorio }

destructor TfrmLerTipoRelatorio.destroy;
begin
  inherited;
  frmLerTipoRelatorio := nil;

end;

end.
