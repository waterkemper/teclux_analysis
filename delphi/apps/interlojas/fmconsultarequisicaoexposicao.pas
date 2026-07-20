unit fmconsultarequisicaoexposicao;

interface

uses
  SysUtils, Windows, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajuda, fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, cpdata, {Qete,}
  DateUtils, cpdbradiogroup, Grids, DBGrids, cpdbgrid, biblio, ctconstantes,
  dmconsultarequisicaoexposicao, cpeditioncontrolvalidation, DBCtrls,
  cpdbmemo, fmcadastropadrao, ActnList, cpdbtext, cppagecontrol, clparametrossistema,
  ToolWin;

type
  TfrmConsultaRequisicaoExposicao = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxConsultaRequisicao: TGroupBox;
    sbnGerar: TSpeedButton;
    edtRequisitante: TEdit;
    edtDescricaoRequisitante: TEdit;
    gbxPeriodoRequisicao: TGroupBox;
    lblA: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    rgbSituacao: TtecDBRadioGroup;
    ckbFechado: TtecRadioButton;
    ckbAberto: TtecRadioButton;
    ckbCancelado: TtecRadioButton;
    ecvValida: TtecEditionControlValidation;
    aclHabilitar: TActionList;
    actHabilitarBotoes: TAction;
    pgcPedidosFiliais: TtecPageControl;
    tstPedidos: TTabSheet;
    tstConfirmados: TTabSheet;
    dbgConfirmados: TtecDBGrid;
    ckbConfirmado: TtecRadioButton;
    mmoObservacao: TtecDBMemo;
    dbgConsultaRequisicao: TtecDBGrid;
    gbxRequisitante: TGroupBox;
    gbxObservacoes: TGroupBox;
    gbxRequisitada: TGroupBox;
    gbxQtRequisitante: TGroupBox;
    sbnImprimir: TSpeedButton;
    procedure sbnGerarClick(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure dbgConsultaRequisicaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgConsultaRequisicaoTitleClick(Column: TColumn);
    procedure pgcPedidosFiliaisChange(Sender: TObject);
    procedure edtDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actHabilitarBotoesUpdate(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGradeConfirmados(Sender: TObject);

  protected
    dtmConsultaRequisicaoExposicao: TdtmConsultaRequisicaoExposicao;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Requisicao_AfterScroll(Sender: TObject);
  public
    function InternoCancelar: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    constructor create(AOwner: TComponent); override;
    destructor destroy; override;
  end;

var
  frmConsultaRequisicaoExposicao: TfrmConsultaRequisicaoExposicao;
  ControleAtivo: TWinControl;
  Idx: Integer;

implementation

{$R *.dfm}

{ TfrmConsultaRequisicaoExposicao }

constructor TfrmConsultaRequisicaoExposicao.create(AOwner: TComponent);
begin
  dtmConsultaRequisicaoExposicao:= TdtmConsultaRequisicaoExposicao.create(Self);
  inherited;
  DataSet:= dtmConsultaRequisicaoExposicao.TabelaRequisicao;
  dtmConsultaRequisicaoExposicao.RequisicaoAfterScroll:= Requisicao_AfterScroll;
  dtmConsultaRequisicaoExposicao.OnScrollLinhaColunaGradeConfirmados:= AfterScrollLinhaColunaGradeConfirmados;
  edtRequisitante.Text:=  IntToStr(dtmConsultaRequisicaoExposicao.FilialBase);
  edtRequisitante.Text:= preencheString(edtRequisitante.Text, '0', 3, FALSE);
  edtDescricaoRequisitante.Text := dtmConsultaRequisicaoExposicao.NomeFilialBase;
  edtDataInicial.Text           := DateToStr(dtmConsultaRequisicaoExposicao.DataServidor);
  edtDataFinal.Text             := DateToStr(dtmConsultaRequisicaoExposicao.DataServidor);
  pgcPedidosFiliais.ActivePageIndex:= 0;
  dbgConsultaRequisicao.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgConsultaRequisicao.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgConsultaRequisicao.Columns[7].Visible := ParSistema.RequisicaoSubtraiEstoque;
  //dbgConsultaRequisicao.Columns[5].Title.caption := 'Requi-'+chr(10)+'sitada';
  //dbgConsultaRequisicao.Columns[6].Title.caption := 'Estoque'+chr(10)+'Requi-'+chr(10)+'sitada';
  if dbgConsultaRequisicao.Columns[6].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgConsultaRequisicao.Columns[6].Width := ParSistema.TamanhoMascaraQuantidade;
  if dbgConsultaRequisicao.Columns[7].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgConsultaRequisicao.Columns[7].Width := ParSistema.TamanhoMascaraQuantidade;
  if dbgConsultaRequisicao.Columns[8].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgConsultaRequisicao.Columns[8].Width := ParSistema.TamanhoMascaraQuantidade;
  if dbgConsultaRequisicao.Columns[9].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgConsultaRequisicao.Columns[9].Width := ParSistema.TamanhoMascaraQuantidade;
  if dbgConsultaRequisicao.Columns[10].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgConsultaRequisicao.Columns[10].Width := ParSistema.TamanhoMascaraQuantidade;
  Idx:= 1;
end;

destructor TfrmConsultaRequisicaoExposicao.destroy;
begin
  dtmConsultaRequisicaoExposicao:=nil;
  inherited;
  frmConsultaRequisicaoExposicao:= Nil;
end;

procedure TfrmConsultaRequisicaoExposicao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F7: if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
    VK_ESCAPE: if not sbnSalvar.Enabled then begin
                  dtmConsultaRequisicaoExposicao.FecharTabelaRequisicao;
                  edtDataInicial.SetFocus;
                end;
    VK_Delete: Key:= 0
    else  inherited;
  end
end;

procedure TfrmConsultaRequisicaoExposicao.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ecvValida.Verify(gbxPeriodoRequisicao,ControleAtivo) then begin
    if pgcPedidosFiliais.ActivePageIndex <> 0 then
      pgcPedidosFiliais.ActivePageIndex := 0;
    with dtmConsultaRequisicaoExposicao do begin
      DataInicial:= edtDataInicial.Text;
      DataFinal  := edtDataFinal.Text;
      Situacao   := rgbSituacao.ItemIndex;
      if GerarConsultaRequisicao then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicial.SetFocus;
      end
      //else
      //  dbgConsultaRequisicao.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaRequisicaoExposicao.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataInicial.Text) then
    edtDataFinal.Minimo:= DaysBetween(dtmConsultaRequisicaoExposicao.DataServidor,
                                      StrToDate(edtDataInicial.Text));
end;

function TfrmConsultaRequisicaoExposicao.InternoCancelar: Boolean;
begin
  Result:= inherited InternoCancelar;
  if Result then begin
    dtmConsultaRequisicaoExposicao.FecharTabelaRequisicao;
    if pgcPedidosFiliais.ActivePageIndex <> 0 then
      pgcPedidosFiliais.ActivePageIndex := 0;
    dbgConsultaRequisicao.SetFocus;
  end;
end;

function TfrmConsultaRequisicaoExposicao.InternoExcluir: boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if dtmConsultaRequisicaoExposicao.ExcluirRequisicao then
    begin
      if pgcPedidosFiliais.ActivePageIndex <> 0 then
        pgcPedidosFiliais.ActivePageIndex := 0;
      dbgConsultaRequisicao.SetFocus;

//      sbnGerarClick(nil);
      
    end;

  end;
end;

function TfrmConsultaRequisicaoExposicao.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then begin
    dtmConsultaRequisicaoExposicao.GravarRequisicao;
    if pgcPedidosFiliais.ActivePageIndex <> 0 then
      pgcPedidosFiliais.ActivePageIndex := 0;
    dbgConsultaRequisicao.SetFocus;
  end;
end;

procedure TfrmConsultaRequisicaoExposicao.dbgConsultaRequisicaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then begin
    if dtmConsultaRequisicaoExposicao.Cancelado then begin
      TDBGrid(Sender).Canvas.Brush.Color := clRed;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
    if dtmConsultaRequisicaoExposicao.Fechado then begin
      TDBGrid(Sender).Canvas.Brush.Color := clYellow;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
    if dtmConsultaRequisicaoExposicao.Confirmado then begin
      TDBGrid(Sender).Canvas.Brush.Color := clTeal;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;  
end;

procedure TfrmConsultaRequisicaoExposicao.Requisicao_AfterScroll(Sender: TObject);
begin
  sbnGerar.Enabled              := not sbnSalvar.Enabled;
  if dtmConsultaRequisicaoExposicao.Fechado then
  begin
    tstConfirmados.TabVisible     := True;
    dbgConsultaRequisicao.ReadOnly:= True;
  end
  else
  begin
    tstConfirmados.TabVisible     := False;
    dbgConsultaRequisicao.ReadOnly:= False;
  end;
  if ParSistema.UsarGradesProdutos then
  begin
    dbgConsultaRequisicao.Columns[2].Title.Caption := dtmConsultaRequisicaoExposicao.LinhadaGradePedidos;
    dbgConsultaRequisicao.Columns[3].Title.Caption := dtmConsultaRequisicaoExposicao.ColunadaGradePedidos;
  end;
end;


procedure TfrmConsultaRequisicaoExposicao.dbgConsultaRequisicaoTitleClick(Column: TColumn);
begin
  inherited;
  if AltOn then
  begin
    if Column.Index = 4 then
    begin
      if Idx < 2 then Inc(Idx)
      else            Idx:= 1;
      case Idx of
        1: begin
             dbgConsultaRequisicao.Columns[4].Title.Caption:= 'Data...';
             dbgConsultaRequisicao.Columns[4].FieldName:= 'data';
             dbgConsultaRequisicao.Columns[4].Alignment:= taCenter;
           end;
        2: begin
             dbgConsultaRequisicao.Columns[4].Title.Caption:= 'Nota/Serie...';
             dbgConsultaRequisicao.Columns[4].FieldName:= 'nota_serie';
             dbgConsultaRequisicao.Columns[4].Alignment:= taLeftJustify;
           end;
      end;
    end;
  end;
end;

procedure TfrmConsultaRequisicaoExposicao.pgcPedidosFiliaisChange(Sender: TObject);
begin
  inherited;
  dtmConsultaRequisicaoExposicao.SelecionarPedidosConfirmados;
end;

procedure TfrmConsultaRequisicaoExposicao.AfterScrollLinhaColunaGradeConfirmados(
  Sender: TObject);
begin
  dbgConfirmados.Columns[2].Title.Caption := dtmConsultaRequisicaoExposicao.LinhadaGradeConfirmados;
  dbgConfirmados.Columns[3].Title.Caption := dtmConsultaRequisicaoExposicao.ColunadaGradeConfirmados;
end;


procedure TfrmConsultaRequisicaoExposicao.edtDataFinalKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_Return) or (Key = VK_Return)) and (Shift = []) then
  begin
    if edtDataFinal.DataValida then begin
      sbnGerar.Click;
      if (dtmConsultaRequisicaoExposicao.NrRegistro > 0) then begin
        if pgcPedidosFiliais.ActivePageIndex <> 0 then
          pgcPedidosFiliais.ActivePageIndex := 0;
        dbgConsultaRequisicao.SetFocus;
      end;
    end
    else edtDataFinal.SetFocus;
  end;
end;

procedure TfrmConsultaRequisicaoExposicao.actHabilitarBotoesUpdate(
  Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled := not sbnSalvar.Enabled;
  sbnImprimir.Enabled := (dtmConsultaRequisicaoExposicao.NrRegistro > 0);

end;

procedure TfrmConsultaRequisicaoExposicao.sbnImprimirClick(
  Sender: TObject);
begin
  inherited;
  dtmConsultaRequisicaoExposicao.ImprimirRequisicoes;
end;

end.
