unit fmManutencaoProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, fmajudabt, Buttons, ToolWin, ExtCtrls,
  frmultiplaselecaoaleatoria, dmManutencaoProdutos, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker,
  PlannerDBDatePicker, frmctrllink, DB, frconsulta, frconsultacodigo, cpdbfindcontrols,
  clparametrossistema, ctconstantes, frconsultacontabil,
  frconsultacodigocontabil, GradientLabel, biblio, Mask, AdvMEdBtn,
  PlannerMaskDatePicker, PlannerDBMaskDatePicker, DBPlannerDatePicker,
  DBEditDateTimePicker, DBCtrls, cptexto, DBAdvEd, advlued, dbadvle,
  DBMaplistCombobox, Menus, AdvMenus, tmsAdvGridExcel, AsgFindDialog,
  fmPrincipalBasico, AdvSmoothProgressBar, cpdbtext;

type
  TfrmManutencaoProdutos = class(TfrmAjudaBt)
    sbnGerar: TSpeedButton;
    sbnAlterar: TSpeedButton;
    FormControlEditLink1: TFormControlEditLink;
    PlannerDBDatePicker1: TPlannerDBDatePicker;
    fraConsulta_: TfraConsultaCodigo;
    fraConsultaContabil_: TfraConsultaCodigoContabil;
    sbnAplicar: TSpeedButton;
    Timer1: TTimer;
    pnlEdicaoDados: TPanel;
    DBAdvEdit: TDBAdvEdit;
    DBAdvEditFloat: TDBAdvMaskEdit;
    DBCheckBoxBoolean: TDBCheckBox;
    DBMaplistCombobox1: TDBMaplistCombobox;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    Copia1: TMenuItem;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    sbnProdutos: TSpeedButton;
    AdvSmoothProgressBar1: TAdvSmoothProgressBar;
    pgcManutencaoProdutos: TPageControl;
    tstParametros: TTabSheet;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    gbxProdutos: TGroupBox;
    ckbProdutoEmLinha: TCheckBox;
    ckbProdutoForadeLinha: TCheckBox;
    ckbProdutoComMontagem: TCheckBox;
    ckbProdutoSemMontagem: TCheckBox;
    ckbProdutoNaoBrinde: TCheckBox;
    ckbProdutoBrinde: TCheckBox;
    ckbProdutoInativo: TCheckBox;
    ckbProdutoAtivo: TCheckBox;
    ckbDisponivelnoSite: TCheckBox;
    ckbNaoDisponivelnoSite: TCheckBox;
    gbxFornecedores: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    tstDadosProdutos: TTabSheet;
    DBAdvProdutos: TDBAdvGrid;
    DBAdvProdutosTop: TDBAdvGrid;
    pnlLegenda: TPanel;
    GradientLabelPesquisaCampo: TGradientLabel;
    Panel1: TPanel;
    ckbSelecionarTodos: TCheckBox;
    tstDadosAtributos: TTabSheet;
    pnlTopManutencaoAtributos: TPanel;
    fraConsultaAtributo: TfraConsultaCodigo;
    dtxDescricao: TtecDBText;
    DBAdvManutencaoAtributos: TDBAdvGrid;
    Panel2: TPanel;
    GradientLabel1: TGradientLabel;
    Panel3: TPanel;
    ckbSelecionarTodosAtributos: TCheckBox;
    DBAdvManutencaoAtributos_Linha: TDBAdvGrid;
    procedure sbnGerarClick(Sender: TObject);
    procedure DBAdvProdutosTopGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure FormControlEditLink1SetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure DBAdvProdutosTopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBAdvProdutosTopSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure DBAdvProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnAplicarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBAdvProdutosDblClick(Sender: TObject);
    procedure DBAdvProdutosGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PlannerDBDatePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbNuloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnAlterarClick(Sender: TObject);
    procedure DBCheckBoxBooleanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMaplistCombobox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBAdvProdutosTopColumnSize(Sender: TObject; ACol: Integer;
      var Allow: Boolean);
    procedure DBAdvProdutosTopColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);
    procedure DBAdvProdutosColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);
    procedure DBAdvProdutosTopMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBAdvProdutosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Copia1Click(Sender: TObject);
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure sbnProdutosClick(Sender: TObject);
    procedure pgcManutencaoProdutosChange(Sender: TObject);
    procedure fraConsultaAtributoedfCodigoEnter(Sender: TObject);
    procedure fraConsultaAtributoedfCodigoExit(Sender: TObject);
    procedure DBAdvManutencaoAtributosCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure DBAdvManutencaoAtributosGetEditorProp(Sender: TObject; ACol,
      ARow: Integer; AEditLink: TEditLink);
    procedure DBAdvManutencaoAtributosGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure DBAdvManutencaoAtributosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBAdvManutencaoAtributosGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure DBAdvManutencaoAtributosCellChanging(Sender: TObject; OldRow,
      OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
    procedure DBAdvManutencaoAtributosClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure DBAdvManutencaoAtributosDblClick(Sender: TObject);
    procedure ckbSelecionarTodosAtributosClick(Sender: TObject);
    procedure DBAdvManutencaoAtributos_LinhaColumnSizing(Sender: TObject;
      ACol, ColumnSize: Integer);
    procedure DBAdvManutencaoAtributosColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);
    procedure DBAdvManutencaoAtributos_LinhaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBAdvManutencaoAtributosMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBAdvManutencaoAtributos_LinhaCanEditCell(Sender: TObject;
      ARow, ACol: Integer; var CanEdit: Boolean);
    procedure DBAdvManutencaoAtributos_LinhaCellChanging(Sender: TObject;
      OldRow, OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
    procedure DBAdvManutencaoAtributos_LinhaClickCell(Sender: TObject;
      ARow, ACol: Integer);
    procedure DBAdvManutencaoAtributos_LinhaGetAlignment(Sender: TObject;
      ARow, ACol: Integer; var HAlign: TAlignment;
      var VAlign: TVAlignment);
    procedure DBAdvManutencaoAtributos_LinhaGetEditorProp(Sender: TObject;
      ACol, ARow: Integer; AEditLink: TEditLink);
    procedure DBAdvManutencaoAtributos_LinhaGetEditorType(Sender: TObject;
      ACol, ARow: Integer; var AEditor: TEditorType);
    procedure DBAdvManutencaoAtributos_LinhaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBAdvManutencaoAtributos_LinhaSelectCell(Sender: TObject;
      ACol, ARow: Integer; var CanSelect: Boolean);

  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
    vrecnoteste : integer;
    vrowteste : integer;
    vtoprowteste : integer;
    vColResized : integer;
    vAtributoAnterior: String;
    procedure AtribuirDadostipoproduto(Found: Boolean);
    procedure AtribuirDadosgrupo_caracteristica(Found: Boolean);
    procedure AtribuirDadosClasse_caracteristica(Found: Boolean);
    procedure AtribuirDadosMarca_caracteristica(Found: Boolean);
    procedure AtribuirDadosunidade_caracteristica(Found: Boolean);
    procedure AtribuirDadosfatorpreco_caracteristica(Found: Boolean);
    procedure AtribuirDadosSetorProducao_caracteristica(Found: Boolean);
    procedure AtribuirDadosSetorcst_caracteristica(Found: Boolean);
    procedure AtribuirDadoscsosn_caracteristica(Found: Boolean);
    procedure AtribuirDadoscodigo_efd_t53_caracteristica(Found: Boolean);

    procedure AtribuirDadosicmsmodalidade_caracteristica(Found: Boolean);
    procedure AtribuirDadosicms_caracteristica(Found: Boolean);
    procedure AtribuirDadosicmsmodsubst_caracteristica(Found: Boolean);
    procedure AtribuirDadosorigem_caracteristica(Found: Boolean);
    procedure AtribuirDadosobslegal_caracteristica(Found: Boolean);
    procedure AtribuirDadosipi_caracteristica(Found: Boolean);
    procedure AtribuirDadosipicst_caracteristica(Found: Boolean);
    procedure AtribuirDadoscofinscst_caracteristica(Found: Boolean);
    procedure AtribuirDadospiscst_caracteristica(Found: Boolean);
    procedure SincronizarLarguraColuna(ColunaOrigem, ColunaDestino: TDBAdvGrid);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SincronizarTodasLarguraColuna(ColunaOrigem, ColunaDestino: TDBAdvGrid);
  end;

var
  frmManutencaoProdutos: TfrmManutencaoProdutos;

implementation

{$R *.dfm}

constructor TfrmManutencaoProdutos.Create(AOwner: TComponent);
begin
  inherited;
  pgcManutencaoProdutos.OnChange := nil;
  SetarActivePage(self);
  dtmManutencaoProdutos := TdtmManutencaoProdutos.Create(Self);
  pnlEdicaoDados.visible := false;
  vColResized := 0;


  fraConsultaFornecedor.qryProcuraCliente.ParamByName('NaoConsiderarTipoCliente').asBoolean := false;
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;
  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';
  dtmManutencaoProdutos.qryProcuraFornecedores := fraConsultaFornecedor.qryProcuraCliente;

  fraConsultaAtributo.TipoPesquisa := pesAtributos;
  dtmManutencaoProdutos.qryProcuraAtributos := fraConsultaAtributo.qryProcuraAtributos;

  dtmManutencaoProdutos.LastPageOpened := tstDadosProdutos;
  pgcManutencaoProdutos.OnChange := pgcManutencaoProdutosChange;

  




end;

destructor TfrmManutencaoProdutos.Destroy;
begin

  inherited;
end;

procedure TfrmManutencaoProdutos.sbnGerarClick(Sender: TObject);
begin
  inherited;

    with dtmManutencaoProdutos do
    begin

      ParametroListasPadrao := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatorialistaspadronizadas.ListaCondicional;

      ProdutoEmLinha     := ckbProdutoEmLinha.checked;
      ProdutoForadeLinha := ckbProdutoForadeLinha.checked;

      ProdutoAtivo       := ckbProdutoAtivo.checked;
      ProdutoInativo     := ckbProdutoInativo.checked;

      ProdutoComMontagem := ckbProdutoComMontagem.Checked;
      ProdutoSemMontagem := ckbProdutoSemMontagem.Checked;

      ProdutoBrinde      := ckbProdutoBrinde.Checked;
      ProdutoNaoBrinde   := ckbProdutoNaoBrinde.Checked;

      DisponivelnoSite := ckbDisponivelnoSite.checked;
      NaoDisponivelnoSite := ckbNaoDisponivelnoSite.checked;

    end;

    if dtmManutencaoProdutos.AbrirConsulta then
    begin
      pgcManutencaoProdutos.OnChange := nil;
      if (dtmManutencaoProdutos.LastPageOpened.Name = 'tstDadosProdutos') then
        pgcManutencaoProdutos.activepage := tstDadosProdutos
      else
        pgcManutencaoProdutos.activepage := tstDadosAtributos;
      pgcManutencaoProdutos.OnChange := pgcManutencaoProdutosChange;
    end;


end;

procedure TfrmManutencaoProdutos.DBAdvProdutosTopGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;

  PlannerDBDatePicker1.visible := false;
  DBAdvEdit.visible := false;
  DBAdvEditFloat.visible := false;
  DBMaplistCombobox1.visible := false;

  fraConsulta_.visible := false;
  fraConsultaContabil_.visible := false;


  PlannerDBDatePicker1.left := DBCheckBoxBoolean.width + 3;
  DBAdvEditFloat.left := DBCheckBoxBoolean.width + 3;
  DBAdvEdit.left := DBCheckBoxBoolean.width + 3;
  DBMaplistCombobox1.left := DBCheckBoxBoolean.width + 3;
  fraConsulta_.left := DBCheckBoxBoolean.width + 3;
  fraConsultaContabil_.left := DBCheckBoxBoolean.width + 3;

  DBCheckBoxBoolean.AllowGrayed := false;

  if dtmManutencaoProdutos.qryProdutosLinha.FindField('Nulo_'+TDBAdvGrid(Sender).Columns[Acol].FieldName)<>nil then
  begin
    DBCheckBoxBoolean.datafield := '';
    DBCheckBoxBoolean.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBCheckBoxBoolean.datafield := 'Nulo_'+TDBAdvGrid(Sender).Columns[Acol].FieldName;
  end;

  if dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString = 'Nulo' then
    dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).clear;

  if TDBAdvGrid(Sender).Columns[Acol].Field.DataType = ftDate then
  begin
    PlannerDBDatePicker1.datafield := '';
    PlannerDBDatePicker1.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    PlannerDBDatePicker1.datafield := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    PlannerDBDatePicker1.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    PlannerDBDatePicker1.visible := true;
//    TDBAdvGrid(Sender).EditLink := FormControlEditLink1
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].Field.DataType = ftBoolean then
  begin
    DBCheckBoxBoolean.datafield := '';
    DBCheckBoxBoolean.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBCheckBoxBoolean.datafield := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    DBCheckBoxBoolean.AllowGrayed := true;
//    TDBAdvGrid(Sender).EditLink := FormControlEditLink1
  end
  else
  if (TDBAdvGrid(Sender).Columns[Acol].Field.DataType = ftFloat) or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'volumes_caracteristica') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'bonus_caracteristica') then
  begin
    DBAdvEditFloat.datafield := '';
    DBAdvEditFloat.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBAdvEditFloat.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBAdvEditFloat.visible := true;
    DBAdvEditFloat.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

  end
  else
  if (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'descricao_produto') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'descricaoplanilhacusto_produto') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'nome_site_produto') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'referencia_produto') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'descricao_caracteristica') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'complemento_caracteristica') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'gtin_caracteristica') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'descricaonanf_caracteristica') then
  begin
  
    DBAdvEdit.datafield := '';
    DBAdvEdit.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBAdvEdit.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBAdvEdit.EditType := etString;
    DBAdvEdit.visible := true;
    DBAdvEdit.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

//    TDBAdvGrid(Sender).EditLink := FormControlEditLink1
  end
  else
  if (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'discriminarcomposto_caracteristica') then
  begin

    DBMaplistCombobox1.datafield := '';
    DBMaplistCombobox1.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBMaplistCombobox1.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBMaplistCombobox1.visible := true;
    DBMaplistCombobox1.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

    DBMaplistCombobox1.Items.Clear;
    DBMaplistCombobox1.Items.Append('N - Sem composição');
    DBMaplistCombobox1.Items.Append('C - Com composição');
    DBMaplistCombobox1.Items.Append('S - Só composição');
    DBMaplistCombobox1.Items.Append('');

    DBMaplistCombobox1.ItemValues.clear;
    DBMaplistCombobox1.ItemValues.Append('N');
    DBMaplistCombobox1.ItemValues.Append('C');
    DBMaplistCombobox1.ItemValues.Append('S');
    DBMaplistCombobox1.ItemValues.Append('');

  end
  else
  if (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'vendanegativa_caracteristica') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'vendanegativanosite_caracteristica') then
  begin

    DBMaplistCombobox1.datafield := '';
    DBMaplistCombobox1.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBMaplistCombobox1.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBMaplistCombobox1.visible := true;
    DBMaplistCombobox1.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

    DBMaplistCombobox1.Items.Clear;
    DBMaplistCombobox1.Items.Append('S - Sim');
    DBMaplistCombobox1.Items.Append('N - Não');
    if (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'vendanegativanosite_caracteristica') then
      DBMaplistCombobox1.Items.Append('X - Outros');
    DBMaplistCombobox1.Items.Append('');

    DBMaplistCombobox1.ItemValues.clear;
    DBMaplistCombobox1.ItemValues.Append('S');
    DBMaplistCombobox1.ItemValues.Append('N');
    if (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'vendanegativanosite_caracteristica') then
      DBMaplistCombobox1.ItemValues.Append('X');
    DBMaplistCombobox1.Items.Append('');

  end
  else
  if (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'tipocomissao_caracteristica') or
     (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'tipocomissaoindicador_caracteristica') then
  begin

    DBMaplistCombobox1.datafield := '';
    DBMaplistCombobox1.datasource := dtmManutencaoProdutos.dsrProdutosLinha;
    DBMaplistCombobox1.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBMaplistCombobox1.visible := true;
    DBMaplistCombobox1.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

    DBMaplistCombobox1.Items.Clear;
    DBMaplistCombobox1.Items.Append('% - Percentual');
    DBMaplistCombobox1.Items.Append('V - Valor');
    DBMaplistCombobox1.Items.Append('');

    DBMaplistCombobox1.ItemValues.clear;
    DBMaplistCombobox1.ItemValues.Append('%');
    DBMaplistCombobox1.ItemValues.Append('V');
    DBMaplistCombobox1.Items.Append('');

  end
  else

  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'tipoproduto_caracteristica' then
  begin
    With fraConsulta do
    begin
      fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
      fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
      fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

      fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;

      fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
      fraConsulta_.edfCodigo.MaxLength := 2;
      fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;
      fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
      fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
      fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;


      fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraTipoProduto;
      fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
      fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
      fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
      fraConsulta_.edfCodigo.LookupField := 'codigo';

      fraConsulta_.OnFound := AtribuirDadostipoproduto;
      TipoPesquisa := pesTIPOPRODUTO;
    end;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'grupo_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraGrupoProdutos;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';
    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 4;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;
    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosgrupo_caracteristica;
    fraConsulta_.TipoPesquisa := pesGRUPOS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'classe_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraClasses;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 2;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosClasse_caracteristica;
    fraConsulta_.TipoPesquisa := pesCLASSES;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'marca_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;

    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraMarca;
    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 4;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosMarca_caracteristica;
    fraConsulta_.TipoPesquisa := pesMARCAS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'unidade_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraUnidades;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 8;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosunidade_caracteristica;
    fraConsulta_.TipoPesquisa := pesUNIDADES;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'fatorpreco_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraMoedas;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';

    fraConsulta_.edfCodigo.LookupField := 'codigo';
    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 4;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosfatorpreco_caracteristica;
    fraConsulta_.TipoPesquisa := pesMOEDAS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'setorproducao_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraSetoresProducao;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 4;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosSetorProducao_caracteristica;
    fraConsulta_.TipoPesquisa := pesSETORESPRODUCAO;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'cst_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraTributosICMS;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'incidencia';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 4;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldInterno := 'incidencia_caracteristica';
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosSetorcst_caracteristica;
    fraConsulta_.TipoPesquisa := pesTRIBUTOSICMS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'csosn_caracteristica' then
  begin

    fraConsultaContabil_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsultaContabil_.edfcodigo.Width := fraConsultaContabil_.Width-23;
    fraConsultaContabil_.sbnprocura.left := fraConsultaContabil_.edfcodigo.Width;

    fraConsultaContabil_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsultaContabil_.edfCodigo.LookupSource := fraConsultaContabil_.dsrProcuraCSOSN;

    fraConsultaContabil_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsultaContabil_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsultaContabil_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsultaContabil_.edfCodigo.LookupField := 'codigo';

    fraConsultaContabil_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsultaContabil_.edfCodigo.MaxLength := 4;
    fraConsultaContabil_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsultaContabil_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsultaContabil_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsultaContabil_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsultaContabil_.OnFound := AtribuirDadoscsosn_caracteristica;
    fraConsultaContabil_.TipoPesquisa := pesCSOSN;
    fraConsultaContabil_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icmsmodalidade_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraModalidadeBCICMS;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 1;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosicmsmodalidade_caracteristica;
    fraConsulta_.TipoPesquisa := pesMODALIDADEBCICMS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icms_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraICMS;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';
    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 4;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosicms_caracteristica;
    fraConsulta_.TipoPesquisa := pesICMS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icmsmodsubst_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraModalidadeBCICMSST;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 1;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosicmsmodsubst_caracteristica;
    fraConsulta_.TipoPesquisa := pesMODALIDADEBCICMSST;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icmsmodsubst_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraModalidadeBCICMSST;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';
    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 1;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosicmsmodsubst_caracteristica;
    fraConsulta_.TipoPesquisa := pesMODALIDADEBCICMSST;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'origem_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraOrigens;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 1;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosorigem_caracteristica;
    fraConsulta_.TipoPesquisa := pesORIGENS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'obslegal_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraObsLegais;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 3;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosobslegal_caracteristica;
    fraConsulta_.TipoPesquisa := pesOBSLEGAIS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'ipi_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuraIPI;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 6;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosipi_caracteristica;
    fraConsulta_.TipoPesquisa := pesIPI;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'ipicst_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuratributosipi;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 2;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadosipicst_caracteristica;
    fraConsulta_.TipoPesquisa := pesTRIBUTOSIPI;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'cofinscst_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    TDBAdvGrid(Sender).Columns[Acol].Editor := edCustom;
    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuratributoscofins;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 2;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadoscofinscst_caracteristica;
    fraConsulta_.TipoPesquisa := pesTRIBUTOSCOFINS;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'piscst_caracteristica' then
  begin
    fraConsulta_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsulta_.edfcodigo.Width := fraConsulta_.Width-23;
    fraConsulta_.sbnprocura.left := fraConsulta_.edfcodigo.Width;

    fraConsulta_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsulta_.edfCodigo.LookupSource := fraConsulta_.dsrProcuratributospis;

    fraConsulta_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsulta_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsulta_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsulta_.edfCodigo.LookupField := 'codigo';

    fraConsulta_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsulta_.edfCodigo.MaxLength := 2;
    fraConsulta_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsulta_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsulta_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsulta_.OnFound := AtribuirDadospiscst_caracteristica;
    fraConsulta_.TipoPesquisa := pesTRIBUTOSpis;
    fraConsulta_.visible := true;
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].FieldName = 'codigo_efd_t53_caracteristica' then
  begin

    fraConsultaContabil_.Width := TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    fraConsultaContabil_.edfcodigo.Width := fraConsultaContabil_.Width-23;
    fraConsultaContabil_.sbnprocura.left := fraConsultaContabil_.edfcodigo.Width;

    fraConsultaContabil_.edfCodigo.text := dtmManutencaoProdutos.dsrProdutosLinha.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString;
    fraConsultaContabil_.edfCodigo.LookupSource := fraConsultaContabil_.dsrProcuraefd_t53;

    fraConsultaContabil_.edfCodigo.LookupaFieldinterno := 'codigo';
    fraConsultaContabil_.edfCodigo.LookupaFieldvisual := 'codigo';
    fraConsultaContabil_.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsultaContabil_.edfCodigo.LookupField := 'codigo';

    fraConsultaContabil_.edfCodigo.Operacao := opATRIBUICAO;
    fraConsultaContabil_.edfCodigo.MaxLength := 10;
    fraConsultaContabil_.edfCodigo.DataSource := dtmManutencaoProdutos.dsrProdutosLinha;

    fraConsultaContabil_.edfCodigo.DataaFieldInterno := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsultaContabil_.edfCodigo.DataaFieldVisual := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    fraConsultaContabil_.edfCodigo.DataField := TDBAdvGrid(Sender).Columns[Acol].FieldName;

    fraConsultaContabil_.OnFound := AtribuirDadoscodigo_efd_t53_caracteristica;
    fraConsultaContabil_.TipoPesquisa := pesEFD_T53;
    fraConsultaContabil_.visible := true;
  end;
end;

procedure TfrmManutencaoProdutos.FormControlEditLink1SetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  if TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType = ftDate then
    PlannerDBDatePicker1.setfocus
  else
  if TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType = ftBoolean then
    DBCheckBoxBoolean.setfocus
  else
  if (TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType in [ftFloat, ftinteger] ) or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'volumes_caracteristica') then
    DBAdvEditFloat.setfocus
  else

  if ((TDBAdvGrid(Grid).Name = 'DBAdvProdutosTop') and
       ((TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricao_produto') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricaoplanilhacusto_produto') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'nome_site_produto') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'referencia_produto') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricao_caracteristica') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'complemento_caracteristica') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'gtin_caracteristica') or
        (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricaonanf_caracteristica')
       )
      )

      or

     ((TDBAdvGrid(Grid).Name = 'DBAdvManutencaoAtributos_Linha') and
      (TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType in [ftString, ftMemo]))

      then
    DBAdvEdit.setfocus
  else
  IF (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'discriminarcomposto_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'vendanegativa_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'vendanegativanosite_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'tipocomissao_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'tipocomissaoindicador_caracteristica') then
    DBMaplistCombobox1.setfocus
  else
  if fraConsulta_.visible then
    fraConsulta_.edfcodigo.setfocus
  else
  if fraConsultaContabil_.visible then
    fraConsultaContabil_.edfcodigo.setfocus;
end;

procedure TfrmManutencaoProdutos.AtribuirDadostipoproduto(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaotipoproduto_caracteristica.asString :=
    fraConsulta_.qryProcuraTipoProduto.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosgrupo_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaogrupo_caracteristica.asString :=
    fraConsulta_.qryProcuraGrupoProdutos.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosClasse_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoclasse_caracteristica.asString :=
    fraConsulta_.qryProcuraClasses.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosMarca_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaomarca_caracteristica.asString :=
    fraConsulta_.qryProcuraMarca.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosunidade_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaounidade_caracteristica.asString :=
    fraConsulta_.qryProcuraUnidades.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosfatorpreco_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaofatorpreco_caracteristica.asString :=
    fraConsulta_.qryProcuraMoedas.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosSetorProducao_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricacaosetorproducao_caracteristica.asString :=
    fraConsulta_.qryProcuraSetoresProducao.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosSetorcst_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaocst_caracteristica.asString :=
    fraConsulta_.qryProcuraTributosICMS.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadoscsosn_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaocsosn_caracteristica.asString :=
    fraConsultaContabil_.qryProcuraCSOSN.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosicmsmodalidade_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoicmsmodalidade_caracteristica.asString :=
    fraConsulta_.qryProcuraModalidadeBCICMS.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosicms_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoicms_caracteristica.asString :=
    fraConsulta_.qryProcuraICMS.fieldbyname('descricao').asString;

  dtmManutencaoProdutos.qryProdutosLinhaaliquotaicms_estadosicms.AsCurrency :=
    fraConsulta_.qryProcuraICMS.fieldbyname('aliquota').AsCurrency;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosicmsmodsubst_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoicmsmodsubst_caracteristica.asString :=
    fraConsulta_.qryProcuraModalidadeBCICMSST.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosorigem_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoorigem_caracteristica.asString :=
    fraConsulta_.qryProcuraOrigens.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosobslegal_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoobslegal_caracteristica.asString :=
    fraConsulta_.qryProcuraObsLegais.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadosipi_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoipi_caracteristica.asString :=
    fraConsulta_.qryProcuraIPI.fieldbyname('descricao').asString;

  dtmManutencaoProdutos.qryProdutosLinhaclassificacaofiscalipi_caracteristica.asString :=
    fraConsulta_.qryProcuraIPI.fieldbyname('classificacaofiscal').asString;

  dtmManutencaoProdutos.qryProdutosLinhaaliquotaipi_caracteristica.AsCurrency :=
    fraConsulta_.qryProcuraIPI.fieldbyname('aliquota').asCurrency;

end;

procedure TfrmManutencaoProdutos.AtribuirDadosipicst_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoipicst_caracteristica.asString :=
    fraConsulta_.qryProcuratributosipi.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadoscofinscst_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaocofins_caracteristica.asString :=
    fraConsulta_.qryProcuratributoscofins.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadospiscst_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaopis_caracteristica.asString :=
    fraConsulta_.qryProcuratributospis.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.AtribuirDadoscodigo_efd_t53_caracteristica(Found: Boolean);
begin
  dtmManutencaoProdutos.qryProdutosLinhadescricaoefd_t53_caracteristica.asString :=
    fraConsultaContabil_.qryProcuraefd_t53.fieldbyname('descricao').asString;
end;

procedure TfrmManutencaoProdutos.DBAdvProdutosTopKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var
//  tecla: word;
begin
  inherited;
  if (key = VK_F9) and (Shift = [ssCtrl]) then
  begin
    if (DBAdvProdutosTop.ColumnByFieldName['codigo_efd_t53_caracteristica'].Index = DBAdvProdutosTop.Col) or
       (DBAdvProdutosTop.ColumnByFieldName['csosn_caracteristica'].Index = DBAdvProdutosTop.Col) then
    begin
      DBAdvProdutosTop.ShowInplaceEdit;
      fraConsultaContabil_.sbnProcuraClick(sender)
    end
    else
    if (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'tipoproduto_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'grupo_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'classe_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'marca_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'unidade_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'fatorpreco_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'setorproducao_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'cst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'icmsmodalidade_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'icms_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'icmsmodsubst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'icmsmodsubst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'origem_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'obslegal_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'ipi_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'ipicst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'cofinscst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[TDBAdvGrid(Sender).col].FieldName = 'piscst_caracteristica') then
    begin
      DBAdvProdutosTop.ShowInplaceEdit;
      fraConsulta_.sbnProcuraClick(sender)
    end;
  end;
end;

procedure TfrmManutencaoProdutos.DBAdvProdutosTopSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  if

       (TDBAdvGrid(Sender).Columns[ACol].FieldName = 'tipoproduto_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'grupo_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'classe_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'marca_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'unidade_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'fatorpreco_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'setorproducao_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'cst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icmsmodalidade_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icms_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icmsmodsubst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'icmsmodsubst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'origem_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'obslegal_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'ipi_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'ipicst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'cofinscst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'piscst_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'codigo_efd_t53_caracteristica') or
       (TDBAdvGrid(Sender).Columns[Acol].FieldName = 'csosn_caracteristica')
  then
    GradientLabelPesquisaCampo.Caption := 'Ctrl + F9 - Pesquisar    |  Space/Duplo Clique - Selecionar'
  else
    GradientLabelPesquisaCampo.Caption := 'Space/Duplo Clique - Selecionar';


end;

procedure TfrmManutencaoProdutos.DBAdvProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_space then
  begin
    TDBAdvGrid(Sender).datasource.dataset.edit;
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['marcar'].index].AsBoolean := not
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['marcar'].index].AsBoolean;
    TDBAdvGrid(Sender).datasource.dataset.post;

    if DBAdvProdutos.FieldAtColumn[DBAdvProdutos.ColumnByFieldName['marcar'].index].AsBoolean then
      inc(dtmManutencaoProdutos.vmarcadosprodutos)
    else
      dec(dtmManutencaoProdutos.vmarcadosprodutos);

  end;

end;

procedure TfrmManutencaoProdutos.ckbSelecionarTodosClick(Sender: TObject);
var
vRecno : integer;
begin
  inherited;

  DBAdvProdutos.SaveGridPosition;

  with dtmManutencaoProdutos do
  begin

    vRecno := qryProdutos.recno;
    qryProdutos.DisableControls;

    qryProdutos.first;
    while not qryProdutos.eof do
    begin
      qryProdutos.edit;
      qryProdutosmarcar.AsBoolean := ckbSelecionarTodos.checked;
      qryProdutos.post;

      if qryProdutosmarcar.AsBoolean then
        inc(vmarcadosprodutos)
      else
        dec(vmarcadosprodutos);

      qryProdutos.next;

      vPosition :=  (qryProdutos.RecNo * 100) / qryProdutos.recordcount;

      AdvSmoothProgressBar1.visible := true;
      AdvSmoothProgressBar1.Appearance.ValueFormat := 'Marcando/desmarcando produtos %.0f%%';
      AdvSmoothProgressBar1.Position := vPosition;

      Application.ProcessMessages;

    end;

    AdvSmoothProgressBar1.visible := false;

    qryProdutos.enableControls;
    qryProdutos.recno := vRecno;

  end;

  DBAdvProdutos.RestoreGridPosition;


end;

procedure TfrmManutencaoProdutos.sbnAplicarClick(Sender: TObject);
begin
  inherited;
  if pgcManutencaoProdutos.activepage = tstDadosProdutos then
  begin
    DBAdvProdutos.SaveGridPosition;
    dtmManutencaoProdutos.AplicarAlteracoes;
    DBAdvProdutos.RestoreGridPosition;
  end
  else
  if pgcManutencaoProdutos.activepage = tstDadosAtributos then
  begin
    DBAdvManutencaoAtributos.SaveGridPosition;
    dtmManutencaoProdutos.AplicarAlteracoesAtributos;
    DBAdvManutencaoAtributos.RestoreGridPosition;
  end;
end;

procedure TfrmManutencaoProdutos.Timer1Timer(Sender: TObject);
begin
  inherited;

  sbnGerar.enabled := pgcManutencaoProdutos.ActivePage = tstParametros;

  sbnAplicar.enabled := ((dtmManutencaoProdutos.vmarcadosprodutos <> 0) and
                         (pgcManutencaoProdutos.ActivePage = tstDadosProdutos)) or

                        ((dtmManutencaoProdutos.vMarcadosAtributos <> 0) and
                         (pgcManutencaoProdutos.ActivePage = tstDadosAtributos));

  sbnAlterar.enabled :=
                         ((dtmManutencaoProdutos.vmarcadosprodutos <> 0) and
                          (dtmManutencaoProdutos.vAplicadosprodutos <> 0))

                         or

                          (dtmManutencaoProdutos.vMarcadosAtributos <> 0);

  sbnProdutos.enabled := ((dtmManutencaoProdutos.qryProdutos.RecordCount <> 0) and
                          (pgcManutencaoProdutos.ActivePage = tstDadosProdutos)) or

                         ((dtmManutencaoProdutos.qryManutencaoAtributos.RecordCount <> 0) and
                          (pgcManutencaoProdutos.ActivePage = tstDadosAtributos));
end;

procedure TfrmManutencaoProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ((dtmManutencaoProdutos.vmarcadosprodutos <> 0) and
      (dtmManutencaoProdutos.vAplicadosprodutos <> 0)) or

      (dtmManutencaoProdutos.vmarcadosAtributos <> 0)

     then
    CanClose := MensagemConfirmacao('Existe uma gravação pendente. Ao fechar o formulário a mesma será perdida.') = smbOK;

  if not canclose then
    pgcManutencaoProdutos.ActivePage := tstDadosProdutos;  

end;

procedure TfrmManutencaoProdutos.DBAdvProdutosDblClick(Sender: TObject);
begin
  inherited;

    TDBAdvGrid(Sender).datasource.dataset.edit;
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['marcar'].index].AsBoolean := not
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['marcar'].index].AsBoolean;
    TDBAdvGrid(Sender).datasource.dataset.post;

    if DBAdvProdutos.FieldAtColumn[DBAdvProdutos.ColumnByFieldName['marcar'].index].AsBoolean then
      inc(dtmManutencaoProdutos.vmarcadosprodutos)
    else
      dec(dtmManutencaoProdutos.vmarcadosprodutos);


end;

procedure TfrmManutencaoProdutos.DBAdvProdutosGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
var
  vstate : Boolean;

begin
  inherited;
  if ARow > 0 then
  begin
    DBAdvProdutos.GetCheckBoxState(DBAdvProdutos.ColumnByFieldName['marcar'].Index,
                                       ARow, vstate);
    if vstate then
      ABrush.Color := GradientLabelPesquisaCampo.color
  end;
end;

procedure TfrmManutencaoProdutos.Button1Click(Sender: TObject);
begin
  inherited;
//  DBAdvProdutos.toprow
//  DBAdvProdutos.VisibleRowCount;
//  dtmManutencaoProdutos.qryProdutos.MoveBy(1)

  vrecnoteste := dtmManutencaoProdutos.qryProdutos.recno;
  vrowteste := DBAdvProdutos.row;
  vtoprowteste := DBAdvProdutos.toprow;

end;

procedure TfrmManutencaoProdutos.Button2Click(Sender: TObject);
begin
  inherited;
  DBAdvProdutos.row := vtoprowteste + DBAdvProdutos.VisibleRowCount;
  DBAdvProdutos.row := vtoprowteste;
  dtmManutencaoProdutos.qryProdutos.MoveBy(vrowteste-vtoprowteste);


end;

procedure TfrmManutencaoProdutos.PlannerDBDatePicker1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
//    DBAdvProdutosTop.setfocus;
    SelectNext(ActiveControl, false, true);
end;

procedure TfrmManutencaoProdutos.ckbNuloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    SelectNext(ActiveControl, false, true);
//    DBAdvProdutosTop.setfocus;

end;

procedure TfrmManutencaoProdutos.sbnAlterarClick(Sender: TObject);
begin
  inherited;
  if pgcManutencaoProdutos.activepage = tstDadosProdutos then
  begin

    DBAdvProdutos.SaveGridPosition;
    if dtmManutencaoProdutos.GravarAlteracoes then
    begin
      DBAdvProdutos.RestoreGridPosition;
      ckbSelecionarTodos.checked := false;
    end;

  end
  else

  begin

    DBAdvManutencaoAtributos.SaveGridPosition;
    if dtmManutencaoProdutos.GravarAlteracoesAtributos then
    begin
      DBAdvManutencaoAtributos.RestoreGridPosition;
      ckbSelecionarTodosAtributos.checked := false;
    end;

  end;



end;

procedure TfrmManutencaoProdutos.DBCheckBoxBooleanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    SelectNext(pnlEdicaoDados, false, true);
end;

procedure TfrmManutencaoProdutos.DBMaplistCombobox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    SelectNext(pnlEdicaoDados, false, true);

end;

procedure TfrmManutencaoProdutos.DBAdvProdutosTopColumnSize(
  Sender: TObject; ACol: Integer; var Allow: Boolean);
begin
  inherited;
;
end;

procedure TfrmManutencaoProdutos.DBAdvProdutosTopColumnSizing(
  Sender: TObject; ACol, ColumnSize: Integer);
begin
  inherited;

  try
    vColResized := ACol;
    DBAdvProdutos.OnColumnSizing := nil;
    DBAdvProdutos.ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width := TDBAdvGrid(Sender).ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width;
  finally
    DBAdvProdutos.OnColumnSizing := DBAdvProdutosColumnSizing;
  end;

end;

procedure TfrmManutencaoProdutos.DBAdvProdutosColumnSizing(Sender: TObject;
  ACol, ColumnSize: Integer);
begin
  inherited;

  try
    vColResized := ACol;
    DBAdvProdutosTop.OnColumnSizing := nil;
    DBAdvProdutosTop.ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width := TDBAdvGrid(Sender).ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width;
    DBAdvProdutosTop.Repaint;
  finally
    DBAdvProdutosTop.OnColumnSizing := DBAdvProdutosTopColumnSizing;
  end;
end;

procedure TfrmManutencaoProdutos.DBAdvProdutosTopMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SincronizarLarguraColuna(DBAdvProdutosTop, DBAdvProdutos);
end;

procedure TfrmManutencaoProdutos.DBAdvProdutosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SincronizarLarguraColuna(DBAdvProdutos, DBAdvProdutosTop);
end;

procedure TfrmManutencaoProdutos.SincronizarLarguraColuna(ColunaOrigem,
  ColunaDestino: TDBAdvGrid);
begin
  if vColResized <> 0 then
  begin
    ColunaDestino.ColumnByFieldName[ColunaOrigem.Columns[vColResized].fieldname].Width := ColunaOrigem.ColumnByFieldName[ColunaOrigem.Columns[vColResized].fieldname].Width;
    vColResized := 0;
  end;
end;

procedure TfrmManutencaoProdutos.Copia1Click(Sender: TObject);
begin
  inherited;
  DBAdvProdutos.CopySelectionToClipboard;
end;

procedure TfrmManutencaoProdutos.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  AdvGridFindDialog1.Grid := DBAdvProdutos;
  AdvGridFindDialog1.Execute;

end;

procedure TfrmManutencaoProdutos.ExportarExcel1Click(Sender: TObject);
var
  vNomeArquivo : String;

begin
  inherited;
  AdvGridExcelIO1.AdvStringGrid := DBAdvProdutos;
  vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ManutencaoProdutos.xls';
  AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ManutençãoProdutos');
end;

procedure TfrmManutencaoProdutos.sbnProdutosClick(Sender: TObject);
begin
  inherited;
  if pgcManutencaoProdutos.ActivePage = tstDadosProdutos then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Abrir',
        dtmManutencaoProdutos.qryProdutoscodigovisual_caracteristica.asString], 'TfrmCadastroCaracteristicas', True)
  else
  if pgcManutencaoProdutos.ActivePage = tstDadosAtributos then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Abrir',
        dtmManutencaoProdutos.qryManutencaoAtributos.fieldbyname('Produto').asString], 'TfrmCadastroCaracteristicas', True)
end;

procedure TfrmManutencaoProdutos.pgcManutencaoProdutosChange(
  Sender: TObject);
var
  i: integer;
begin
  inherited;
  dtmManutencaoProdutos.LastPageOpened := pgcManutencaoProdutos.ActivePage;
end;

procedure TfrmManutencaoProdutos.fraConsultaAtributoedfCodigoEnter(
  Sender: TObject);
begin
  inherited;
  fraConsultaAtributo.edfCodigoEnter(Sender);
  vAtributoAnterior := fraConsultaAtributo.edfCodigo.text;
end;

procedure TfrmManutencaoProdutos.fraConsultaAtributoedfCodigoExit(
  Sender: TObject);
begin
  inherited;
  fraConsultaAtributo.edfCodigoExit(Sender);
  if vAtributoAnterior <> fraConsultaAtributo.edfCodigo.text then
  begin
    if fraConsultaAtributo.edfCodigo.text <> '' then
      sbnGerarClick(nil)
    else
    begin
      MensagemAviso('Informe o atributo para abrir a consulta!');
      fraConsultaAtributo.edfCodigo.setfocus;
    end;
  end;
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := (Acol > 3)
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosGetEditorProp(
  Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
begin
  inherited;
  {
  if Acol > 4 then
    if dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]) then
      if dtmManutencaoProdutos.qryListaAtributostipo.asString = 'Sim/Não' then
      begin
        TDBAdvGrid(sender).ClearComboString;
        TDBAdvGrid(sender).Combobox.Items.Append('Sim');
        TDBAdvGrid(sender).Combobox.Items.Append('Não');
      end;
      }

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  {
  if Acol > 4 then
    if dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]) then
      if dtmManutencaoProdutos.qryListaAtributostipo.asString = 'Sim/Não' then
        aEditor:=edComboList
        }
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_delete) and  (TDBAdvGrid(sender).Col > 3) then
  begin
    dtmManutencaoProdutos.qryManutencaoAtributos.edit;
    dtmManutencaoProdutos.qryManutencaoAtributos.fieldbyname(
       TDBAdvGrid(sender).cells[TDBAdvGrid(sender).Col,0]).clear;
  end;
      {{
  else


  if key = vk_space then
  begin
    TDBAdvGrid(Sender).datasource.dataset.edit;
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['selecionar'].index].AsBoolean := not
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['selecionar'].index].AsBoolean;
    TDBAdvGrid(Sender).datasource.dataset.post;

    if DBAdvManutencaoAtributos.FieldAtColumn[DBAdvManutencaoAtributos.ColumnByFieldName['selecionar'].index].AsBoolean then
      inc(dtmManutencaoProdutos.vmarcadosAtributos)
    else
      dec(dtmManutencaoProdutos.vmarcadosAtributos);

  end;
  }


end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
  inherited;
  if TDBAdvGrid(sender).Cells[Acol,0]<>'' then
  begin
  (*
    if (Acol > 4) then
    begin
//      if dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]) then
      begin
        if dtmManutencaoProdutos.qryListaAtributostipo.asString = 'Sim/Não' then
          HAlign :=  taCenter;
      end
    end
    else
    *)
    if (TDBAdvGrid(sender).datasource.dataset.fieldbyname(TDBAdvGrid(sender).Cells[Acol,0]).datatype in [ftBoolean, ftDate, ftTime, ftDateTime]) then
      HAlign :=  taCenter
    else
    if (TDBAdvGrid(sender).datasource.dataset.fieldbyname(TDBAdvGrid(sender).Cells[Acol,0]).datatype in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency]) then
        HAlign :=  taRightJustify;
  end;
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosCellChanging(
  Sender: TObject; OldRow, OldCol, NewRow, NewCol: Integer;
  var Allow: Boolean);
begin
  inherited;
  if newcol > 4 then
    dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[NewCol,0]);
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosClickCell(
  Sender: TObject; ARow, ACol: Integer);
begin
  inherited;
  if Acol > 4 then
    dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]);
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosDblClick(
  Sender: TObject);
begin
  inherited;
                                              {
    TDBAdvGrid(Sender).datasource.dataset.edit;
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['selecionar'].index].AsBoolean := not
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['selecionar'].index].AsBoolean;
    TDBAdvGrid(Sender).datasource.dataset.post;

    if DBAdvManutencaoAtributos.FieldAtColumn[DBAdvManutencaoAtributos.ColumnByFieldName['selecionar'].index].AsBoolean then
      inc(dtmManutencaoProdutos.vmarcadosatributos)
    else
      dec(dtmManutencaoProdutos.vmarcadosAtributos);
      }

end;

procedure TfrmManutencaoProdutos.ckbSelecionarTodosAtributosClick(
  Sender: TObject);

 var
 vRecno : integer;

begin
  inherited;

  DBAdvManutencaoAtributos.SaveGridPosition;

  with dtmManutencaoProdutos do
  begin

    vRecno := qryManutencaoAtributos.recno;
    qryManutencaoAtributos.DisableControls;

    qryManutencaoAtributos.first;
    while not qryManutencaoAtributos.eof do
    begin

      if qryManutencaoAtributos.fieldbyname('Selecionar').AsBoolean <> ckbSelecionarTodosAtributos.checked then
      begin
        qryManutencaoAtributos.edit;
        qryManutencaoAtributos.fieldbyname('Selecionar').AsBoolean := ckbSelecionarTodosAtributos.checked;
        qryManutencaoAtributos.post;

        if qryManutencaoAtributos.fieldbyname('Selecionar').AsBoolean then
          inc(vMarcadosAtributos)
        else
          dec(vMarcadosAtributos);

      end;


      qryManutencaoAtributos.next;

      vPosition :=  (qryManutencaoAtributos.RecNo * 100) / qryManutencaoAtributos.recordcount;

      AdvSmoothProgressBar1.visible := true;
      AdvSmoothProgressBar1.Appearance.ValueFormat := 'Marcando/desmarcando atributos dos produtos %.0f%%';
      AdvSmoothProgressBar1.Position := vPosition;

      Application.ProcessMessages;

    end;

    AdvSmoothProgressBar1.visible := false;

    qryManutencaoAtributos.enableControls;
    qryManutencaoAtributos.recno := vRecno;

  end;

  DBAdvManutencaoAtributos.RestoreGridPosition;

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaColumnSizing(
  Sender: TObject; ACol, ColumnSize: Integer);
begin
  inherited;

  try
    vColResized := ACol;
    DBAdvManutencaoAtributos.OnColumnSizing := nil;
    DBAdvManutencaoAtributos.ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width := TDBAdvGrid(Sender).ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width;
  finally
    DBAdvManutencaoAtributos.OnColumnSizing := DBAdvProdutosColumnSizing;
  end;

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosColumnSizing(
  Sender: TObject; ACol, ColumnSize: Integer);
begin
  inherited;

  try
    vColResized := ACol;
    DBAdvManutencaoAtributos_Linha.OnColumnSizing := nil;
    DBAdvManutencaoAtributos_Linha.ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width := TDBAdvGrid(Sender).ColumnByFieldName[TDBAdvGrid(Sender).Columns[Acol].fieldname].Width;
    DBAdvManutencaoAtributos_Linha.Repaint;
  finally
    DBAdvManutencaoAtributos_Linha.OnColumnSizing := DBAdvManutencaoAtributos_LinhaColumnSizing;
  end;

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  SincronizarLarguraColuna(DBAdvManutencaoAtributos_Linha, DBAdvManutencaoAtributos);
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributosMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  SincronizarLarguraColuna(DBAdvManutencaoAtributos, DBAdvManutencaoAtributos_Linha);
end;

procedure TfrmManutencaoProdutos.SincronizarTodasLarguraColuna(
  ColunaOrigem, ColunaDestino: TDBAdvGrid);
  var
  i: integer;
begin

  for i:=0 to ColunaOrigem.Columns.Count-1 do
  begin
    vColResized := i;
    SincronizarLarguraColuna(ColunaOrigem, ColunaDestino);
    vColResized := 0;
  end;

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := (Acol > 4);

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaCellChanging(
  Sender: TObject; OldRow, OldCol, NewRow, NewCol: Integer;
  var Allow: Boolean);
begin
  inherited;
  if newcol > 4 then
    dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[NewCol,0]);

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaClickCell(
  Sender: TObject; ARow, ACol: Integer);
begin
  inherited;
  if Acol > 4 then
    dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]);

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
  inherited;
  if TDBAdvGrid(sender).Cells[Acol,0]<>'' then
  begin
  (*
    if (Acol > 4) then
    begin
//      if dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]) then
      begin
        if dtmManutencaoProdutos.qryListaAtributostipo.asString = 'Sim/Não' then
          HAlign :=  taCenter;
      end
    end
    else
    *)
    if (TDBAdvGrid(sender).datasource.dataset.fieldbyname(TDBAdvGrid(sender).Cells[Acol,0]).datatype in [ftBoolean, ftDate, ftTime, ftDateTime]) then
      HAlign :=  taCenter
    else
    if (TDBAdvGrid(sender).datasource.dataset.fieldbyname(TDBAdvGrid(sender).Cells[Acol,0]).datatype in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency]) then
        HAlign :=  taRightJustify;
  end;

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaGetEditorProp(
  Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
begin
  inherited;
  if Acol > 4 then
  begin
    TDBAdvGrid(sender).Columns.Items[Acol].Editor := edCustom;
    TDBAdvGrid(sender).Columns.Items[Acol].EditLink := FormControlEditLink1;
  end;

  {
    if dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]) then
      if dtmManutencaoProdutos.qryListaAtributostipo.asString = 'Sim/Não' then
      begin
        TDBAdvGrid(sender).ClearComboString;
        TDBAdvGrid(sender).Combobox.Items.Append('Sim');
        TDBAdvGrid(sender).Combobox.Items.Append('Não');
      end;
  }

end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin

  inherited;
  {
  if Acol > 4 then
    if dtmManutencaoProdutos.PosicionarListaAtributos('nome',  TDBAdvGrid(sender).Cells[Acol,0]) then
      if dtmManutencaoProdutos.qryListaAtributostipo.asString = 'Sim/Não' then
        aEditor:=edComboList
  }

  PlannerDBDatePicker1.visible := false;
  DBAdvEdit.visible := false;
  DBAdvEditFloat.visible := false;
  DBMaplistCombobox1.visible := false;

  fraConsulta_.visible := false;
  fraConsultaContabil_.visible := false;


  PlannerDBDatePicker1.left := DBCheckBoxBoolean.width + 3;
  DBAdvEditFloat.left := DBCheckBoxBoolean.width + 3;
  DBAdvEdit.left := DBCheckBoxBoolean.width + 3;
  DBMaplistCombobox1.left := DBCheckBoxBoolean.width + 3;
  fraConsulta_.left := DBCheckBoxBoolean.width + 3;
  fraConsultaContabil_.left := DBCheckBoxBoolean.width + 3;

  DBCheckBoxBoolean.AllowGrayed := false;

  if dtmManutencaoProdutos.qryManutencaoAtributos_Linha.FindField('Nulo_'+TDBAdvGrid(Sender).Columns[Acol].FieldName)<>nil then
  begin
    DBCheckBoxBoolean.datafield := '';
    DBCheckBoxBoolean.DataSource := dtmManutencaoProdutos.dsrManutencaoAtributos_Linha;
    DBCheckBoxBoolean.datafield := 'Nulo_'+TDBAdvGrid(Sender).Columns[Acol].FieldName;
  end;

  if dtmManutencaoProdutos.dsrManutencaoAtributos.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).asString = 'Nulo' then
  begin
    if dtmManutencaoProdutos.dsrManutencaoAtributos.dataset.findfield(TDBAdvGrid(Sender).Columns[Acol].fieldname) <> nil then
      dtmManutencaoProdutos.dsrManutencaoAtributos.dataset.fieldbyname(TDBAdvGrid(Sender).Columns[Acol].fieldname).clear;
  end;

  if TDBAdvGrid(Sender).Columns[Acol].Field.DataType = ftDate then
  begin
    PlannerDBDatePicker1.datafield := '';
    PlannerDBDatePicker1.DataSource := dtmManutencaoProdutos.dsrManutencaoAtributos_Linha;
    PlannerDBDatePicker1.datafield := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    PlannerDBDatePicker1.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;
    PlannerDBDatePicker1.visible := true;
//    TDBAdvGrid(Sender).EditLink := FormControlEditLink1
  end
  else
  if TDBAdvGrid(Sender).Columns[Acol].Field.DataType = ftBoolean then
  begin

    DBCheckBoxBoolean.datafield := '';
    DBCheckBoxBoolean.DataSource := dtmManutencaoProdutos.dsrManutencaoAtributos_Linha;
    DBCheckBoxBoolean.datafield := TDBAdvGrid(Sender).Columns[Acol].FieldName;
    DBCheckBoxBoolean.AllowGrayed := true;
//    TDBAdvGrid(Sender).EditLink := FormControlEditLink1
  end
  else
  if (TDBAdvGrid(Sender).Columns[Acol].Field.DataType in [ftFloat, ftInteger]) then
  begin

    DBAdvEditFloat.datafield := '';
    DBAdvEditFloat.DataSource := dtmManutencaoProdutos.dsrManutencaoAtributos_Linha;
    DBAdvEditFloat.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBAdvEditFloat.visible := true;
    DBAdvEditFloat.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

  end
  else

  if (TDBAdvGrid(Sender).Columns[Acol].Field.DataType in [ftString, ftMemo]) then
  begin
    DBAdvEdit.datafield := '';
    DBAdvEdit.DataSource := dtmManutencaoProdutos.dsrManutencaoAtributos_Linha;
    DBAdvEdit.datafield := TDBAdvGrid(Sender).Columns[Acol].Fieldname;
    DBAdvEdit.EditType := etString;
    DBAdvEdit.visible := true;
    DBAdvEdit.width :=  TDBAdvGrid(Sender).Columns[Acol].Width - DBCheckBoxBoolean.width - 5;

  end;
end;

(*
procedure TfrmManutencaoProdutos.FormControlEditLink1SetEditorFocus(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  if TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType = ftDate then
    PlannerDBDatePicker1.setfocus
  else
  if TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType = ftBoolean then
    DBCheckBoxBoolean.setfocus
  else
  if (TDBAdvGrid(Grid).Columns[Grid.col].Field.DataType = ftFloat) or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'volumes_caracteristica') then
    DBAdvEditFloat.setfocus
  else
  if (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricao_produto') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricaoplanilhacusto_produto') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'nome_site_produto') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'referencia_produto') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricao_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'complemento_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'gtin_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'descricaonanf_caracteristica') then
    DBAdvEdit.setfocus
  else
  IF (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'discriminarcomposto_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'vendanegativa_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'vendanegativanosite_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'tipocomissao_caracteristica') or
     (TDBAdvGrid(Grid).Columns[Grid.col].FieldName = 'tipocomissaoindicador_caracteristica') then
    DBMaplistCombobox1.setfocus
  else
  if fraConsulta_.visible then
    fraConsulta_.edfcodigo.setfocus
  else
  if fraConsultaContabil_.visible then
    fraConsultaContabil_.edfcodigo.setfocus;


end;
*)

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_delete) and  (TDBAdvGrid(sender).Col > 3) then
  begin
    dtmManutencaoProdutos.qryManutencaoAtributos_Linha.edit;
    dtmManutencaoProdutos.qryManutencaoAtributos_linha.fieldbyname(
       TDBAdvGrid(sender).cells[TDBAdvGrid(sender).Col,0]).clear;

  end {
  else
  if (key = vk_return) and  (TDBAdvGrid(sender).Col > 4) then
    DBAdvManutencaoAtributos_Linha.ShowInplaceEdit};

       (*
  end


  else


  if key = vk_space then
  begin
    TDBAdvGrid(Sender).datasource.dataset.edit;
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['selecionar'].index].AsBoolean := not
    TDBAdvGrid(Sender).FieldAtColumn[TDBAdvGrid(Sender).ColumnByFieldName['selecionar'].index].AsBoolean;
    TDBAdvGrid(Sender).datasource.dataset.post;

    if DBAdvManutencaoAtributos.FieldAtColumn[DBAdvManutencaoAtributos.ColumnByFieldName['selecionar'].index].AsBoolean then
      inc(dtmManutencaoProdutos.vmarcadosAtributos)
    else
      dec(dtmManutencaoProdutos.vmarcadosAtributos);
         *)
//  end;

end;

procedure TfrmManutencaoProdutos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
  vk_f5: if sbnAlterar.enabled then sbnAlterarClick(nil);
  vk_f6: if sbnGerar.enabled then sbnGerarClick(nil);
  vk_f7: if sbnAplicar.enabled then sbnAplicarClick(nil);
  end;
end;

procedure TfrmManutencaoProdutos.DBAdvManutencaoAtributos_LinhaSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
//   if CanEdit then
//     DBAdvManutencaoAtributos_Linha.ShowInplaceEdit;

end;

end.


fALTA AVISAR SE TEM PENDENCIA DE GRAVAÇÃO NOS ATRIBUTOS
GRAVAR NO BANCO OS ATRIBUTOS

