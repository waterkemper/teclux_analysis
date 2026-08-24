unit fmImpostos;

interface

uses
  Windows, Messages, SysUtils, fmcadastropadrao, StdCtrls, Graphics, Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, ComCtrls, cppagecontrol, Buttons,
  ToolWin, Controls, ExtCtrls, Classes, Variants, Forms,
  Dialogs, dmimpostos, DBCtrls, cpdbmemo, frmctrllink, frconsulta,
  frconsultacodigo, ctconstantes;

type
  TfrmImpostos = class(TFrmCadastroPadrao)
    dbgtrib_imposto: TDBAdvGrid;
    dbgtrib_imposto_situacao: TDBAdvGrid;
    dbgtrib_imposto_classtrib: TDBAdvGrid;
    dbgRegras: TDBAdvGrid;
    gbxImpostos: TGroupBox;
    gbxRegrasImpostos: TGroupBox;
    pgcCriterios: TtecPageControl;
    tstNaturezasdeOperacao: TTabSheet;
    tstListasNCM: TTabSheet;
    dbgNaturezasdeOperacoes: TDBAdvGrid;
    dbgtrib_grupo_ncm: TDBAdvGrid;
    dbgtrib_grupo_ncm_itens: TDBAdvGrid;
    tstEstadosdeDestino: TTabSheet;
    dbgEstadosDestino: TDBAdvGrid;
    dbgCodigosFiscais: TDBAdvGrid;
    tstParametrosGerais: TTabSheet;
    gbxFinalidade: TGroupBox;
    DBAdvGrid7: TDBAdvGrid;
    gbxtrib_regime_interno: TGroupBox;
    dbgtrib_regime_interno: TDBAdvGrid;
    gbxDesstinatarioContribICMS: TGroupBox;
    CKBsIMDesstinatarioContribICMS: TDBCheckBox;
    ckbNaoDesstinatarioContribICMS: TDBCheckBox;
    gbxDestinatarioOrgaoPublico: TGroupBox;
    ckbSimDestinatarioOrgaoPublico: TDBCheckBox;
    ckbNaoDestinatarioOrgaoPublico: TDBCheckBox;
    gbxDestinatarioConsumidorFinal: TGroupBox;
    ckbSimDestinatarioConsumidorFinal: TDBCheckBox;
    ckbNaoDestinatarioConsumidorFinal: TDBCheckBox;
    gbxProducaoPropria: TGroupBox;
    ckbSimProducaoPropria: TDBCheckBox;
    ckbNaoProducaoPropria: TDBCheckBox;
    gbxOrigemMercadoria: TGroupBox;
    dbgOrigemMercadorias: TDBAdvGrid;
    tstModBC: TTabSheet;
    gbxmodalidadebc_icms: TGroupBox;
    dbgmodalidadebc_icms: TDBAdvGrid;
    gbxmodalidadebc_icmsst: TGroupBox;
    dbgmodalidadebc_icmsst: TDBAdvGrid;
    gbxtrib_tipodocumento: TGroupBox;
    dbgtrib_tipodocumento: TDBAdvGrid;
    gbxObservacoes: TGroupBox;
    mmoobservacao: TtecDBMemo;
    pnlOpcoesTrib_Regra: TPanel;
    btnIncluirTrib_Regra: TSpeedButton;
    btnExcluirTrib_Regra: TSpeedButton;
    pnltrib_grupo_ncm: TPanel;
    btnIncluirtrib_grupo_ncm: TSpeedButton;
    btnExcluirtrib_grupo_ncm: TSpeedButton;
    pnltrib_grupo_ncm_itens: TPanel;
    btnIncluirtrib_grupo_ncm_itens: TSpeedButton;
    btnExcluirtrib_grupo_ncm_itens: TSpeedButton;
    fraConsultaClassificacaoIPI: TfraConsultaCodigo;
    FormControlEditLink1: TFormControlEditLink;
    tstDefinicao: TTabSheet;
    tstEventos: TTabSheet;
    gbxEventos: TGroupBox;
    DBAdvGrid1: TDBAdvGrid;
    gbxEstadosDestino: TGroupBox;
    gbxEstadosdeOrigem: TGroupBox;
    DBAdvGrid2: TDBAdvGrid;
    GroupBox1: TGroupBox;
    DBAdvGrid3: TDBAdvGrid;
    gbxRegimeApuracaoEmissor: TGroupBox;
    dbgRegimeApuracaoEmissor: TDBAdvGrid;
    Timer1: TTimer;
    gbxTiposProduto: TGroupBox;
    dbgTiposProduto: TDBAdvGrid;
    gbxListaNCMs: TGroupBox;
    procedure btnIncluirTrib_RegraClick(Sender: TObject);
    procedure btnExcluirTrib_RegraClick(Sender: TObject);
    procedure dbgRegrasCanAddRow(Sender: TObject; var CanAdd: Boolean);
    procedure dbgRegrasCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure dbgRegrasRowMove(Sender: TObject; ARow: Integer;
      var Allow: Boolean);
    procedure dbgRegrasRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure dbgRegrasRowMoving(Sender: TObject; ARow: Integer;
      var Allow: Boolean);
    procedure btnIncluirtrib_grupo_ncmClick(Sender: TObject);
    procedure btnExcluirtrib_grupo_ncmClick(Sender: TObject);
    procedure btnExcluirtrib_grupo_ncm_itensClick(Sender: TObject);
    procedure btnIncluirtrib_grupo_ncm_itensClick(Sender: TObject);
    procedure dbgRegrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraConsultaClassificacaoIPIedfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgtrib_grupo_ncm_itensGetEditorProp(Sender: TObject; ACol,
      ARow: Integer; AEditLink: TEditLink);
    procedure dbgtrib_grupo_ncm_itensGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure FormControlEditLink1GetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLink1SetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink1SetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink1SetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure dbgtrib_imposto_situacaoGridWideHint(Sender: TObject; ARow,
      ACol: Integer; var hintstr: WideString);
    procedure dbgtrib_imposto_classtribGridWideHint(Sender: TObject; ARow,
      ACol: Integer; var hintstr: WideString);
    procedure dbgtrib_imposto_classtribCustomCellBkgDraw(Sender: TObject;
      Canvas: TCanvas; ACol, ARow: Integer; AState: TGridDrawState;
      ARect: TRect; Printing: Boolean);
    procedure dbgtrib_imposto_classtribGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure dbgtrib_imposto_situacaoGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure dbgtrib_imposto_classtribDblClick(Sender: TObject);
    procedure dbgRegrasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure dbgtrib_imposto_situacaoSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure dbgtrib_imposto_classtribSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
//    FHintMap: TDictionary<string, string>;
//    procedure BuildHintMap;
    procedure NCMAntesAbrir;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    function  InternoGravar: Boolean; Override;

  end;

var
  frmImpostos: TfrmImpostos;

implementation

{$R *.dfm}

{ TfrmImpostos }

constructor TfrmImpostos.Create(AOwner: TComponent);
begin
  inherited;
  dtmImpostos := TdtmImpostos.create(self);
  dataset := dtmImpostos.qryTrib_Imposto;

  fraConsultaClassificacaoIPI.TipoPesquisa:= pesNCMTABELAIPI;
  fraConsultaClassificacaoIPI.CondicoesdaConsulta:= NCMAntesAbrir;


//  FHintMap := TDictionary<string, string>.Create;
//  BuildHintMap;

end;

procedure TfrmImpostos.btnIncluirTrib_RegraClick(Sender: TObject);
begin
  inherited;
//  dtmImpostos.dsrTrib_Regra.DataSet.DisableControls;
  dtmImpostos.dsrTrib_Regra.DataSet.append;
//  dtmImpostos.dsrTrib_Regra.DataSet.EnableControls;
//  dtmImpostos.dsrTrib_Regra.DataSet.last;
end;

procedure TfrmImpostos.btnExcluirTrib_RegraClick(Sender: TObject);
begin
  inherited;
  if not dbgRegras.DataSource.DataSet.isempty then
    dbgRegras.DataSource.DataSet.delete;

end;

procedure TfrmImpostos.dbgRegrasCanAddRow(Sender: TObject;
  var CanAdd: Boolean);
begin
  inherited;
  CanAdd := True;
end;

procedure TfrmImpostos.dbgRegrasCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  Canedit := True;
end;

procedure TfrmImpostos.dbgRegrasRowMove(Sender: TObject; ARow: Integer;
  var Allow: Boolean);
begin
  inherited;
;
end;

procedure TfrmImpostos.dbgRegrasRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
;
end;

procedure TfrmImpostos.dbgRegrasRowMoving(Sender: TObject; ARow: Integer;
  var Allow: Boolean);
begin
  inherited;
;
end;

procedure TfrmImpostos.NCMAntesAbrir;
begin
  if fraConsultaClassificacaoIPI.edfCodigo.Text <> '' then
    fraConsultaClassificacaoIPI.qryConsultaNCMTabela.Locate('codigotipi',fraConsultaClassificacaoIPI.edfCodigo.Text,[])

end;

procedure TfrmImpostos.btnIncluirtrib_grupo_ncmClick(Sender: TObject);
begin
  inherited;
  dtmImpostos.dsrtrib_grupo_ncm.DataSet.append;
end;

procedure TfrmImpostos.btnExcluirtrib_grupo_ncmClick(Sender: TObject);
begin
  inherited;
  dtmImpostos.dsrtrib_grupo_ncm.DataSet.delete;
end;

procedure TfrmImpostos.btnExcluirtrib_grupo_ncm_itensClick(
  Sender: TObject);
begin
  inherited;
  dtmImpostos.dsrtrib_grupo_ncm_itens.DataSet.delete;
end;

procedure TfrmImpostos.btnIncluirtrib_grupo_ncm_itensClick(
  Sender: TObject);
begin
  inherited;
  dtmImpostos.dsrtrib_grupo_ncm_itens.DataSet.append;
end;

procedure TfrmImpostos.dbgRegrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = vk_delete) then
  begin
    if TDBAdvGrid(Sender).Col = TDBAdvGrid(Sender).ColumnByFieldName['vigencia_inicio'].Index then
      dtmImpostos.dsrTrib_Regra.dataSet.FieldByName('vigencia_inicio').Clear
    else
    if TDBAdvGrid(Sender).Col = TDBAdvGrid(Sender).ColumnByFieldName['vigencia_fim'].Index then
      dtmImpostos.dsrTrib_Regra.dataSet.FieldByName('vigencia_fim').Clear
    else
    if TDBAdvGrid(Sender).Col = TDBAdvGrid(Sender).ColumnByFieldName['modo_calculolookup'].Index then
    begin
      dtmImpostos.dsrTrib_Regra.dataSet.FieldByName('modo_calculolookup').Clear;
      dtmImpostos.dsrTrib_Regra.dataSet.FieldByName('modo_calculo').Clear;
    end
  end;
end;

procedure TfrmImpostos.fraConsultaClassificacaoIPIedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaClassificacaoIPI.edfCodigoKeyDown(Sender, Key, Shift);
  if (key = vk_escape) then
    dbgtrib_grupo_ncm_itens.HideInplaceEdit;

end;

procedure TfrmImpostos.dbgtrib_grupo_ncm_itensGetEditorProp(
  Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
begin
  inherited;
  //if TDBAdvGrid(Sender).Col = TDBAdvGrid(Sender).ColumnByFieldName['ncm'].Index then
  //  FormControlEditLink1.control.SetFocus;
end;

procedure TfrmImpostos.dbgtrib_grupo_ncm_itensGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
//  if TDBAdvGrid(Sender).Col = TDBAdvGrid(Sender).ColumnByFieldName['ncm'].Index then
//    FormControlEditLink1.control.SetFocus;

end;

procedure TfrmImpostos.FormControlEditLink1GetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  inherited;
;
end;

procedure TfrmImpostos.FormControlEditLink1SetEditorFocus(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
  fraConsultaClassificacaoIPI.edfcodigo.SetFocus;
end;

procedure TfrmImpostos.FormControlEditLink1SetEditorProperties(
  Sender: TObject; Grid: TAdvStringGrid; AControl: TWinControl);
begin
  inherited;
;
end;

procedure TfrmImpostos.FormControlEditLink1SetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
var
  vok: Boolean;
begin
  inherited;
  vok := False;
  if dtmImpostos.qrytrib_grupo_ncm_itens.locate('ncm', AValue, []) then
    vok := true;

end;

function TfrmImpostos.InternoGravar: Boolean;
begin
  dtmImpostos.GravarRegra(

      CKBsIMDesstinatarioContribICMS.Checked,
      ckbNaoDesstinatarioContribICMS.Checked,
      ckbSimDestinatarioOrgaoPublico.Checked,
      ckbNaoDestinatarioOrgaoPublico.Checked,
      ckbSimDestinatarioConsumidorFinal.Checked,
      ckbNaoDestinatarioConsumidorFinal.Checked

  );
end;

procedure TfrmImpostos.dbgtrib_imposto_situacaoGridWideHint(
  Sender: TObject; ARow, ACol: Integer; var hintstr: WideString);
begin
  inherited;
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gibscbs' then
     hintstr := 'ind_gibscbs: há incidência de IBS/CBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gibscbsmono' then
     hintstr := 'ind_gibscbsmono: Incidência de IBS/CBS monofásico'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gred' then
     hintstr := 'ind_gred: Gera crédito de IBS/CBS para quem esta adquirindo'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gdif' then
     hintstr := 'ind_gdif: Há diferimento do IBS/CBS, ou seja, se o fato gerador ocorre agora, mas o recolhimento fica postergado para uma etapa futura da cadeia'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gtransfcred' then
     hintstr := 'ind_gtransfcred: Há transferência de crédito de IBS/CBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gcredpresibszfm' then
     hintstr := 'ind_gcredpresibszfm: Gera ou mantém crédito presumido de IBS/CBS (regime ZFM)'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gajustecompet' then
     hintstr := 'ind_gajustecompet: Gera ajuste por competência'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_redutorbc' then
     hintstr := 'ind_redutorbc: Há redução da base de cálculo';
end;



destructor TfrmImpostos.Destroy;
begin
//  FreeAndNil(FHintMap);
  inherited;
end;

procedure TfrmImpostos.dbgtrib_imposto_classtribGridWideHint(
  Sender: TObject; ARow, ACol: Integer; var hintstr: WideString);
begin
  inherited;

  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'cst_ibs_cbs' then
     hintstr := 'cst_ibs_cbs: Código da Situação Tributária do IBS/CBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'descricao_cst_ibs_cbs' then
     hintstr := 'descricao_cst_ibs_cbs: Descrição da Situação Tributária do IBS/CBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'cclass_trib' then
     hintstr := 'cclass_trib: Código da Classificação Tributária (cClassTrib)'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'nome_cclass_trib' then
     hintstr := 'nome_cclass_trib: Nome resumido da Classificação Tributária'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'descricao_cclass_trib' then
     hintstr := 'descricao_cclass_trib: Descrição detalhada da Classificação Tributária'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'lc_redacao' then
     hintstr := 'lc_redacao: Trecho da redação legal aplicável (Lei Complementar)'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'lc_214_25' then
     hintstr := 'lc_214_25: Referência ao artigo da LC 214/2025'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'tipo_aliquota' then
     hintstr := 'tipo_aliquota: Tipo de alíquota aplicável à operação'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'pred_ibs' then
     hintstr := 'pred_ibs: Percentual de redução da base de cálculo do IBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'pred_cbs' then
     hintstr := 'pred_cbs: Percentual de redução da base de cálculo da CBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gtribregular' then
     hintstr := 'ind_gtribregular: Indica tributação regular do IBS/CBS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gcredpresoper' then
     hintstr := 'ind_gcredpresoper: Indica geração ou preservação de crédito na operação'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gmonopadrao' then
     hintstr := 'ind_gmonopadrao: Indica regime monofásico padrão'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gmonoreten' then
     hintstr := 'ind_gmonoreten: Indica monofásico com retenção'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gmonoret' then
     hintstr := 'ind_gmonoret: Indica monofásico com recolhimento antecipado'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gmonodif' then
     hintstr := 'ind_gmonodif: Indica monofásico com diferimento'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'ind_gestornocred' then
     hintstr := 'ind_gestornocred: Indica exigência de estorno de crédito'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'dinivig' then
     hintstr := 'dinivig: Data inicial de vigência da classificação'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'dfimvig' then
     hintstr := 'dfimvig: Data final de vigência da classificação'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'data_atualizacao' then
     hintstr := 'data_atualizacao: Data da última atualização do registro'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfeabi' then
     hintstr := 'indnfeabi: Aplicável à NF-e de energia elétrica'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfe' then
     hintstr := 'indnfe: Aplicável à NF-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfce' then
     hintstr := 'indnfce: Aplicável à NFC-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indcte' then
     hintstr := 'indcte: Aplicável ao CT-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indcteos' then
     hintstr := 'indcteos: Aplicável ao CT-e OS'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indbpe' then
     hintstr := 'indbpe: Aplicável ao BP-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indbpeta' then
     hintstr := 'indbpeta: Aplicável ao BP-e Transporte Aquaviário'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indbpetm' then
     hintstr := 'indbpetm: Aplicável ao BP-e Transporte Multimodal'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnf3e' then
     hintstr := 'indnf3e: Aplicável à NF3-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfse' then
     hintstr := 'indnfse: Aplicável à NFS-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfse_via' then
     hintstr := 'indnfse_via: Via ou modelo específico da NFS-e'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfcom' then
     hintstr := 'indnfcom: Aplicável à NFCom'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfag' then
     hintstr := 'indnfag: Aplicável à NFAg'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'indnfgas' then
     hintstr := 'indnfgas: Aplicável à NFGás'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'inddere' then
     hintstr := 'inddere: Aplicável à DERE (Regimes Especiais)'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'anexo' then
     hintstr := 'anexo: Anexo legal relacionado à classificação'
  else
  if TDBAdvGrid(Sender).Columns[ACol].FieldName = 'link' then
     hintstr := 'link: Link para norma ou documentação oficial';

end;

procedure TfrmImpostos.dbgtrib_imposto_classtribCustomCellBkgDraw(
  Sender: TObject; Canvas: TCanvas; ACol, ARow: Integer;
  AState: TGridDrawState; ARect: TRect; Printing: Boolean);
var
  Grid: TDBAdvGrid;
begin
(*
  Grid := Sender as TDBAdvGrid;

  // Ignora cabeçalho
  if ARow = 0 then
    Exit;

  // Mantém o destaque de seleção
  if gdSelected in AState then
  begin
    Canvas.Brush.Color := clHighlight;
    Canvas.FillRect(ARect);
    Exit;
  end;

  // Segurança
  if not Assigned(Grid.DataSource) then Exit;
  if not Grid.DataSource.DataSet.Active then Exit;

  // Regra: pinta a LINHA inteira se is_default = true
  if Grid.ColumnByFieldName['is_default'].Field.AsBoolean then
  begin
    Canvas.Brush.Color := $00E6FFE6; // verde claro
    Canvas.FillRect(ARect);
  end;
  *)
end;

procedure TfrmImpostos.dbgtrib_imposto_classtribGetCellColor(
  Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState;
  ABrush: TBrush; AFont: TFont);
var
  Valor: Boolean;
  Grid: TDBAdvGrid;

begin

  Grid := Sender as TDBAdvGrid;

  // Ignora cabeçalho
  if ARow = 0 then
    Exit;

  // Ignorar linhas fixas (cabeçalho)
  if ARow < grid.FixedRows then Exit;

  // Pegar o valor de uma coluna específica para basear a cor
  // Supondo que a coluna 3 (índice 3) contém o valor "Ativo" ou "Inativo"
//  Valor := Grid.Cell Properties [Grid.ColumnByFieldName['is_default'].Index, ARow];

//  Grid.GetCheckBoxState(Grid.ColumnByFieldName['is_default'].Index, ARow, Valor);

//  cells[column, row]
  Valor :=  grid.cells[Grid.ColumnByFieldName['cclasstrib'].Index, ARow] =
            dbgRegras.cells[dbgregras.ColumnByFieldName['cclasstrib'].index,
                           dbgregras.Row];

//  Valor := Grid.cells[grid.ColumnByFieldName['codigo'].index, Arow]=
//           dtmImpostos.qryTrib_Impostocodigo_cst_default.asString;


  if Valor then
  begin
    ABrush.Color := clGreen;      // Cor de fundo vermelha
    AFont.Color := clWhite;     // Cor da fonte branca
    AFont.Style := [fsBold];    // Fonte em negrito
  end;
end;

procedure TfrmImpostos.dbgtrib_imposto_situacaoGetCellColor(
  Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState;
  ABrush: TBrush; AFont: TFont);

var
  Valor: Boolean;
  Grid: TDBAdvGrid;

begin

  Grid := Sender as TDBAdvGrid;

  // Ignora cabeçalho
  if ARow = 0 then
    Exit;

  // Ignorar linhas fixas (cabeçalho)
  if ARow < grid.FixedRows then Exit;

  // Pegar o valor de uma coluna específica para basear a cor
  // Supondo que a coluna 3 (índice 3) contém o valor "Ativo" ou "Inativo"


//  Grid.GetCheckBoxState(Grid.ColumnByFieldName['is_default'].Index, ARow, Valor);


  Valor := Grid.cells[grid.ColumnByFieldName['id_situacao'].index, Arow]=
           dbgRegras.cells[dbgregras.ColumnByFieldName['id_situacao'].index,
                           dbgregras.Row];

//           dtmImpostos.qryTrib_Regracodigo_cst.asString;

{

  Valor := (dtmImpostos.qryTrib_Impostocodigo_cst_default.asString =
            dtmImpostos.qrytrib_imposto_situacaocodigo.asString);

}

//  cells[column, row]
//  Valor := Grid.ColumnByFieldName['is_default'].Field.AsString;

  if Valor then
  begin
    ABrush.Color := clGreen;      // Cor de fundo vermelha
    AFont.Color := clWhite;     // Cor da fonte branca
    AFont.Style := [fsBold];    // Fonte em negrito
  end;

end;


procedure TfrmImpostos.dbgtrib_imposto_classtribDblClick(Sender: TObject);
var
  vid_regra, vid_situacao, vid_classtrib: String;
begin
  inherited;

  vid_regra := dbgRegras.Cells[dbgRegras.ColumnByFieldName['id_regra'].index, dbgRegras.Row];
  if vid_regra <> dtmImpostos.qryTrib_Regraid_regra.AsString then
    if vid_regra<>'' then
      dtmImpostos.qryTrib_Regra.Locate('id_regra', vid_regra, []);

  vid_situacao := dbgtrib_imposto_situacao.Cells[dbgtrib_imposto_situacao.ColumnByFieldName['id_situacao'].index, dbgtrib_imposto_situacao.Row];
  if vid_situacao <> dtmImpostos.qrytrib_imposto_situacaoid_situacao.AsString then
    if vid_situacao<>'' then
      dtmImpostos.qrytrib_imposto_situacao.Locate('id_situacao', vid_situacao, []);

  vid_classtrib := dbgtrib_imposto_classtrib.Cells[dbgtrib_imposto_classtrib.ColumnByFieldName['cclasstrib'].index, dbgtrib_imposto_classtrib.Row];
  if vid_classtrib <> dtmImpostos.qrytrib_imposto_classtribid_classtrib.AsString then
    if vid_classtrib <>'' then
      dtmImpostos.qrytrib_imposto_classtrib.Locate('cclasstrib', vid_classtrib, []);


  dtmImpostos.Setartrib_imposto_ClassTrib;
  dbgtrib_imposto_classtrib.repaint;
  dbgtrib_imposto_situacao.repaint;

end;

procedure TfrmImpostos.dbgRegrasSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  vid_situacao, vcclasstrib: String;
begin
  inherited;

  if TDBAdvGrid(Sender).RowCount > 0 then
  begin
    vid_situacao := TDBAdvGrid(Sender).Cells[TDBAdvGrid(Sender).ColumnByFieldName['id_situacao'].index, ARow];
    vcclasstrib  := TDBAdvGrid(Sender).Cells[TDBAdvGrid(Sender).ColumnByFieldName['cclasstrib'].index, ARow];
    dtmImpostos.qrytrib_imposto_situacao.locate('id_situacao', vid_situacao, []);
    dtmImpostos.qrytrib_imposto_classtrib.locate('cclasstrib', vcclasstrib, []);
  end;
  
end;

procedure TfrmImpostos.dbgtrib_imposto_situacaoSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  vid_situacao: String;
begin
  inherited;
  (*
  if TDBAdvGrid(Sender).RowCount > 0 then
  begin
    try
      TDBAdvGrid(Sender).OnSelectCell := nil;
      vid_situacao := TDBAdvGrid(Sender).Cells[TDBAdvGrid(Sender).ColumnByFieldName['id_situacao'].index, ARow];
      //vid_situacao := TDBAdvGrid(Sender).datasource.dataset.fieldbyname('id_situacao').asString;
      if vid_situacao <> dtmImpostos.qrytrib_imposto_situacaoid_situacao.AsString then
        if vid_situacao<>'' then
          dtmImpostos.qrytrib_imposto_situacao.Locate('id_situacao', vid_situacao, [])
    finally
      TDBAdvGrid(Sender).OnSelectCell := dbgtrib_imposto_situacaoSelectCell;
    end;
  end;
  *)
end;

procedure TfrmImpostos.dbgtrib_imposto_classtribSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  vid_classtrib: String;
begin
  inherited;
  {
  if TDBAdvGrid(Sender).RowCount > 0 then
  begin
    vid_classtrib := TDBAdvGrid(Sender).Cells[TDBAdvGrid(Sender).ColumnByFieldName['id_classtrib'].index, ARow];
    if vid_classtrib <> dtmImpostos.qrytrib_imposto_classtribid_classtrib.AsString then
      if vid_classtrib <>'' then
        dtmImpostos.qrytrib_imposto_classtrib.Locate('id_classtrib', vid_classtrib, [])
  end;
  }
end;


procedure TfrmImpostos.Timer1Timer(Sender: TObject);
begin
  inherited;
  if (dbgtrib_imposto_classtrib.RowCount >= 2) and (dbgtrib_imposto_classtrib.Cells[1,1]<>'') then
  begin
    if dbgtrib_imposto_classtrib.height <> 158 then
    begin
      dbgtrib_imposto_classtrib.height := 158;
      dbgtrib_imposto_classtrib.repaint;
      dbgtrib_imposto_situacao.repaint;
    end;
  end
  else
  begin
    if dbgtrib_imposto_classtrib.height <> 0 then
    begin
      dbgtrib_imposto_classtrib.height := 0; 
      dbgtrib_imposto_classtrib.repaint;
      dbgtrib_imposto_situacao.repaint;
    end;
  end;


end;

end.
