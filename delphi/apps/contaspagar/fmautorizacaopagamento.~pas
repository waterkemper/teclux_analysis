unit fmautorizacaopagamento;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, fmajudabt, ComCtrls, Buttons, Grids, DBGrids,
  cpdbgrid, cpnumero, cptexto, cpdbradiogroup, cpdata, Mask,
  cpdbfindcontrols, DBCtrls, cpdbtext, cppagecontrol, biblio, Windows,
  dmautorizacaopagamento, ctconstantes, fmConsultaBasica, fmconsultaporcampo,
  // Terceiros
  zquery, ActnList, ToolWin, cpdbmemo;

type
  TfrmAutorizacaoPagamento = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxAutorizacaoPagamento: TGroupBox;
    sbnAutorizar: TSpeedButton;
    sbnGerar: TSpeedButton;
    pgcAutorizacaoPagamentos: TtecPageControl;
    tstParametros: TTabSheet;
    gbxParametros: TGroupBox;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    edfFilial: TtecDbEditFind;
    tstGrupoFilial: TTabSheet;
    sbnProcurarGrupoFilial: TSpeedButton;
    dtxGrupoFilial: TtecDBText;
    edfGrupoFilial: TtecDbEditFind;
    gbxFornecedor: TGroupBox;
    sbnProcurarFornecedor: TSpeedButton;
    dtxFornecedor: TtecDBText;
    edfFornecedor: TtecDbEditFind;
    edtVenctoInicial: TEditData;
    edtVenctoFinal: TEditData;
    tstSelecionados: TTabSheet;
    ckbSelecionarTodos: TCheckBox;
    edtLanctoInicial: TEditData;
    edtLanctoFinal: TEditData;
    dbgDuplicatas: TtecDBGrid;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxLancamentos: TGroupBox;
    gbxVencimentos: TGroupBox;
    gbxSelecionadas: TGroupBox;
    gbxQtdeLidas: TGroupBox;
    gbxValorPrevisao: TGroupBox;
    gbxMarcadas: TGroupBox;
    gbxQtdeMarcadas: TGroupBox;
    gbxAutorizadas: TGroupBox;
    edtQtdeDuplicatas: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    edtTotalPrevisao: TEditNumero;
    edtTotalAutorizar: TEditNumero;
    sbnImprimir: TSpeedButton;
    lblAVenctos: TLabel;
    lblAlanctos: TLabel;
    pgcOperacao: TtecPageControl;
    tstAutorizacao: TTabSheet;
    tstCancelamento: TTabSheet;
    gbxAutorizacao: TGroupBox;
    edtAutorizacaoFinal: TEditData;
    edtAutorizacaoInicial: TEditData;
    Label1: TLabel;
    gbxObservacao: TGroupBox;
    mmoObservacaoDuplicata: TtecDBMemo;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnAutorizarClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure dbgDuplicatasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgDuplicatasDblClick(Sender: TObject);
    procedure dbgDuplicatasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcAutorizacaoPagamentosChange(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarGrupoFilialClick(Sender: TObject);
    procedure sbnProcurarFornecedorClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edfFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCamposSelecao: Boolean;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure ZerarCampos;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmAutorizacaoPagamento: TfrmAutorizacaoPagamento;
  TipoPesquisa: TtecAutorizacaoDuplicatas;

implementation

{$R *.dfm}

{ TfrmAutorizacaoPagamento }

procedure TfrmAutorizacaoPagamento.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmAutorizacaoPagamento do begin
    if not SoMarcados then begin
      edtQtdeDuplicatas.Text  := IntToStr(QtdeDuplicatas);
      edtTotalPrevisao.Text := Format('%8.2m', [TotalDuplicatas]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalAutorizar.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

constructor TfrmAutorizacaoPagamento.Create(AOwner: TComponent);
begin
  dtmAutorizacaoPagamento:= TdtmAutorizacaoPagamento.Create(Self);
  inherited;
  pgcFilialGrupoFilial.ActivePage:= tstFilial;
  with dtmAutorizacaoPagamento do begin
    Abre(ctTabelas);
    edtVenctoInicial.Text := DateToStr(DataServidor);
    edtVenctoFinal.Text   := DateToStr(DataServidor);

    edtAutorizacaoInicial.Text := DateToStr(DataServidor);
    edtAutorizacaoFinal.Text   := DateToStr(DataServidor);

  end;
end;

destructor TfrmAutorizacaoPagamento.Destroy;
begin
  dtmAutorizacaoPagamento:=nil;
  inherited;
  frmAutorizacaoPagamento:= nil;
end;

function TfrmAutorizacaoPagamento.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  Result:= False;
  with dtmAutorizacaoPagamento do
    case TipoPesquisa of
           audFILIAIS: Result:= ExisteFiliais(NomeCampo, Value);
     audGRUPOSFILIAIS: Result:= ExisteGrupoFiliais(NomeCampo, Value);
      audFORNECEDORES: Result:= ExisteFornecedores(NomeCampo, Value);
    end;
end;

function TfrmAutorizacaoPagamento.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFilial then begin
        TipoPesquisa := audFILIAIS;
        Titulo       := 'Filiais';
      end
      else if ActiveControl = edfGrupoFilial then begin
        TipoPesquisa := audGRUPOSFILIAIS;
        Titulo       := 'Grupo Filiais';
      end
      else if ActiveControl = edfFornecedor then begin
        TipoPesquisa := audFORNECEDORES;
        Titulo       := 'Fornecedores';
      end;

      with dtmAutorizacaoPagamento do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmAutorizacaoPagamento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = audFORNECEDORES then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmAutorizacaoPagamento.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5 : if sbnAutorizar.Enabled and not CtrlOn then sbnAutorizar.Click;
    VK_F6 : if sbnGerar.Enabled and not CtrlOn then sbnGerar.Click;
    VK_F7 : if sbnAutorizar.Enabled and not CtrlOn then sbnAutorizar.Click;
    VK_Escape: if pgcAutorizacaoPagamentos.ActivePage = tstSelecionados then
                  pgcAutorizacaoPagamentos.ActivePage:= tstParametros;
  end;
end;

function TfrmAutorizacaoPagamento.TabelaDePesquisa: TZdataSet;
begin
  with dtmAutorizacaoPagamento do
    case TipoPesquisa of
             audFILIAIS: Result:= ConsultaFiliais;
       audGRUPOSFILIAIS: Result:= ConsultaGrupoFiliais;
        audFORNECEDORES: Result:= ConsultaFornecedores;
        else             Result:= nil;
    end;
end;

function TfrmAutorizacaoPagamento.ValidarCamposSelecao: Boolean;
begin
  Result:= edtVenctoInicial.DataValida and edtVenctoFinal.DataValida and
           edtLanctoInicial.DataValida and edtLanctoFinal.DataValida;
  if Result then
    Result := OperadorTernario((Trim(edfFilial.Text) <> ''),edfFilial.Exist, True)           and
              OperadorTernario((Trim(edfGrupoFilial.Text) <> ''),edfGrupoFilial.Exist, True) and
              OperadorTernario((Trim(edfFornecedor.Text) <> ''),edfFornecedor.Exist, True);
end;

procedure TfrmAutorizacaoPagamento.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then begin
    with dtmAutorizacaoPagamento do begin
      LanctoInicial := edtLanctoInicial.Text;
      LanctoFinal   := edtLanctoFinal.Text;
      VenctoInicial := edtVenctoInicial.Text;
      VenctoFinal   := edtVenctoFinal.Text;
      AutorizacaoInicial := edtAutorizacaoInicial.Text;
      AutorizacaoFinal   := edtAutorizacaoFinal.Text;
      Filial        := edfFilial.Text;
      Grupo         := edfGrupoFilial.Text;
      Fornecedor    := edfFornecedor.Text;
      Operacao      := pgcOperacao.ActivePageIndex;
      if not SelecionarDuplicatas then
         pgcAutorizacaoPagamentos.ActivePage:= tstSelecionados
      else begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        case Operacao of
         0: edtVenctoInicial.SetFocus;
         1: edtAutorizacaoInicial.SetFocus;
        end;
      end;
      AtualizarContadores(False);
    end;
  end;
end;

procedure TfrmAutorizacaoPagamento.sbnAutorizarClick(Sender: TObject);
begin
  inherited;
  dtmAutorizacaoPagamento.AutorizarPagamentos(false);
  AtualizarContadores(false);
end;

procedure TfrmAutorizacaoPagamento.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  with dtmAutorizacaoPagamento do begin
    case TipoPessoa[1] of
      'F': gbxFornecedor.Caption:= 'FORNECEDOR';
      'C': gbxFornecedor.Caption:= 'CLIENTE FORNECEDOR';
      'L': gbxFornecedor.Caption:= 'FILIAL FORNECEDOR';
    end;
    sbnGerar.Enabled            := pgcAutorizacaoPagamentos.ActivePage = tstParametros;
    sbnAutorizar.Enabled        := QtdeMarcados > 0;
    sbnImprimir.Enabled         := sbnAutorizar.Enabled;
    case pgcOperacao.ActivePageIndex of
      0: sbnAutorizar.Caption := 'Autorizar F5';
      1: sbnAutorizar.Caption := 'Cancelar F5';
    end;
  end;
end;

procedure TfrmAutorizacaoPagamento.dbgDuplicatasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  
  if dbgDuplicatas.DataSource.DataSet.FieldByName('observacao').Asstring='' then
    TDBGrid(Sender).Canvas.Font.Style := []
  else
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  if dbgDuplicatas.DataSource.DataSet.FieldByName('selecionar').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmAutorizacaoPagamento.dbgDuplicatasDblClick(Sender: TObject);
begin
  inherited;
  dtmAutorizacaoPagamento.MarcarRegistrosSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmAutorizacaoPagamento.dbgDuplicatasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Space then
    if Shift = [ssCtrl] then begin
      dtmAutorizacaoPagamento.MarcarRegistrosSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmAutorizacaoPagamento.ZerarCampos;
begin
  edtQtdeDuplicatas.Clear;
  edtTotalPrevisao.Clear;
  edtQtdeMarcados.Clear;
  edtTotalAutorizar.Clear;
end;

procedure TfrmAutorizacaoPagamento.pgcAutorizacaoPagamentosChange(Sender: TObject);
begin
  inherited;
  with dtmAutorizacaoPagamento do begin
    if pgcAutorizacaoPagamentos.ActivePage = tstParametros then begin
      FecharTabelaDuplicatas;
      ZerarCampos;
      ckbSelecionarTodos.Checked:= False;
      QtdeMarcados  := 0;
      TotalMarcados := 0;
    end;
  end;
end;

procedure TfrmAutorizacaoPagamento.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmAutorizacaoPagamento.sbnProcurarGrupoFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmAutorizacaoPagamento.sbnProcurarFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmAutorizacaoPagamento.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmAutorizacaoPagamento.MarcarRegistrosSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmAutorizacaoPagamento.FormShow(Sender: TObject);
begin
  inherited;
  pgcAutorizacaoPagamentos.ActivePageIndex := 0;
  edtVenctoInicial.SetFocus;
end;

procedure TfrmAutorizacaoPagamento.edfFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    sbnGerar.Click;
end;

procedure TfrmAutorizacaoPagamento.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmAutorizacaoPagamento.AutorizarPagamentos(true);
end;

end.
