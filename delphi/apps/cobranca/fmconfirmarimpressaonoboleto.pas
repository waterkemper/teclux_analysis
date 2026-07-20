unit fmconfirmarimpressaonoboleto;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, biblio, Windows, ctconstantes,
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
    destructor destroy; override;
  end;

var

frmConfirmarImpressaonoboleto : tfrmConfirmarImpressaonoboleto;

implementation


{$R *.dfm}

{ TfrmConfirmarImpressaonoboleto }


procedure TfrmConfirmarImpressaonoboleto.bbnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;


destructor TfrmConfirmarImpressaonoboleto.destroy;
begin
  inherited;
  frmConfirmarImpressaonoboleto := nil;
end;

procedure TfrmConfirmarImpressaonoboleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Canclose := (ModalResult = mrOK) or (ModalResult = mrCANCEL);
end;


end.
