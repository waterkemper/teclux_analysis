unit fmselecionarprodutoslistapadrao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask, biblio,
  cpdbfindcontrols, DBCtrls, cpdbtext, Grids, DBGrids, cpdbgrid,
  dmlistacasamento, fmconsultabasica, fmconsultaporcampo, ZQuery, ctconstantes, {Qete,}
  ActnList, clparametrossistema, ToolWin;

type
  TfrmSelecionarProdutosListaPadrao = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxProdutosListaPadrao: TGroupBox;
    gbxListaPadrao: TGroupBox;
    sbnProcurarFornecedores: TSpeedButton;
    dtxListaPadrao: TtecDBText;
    edfListaPadrao: TtecDbEditFind;
    dbgProdutosListaPadrao: TtecDBGrid;
    sbnConfirmar: TSpeedButton;
    ckbSelecionarTodos: TCheckBox;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    procedure sbnProcurarFornecedoresClick(Sender: TObject);
    procedure edfListaPadraoFound(Found: Boolean);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgProdutosListaPadraoDblClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure dbgProdutosListaPadraoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure actHabilitarUpdate(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGradeListasPadrao(Sender: TObject);
  protected
    dtmLista: TdtmListaCasamento;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetDataModulo(Dtm: TdtmListaCasamento);
  end;

var
  frmSelecionarProdutosListaPadrao: TfrmSelecionarProdutosListaPadrao;

implementation

{$R *.dfm}

{ TfrmSelecionarProdutosListaPadrao }

destructor TfrmSelecionarProdutosListaPadrao.Destroy;
begin
  inherited;
  frmSelecionarProdutosListaPadrao:= nil;
end;

function TfrmSelecionarProdutosListaPadrao.ExisteInformacao(
         Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmLista.ExisteListaPadrao(NomeCampo, Value);
end;

function TfrmSelecionarProdutosListaPadrao.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn and (ActiveControl = edfListaPadrao) then begin
    with dtmLista do begin
      AbreTabelaPesquisa(tlcLISTAPADRAO);
      Result:= inherited InternoPesquisar('Listas Padrão');
      if Result = mrOK then
        Selecionar(tlcLISTAPADRAO);
      FechaTabelaPesquisa(tlcLISTAPADRAO);
    end
  end;
end;

function TfrmSelecionarProdutosListaPadrao.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
end;

procedure TfrmSelecionarProdutosListaPadrao.SetDataModulo(Dtm: TdtmListaCasamento);
begin
  dtmLista := Dtm;
  dtmLista.OnScrollLinhaColunaGradeListasPadrao := AfterScrollLinhaColunaGradeListasPadrao;
end;

function TfrmSelecionarProdutosListaPadrao.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmLista.TabelaConsultaListaPadrao;
end;

procedure TfrmSelecionarProdutosListaPadrao.sbnProcurarFornecedoresClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfListaPadrao.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmSelecionarProdutosListaPadrao.edfListaPadraoFound(Found: Boolean);
begin
  inherited;
  if Found then
    dtmLista.SelecionarProdutosListaPadrao;
end;

procedure TfrmSelecionarProdutosListaPadrao.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmLista.SelecionarProdutos(ckbSelecionarTodos.Checked,True);
end;

procedure TfrmSelecionarProdutosListaPadrao.dbgProdutosListaPadraoDblClick(
  Sender: TObject);
begin
  inherited;
  dtmLista.SelecionarProdutos(False,False);
end;

procedure TfrmSelecionarProdutosListaPadrao.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  dtmLista.AtribuirProdutosNaListaCasamento;
  Close;
end;

procedure TfrmSelecionarProdutosListaPadrao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_SPACE: if (Shift = [ssCtrl]) then
                 dtmLista.SelecionarProdutos(False,False);
       VK_F5: if sbnConfirmar.Enabled then
                 sbnConfirmar.Click;
  end;
end;

procedure TfrmSelecionarProdutosListaPadrao.dbgProdutosListaPadraoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dtmLista.ProdutoSelecionado then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmSelecionarProdutosListaPadrao.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnConfirmar.Enabled      := (dtmLista.QuantidadeProdutosListaPadrao > 0);
  ckbSelecionarTodos.Visible:= (dtmLista.QuantidadeProdutosListaPadrao > 0);
end;

procedure TfrmSelecionarProdutosListaPadrao.AfterScrollLinhaColunaGradeListasPadrao(
  Sender: TObject);
begin
 dbgProdutosListaPadrao.Columns[2].Title.Caption := dtmLista.LinhadaGradeListasPadrao;
 dbgProdutosListaPadrao.Columns[3].Title.Caption := dtmLista.ColunadaGradeListasPadrao;
end;

constructor TfrmSelecionarProdutosListaPadrao.Create(AOwner: TComponent);
begin
  inherited;
  dbgProdutosListaPadrao.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosListaPadrao.Columns[3].Visible := ParSistema.UsarGradesProdutos;
end;

end.
 