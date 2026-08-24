unit fmcancelamentopedidos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, cpnumero, Grids, DateUtils,
  DBGrids, cpdbgrid, cpdata, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  cppagecontrol, dmcancelamentopedidos, fmconsultabasica, fmconsultaporcampo,
  zquery, ctconstantes, Windows, cpeditioncontrolvalidation, biblio, ActnList,
  cpdbradiogroup, clparametrossistema, ToolWin;

type
  TfrmCancelamentoPedidos = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    sbnConfirma: TSpeedButton;
    pgcCancelamentoPedidos: TtecPageControl;
    tstParametros: TTabSheet;
    gbxFornecedor: TGroupBox;
    dtxFornecedor: TtecDBText;
    gbxPeriodoEmissao: TGroupBox;
    tstSelecionados: TTabSheet;
    dbgProdutos: TtecDBGrid;
    sbnProcurarFornecedor: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxPedido: TGroupBox;
    edtPedido: TEditNumero;
    rgpQuePedido: TtecDBRadioGroup;
    ckbNadaEntregue: TtecRadioButton;
    ckbParcialmenteEntregue: TtecRadioButton;
    ckbAmbos: TtecRadioButton;
    edfFornecedor: TtecDbEditFind;
    gbxMotivo: TGroupBox;
    sbnProcurarMotivo: TSpeedButton;
    dtxMotivo: TtecDBText;
    edfMotivo: TtecDbEditFind;
    dbgPedidos: TtecDBGrid;
    shpReservado: TShape;
    shpCancelado: TShape;
    lblParcialRecebido: TLabel;
    lblNadaRecebido: TLabel;
    Shape1: TShape;
    lblPedidosConcluir: TLabel;
    edtEmissaoInicial: TEditData;
    edtEmissaoFinal: TEditData;
    lblA: TLabel;
    gbxProdutos: TGroupBox;
    gbxSituacao: TGroupBox;
    procedure sbnConfirmaClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcurarFornecedorClick(Sender: TObject);
    procedure aclHabilitarUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure dbgProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbnProcurarMotivoClick(Sender: TObject);
    procedure dbgPedidosDblClick(Sender: TObject);
    procedure dbgPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
  protected
    dtmCancelamentoPedidos: TdtmCancelamentoPedidos;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCamposSelecao: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCancelamentoPedidos: TfrmCancelamentoPedidos;
  TipoPesquisa: TtecCancelamentoPedidos;

implementation

{$R *.dfm}

{ TfrmCancelamentoQuitacao }

procedure TfrmCancelamentoPedidos.aclHabilitarUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  inherited;
  sbnGerar.Enabled          := pgcCancelamentoPedidos.ActivePage = tstParametros;
  sbnConfirma.Enabled       := (edfMotivo.Text <> '') and
                               (dtmCancelamentoPedidos.QtdeMarcados > 0) and
                               (pgcCancelamentoPedidos.ActivePage = tstSelecionados); 
end;

constructor TfrmCancelamentoPedidos.Create(AOwner: TComponent);
begin
  dtmCancelamentoPedidos:= TdtmCancelamentoPedidos.Create(Self);
  inherited;
  with dtmCancelamentoPedidos do begin
    Abre(ctTabelas);
    edtEmissaoInicial.Text:= DateToStr(DataServidor-60);
    edtEmissaoFinal.Text  := DateToStr(DataServidor-30);
  end;
  dbgProdutos.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dtmCancelamentoPedidos.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dbgProdutos.Columns[4].Width := length(ParSistema.MascaraQuantidade)*12;
  dbgProdutos.Columns[5].Width := length(ParSistema.MascaraQuantidade)*12;
  pgcCancelamentoPedidos.ActivePageIndex := 0;
  if ParSistema.PermitirProdutoAlfanumerico then
     dbgProdutos.Columns[0].Width := 200
  else
     dbgProdutos.Columns[0].Width:= 140;

end;

procedure TfrmCancelamentoPedidos.dbgProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (dtmCancelamentoPedidos.Situacao = 'P') then begin
    TDBGrid(Sender).Canvas.Brush.Color := $00FFD9A4;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if (dtmCancelamentoPedidos.Situacao = 'A') then begin
    TDBGrid(Sender).Canvas.Brush.Color := $007FAA55;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if dbgPedidos.DataSource.DataSet.FieldByName('cancelar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

destructor TfrmCancelamentoPedidos.Destroy;
begin
  dtmCancelamentoPedidos:=nil;
  inherited;
  frmCancelamentoPedidos:= nil;
end;

function TfrmCancelamentoPedidos.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    tcpFORNECEDORES: Result:= dtmCancelamentoPedidos.ExisteFornecedores(NomeCampo, Value);
         tcpMOTIVOS: Result:= dtmCancelamentoPedidos.ExisteMotivos(NomeCampo, Value);
    else             Result:= False;
  end;
end;

function TfrmCancelamentoPedidos.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if CtrlOn and (ActiveControl is TtecFindCustom) then begin
    if ActiveControl = edfFornecedor then begin
      TipoPesquisa:= tcpFORNECEDORES;
      Titulo      := 'Fornecedores';
    end
    else if ActiveControl = edfMotivo then begin
      TipoPesquisa:= tcpMOTIVOS;
      Titulo      := 'Motivos';
    end
    else
      TipoPesquisa:= tcpNENHUM;

    if (TipoPesquisa <> tcpNENHUM) then begin
      with dtmCancelamentoPedidos do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmCancelamentoPedidos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmCancelamentoPedidos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5: if sbnConfirma.Enabled and not CtrlOn then sbnConfirma.Click;
    VK_F6: if sbnGerar.Enabled and not CtrlOn then sbnGerar.Click;
    VK_Escape: if pgcCancelamentoPedidos.ActivePage = tstSelecionados then
                  pgcCancelamentoPedidos.ActivePage:= tstParametros;
  end;
end;

procedure TfrmCancelamentoPedidos.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  if (edfMotivo.Text <> '') and  edfMotivo.Exist then
    dtmCancelamentoPedidos.CancelarPedidos;
end;

procedure TfrmCancelamentoPedidos.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then begin
    with dtmCancelamentoPedidos do begin
      EmissaoInicial := edtEmissaoInicial.Text;
      EmissaoFinal   := edtEmissaoFinal.Text;
      Fornecedor     := edfFornecedor.Text;
      Pedido         := edtPedido.Text;
      Entregues      := rgpQuePedido.ItemIndex;
      if not SelecionarPedidos then begin
         pgcCancelamentoPedidos.ActivePageIndex:= 1;
         dbgPedidos.SetFocus;
      end
      else begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtPedido.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCancelamentoPedidos.sbnProcurarFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoPedidos.sbnProcurarMotivoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfMotivo.SetFocus;
  InternoPesquisar('');
end;

function TfrmCancelamentoPedidos.TabelaDePesquisa: TZdataSet;
begin
  case TipoPesquisa of
    tcpFORNECEDORES: Result:= dtmCancelamentoPedidos.ConsultaFornecedores;
         tcpMOTIVOS: Result:= dtmCancelamentoPedidos.ConsultaMotivos;
    else             Result:= nil;
  end;       
end;

function TfrmCancelamentoPedidos.ValidarCamposSelecao: Boolean;
begin
  Result:= edtEmissaoInicial.DataValida and edtEmissaoFinal.DataValida;
  if Result then
    Result:= ((edtEmissaoInicial.Text <> '') or (edtEmissaoFinal.Text <> '')) and
             OperadorTernario(edfFornecedor.Text <> '', edfFornecedor.Exist, True);
end;


procedure TfrmCancelamentoPedidos.dbgPedidosDblClick(Sender: TObject);
begin
  inherited;
  dtmCancelamentoPedidos.MarcarSelecionados(False, False);
end;

procedure TfrmCancelamentoPedidos.dbgPedidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
      dtmCancelamentoPedidos.MarcarSelecionados(False, False);
end;

procedure TfrmCancelamentoPedidos.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutos.Columns[2].Title.Caption := dtmCancelamentoPedidos.LinhadaGrade;
  dbgProdutos.Columns[3].Title.Caption := dtmCancelamentoPedidos.colunadaGrade;
end;

end.

