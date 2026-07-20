unit fmVendasCasadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmultiplaselecaoaleatoria, frintervalodatas, fmajudabt,
  ComCtrls, Buttons, ToolWin, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, dmVendasCasadas, ZSqlItems, StdCtrls, Mask, AdvSpin, biblio,
  Menus, AdvMenus, tmsAdvGridExcel, AsgFindDialog, ctconstantes;

type
  TfrmVendasCasadas = class(TfrmAjudaBt)
    fraIntervaloDatas1: TfraIntervaloDatas;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    pgcVendasCasadas: TPageControl;
    tstParametros: TTabSheet;
    tstDadosSelecionados: TTabSheet;
    dbgProdutos: TDBAdvGrid;
    Panel1: TPanel;
    sbnGravar: TSpeedButton;
    sbnGerar: TSpeedButton;
    spnQtCasados: TAdvSpinEdit;
    Timer1: TTimer;
    pgcDadosSelecionados: TPageControl;
    tstDadosSelecionadosProdutos: TTabSheet;
    tstDadosSelecionadosGrupos: TTabSheet;
    dbgGrupos: TDBAdvGrid;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgProdutosCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure pgcVendasCasadasChange(Sender: TObject);
    procedure dbgProdutosCheckBoxChange(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure sbnGravarClick(Sender: TObject);
    procedure dbgGruposCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure dbgGruposCheckBoxChange(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGruposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure AjustarDetalhesdbgProdutosAgendamentos; 
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
  end;

var
  frmVendasCasadas: TfrmVendasCasadas;

implementation

{$R *.dfm}

{ TfrmVendasCasadas }

constructor TfrmVendasCasadas.Create(AOwner: TComponent);
begin
  dtmVendasCasadas := TdtmVendasCasadas.Create(Self);
  inherited;
  SetarActivePage(self);

  AjustarDetalhesdbgProdutosAgendamentos;

  sbnGravar.enabled := false;
  
end;

destructor TfrmVendasCasadas.Destroy;
begin
  FreeAndNIl(AdvGridFindDialog1);

  inherited;
end;

procedure TfrmVendasCasadas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    vk_f5 : if sbnGravar.enabled then sbnGravarClick(self);
    vk_F6 : if not sbnGerar.enabled then sbnGerarClick(self)
  end;
end;

procedure TfrmVendasCasadas.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if fraIntervaloDatas1.ValidarIntervalo then
  begin
    if dtmVendasCasadas.AbrirConsulta(
       fraIntervaloDatas1.edtDataInicial.text,
       fraIntervaloDatas1.edtDataFinal.text,
       fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional,
       fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional,
       fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional,
       fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional,
       fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional,
       fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriapromocoes.ListaCondicional,
       spnQtCasados.value
       ) then
    begin
      sbngravar.enabled := false;
      pgcVendasCasadas.ActivePage := tstDadosSelecionados;
      AjustarDetalhesdbgProdutosAgendamentos;


    end;

  end;
end;

procedure TfrmVendasCasadas.dbgProdutosCanSort(Sender: TObject;
  ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmVendasCasadas.qryProdutosVendasCasadas.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmVendasCasadas.qryProdutosVendasCasadas.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmVendasCasadas.qryProdutosVendasCasadas.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end
  else
  begin

    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmVendasCasadas.qryProdutosVendasCasadas.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmVendasCasadas.qryProdutosVendasCasadas.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end;

end;

procedure TfrmVendasCasadas.pgcVendasCasadasChange(Sender: TObject);
begin
  inherited;

  if pgcVendasCasadas.ActivePage = tstDadosSelecionados then
     AjustarDetalhesdbgProdutosAgendamentos;

end;

procedure TfrmVendasCasadas.AjustarDetalhesdbgProdutosAgendamentos;
var
i : integer;
begin
//  for i:= 1 to 3 do
//  begin


//    dbgProdutosAgendamentos.MergeCells(0,0,1,2);
//    dbgProdutosAgendamentos.Cells[0,0] := '_';

    dbgProdutos.MergeCells(1,0,8,1);
    dbgProdutos.Cells[1,0] := 'PRIMEIRO PRODUTO';

    dbgProdutos.MergeCells(9,0,16,1);
    dbgProdutos.Cells[9,0] := 'SEGUNDO PRODUTO';

    dbgProdutos.MergeCells(17,0,17,1);
//    dbgProdutos.Cells[17,0] := '_';

    dbgProdutos.MergeCells(18,0,18,1);
//    dbgProdutos.Cells[18,0] := '_';


// end;


//    dbgGrupos.MergeCells(1,0,1,2);
//    dbgGrupos.Cells[1,0] := 'GRUPO';

    dbgGrupos.MergeCells(1,0,4,1);
    dbgGrupos.Cells[1,0] := 'PRIMEIRO GRUPO';

//    dbgGrupos.MergeCells(5,0,1,2);
//    dbgGrupos.Cells[5,0] := 'GRUPO';

    dbgGrupos.MergeCells(5,0,8,1);
    dbgGrupos.Cells[5,0] := 'SEGUNDO GRUPO';

    dbgGrupos.MergeCells(9,0,10,1);

//    dbgGrupos.MergeCells(10,0,10,1);
     dbgGrupos.Cells[9,0] := '_';

    {
 }
    {

    dbgGruposAgendamentos.MergeCells(0,0,1,2);
    dbgGruposAgendamentos.Cells[0,0] := '_';

    dbgGruposAgendamentos.MergeCells(1,0,4,1);
    dbgGruposAgendamentos.Cells[1,0] := 'PRIMEIRO GRUPO';

    dbgGruposAgendamentos.Alignments[5,0]:=taLeftJustify;
    dbgGruposAgendamentos.MergeCells(5,0,8,1);
    dbgGruposAgendamentos.Cells[5,0] := 'SEGUNDO GRUPO';

    dbgGruposAgendamentos.Alignments[9,0]:=taLeftJustify;
    dbgGruposAgendamentos.MergeCells(9,0,10,1);
    dbgGruposAgendamentos.Cells[9,0] := '_';
    }

//    dbgGruposAgendamentos.Alignments[9,0]:=taLeftJustify;

//    dbgGruposAgendamentos.MergeCells(9,0,9,1);
//    dbgGruposAgendamentos.Cells[9,0] := 'Ocorrências';






end;

procedure TfrmVendasCasadas.dbgProdutosCheckBoxChange(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;

  sbnGravar.enabled := (dbgProdutos.ModifiedRowCount <> 0)  and
                       (pgcVendasCasadas.activePage = tstDadosSelecionados) and
                       (pgcDadosSelecionados.activePage = tstDadosSelecionadosProdutos);

end;

procedure TfrmVendasCasadas.Timer1Timer(Sender: TObject);
begin
  inherited;
  if pgcDadosSelecionados.activepage = tstDadosSelecionadosProdutos then

    sbnGravar.enabled := (dbgProdutos.ModifiedRowCount <> 0)  and
                         (pgcVendasCasadas.activePage = tstDadosSelecionados) and
                         (pgcDadosSelecionados.activePage = tstDadosSelecionadosProdutos)

  else

    sbnGravar.enabled := (dbgGrupos.ModifiedRowCount <> 0)  and
                         (pgcVendasCasadas.activePage = tstDadosSelecionados) and
                         (pgcDadosSelecionados.activePage = tstDadosSelecionadosGrupos);

end;

procedure TfrmVendasCasadas.sbnGravarClick(Sender: TObject);
begin
  inherited;

  if pgcDadosSelecionados.activepage = tstDadosSelecionadosProdutos then
  begin
    dtmVendasCasadas.GravarProdutosVendasCasadas;
    sbnGravar.enabled := false;
    dbgProdutos.ClearModifiedRows;
  end
  else
  begin
    dtmVendasCasadas.GravarGruposVendasCasadas;
    sbnGravar.enabled := false;
    dbgGrupos.ClearModifiedRows;
  end;

end;

procedure TfrmVendasCasadas.dbgGruposCanSort(Sender: TObject;
  ACol: Integer; var DoSort: Boolean);
begin
  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmVendasCasadas.qryGruposCasados.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmVendasCasadas.qryGruposCasados.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmVendasCasadas.qryGruposCasados.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end
  else
  begin

    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmVendasCasadas.qryGruposCasados.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmVendasCasadas.qryGruposCasados.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end;
end;

procedure TfrmVendasCasadas.dbgGruposCheckBoxChange(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;

  sbnGravar.enabled := (dbgGrupos.ModifiedRowCount <> 0)  and
                       (pgcVendasCasadas.activePage = tstDadosSelecionados) and
                       (pgcDadosSelecionados.activePage = tstDadosSelecionadosGrupos);

end;

procedure TfrmVendasCasadas.Pesquizar1Click(Sender: TObject);
begin
  inherited;


  if pgcDadosSelecionados.ActivePage = tstDadosSelecionadosProdutos then
    AdvGridFindDialog1.Grid := dbgProdutos
  else
  if pgcDadosSelecionados.ActivePage = tstDadosSelecionadosGrupos then
    AdvGridFindDialog1.Grid := dbgGrupos;

  AdvGridFindDialog1.Execute;

end;

procedure TfrmVendasCasadas.ExportarExcel1Click(Sender: TObject);
var
  vNomeArquivo : String;

begin
  inherited;
  if pgcDadosSelecionados.ActivePage = tstDadosSelecionadosProdutos then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgProdutos;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ProdutosCasados.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ProdutosCasados');
  end
  else
  if pgcDadosSelecionados.ActivePage = tstDadosSelecionadosGrupos then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgGrupos;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\GruposCasados.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'GruposCasados');
  end;
end;

procedure TfrmVendasCasadas.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_x) and (ssCtrl in Shift) then
    ExportarExcel1Click(nil);

end;

procedure TfrmVendasCasadas.dbgGruposKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_x) and (ssCtrl in Shift) then
    ExportarExcel1Click(nil);

end;

end.
