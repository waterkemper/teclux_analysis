unit fmdadosfiscaiscontratos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  fmnavcontroles, dmdevolucaomercadorias, StdCtrls, ExtCtrls, Grids,
  DBGrids, cpdbgrid, Buttons{Qete,};

type
  TfrmDadosFiscaisContratos = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxDadosFiscaisContratos: TGroupBox;
    dbgDadosFiscais: TtecDBGrid;
    sbnConfirma: TBitBtn;
    procedure sbnConfirmaClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    destructor  Destroy; override;
  end;

var
  frmDadosFiscaisContratos: TfrmDadosFiscaisContratos;

implementation

{$R *.dfm}

{ TfrmDadosFiscaisContratos }

{ TfrmDadosFiscaisContratos }

destructor TfrmDadosFiscaisContratos.Destroy;
begin
  inherited;
  frmDadosFiscaisContratos:= nil;
end;

procedure TfrmDadosFiscaisContratos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Key:= MAXWORD;
  inherited;
end;

procedure TfrmDadosFiscaisContratos.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
 