unit fmLiberacaoMaquinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls, Grids,
  DBGrids, cpdbgrid, dmLiberacaoMaquinas, StdCtrls;

type
  TfrmLiberacaoMaquinas = class(TfrmCadastroPadrao)
    dbgMaquinasBloqueadas: TtecDBGrid;
    Panel1: TPanel;
    lblLegenda: TLabel;
    ckbMarcarTodos: TCheckBox;
    sbnGerar: TSpeedButton;
    gbxMaquina: TGroupBox;
    gbxParada: TGroupBox;
    gbxOSP: TGroupBox;
    gbxOperacao: TGroupBox;
    gbxInicioOperacao: TGroupBox;
    gbxTerminoOperacao: TGroupBox;
    gbxUsuario: TGroupBox;
    procedure dbgMaquinasBloqueadasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgMaquinasBloqueadasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbMarcarTodosClick(Sender: TObject);
    procedure dbgMaquinasBloqueadasDblClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
  private
    { Private  declarations }
    procedure AlterarEstadoBotoes; override;
    function  InternoGravar: Boolean; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmLiberacaoMaquinas: TfrmLiberacaoMaquinas;

implementation

uses dmbasico;

{$R *.dfm}

{ TfrmLiberacaoMaquinas }

constructor TfrmLiberacaoMaquinas.Create(AOwner: TComponent);
begin
  inherited;
  dtmLiberacaoMaquinas := TdtmLiberacaoMaquinas.Create(Self);
  DataSet := dtmLiberacaoMaquinas.qryMaquinasBloqueadas;
end;

destructor TfrmLiberacaoMaquinas.Destroy;
begin
  dtmLiberacaoMaquinas.qryMaquinasBloqueadas.close;
  dtmLiberacaoMaquinas := nil;
  inherited;
end;

procedure TfrmLiberacaoMaquinas.dbgMaquinasBloqueadasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgMaquinasBloqueadas.DataSource.DataSet.FieldByName('liberar').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmLiberacaoMaquinas.dbgMaquinasBloqueadasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Space then
    if Shift = [ssCtrl] then
    begin
      dtmLiberacaoMaquinas.MarcarSelecionados(ckbMarcarTodos.Checked, False);
      AlterarEstadoBotoes;
    end;
end;

procedure TfrmLiberacaoMaquinas.ckbMarcarTodosClick(Sender: TObject);
begin
  inherited;
  begin
    dtmLiberacaoMaquinas.MarcarSelecionados(ckbMarcarTodos.Checked,True);
    AlterarEstadoBotoes;
  end;
end;

procedure TfrmLiberacaoMaquinas.dbgMaquinasBloqueadasDblClick(
  Sender: TObject);
begin
  inherited;
  begin
    dtmLiberacaoMaquinas.MarcarSelecionados(ckbMarcarTodos.Checked, False);
    AlterarEstadoBotoes;
  end;
end;

procedure TfrmLiberacaoMaquinas.sbnGerarClick(Sender: TObject);
begin
  inherited;
  dtmLiberacaoMaquinas.AbrirMaquinasBloqueadas;
  dtmLiberacaoMaquinas.QtdeMarcados := 0;
  AlterarEstadoBotoes;
end;

procedure TfrmLiberacaoMaquinas.AlterarEstadoBotoes;
begin
  inherited;
  sbnSalvar.Enabled := dtmLiberacaoMaquinas.QtdeMarcados <> 0;
end;

function TfrmLiberacaoMaquinas.InternoGravar: Boolean;
begin
  dtmLiberacaoMaquinas.gravarLiberacaoMaquinas;
  sbnGerarClick(self);
end;

end.
