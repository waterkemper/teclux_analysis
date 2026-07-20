unit fmrelatoriopadrao;

interface

uses
  //CLX
  SysUtils, Classes, Forms, Controls, Buttons, ExtCtrls, Windows,
  //Repositorio
  fmnavcontroles, cpdbfindcontrols, Types, ToolWin, ComCtrls, biblio;

type
  TfrmRelatorioPadrao = class(TfrmNavControles)
    pnlBarra: TToolBar;
    sbnAjuda: TSpeedButton;
    sbnImprimir: TSpeedButton;
    bvlBotoes: TBevel;
    pnlFundoJanela: TPanel;
    procedure sbnAjudaClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pnlBarraClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

    procedure InternoImpressao; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;


  end;

implementation

uses fmajuda;

{$R *.dfm}

{
Uses
  //CLX
  QT;
  }

procedure TfrmRelatorioPadrao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F7) then begin
    if sbnImprimir.Enabled then
      sbnImprimirClick(sbnImprimir);
  end
  else
    inherited;
end;

procedure TfrmRelatorioPadrao.sbnAjudaClick(Sender: TObject);
begin
  inherited;
  VerificarComponentesdePesquisa;
  MostraContextoAjuda;
end;

procedure TfrmRelatorioPadrao.sbnImprimirClick(Sender: TObject);
var
 vPodeImprimir : boolean;
begin
  inherited;

  vPodeImprimir := true;

  if assigned(sbnImprimirRelatorio) then
    if not vPodeImprimirRelatorio then
      vPodeImprimir := false;

  if vpodeImprimir then
  begin
//    if assigned(sbnImprimirRelatorio) then
      sbnImprimirRelatorio := sbnImprimir;

    sbnImprimir.Enabled := false;
    vPodeImprimirRelatorio := false;
    try

     if VerificarComponentesdePesquisa then
       InternoImpressao;

    finally
     if assigned(sbnImprimir) then
       sbnImprimir.Enabled := true;

     if assigned(sbnImprimirRelatorio) then
       sbnImprimirRelatorio := sbnImprimir;

     vPodeImprimirRelatorio := true;
    end;
  end;
end;

procedure TfrmRelatorioPadrao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
//  Canclose := sbnImprimir.Enabled;
end;

procedure TfrmRelatorioPadrao.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
end;

procedure TfrmRelatorioPadrao.pnlBarraClick(Sender: TObject);
begin
  inherited;
  VerificarComponentesdePesquisa;
end;

constructor TfrmRelatorioPadrao.Create(AOwner: TComponent);
begin
  SalvarPropriedadesFormulario := true;

  inherited;
end;

end.
