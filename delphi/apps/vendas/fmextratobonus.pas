unit fmextratobonus;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, Grids, DBGrids, cpdbgrid, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, Buttons, ExtCtrls, ZQuery, {Qete,} Windows,
  //CONSTANTES
  ctconstantes,
  //REPOSITORIO
  fmconsultabasica, fmconsultaporcampo, cppagecontrol, cpnumero, fmajuda,
  //PROJETO
  dmextratobonus, ActnList, ToolWin;

type
  TfrmExtratoBonus = class(TfrmAjudaBt)
    pnlFundodaJanela: TPanel;
    gbxCliente: TGroupBox;
    lblCliente: TLabel;
    edfCodigoCliente: TtecDbEditFind;
    dtxNomeCliente: TtecDBText;
    sbnConsultaCliente: TSpeedButton;
    ckbCancelados: TCheckBox;
    pgcExtratoBonus: TtecPageControl;
    tstLancamentos: TTabSheet;
    gbxLancamentos: TGroupBox;
    shpAtraso: TShape;
    Shape1: TShape;
    dbgExtrato: TtecDBGrid;
    lblSaldoAtual: TLabel;
    dtxSaldoAtual: TtecDBText;
    Label3: TLabel;
    Label1: TLabel;
    tstProdutosResgate: TTabSheet;
    gbxProdutosResgate: TGroupBox;
    dbgProdutosResgate: TtecDBGrid;
    ckbSelecionarTodos: TCheckBox;
    sbnResgatar: TSpeedButton;
    gbxQtdes: TGroupBox;
    lblQtdeProdutos: TLabel;
    edtQtdeProdutos: TEditNumero;
    gbxValores: TGroupBox;
    lblTotalProdutos: TLabel;
    edtTotalProdutos: TEditNumero;
    lblTotalMarcados: TLabel;
    edtTotalMarcados: TEditNumero;
    lblQtdeMarcados: TLabel;
    edtQtdeMarcados: TEditNumero;
    ActionList1: TActionList;
    actHabilitarBotoes: TAction;
    procedure sbnConsultaClienteClick(Sender: TObject);
    procedure edfCodigoClienteFound(Found: Boolean);
    procedure dbgExtratoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgProdutosResgateDblClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure pgcExtratoBonusChange(Sender: TObject);
    procedure sbnResgatarClick(Sender: TObject);
    procedure dbgProdutosResgateDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgProdutosResgateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbCanceladosClick(Sender: TObject);
    procedure actHabilitarBotoesUpdate(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
    procedure LimparRegistros;
    { Private declarations }
  protected
    procedure AtualizarContadores(SoMarcados: Boolean);
    function  InternoPesquisar(Titulo: String):Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent);override;
    procedure   OperacaoPadrao(Value: array of Variant);override;
    { Public declarations }
  end;

var
  frmExtratoBonus: TfrmExtratoBonus;
  FormOrigem: String;

implementation

{$R *.dfm}

uses
  biblio, clparametrossistema, fmprincipalbasico, dmbasico;

constructor TfrmExtratoBonus.Create(AOwner: TComponent);
begin
  dtmExtratoBonus := TdtmExtratoBonus.Create(Self);
  inherited Create(AOwner);
  dtmExtratoBonus.Abre(ctTabelas);
  pgcExtratoBonus.ActivePageIndex := 0;
  dbgProdutosResgate.Columns[1].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosResgate.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosResgate.Columns[3].Visible := Not ParSistema.FiliaisIndependentes;
  dtmExtratoBonus.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
end;

function TfrmExtratoBonus.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmExtratoBonus.ExisteClientes(Parametro, NomeCampo, Value)
end;

function TfrmExtratoBonus.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if ActiveControl = edfCodigoCliente then begin
      dtmExtratoBonus.Abre(ctCrediarioConsultaClientes);
      Result := inherited InternoPesquisar('Clientes');
      if Result  = mrok then begin
        dtmExtratoBonus.Selecionar;
        dtmExtratoBonus.ReFazConsultaBonusCliente(StrToInt(edfCodigoCliente.Text), ckbCancelados.Checked);
      end;
      dtmExtratoBonus.Fecha(ctCrediarioConsultaClientes);
    end;
  end;
end;

function TfrmExtratoBonus.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmExtratoBonus.sbnConsultaClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCodigoCliente.SetFocus;
  InternoPesquisar('');
end;

function TfrmExtratoBonus.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmExtratoBonus.TabelaConsultaClientes;
end;

procedure TfrmExtratoBonus.edfCodigoClienteFound(Found: Boolean);
begin
  LimparRegistros;
  if FormOrigem <> '' then
  begin
    MensagemAviso('O cliente deve ser alterado no contrato.');
  end
  else if Found then begin
    dtmExtratoBonus.ReFazConsultaBonusCliente(StrToInt(edfCodigoCliente.Text), ckbCancelados.Checked);
  end;
  pgcExtratoBonus.ActivePageIndex := 0;
  dbgExtrato.SetFocus;
end;

procedure TfrmExtratoBonus.dbgExtratoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dtmExtratoBonus do
  begin
    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R') and
       (not TDBGrid(Sender).DataSource.DataSet.FieldByName('cancelado').AsBoolean) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := $007FAA55;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
    end
    else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('cancelado').AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clRed;
      TDBGrid(Sender).Canvas.Font.Color := clWhite;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmExtratoBonus.dbgProdutosResgateDblClick(Sender: TObject);
begin
  inherited;
  dtmExtratoBonus.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmExtratoBonus.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmExtratoBonus do begin
    if not SoMarcados then begin
      edtTotalProdutos.Text  := IntToStr(TotalProdutos);
      edtQtdeProdutos.Text   := IntToStr(QtdeProdutos);
    end;
    edtTotalMarcados.Text := Format('%8.0m', [TotalMarcados]);
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
  end;
end;

procedure TfrmExtratoBonus.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmExtratoBonus.MarcarSelecionados(ckbSelecionarTodos.Checked, True);
  AtualizarContadores(True);
end;

procedure TfrmExtratoBonus.pgcExtratoBonusChange(Sender: TObject);
begin
  inherited;
  case pgcExtratoBonus.ActivePageIndex of
  0 : begin
        if dbgExtrato.CanFocus then
          dbgExtrato.SetFocus;
      end;
  1 : begin
        if tstProdutosResgate.TabVisible then
        begin
          if dtmExtratoBonus.RefazConsultaProdutosResgate then
          begin;
            AtualizarContadores(False);
          end;
          if dbgProdutosResgate.CanFocus then
            dbgProdutosResgate.SetFocus;
        end;
      end;
  end;
end;

procedure TfrmExtratoBonus.sbnResgatarClick(Sender: TObject);
var
  variavel : Word;
begin
  inherited;
  if Enabled then
  begin
    if dtmExtratoBonus.TotalMarcados > 0 then
    begin
      if dtmExtratoBonus.TotalMarcados <= dtmExtratoBonus.SaldoAtual then
      begin
        if dtmExtratoBonus.GravarProdutosSelecionados then
        begin
          MensagemAviso('Os produtos selecionados foram adicionados ao contrato.');
          variavel := VK_ESCAPE;
          KeyDown(variavel,[]);
        end
        else
          MensagemErro('Erro ao gravar os produtos selecionados.');
      end
      else
        MensagemErro('Saldo insuficiente para realizar esta operação.');
    end
    else
      MensagemAviso(ctNENHUMPRODUTOSELECIONADO);
  end;
end;

procedure TfrmExtratoBonus.AfterScrollLinhaColunaGrade(Sender: TObject);
begin
  dbgProdutosResgate.Columns[1].Title.Caption := dtmExtratoBonus.LinhadaGrade;
  dbgProdutosResgate.Columns[2].Title.Caption := dtmExtratoBonus.ColunadaGrade;
end;

procedure TfrmExtratoBonus.dbgProdutosResgateDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then
    if dbgProdutosResgate.DataSource.DataSet.FieldByName('selecionar').AsBoolean then  begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmExtratoBonus.dbgProdutosResgateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
      dbgProdutosResgateDblClick(Self);
end;

procedure TfrmExtratoBonus.LimparRegistros;
begin
  edtQtdeProdutos.Text := '';
  edtTotalProdutos.Text:= '';
  edtTotalMarcados.Text:= '';
  edtQtdeMarcados.Text := '';
  dtmExtratoBonus.LimparRegistros;
end;

procedure TfrmExtratoBonus.ckbCanceladosClick(Sender: TObject);
begin
  inherited;
  if edfCodigoCliente.Exist then
    dtmExtratoBonus.ReFazConsultaBonusCliente(StrToInt(edfCodigoCliente.Text),
                                            ckbCancelados.Checked);
end;

procedure TfrmExtratoBonus.OperacaoPadrao(Value: array of Variant);
begin
  inherited;
  dtmExtratoBonus.ClienteContrato := Value[0];
  edfCodigoCliente.SetFocus;
  edfCodigoCliente.Text := Value[0];
  edfCodigoClienteFound(True);
  FormOrigem := Value[1];
end;

procedure TfrmExtratoBonus.KeyDown(var Key: Word; Shift: TShiftState);
var
  frmAjuda: TfrmAjuda;
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    LimparRegistros;
    dtmExtratoBonus.Fecha(ctCrediarioConsultaContratos);
    dtmExtratoBonus.Fecha(ctTabelasConsultaProdutos);
    pgcExtratoBonus.ActivePageIndex := 0;

    if (FormOrigem<>'') then
    begin
      frmAjuda := TfrmAjuda(FormExists(FormOrigem));
      if Assigned(frmAjuda) then
        frmajuda.BringToFront;
      FormOrigem := '';
    end;
  end
  else if (Key = VK_F5) and sbnResgatar.Enabled then
    sbnResgatarClick(nil);
end;

procedure TfrmExtratoBonus.actHabilitarBotoesUpdate(Sender: TObject);
begin
  inherited;
  sbnResgatar.Enabled := dtmExtratoBonus.QtdeMarcados > 0;
  tstProdutosResgate.TabVisible := FormOrigem <> '';
end;

end.
