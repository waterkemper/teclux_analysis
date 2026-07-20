unit fmimpressaohistoricos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, fmnavcontroles, Buttons;

type
  TfrmImpressaoHistoricos = class(TfrmNavControles)
    rgpOrdenacao: TRadioGroup;
    rgpInativos: TRadioGroup;
    gbxOpcoes: TGroupBox;
    ckbCaixa: TCheckBox;
    ckbContasapagar: TCheckBox;
    ckbContabilidade: TCheckBox;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    pnlsepara: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor  Destroy; override;
  end;

var
  frmImpressaoHistoricos: TfrmImpressaoHistoricos;

implementation

{$R *.dfm}

{ TfrmImpressaoHistoricos }

destructor TfrmImpressaoHistoricos.Destroy;
begin
  inherited;
  frmImpressaoHistoricos := nil;
end;

end.
