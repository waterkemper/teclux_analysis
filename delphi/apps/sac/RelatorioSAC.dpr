program RelatorioSAC;

uses
  QForms,
  fmajuda in '../../repositorio/fmajuda.pas' {frmAjuda},
  fmnavcontroles in '../../repositorio/fmnavcontroles.pas' {frmNavControles},
  fmajudabt in '../../repositorio/fmajudabt.pas' {frmAjudaBt},
  dmbasico in '../../repositorio/dmbasico.pas' {dtmBasico: TDataModule},
  dmtecsoftpadrao in '../../repositorio/dmtecsoftpadrao.pas' {dtmTecSoftPadrao: TDataModule},
  fmconsultabasica in '../../repositorio/fmconsultabasica.pas' {frmConsultaBasica},
  fmconsultaporcampo in '../../repositorio/fmconsultaporcampo.pas' {frmConsultaPorCampo},
  fmrelatoriosac in 'fmrelatoriosac.pas' {frmRelatorioSac},
  dmtecsoft in '../tecsoft/dmtecsoft.pas' {dtmTecSoft: TDataModule},
  dmrelatoriosac in 'dmrelatoriosac.pas' {dtmRelatorioSAC: TDataModule},
  ctconstantes in '../../biblio/ctconstantes.pas',
  biblio in '../../biblio/biblio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdtmTecSoft, dtmTecSoft);
  Application.CreateForm(TfrmRelatorioSac, frmRelatorioSac);
  Application.Run;
end.
