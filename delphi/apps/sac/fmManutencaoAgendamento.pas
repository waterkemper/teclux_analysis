unit fmManutencaoAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, fmajudabt, Buttons, ToolWin, ExtCtrls,
  frmultiplaselecaoaleatoria, dmManutencaoAgendamento, Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, biblio, frconsulta,
  frconsultacodigo, ctconstantes, frmctrllink, db, ZSqlItems, Menus,
  AdvMenus, tmsAdvGridExcel, AsgFindDialog;

type
  TfrmManutencaoAgendamento = class(TfrmAjudaBt)
    pgcManutencaoAgendamento: TPageControl;
    tstParametros: TTabSheet;
    tstDados: TTabSheet;
    pgcDadosSelecionados: TPageControl;
    tstProdutos: TTabSheet;
    tstGrupos: TTabSheet;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    sbnGerar: TSpeedButton;
    sbnAlterar: TSpeedButton;
    dbgProdutosAgendamentos: TDBAdvGrid;
    pnlProdutosAgendamentos: TPanel;
    sbnIncluirProduto: TSpeedButton;
    sbnExcluirProduto: TSpeedButton;
    pnlTop: TPanel;
    ckbProdutosComAgendamento: TCheckBox;
    ckbGruposComAgendamento: TCheckBox;
    dbgGruposAgendamentos: TDBAdvGrid;
    pnlGuposAgendamentos: TPanel;
    sbnIncluirGruposAgendamentos: TSpeedButton;
    sbnExcluirGruposAgendamentos: TSpeedButton;
    fraConsultaItemProduto: TfraConsultaCodigo;
    fraConsultaGrupo: TfraConsultaCodigo;
    FormControlEditLinkGrupo: TFormControlEditLink;
    FormControlEditLinkProduto: TFormControlEditLink;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    Panel1: TPanel;
    ckbClassesComAgendamento: TCheckBox;
    ckbMarcasComAgendamento: TCheckBox;
    gbxSelecaoAgendamento: TGroupBox;
    tstClasses: TTabSheet;
    dbgClassesAgendamentos: TDBAdvGrid;
    pnlClassesAgendamentos: TPanel;
    sbnIncluirClassesAgendamentos: TSpeedButton;
    sbnExcluirClassesAgendamentos: TSpeedButton;
    tstMarcas: TTabSheet;
    dbgMarcasAgendamentos: TDBAdvGrid;
    pnlMarcasAgendamentos: TPanel;
    sbnIncluirMarcasAgendamentos: TSpeedButton;
    sbnExcluirMarcasAgendamentos: TSpeedButton;
    fraConsultaClasse: TfraConsultaCodigo;
    FormControlEditLinkClasse: TFormControlEditLink;
    fraConsultaMarca: TfraConsultaCodigo;
    FormControlEditLinkMarca: TFormControlEditLink;
    Copia1: TMenuItem;
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgProdutosAgendamentosCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure sbnExcluirGruposAgendamentosClick(Sender: TObject);
    procedure sbnIncluirGruposAgendamentosClick(Sender: TObject);
    procedure dbgGruposAgendamentosGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure dbgGruposAgendamentosCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure FormControlEditLinkGrupoSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure fraConsultaItemProdutoedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure fraConsultaGrupoedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgGruposAgendamentosCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgGruposAgendamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGruposAgendamentosCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgGruposAgendamentosCheckRequiredFields(Sender: TObject;
      var Allow: Boolean);
    procedure dbgGruposAgendamentosCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure dbgGruposAgendamentosCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgGruposAgendamentosKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbgProdutosAgendamentosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgProdutosAgendamentosKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormControlEditLinkProdutoSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure dbgProdutosAgendamentosCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgProdutosAgendamentosCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgProdutosAgendamentosCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgProdutosAgendamentosCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgProdutosAgendamentosCheckRequiredFields(Sender: TObject;
      var Allow: Boolean);
    procedure dbgGruposAgendamentosCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sbnAlterarClick(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure Pesquizar1Click(Sender: TObject);
    procedure dbgClassesAgendamentosCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgClassesAgendamentosCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgClassesAgendamentosCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgClassesAgendamentosCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure dbgClassesAgendamentosCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgClassesAgendamentosCheckRequiredFields(Sender: TObject;
      var Allow: Boolean);
    procedure dbgClassesAgendamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnIncluirClassesAgendamentosClick(Sender: TObject);
    procedure sbnExcluirClassesAgendamentosClick(Sender: TObject);
    procedure sbnIncluirMarcasAgendamentosClick(Sender: TObject);
    procedure sbnExcluirMarcasAgendamentosClick(Sender: TObject);
    procedure dbgMarcasAgendamentosCanAddRow(Sender: TObject;
      var CanAdd: Boolean);
    procedure dbgMarcasAgendamentosCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure dbgMarcasAgendamentosCanInsertRow(Sender: TObject;
      ARow: Integer; var CanInsert: Boolean);
    procedure dbgMarcasAgendamentosCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure dbgMarcasAgendamentosCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure dbgMarcasAgendamentosCheckRequiredFields(Sender: TObject;
      var Allow: Boolean);
    procedure dbgMarcasAgendamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormControlEditLinkClasseSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure fraConsultaClasseedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure fraConsultaMarcaedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormControlEditLinkMarcaSetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure Copia1Click(Sender: TObject);
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

    procedure AtribuirDadosConsultaItemProdutos(Found: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;



  end;

var
  frmManutencaoAgendamento: TfrmManutencaoAgendamento;

implementation

uses cpquery;

{$R *.dfm}

{ TfrmManutencaoAgendamento }

constructor TfrmManutencaoAgendamento.Create(AOwner: TComponent);
begin
  dtmManutencaoAgendamento := TdtmManutencaoAgendamento.Create(Self);
  inherited;

  dtmManutencaoAgendamento.NotificarAlteracao := NotificarAlteracao;
  dtmManutencaoAgendamento.NotificarScroll := NotificarScroll;
  dtmManutencaoAgendamento.NotificarInsertGrupo := NotificarInsertGrupo;
  dtmManutencaoAgendamento.NotificarInsertClasses := NotificarInsertClasses;
  dtmManutencaoAgendamento.NotificarInsertMarcas := NotificarInsertMarcas;


  SetarActivePage(self);
  sbnAlterar.enabled := false;

  fraConsultaGrupo.TipoPesquisa := pesGRUPOS;
  fraConsultaGrupo.OnFound := AtribuirDadosConsultaGrupoProdutos;

  fraConsultaItemProduto.TipoPesquisa := pesITEMPRODUTOS;
  fraConsultaItemProduto.OnFound := AtribuirDadosConsultaItemProdutos;

  fraConsultaClasse.TipoPesquisa := pesCLASSES;
  fraConsultaClasse.OnFound := AtribuirDadosConsultaClasseProdutos;

  fraConsultaMarca.TipoPesquisa := pesMARCAS;
  fraConsultaMarca.OnFound := AtribuirDadosConsultaMarcaProdutos;

  pnlBarra.visible := false;



end;

destructor TfrmManutencaoAgendamento.Destroy;
begin
  FreeAndNIl(AdvGridFindDialog1);

  inherited;
end;

procedure TfrmManutencaoAgendamento.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_f5 : if sbnAlterar.enabled then sbnAlterarClick(self);
    vk_F6 : if sbnGerar.enabled then sbnGerarClick(self)
  end;

end;

procedure TfrmManutencaoAgendamento.NotificarAlteracao(Sender: TObject);
begin
  sbnAlterar.enabled := true;
end;

procedure TfrmManutencaoAgendamento.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if
  dtmManutencaoAgendamento.AbrirConsultaAgendamento(
     ckbProdutosComAgendamento.Checked,
     ckbGruposComAgendamento.checked,
     ckbClassesComAgendamento.checked,
     ckbMarcasComAgendamento.checked,
     fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional,
     fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriapromocoes.ListaCondicional) then
  begin

    sbnAlterar.enabled := false;

    pgcManutencaoAgendamento.activepage := tstDados;
    if dtmManutencaoAgendamento.qryProdutosAgendamentos.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstProdutos
    else
    if dtmManutencaoAgendamento.qryGruposAgendamentos.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstGrupos
    else
    if dtmManutencaoAgendamento.qryClassesAgendamentos.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstClasses
    else
    if dtmManutencaoAgendamento.qryMarcasAgendamentos.recordcount<>0 then
      pgcDadosSelecionados.activepage := tstMarcas;
  end;
end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoAgendamento.qryProdutosAgendamentos.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoAgendamento.qryProdutosAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoAgendamento.qryProdutosAgendamentos.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end
  else
  begin

    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoAgendamento.qryProdutosAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoAgendamento.qryProdutosAgendamentos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;

  end;

end;

procedure TfrmManutencaoAgendamento.sbnExcluirProdutoClick(
  Sender: TObject);
begin
  inherited;
  IF dtmManutencaoAgendamento.ExcluirProdutoAgendamento then
    dbgProdutosAgendamentos.refresh;
end;

procedure TfrmManutencaoAgendamento.sbnExcluirGruposAgendamentosClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoAgendamento.ExcluirGrupoAgendamento;
end;

procedure TfrmManutencaoAgendamento.NotificarScroll(Sender: TObject);
begin

  sbnExcluirProduto.Enabled := not dtmManutencaoAgendamento.qryProdutosAgendamentosdias.IsNull or
                               not dtmManutencaoAgendamento.qryProdutosAgendamentosobservacoes.IsNull;

  sbnExcluirGruposAgendamentos.Enabled := not dtmManutencaoAgendamento.qryGruposAgendamentosdias.IsNull or
                               not dtmManutencaoAgendamento.qryGruposAgendamentosobservacoes.IsNull;


end;

procedure TfrmManutencaoAgendamento.sbnIncluirGruposAgendamentosClick(Sender: TObject);
begin
  inherited;


  dbggruposAgendamentos.Datasource.DataSet.last;
  dbggruposAgendamentos.setfocus;
  dbggruposAgendamentos.COL := 4;
  keybd_event(VK_DOWN,0,0,0);
  dbggruposAgendamentos.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);



end;

procedure TfrmManutencaoAgendamento.AtribuirDadosConsultaGrupoProdutos(Found: Boolean);
begin
  dtmManutencaoAgendamento.qryGruposAgendamentosdescricao.AsString :=
     fraConsultaGrupo.qryProcuraGrupoProdutos.fieldbyname('descricao').asstring;
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
  begin
  inherited;

    {
  case acol of
    1 : begin
          if FormControlEditLink1.Control <> fraConsultaGrupo then
             FormControlEditLink1.OnSetEditorFocus := FormControlEditLink1SetEditorFocus;


          FormControlEditLink1.Control := fraConsultaGrupo;
          FormControlEditLink1.Control.TabStop := false;

          dbgProdutosAgendamentos.EditLink := FormControlEditLink1;

        end;

    else
       FormControlEditLink1.Control :=  nil;
  end;

  if (acol in [1]) then
    aEditor := edCustom;
  }

end;


procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.FormControlEditLinkGrupoSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaGrupo.edfcodigo.SetFocus;

end;

procedure TfrmManutencaoAgendamento.NotificarInsertGrupo(Sender: TObject);
begin
  dbgGruposAgendamentos.col := 1;
//  keybd_event(VK_F2,0,0,0);

//  dbgProdutosAgendamentos.EditLink.CreateEditor();
//  dbgProdutosAgendamentos.EditLink.SetFocus(TRUE);

end;


procedure TfrmManutencaoAgendamento.fraConsultaItemProdutoedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaItemProduto.edfCodigoKeyDown(Sender, Key, Shift);

  if key = vk_escape then
    dbgProdutosAgendamentos.DataSource.DataSet.Cancel;


end;

procedure TfrmManutencaoAgendamento.fraConsultaGrupoedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaGrupo.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
    dbgGruposAgendamentos.DataSource.DataSet.Cancel;
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  Allow := not (dbgGruposAgendamentos.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgGruposAgendamentos.datasource.dataset.state = dsinsert then
    begin
      dbgGruposAgendamentos.Col := 1;
      keybd_event(VK_F2,0,0,0);

    end
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
//  CanEdit := dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
  Valid :=  (Value <> '') { or (dtmManutencaoAgendamento.qryGruposAgendamentos.state = dsinsert)} ;
//    Valid :=  dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields(false, false, false);
end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  {
  if key = #13 then
    if dbgGruposAgendamentos.datasource.dataset.state = dsinsert then
      SpeedButton1Click(nil);
      }


end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgProdutosAgendamentos.datasource.dataset.state = dsinsert then
    begin
      dbgProdutosAgendamentos.Col := 1;
      keybd_event(VK_F2,0,0,0);

    end

end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
;
end;

procedure TfrmManutencaoAgendamento.FormControlEditLinkProdutoSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaItemProduto.edfCodigo.SetFocus;
end;

procedure TfrmManutencaoAgendamento.sbnIncluirProdutoClick(
  Sender: TObject);
begin
  inherited;

  dbgProdutosAgendamentos.Datasource.DataSet.last;
  dbgProdutosAgendamentos.setfocus;
  dbgProdutosAgendamentos.COL := 4;
  keybd_event(VK_DOWN,0,0,0);
  dbgProdutosAgendamentos.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);


end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoAgendamento.qryProdutosAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  Allow := not (dbgProdutosAgendamentos.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoAgendamento.qryProdutosAgendamentos.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
  Valid :=  (Value <> '')
end;

procedure TfrmManutencaoAgendamento.dbgProdutosAgendamentosCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoAgendamento.qryProdutosAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.AtribuirDadosConsultaItemProdutos(Found: Boolean);
begin
  dtmManutencaoAgendamento.qryProdutosAgendamentosdescricao.AsString :=
     fraConsultaItemProduto.qryProcuraItemProdutos.fieldbyname('descricaolc').asstring;

  dtmManutencaoAgendamento.qryProdutosAgendamentosgrupo.AsString :=
     fraConsultaItemProduto.qryProcuraItemProdutos.fieldbyname('grupo').asstring;

  dtmManutencaoAgendamento.qryProdutosAgendamentosorigem.AsString := 'PRODUTOS';

end;

procedure TfrmManutencaoAgendamento.dbgGruposAgendamentosCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoAgendamento.qryGruposAgendamentos.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoAgendamento.qryGruposAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoAgendamento.qryGruposAgendamentos.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoAgendamento.qryGruposAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoAgendamento.qryGruposAgendamentos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;

end;

procedure TfrmManutencaoAgendamento.sbnAlterarClick(Sender: TObject);
begin
  inherited;
  if dtmManutencaoAgendamento.SalvarAgendamentoManutencao then
    sbnGerarClick(nil);
end;

procedure TfrmManutencaoAgendamento.ExportarExcel1Click(Sender: TObject);
var
  vNomeArquivo : String;

begin
  inherited;
  if pgcDadosSelecionados.ActivePage = tstProdutos then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgProdutosAgendamentos;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ProdutosAgendamentos.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ProdutosAgendamentos');
  end
  else
  if pgcDadosSelecionados.ActivePage = tstGrupos  then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgGruposAgendamentos;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\GruposAgendamentos.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'GruposAgendamentos');
  end
  else
  if pgcDadosSelecionados.ActivePage = tstClasses then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgClassesAgendamentos;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ClassesAgendamentos.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ClassesAgendamentos');
  end
  else
  if pgcDadosSelecionados.ActivePage = tstMarcas then
  begin
    AdvGridExcelIO1.AdvStringGrid := dbgMarcasAgendamentos;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\MarcasAgendamentos.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'MarcasAgendamentos');
  end;
end;

procedure TfrmManutencaoAgendamento.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  if pgcDadosSelecionados.ActivePage = tstProdutos then
    AdvGridFindDialog1.Grid := dbgProdutosAgendamentos
  else
  if pgcDadosSelecionados.ActivePage = tstGrupos then
    AdvGridFindDialog1.Grid := dbgGruposAgendamentos
  else
  if pgcDadosSelecionados.ActivePage = tstClasses then
    AdvGridFindDialog1.Grid := dbgClassesAgendamentos
  else
  if pgcDadosSelecionados.ActivePage = tstMarcas then
    AdvGridFindDialog1.Grid := dbgMarcasAgendamentos;

  AdvGridFindDialog1.Execute;
end;

procedure TfrmManutencaoAgendamento.NotificarInsertClasses(
  Sender: TObject);
begin
  dbgClassesAgendamentos.col := 1;
end;

procedure TfrmManutencaoAgendamento.NotificarInsertMarcas(Sender: TObject);
begin
  dbgMarcasAgendamentos.col := 1;
end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoAgendamento.qryClassesAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  Allow := not (dbgClassesAgendamentos.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoAgendamento.qryClassesAgendamentos.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoAgendamento.qryClassesAgendamentos.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoAgendamento.qryClassesAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoAgendamento.qryClassesAgendamentos.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoAgendamento.qryClassesAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoAgendamento.qryClassesAgendamentos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;

end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
  Valid :=  (Value <> '') { or (dtmManutencaoAgendamento.qryGruposAgendamentos.state = dsinsert)} ;
//    Valid :=  dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields(false, false, false);

end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoAgendamento.qryClassesAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgClassesAgendamentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgClassesAgendamentos.datasource.dataset.state = dsinsert then
    begin
      dbgClassesAgendamentos.Col := 1;
      keybd_event(VK_F2,0,0,0);
    end
end;

procedure TfrmManutencaoAgendamento.sbnIncluirClassesAgendamentosClick(
  Sender: TObject);
begin
  inherited;

  dbgClassesAgendamentos.Datasource.DataSet.last;
  dbgClassesAgendamentos.setfocus;
  dbgClassesAgendamentos.COL := 4;
  keybd_event(VK_DOWN,0,0,0);
  dbgClassesAgendamentos.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);

end;

procedure TfrmManutencaoAgendamento.sbnExcluirClassesAgendamentosClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAgendamento.ExcluirClassesAgendamento;
end;

procedure TfrmManutencaoAgendamento.sbnIncluirMarcasAgendamentosClick(
  Sender: TObject);
var
  vvk_down : word;

begin
  inherited;
  vvk_down := VK_DOWN;

  dbgMarcasAgendamentos.Datasource.DataSet.last;
  dbgMarcasAgendamentos.setfocus;
  dbgMarcasAgendamentos.COL := 4;
  keybd_event(VK_DOWN,0,0,0);
  dbgMarcasAgendamentos.COL := 1;
  Keybd_event(VK_RETURN,0,0,0);

//  FormControlEditLinkMarca.Control.SetFocus;
end;

procedure TfrmManutencaoAgendamento.sbnExcluirMarcasAgendamentosClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAgendamento.ExcluirMarcasAgendamento;
end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosCanAddRow(
  Sender: TObject; var CanAdd: Boolean);
begin
  inherited;
  CanAdd := dtmManutencaoAgendamento.qryMarcasAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  Allow := not (dbgMarcasAgendamentos.datasource.DataSet.state in [dsedit, dsinsert]);
end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosCanInsertRow(
  Sender: TObject; ARow: Integer; var CanInsert: Boolean);
begin
  inherited;
  CanInsert := dtmManutencaoAgendamento.qryMarcasAgendamentos.CheckRequiredFields(false, false);
end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmManutencaoAgendamento.qryMarcasAgendamentos.SQLBuffer.SortType := ZSqlItems.stDescending;
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmManutencaoAgendamento.qryMarcasAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    end;

    dtmManutencaoAgendamento.qryMarcasAgendamentos.SortInverse;
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmManutencaoAgendamento.qryMarcasAgendamentos.SQLBuffer.SortType := ZSqlItems.stAscending;
    dtmManutencaoAgendamento.qryMarcasAgendamentos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;

end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
begin
  inherited;
  Valid :=  (Value <> '') { or (dtmManutencaoAgendamento.qryGruposAgendamentos.state = dsinsert)} ;
//    Valid :=  dtmManutencaoAgendamento.qryGruposAgendamentos.CheckRequiredFields(false, false, false);

end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosCheckRequiredFields(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
  Allow := dtmManutencaoAgendamento.qryMarcasAgendamentos.CheckRequiredFields;
end;

procedure TfrmManutencaoAgendamento.dbgMarcasAgendamentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_down) {or (key = vk_return)}  then
    if dbgMarcasAgendamentos.datasource.dataset.state = dsinsert then
    begin
      dbgMarcasAgendamentos.Col := 1;
      keybd_event(VK_F2,0,0,0);
    end

end;

procedure TfrmManutencaoAgendamento.FormControlEditLinkClasseSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaClasse.edfcodigo.SetFocus;
end;

procedure TfrmManutencaoAgendamento.fraConsultaClasseedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaClasse.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
    dbgClassesAgendamentos.DataSource.DataSet.Cancel;

end;

procedure TfrmManutencaoAgendamento.fraConsultaMarcaedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaMarca.edfCodigoKeyDown(Sender, Key, Shift);
  if key = vk_escape then
    dbgMarcasAgendamentos.DataSource.DataSet.Cancel;

end;

procedure TfrmManutencaoAgendamento.FormControlEditLinkMarcaSetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaMarca.edfcodigo.SetFocus;
end;

procedure TfrmManutencaoAgendamento.AtribuirDadosConsultaClasseProdutos(Found: Boolean);
begin
  dtmManutencaoAgendamento.qryClassesAgendamentosdescricao.AsString :=
     fraConsultaClasse.qryProcuraClasses.fieldbyname('descricao').asstring;
end;

procedure TfrmManutencaoAgendamento.AtribuirDadosConsultaMarcaProdutos(Found: Boolean);
begin
  dtmManutencaoAgendamento.qryMarcasAgendamentosdescricao.AsString :=
     fraConsultaMarca.qryProcuraMarcadescricao.asstring;
end;

procedure TfrmManutencaoAgendamento.Copia1Click(Sender: TObject);
begin
  inherited;
  dbgProdutosAgendamentos.CopySelectionToClipboard;
end;

end.
