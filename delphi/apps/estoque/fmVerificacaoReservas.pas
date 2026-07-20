unit fmVerificacaoReservas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, frmultiplaselecaoaleatoria, frlistafiliais, fmajudabt,
  Buttons, ToolWin, ExtCtrls, dmVerificacaoReservas, Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, Menus, AdvMenus, tmsAdvGridExcel,
  AsgFindDialog, biblio, ctconstantes, StdCtrls, clparametrossistema;

type
  TfrmVerificacaoReservas = class(TfrmAjudaBt)
    fraListaFiliais1: TfraListaFiliais;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    pgcVerificacaoReservas: TPageControl;
    tstParametros: TTabSheet;
    tstDados: TTabSheet;
    pgcVerificacaoDadosReservaFuturo: TPageControl;
    tstReservaPrevia: TTabSheet;
    tstReservaFuturo: TTabSheet;
    sbnGerar: TSpeedButton;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    pnlBottom: TPanel;
    gbxCurvaABC: TGroupBox;
    ckbCurvaABC_A: TCheckBox;
    ckbCurvaABC_C: TCheckBox;
    ckbCurvaABC_B: TCheckBox;
    ckbCurvaABC_NaoDefinido: TCheckBox;
    dbgReservaFuturo: TDBAdvGrid;
    dbgReservasPrevias: TDBAdvGrid;
    pnlSelecionar: TPanel;
    ckbSelecionarTodosProdutosReservasFuturo: TCheckBox;
    Panel1: TPanel;
    ckbSelecionarTodosProdutosReservaPrevia: TCheckBox;
    procedure sbnGerarClick(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure Pesquizar1Click(Sender: TObject);
    procedure dbgReservasPreviasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgReservaFuturoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgReservasPreviasGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure dbgReservaFuturoGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure ckbSelecionarTodosProdutosReservaPreviaClick(
      Sender: TObject);
    procedure ckbSelecionarTodosProdutosReservasFuturoClick(
      Sender: TObject);
    procedure dbgReservaFuturoCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure dbgReservasPreviasCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
  end;

var
  frmVerificacaoReservas: TfrmVerificacaoReservas;

implementation

{$R *.dfm}

{ TfrmVerificacaoReservas }

constructor TfrmVerificacaoReservas.Create(AOwner: TComponent);
begin
  inherited;
  dtmVerificacaoReservas := TdtmVerificacaoReservas.Create(Self);

  fraMultiplaSelecaoAleatoria1.tstSelecaoAleatoriamodelosProduto.TabVisible := false;
  fraMultiplaSelecaoAleatoria1.tstSelecaoAleatoriaPromocoes.TabVisible := false;

  SetarActivePage(self);

end;

destructor TfrmVerificacaoReservas.Destroy;
begin
  FreeAndNIl(AdvGridFindDialog1);
  inherited;
end;

procedure TfrmVerificacaoReservas.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case Key of
       VK_F6 : if sbnGerar.Enabled then sbnGerarClick(Self);
  end;
  
  inherited;
end;

procedure TfrmVerificacaoReservas.sbnGerarClick(Sender: TObject);
begin
  inherited;
  dtmVerificacaoReservas.AbrirConsulta(
      fraListaFiliais1.ListaSelecionada_int,
      fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional,
      fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional,
      fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional,
      fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional,
      fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional,
      ckbCurvaABC_A.Checked,
      ckbCurvaABC_B.Checked,
      ckbCurvaABC_C.Checked,
      ckbCurvaABC_NaoDefinido.Checked
      
      );

  dbgReservaFuturo.AutoNumberCol(0);
  dbgReservasPrevias.AutoNumberCol(0);

  if dtmVerificacaoReservas.qryReservasPrevias.recordcount <> 0 then
  begin
    pgcVerificacaoReservas.ActivePage := tstDados;
    pgcVerificacaoDadosReservaFuturo.activePage := tstReservaPrevia;
  end
  else
  begin
    pgcVerificacaoReservas.ActivePage := tstDados;
    pgcVerificacaoDadosReservaFuturo.activePage := tstReservaFuturo;
  end;
end;

procedure TfrmVerificacaoReservas.ExportarExcel1Click(Sender: TObject);
begin
  inherited;
  if pgcVerificacaoDadosReservaFuturo.activepage = tstReservaPrevia then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgReservasPrevias;
    AdvGridExcelIO1.XLSExport(ExtractFilePath(Application.ExeName) + 'Saidas\Verificação_Reserva_Previa.xls', 'ReservaPrevia');
  end
  else
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgReservaFuturo;
    AdvGridExcelIO1.XLSExport(ExtractFilePath(Application.ExeName) + 'Saidas\Verificação_Reserva_e_Futuro.xls', 'Reserva_e_Futuro');
  end;

end;

procedure TfrmVerificacaoReservas.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  if pgcVerificacaoDadosReservaFuturo.activepage = tstReservaPrevia then
    AdvGridFindDialog1.Grid := dbgReservasPrevias
  else
    AdvGridFindDialog1.Grid := dbgReservaFuturo;

  AdvGridFindDialog1.Execute;
end;

procedure TfrmVerificacaoReservas.dbgReservasPreviasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_x) and (ssCtrl in Shift) then
    ExportarExcel1Click(Sender)

end;

procedure TfrmVerificacaoReservas.dbgReservaFuturoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_x) and (ssCtrl in Shift) then
    ExportarExcel1Click(Sender)

end;

procedure TfrmVerificacaoReservas.dbgReservasPreviasGetCellColor(
  Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState;
  ABrush: TBrush; AFont: TFont);
begin
  inherited;
  if ARow > 0 then
    with TDBAdvGrid(sender) do
    begin
      if (ARow MOD 2)=0 then
        if not (gdSelected in AState) then
          ABrush.Color := TColorRef(strtoint(parsistema.CorZebradoRelatorio));
    end;

end;

procedure TfrmVerificacaoReservas.dbgReservaFuturoGetCellColor(
  Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState;
  ABrush: TBrush; AFont: TFont);
begin
  inherited;
  if ARow > 0 then
    with TDBAdvGrid(sender) do
    begin
      if (ARow MOD 2)=0 then
        if not (gdSelected in AState) then
          ABrush.Color := TColorRef(strtoint(parsistema.CorZebradoRelatorio));
    end;

end;

procedure TfrmVerificacaoReservas.ckbSelecionarTodosProdutosReservaPreviaClick(
  Sender: TObject);
begin
  inherited;

  if dtmVerificacaoReservas.qryReservasPrevias.RecordCount > 0 then
    dtmVerificacaoReservas.SelecionarProdutosReservaPrevia(ckbSelecionarTodosProdutosReservaPrevia.Checked, True)
  else
    ckbSelecionarTodosProdutosReservaPrevia.checked := false;

end;

procedure TfrmVerificacaoReservas.ckbSelecionarTodosProdutosReservasFuturoClick(
  Sender: TObject);
begin
  inherited;

  if dtmVerificacaoReservas.qryReservadoFuturo.RecordCount > 0 then
    dtmVerificacaoReservas.SelecionarProdutosReservadoFuturo(ckbSelecionarTodosProdutosReservasFuturo.Checked, True)
  else
    ckbSelecionarTodosProdutosReservasFuturo.checked := false;

end;

procedure TfrmVerificacaoReservas.dbgReservaFuturoCanSort(Sender: TObject;
  ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  DoSort := False;
  OrdenarGrid(Sender, Acol);

end;

procedure TfrmVerificacaoReservas.dbgReservasPreviasCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  DoSort := False;
  OrdenarGrid(Sender, Acol);

end;

end.
