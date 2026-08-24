unit fmmensagemgrid;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cptexto, Grids, DBGrids, cpdbgrid, ExtCtrls, Buttons;

type
  TfrmMensagemGrid = class(TForm)
    lblTitulo: TLabel;
    dbgMensagem: TtecDBGrid;
    pnlBottom: TPanel;
    bbnOK: TBitBtn;
    lblTexto: TLabel;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  frmMensagemGrid: TfrmMensagemGrid;

implementation

{$R *.dfm}

{ TfrmMensagemGrid }

destructor TfrmMensagemGrid.Destroy;
begin
  inherited;
  frmMensagemGrid := nil;
end;

procedure TfrmMensagemGrid.FormResize(Sender: TObject);
begin
  bbnOK.left := self.width div 2;
  bbnOK.left := bbnOK.left - (bbnOK.width div 2);
end;

end.
