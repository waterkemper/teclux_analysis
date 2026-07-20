unit fmOpcaoVendasIdentificadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmnavcontroles, StdCtrls, Mask, cpdata, Buttons, biblio;

type
  TfrmOpcaoVendasIdentificadas = class(TFrmNavControles)
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtMesInicial: TEditMesAno;
    edtMesFinal: TEditMesAno;
    gbxCNPJ: TGroupBox;
    edtCPFouCNPJ: TMaskEdit;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    procedure bbnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;

  end;

var
  frmOpcaoVendasIdentificadas: TfrmOpcaoVendasIdentificadas;

implementation

{$R *.dfm}

procedure TfrmOpcaoVendasIdentificadas.bbnOKClick(Sender: TObject);
begin
  inherited;
  if (edtCPFouCNPJ.text = '') and
      MesAnoEmBranco(edtMesInicial.text) and
      MesAnoEmBranco(edtMesFinal.text) then
  begin
    ModalResult := mrNone;
    MensagemAviso('Os controles devem ser preenchidos');
    edtMesInicial.setfocus;
    edtMesInicial.selectall;
  end
  else
    ModalResult := mrOK;
end;

constructor TfrmOpcaoVendasIdentificadas.Create(AOwner: TComponent);
begin
  inherited;
  frmOpcaoVendasIdentificadas := nil;
end;

destructor TfrmOpcaoVendasIdentificadas.Destroy;
begin

  inherited;
end;

end.
