unit fmexclusaocontratosorcados;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DBCtrls,  Mask, ComCtrls,
  Buttons, ExtCtrls,
  //Biblio
  biblio, ctconstantes,
  //Repositorio
  fmcancelamentocontratosaberto,
  //Componentes
  cpdbgrid, cpdata, cpdbtext, cpdbfindcontrols, cpeditioncontrolvalidation,
  cpnumero;

type
  TfrmExclusaoContratosOrcados = class(TfrmCancelamentoContratosAberto)
    ecvValidar: TtecEditionControlValidation;
    procedure sbnGerarClick(Sender: TObject); override;
  protected
    procedure Cancelamento; override;
  public
    constructor Create(AOwner: TComponent); override;
    function VerificaCamposConsulta: Boolean;
  end;

var
  frmExclusaoContratosOrcados: TfrmExclusaoContratosOrcados;

implementation

uses dmexclusaocontratosorcados;

{$R *.dfm}

constructor TfrmExclusaoContratosOrcados.Create(AOwner: TComponent);
begin
  inherited;
  dtmExclusaoContratosOrcados := TdtmExclusaoContratosOrcados.Create(Self);
  FDataModulo := dtmExclusaoContratosOrcados;
end;

function TfrmExclusaoContratosOrcados.VerificaCamposConsulta: Boolean;
begin
  Result := ecvValidar.Verify(pnlDatas, ControleValido);
  if Result then
    Result := OperadorTernario(Trim(edfFilial.Text) <> '',(edfFilial.Exist), True);
  if Result then
    Result := OperadorTernario(Trim(edfVendedor.Text) <> '',(edfFilial.Exist), True);
end;

procedure TfrmExclusaoContratosOrcados.sbnGerarClick(Sender: TObject);
begin
  if VerificaCamposConsulta then
    inherited;
end;

procedure TfrmExclusaoContratosOrcados.Cancelamento;
begin
  dtmExclusaoContratosOrcados.ExcluirOrcados;
end;

end.
