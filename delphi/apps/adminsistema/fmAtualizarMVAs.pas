unit fmAtualizarMVAs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls, dmNCM,
  Grids, DBGrids, cpdbgrid, StdCtrls, Mask, DBCtrls, cpdbtext;

type
  TfrmAtualizarMVAs = class(TFrmCadastroPadrao)
    dbgAtualizarMVAs: TtecDBGrid;
    pnlAtualizarMVAs: TPanel;
    gbxAtualizarMVAs: TGroupBox;
    dtxnomeprotocolo: TtecDBText;
    lblLegenda: TLabel;
    ckbMarcarTodos: TCheckBox;
    procedure dbgAtualizarMVAsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgAtualizarMVAsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbMarcarTodosClick(Sender: TObject);
    procedure dbgAtualizarMVAsDblClick(Sender: TObject);
  protected
    procedure AlterarEstadoBotoes; override;
    function  InternoGravar: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;


  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;


  end;

var
  frmAtualizarMVAs: TfrmAtualizarMVAs;

implementation

{$R *.dfm}

{ TfrmAtualizarMVAs }

procedure TfrmAtualizarMVAs.AlterarEstadoBotoes;
begin
  inherited;
  sbnsalvar.enabled := dtmNCM.nProtocolosAtualizar <> 0;
end;

constructor TfrmAtualizarMVAs.Create(AOwner: TComponent);
begin
  inherited;
  dataset := dtmNCM.qryProtocolosAtualizar;
end;

procedure TfrmAtualizarMVAs.dbgAtualizarMVAsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  {
  case column.Index of
    1: if TDBGrid(Sender).DataSource.DataSet.FieldByName('selecionar').AsBoolean then
         TDBGrid(Sender).Canvas.Brush.Color := clGreen;
  end;
  }


  if TDBGrid(Sender).DataSource.DataSet.FieldByName('selecionar').AsBoolean then
     TDBGrid(Sender).Canvas.Brush.Color := clGreen;
     
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAtualizarMVAs.dbgAtualizarMVAsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if {(Shift = [ssCtrl]) and} (Key = VK_Space) then
    dtmNCM.MarcarRegistrosProtocolosAtualizar(false, false);

end;

procedure TfrmAtualizarMVAs.ckbMarcarTodosClick(Sender: TObject);
begin
  inherited;
  dtmNCM.MarcarRegistrosProtocolosAtualizar(ckbMarcarTodos.checked, true);
end;

destructor TfrmAtualizarMVAs.Destroy;
begin
  inherited;
  frmAtualizarMVAs := nil;
end;

procedure TfrmAtualizarMVAs.dbgAtualizarMVAsDblClick(Sender: TObject);
begin
  inherited;
  dtmNCM.MarcarRegistrosProtocolosAtualizar(false, false);
end;

function TfrmAtualizarMVAs.InternoGravar: Boolean;
begin
  inherited internogravar;
  dtmNCM.GravarProtocolosAtualizar;
end;

procedure TfrmAtualizarMVAs.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_F5: if (Shift = []) and sbnSalvar.Enabled then
       sbnSalvarClick(sbnSalvar);
  end;

end;

end.
