unit fmcancelamentocontratosreservados;

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
  cpdbgrid, cpdata, cpdbtext, cpdbfindcontrols, cpeditioncontrolvalidation;

type
  TfrmCancelamentoContratosReservados = class(TfrmCancelamentoContratosAberto)
    ecvValidar: TtecEditionControlValidation;
    procedure sbnGerarClick(Sender: TObject); override;
  protected
    procedure Cancelamento; override;
  public
    constructor Create(AOwner: TComponent); override;
    function VerificaCamposConsulta: Boolean;
  end;

var
  frmCancelamentoContratosReservados: TfrmCancelamentoContratosReservados;

implementation

uses dmcancelamentocontratosreservados;

{$R *.dfm}

constructor TfrmCancelamentoContratosReservados.Create(AOwner: TComponent);
begin
  inherited;
  dtmCancelamentoContratosReservados := TdtmCancelamentoContratosReservados.Create(Self);
  FDataModulo := dtmCancelamentoContratosReservados;
end;

function TfrmCancelamentoContratosReservados.VerificaCamposConsulta: Boolean;
begin
  Result := ecvValidar.Verify(pnlDatas, ControleValido);
  if Result then
    Result := OperadorTernario(Trim(edfFilial.Text) <> '',(edfFilial.Exist), True);
  if Result then
    Result := OperadorTernario(Trim(edfVendedor.Text) <> '',(edfFilial.Exist), True);
end;

procedure TfrmCancelamentoContratosReservados.sbnGerarClick(Sender: TObject);
begin
  if VerificaCamposConsulta then
    inherited;
end;

procedure TfrmCancelamentoContratosReservados.Cancelamento;
begin
  dtmCancelamentoContratosReservados.CancelarReservados;
end;

end.
