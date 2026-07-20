unit fmcancelamentocontratos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, Windows,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, {Qete,}
  ComCtrls,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio,
  // Componentes
  cpdbfindcontrols, cpdata, cpdbgrid, cpdbtext,
  // Repositorio
  fmconsultaporcampo, fmconsultabasica, fmajudabt,
  // tecsoft
  clparametrossistema,
  // Outros
  dmcancelamentocontratos, cpnumero, ActnList, DB, ZPgSqlQuery, cpquery,
  ToolWin;

type
  TfrmCancelamentoContratos = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    sbnCancelar: TSpeedButton;
    gbxCancelamento: TGroupBox;
    dbgContratos: TtecDBGrid;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    edtQtdeContratos: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblTotalMarcados: TLabel;
    edtTotalContratos: TEditNumero;
    edtTotalMarcados: TEditNumero;
    ckbSelecionarTodos: TCheckBox;
    gbxDataEmissao: TGroupBox;
    lblDataEmissao: TLabel;
    edtDataEmissao: TEditData;
    rgbOperacao: TRadioGroup;
    gbxFilial: TGroupBox;
    sbnProcuraFilial: TSpeedButton;
    edfFilial: TtecDbEditFind;
    dtxDescricaoFilial: TtecDBText;
    lblFilial: TLabel;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxMotivo: TGroupBox;
    sbnMotivo: TSpeedButton;
    edfMotivo: TtecDbEditFind;
    dbxDescricaoMotivo: TtecDBText;
    Label1: TLabel;
    lblVendedor: TLabel;
    sbnVendedor: TSpeedButton;
    lblCliente: TLabel;
    edfCliente: TtecDbEditFind;
    sbnCliente: TSpeedButton;
    dtxDescricaoCliente: TtecDBText;
    edfVendedor: TtecDbEditFind;
    dtxDescricaoVendedor: TtecDBText;
    procedure actHabilitarUpdate(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgContratosDblClick(Sender: TObject);
    procedure dbgContratosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
              State: TGridDrawState);
    procedure dbgContratosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnCancelarClick(Sender: TObject); virtual;
    procedure sbnGerarClick(Sender: TObject); virtual;
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure sbnVendedorClick(Sender: TObject);
    procedure edtDataEmissaoExit(Sender: TObject);
    procedure rgbOperacaoClick(Sender: TObject);
    procedure sbnMotivoClick(Sender: TObject);
    procedure sbnClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    dtmCancelamentoContratos: TdtmCancelamentoContratos;
    TipoConsulta: TtecContratoTipoConsulta;
    procedure AtualizarContadores(SoMarcados: Boolean);
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCampos: Boolean;
    procedure ZerarContadores;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   RefazConsulta;
  end;

var
  frmCancelamentoContratos: TfrmCancelamentoContratos;
  TipoPesquisa: TtecCancelamentoContratos;

implementation

Uses
  //Projetos
 fmcadastrocontratos, fmoperacoescontratos;

{$R *.dfm}

procedure TfrmCancelamentoContratos.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnCancelar.Enabled := dtmCancelamentoContratos.QtdeMarcados > 0;
  sbnGerar.Enabled    := not sbnCancelar.Enabled;
  case rgbOperacao.ItemIndex of
    0: begin
        if parsistema.ExclusaoContrato = excEXCLUIR then
        begin
         sbnCancelar.Caption:= 'Excluir F7';
         sbnCancelar.Hint := 'Excluir Contratos';
        end
        else if parsistema.ExclusaoContrato = excCANCELAR then
        begin
         sbnCancelar.Caption:= 'Cancelar F7';
         sbnCancelar.Hint := 'Cancelar Contratos';
        end
        else if parsistema.ExclusaoContrato = excPERGUNTAR then
        begin
         sbnCancelar.Caption:= 'Canc./Exc.F7';
         sbnCancelar.Hint := 'Cancelar ou Excluir Contratos';
        end;
       end;
    1,2: begin
          sbnCancelar.Caption:= 'Cancelar F7';
          sbncancelar.Hint := 'Cancelar Contratos';
         end;
  end;
end;

procedure TfrmCancelamentoContratos.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmCancelamentoContratos do begin
    if not SoMarcados then begin
      edtQtdeContratos.Text  := IntToStr(QtdeContratos);
      edtTotalContratos.Text := Format('%8.2m', [TotalContratos]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmCancelamentoContratos.ckbSelecionarTodosClick(Sender: TObject);
begin
  dtmCancelamentoContratos.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

constructor TfrmCancelamentoContratos.Create(AOwner: TComponent);
begin
  dtmCancelamentoContratos:= TdtmCancelamentoContratos.Create(Self);
  inherited;
  with dtmCancelamentoContratos do
    edtDataEmissao.Text := DateToStr(DataServidor - 30);
  AtualizarContadores(False);
{  Frm := TfrmCadastroContratos.Referencia;
  if Assigned(Frm) then begin
    TfrmCadastroContratos(Frm).OperacaoContratoAberto := True;
    MensagemAviso(ctCANCELAMENTOCONTRATOABERTO);
  end }
end;

procedure TfrmCancelamentoContratos.dbgContratosDblClick(Sender: TObject);
begin
  dtmCancelamentoContratos.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmCancelamentoContratos.dbgContratosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if dbgContratos.DataSource.DataSet.FieldByName('selecionar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmCancelamentoContratos.dbgContratosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmCancelamentoContratos.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

destructor TfrmCancelamentoContratos.Destroy;
begin
  dtmCancelamentoContratos:=nil;
  inherited;
  frmCancelamentoContratos:= nil;
end;

function TfrmCancelamentoContratos.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmCancelamentoContratos do begin
    case TipoPesquisa of
      cctFILIAIS   : Result:= ExisteFilial(NomeCampo,Value);
      cctVENDEDORES: Result:= ExisteVendedor(NomeCampo,Value);
      cctCLIENTES  : Result:= ExisteCliente(NomeCampo,Value);
      cctMOTIVOS   : Result:= ExisteMotivo(NomeCampo,Value);
      else           Result:= False;
    end;
  end;
end;

function TfrmCancelamentoContratos.InternoPesquisar(Titulo: string): Integer;
begin
  Result:= mrNone;
  with dtmCancelamentoContratos do begin
    if CtrlOn then begin
      if (ActiveControl = edfFilial) then begin
        Titulo:= 'Filiais';
        TipoPesquisa:= cctFILIAIS;
      end
      else if (ActiveControl = edfVendedor) then begin
        Titulo:= 'Vendedores';
        TipoPesquisa:= cctVENDEDORES;
      end
      else if (ActiveControl = edfMotivo) then
      begin
        Titulo := 'Motivos';
        TipoPesquisa := cctMotivos;
      end
      else if (ActiveControl = edfCliente) then
      begin
        Titulo := 'Clientes';
        TipoPesquisa := cctCLIENTES;
      end
      else TipoPesquisa:= cctNENHUM;

      AbreTabelaConsulta(TipoPesquisa);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaConsulta(TipoPesquisa);
    end;
  end;
end;

function TfrmCancelamentoContratos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := not (TipoPesquisa  in [cctVendedores, cctClientes]) and CtrlOn;
  if TipoPesquisa in [cctVENDEDORES,cctClientes] then
     TfrmConsultaPorCampo(result).UsarParametrosDaTabela := false;

{
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoConsulta in [ctcCONTRATO, ctcCLIENTES, ctcCONJUGE, ctcAVALISTA]) and CtrlOn;
  Jan.UsarParametrosDaTabela := not (TipoConsulta = ctcDEPENDENTE);
  Result := Jan}
end;

procedure TfrmCancelamentoContratos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE: begin
                  dtmCancelamentoContratos.FecharConsultaContratos;
                  rgbOperacao.SetFocus;
                end;
       VK_F6 : if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
       VK_F7 : if not CtrlOn and sbnCancelar.Enabled then sbnCancelar.Click;
  end;
end;

procedure TfrmCancelamentoContratos.sbnCancelarClick(Sender: TObject);
var
  Frm: TForm;
  Contratos: vString;
  CodMotivo:String;
begin
  Contratos := nil;
  Frm := TfrmCadastroContratos.Referencia;
  CodMotivo := edfMotivo.Text;
  if Assigned(Frm) then begin
    Contratos := dtmCancelamentoContratos.Selecionados;
    dtmCancelamentoContratos.CodigoMotivoCancelamento := -1;
    if Trim(edfMotivo.Text)<>'' then
    begin
      if dtmCancelamentoContratos.VerificarExisteMotivo(StrToInt(CodMotivo)) then
      begin
        dtmCancelamentoContratos.CodigoMotivoCancelamento := StrToInt(CodMotivo);
      end;
    end;
    if dtmCancelamentoContratos.ConfirmaOperacao(rgbOperacao.ItemIndex, TfrmCadastroContratos(Frm).NumeroContrato) then
      TfrmCadastroContratos(Frm).SelecionarContrato(Contratos);
  end
  else
  begin
    dtmCancelamentoContratos.CodigoMotivoCancelamento := -1;
    if Trim(edfMotivo.Text)<>'' then
    begin
      if dtmCancelamentoContratos.VerificarExisteMotivo(StrToInt(CodMotivo)) then
      begin
        dtmCancelamentoContratos.CodigoMotivoCancelamento := StrToInt(CodMotivo);
      end;
    end;
    dtmCancelamentoContratos.ConfirmaOperacao(rgbOperacao.ItemIndex, '');
  end;
  Frm := TfrmOperacoesContratos.Referencia;
  if Assigned(Frm)  then
    TfrmOperacoesContratos(Frm).RefazConsulta;
  AtualizarContadores(False);
end;

procedure TfrmCancelamentoContratos.sbnGerarClick(Sender: TObject);
begin
  if ValidarCampos then begin
    with dtmCancelamentoContratos do begin
      Filial     := edfFilial.Text;
      Vendedor   := edfVendedor.Text;
      Cliente    := edfCliente.Text;
      DataEmissao:= edtDataEmissao.Text;
      Situacao   := rgbOperacao.ItemIndex;
      if AbrirConsultaContratos then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['Contrato']));
        rgbOperacao.SetFocus;
      end
      else dbgContratos.SetFocus;
      AtualizarContadores(False);
    end;
  end
  else
    MensagemAviso('Os controles devem ser preenchidos com uma informação válida.');
end;

procedure TfrmCancelamentoContratos.sbnProcuraFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoContratos.sbnVendedorClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfVendedor.SetFocus;
  InternoPesquisar('');
end;

function TfrmCancelamentoContratos.TabelaDePesquisa: TZdataSet;
begin
  with dtmCancelamentoContratos do
    case TipoPesquisa of
      cctFILIAIS   : Result:= ConsultarFilial;
      cctVENDEDORES: Result:= ConsultarVendedor;
      cctCLIENTES  : Result:= ConsultarCliente;
      cctMOTIVOS: Result := ConsultarMotivos;
      else           Result:= nil;
    end;
end;

function TfrmCancelamentoContratos.ValidarCampos: Boolean;
begin
  Result:= (edtDataEmissao.Text <> '') and edtDataEmissao.Criticar(False);
  if Result then
    Result := OperadorTernario(Trim(edfFilial.Text) <> '',(edfFilial.Exist), True);
//-------------teste carlos (estava em comentário)------
  if Result then
     Result := OperadorTernario(Trim(edfVendedor.Text) <> '',(edfVendedor.Exist), True);
end;

procedure TfrmCancelamentoContratos.ZerarContadores;
begin
  edfFilial.SetFocus;
  edtQtdeContratos.Clear;
  edtQtdeMarcados.Clear;
  edtTotalContratos.Clear;
  edtTotalMarcados.Clear;
end;


procedure TfrmCancelamentoContratos.edtDataEmissaoExit(Sender: TObject);
begin
  inherited;
  with dtmCancelamentoContratos do begin
   if (edtDataEmissao.Text <> '') and edtDataEmissao.Criticar(False) then begin
     qryVendedores.ParamByName('dataemissao').AsDateTime:= StrToDate(edtDataEmissao.Text);
     qryConsultaVendedores.ParamByName('dataemissao').AsDateTime:= StrToDate(edtDataEmissao.Text);
   end;
  end;
end;

procedure TfrmCancelamentoContratos.RefazConsulta;
begin
  dtmCancelamentoContratos.AbrirConsultaContratos
end;

procedure TfrmCancelamentoContratos.rgbOperacaoClick(Sender: TObject);
begin
  inherited;
  dtmCancelamentoContratos.FecharConsultaContratos
end;

procedure TfrmCancelamentoContratos.sbnMotivoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfMotivo.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoContratos.sbnClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCliente.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoContratos.FormShow(Sender: TObject);
begin
  inherited;
  edfFilial.SetFocus;
end;

end.
