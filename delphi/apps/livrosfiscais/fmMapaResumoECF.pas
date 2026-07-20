unit fmMapaResumoECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  dmMapaResumoECF, frintervalodatas, cpeditioncontrolvalidation;

type
  TfrmMapaResumoECF = class(TFrmRelatorioPadrao)
    fraIntervaloDatas1: TfraIntervaloDatas;
    ecvValida: TtecEditionControlValidation;
  private
    { Private declarations }
  protected
    procedure internoImpressao; Override;
    function ValidarCamposSelecao: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmMapaResumoECF: TfrmMapaResumoECF;
  ControleValido: TWinControl;

implementation

{$R *.dfm}

{ TfrmMapaResumoECF }

constructor TfrmMapaResumoECF.Create(AOwner: TComponent);
begin
  inherited;
  dtmMapaResumoECF := TdtmMapaResumoECF.Create(Self);

  fraIntervaloDatas1.edtDataInicial.Text := datetostr(dtmMapaResumoECF.dataservidor);
  fraIntervaloDatas1.edtDataFinal.Text := datetostr(dtmMapaResumoECF.dataservidor);
end;

destructor TfrmMapaResumoECF.Destroy;
begin

  inherited;
end;

procedure TfrmMapaResumoECF.internoImpressao;
begin
  inherited;
   if ValidarCamposSelecao
   then with dtmMapaResumoECF do
      ImprimirRelatorio(fraIntervaloDatas1.edtDataInicial.Text, fraIntervaloDatas1.edtDataFinal.Text);
end;

function TfrmMapaResumoECF.ValidarCamposSelecao: Boolean;
begin
   Result:= ecvValida.Verify(fraIntervaloDatas1.gbxPeriodo, ControleValido);
end;

end.
