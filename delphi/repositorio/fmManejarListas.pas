unit fmManejarListas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, cpdbgrid, ExtCtrls, DB, cpdatasource, Buttons,
  StdCtrls, cpQuery;

type
  TfrmManejarListas = class(TForm)
    dbgListas: TtecDBGrid;
    dsrLista: TtecDataSource;
    pnlRight: TPanel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    pnlLabels: TPanel;
    sbnProcura: TSpeedButton;
    sbnExcluir: TSpeedButton;
    sbnIncluirItem: TSpeedButton;
    procedure sbnIncluirItemClick(Sender: TObject);
    procedure sbnExcluirClick(Sender: TObject);
    procedure bbnOKClick(Sender: TObject);
    procedure bbnCancelarClick(Sender: TObject);
    procedure dbgListasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgListasDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmManejarListas: TfrmManejarListas;

implementation

{$R *.dfm}

procedure TfrmManejarListas.sbnIncluirItemClick(Sender: TObject);
begin
  TtecQuery(dsrLista.DataSet).readonly := false;
  dsrLista.dataset.Append;
end;

procedure TfrmManejarListas.sbnExcluirClick(Sender: TObject);
begin
  if not TtecQuery(dsrLista.DataSet).readonly then
    dsrLista.dataset.delete;
end;

procedure TfrmManejarListas.bbnOKClick(Sender: TObject);
begin
  if dsrLista.dataset.state in [dsedit, dsinsert] then
    dsrLista.dataset.post;
end;

procedure TfrmManejarListas.bbnCancelarClick(Sender: TObject);
begin
  if dsrLista.dataset.state in [dsedit, dsinsert] then
    dsrLista.dataset.cancel;

end;

procedure TfrmManejarListas.dbgListasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    bbnOK.SetFocus;
end;

procedure TfrmManejarListas.dbgListasDblClick(Sender: TObject);
begin
  if dsrLista.dataset.state in [dsedit, dsinsert] then
    dsrLista.dataset.post;

  if not dsrLista.dataset.isempty then
    modalresult := MRok;
end;

constructor TfrmManejarListas.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmManejarListas.Destroy;
begin
  frmManejarListas := nil;
  inherited;
end;

end.
