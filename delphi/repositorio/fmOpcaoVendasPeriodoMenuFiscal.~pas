unit fmOpcaoVendasPeriodoMenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin,
  frselecaoaleatoria, fmnavcontroles, dmtecsoft, dmmenufiscal, DB, ctconstantes,
  frconsulta, frconsultacodigo, cpdbfindcontrols, biblio, cpdata, cpnumero;

type
  TfrmOpcaoVendasPeriodoMenuFiscal = class(TfrmNavControles)
    rbnOpcaoVendasPeriodo: TRadioGroup;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    gbxFaixas: TGroupBox;
    lblDe: TLabel;
    lblAte: TLabel;
    pnlCupons: TPanel;
    edtCupomInicial: TEditNumero;
    edtCupomFinal: TEditNumero;
    pnlDatas: TPanel;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    EditNumero1: TEditNumero;
    Panel2: TPanel;
    EdtDataInventario: TEditData;
    procedure rbnOpcaoVendasPeriodoClick(Sender: TObject);
    procedure bbnOKClick(Sender: TObject);
  protected


  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;

  end;

var
  frmOpcaoVendasPeriodoMenuFiscal: TfrmOpcaoVendasPeriodoMenuFiscal;

implementation

{$R *.dfm}

procedure TfrmOpcaoVendasPeriodoMenuFiscal.rbnOpcaoVendasPeriodoClick(Sender: TObject);
begin
  inherited;
{  case rbnOpcaoVendasPeriodo.ItemIndex of
  0 :  gbxContasdoEstoqueParcial.Enabled := false;
  1 :  gbxContasdoEstoqueParcial.Enabled := true;
  end;}

end;




constructor TfrmOpcaoVendasPeriodoMenuFiscal.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmOpcaoVendasPeriodoMenuFiscal.Destroy;
begin
  inherited;
  frmOpcaoVendasPeriodoMenuFiscal := nil;
end;




procedure TfrmOpcaoVendasPeriodoMenuFiscal.bbnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;



end.
