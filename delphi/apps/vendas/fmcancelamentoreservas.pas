unit fmcancelamentoreservas;

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
  // Outros
  dmcancelamentoreservas, cpnumero, ActnList, ToolWin;

type
  TfrmCancelamentoReservas = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    sbnCancelar: TSpeedButton;
    gbxCancelamento: TGroupBox;
    dbgReservas: TtecDBGrid;
    ckbSelecionarTodos: TCheckBox;
    gbxDataEmissao: TGroupBox;
    lblDataEmissao: TLabel;
    edtDataEmissao: TEditData;
    gbxVendedor: TGroupBox;
    sbnVendedor: TSpeedButton;
    edfVendedor: TtecDbEditFind;
    dtxDescricaoVendedor: TtecDBText;
    lblVendedor: TLabel;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxReservas: TGroupBox;
    lblQtdeReservas: TLabel;
    lblQtdeMarcados: TLabel;
    edtQtdeReservas: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    procedure actHabilitarUpdate(Sender: TObject);
    procedure dbgReservasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
              State: TGridDrawState);
    procedure sbnCancelarClick(Sender: TObject); virtual;
    procedure sbnGerarClick(Sender: TObject); virtual;
    procedure sbnVendedorClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgReservasDblClick(Sender: TObject);
    procedure dbgReservasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataEmissaoExit(Sender: TObject);
  protected
    dtmCancelamentoReservas: TdtmCancelamentoReservas;
    procedure AtualizarContadores(SoMarcados: Boolean);
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCampos: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCancelamentoReservas: TfrmCancelamentoReservas;
  TipoPesquisa: TtecCancelamentoContratos;

implementation

{$R *.dfm}

procedure TfrmCancelamentoReservas.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnCancelar.Enabled := dtmCancelamentoReservas.QtdeMarcados > 0;
  sbnGerar.Enabled    := not sbnCancelar.Enabled;
end;

procedure TfrmCancelamentoReservas.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmCancelamentoReservas do begin
    if not SoMarcados then
      edtQtdeReservas.Text := IntToStr(QtdeReservas);
    edtQtdeMarcados.Text   := IntToStr(QtdeMarcados);
  end;
end;

procedure TfrmCancelamentoReservas.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmCancelamentoReservas.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

constructor TfrmCancelamentoReservas.Create(AOwner: TComponent);
begin
  dtmCancelamentoReservas:= TdtmCancelamentoReservas.Create(Self);
  inherited;
  with dtmCancelamentoReservas do
    edtDataEmissao.Text := DateToStr(DataServidor - 10);
  AtualizarContadores(False);
end;

procedure TfrmCancelamentoReservas.dbgReservasDblClick(Sender: TObject);
begin
  inherited;
  dtmCancelamentoReservas.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmCancelamentoReservas.dbgReservasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if dbgReservas.DataSource.DataSet.FieldByName('selecionar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmCancelamentoReservas.dbgReservasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmCancelamentoReservas.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

destructor TfrmCancelamentoReservas.Destroy;
begin
  dtmCancelamentoReservas:=nil;
  inherited;
  frmCancelamentoReservas:= nil;
end;

function TfrmCancelamentoReservas.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmCancelamentoReservas do
    Result:= ExisteVendedor(NomeCampo,Value);
end;

function TfrmCancelamentoReservas.InternoPesquisar(Titulo: string): Integer;
begin
  Result:= mrNone;
  with dtmCancelamentoReservas do begin
    if CtrlOn then begin
      AbreTabelaConsulta;
      Result := inherited InternoPesquisar('Vendedores');
      if Result = mrOK then
        Selecionar;
      FechaTabelaConsulta;
    end;
  end;
end;

function TfrmCancelamentoReservas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(result).UsarParametrosDaTabela := false;
end;

procedure TfrmCancelamentoReservas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE: begin
                  dtmCancelamentoReservas.FecharConsultaReservas;
                  edfVendedor.SetFocus;
                end;

       VK_F6 : if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
       VK_F7 : if not CtrlOn and sbnCancelar.Enabled then sbnCancelar.Click;
  end;
end;

procedure TfrmCancelamentoReservas.sbnCancelarClick(Sender: TObject);
begin
  dtmCancelamentoReservas.ConfirmaOperacao;
  AtualizarContadores(False);
end;

procedure TfrmCancelamentoReservas.sbnGerarClick(Sender: TObject);
begin
  if ValidarCampos then begin
    with dtmCancelamentoReservas do begin
      Vendedor   := edfVendedor.Text;
      DataEmissao:= edtDataEmissao.Text;
      if AbrirConsultaContratos then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['Reserva']));
        edfVendedor.SetFocus;
      end
      else begin
        AtualizarContadores(False);
        dbgReservas.SetFocus;
      end;
    end;
  end
  else
    MensagemAviso('Os controles devem ser preenchidos com uma informação válida.');
end;

procedure TfrmCancelamentoReservas.sbnVendedorClick(Sender: TObject);
begin
  CtrlOn:= True;
  InternoPesquisar('');
end;

function TfrmCancelamentoReservas.TabelaDePesquisa: TZdataSet;
begin
  with dtmCancelamentoReservas do
    Result:= ConsultarVendedor;
end;

function TfrmCancelamentoReservas.ValidarCampos: Boolean;
begin
  Result:= (edtDataEmissao.Text <> '') and edtDataEmissao.DataValida;
  if Result then
    Result := OperadorTernario(Trim(edfVendedor.Text) <> '',(edfVendedor.Exist), True);
end;


procedure TfrmCancelamentoReservas.edtDataEmissaoExit(Sender: TObject);
begin
  inherited;
  with dtmCancelamentoReservas do begin
   if (edtDataEmissao.Text <> '') and (edtDataEmissao.Criticar(False)) then begin
     qryVendedores.ParamByName('dataemissao').AsDateTime:= StrToDate(edtDataEmissao.Text);
     qryConsultaVendedores.ParamByName('dataemissao').AsDateTime:= StrToDate(edtDataEmissao.Text);
     sbnGerar.Click;
   end;
  end;
end;

end.
