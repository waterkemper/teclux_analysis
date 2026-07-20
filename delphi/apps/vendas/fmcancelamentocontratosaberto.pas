unit fmcancelamentocontratosaberto;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
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
  // Outros
  dmcancelamentocontratosaberto, cpnumero;

type
  TfrmCancelamentoContratosAberto = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    sbnCancelar: TSpeedButton;
    gbxFilial: TGroupBox;
    sbnProcuraFilial: TSpeedButton;
    edfFilial: TtecDbEditFind;
    dtxDescricaoFilial: TtecDBText;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblTotalMarcados: TLabel;
    gbxVendedor: TGroupBox;
    sbnVendedor: TSpeedButton;
    edfVendedor: TtecDbEditFind;
    dtxDescricaoVendedor: TtecDBText;
    gbxOrcados: TGroupBox;
    dbgCancelamentoContratos: TtecDBGrid;
    ckbSelecionarTodos: TCheckBox;
    pnlDatas: TPanel;
    gbxDataEmissao: TGroupBox;
    lblDataEmissao: TLabel;
    edtDataEmissao: TEditData;
    gbxDataFinanceira: TGroupBox;
    lblDataFinanceira: TLabel;
    edtDataFinenceira: TEditData;
    edtQtdeContratos: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    edtTotalContratos: TEditNumero;
    edtTotalMarcados: TEditNumero;
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure sbnVendedorClick(Sender: TObject);
    procedure dbgCancelamentoContratosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgCancelamentoContratosDblClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgCancelamentoContratosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbnGerarClick(Sender: TObject); virtual;
    procedure sbnCancelarClick(Sender: TObject); virtual;
  protected
    FDataModulo: TdtmCancelamentoContratosAberto;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    procedure Cancelamento; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PesquisaHabilitada: Boolean;
    function TituloPesquisa: String;
    procedure LimpaControles;
    procedure HabilitaControles(Value:Boolean);
    procedure AtualizarContadores(SoMarcados: Boolean);
  end;

var
  frmCancelamentoContratosAberto: TfrmCancelamentoContratosAberto;
  TipoConsulta: TtecCancelamentoContratosAberto;
  ControleValido : TWinControl;

implementation

{$R *.dfm}

constructor TfrmCancelamentoContratosAberto.Create(AOwner: TComponent);
begin
  inherited;
  edtDataEmissao.Text := DateToStr(Date - 1);
  edtDataFinenceira.Text := DateToStr(Date - 1);
  HabilitaControles(False);
end;

destructor TfrmCancelamentoContratosAberto.Destroy;
begin
  if Assigned(FDataModulo) then
    FDataModulo.Free;
  inherited;
  frmCancelamentoContratosAberto:= nil;
end;

procedure TfrmCancelamentoContratosAberto.sbnProcuraFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoContratosAberto.sbnVendedorClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfVendedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCancelamentoContratosAberto.ckbSelecionarTodosClick(Sender: TObject);
begin
  dtmCancelamentoContratosAberto.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmCancelamentoContratosAberto.dbgCancelamentoContratosDblClick(Sender: TObject);
begin
  dtmCancelamentoContratosAberto.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmCancelamentoContratosAberto.dbgCancelamentoContratosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if dbgCancelamentoContratos.DataSource.DataSet.FieldByName('selecionar').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmCancelamentoContratosAberto.dbgCancelamentoContratosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmCancelamentoContratosAberto.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

function TfrmCancelamentoContratosAberto.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  case TipoConsulta of
    ccFILIAIS   : Result:= FDataModulo.ExisteFilial(NomeCampo,Value);
    ccVENDEDORES: Result:= FDataModulo.ExisteVendedor(NomeCampo,Value);
    else          Result:= False;
  end;
end;

function TfrmCancelamentoContratosAberto.InternoPesquisar(Titulo: string): Integer;
begin
  if PesquisaHabilitada then
    with FDataModulo do
    begin
       AbreTabelaConsulta(TipoConsulta);
       Result := inherited InternoPesquisar(TituloPesquisa);
       if Result = mrOK then
          Selecionar(TipoConsulta);
       FechaTabelaConsulta(TipoConsulta);
    end
  else
  Result := 0;
end;

function TfrmCancelamentoContratosAberto.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
end;

procedure TfrmCancelamentoContratosAberto.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE: LimpaControles;
       VK_F7 : if not CtrlOn then sbnGerar.Click;
       VK_F8 : if not CtrlOn then sbnCancelar.Click;
  end;
end;

function TfrmCancelamentoContratosAberto.TabelaDePesquisa: TZdataSet;
begin
  with FDataModulo do
    case TipoConsulta of
      ccFILIAIS   : Result:= ConsultarFilial;
      ccVENDEDORES: Result:= ConsultarVendedor;
      else  Result:= nil;
    end;
end;

function TfrmCancelamentoContratosAberto.TituloPesquisa: String;
begin
  case TipoConsulta of
      ccFILIAIS: Result := 'Filial';
   ccVENDEDORES: Result := 'Vendedor';
  end;
end;

procedure TfrmCancelamentoContratosAberto.AtualizarContadores(SoMarcados: Boolean);
begin
  with FDataModulo do begin
    if not SoMarcados then begin
      edtQtdeContratos.Text  := IntToStr(QtdeContratos);
      edtTotalContratos.Text := Format('%8.2m', [TotalContratos]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmCancelamentoContratosAberto.LimpaControles;
begin
  with FDataModulo do
  begin
    Selecionar(ccFILIAIS);
    Selecionar(ccVENDEDORES);
    qryContratos.Close;
  end;
  edfFilial.SetFocus;
  HabilitaControles(False);
  edtQtdeContratos.Clear;
  edtQtdeMarcados.Clear;
  edtTotalContratos.Clear;
  edtTotalMarcados.Clear;
end;

procedure TfrmCancelamentoContratosAberto.HabilitaControles(Value: Boolean);
begin
  dbgCancelamentoContratos.Enabled := Value;
end;

function TfrmCancelamentoContratosAberto.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if CtrlOn then
  begin
    if ActiveControl is TtecDBEditFind then
    begin
      if ActiveControl = edfFilial then
        TipoConsulta := ccFILIAIS
      else
        TipoConsulta := ccVENDEDORES;
      Result := True;
    end;
  end;
end;

procedure TfrmCancelamentoContratosAberto.sbnGerarClick(Sender: TObject);
begin
  with FDataModulo do
  begin
    DataEmissao := edtDataEmissao.Text;
    DataFinanceira := edtDataFinenceira.Text;
    Filial := edfFilial.Text;
    Vendedor := edfVendedor.Text;
    ReFazConsultaContratosAberto(ckbSelecionarTodos.Checked);
    if not ConsultaVazia then
    begin
       HabilitaControles(True);
       AtualizarContadores(False);
    end;
  end;
end;

procedure TfrmCancelamentoContratosAberto.sbnCancelarClick(Sender: TObject);
begin
  with FDataModulo do
    if QtdeMarcados > 0 then
    begin
      if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['os contratos'])) = smbOK then
        Cancelamento;
    end
    else
      MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['contrato']));
end;

procedure TfrmCancelamentoContratosAberto.Cancelamento;
begin
end;

end.
