unit fmconfirmarimpressaonoboleto;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, biblio, {Qete,} ctconstantes,
  //REpositorio
  fmnavcontroles, ExtCtrls, Buttons, cptexto;

type
  TfrmConfirmarImpressaonoboleto = class(TfrmNavControles)
    ckbImprimirRelatorio: TCheckBox;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    ckbImprimirBoleto: TCheckBox;
    procedure bbnOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  private

  public

  end;

implementation


{$R *.dfm}

{ TfrmConfirmarImpressaonoboleto }


procedure TfrmConfirmarImpressaonoboleto.bbnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;


procedure TfrmConfirmarImpressaonoboleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Canclose := (ModalResult = mrOK) or (ModalResult = mrCANCEL);
end;


end.
