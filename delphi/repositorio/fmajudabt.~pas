unit fmajudabt;

interface

uses
  //CLX
  SysUtils, Classes, Forms, Controls, Buttons, ExtCtrls, ComCtrls, biblio,
  //Repositorio
  fmnavcontroles, Windows, ToolWin;

type
  TfrmAjudaBt = class(TfrmNavControles)
    pnlBarra: TPanel;
    bvlBotoesEd: TBevel;
    tblBarra: TToolBar;
    sbnProcurar: TSpeedButton;
    sbnAjuda: TSpeedButton;
    tbnDivisor: TToolButton;
    pnlTopMenu: TPanel;
    tblBarraCadastro: TToolBar;
    procedure sbnAjudaClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

Uses
  //CLX
  {Qete,}
  //Biblio
  ctconstantes;

destructor TfrmAjudaBt.Destroy;
begin

  inherited;
end;

procedure TfrmAjudaBt.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then begin
    if sbnProcurar.Enabled or (Shift = [ssCtrl]) then
      inherited;
  end
  else if Key = VK_F1 then begin
    if sbnAjuda.Enabled then
       sbnAjuda.Click
  end
  else inherited;
end;

procedure TfrmAjudaBt.sbnAjudaClick(Sender: TObject);
begin
  inherited;
  MostraContextoAjuda;
end;

procedure TfrmAjudaBt.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar('');
  CtrlOn := False;
end;

end.
