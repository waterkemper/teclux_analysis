unit fmcancelamentoquitacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, cpnumero, Grids, DateUtils,
  DBGrids, cpdbgrid, cpdata, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  cppagecontrol, dmcancelamentoquitacao, fmconsultabasica, fmconsultaporcampo,
  zquery, ctconstantes, Windows, cpeditioncontrolvalidation, biblio, ActnList,
  clparametrossistema, fmcontaspagar, fmquitacaoduplicatas, ToolWin;

type
  TfrmCancelamentoQuitacao = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;                                
    sbnConfirma: TSpeedButton;
    pgcCancelamentoQuitacao: TtecPageControl;
    tstParametros: TTabSheet;
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
    dtxFornecedor: TtecDBText;
    edfFornecedor: TtecDbEditFind;
    tstSelecionados: TTabSheet;
    dbgSelecionados: TtecDBGrid;
    ckbSelecionarTodos: TCheckBox;
    sbnProcurarFornecedor: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    rgpOrdenacao: TRadioGroup;
    gbxConta: TGroupBox;
    edfConta: TtecDbEditFind;
    dtxDigito: TtecDBText;
    Label1: TLabel;
    gbxSiglaBanco: TGroupBox;
    gbxLidos: TGroupBox;
    gbxNrLidos: TGroupBox;
    gbxValorPagos: TGroupBox;
    gbxMarcadas: TGroupBox;
    gbxQtdeMarcadas: TGroupBox;
    gbxValorCancelado: TGroupBox;
    edtQtdeDuplicatas: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    edtTotalDuplicatas: TEditNumero;
    edtTotalMarcados: TEditNumero;
    gbxPeriodoPagtos: TGroupBox;
    edtPagtoInicial: TEditData;
    edtPagtoFinal: TEditData;
    sbnProcurarConta: TSpeedButton;
    dtxNomebanco: TtecDBText;
    dtxNomeagencia: TtecDBText;
    gbxContaCredito: TGroupBox;
    sbnCreditarPagamento: TSpeedButton;
    dtxCreditarPagamento: TtecDBText;
    edfCreditarPagamento: TtecDbEditFind;
    lblA: TLabel;
    gbxOrdenacao: TGroupBox;
    procedure pgcFilialGrupoFilialChange(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgSelecionadosDblClick(Sender: TObject);
    procedure dbgSelecionadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarGrupoFilialClick(Sender: TObject);
    procedure sbnProcurarFornecedorClick(Sender: TObject);
    procedure edtPagtoInicialEnter(Sender: TObject);
    procedure aclHabilitarUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure edtPagtoFinalEnter(Sender: TObject);
    procedure pgcCancelamentoQuitacaoChange(Sender: TObject);
    procedure dbgSelecionadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbnProcurarContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbnCreditarPagamentoClick(Sender: TObject);
  private
    fdtmCancelamentoQuitacao: TdtmCancelamentoQuitacao;
  protected
//    dtmCancelamentoQuitacao: TdtmCancelamentoQuitacao;
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
    property dtmCancelamentoQuitacao: TdtmCancelamentoQuitacao read fdtmCancelamentoQuitacao write fdtmCancelamentoQuitacao;
  end;

var
  frmCancelamentoQuitacao: TfrmCancelamentoQuitacao;
  TipoPesquisa: TtecCancelamentoQuitacao;


implementation

{$R *.dfm}

{ TfrmCancelamentoQuitacao }

procedure TfrmCancelamentoQuitacao.aclHabilitarUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  inherited;
  with dtmCancelamentoQuitacao do begin
    case TipoPessoa[1] of
      'F': gbxFornecedor.Caption:= 'FORNECEDOR';
      'C': gbxFornecedor.Caption:= 'CLIENTE FORNECEDOR';
      'L': gbxFornecedor.Caption:= 'FILIAL FORNECEDOR';
    end;
    sbnGerar.Enabled          := pgcCancelamentoQuitacao.ActivePage = tstParametros;
    sbnConfirma.Enabled       := QtdeMarcados > 0;
    ckbSelecionarTodos.Enabled:= QtdeDuplicatas > 0;
  end;
end;

procedure TfrmCancelamentoQuitacao.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmCancelamentoQuitacao do begin
    if not SoMarcados then begin
      edtQtdeDuplicatas.Text  := IntToStr(QtdeDuplicatas);
      edtTotalDuplicatas.Text := Format('%8.2m', [TotalDuplicatas]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmCancelamentoQuitacao.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmCancelamentoQuitacao.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

constructor TfrmCancelamentoQuitacao.Create(AOwner: TComponent);
begin

  self.dtmCancelamentoQuitacao := TdtmCancelamentoQuitacao.Create(Self);
  dtmCancelamentoQuitacao := self.dtmCancelamentoQuitacao;

  inherited;
  dtmCancelamentoQuitacao.Abre(ctTabelas);
  edtPagtoInicial.Text:= DateToStr(Date);
  edtPagtoFinal.Text  := DateToStr(Date);
  pgcCancelamentoQuitacao.ActivePageIndex:=0;
  gbxContaCredito.Visible := ParSistema.GerarContabilidade;
  edtPagtoInicial.SelectAll;

end;

procedure TfrmCancelamentoQuitacao.dbgSelecionadosDblClick(Sender: TObject);
begin
  inherited;
  dtmCancelamentoQuitacao.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmCancelamentoQuitacao.dbgSelecionadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgSelecionados.DataSource.DataSet.FieldByName('quitar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmCancelamentoQuitacao.dbgSelecionadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Space then
    if Shift = [ssCtrl] then begin
      dtmCancelamentoQuitacao.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

destructor TfrmCancelamentoQuitacao.Destroy;
begin
//  dtmCancelamentoQuitacao.free;
//  dtmCancelamentoQuitacao:=nil;
  inherited;
  frmCancelamentoQuitacao:= nil;
end;

procedure TfrmCancelamentoQuitacao.edtPagtoFinalEnter(Sender: TObject);
begin
  inherited;
  with dtmCancelamentoQuitacao do
    edtPagtoFinal.Minimo:= DaysBetween(DataServidor,StrToDate(edtPagtoInicial.Text));
end;

procedure TfrmCancelamentoQuitacao.edtPagtoInicialEnter(Sender: TObject);
begin
  inherited;
  with dtmCancelamentoQuitacao do
    edtPagtoInicial.Minimo:= DaysBetween(DataServidor,DataContabil+1);
end;

function TfrmCancelamentoQuitacao.ExisteInformacao(Parametro: Integer;
  NomeCampo: string; Value: Variant): Boolean;
begin
   with dtmCancelamentoQuitacao do begin
      case TipoPesquisa of
         cdpFILIAIS:      Result:= ExisteFiliais     (NomeCampo, Value);
         cdpGRUPOFILIAIS: Result:= ExisteGrupoFiliais(NomeCampo, Value);
         cdpFORNECEDORES: Result:= ExisteFornecedores(NomeCampo, Value);
         cdpCONTA:        Result:= ExisteConta       (NomeCampo, Value);
         cdpCONTACREDITOPAGAMENTO : result := ExistecontaContabil(NomeCampo, Value);
         else             Result:= False;
      end;
   end;
end;

function TfrmCancelamentoQuitacao.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFilial then begin
        TipoPesquisa := cdpFILIAIS;
        Titulo       := 'Filiais';
      end
      else if ActiveControl = edfGrupoFilial then begin
        TipoPesquisa := cdpGRUPOFILIAIS;
        Titulo       := 'Grupo Filiais';
      end
      else if ActiveControl = edfFornecedor then begin
        TipoPesquisa := cdpFORNECEDORES;
        Titulo       := 'Fornecedores';
      end
      else if ActiveControl = edfConta then begin
        TipoPesquisa := cdpCONTA;
        Titulo       := 'Contas';
      end
      else if ActiveControl = edfCreditarPagamento then
        TipoPesquisa := cdpCONTACREDITOPAGAMENTO;

      with dtmCancelamentoQuitacao do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmCancelamentoQuitacao.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = cdpFORNECEDORES then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else begin
    TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
    TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
  end;
end;

procedure TfrmCancelamentoQuitacao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5: if sbnConfirma.Enabled and not CtrlOn then sbnConfirma.Click;
    VK_F6: if sbnGerar.Enabled and not CtrlOn then sbnGerar.Click;
    VK_Escape: if pgcCancelamentoQuitacao.ActivePage = tstSelecionados then
                  pgcCancelamentoQuitacao.ActivePage:= tstParametros;
  end;
end;

procedure TfrmCancelamentoQuitacao.pgcCancelamentoQuitacaoChange(Sender: TObject);
begin
  inherited;
  with dtmCancelamentoQuitacao do begin
    if pgcCancelamentoQuitacao.ActivePage = tstParametros then
    begin
      ckbSelecionarTodos.Checked:= False;
      QtdeMarcados := 0;
      TotalMarcados:= 0;
      ZerarCampos;
      ZerarConsultaDuplicatas;
      edtPagtoInicial.SetFocus;
    end;
  end;
end;

procedure TfrmCancelamentoQuitacao.pgcFilialGrupoFilialChange(Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilial.ActivePage = tstFilial then begin
    edfGrupoFilial.Clear;
    edfFilial.setFocus;
  end
  else begin
    edfFilial.Clear;
    edfGrupoFilial.setFocus;
  end;
end;

procedure TfrmCancelamentoQuitacao.sbnConfirmaClick(Sender: TObject);
var
  Frm, FrmQuitacao: TForm;
begin
  inherited;
  Frm := TfrmContasPagar.Referencia;
  if Assigned(Frm) then
    dtmCancelamentoQuitacao.DocumentoPagAberto := TfrmContasPagar(Frm).NumeroDocumentoPag;

  dtmCancelamentoQuitacao.ReabrirDocumentoPag := false;

  edtTotalMarcados.setfocus;
  
  dtmCancelamentoQuitacao.CancelarQuitacao;

  if dtmCancelamentoQuitacao.ReabrirDocumentoPag then
    TfrmContasPagar(Frm).ReabrirDocumentoPag;

  FrmQuitacao := TfrmQuitacaoDuplicatas.Referencia;
  if Assigned(FrmQuitacao) then
    TfrmQuitacaoDuplicatas(FrmQuitacao).sbnGerar.Click;

  AtualizarContadores(false);

  dbgSelecionados.setfocus;

    

end;

procedure TfrmCancelamentoQuitacao.sbnGerarClick(Sender: TObject);
begin
   inherited;
   if ValidarCamposSelecao
   then with dtmCancelamentoQuitacao do begin
      PagtoInicial:= edtPagtoInicial.Text;
      PagtoFinal  := edtpagtoFinal.  Text;
      Filial      := edfFilial.      Text;
      Grupo       := edfGrupoFilial. Text;
      Fornecedor  := edfFornecedor.  Text;
      Conta       := edfConta.       Text;

      if RgpOrdenacao.ItemIndex = 0
      then FOrdenacaoDuplicata:= 'D'
      else FOrdenacaoDuplicata:= 'N';

      if not SelecionarDuplicatas
      then pgcCancelamentoQuitacao.ActivePage:= tstSelecionados
      else begin
         MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
         edtPagtoInicial.SetFocus;
      end;
      AtualizarContadores(False);
   end;
end;


procedure TfrmCancelamentoQuitacao.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoQuitacao.sbnProcurarFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoQuitacao.sbnProcurarGrupoFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFilial.SetFocus;
  InternoPesquisar('');
end;

function TfrmCancelamentoQuitacao.TabelaDePesquisa: TZdataSet;
begin
   with dtmCancelamentoQuitacao do begin
      case TipoPesquisa of
         cdpCONTA:        Result:= ConsultaContas;
         cdpFILIAIS:      Result:= ConsultaFiliais;
         cdpFORNECEDORES: Result:= ConsultaFornecedores;
         cdpGRUPOFILIAIS: Result:= ConsultaGrupoFiliais;
cdpCONTACREDITOPAGAMENTO : result := qryConsultaContaContabil;
         else             Result:= NIL;
      end;
   end;
end;

function TfrmCancelamentoQuitacao.ValidarCamposSelecao: Boolean;
begin
  Result:= edtPagtoInicial.DataValida and edtPagtoFinal.DataValida;
  if Result then
    Result:= ((edtPagtoInicial.Text <> '') or (edtPagtoFinal.Text <> ''));
  if Result then
     Result := OperadorTernario((Trim(edfFilial.     Text) <> ''), edfFilial.     Exist, True) and
               OperadorTernario((Trim(edfGrupoFilial.Text) <> ''), edfGrupoFilial.Exist, True) and
               OperadorTernario((Trim(edfFornecedor. Text) <> ''), edfFornecedor. Exist, True) and
               OperadorTernario((Trim(edfConta.      Text) <> ''), edfConta.      Exist, True);
end;

procedure TfrmCancelamentoQuitacao.ZerarCampos;
begin
  edtQtdeDuplicatas.Clear;
  edtTotalDuplicatas.Clear;
  edtQtdeMarcados.Clear;
  edtTotalMarcados.Clear;
end;

procedure TfrmCancelamentoQuitacao.FormShow(Sender: TObject);
begin
  inherited;
  pgcCancelamentoQuitacao.ActivePageIndex:= 0;
  edtPagtoInicial.SetFocus;
end;

procedure TfrmCancelamentoQuitacao.sbnProcurarContaClick(Sender: TObject);
begin
   inherited;
   InternoPesquisar(edfConta, ctCONTAS);
end;

procedure TfrmCancelamentoQuitacao.sbnCreditarPagamentoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCreditarPagamento, ctCONTACREDITO);
end;

end.

