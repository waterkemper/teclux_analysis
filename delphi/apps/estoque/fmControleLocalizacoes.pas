unit fmControleLocalizacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls,
  frconsulta, frconsultacodigo, StdCtrls, dmControleLocalizacoes, ctconstantes,
  DB, ZQuery, ZPgSqlQuery, cpquery, cptexto, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, DBGrids, cpdbgrid, clparametrossistema, biblio,
  AdvPageControl, ccedlink, AdvQueryDialog, AdvEdit, frmctrllink, DBAdvEd;

type
  TfrmControleLocalizacoes = class(TFrmCadastroPadrao)
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxLocalizacoes: TGroupBox;
    fraConsultaLocalizacoes: TfraConsultaCodigo;
    gbxSubLocalizacoes: TGroupBox;
    fraConsultaSubLocalizacoes: TfraConsultaCodigo;
    gbxCodigoBarras: TGroupBox;
    gbxProdutosSelecionados: TGroupBox;
    sbnGerar: TSpeedButton;
    pnlParametros: TPanel;
    pnlLeitura: TPanel;
    Timer1: TTimer;
    dbgProdutosLocalizacao: TDBAdvGrid;
    fraConsultaEstoqueitemPRODUTOS: TfraConsultaCodigo;
    pnlLabels: TPanel;
    sbnExcluirSomenteUmRegistros: TSpeedButton;
    sbnExcluirTodosRegistros: TSpeedButton;
    AdvPageControlControleLocalizacoes: TAdvPageControl;
    AdvTabSheetCadastroLocalizacao: TAdvTabSheet;
    AdvTabSheetEtiquetasLocalizacao: TAdvTabSheet;
    DBAdvGridLocalizacoes: TDBAdvGrid;
    gbxLocSubLoc: TGroupBox;
    edtLocSubLoc: TEditTexto;
    DBAdvGridLocalizacoesTop: TDBAdvGrid;
    pnlTopEtiquetasLocalizacao: TGroupBox;
    FormControlEditLink1: TFormControlEditLink;
    DBAdvEdit1: TDBAdvEdit;
    ckbSelecionarTodos: TCheckBox;
    pnlBottomEtiquetasLocalizacao: TPanel;
    sbnImprimir: TSpeedButton;
    gbxModeloEtiqueta: TGroupBox;
    fraConsultaModelosEtiquetas: TfraConsultaCodigo;
    ckbSelecionarTodasSubLocalizacoes: TCheckBox;
    ckbSelecionarTodasLocalizacoes: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure fraConsultaEstoqueitemPRODUTOSedfCodigoKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnExcluirSomenteUmRegistrosClick(Sender: TObject);
    procedure sbnExcluirTodosRegistrosClick(Sender: TObject);
    procedure fraConsultaLocalizacoesedfCodigoChange(Sender: TObject);
    procedure fraConsultaSubLocalizacoesedfCodigoChange(Sender: TObject);
    procedure dbgProdutosLocalizacaoCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure AdvPageControlControleLocalizacoesChange(Sender: TObject);
    procedure DBAdvGridLocalizacoesCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure edtLocSubLocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBAdvEdit1Change(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure ckbSelecionarTodasSubLocalizacoesClick(Sender: TObject);
    procedure ckbSelecionarTodasLocalizacoesClick(Sender: TObject);
  private
    { Private declarations }
    procedure CondicaoConsultaLocalizacoes;
    procedure CondicaoConsultaSubLocalizacoes;
    procedure CondicoesConsultaEstoqueItemProduto;
    procedure CondicoesModeloEtiqueta;
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     procedure KeyDown(var Key: Word; Shift: TShiftState); override;
     function  InternoGravar: Boolean; override;
  end;

var
  frmControleLocalizacoes: TfrmControleLocalizacoes;

implementation

{$R *.dfm}

{ TfrmControleLocalizacoes }

constructor TfrmControleLocalizacoes.Create(AOwner: TComponent);
begin
  dtmControleLocalizacoes := TdtmControleLocalizacoes.Create(Self);
  inherited;
  dataset := dtmControleLocalizacoes.qryLocalizacao;
  
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaFilial.edfCodigo.Text := inttostr(dtmControleLocalizacoes.FilialBase);
  fraConsultaFilial.edfCodigo.exist;

  fraConsultaLocalizacoes.TipoPesquisa := pesLOCALIZACAOESTOQUE;
  fraConsultaLocalizacoes.CondicoesdaConsulta := CondicaoConsultaLocalizacoes;

  fraConsultaSubLocalizacoes.TipoPesquisa := pesSUBLOCALIZACAOESTOQUE;
  fraConsultaSubLocalizacoes.CondicoesdaConsulta := CondicaoConsultaSubLocalizacoes;

  fraConsultaEstoqueitemPRODUTOS.TipoPesquisa := pesEstoqueItemProdutos;

  fraConsultaEstoqueitemPRODUTOS.CondicoesdaConsulta := CondicoesConsultaEstoqueItemProduto;


  dbgProdutosLocalizacao.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));

//  dbgProdutosLocalizacao.AutoNumberRow(0);
  dbgProdutosLocalizacao.AutoNumberCol(0);

  AdvPageControlControleLocalizacoes.activepageindex := 0;

  fraConsultaModelosEtiquetas.TipoPesquisa := pesMODELOETIQUETA;
  fraConsultaModelosEtiquetas.CondicoesdaConsulta := CondicoesModeloEtiqueta;

end;

destructor TfrmControleLocalizacoes.Destroy;
begin

  inherited;
end;

procedure TfrmControleLocalizacoes.Timer1Timer(Sender: TObject);
begin
  inherited;
  sbnGerar.enabled := (fraConsultaFilial.edfcodigo.text <> '') and
                      ((fraConsultaLocalizacoes.edfcodigo.text <> '') or
                       (fraConsultaSubLocalizacoes.edfcodigo.text <> ''));

//  gbxCodigoBarras.enabled := dtmControleLocalizacoes.qryProdutosLocalizacao.Active;

  sbnExcluirSomenteUmRegistros.enabled := not dtmControleLocalizacoes.qryProdutosLocalizacao.IsEmpty;
  sbnExcluirTodosRegistros.enabled := not dtmControleLocalizacoes.qryProdutosLocalizacao.IsEmpty;

  sbnImprimir.enabled := (AdvPageControlControleLocalizacoes.activepage = AdvTabSheetEtiquetasLocalizacao)
                   and (dtmControleLocalizacoes.qryPesquisarLocalizacoesqtmarcados.asinteger <> 0);
                    
end;

procedure TfrmControleLocalizacoes.sbnGerarClick(Sender: TObject);
begin
  inherited;
  dtmControleLocalizacoes.gerarConsultaLocalizacoes(
    fraConsultaFilial.edfcodigo.text,
    TRIM(fraConsultaLocalizacoes.edfcodigo.text),
    trim(fraConsultaSubLocalizacoes.edfcodigo.text));

//  dbgProdutosLocalizacao.AutoNumberRow(0);
  dbgProdutosLocalizacao.AutoNumberCol(0);
  dbgProdutosLocalizacao.autosize := True;
  dbgProdutosLocalizacao.Refresh;
  dbgProdutosLocalizacao.autosize := False;

end;

procedure TfrmControleLocalizacoes.CondicaoConsultaLocalizacoes;
begin
  fraConsultaLocalizacoes.qryProcuraLocalizacaoEstoque.macrobyname('SQL').asSTring :=
   ' and e.filial = '+fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asString;

  fraConsultaLocalizacoes.qryConsultaLocalizacaoEstoque.macrobyname('SQL').asSTring :=
   ' and e.filial = '+fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asString;


end;

procedure TfrmControleLocalizacoes.CondicaoConsultaSubLocalizacoes;
begin
  fraConsultaSubLocalizacoes.qryProcuraSubLocalizacaoEstoque.macrobyname('SQL').asSTring :=
   ' and e.filial = '+fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asString;

  fraConsultaSubLocalizacoes.qryConsultaSubLocalizacaoEstoque.macrobyname('SQL').asSTring :=
   ' and e.filial = '+fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asString;

end;


procedure TfrmControleLocalizacoes.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
    case Key of

      vk_F7  : begin
                 if sbnImprimir.enabled then
                   sbnImprimirClick(nil);
               end;

      VK_F11 : begin
                  if gbxCodigoBarras.caption = 'F11 PARA TROCAR - CÓDIGO DE BARRAS' then
                  begin
                    gbxCodigoBarras.caption := 'F11 PARA TROCAR - PRODUTO';
                    fraConsultaEstoqueitemPRODUTOS.edfCodigo.DataField := 'codigovisual';
//                    fraConsultaEstoqueitemPRODUTOS.edfCodigo.MaxLength := 50;
                  end
                  else
                  begin
                    gbxCodigoBarras.caption := 'F11 PARA TROCAR - CÓDIGO DE BARRAS';
                    fraConsultaEstoqueitemPRODUTOS.edfCodigo.DataField := 'codigobarras';
//                    fraConsultaEstoqueitemPRODUTOS.edfCodigo.MaxLength := 50;
                  end;
               end;

      else
      inherited;
    end;
end;

procedure TfrmControleLocalizacoes.CondicoesConsultaEstoqueItemProduto;
begin

  fraConsultaEstoqueitemPRODUTOS.qryProcuraEstoqueItemProdutos.parambyname('filial').asstring :=
    fraConsultaFilial.edfcodigo.text;

  fraConsultaEstoqueitemPRODUTOS.qryProcuraEstoqueItemProdutos.parambyname('FilialBase').asinteger :=
    dtmControleLocalizacoes.FilialBase;

  fraConsultaEstoqueitemPRODUTOS.qryConsultaEstoqueItemProdutos.ParambyName('FilialBase').AsInteger :=
    dtmControleLocalizacoes.FilialBase;

  if gbxCodigoBarras.Caption = 'F11 PARA TROCAR - CÓDIGO DE BARRAS' then
    fraConsultaEstoqueitemPRODUTOS.qryProcuraEstoqueItemProdutos.parambyname('PorCodigoBarra').asBoolean := true
  else
    fraConsultaEstoqueitemPRODUTOS.qryProcuraEstoqueItemProdutos.parambyname('PorCodigoBarra').asBoolean := false;

end;

procedure TfrmControleLocalizacoes.fraConsultaEstoqueitemPRODUTOSedfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaEstoqueitemPRODUTOS.edfCodigoKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    if fraConsultaEstoqueitemPRODUTOS.edfCodigo.Text<>''then
    begin
      if gbxCodigoBarras.Caption = 'F11 PARA TROCAR - CÓDIGO DE BARRAS' then
      begin
//        dbgProdutosLocalizacao.datasource.DataSet.Append;
        dtmControleLocalizacoes.LocalizarProduto(
              fraConsultaFilial.edfcodigo.text,
                          fraConsultaEstoqueitemPRODUTOS.edfCodigo.text,
                                  pesCodigoBarras)
      end
      else
        dtmControleLocalizacoes.LocalizarProduto(
         fraConsultaFilial.edfcodigo.text,
                          fraConsultaEstoqueitemPRODUTOS.edfCodigo.Text,
                                                             pesproduto);
    end;
    fraConsultaEstoqueitemPRODUTOS.edfCodigo.SetFocus;
    fraConsultaEstoqueitemPRODUTOS.edfCodigo.SelectAll;
  end;

//  dbgProdutosLocalizacao.AutoNumberRow(0);
  dbgProdutosLocalizacao.AutoNumberCol(0);
  dbgProdutosLocalizacao.Refresh;



end;

procedure TfrmControleLocalizacoes.sbnExcluirSomenteUmRegistrosClick(
  Sender: TObject);
begin
  inherited;
  dtmControleLocalizacoes.RetirarProdutodaLista(false);
end;

procedure TfrmControleLocalizacoes.sbnExcluirTodosRegistrosClick(
  Sender: TObject);
begin
  inherited;
  dtmControleLocalizacoes.RetirarProdutodaLista(true);
end;

function TfrmControleLocalizacoes.InternoGravar: Boolean;
begin
  if fraConsultaFilial.edfcodigo.text = '' then
  begin
    MensagemAviso('Informe a filial');
    fraConsultaFilial.edfcodigo.setfocus;
  end
  else
  begin
    dtmControleLocalizacoes.gravarProdutosLocalizacao(
      fraConsultaFilial.edfcodigo.text,
      fraConsultaLocalizacoes.edfcodigo.text,
      fraConsultaSubLocalizacoes.edfcodigo.text);
//    dbgProdutosLocalizacao.ShowModified.Enabled := false;
//    dbgProdutosLocalizacao.ShowModified.Enabled := true;
    dbgProdutosLocalizacao.ClearModifiedRows;

  end;



end;

procedure TfrmControleLocalizacoes.fraConsultaLocalizacoesedfCodigoChange(
  Sender: TObject);
begin
  inherited;
  if not dtmControleLocalizacoes.qryProdutosLocalizacao.IsEmpty
    and (dtmControleLocalizacoes.qryLocalizacao.state = dsbrowse) then
    dtmControleLocalizacoes.qryLocalizacao.edit;

end;

procedure TfrmControleLocalizacoes.fraConsultaSubLocalizacoesedfCodigoChange(
  Sender: TObject);
begin
  inherited;
  if not dtmControleLocalizacoes.qryProdutosLocalizacao.IsEmpty
    and (dtmControleLocalizacoes.qryLocalizacao.state = dsbrowse) then
    dtmControleLocalizacoes.qryLocalizacao.edit;

end;

procedure TfrmControleLocalizacoes.dbgProdutosLocalizacaoCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  doSort := false;

  if dbgProdutosLocalizacao.SortSettings.Direction = sdAscending then
  begin
    dbgProdutosLocalizacao.SortSettings.Direction := sdDescending;
    dtmControleLocalizacoes.qryProdutosLocalizacao.SortDescByField(dbgProdutosLocalizacao.FieldAtColumn[ACol].FieldName);

  end
  else
  begin
    dbgProdutosLocalizacao.SortSettings.Direction := sdAscending;
    dtmControleLocalizacoes.qryProdutosLocalizacao.SortByField(dbgProdutosLocalizacao.FieldAtColumn[ACol].FieldName);
  end;

  dbgProdutosLocalizacao.SortSettings.Column := ACol;

//  dbgProdutosLocalizacao.AutoNumberCol(0);
//  dbgProdutosLocalizacao.Refresh;


end;

procedure TfrmControleLocalizacoes.AdvPageControlControleLocalizacoesChange(
  Sender: TObject);
begin
  inherited;
  if AdvPageControlControleLocalizacoes.ActivePage = AdvTabSheetEtiquetasLocalizacao then
  begin
    dtmControleLocalizacoes.qryLocalizacoes.close;
    dtmControleLocalizacoes.qryLocalizacoes.open;

    dtmControleLocalizacoes.qryPesquisarLocalizacoes.close;
    dtmControleLocalizacoes.qryPesquisarLocalizacoes.open;

  end;
end;

procedure TfrmControleLocalizacoes.DBAdvGridLocalizacoesCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;

  doSort := false;
  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if (TDBAdvGrid(sender).SortSettings.Direction = sdDescending) and
       TDBAdvGrid(sender).SortSettings.undosort then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      TDBAdvGrid(sender).SortSettings.Column := -1;
      TtecQuery(TDBAdvGrid(sender).DataSource.DataSet).SortClear;
    end
    else
    begin
      if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
        TDBAdvGrid(sender).SortSettings.Direction := sdDescending
      else
        TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      TtecQuery(TDBAdvGrid(sender).DataSource.DataSet).SortInverse;
      TDBAdvGrid(sender).SortSettings.Column := ACol;
    end;
  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    TtecQuery(TDBAdvGrid(sender).DataSource.DataSet).SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;
end;

procedure TfrmControleLocalizacoes.edtLocSubLocKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
  inherited;
  if key = vk_return then
  begin
    edtLocSubLoc.setfocus;
    if pos('*',edtLocSubLoc.text)<>0 then
    begin
      fraConsultaLocalizacoes.edfcodigo.Text := copy(edtLocSubLoc.text,1, pos('*',edtLocSubLoc.text)-1);
      fraConsultaSubLocalizacoes.edfcodigo.Text := copy(edtLocSubLoc.text, pos('*',edtLocSubLoc.text)+1, length(edtLocSubLoc.text));
    end
    else
    begin
      fraConsultaLocalizacoes.edfcodigo.Text := edtLocSubLoc.text;
      fraConsultaSubLocalizacoes.edfcodigo.clear;
    end;
  end;
end;

procedure TfrmControleLocalizacoes.DBAdvEdit1Change(Sender: TObject);
begin
  inherited;
  if DBAdvGridLocalizacoesTop.ColumnByFieldName['localizacao'].index =  DBAdvGridLocalizacoesTop.col  then
  begin
    DBAdvEdit1.datafield := 'localizacao';
    dtmControleLocalizacoes.qryLocalizacoes.locate('localizacao',TRIM(DBAdvEdit1.Text), [loPartialKey]);
  end
  else
  if DBAdvGridLocalizacoesTop.ColumnByFieldName['sublocalizacao'].index =  DBAdvGridLocalizacoesTop.col  then
  begin
    DBAdvEdit1.datafield := 'sublocalizacao';
    dtmControleLocalizacoes.qryLocalizacoes.locate('sublocalizacao',TRIM(DBAdvEdit1.text), [loPartialKey]);
  end;
end;

procedure TfrmControleLocalizacoes.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmControleLocalizacoes.MarcarLocalizacoes(ckbSelecionarTodos.checked)
end;

procedure TfrmControleLocalizacoes.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  if fraConsultaModelosEtiquetas.qryProcuraModelosEtiquetasarquivo.asString = '' then
  begin
    fraConsultaModelosEtiquetas.edfcodigo.setfocus;
    fraConsultaModelosEtiquetas.edfcodigo.selectall;
    MensagemAviso('Informe o modelo da etiqueta.');
  end
  else
  begin

   dtmControleLocalizacoes.ImprimirEtiqueta(
      fraConsultaModelosEtiquetas.qryProcuraModelosEtiquetasarquivo.asString);
   DBAdvGridLocalizacoes.reload;   
  end;
end;

procedure TfrmControleLocalizacoes.CondicoesModeloEtiqueta;
begin
  fraConsultaModelosEtiquetas.qryProcuraModelosEtiquetas.MacroByName('SQLCondicao').asString :=
    ' and configurar = ''LOCALIZAÇÃO''';
  fraConsultaModelosEtiquetas.qryConsultaModelosEtiquetas.MacroByName('SQLCondicao').asString :=
    ' and configurar = ''LOCALIZAÇÃO''';

end;

procedure TfrmControleLocalizacoes.ckbSelecionarTodasSubLocalizacoesClick(
  Sender: TObject);
begin
  inherited;
  dtmControleLocalizacoes.MarcarImpSubLocalizacoes(ckbSelecionarTodasSubLocalizacoes.checked);
end;

procedure TfrmControleLocalizacoes.ckbSelecionarTodasLocalizacoesClick(
  Sender: TObject);
begin
  inherited;
  dtmControleLocalizacoes.MarcarImpLocalizacoes(ckbSelecionarTodasLocalizacoes.checked);
end;

end.
