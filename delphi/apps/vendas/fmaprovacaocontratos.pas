unit fmaprovacaocontratos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, {Qete,}
  // Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  // Biblio
  ctconstantes, biblio,
  // Terceiros
  ZQuery,
  // Componentes;
  cpdbtext, cpdbfindcontrols, cpdbgrid,
  // Projeto
  dmaprovacaocontratos, ComCtrls, cpnumero;

type
  TfrmAprovacaoContratos = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxAprovacaoContratos: TGroupBox;
    gbxFilial: TGroupBox;
    lblFilial: TLabel;
    dbgContratosAprovar: TtecDBGrid;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblTotalMarcados: TLabel;
    ckbSelecionarTodos: TCheckBox;
    edfFilial: TtecDbEditFind;
    dtxDescricaoFilial: TtecDBText;
    sbnProcuraFilial: TSpeedButton;
    sbnAprovarContratos: TSpeedButton;
    edtQtdeContratos: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    edtTotalContratos: TEditNumero;
    edtTotalMarcados: TEditNumero;
    procedure sbnAprovarContratosClick(Sender: TObject);
    procedure dbgContratosAprovarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgContratosAprovarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgContratosAprovarDblClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure edfFilialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  protected
    dtmAprovacaoContratos: TdtmAprovacaoContratos;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure ZerarContadores;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmAprovacaoContratos: TfrmAprovacaoContratos;

implementation

Uses
  //Biblio
  clusuario;

{$R *.dfm}

{ TfrmAprovacaoContratos }

constructor TfrmAprovacaoContratos.Create(AOwner: TComponent);
begin
  dtmAprovacaoContratos:= TdtmAprovacaoContratos.Create(Self);
  inherited;
  try
    edfFilial.Text := IntToStr(dtmAprovacaoContratos.FilialBase);
  except
  end;
  if edfFilial.Exist then
    dtmAprovacaoContratos.ContratosAprovar;
  AtualizarContadores(False);     
end;

destructor TfrmAprovacaoContratos.Destroy;
begin
  dtmAprovacaoContratos:=nil;
  inherited;
  frmAprovacaoContratos:= nil;
end;

procedure TfrmAprovacaoContratos.sbnAprovarContratosClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
begin
  inherited;
  if dtmAprovacaoContratos.QtdeMarcados > 0 then begin
    if UsuarioLogin.AnalistaCredito then
      UsuarioAut := dtmAprovacaoContratos.ObterAutorizacao(taSENHA)
    else
      UsuarioAut := dtmAprovacaoContratos.ObterAutorizacao(taLOGIN);
    try
      if Assigned(UsuarioAut) then begin
        if UsuarioAut.AnalistaCredito then
          ShowMessage('IMPLEMENTAR A ROTINA DE APROVAÇÂO DOS CONTRATOS')
      end else
        MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']))
    finally
      if Assigned(UsuarioAut) then 
        UsuarioAut.Free
    end;
  end
  else
    MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['contrato']));
  edfFilial.SetFocus;
end;

procedure TfrmAprovacaoContratos.dbgContratosAprovarDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgContratosAprovar.DataSource.DataSet.FieldByName('selecionar').AsBoolean then  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmAprovacaoContratos.dbgContratosAprovarKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmAprovacaoContratos.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmAprovacaoContratos.dbgContratosAprovarDblClick(Sender: TObject);
begin
  inherited;
  dtmAprovacaoContratos.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmAprovacaoContratos.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmAprovacaoContratos.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmAprovacaoContratos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F7     : if not CtrlOn then sbnAprovarContratos.Click;
  end;
end;

function TfrmAprovacaoContratos.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  Result := dtmAprovacaoContratos.ExisteFilial(NomeCampo,Value);
end;

function TfrmAprovacaoContratos.InternoPesquisar(Titulo: string): Integer;
begin
  Result:= mrNone;
  if CtrlOn and (ActiveControl is TtecFindCustom) then begin
    dtmAprovacaoContratos.AbreTabelaConsulta;
    Result := inherited InternoPesquisar('Filiais');
    if Result = mrOK then begin
      dtmAprovacaoContratos.Selecionar;
      edfFilial.SetControl(True);
    end;
    dtmAprovacaoContratos.FechaTabelaConsulta;
  end;
end;

function TfrmAprovacaoContratos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
end;

function TfrmAprovacaoContratos.TabelaDePesquisa: TZdataSet;
begin
  Result := dtmAprovacaoContratos.ConsultarFilial;
end;

procedure TfrmAprovacaoContratos.sbnProcuraFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmAprovacaoContratos.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmAprovacaoContratos do begin
    if not SoMarcados then begin
      edtQtdeContratos.Text  := IntToStr(QtdeContratos);
      edtTotalContratos.Text := Format('%8.2m', [TotalContratos]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmAprovacaoContratos.ZerarContadores;
begin
  edtQtdeContratos.Clear;
  edtQtdeMarcados.Clear;
  edtTotalContratos.Clear;
  edtTotalMarcados.Clear;
end;

procedure TfrmAprovacaoContratos.edfFilialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then begin
    ckbSelecionarTodos.Checked:= False;
    ZerarContadores;
    dtmAprovacaoContratos.ContratosAprovar;
    if dtmAprovacaoContratos.NenhumContratoEncontrato then begin
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['contrato']));
      edfFilial.SetFocus
    end
    else AtualizarContadores(False);
  end;
end;

procedure TfrmAprovacaoContratos.FormShow(Sender: TObject);
begin
  inherited;
  if dtmAprovacaoContratos.NenhumContratoEncontrato then
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['contrato']));
end;

end.
