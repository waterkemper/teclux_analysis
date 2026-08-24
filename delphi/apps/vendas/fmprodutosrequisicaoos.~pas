unit fmprodutosrequisicaoos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmrelatoriopadrao, Grids, DBGrids, cpdbgrid, ExtCtrls,
  Buttons, {Qete,} ZQuery, dmordemservico, clparametrossistema, ToolWin,
  ComCtrls;

type
  TfrmProdutosRequisicaoOS = class(TfrmRelatorioPadrao)
    dbgProdutosEquipamentosOS: TtecDBGrid;
    lblIncluido: TLabel;
    Shape1: TShape;
    procedure dbgProdutosEquipamentosOSDblClick(Sender: TObject);
    procedure dbgProdutosEquipamentosOSKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgProdutosEquipamentosOSDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure SetDataModulo(Dtm: TdtmOrdemServico);
    { Public declarations }
  end;

var
  frmProdutosRequisicaoOS: TfrmProdutosRequisicaoOS;

implementation

{$R *.dfm}

{ TfrmProdutosRequisicaoOS }

destructor TfrmProdutosRequisicaoOS.Destroy;
begin
  inherited;
  frmProdutosRequisicaoOS := nil;
end;

procedure TfrmProdutosRequisicaoOS.InternoImpressao;
begin
  inherited;
  dtmordemservico.ImprimirRequisicao;
  ModalResult := mrOK;
end;

procedure TfrmProdutosRequisicaoOS.SetDataModulo(
  Dtm: TdtmOrdemServico);
begin
  dtmordemservico := dtm;
end;

procedure TfrmProdutosRequisicaoOS.dbgProdutosEquipamentosOSDblClick(
  Sender: TObject);
begin
  inherited;
  dtmordemservico.SelecionarRegistroRequisicao;
  setfocus;
end;

procedure TfrmProdutosRequisicaoOS.dbgProdutosEquipamentosOSKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (key = VK_SPACE) then
  begin
    dtmordemservico.SelecionarRegistroRequisicao;
    setFocus;
  end;
end;

constructor TfrmProdutosRequisicaoOS.Create(AOwner: TComponent);
begin
  inherited;
  if dbgProdutosEquipamentosOS.columns[2].width  < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosEquipamentosOS.columns[2].width  := ParSistema.TamanhoMascaraQuantidade;
  if dbgProdutosEquipamentosOS.columns[5].width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosEquipamentosOS.columns[5].width := ParSistema.TamanhoMascaraQuantidade;
end;

procedure TfrmProdutosRequisicaoOS.dbgProdutosEquipamentosOSDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then 
    if dtmordemservico.TabelaProdutosOrdemServico.Locate('produto', dbgProdutosEquipamentosOS.DataSource.DataSet.FieldByName('produto').AsVariant,[]) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clBlue;
      TDBGrid(Sender).Canvas.Font.Color := clWhite;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end.
