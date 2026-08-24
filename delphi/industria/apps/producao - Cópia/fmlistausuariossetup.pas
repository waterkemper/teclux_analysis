unit fmListaUsuariosSetup;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmoperacoesosp, fmajuda, Grids, DBGrids, cpdbgrid, Buttons, Windows;

type
  TfrmListaUsuariosSetup = class(TfrmAjuda)
    btnOK: TBitBtn;
    btncancelar: TBitBtn;
    dbgOperacoes: TtecDBGrid;
    Label1: TLabel;
    procedure dbgOperacoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

  end;

var
  frmListaUsuariosSetup: TfrmListaUsuariosSetup;

implementation

{$R *.dfm}

procedure TfrmListaUsuariosSetup.dbgOperacoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_return then
    ModalResult := mrOk;
  inherited;

end;

destructor TfrmListaUsuariosSetup.Destroy;
begin
  inherited;
  frmListaUsuariosSetup := nil;
end;

procedure TfrmListaUsuariosSetup.FormShow(Sender: TObject);
begin
  inherited;
  dbgOperacoes.setfocus;
end;

end.
