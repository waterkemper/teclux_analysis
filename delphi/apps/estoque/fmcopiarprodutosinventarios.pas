unit fmcopiarprodutosinventarios;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls,
  Grids, DBGrids, Windows, ZQuery,
  ctconstantes, cpdbgrid, dmcadastroinventario, fmconsultabasica,
  fmconsultaporcampo, fmajudabt, DBCtrls, cpdbtext, ActnList, Mask,
  cpdbfindcontrols, biblio, ToolWin;

type
  TfrmCopiarProdutosInventarios = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxProdutos: TGroupBox;
    pnlFundoProdutos: TPanel;
    dbgProdutos: TtecDBGrid;
    pnlProdutosAbaixo: TPanel;
    ckbSelecionarTodos: TCheckBox;
    sbnGravar: TSpeedButton;
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnGravarClick(Sender: TObject);
  private
    FPrecoAtual: Boolean;
    { Private declarations }
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); overload; override;
    destructor  Destroy; override;
    { Public declarations }
  end;

var
  frmCopiarProdutosInventarios: TfrmCopiarProdutosInventarios;

implementation

uses fmnavcontroles;

{$R *.dfm}

{ TForm1 }

constructor TfrmCopiarProdutosInventarios.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TfrmCopiarProdutosInventarios.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroInventario.SelecionarInventarioCopiar(ckbSelecionarTodos.Checked, True);
end;

procedure TfrmCopiarProdutosInventarios.dbgProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then
  begin
    if dbgProdutos.DataSource.DataSet.FieldByName('selecionar').AsBoolean then  begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    end;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCopiarProdutosInventarios.dbgProdutosDblClick(Sender: TObject);
begin
  inherited;
  dtmCadastroInventario.SelecionarInventarioCopiar(false,false);
end;

procedure TfrmCopiarProdutosInventarios.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_SPACE) and
     (Shift = [ssCtrl]) then
    dtmCadastroInventario.SelecionarInventarioCopiar(false, false);
end;

procedure TfrmCopiarProdutosInventarios.sbnGravarClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroInventario.HaInventarioCopiarSelecionado then
  begin
    if (MensagemConfirmacao('A inclusão dos produtos destes inventários no inventário atual') = smbOk) then
       ModalResult := mrOK;
  end;
end;

procedure TfrmCopiarProdutosInventarios.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Shift = [] then
  begin
    case key of
      VK_F5: if sbnGravar.Enabled then
                sbnGravarClick(nil);
    end;
  end;
end;

destructor TfrmCopiarProdutosInventarios.Destroy;
begin
  inherited;
  frmCopiarProdutosInventarios := nil;
end;

end.
