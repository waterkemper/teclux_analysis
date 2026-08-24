unit fmestornorecebimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmajudabt, ComCtrls, Buttons, ExtCtrls, cppagecontrol,
  Mask, cpdbfindcontrols, DBCtrls, cpdbtext, dmestornorecebimentos,
  ctconstantes, cpdata, Grids, DBGrids, cpdbgrid, biblio, fmconsultabasica,
  fmconsultaporcampo, zquery, cpnumero, ActnList, ToolWin;

type
  TfrmEstornoRecebimentos = class(TfrmAjudaBt)
    pgcEstornos: TtecPageControl;
    tstParametros: TTabSheet;
    tstSelecionadas: TTabSheet;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    edfFilial: TtecDbEditFind;
    tstGrupoFilial: TTabSheet;
    sbnProcurarGrupoFilial: TSpeedButton;
    dtxGrupoFilial: TtecDBText;
    edfGrupoFilial: TtecDbEditFind;
    gbxCliente: TGroupBox;
    sbnProcurarCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    gbxPeriodoPagto: TGroupBox;
    gbxPagtoDataInicial: TGroupBox;
    edtPagtoInicial: TEditData;
    gbxPagtoDataFinal: TGroupBox;
    edtPagtoFinal: TEditData;
    dbgParcelas: TtecDBGrid;
    sbnGerar: TSpeedButton;
    sbnConfirma: TSpeedButton;
    ckbSelecionarTodos: TCheckBox;
    gbxPeriodoVencto: TGroupBox;
    gbxVenctoInicial: TGroupBox;
    edtVenctoInicial: TEditData;
    gbxVenctoFinal: TGroupBox;
    edtVenctoFinal: TEditData;
    gbxConta: TGroupBox;
    sbnProcurarConta: TSpeedButton;
    edfConta: TtecDbEditFind;
    dtxDigito: TtecDBText;
    Label1: TLabel;
    gbxSiglaBanco: TGroupBox;
    dtxNomebanco: TtecDBText;
    gbxNomeAgencia: TGroupBox;
    dtxNomeagencia: TtecDBText;
    gbxParcelas: TGroupBox;
    gbxQtdeParcelas: TGroupBox;
    edtQtdeParcelas: TEditNumero;
    gbxTotalParcelas: TGroupBox;
    edtTotalParcelas: TEditNumero;
    gbxMarcadas: TGroupBox;
    gbxQtdeMarcadas: TGroupBox;
    edtQtdeMarcadas: TEditNumero;
    gbxTotalMarcadas: TGroupBox;
    edtTotalMarcadas: TEditNumero;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcurarContaClick(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarGrupoFilialClick(Sender: TObject);
    procedure sbnProcurarClienteClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure dbgParcelasDblClick(Sender: TObject);
    procedure dbgParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actHabilitarUpdate(Sender: TObject);
  private
    procedure AtualizarContadores(SoMarcadas: Boolean);
    { Private declarations }
  protected
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;

    function ValidarCampos: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmEstornoRecebimentos: TfrmEstornoRecebimentos;
  TipoPesquisa : TtecPesquisa;

implementation

uses fmnavcontroles;

{$R *.dfm}

constructor TfrmEstornoRecebimentos.Create(AOwner: TComponent);
begin
  dtmEstornoRecebimentos := TdtmEstornoRecebimentos.Create(Self);
  inherited;
  edtVenctoInicial.Text := '';{DateToStr(DataLocal);}
  edtVenctoFinal.Text   := '';{DateToStr(DataLocal);}
  edtPagtoInicial.Text  := DateToStr(DataLocal);
  edtPagtoFinal.Text    := DateToStr(DataLocal);
  pgcEstornos.ActivePage := tstParametros;
  pgcFilialGrupoFilial.activepage := tstFilial;

  edtPagtoInicial.SetFocus;
end;

function TfrmEstornoRecebimentos.InternoPesquisar(
  Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then
  begin
    if CtrlOn then
    begin
      if ActiveControl = edfFilial then
      begin
        TipoPesquisa := pesFILIAIS;
        Titulo := ctFILIAIS;
      end
      else if ActiveControl = edfGrupoFilial then
      begin
        TipoPesquisa := pesGRUPOSFILIAIS;
        Titulo := ctGRUPOFILIAIS;
      end
      else if ActiveControl = edfCliente then
      begin
        TipoPesquisa := pesCLIENTES;
        Titulo := ctCLIENTES;
      end
      else if ActiveControl = edfConta then
      begin
        TipoPesquisa := pesCONTADEBITO;
        Titulo := ctCONTAS;
      end
      else TipoPesquisa := pesNENHUMA;

      if TipoPesquisa <> pesNENHUMA then
        with dtmestornorecebimentos do
        begin
          AbreTabelaPesquisa(TipoPesquisa);
          Result:= inherited InternoPesquisar(Titulo);
          if Result = mrOK then
            Selecionar(TipoPesquisa);
          FechaTabelaPesquisa(TipoPesquisa);
        end;
    end;
  end;
end;

procedure TfrmEstornoRecebimentos.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCampos then
    with dtmestornorecebimentos do
    begin
      PagtoInicial := edtPagtoInicial.Text;
      PagtoFinal   := edtPagtoFinal.Text;
      VenctoInicial:= edtVenctoInicial.Text;
      VenctoFinal  := edtVenctoFinal.Text;
      Cliente      := edfCliente.Text;
      Filial       := edfFilial.Text;
      GrupoFilial  := edfGrupoFilial.Text;
      ContaBoleto  := edfConta.Text;
    if not AbrirParcelas then
    begin
      pgcEstornos.ActivePage := tstSelecionadas;
      dbgParcelas.SetFocus;
    end
    else
    begin
      MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
      edtPagtoInicial.SetFocus;
    end;
    AtualizarContadores(False);
    end;
end;

function TfrmEstornoRecebimentos.ValidarCampos: Boolean;
begin
   Result:= edtPagtoInicial.DataValida and edtPagtoFinal.DataValida;
  if Result then
    Result:= ((edtPagtoInicial.Text <> '') or (edtPagtoFinal.Text <> ''));
  if Result then
     Result := OperadorTernario((Trim(edfFilial.     Text) <> ''), edfFilial.     Exist, True) and
               OperadorTernario((Trim(edfGrupoFilial.Text) <> ''), edfGrupoFilial.Exist, True) and
               OperadorTernario((Trim(edfCliente. Text) <> ''), edfCliente. Exist, True);
end;

procedure TfrmEstornoRecebimentos.sbnProcurarContaClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfConta.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmEstornoRecebimentos.sbnProcurarFilialClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmEstornoRecebimentos.sbnProcurarGrupoFilialClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmEstornoRecebimentos.sbnProcurarClienteClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCliente.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmEstornoRecebimentos.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmestornorecebimentos.MarcarParcelas(ckbSelecionarTodos.Checked, true);
  AtualizarContadores(True);
end;

procedure TfrmEstornoRecebimentos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5: if sbnConfirma.Enabled and not CtrlOn then sbnConfirmaClick(nil);
    VK_F6: if sbnGerar.Enabled and not CtrlOn then sbnGerarClick(nil);
    VK_ESCAPE: if pgcEstornos.ActivePage = tstSelecionadas then
                begin
                  dtmEstornoRecebimentos.Limpar;
                  pgcEstornos.ActivePage:= tstParametros;
                end;

  end;
end;

procedure TfrmEstornoRecebimentos.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  dtmEstornoRecebimentos.EfetuarEstorno;
end;

function TfrmEstornoRecebimentos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := TipoPesquisa <> pesCLIENTES;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;

end;

function TfrmEstornoRecebimentos.ExisteInformacao(Parametro: Integer;
  NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmestornorecebimentos do
  begin
    case TipoPesquisa of
      pesFILIAIS        : Result:= ExisteFiliais     (NomeCampo, Value);
      pesGRUPOSFILIAIS  : Result:= ExisteGrupoFiliais(NomeCampo, Value);
      pesCLIENTES       : Result:= ExisteClientes    (NomeCampo, Value);
      pesCONTADEBITO    : Result:= ExisteContas      (NomeCampo, Value);
      else                Result:= False;
    end;
  end;
end;

function TfrmEstornoRecebimentos.TabelaDePesquisa: TZdataSet;
begin
  with dtmestornorecebimentos do
    case TipoPesquisa of
      pesFILIAIS : Result := ConsultaFiliais;
      pesGRUPOSFILIAIS : Result := ConsultaGrupoFiliais;
      pesCLIENTES : Result := ConsultaClientes;
      pesCONTADEBITO : Result := ConsultaContas
      else Result := nil;
    end;
end;

function TfrmEstornoRecebimentos.TabelaDoParametro(
  Parametro: Integer): TZDataSet;
begin
  case Parametro of
      0:   Result:= dtmestornorecebimentos.ConsultaContas;
      else Result:= nil;
  end;
end;

procedure TfrmEstornoRecebimentos.dbgParcelasDblClick(Sender: TObject);
begin
  inherited;
  dtmEstornoRecebimentos.MarcarParcelas(ckbSelecionarTodos.Checked, false);
  AtualizarContadores(True);
end;

procedure TfrmEstornoRecebimentos.AtualizarContadores(SoMarcadas: Boolean);
begin
  with dtmEstornoRecebimentos do begin
    if not SoMarcadas then begin
      edtQtdeParcelas.Text  := IntToStr(QtdeParcelas);
      edtTotalParcelas.Text := Format('%8.2m', [TotalParcelas]);
    end;
    edtQtdeMarcadas.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcadas.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmEstornoRecebimentos.dbgParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
    begin
      dtmEstornoRecebimentos.MarcarParcelas(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmEstornoRecebimentos.dbgParcelasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then
    if dbgParcelas.DataSource.DataSet.FieldByName('selecionar').AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmEstornoRecebimentos.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled          := pgcEstornos.ActivePage = tstParametros;
  sbnConfirma.Enabled       := dtmEstornoRecebimentos.QtdeMarcados > 0;
end;

destructor TfrmEstornoRecebimentos.Destroy;
begin
  dtmEstornoRecebimentos:=nil;
  inherited;
  frmEstornoRecebimentos:= nil;
end;

end.
