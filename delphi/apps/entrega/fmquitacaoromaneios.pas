unit fmquitacaoromaneios;

interface

uses dmquitacaoromaneios,
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  cpdata, ComCtrls, cppagecontrol, Buttons, ExtCtrls, biblio, ctconstantes,
  fmConsultaBasica,fmconsultaporcampo, Windows,
 // Terceiros
  ZQuery, Grids, DBGrids, cpdbgrid, cpeditioncontrolvalidation, ActnList,
  cpnumero, ToolWin;

type
  TfrmQuitacaoRomaneios = Class(TfrmAjudaBt)
    sbnGerar: TSpeedButton;
    sbnConfirma: TSpeedButton;
    pnlFundoJanela: TPanel;
    pgcQuitacaoRomaneios: TtecPageControl;
    tstParametros: TTabSheet;
    tstSelecionados: TTabSheet;
    gbxPeriodoAbertura: TGroupBox;
    edtEmissaoInicial: TEditData;
    lblA: TLabel;
    edtEmissaoFinal: TEditData;
    gbxFornecdores: TGroupBox;
    sbnProcurarFornecedor: TSpeedButton;
    dtxFornecedor: TtecDBText;
    edfFornecedor: TtecDbEditFind;
    dbgSelecionados: TtecDBGrid;
    gbxSelecionados: TGroupBox;
    gbxRomaneios: TGroupBox;
    gbxValores: TGroupBox;
    gbxDataQuitacao: TGroupBox;
    edtDataQuitacao: TEditData;
    gbxTipo: TGroupBox;
    ckbNormal: TCheckBox;
    ckbTransferencia: TCheckBox;
    ckbSelecionarTodos: TCheckBox;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    ecvQuitacao: TtecEditionControlValidation;
    edtQtdeRomaneios: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    edtTotalRomaneios: TEditNumero;
    edtTotalMarcados: TEditNumero;
    gbxNrTotalRomaneios: TGroupBox;
    gbxNrRomaneiosMarcados: TGroupBox;
    gbxValorTotal: TGroupBox;
    gbxValorMarcado: TGroupBox;
    procedure sbnProcurarFornecedorClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgSelecionadosDblClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgSelecionadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure dbgSelecionadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  protected
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;

    function  ValidarCamposSelecao: Boolean;
    function  ValidarCamposQuitacao: Boolean;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmQuitacaoRomaneios: TfrmQuitacaoRomaneios;
  TipoPesquisa: TtecQuitacaoRomaneios;
  ControleAtivo: TWinControl;

implementation



{$R *.dfm}

{ TfrmQuitacaoRomaneios }

constructor TfrmQuitacaoRomaneios.Create(AOwner: TComponent);
begin
  dtmQuitacaoRomaneios:= TdtmQuitacaoRomaneios.Create(Self);
  inherited;
  dtmQuitacaoRomaneios.Abre(ctTabelas);
  edtEmissaoInicial.Text:= DateToStr(Date);
  edtEmissaoFinal.Text  := DateToStr(Date);
end;

destructor TfrmQuitacaoRomaneios.Destroy;
begin
  dtmQuitacaoRomaneios:=nil;
  inherited;
  frmQuitacaoRomaneios:= nil;
end;

function TfrmQuitacaoRomaneios.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edffornecedor then begin
        TipoPesquisa := romFORNECEDOR;
        Titulo       := 'Fornecedores';
      end;
      with dtmQuitacaoRomaneios do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmQuitacaoRomaneios.TabelaDePesquisa: TZdataSet;
begin
  with dtmQuitacaoRomaneios do
    case TipoPesquisa of
             romFORNECEDOR: Result:= Consultafornecedores;
    else                 Result:= nil;
    end;
end;

procedure TfrmQuitacaoRomaneios.sbnProcurarFornecedorClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edffornecedor.SetFocus;
  InternoPesquisar('');
end;

function TfrmQuitacaoRomaneios.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
end;

function TfrmQuitacaoRomaneios.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  case tipoPesquisa of
    romFORNECEDOR : result := dtmQuitacaoRomaneios.Existefornecedor(NomeCampo, Value);
  else
    result := false;
  end;
end;

function TfrmQuitacaoRomaneios.ValidarCamposSelecao: Boolean;
begin
   Result:= ((edtEmissaoInicial.Text <> '') or (edtEmissaoFinal.Text <> '')) and
            (ckbNormal.Checked or ckbTransferencia.Checked);
   if Result then
    if (edtEmissaoInicial.Text<>'') and (edtEmissaoFinal.Text<>'') then
     if strtodate(edtEmissaoInicial.Text)>strtodate(edtEmissaoFinal.Text) then
       begin
         MensagemAviso(ctDTINICIALMAIORDTFINAL);
         edtEmissaoInicial.SetFocus;
         Result:=false;
       end;

   if Result then
       Result := OperadorTernario((Trim(edffornecedor.Text) <> ''),edffornecedor.Exist, True);
end;

procedure TfrmQuitacaoRomaneios.sbnGerarClick(Sender: TObject);
begin
  if ValidarCamposSelecao then begin
    with dtmQuitacaoRomaneios do begin
      EmissaoInicial := edtEmissaoInicial.Text;
      EmissaoFinal   := edtEmissaoFinal.Text;
      fornecedora := edffornecedor.Text;
      if ckbNormal.Checked and ckbTransferencia.Checked then
        Tipo:= 'A'
      else if ckbNormal.Checked then
        Tipo := 'N'
      else if ckbtransferencia.Checked then
        Tipo := 'T';

      if not GerarRomaneios then
         pgcQuitacaoRomaneios.ActivePage:= tstSelecionados
      else begin
             MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
             pgcQuitacaoRomaneios.ActivePage:= tstParametros;
             edffornecedor.SetFocus;
           end;
      QtdeMarcados:=0;
      TotalMarcados:=0;
      ckbSelecionarTodos.Checked:=False;
      AtualizarContadores(False);
    end;

  end;
end;

procedure TfrmQuitacaoRomaneios.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmQuitacaoRomaneios do begin
    if not SoMarcados then begin
      edtQtdeRomaneios.Text  := IntToStr(QtdeRomaneios);
      edtTotalRomaneios.Text := Format('%8.2m', [TotalRomaneios]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmQuitacaoRomaneios.dbgSelecionadosDblClick(Sender: TObject);
begin
  inherited;
  dtmQuitacaoRomaneios.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmQuitacaoRomaneios.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmQuitacaoRomaneios.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmQuitacaoRomaneios.dbgSelecionadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmQuitacaoRomaneios.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmQuitacaoRomaneios.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5: if not CtrlOn and sbnConfirma.Enabled then sbnConfirma.Click;
    VK_F6: if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
    VK_ESCAPE: if pgcQuitacaoRomaneios.ActivePage = tstSelecionados then
                  pgcQuitacaoRomaneios.ActivePage:= tstParametros;
  end;
end;

procedure TfrmQuitacaoRomaneios.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposQuitacao then
  begin
    dtmQuitacaoRomaneios.QuitarRomaneios(StrToDate(edtDataQuitacao.Text));
    sbnGerarClick(nil);
  end;
end;

function TfrmQuitacaoRomaneios.ValidarCamposQuitacao: Boolean;
begin
  Result:= False;
  if ecvQuitacao.Verify(gbxSelecionados,ControleAtivo) then
    Result:= OperadorTernario((Trim(edffornecedor.Text) <> ''),edffornecedor.Exist, True)
end;

procedure TfrmQuitacaoRomaneios.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled   := (pgcQuitacaoRomaneios.ActivePage = tstParametros);
  sbnConfirma.Enabled:= (dtmQuitacaoRomaneios.QtdeMarcados > 0);
end;

procedure TfrmQuitacaoRomaneios.dbgSelecionadosDrawColumnCell(
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

end.



