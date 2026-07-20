unit fmadicionarlinhagrade;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, Grids, DBGrids, cpdbgrid, ComCtrls, Buttons,
  ExtCtrls,dmcadastronotasfiscais, StdCtrls, Windows, cptexto, Mask,
  cpdbfindcontrols, biblio, ctconstantes, DBCtrls, ToolWin, cpdbtext, db;

type
  TfrmAdicionarLinhaGrade = class(TFrmCadastroPadrao)
    gbxElementos: TGroupBox;
    lblElemento: TLabel;
    dbgElementosLinhas: TtecDBGrid;
    pnlTop: TPanel;
    pnlLinha: TPanel;
    pnlLinhaTop: TPanel;
    pnlLinhaBottom: TPanel;
    shNotaImpressa: TShape;
    lblNotaFiscal: TLabel;
    shIncluirNaNota: TShape;
    lblImprimirNotaFiscal: TLabel;
    StaticText1: TStaticText;
    dbtProduto: TtecDBText;
    dbtLinha: TtecDBText;
    ckbSelecionarTodasLinhasPresenteemProdutos: TCheckBox;
    Panel1: TPanel;
    sbn_Excluir_linha_da_grade: TSpeedButton;
    edfElementoLinha: TEditTexto;
    edtAbreviaturaLinha: TDBEditTexto;
    Timer1: TTimer;
    Panel2: TPanel;
    dbgElementosColunas: TtecDBGrid;
    pnlColunaTop: TPanel;
    dbtColuna: TtecDBText;
    edfElementoColuna: TEditTexto;
    edtAbreviaturaColuna: TDBEditTexto;
    Panel4: TPanel;
    ckbSelecionarTodasColunaPresenteemProdutos: TCheckBox;
    Panel5: TPanel;
    sbn_Excluir_coluna_da_grade: TSpeedButton;
    dbgcaracteristicaselementosnotaspag_linhas: TtecDBGrid;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    dbgcaracteristicaselementosnotaspag_colunas: TtecDBGrid;
    sbnLinhaAdiciona: TSpeedButton;
    sbnLinhaAdicionaTodos: TSpeedButton;
    sbnLinhaRemove: TSpeedButton;
    sbnLinhaRemoveTodos: TSpeedButton;
    sbnColunaAdiciona: TSpeedButton;
    sbnColunaAdicionaTodos: TSpeedButton;
    sbnColunaRemove: TSpeedButton;
    sbnColunaRemoveTodos: TSpeedButton;
    dbtProdutoVisual: TtecDBText;
    procedure dbgElementosGradesKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edfElementoKeyPress(Sender: TObject; var Key: Char);
    procedure sbnExcluirElementoGradeClick(Sender: TObject);
    procedure dbgElementosLinhasDrawColumnCell(
      Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure edfElementoLinhaChange(Sender: TObject);
    procedure edfElementoLinhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodasLinhasPresenteemProdutosClick(
      Sender: TObject);
    procedure dbgElementosLinhasKeyPress(
      Sender: TObject; var Key: Char);
    procedure dbgElementosLinhasKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgElementosLinhasDblClick(
      Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtAbreviaturaLinhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAbreviaturaColunaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgElementosColunasDblClick(Sender: TObject);
    procedure dbgElementosColunasDrawColumnCell(
      Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure dbgElementosColunasKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbSelecionarTodasColunaPresenteemProdutosClick(
      Sender: TObject);
    procedure edfElementoColunaChange(Sender: TObject);
    procedure sbnLinhaAdicionaTodosClick(Sender: TObject);
    procedure sbnLinhaRemoveTodosClick(Sender: TObject);
    procedure sbnLinhaAdicionaClick(Sender: TObject);
    procedure sbnLinhaRemoveClick(Sender: TObject);
    procedure dbgcaracteristicaselementosnotaspag_linhasDblClick(
      Sender: TObject);
    procedure dbgcaracteristicaselementosnotaspag_linhasDrawColumnCell(
      Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure dbgcaracteristicaselementosnotaspag_linhasKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgcaracteristicaselementosnotaspag_linhasKeyPress(
      Sender: TObject; var Key: Char);
    procedure dbgcaracteristicaselementosnotaspag_colunasDblClick(
      Sender: TObject);
    procedure dbgcaracteristicaselementosnotaspag_colunasDrawColumnCell(
      Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure dbgcaracteristicaselementosnotaspag_colunasKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgcaracteristicaselementosnotaspag_colunasKeyPress(
      Sender: TObject; var Key: Char);
    procedure sbnColunaAdicionaClick(Sender: TObject);
    procedure sbnColunaAdicionaTodosClick(Sender: TObject);
    procedure sbnColunaRemoveClick(Sender: TObject);
    procedure sbnColunaRemoveTodosClick(Sender: TObject);
    procedure edfElementoColunaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    dtmCadastroNotasFiscais : tdtmCadastroNotasFiscais;
    procedure AlterarEstadoBotoes; override;
    function InternoGravar: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
    procedure  SetDataModulo (Dtm: TdtmCadastroNotasFiscais);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais); reintroduce;
    destructor Destroy; override;

  end;

var
  frmAdicionarLinhaGrade: TfrmAdicionarLinhaGrade;

implementation

{$R *.dfm}

procedure TfrmAdicionarLinhaGrade.AlterarEstadoBotoes;
begin
  inherited;
  sbnSalvar.Enabled := dtmCadastroNotasFiscais.vcaracteristicaselementosnotaspag_lc;
end;

constructor TfrmAdicionarLinhaGrade.Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais);
begin
  inherited create(AOwner);
  SetDataModulo(dtm);

  DataSet  := dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_l;
  dtmCadastroNotasFiscais.vcaracteristicaselementosnotaspag_lc := false;
  dbgElementosLinhas.Ordenacao := 'valor';
  dbgcaracteristicaselementosnotaspag_linhas.Ordenacao := 'valor';
  dbgElementosColunas.Ordenacao := 'valor';
  dbgcaracteristicaselementosnotaspag_colunas.Ordenacao := 'valor';

  if dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_c.IsEmpty then
    ckbSelecionarTodasColunaPresenteemProdutos.checked := true;

end;

procedure TfrmAdicionarLinhaGrade.dbgElementosGradesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

destructor TfrmAdicionarLinhaGrade.Destroy;
begin
  inherited;
  frmAdicionarLinhaGrade := nil;
end;

function TfrmAdicionarLinhaGrade.InternoGravar: Boolean;
begin
  if dtmCadastroNotasFiscais.GravarElementosGrade then
  begin
   modalresult := mrOK;
//   close;
  end;
end;

procedure TfrmAdicionarLinhaGrade.FormShow(Sender: TObject);
begin
  inherited;
  edfElementolinha.SetFocus;
end;

procedure TfrmAdicionarLinhaGrade.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_F5: if (Shift = []) and sbnSalvar.Enabled then
     InternoGravar;
  else
    inherited;
  end;
end;


procedure TfrmAdicionarLinhaGrade.edfElementoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmAdicionarLinhaGrade.sbnExcluirElementoGradeClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.ExcluirLinhas_;
end;

procedure TfrmAdicionarLinhaGrade.dbgElementosLinhasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dtmCadastroNotasFiscais do
  begin
     if (column.FieldName = 'valor') or
        (column.FieldName = 'abreviatura') then
     begin
       if qryElementosLinhaspresenteemprodutos.asBoolean then
         TDBGrid(Sender).Canvas.brush.Color := $00509F00;
     end;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmAdicionarLinhaGrade.edfElementoLinhaChange(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.localizarlinha_(edfElementoLinha.Text);
end;

procedure TfrmAdicionarLinhaGrade.edfElementoLinhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  case Key of
    VK_RETURN:
    begin
      if ((edfElementolinha.text <> '') and
          (edfElementolinha.Text <> dtmCadastroNotasFiscais.qryElementosLinhasvalor.asString)) then
      begin
        if (edfElementolinha.Text <> dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_lvalor.asString) then
        begin
          if MensagemConfirmacao(format(ctELEMENTOVALORNAOCADASTRADO, [edfelementolinha.text])) = smbOK then
          begin
            dtmCadastroNotasFiscais.IncluirLinha_(edfElementolinha.Text);
            edtAbreviaturalinha.SetFocus;
            edtAbreviaturalinha.SelectAll;
          end;
        end
        else
          MensagemAviso(format('O Elemento da linha %s já esta cadastrado e selecionado.', [edfelementolinha.text]));

      end
      else
      begin

        if ((edfElementolinha.text <> '') and
           (edfElementolinha.Text = dtmCadastroNotasFiscais.qryElementosLinhasvalor.asString)) then
        begin
          dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(true, False);
          edfElementolinha.SetFocus;
          edfElementolinha.SelectAll;
        end;

      end;

    end;
  end;

end;

procedure TfrmAdicionarLinhaGrade.ckbSelecionarTodasLinhasPresenteemProdutosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasPresentesemProdutosSelecionadas(ckbSelecionarTodasLinhasPresenteemProdutos.Checked,True);
end;

procedure TfrmAdicionarLinhaGrade.dbgElementosLinhasKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmAdicionarLinhaGrade.dbgElementosLinhasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
             VK_SPACE: if Shift = [ssCtrl] then
                          dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(true, False);
  end;

end;

procedure TfrmAdicionarLinhaGrade.dbgElementosLinhasDblClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(true, False);
end;

procedure TfrmAdicionarLinhaGrade.Timer1Timer(Sender: TObject);
begin
  inherited;
  sbnSalvar.Enabled := dtmCadastroNotasFiscais.vcaracteristicaselementosnotaspag_lc;
end;

procedure TfrmAdicionarLinhaGrade.edtAbreviaturaLinhaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
   VK_RETURN:
   begin
    if (dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_l.State in [dsedit, dsinsert]) then
      dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_l.post;

    edfElementoLinha.SetFocus;
    edfElementoLinha.SelectAll;
   end;
  end;

end;

procedure TfrmAdicionarLinhaGrade.edtAbreviaturaColunaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
   VK_RETURN:
   begin
    if (dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_c.State in [dsedit, dsinsert]) then
      dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_c.post;

    edfElementocoluna.SetFocus;
    edfElementocoluna.SelectAll;
   end;
  end;

end;

procedure TfrmAdicionarLinhaGrade.dbgElementosColunasDblClick(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(true, False);
end;

procedure TfrmAdicionarLinhaGrade.dbgElementosColunasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dtmCadastroNotasFiscais do
  begin
     if (column.FieldName = 'valor') or
        (column.FieldName = 'abreviatura') then
     begin
       if qryElementosColunaspresenteemprodutos.asBoolean then
         TDBGrid(Sender).Canvas.Brush.Color := $00509F00;

     end;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmAdicionarLinhaGrade.dbgElementosColunasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
             VK_SPACE: if Shift = [ssCtrl] then
                          dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(true, False);
  end;

end;

procedure TfrmAdicionarLinhaGrade.ckbSelecionarTodasColunaPresenteemProdutosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasPresentesemProdutosSelecionadas(ckbSelecionarTodasColunaPresenteemProdutos.checked,True);
end;

procedure TfrmAdicionarLinhaGrade.edfElementoColunaChange(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.localizarcoluna(edfElementoColuna.Text);
end;

procedure TfrmAdicionarLinhaGrade.sbnLinhaAdicionaTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(true,True);
end;

procedure TfrmAdicionarLinhaGrade.sbnLinhaRemoveTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(false,True);
end;

procedure TfrmAdicionarLinhaGrade.sbnLinhaAdicionaClick(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(true,false);
end;

procedure TfrmAdicionarLinhaGrade.sbnLinhaRemoveClick(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(false,false);
end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_linhasDblClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(false, False);
end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_linhasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dtmCadastroNotasFiscais do
  begin
     if (column.FieldName = 'valor') or
        (column.FieldName = 'abreviatura') then
     begin
       if qrycaracteristicaselementosnotaspag_lcontidonanfe.asboolean then
         TDBGrid(Sender).Canvas.brush.Color := $004FA7FF
       else
       if qrycaracteristicaselementosnotaspag_lpresenteemprodutos.asBoolean then
         TDBGrid(Sender).Canvas.brush.Color := $00509F00;
     end;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_linhasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
             VK_SPACE: if Shift = [ssCtrl] then
                          dtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(false, False);
  end;

end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_linhasKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);

end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_colunasDblClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(false, False);
end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_colunasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dtmCadastroNotasFiscais do
  begin
     if (column.FieldName = 'valor') or
        (column.FieldName = 'abreviatura') then
     begin
       if qrycaracteristicaselementosnotaspag_ccontidonanfe.asboolean then
         TDBGrid(Sender).Canvas.Brush.Color := $004FA7FF
       else
       if qrycaracteristicaselementosnotaspag_cpresenteemprodutos.asBoolean then
         TDBGrid(Sender).Canvas.Brush.Color := $00509F00;

     end;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_colunasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
             VK_SPACE: if Shift = [ssCtrl] then
                          dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(false, False);
  end;

end;

procedure TfrmAdicionarLinhaGrade.dbgcaracteristicaselementosnotaspag_colunasKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmAdicionarLinhaGrade.sbnColunaAdicionaClick(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(true,false);
end;

procedure TfrmAdicionarLinhaGrade.sbnColunaAdicionaTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(true,True);
end;

procedure TfrmAdicionarLinhaGrade.sbnColunaRemoveClick(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(false,false);
end;

procedure TfrmAdicionarLinhaGrade.sbnColunaRemoveTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(false,True);
end;

procedure TfrmAdicionarLinhaGrade.edfElementoColunaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  case Key of
    VK_RETURN:
    begin
      if ((edfElementoColuna.text <> '') and
        (edfElementoColuna.Text <> dtmCadastroNotasFiscais.qryElementosColunasvalor.asString)) then
      begin

        if (edfElementoColuna.Text <> dtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_cvalor.asString) then
        begin
          if MensagemConfirmacao(format(ctELEMENTOVALORNAOCADASTRADO, [edfelementocoluna.text])) = smbOK then
          begin
            dtmCadastroNotasFiscais.IncluirColuna(edfElementoColuna.Text);
            edtAbreviaturacoluna.SetFocus;
            edtAbreviaturacoluna.SelectAll;
          end;
        end
        else
          MensagemAviso(format('O Elemento da coluna %s já esta cadastrado e selecionado.', [edfelementocoluna.text]));


      end
      else
      begin

        if ((edfElementoColuna.text <> '') and
           (edfElementoColuna.Text = dtmCadastroNotasFiscais.qryElementosColunasvalor.asString)) then
        begin
          dtmCadastroNotasFiscais.AdicionarColunasSelecionadas(true, False);
          edfElementoColuna.SetFocus;
          edfElementoColuna.SelectAll;
        end;

      end;

    end;
  end;

end;

procedure TfrmAdicionarLinhaGrade.SetDataModulo(
  Dtm: TdtmCadastroNotasFiscais);
begin
  dtmCadastroNotasFiscais := dtm;
  dbtProdutoVisual.DataSource := dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal;
  dbtProduto.DataSource := dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal;
  dbtLinha.DataSource := dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal;
  dbtColuna.DataSource := dtmCadastroNotasFiscais.dsrCaracteristicasNotaFiscal;
  edtAbreviaturaLinha.DataSource := dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_l;
  edtAbreviaturaColuna.DataSource := dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_c;
  dbgElementosLinhas.DataSource := dtmCadastroNotasFiscais.dsrElementosLinhas;
  dbgcaracteristicaselementosnotaspag_linhas.DataSource := dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_l;
  dbgElementosColunas.DataSource := dtmCadastroNotasFiscais.dsrElementosColunas;
  dbgcaracteristicaselementosnotaspag_colunas.DataSource := dtmCadastroNotasFiscais.dsrcaracteristicaselementosnotaspag_c;
end;

end.
