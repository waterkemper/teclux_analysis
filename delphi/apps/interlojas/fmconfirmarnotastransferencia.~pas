unit fmconfirmarnotastransferencia;

interface

uses
  SysUtils, Windows, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, cpdata, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, cpdbradiogroup, Grids, DBGrids,
  cpdbgrid, cppagecontrol, {Qete,} DateUtils,
  dmconfirmarnotastransferencia, ActnList, ctconstantes, biblio,
  cpeditioncontrolvalidation, clusuario, clparametrossistema, ToolWin,
  fmConferenciaProdutos;

type
  TfrmConfirmarNotasTransferencia = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxConfirmarTransferencia: TGroupBox;
    gbxPeriodoRequisicao: TGroupBox;
    lblA: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    edtFilialOrigem: TEdit;
    edtDescricaoFilialOrigem: TEdit;
    sbnGerar: TSpeedButton;
    sbnConfirmar: TSpeedButton;
    pgcNotas: TtecPageControl;
    tstNotas: TTabSheet;
    tstProdutos: TTabSheet;
    dbgNotas: TtecDBGrid;
    dbgProdutos: TtecDBGrid;
    ecvValida: TtecEditionControlValidation;
    aclHabilitar: TActionList;
    actHabilitarBotoes: TAction;
    gbxRequisitante: TGroupBox;
    gbxRequisitada: TGroupBox;
    gbxNotaFiscal: TGroupBox;
    pnlTop: TPanel;
    pnlTopNotas: TPanel;
    pnlProdutos: TPanel;
    sbnConferir: TSpeedButton;
    gbxPesquisaNFe: TGroupBox;
    edtNFE: TMaskEdit;
    gbxPesquisaNumeroFe: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    edtFilial: TMaskEdit;
    edtNumero: TMaskEdit;
    pnlLegenda: TPanel;
    shNotaImpressa: TShape;
    lblNotaFiscal: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    procedure actHabilitarBotoesUpdate(Sender: TObject);
    procedure dbgNotasDblClick(Sender: TObject);
    procedure dbgNotasDrawColumnCell(Sender: TObject; const Rect: TRect;
              DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure sbnConfirmarClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure sbnConferirClick(Sender: TObject);
    procedure edtNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);

  protected
    dtmConfirmarNotasTransferencia: TdtmConfirmarNotasTransferencia;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure ExibirMensagemPadronizadaDataInicial;
    procedure ExibirMensagemPadronizadaDataFinal;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function    ValidarInformacao: Boolean;
  end;

var
  frmConfirmarNotasTransferencia: TfrmConfirmarNotasTransferencia;
  ControleAtivo: TWinControl;

implementation

{$R *.dfm}

{ TfrmConfirmarNotasTransferencia }

procedure TfrmConfirmarNotasTransferencia.actHabilitarBotoesUpdate(Sender: TObject);
begin
  inherited;
  sbnConfirmar.Enabled   := (dtmConfirmarNotasTransferencia.QtdeMarcados > 0);
  tstProdutos.TabVisible := (dtmConfirmarNotasTransferencia.NrRegistros > 0);

  gbxPesquisaNFe.enabled := (dtmConfirmarNotasTransferencia.NrRegistros > 0);
  gbxPesquisaNumeroFe.enabled := gbxPesquisaNFe.enabled;
end;

procedure TfrmConfirmarNotasTransferencia.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutos.Columns[3].Title.Caption := dtmConfirmarNotasTransferencia.LinhadaGrade;
  dbgProdutos.Columns[4].Title.Caption := dtmConfirmarNotasTransferencia.colunadaGrade;
end;

constructor TfrmConfirmarNotasTransferencia.Create(AOwner: TComponent);
begin
  dtmConfirmarNotasTransferencia:= TdtmConfirmarNotasTransferencia.Create(Self);
  inherited;
  with dtmConfirmarNotasTransferencia do begin
    edtDataInicial.Text          := DateToStr(DataServidor);
    edtDataFinal.Text            := DateToStr(DataServidor);
    edtFilialOrigem.Text         := preencheString(IntToStr(FilialBase),'0',3,FALSE);
    edtDescricaoFilialOrigem.Text:= NomeFilialBase;
  end;
  pgcNotas.ActivePageIndex:= 0;
  dbgProdutos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmConfirmarNotasTransferencia.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  if Length(ParSistema.MascaraQuantidade) * 7 < 65
  then dbgProdutos.Columns[5].Width:= 65
  else dbgProdutos.Columns[5].Width:= Length(ParSistema.MascaraQuantidade) * 7;

  edtDataInicial.Minimo := dtmConfirmarNotasTransferencia.NDiasLimiteEmissao;
  edtDataInicial.MensagemPadronizada := ExibirMensagemPadronizadaDataInicial;

  edtDataFinal.Minimo := dtmConfirmarNotasTransferencia.NDiasLimiteEmissao;
  edtDataFinal.MensagemPadronizada := ExibirMensagemPadronizadaDataFinal;

end;

procedure TfrmConfirmarNotasTransferencia.dbgNotasDblClick(Sender: TObject);
begin
  inherited;
  if dbgNotas.Focused then
    dtmConfirmarNotasTransferencia.SelecionarRegistros;
end;

procedure TfrmConfirmarNotasTransferencia.dbgNotasDrawColumnCell(
          Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
          State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then
  begin
    if dtmConfirmarNotasTransferencia.NotaSelecionada then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

    if (dtmConfirmarNotasTransferencia.qryNotasTransferenciassituacao_romaneio.asString = 'EM TRÂNSITO') and
       (dtmConfirmarNotasTransferencia.qryNotasTransferenciassituacao_romaneio_entrada.AsString = 'NÃO CONFIRMADA') then
      TDBGrid(Sender).Canvas.Font.Color := $00006600
    else
    if (dtmConfirmarNotasTransferencia.qryNotasTransferenciassituacao_romaneio.asString = 'EM TRÂNSITO') and
       (dtmConfirmarNotasTransferencia.qryNotasTransferenciassituacao_romaneio_entrada.AsString = 'CONFIRMADA') then
      TDBGrid(Sender).Canvas.Font.Color := $000049E1
    else
    if (dtmConfirmarNotasTransferencia.qryNotasTransferenciassituacao_romaneio.asString = 'EM TRÂNSITO') and
       (dtmConfirmarNotasTransferencia.qryNotasTransferenciassituacao_romaneio_entrada.AsString = 'CONFIRMADA PARCIAL') then
      TDBGrid(Sender).Canvas.Font.Color := clRed;

    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;


end;

destructor TfrmConfirmarNotasTransferencia.Destroy;
begin
  dtmConfirmarNotasTransferencia:=nil;
  inherited;
  frmConfirmarNotasTransferencia:= nil;
end;

procedure TfrmConfirmarNotasTransferencia.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataInicial.Text) then
    edtDataFinal.Minimo:= DaysBetween(dtmConfirmarNotasTransferencia.DataServidor,
                                      StrToDate(edtDataInicial.Text));
end;

procedure TfrmConfirmarNotasTransferencia.ExibirMensagemPadronizadaDataFinal;
begin
  if strtodate(edtDataFinal.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['final',
                     edtDatafinal.Text, 'contábil', ParSistema.DataContabilstring]))
  else
  if strtodate(edtDataFinal.Text) < strtodate(edtDataInicial.Text) then
    MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['final',
                     edtDatafinal.Text, 'emissão', edtDatainicial.Text]))
end;

procedure TfrmConfirmarNotasTransferencia.ExibirMensagemPadronizadaDataInicial;
begin
  if strtodate(edtDataInicial.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['inicial',
                     edtDatainicial.Text, 'contábil', ParSistema.DataContabilstring]))
  else
    if strtodate(edtDataInicial.Text) < DataLocal - edtDataInicial.minimo then
      MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['inicial',
                       edtDataInicial.Text, 'retroativa',
                       datetostr(DataLocal - edtDataInicial.Minimo)]))
end;

procedure TfrmConfirmarNotasTransferencia.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F5 : if (Shift = []) and sbnConfirmar.Enabled then sbnConfirmar.Click;
    VK_F6 : if (Shift = []) and sbnGerar.Enabled then sbnGerar.Click;
    VK_SPACE : if (Shift = [ssCtrl]) and dbgNotas.Focused then
                  dtmConfirmarNotasTransferencia.SelecionarRegistros;
    VK_Return: if (ActiveControl = edtDataFinal) and (Shift = []) then begin
                  if edtDataFinal.DataValida then begin
                    sbnGerar.Click;
                    if (dtmConfirmarNotasTransferencia.NrRegistros > 0) then begin
                      pgcNotas.ActivePageIndex:= 0;
                      dbgNotas.SetFocus;
                    end;
                  end
                  else edtDataFinal.SetFocus;
                end
                else inherited;
    else     inherited;
  end;
end;

procedure TfrmConfirmarNotasTransferencia.sbnConfirmarClick(Sender: TObject);
var
  User: TtecUsuarios;
begin
  inherited;
  with dtmConfirmarNotasTransferencia do begin
    User:= TtecUsuarios.Create(dtmTecSoft.Database);
    try
      if not User.TransferenciaPorItem then
           User:= ObterAutorizacao(taSENHA)
      else User:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOTRANSFERENCIA, ctAUTORIZADO);

      if Assigned(User) and not User.TransferenciaPorItem then
        dtmConfirmarNotasTransferencia.ConfirmaTransferencia(User.CodigoUsuario)
      else
        MensagemAviso(format(ctUSUARIONAOAUTORIZADO,['confirmar a transferência da nota.']));
    finally
      User.Free;
    end;


  end;
end;

procedure TfrmConfirmarNotasTransferencia.sbnGerarClick(Sender: TObject);
begin
  inherited;
  with dtmConfirmarNotasTransferencia do begin
    if ValidarInformacao then begin
      DataInicial:= edtDataInicial.Text;
      DataFinal  := edtDataFinal.Text;
      if GerarConsultaNotasTransferencias then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicial.SetFocus;
      end
      else begin
        pgcNotas.ActivePageIndex:= 0;
        dbgNotas.SetFocus;
      end;
    end;
  end;
end;

function TfrmConfirmarNotasTransferencia.ValidarInformacao: Boolean;
begin
  Result:= ecvValida.Verify(gbxPeriodoRequisicao,ControleAtivo);
end;

procedure TfrmConfirmarNotasTransferencia.edtDataInicialExit(
  Sender: TObject);
begin
  inherited;
  edtDataFinal.Minimo := dtmConfirmarNotasTransferencia.NDiasLimiteData(
                          edtDataInicial.Text);
end;

procedure TfrmConfirmarNotasTransferencia.sbnConferirClick(
  Sender: TObject);
begin
  inherited;
  
  with dtmConfirmarNotasTransferencia do
    ConferirProdutos(qryProdutosTransferencia,
                     qryProdutosTransferenciaproduto.fieldname,
                     qryProdutosTransferenciaprodutovisual.FieldName,
                     qryProdutosTransferenciadescricaoproduto.FieldName,
                     qryProdutosTransferenciaquantidade.FieldName,
                     'NST',
                     qryNotasTransferenciasdadofiscal.AsString,
                     qryProdutosTransferenciavalorgrade1.FieldName,
                     qryProdutosTransferenciavalorgrade2.FieldName,
                     qryProdutosTransferencialinha.FieldName,
                     qryProdutosTransferenciacoluna.FieldName);
end;

procedure TfrmConfirmarNotasTransferencia.edtNFEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  with dtmConfirmarNotasTransferencia do
    if key = vk_return then
    begin
      if qryNotasTransferencias.locate('chv_nfe', somentenumero(edtNFE.Text), []) then
      begin
        dbgNotas.setfocus;
        dbgNotas.SelectedField := qryNotasTransferenciaschv_nfe;
        dtmConfirmarNotasTransferencia.SelecionarRegistros
      end
      else
      begin
        mensagemAviso('NFE não encontrada');
        edtNFE.setfocus;
        edtNFE.selectall;
      end;
    end;

end;

procedure TfrmConfirmarNotasTransferencia.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
  begin
    with dtmConfirmarNotasTransferencia do
      if qryNotasTransferencias.locate('serie;numero',
         VarArrayOf([edtFilial.text, edtNumero.text]), []) or
         qryNotasTransferencias.locate('numero', edtNumero.text, []) then
      begin
        dbgNotas.setfocus;
        dbgNotas.SelectedField := qryNotasTransferenciasnumero;
        dtmConfirmarNotasTransferencia.SelecionarRegistros
      end
      else
      begin
        mensagemAviso('NFE não encontrada');
        edtNumero.setfocus;
        edtNumero.selectall;
      end;
  end;

end;

end.
