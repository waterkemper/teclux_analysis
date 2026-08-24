unit fmOperacoesemLote;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmoperacoesosp, fmajuda, Grids, DBGrids, cpdbgrid, Buttons, Windows,
  biblio, db, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ExtCtrls,
  fmcadastropadrao, ComCtrls, ToolWin, ActnList;

type
  TfrmOperacoesemLote = class(TfrmCadastroPadrao)
    gbxListaOperacaoMaquinaLiberada: TGroupBox;
    dbgOperacoesaFechar: TtecDBGrid;
    gbxCodigoUsuario: TGroupBox;
    edfUsuarioOperacao: TtecDbEditFind;
    dtxNomeUsuario: TtecDBText;
    Label1: TLabel;
    Shape1: TShape;
    sbnGerar: TSpeedButton;
    GroupBox1: TGroupBox;
    dbgMaquinasaFechar: TtecDBGrid;
    ActionList1: TActionList;
    Action1: TAction;
    procedure dbgOperacoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOperacoesaFecharDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgOperacoesaFecharKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbMarcarTodosClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgMaquinasaFecharDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgMaquinasaFecharDblClick(Sender: TObject);
    procedure dbgMaquinasaFecharKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action1Update(Sender: TObject);
  private
    { Private declarations }
    function  InternoGravar: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;



  end;

type
  TtecDBGridAux  = class(TDBGrid);


var
  frmOperacoesemLote: TfrmOperacoesemLote;

implementation



{$R *.dfm}

procedure TfrmOperacoesemLote.dbgOperacoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_return then
  begin

  end;
  inherited;
end;

destructor TfrmOperacoesemLote.Destroy;
begin
  inherited;
  frmOperacoesemLote := nil;
end;


procedure TfrmOperacoesemLote.dbgOperacoesaFecharDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if (column = dbgOperacoesaFechar.Columns[2]) or
     (column = dbgOperacoesaFechar.Columns[3]) or
     (column = dbgOperacoesaFechar.Columns[4]) or
     (column = dbgOperacoesaFechar.Columns[5]) then
  begin
    if dtmOperacoesOSP.qryOperacaoesaFecharoperacaopermitidaaousuario.AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Font.Color := clWhite;
      TDBGrid(Sender).Canvas.Brush.Color := clGreen;
      TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmOperacoesemLote.dbgOperacoesaFecharKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  if Key = VK_Space then
    if Shift = [ssCtrl] then
    begin
      dtmOperacoesOSP.MarcarSelecionados(ckbMarcarTodos.Checked, False);
      AlterarEstadoBotoes;
    end;
    }
end;

procedure TfrmOperacoesemLote.ckbMarcarTodosClick(Sender: TObject);
begin
  inherited;
  {
  dtmOperacoesOSP.MarcarSelecionados(ckbMarcarTodos.Checked, true);
  AlterarEstadoBotoes;
  }
end;


function TfrmOperacoesemLote.InternoGravar: Boolean;
begin
  dtmOperacoesOSP.gravarOperacaoesaFechar;
  sbnGerarClick(self);
end;

procedure TfrmOperacoesemLote.sbnGerarClick(Sender: TObject);
begin
  inherited;
  dtmOperacoesOSP.AbrirOperacaoesaFechar;
end;

constructor TfrmOperacoesemLote.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmOperacoesOSP.qryOperacaoesaFechar;
end;

procedure TfrmOperacoesemLote.dbgMaquinasaFecharDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
{  if dbgMaquinasaFechar.DataSource.DataSet.FieldByName('selecionar').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;}

end;

procedure TfrmOperacoesemLote.dbgMaquinasaFecharDblClick(Sender: TObject);
begin
  inherited;
//  dtmOperacoesOSP.MarcarSelecionados(ckbMarcarTodos.Checked, False);
//  AlterarEstadoBotoes;
end;

procedure TfrmOperacoesemLote.dbgMaquinasaFecharKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
{  if Key = VK_Space then
    if Shift = [ssCtrl] then
    begin
      dtmOperacoesOSP.MarcarSelecionados(ckbMarcarTodos.Checked, False);
      AlterarEstadoBotoes;
    end;}

end;

procedure TfrmOperacoesemLote.Action1Update(Sender: TObject);
begin
  inherited;
  sbnSalvar.Enabled := not dtmOperacoesOSP.qryMaquinasaFechardesconsiderar.AsBoolean;
end;

procedure TfrmOperacoesemLote.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key =VK_F5) then
    begin
      if sbnSalvar.Enabled then
        sbnSalvarClick(self);
    end
    else
    if (key =VK_F6) then
      sbnGerarClick(self);
  end;

end;

end.
