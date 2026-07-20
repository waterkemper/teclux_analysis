unit fmconfirmarnotastransferenciaporitem;

interface

uses
  SysUtils, Windows, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, fmajudabt, StdCtrls,
  cpdata, Grids, DBGrids, cpdbgrid, cppagecontrol, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, dmconfirmarnotastransferenciaporitem,
  fmconsultabasica, fmconsultaporcampo, ZQuery, ActnList, {Qete,} DateUtils,
  cpeditioncontrolvalidation, biblio, ctconstantes, clusuario, clparametrossistema,
  ToolWin;

type
  TfrmConfirmarNotasTransferenciaPorItem = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxConfirmarNotasTransferecia: TGroupBox;
    sbnConfirmar: TSpeedButton;
    sbnGerar: TSpeedButton;
    edtFilialOrigem: TEdit;
    edtDescricaoFilialOrigem: TEdit;
    gbxPeriodoRequisicao: TGroupBox;
    lblA: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    edfUsuario: TtecDbEditFind;
    sbnProcuraUsuarios: TSpeedButton;
    dtxDescricaoUsuarios: TtecDBText;
    ecvValida: TtecEditionControlValidation;
    aclHabilitar: TActionList;
    actHabilitarBotoes: TAction;
    dbgPedidosFiliais: TtecDBGrid;
    gbxRequisitante: TGroupBox;
    gbxUsuario: TGroupBox;
    gbxRequisitada: TGroupBox;
    procedure actHabilitarBotoesUpdate(Sender: TObject);
    procedure dbgPedidosFiliaisDblClick(Sender: TObject);
    procedure sbnConfirmarClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcuraUsuariosClick(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure dbgPedidosFiliaisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtDataInicialExit(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);

  protected
    dtmConfirmarNotasTransferenciaPorItem: TdtmConfirmarNotasTransferenciaPorItem;
    procedure ExibirMensagemPadronizadaDataInicial;
    procedure ExibirMensagemPadronizadaDataFinal;

  public
    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ValidarInformacao: Boolean;
  end;

var
  frmConfirmarNotasTransferenciaPorItem: TfrmConfirmarNotasTransferenciaPorItem;
  ControleAtivo: TWinControl;

implementation

{$R *.dfm}

{ TfrmConfirmarNotasTransferenciaPorItem }

procedure TfrmConfirmarNotasTransferenciaPorItem.actHabilitarBotoesUpdate(Sender: TObject);
begin
  inherited;
  sbnConfirmar.Enabled:= (dtmConfirmarNotasTransferenciaPorItem.QtdeMarcados > 0);
  sbnGerar.Enabled    := (dtmConfirmarNotasTransferenciaPorItem.QtdeMarcados = 0);
end;

constructor TfrmConfirmarNotasTransferenciaPorItem.Create(AOwner: TComponent);
begin
  dtmConfirmarNotasTransferenciaPorItem:= TdtmConfirmarNotasTransferenciaPorItem.Create(Self);
  inherited;
  with dtmConfirmarNotasTransferenciaPorItem do begin
    edtFilialOrigem.Text          := preencheString(IntToStr(FilialBase),'0',3,FALSE);
    edtDescricaoFilialOrigem.Text := NomeFilialBase;
    edtDataInicial.Text := DateToStr(DataServidor);
    edtDataFinal.Text   := DateToStr(DataServidor);
  end;
  dbgPedidosFiliais.Columns[5].Visible := ParSistema.UsarGradesProdutos;
  dbgPedidosFiliais.Columns[6].Visible := ParSistema.UsarGradesProdutos;
  dtmConfirmarNotasTransferenciaPorItem.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  if Length(ParSistema.MascaraQuantidade) * 7 < 65
  then dbgPedidosFiliais.Columns[7].Width := 65
  else dbgPedidosFiliais.Columns[7].Width := Length(ParSistema.MascaraQuantidade)*7;

  edtDataInicial.Minimo := dtmConfirmarNotasTransferenciaPorItem.NDiasLimiteEmissao;
  edtDataInicial.MensagemPadronizada := ExibirMensagemPadronizadaDataInicial;

  edtDataFinal.Minimo := dtmConfirmarNotasTransferenciaPorItem.NDiasLimiteEmissao;
  edtDataFinal.MensagemPadronizada := ExibirMensagemPadronizadaDataFinal;

end;

procedure TfrmConfirmarNotasTransferenciaPorItem.dbgPedidosFiliaisDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then 
    if dtmConfirmarNotasTransferenciaPorItem.PedidoSelecionado then begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.dbgPedidosFiliaisDblClick(Sender: TObject);
begin
  inherited;
  dtmConfirmarNotasTransferenciaPorItem.SelecionarRegistros;
end;

destructor TfrmConfirmarNotasTransferenciaPorItem.Destroy;
begin
  dtmConfirmarNotasTransferenciaPorItem:=nil;
  inherited;
  frmConfirmarNotasTransferenciaPorItem:= nil;
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataInicial.Text) then
    edtDataFinal.Minimo:= DaysBetween(dtmConfirmarNotasTransferenciaPorItem.DataServidor,
                                      StrToDate(edtDataInicial.Text));
end;

function TfrmConfirmarNotasTransferenciaPorItem.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmConfirmarNotasTransferenciaPorItem.ExisteUsuarios(NomeCampo, Value);
end;

function TfrmConfirmarNotasTransferenciaPorItem.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  with dtmConfirmarNotasTransferenciaPorItem do begin
    if CtrlOn and (ActiveControl = edfUsuario) then begin
      AbrirTabelas;
      Result:= inherited InternoPesquisar('Usuários');
      if Result = mrOK then
        Selecionar;
      FecharTabelas;
    end;
  end;
end;

function TfrmConfirmarNotasTransferenciaPorItem.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F5    : if (Shift = []) and sbnConfirmar.Enabled then sbnConfirmar.Click;
    VK_F6    : if (Shift = []) and sbnGerar.Enabled then sbnGerar.Click;
    VK_SPACE : if  Shift = [ssCtrl] then dtmConfirmarNotasTransferenciaPorItem.SelecionarRegistros;
//    VK_ESCAPE: begin
//                  dtmConsultaProdutosAdquiridos.FecharTabelaProdutosAdquiridos;
//                  edfFilial.SetFocus;
//                end;
    VK_Return: if (ActiveControl = edtDataFinal) and (Shift = []) then begin
                  if edtDataFinal.DataValida then begin
                    sbnGerar.Click;
                    if (dtmConfirmarNotasTransferenciaPorItem.QtdeMarcados > 0) then
                      dbgPedidosFiliais.SetFocus;
                  end
                  else edtDataFinal.SetFocus;
                end
                else inherited;

    else  inherited;
  end
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.sbnConfirmarClick(Sender: TObject);
var
  User: TtecUsuarios;
begin
  inherited;
  with dtmConfirmarNotasTransferenciaPorItem do begin
    User:= TtecUsuarios.Create(dtmTecSoft.Database);
    try
      if (StrToInt(edfUsuario.Text) = CodigoUsuario) and User.TransferenciaPorItem then
           User:= ObterAutorizacao(taSENHA)
      else User:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOTRANSFERENCIA, ctAUTORIZADO);
      if Assigned(User) and User.TransferenciaPorItem then
        dtmConfirmarNotasTransferenciaPorItem.ConfirmarTransferencia
      else
        MensagemAviso(format(ctUSUARIONAOAUTORIZADO,['confirmar a transferência por item.']));
    finally
      User.Free;
    end;
  end;
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.sbnGerarClick(Sender: TObject);
begin
  inherited;
  with dtmConfirmarNotasTransferenciaPorItem do begin
    if ValidarInformacao then begin
      DataInicial:= edtDataInicial.Text;
      DataFinal  := edtDataFinal.Text;
      Usuario    := edfUsuario.Text;
      if GerarConsultaPedidosFiliais then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edfUsuario.SetFocus;
      end
      else
        dbgPedidosFiliais.SetFocus;
    end;
  end;
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.sbnProcuraUsuariosClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfUsuario.SetFocus;
  InternoPesquisar('');
end;

function TfrmConfirmarNotasTransferenciaPorItem.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmConfirmarNotasTransferenciaPorItem.ConsultaUsuarios;
end;

function TfrmConfirmarNotasTransferenciaPorItem.ValidarInformacao: Boolean;
begin
  Result:= (ecvValida.Verify(gbxPeriodoRequisicao,ControleAtivo) and
            OperadorTernario(edfUsuario.Text <> '',edfUsuario.Exist,False));
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgPedidosFiliais.Columns[5].Title.Caption := dtmConfirmarNotasTransferenciaPorItem.LinhadaGrade;
  dbgPedidosFiliais.Columns[6].Title.Caption := dtmConfirmarNotasTransferenciaPorItem.colunadaGrade;
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.ExibirMensagemPadronizadaDataFinal;
begin
  if strtodate(edtDataFinal.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['final',
                     edtDatafinal.Text, 'contábil', ParSistema.DataContabilstring]))
  else
  if strtodate(edtDataFinal.Text) < strtodate(edtDataInicial.Text) then
    MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['final',
                     edtDatafinal.Text, 'emissão', edtDatainicial.Text]))
end;

procedure TfrmConfirmarNotasTransferenciaPorItem.ExibirMensagemPadronizadaDataInicial;
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

procedure TfrmConfirmarNotasTransferenciaPorItem.edtDataInicialExit(
  Sender: TObject);
begin
  inherited;
  edtDataFinal.Minimo := dtmConfirmarNotasTransferenciaPorItem.NDiasLimiteData(
                          edtDataInicial.Text);
end;

end.
