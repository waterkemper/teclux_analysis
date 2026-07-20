unit fmcalcularparcelas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmnavcontroles, frconsulta, frconsultacodigo, cptexto, cpdata,
  cpnumero, cpeditioncontrolvalidation, Buttons, Biblio, ctconstantes;

type
  TfrmCalcularParcelas = class(TfrmNavControles)
    gbxParametros: TGroupBox;
    gbxNrParcelas: TGroupBox;
    edtNrParcelas: TEditNumero;
    gbxVencto: TGroupBox;
    edtVencimento: TEditData;
    gbxIntervalo: TGroupBox;
    Label1: TLabel;
    edtIntervalo: TEditNumero;
    gbxTipoParcela: TGroupBox;
    edtTipoParcela: TEditTexto;
    gbxDataBase: TGroupBox;
    EditData1: TEditData;
    gbxJuros: TGroupBox;
    gbxTaxaJuros: TGroupBox;
    EditNumero1: TEditNumero;
    gbxDataJuros: TGroupBox;
    EditData2: TEditData;
    gbxMoeda: TGroupBox;
    fraConsultaMOeda: TfraConsultaCodigo;
    sbnGerarParcelas: TSpeedButton;
    ecvDuplicatas: TtecEditionControlValidation;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCalcularParcelas: TfrmCalcularParcelas;

implementation

{$R *.dfm}

{ TfrmCalcularParcelas }

constructor TfrmCalcularParcelas.Create(AOwner: TComponent);
begin
  inherited;
  fraConsultaMOeda.TipoPesquisa:= pesMOEDAS;
end;

destructor TfrmCalcularParcelas.Destroy;
begin
  frmCalcularParcelas:= nil;
  inherited;
end;

end.
