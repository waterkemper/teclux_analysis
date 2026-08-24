unit fmManutencaoObservacoesVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, Menus,
  AdvMenus, tmsAdvGridExcel, AsgFindDialog, AdvGrid, frmctrllink,
  frconsulta, frconsultacodigo, Grids, AdvObj, BaseGrid, DBAdvGrid,
  StdCtrls, frmultiplaselecaoaleatoria, dmManutencaoObservacoesVenda, biblio,
  ctconstantes, AsgMemo, db, ZSqlItems;

type
  TfrmManutencaoObservacoesVenda = class(TFrmAjudaBt)
    sbnAlterar: TSpeedButton;
    sbnGerar: TSpeedButton;
    pgcManutencaoObservacoesVenda: TPageControl;
    tstParametros: TTabSheet;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    pnlTop: TPanel;
    gbxSelecaoObservacoesVenda: TGroupBox;
    ckbProdutosComObservacoesVenda: TCheckBox;
    ckbGruposComObservacoesVenda: TCheckBox;
    ckbClassesComObservacoesVenda: TCheckBox;
    ckbMarcasComObservacoesVenda: TCheckBox;
    tstDados: TTabSheet;
    pgcDadosSelecionados: TPageControl;
    tstProdutos: TTabSheet;
    dbgProdutosObservacoesVenda: TDBAdvGrid;
    pnlProdutosObservacoesVenda: TPanel;
    sbnIncluirProduto: TSpeedButton;
    tstGrupos: TTabSheet;
    dbgGruposObservacoesVenda: TDBAdvGrid;
    pnlGuposObservacoesVenda: TPanel;
    sbnIncluirGruposObservacoesVenda: TSpeedButton;
    tstClasses: TTabSheet;
    dbgClassesObservacoesVenda: TDBAdvGrid;
    pnlClassesObservacoesVenda: TPanel;
    sbnIncluirClassesObservacoesVenda: TSpeedButton;
    tstMarcas: TTabSheet;
    dbgMarcasObservacoesVenda: TDBAdvGrid;
    pnlMarcasObservacoesVenda: TPanel;
    sbnIncluirMarcasObservacoesVenda: TSpeedButton;
    Panel3: TPanel;
    fraConsultaMarca: TfraConsultaCodigo;
    fraConsultaClasse: TfraConsultaCodigo;
    fraConsultaProduto: TfraConsultaCodigo;
    fraConsultaGrupo: TfraConsultaCodigo;
    FormControlEditLinkGrupo: TFormControlEditLink;
    FormControlEditLinkProduto: TFormControlEditLink;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    FormControlEditLinkClasse: TFormControlEditLink;
    FormControlEditLinkMarca: TFormControlEditLink;
    pgcDadosSelecinados: TPageControl;
    tstDadosSelecionadosObsVendas: TTabSheet;
    tstDadosSelecionadosObsGerais: TTabSheet;
    dbgProdutosObservacoesGerais: TDBAdvGrid;
    Panel1: TPanel;
    sbnIncluirProdutosObservacoesGerais: TSpeedButton;
    fraConsultaProdutoObsGeral: TfraConsultaCodigo;
    FormControlEditLinkProdutoObsGeral: TFormControlEditLink;
    sbnExcluirProduto: TSpeedButton;
    sbnExcluirGrupo: TSpeedButton;
    sbnExcluirClasse: TSpeedButton;
    sbnExcluirMarca: TSpeedButton;
    sbnExcluirProdutosObservacoesGerais: TSpeedButton;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnAlterarClick(Sender: TObject);
    procedure dbgProdutosObservacoesVendaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgProdutosObservacoesVendaCheckRequiredFields(
      Sender: TObject; var Allow: Boolean);
    procedure dbgProdutosObservacoesVendaCellValidate(Sender: TObject;
      ACol, ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgProdutosObservacoesVendaCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure dbgProdutosObservacoesVendaCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgProdutosObservacoesVendaCanClickCell(Sender: TObject;
      ARow, ACol: Integer; var Allow: Boolean);
    procedure dbgProdutosObservacoesVendaCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgGruposObservacoesVendaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgGruposObservacoesVendaCheckRequiredFields(Sender: TObject;
      var Allow: Boolean);
    procedure dbgGruposObservacoesVendaCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgGruposObservacoesVendaCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure dbgGruposObservacoesVendaCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgGruposObservacoesVendaCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgGruposObservacoesVendaCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgClassesObservacoesVendaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgClassesObservacoesVendaCheckRequiredFields(
      Sender: TObject; var Allow: Boolean);
    procedure dbgClassesObservacoesVendaCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgClassesObservacoesVendaCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure dbgClassesObservacoesVendaCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgClassesObservacoesVendaCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgClassesObservacoesVendaCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgMarcasObservacoesVendaCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgMarcasObservacoesVendaCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgMarcasObservacoesVendaCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgMarcasObservacoesVendaCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure dbgMarcasObservacoesVendaCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgMarcasObservacoesVendaCheckRequiredFields(Sender: TObject;
      var Allow: Boolean);
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure dbgProdutosObservacoesGeraisCanAddRow(Sender: TObject; var CanAdd: Boolean);
    procedure dbgProdutosObservacoesGeraisCanClickCell(Sender: TObject;
      ARow, ACol: Integer; var Allow: Boolean);
    procedure dbgProdutosObservacoesGeraisCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgProdutosObservacoesGeraisCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure dbgProdutosObservacoesGeraisCellValidate(Sender: TObject;
      ACol, ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgProdutosObservacoesGeraisCheckRequiredFields(
      Sender: TObject; var Allow: Boolean);
    procedure dbgProdutosObservacoesGeraisKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormControlEditLinkProdutoGetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLinkProdutoSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure fraConsultaProdutoedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure fraConsultaClasseedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormControlEditLinkGrupoGetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLinkGrupoSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure fraConsultaGrupoedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormControlEditLinkClasseGetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLinkClasseSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLinkMarcaGetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLinkMarcaSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure fraConsultaMarcaedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormControlEditLinkProdutoObsGeralGetEditorValue(
      Sender: TObject; Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLinkProdutoObsGeralSetEditorFocus(
      Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
    procedure fraConsultaProdutoObsGeraledfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure sbnIncluirGruposObservacoesVendaClick(Sender: TObject);
    procedure sbnExcluirGrupoClick(Sender: TObject);
    procedure sbnIncluirClassesObservacoesVendaClick(Sender: TObject);
    procedure sbnIncluirMarcasObservacoesVendaClick(Sender: TObject);
    procedure sbnIncluirProdutosObservacoesGeraisClick(Sender: TObject);
    procedure sbnExcluirClasseClick(Sender: TObject);
    procedure sbnExcluirMarcaClick(Sender: TObject);
    procedure sbnExcluirProdutosObservacoesGeraisClick(Sender: TObject);
  private
    { Private declarations }
  protected

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure NotificarAlteracao(Sender: TObject);
    procedure NotificarScroll(Sender: TObject);
    procedure NotificarInsertGrupo(Sender: TObject);
    procedure NotificarInsertClasses(Sender: TObject);
    procedure NotificarInsertMarcas(Sender: TObject);

    procedure AtribuirDadosConsultaGrupoProdutos(Found: Boolean);

    procedure AtribuirDadosConsultaClasseProdutos(Found: Boolean);
    procedure AtribuirDadosConsultaMarcaProdutos(Found: Boolean);

    procedure AtribuirDadosConsultaProdutos(Found: Boolean);
    procedure AtribuirDadosConsultaProdutosObsGeral(Found: Boolean);


  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmManutencaoObservacoesVenda: TfrmManutencaoObservacoesVenda;

implementation

{$R *.dfm}

{ TfrmManutencaoObservacoesVenda }

procedure TfrmManutencaoObservacoesVenda.AtribuirDadosConsultaClasseProdutos(Found: Boolean);
begin
  dtmManutencaoObservacoesVenda.qryClassesdescricao.AsString :=
     fraConsultaClasse.qryProcuraClasses.fieldbyname('descricao').asstring;
end;

procedure TfrmManutencaoObservacoesVenda.AtribuirDadosConsultaGrupoProdutos(Found: Boolean);
begin
  dtmManutencaoObservacoesVenda.qryGruposdescricao.AsString :=
     fraConsultaGrupo.qryProcuraGrupoProdutos.fieldbyname('descricao').asstring;
end;

procedure TfrmManutencaoObservacoesVenda.AtribuirDadosConsultaProdutos(Found: Boolean);
begin

  dtmManutencaoObservacoesVenda.qryProdutoscodigo.AsString :=
     fraConsultaProduto.qryProcuraProdutos.fieldbyname('codigo').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosdescricao.AsString :=
     fraConsultaProduto.qryProcuraProdutos.fieldbyname('descricao').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosgrupo.AsString :=
     fraConsultaProduto.qryProcuraProdutos.fieldbyname('grupo').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosclasse.AsString :=
     fraConsultaProduto.qryProcuraProdutos.fieldbyname('classe').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosmarca.AsString :=
     fraConsultaProduto.qryProcuraProdutos.fieldbyname('marca').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosorigem.AsString := 'PRODUTOS';

end;

procedure TfrmManutencaoObservacoesVenda.AtribuirDadosConsultaMarcaProdutos(Found: Boolean);
begin
  dtmManutencaoObservacoesVenda.qryMarcasdescricao.AsString :=
     fraConsultaMarca.qryProcuraMarcadescricao.asstring;
end;

constructor TfrmManutencaoObservacoesVenda.Create(AOwner: TComponent);
begin
  dtmManutencaoObservacoesVenda := TdtmManutencaoObservacoesVenda.Create(Self);
  inherited;

  dtmManutencaoObservacoesVenda.NotificarAlteracao := NotificarAlteracao;
  dtmManutencaoObservacoesVenda.NotificarScroll := NotificarScroll;
  dtmManutencaoObservacoesVenda.NotificarInsertGrupo := NotificarInsertGrupo;
  dtmManutencaoObservacoesVenda.NotificarInsertClasses := NotificarInsertClasses;
  dtmManutencaoObservacoesVenda.NotificarInsertMarcas := NotificarInsertMarcas;


  SetarActivePage(self);
  sbnAlterar.enabled := false;

  fraConsultaGrupo.TipoPesquisa := pesGRUPOS;
  fraConsultaGrupo.OnFound := AtribuirDadosConsultaGrupoProdutos;

  fraConsultaProduto.TipoPesquisa := pesPRODUTOS;
  fraConsultaProduto.OnFound := AtribuirDadosConsultaProdutos;

  fraConsultaProdutoObsGeral.TipoPesquisa := pesPRODUTOS;
  fraConsultaProdutoObsGeral.OnFound := AtribuirDadosConsultaProdutos;

  fraConsultaClasse.TipoPesquisa := pesCLASSES;
  fraConsultaClasse.OnFound := AtribuirDadosConsultaClasseProdutos;

  fraConsultaMarca.TipoPesquisa := pesMARCAS;
  fraConsultaMarca.OnFound := AtribuirDadosConsultaMarcaProdutos;
end;

destructor TfrmManutencaoObservacoesVenda.Destroy;
begin
  FreeAndNIl(AdvGridFindDialog1);
  inherited;
end;

procedure TfrmManutencaoObservacoesVenda.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_f5 : if sbnAlterar.enabled then sbnAlterarClick(self);
    vk_F6 : if sbnGerar.enabled then sbnGerarClick(self)
  end;
end;

procedure TfrmManutencaoObservacoesVenda.NotificarAlteracao(
  Sender: TObject);
begin
  sbnAlterar.enabled := true;
end;

procedure TfrmManutencaoObservacoesVenda.NotificarInsertClasses(
  Sender: TObject);
begin
  dbgClassesObservacoesVenda.col := 1;
end;

procedure TfrmManutencaoObservacoesVenda.NotificarInsertGrupo(
  Sender: TObject);
begin
  dbgGruposObservacoesVenda.col := 1;
end;

procedure TfrmManutencaoObservacoesVenda.NotificarInsertMarcas(
  Sender: TObject);
begin
  dbgMarcasObservacoesVenda.col := 1;
end;

procedure TfrmManutencaoObservacoesVenda.NotificarScroll(Sender: TObject);
begin
{
  sbnExcluirProduto.Enabled := not dtmManutencaoObservacoesVenda.qryProdutosObservacoesVendadias.IsNull or
                               not dtmManutencaoObservacoesVenda.qryProdutosObservacoesVendaobservacoes.IsNull;

  sbnExcluirGruposObservacoesVenda.Enabled := not dtmManutencaoObservacoesVenda.qryGruposObservacoesVendadias.IsNull or
                               not dtmManutencaoObservacoesVenda.qryGruposObservacoesVendaobservacoes.IsNull;
}                               

end;

procedure TfrmManutencaoObservacoesVenda.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if
  dtmManutencaoObservacoesVenda.AbrirConsulta(
     ckbProdutosComObservacoesVenda.Checked,
     ckbGruposComObservacoesVenda.checked,
     ckbClassesComObservacoesVenda.checked,
     ckbMarcasComObservacoesVenda.checked,
     fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriapromocoes.ListaCondicional) then
  begin

    sbnAlterar.enabled := false;

    pgcManutencaoObservacoesVenda.activepage := tstDados;
    if dtmManutencaoObservacoesVenda.qryProdutos.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstProdutos
    else
    if dtmManutencaoObservacoesVenda.qryGrupos.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstGrupos
    else
    if dtmManutencaoObservacoesVenda.qryClasses.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstClasses
    else
    if dtmManutencaoObservacoesVenda.qryMarcas.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstMarcas;
  end;

end;

procedure TfrmManutencaoObservacoesVenda.sbnAlterarClick(Sender: TObject);
begin
  inherited;
  if dtmManutencaoObservacoesVenda.SalvarManutencao then
    sbnGerarClick(nil);

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgProdutosObservacoesVenda.datasource.dataset.state = dsinsert then
    begin
      dbgProdutosObservacoesVenda.Col := 1;
      keybd_event(VK_F2,0,0,0);

    end

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoObservacoesVenda.qryProdutos.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
//  Valid :=  (Value <> '')
end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoObservacoesVenda.qryProdutos.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoObservacoesVenda.qryProdutos.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoObservacoesVenda.qryProdutos.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end
  else
  begin

    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoObservacoesVenda.qryProdutos.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoObservacoesVenda.qryProdutos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end;

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoObservacoesVenda.qryProdutos.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  if (Arow <> dbgProdutosObservacoesVenda.row) or
     (ACol <> dbgProdutosObservacoesVenda.col) then
    Allow := not (dbgProdutosObservacoesVenda.datasource.DataSet.state in [dsedit, dsinsert]);

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesVendaCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoObservacoesVenda.qryProdutos.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgGruposObservacoesVenda.datasource.dataset.state = dsinsert then
    begin
      dbgGruposObservacoesVenda.Col := 1;
      keybd_event(VK_F2,0,0,0);
    end
end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoObservacoesVenda.qryGrupos.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
//  Valid :=  (Value <> '')
end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoObservacoesVenda.qryGrupos.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoObservacoesVenda.qryGrupos.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoObservacoesVenda.qryGrupos.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoObservacoesVenda.qryGrupos.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoObservacoesVenda.qryGrupos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;

end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoObservacoesVenda.qryGrupos.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  if (Arow <> dbgGruposObservacoesVenda.row) or
     (ACol <> dbgGruposObservacoesVenda.col) then
  Allow := not (dbgGruposObservacoesVenda.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoObservacoesVenda.dbgGruposObservacoesVendaCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoObservacoesVenda.qryGrupos.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgClassesObservacoesVenda.datasource.dataset.state = dsinsert then
    begin
      dbgClassesObservacoesVenda.Col := 1;
      keybd_event(VK_F2,0,0,0);
    end

end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoObservacoesVenda.qryClasses.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
//  Valid :=  (Value <> '')
end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoObservacoesVenda.qryClasses.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoObservacoesVenda.qryClasses.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoObservacoesVenda.qryClasses.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoObservacoesVenda.qryClasses.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoObservacoesVenda.qryClasses.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;

end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoObservacoesVenda.qryClasses.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  if (Arow <> dbgClassesObservacoesVenda.row) or
     (ACol <> dbgClassesObservacoesVenda.col) then
  Allow := not (dbgClassesObservacoesVenda.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoObservacoesVenda.dbgClassesObservacoesVendaCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoObservacoesVenda.qryClasses.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoObservacoesVenda.dbgMarcasObservacoesVendaCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoObservacoesVenda.qryMarcas.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgMarcasObservacoesVendaCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  if (Arow <> dbgMarcasObservacoesVenda.row) or
     (ACol <> dbgMarcasObservacoesVenda.col) then
  Allow := not (dbgMarcasObservacoesVenda.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoObservacoesVenda.dbgMarcasObservacoesVendaCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoObservacoesVenda.qryMarcas.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoObservacoesVenda.dbgMarcasObservacoesVendaCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoObservacoesVenda.qryMarcas.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoObservacoesVenda.qryMarcas.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoObservacoesVenda.qryMarcas.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoObservacoesVenda.qryMarcas.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoObservacoesVenda.qryMarcas.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;

end;

procedure TfrmManutencaoObservacoesVenda.dbgMarcasObservacoesVendaCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
//  Valid :=  (Value <> '');
end;

procedure TfrmManutencaoObservacoesVenda.dbgMarcasObservacoesVendaCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoObservacoesVenda.qryMarcas.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  if pgcDadosSelecinados.activepage = tstDadosSelecionadosObsVendas then
  begin
    if pgcDadosSelecionados.ActivePage = tstProdutos then
      AdvGridFindDialog1.Grid := dbgProdutosObservacoesVenda
    else
    if pgcDadosSelecionados.ActivePage = tstGrupos then
      AdvGridFindDialog1.Grid := dbgGruposObservacoesVenda
    else
    if pgcDadosSelecionados.ActivePage = tstClasses then
      AdvGridFindDialog1.Grid := dbgClassesObservacoesVenda
    else
    if pgcDadosSelecionados.ActivePage = tstMarcas then
      AdvGridFindDialog1.Grid := dbgMarcasObservacoesVenda;
  end
  else
  if pgcDadosSelecinados.activepage = tstDadosSelecionadosObsGerais then
    AdvGridFindDialog1.Grid := dbgProdutosObservacoesGerais;

  AdvGridFindDialog1.Execute;

end;

procedure TfrmManutencaoObservacoesVenda.ExportarExcel1Click(
  Sender: TObject);
var
  vNomeArquivo : String;
  
begin
  inherited;
  if pgcDadosSelecinados.activepage = tstDadosSelecionadosObsVendas then
  begin

    if pgcDadosSelecionados.ActivePage = tstProdutos then
    begin
      AdvGridExcelIO1.AdvStringGrid := dbgProdutosObservacoesVenda;
      vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ProdutosObservacoesVenda.xls';
      AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ProdutosObservacoesVenda');
    end
    else
    if pgcDadosSelecionados.ActivePage = tstGrupos  then
    begin
      AdvGridExcelIO1.AdvStringGrid := dbgGruposObservacoesVenda;
      vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\GruposObservacoesVenda.xls';
      AdvGridExcelIO1.XLSExport(vNomeArquivo, 'GruposObservacoesVenda');
    end
    else
    if pgcDadosSelecionados.ActivePage = tstClasses then
    begin
      AdvGridExcelIO1.AdvStringGrid := dbgClassesObservacoesVenda;
      vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ClassesObservacoesVenda.xls';
      AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ClassesObservacoesVenda');
    end
    else
    if pgcDadosSelecionados.ActivePage = tstMarcas then
    begin
      AdvGridExcelIO1.AdvStringGrid := dbgMarcasObservacoesVenda;
      vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\MarcasObservacoesVenda.xls';
      AdvGridExcelIO1.XLSExport(vNomeArquivo, 'MarcasObservacoesVenda');
    end;
  end
  else
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgProdutosObservacoesGerais;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\MarcasObservacoesGerais.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'MarcasObservacoesGerais');
  end;
end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  if (Arow <> dbgProdutosObservacoesGerais.row) or
     (ACol <> dbgProdutosObservacoesGerais.col) then
    Allow := not (dbgProdutosObservacoesGerais.datasource.DataSet.state in [dsedit, dsinsert]);

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.CheckRequiredFields(false, false);

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end
  else
  begin

    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end;

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
//  Valid :=  (Value <> '')

end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoObservacoesVenda.qryProdutosObservacoesGerais.CheckRequiredFields;
end;

procedure TfrmManutencaoObservacoesVenda.dbgProdutosObservacoesGeraisKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgProdutosObservacoesGerais.datasource.dataset.state = dsinsert then
    begin
      dbgProdutosObservacoesGerais.Col := 1;
      keybd_event(VK_F2,0,0,0);
    end
end;

procedure TfrmManutencaoObservacoesVenda.AtribuirDadosConsultaProdutosObsGeral(Found: Boolean);
begin
  dtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisdescricao.AsString :=
     fraConsultaProdutoObsGeral.qryProcuraProdutos.fieldbyname('descricaolc').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisgrupo.AsString :=
     fraConsultaProdutoObsGeral.qryProcuraProdutos.fieldbyname('grupo').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraisclasse.AsString :=
     fraConsultaProdutoObsGeral.qryProcuraProdutos.fieldbyname('classe').asstring;

  dtmManutencaoObservacoesVenda.qryProdutosObservacoesGeraismarca.AsString :=
     fraConsultaProdutoObsGeral.qryProcuraProdutos.fieldbyname('marca').asstring;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkProdutoGetEditorValue(
  Sender: TObject; Grid: TAdvStringGrid; var AValue: String);
begin
  inherited;
  AValue := fraConsultaProduto.edfcodigo.text;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkProdutoSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaProduto.edfcodigo.setfocus;
end;

procedure TfrmManutencaoObservacoesVenda.fraConsultaProdutoedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaProduto.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
  begin
//    dbgProdutosObservacoesVenda.datasource.dataset.cancel;
    dtmManutencaoObservacoesVenda.qryprodutos.cancel;
    dbgProdutosObservacoesVenda.setfocus;
    keybd_event(VK_ESCAPE,0,0,0);
  end
  else
  if key = vk_return then
  begin
    dbgProdutosObservacoesVenda.setfocus;
  end;
end;

procedure TfrmManutencaoObservacoesVenda.fraConsultaClasseedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaClasse.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
  begin
    dbgClassesObservacoesVenda.datasource.dataset.cancel;
    dbgClassesObservacoesVenda.setfocus;
    keybd_event(VK_ESCAPE,0,0,0);
  end
  else
  if key = vk_return then
    dbgClassesObservacoesVenda.setfocus;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkGrupoGetEditorValue(
  Sender: TObject; Grid: TAdvStringGrid; var AValue: String);
begin
  inherited;
  AValue := fraConsultaGrupo.edfcodigo.text;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkGrupoSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaGrupo.edfcodigo.setfocus;
end;

procedure TfrmManutencaoObservacoesVenda.fraConsultaGrupoedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaGrupo.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
  begin
    dbgGruposObservacoesVenda.datasource.dataset.cancel;
    dbgGruposObservacoesVenda.setfocus;
    keybd_event(VK_ESCAPE,0,0,0);
  end
  else
  if key = vk_return then
    dbgGruposObservacoesVenda.setfocus;

end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkClasseGetEditorValue(
  Sender: TObject; Grid: TAdvStringGrid; var AValue: String);
begin
  inherited;
  AValue := fraConsultaClasse.edfcodigo.text;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkClasseSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaClasse.edfcodigo.setfocus;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkMarcaGetEditorValue(
  Sender: TObject; Grid: TAdvStringGrid; var AValue: String);
begin
  inherited;
  AValue := fraConsultaMarca.edfcodigo.text;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkMarcaSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaMarca.edfcodigo.setfocus;
end;

procedure TfrmManutencaoObservacoesVenda.fraConsultaMarcaedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaClasse.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
  begin
    dbgMarcasObservacoesVenda.datasource.dataset.cancel;
    dbgMarcasObservacoesVenda.setfocus;
    keybd_event(VK_ESCAPE,0,0,0);
  end
  else
  if key = vk_return then
    dbgMarcasObservacoesVenda.setfocus;

end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkProdutoObsGeralGetEditorValue(
  Sender: TObject; Grid: TAdvStringGrid; var AValue: String);
begin
  inherited;
  AValue := fraConsultaProdutoObsGeral.edfcodigo.text;
end;

procedure TfrmManutencaoObservacoesVenda.FormControlEditLinkProdutoObsGeralSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaProdutoObsGeral.edfcodigo.setfocus;
end;

procedure TfrmManutencaoObservacoesVenda.fraConsultaProdutoObsGeraledfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaProdutoObsGeral.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
  begin
    dbgProdutosObservacoesGerais.datasource.dataset.cancel;
    dbgProdutosObservacoesGerais.setfocus;
    keybd_event(VK_ESCAPE,0,0,0);
  end
  else
  if key = vk_return then
    dbgProdutosObservacoesGerais.setfocus;

end;

procedure TfrmManutencaoObservacoesVenda.sbnIncluirProdutoClick(
  Sender: TObject);
begin
  inherited;

  dbgProdutosObservacoesVenda.Datasource.DataSet.last;

  dbgProdutosObservacoesVenda.setfocus;
  dbgProdutosObservacoesVenda.COL := 7;
  keybd_event(VK_DOWN,0,0,0);
  dbgProdutosObservacoesVenda.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);

end;

procedure TfrmManutencaoObservacoesVenda.sbnExcluirProdutoClick(
  Sender: TObject);
begin
  inherited;
  dbgProdutosObservacoesVenda.setfocus;
  dbgProdutosObservacoesVenda.COL := 7;

  dtmManutencaoObservacoesVenda.qryProdutos.Edit;
  dtmManutencaoObservacoesVenda.qryProdutosobservacoesvenda.clear;
  dtmManutencaoObservacoesVenda.qryProdutos.post;

end;

procedure TfrmManutencaoObservacoesVenda.sbnIncluirGruposObservacoesVendaClick(
  Sender: TObject);
begin
  inherited;
//  dtmManutencaoObservacoesVenda.qryGrupos.AfterScroll := nil;
  dbgGruposObservacoesVenda.Datasource.DataSet.last;
  dbgGruposObservacoesVenda.setfocus;
  dbgGruposObservacoesVenda.COL := 3;
  keybd_event(VK_DOWN,0,0,0);
  dbgGruposObservacoesVenda.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);

  {
  dtmManutencaoObservacoesVenda.qryGrupos.append;
  dbgGruposObservacoesVenda.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);
  dtmManutencaoObservacoesVenda.qryGrupos.AfterScroll :=
    dtmManutencaoObservacoesVenda.qryGruposAfterScroll;
    }





end;

procedure TfrmManutencaoObservacoesVenda.sbnExcluirGrupoClick(
  Sender: TObject);
begin
  inherited;
  dbgGruposObservacoesVenda.setfocus;
  dbgGruposObservacoesVenda.COL := 3;
  dbgGruposObservacoesVenda.datasource.dataset.edit;
  dbgGruposObservacoesVenda.datasource.dataset.fieldbyname('observacoesvenda').clear;
  dbgGruposObservacoesVenda.datasource.dataset.post;

end;

procedure TfrmManutencaoObservacoesVenda.sbnIncluirClassesObservacoesVendaClick(
  Sender: TObject);
begin
  inherited;
  dbgClassesObservacoesVenda.Datasource.DataSet.last;
  dbgClassesObservacoesVenda.setfocus;
  dbgClassesObservacoesVenda.COL := 3;
  keybd_event(VK_DOWN,0,0,0);
  dbgClassesObservacoesVenda.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);

end;

procedure TfrmManutencaoObservacoesVenda.sbnIncluirMarcasObservacoesVendaClick(
  Sender: TObject);
begin
  inherited;
  dbgMarcasObservacoesVenda.Datasource.DataSet.last;
  dbgMarcasObservacoesVenda.setfocus;
  dbgMarcasObservacoesVenda.COL := 3;
  keybd_event(VK_DOWN,0,0,0);
  dbgMarcasObservacoesVenda.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);

end;

procedure TfrmManutencaoObservacoesVenda.sbnIncluirProdutosObservacoesGeraisClick(
  Sender: TObject);
begin
  inherited;
  dbgProdutosObservacoesGerais.Datasource.DataSet.last;
  dbgProdutosObservacoesGerais.setfocus;
  dbgProdutosObservacoesGerais.COL := 6;
  keybd_event(VK_DOWN,0,0,0);
  dbgProdutosObservacoesGerais.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);
end;

procedure TfrmManutencaoObservacoesVenda.sbnExcluirClasseClick(
  Sender: TObject);
begin
  inherited;
  dbgClassesObservacoesVenda.setfocus;
  dbgClassesObservacoesVenda.COL := 3;
  dbgClassesObservacoesVenda.datasource.dataset.edit;
  dbgClassesObservacoesVenda.datasource.dataset.fieldbyname('observacoesvenda').clear;
  dbgClassesObservacoesVenda.datasource.dataset.post;

end;

procedure TfrmManutencaoObservacoesVenda.sbnExcluirMarcaClick(
  Sender: TObject);
begin
  inherited;
  dbgMarcasObservacoesVenda.setfocus;
  dbgMarcasObservacoesVenda.COL := 3;
  dbgMarcasObservacoesVenda.datasource.dataset.edit;
  dbgMarcasObservacoesVenda.datasource.dataset.fieldbyname('observacoesvenda').clear;
  dbgMarcasObservacoesVenda.datasource.dataset.post;

end;

procedure TfrmManutencaoObservacoesVenda.sbnExcluirProdutosObservacoesGeraisClick(
  Sender: TObject);
begin
  inherited;
  dbgProdutosObservacoesGerais.setfocus;
  dbgProdutosObservacoesGerais.COL := 6;
  dbgProdutosObservacoesGerais.datasource.dataset.edit;
  dbgProdutosObservacoesGerais.datasource.dataset.fieldbyname('observacao').clear;
  dbgProdutosObservacoesGerais.datasource.dataset.post;
end;

end.
