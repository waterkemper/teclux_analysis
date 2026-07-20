unit fmexibirjurosdescontos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, ExtCtrls, StdCtrls, cpnumero, Buttons;

type
  TfrmExibirJurosDescontos = class(TfrmNavControles)
    pnlExibirJurosDescontos: TPanel;
    gbxExibirJurosDescontos: TGroupBox;
    gbxPagamentosAtraso: TGroupBox;
    lblDiasAtrasoMulta1: TLabel;
    lblDiasAtrasoJuros1: TLabel;
    edtDiasAtraso1: TEditNumero;
    edtDiasAtraso2: TEditNumero;
    lblDias3: TLabel;
    lblPercentagem2: TLabel;
    edtPercAtrasoMulta1: TEditNumero;
    lblPercentagem3: TLabel;
    edtPercAtrasoMulta2: TEditNumero;
    lblMultas: TLabel;
    lblPercentagem4: TLabel;
    edtPercAtrasoJuros1: TEditNumero;
    lblPercentagem5: TLabel;
    edtPercAtrasoJuros2: TEditNumero;
    lblDias5: TLabel;
    lblJuros: TLabel;
    lblMultas1: TLabel;
    lblJuros1: TLabel;
    gbxDesconto: TGroupBox;
    lblDescontoPagAntecipado: TLabel;
    edtDescontoPagAntecipado: TEditNumero;
    Label1: TLabel;
    sbnFechar: TBitBtn;
    procedure sbnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
  end;

var
  frmExibirJurosDescontos: TfrmExibirJurosDescontos;

implementation

{$R *.dfm}

uses   clparametrossistema;

constructor TfrmExibirJurosDescontos.Create(AOwner: TComponent);
begin
  inherited;
  edtDiasAtraso1.Text:= IntToStr(ParSistema.DiasAtraso1);
  edtDiasAtraso2.Text:= IntToStr(ParSistema.DiasAtraso2);
  edtPercAtrasoMulta1.Text:= FloatToStr(ParSistema.PercentualAtrasoMultas1);
  edtPercAtrasoMulta2.Text:= FloatToStr(ParSistema.PercentualAtrasoMultas2);
  edtPercAtrasoJuros1.Text:= FloatToStr(ParSistema.PercentualAtrasoJuros1);
  edtPercAtrasoJuros2.Text:= FloatToStr(ParSistema.PercentualAtrasoJuros2);
  edtDescontoPagAntecipado.Text := FloatToStr(ParSistema.DescontoPagAntecipado);
  sbnFechar.SetFocus;
end;

destructor TfrmExibirJurosDescontos.destroy;
begin
  inherited;
  frmExibirJurosDescontos:= nil;
end;

procedure TfrmExibirJurosDescontos.sbnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
 