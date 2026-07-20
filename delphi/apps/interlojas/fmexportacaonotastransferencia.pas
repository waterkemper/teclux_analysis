unit fmexportacaonotastransferencia;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, ComCtrls, FileCtrl, cpdata, frconsulta,
  frconsultacodigo, Grids, DBGrids, cpdbgrid, cpnumero, Buttons, ToolWin,
  ExtCtrls, inifiles;

type
  TfrmExportacaoNotasTransferencia = class(TfrmAjudaBt)
    gbxFilial: TGroupBox;
    fraConsultaCodigoFilial: TfraConsultaCodigo;
    gbxEmissao: TGroupBox;
    edtEmissaoInicial: TEditData;
    edtEmissaoFinal: TEditData;
    gbxSerie: TGroupBox;
    edtSerie: TEdit;
    gbxNrNota: TGroupBox;
    edtNumero: TEditNumero;
    sbnConsultarNotas: TSpeedButton;
    gbxNotas: TGroupBox;
    pnlParametros: TPanel;
    bvlEspaco: TBevel;
    pnlTotais: TPanel;
    dbgNotas: TtecDBGrid;
    gbxQtdeNotas: TGroupBox;
    gbxQtdeTotal: TGroupBox;
    edtQtdeTotal: TEditNumero;
    gbxQtdeMarcados: TGroupBox;
    edtQtdeMarcados: TEditNumero;
    gbxValoresNotas: TGroupBox;
    gbxValorTotal: TGroupBox;
    edtValorTotal: TEditNumero;
    gbxValorMarcados: TGroupBox;
    edtValorMarcados: TEditNumero;
    ckbSelecionarTodas: TCheckBox;
    sbnSalvar: TSpeedButton;
    gbxDiretorioExportacao: TGroupBox;
    sbnDiretorioExportacao: TSpeedButton;
    lblDirExportacao: TLabel;
    lblA: TLabel;
    procedure dbgNotasDblClick(Sender: TObject);
    procedure ckbSelecionarTodasClick(Sender: TObject);
    procedure dbgNotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnConsultarNotasClick(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
    procedure sbnDiretorioExportacaoClick(Sender: TObject);
    procedure dbgNotasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure AtualizarEstadoBotoes;
    { Private declarations }
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  frmExportacaoNotasTransferencia: TfrmExportacaoNotasTransferencia;

implementation

uses
  dmexportacaonotastransferencia, {Qete,} biblio, ctconstantes;
{$R *.dfm}

{ TfrmExportacaoNotasTransferencia }

procedure TfrmExportacaoNotasTransferencia.AtualizarContadores(
  SoMarcados: Boolean);
begin
  with dtmExportacaoNotasTransferencia do
  begin
    if not SoMarcados then begin
      edtQtdeTotal.Text  := IntToStr(QtdeNotas);
      edtValorTotal.Text := Format('%8.2m', [TotalNotas]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtValorMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
  AtualizarEstadoBotoes;
end;

constructor TfrmExportacaoNotasTransferencia.Create(AOwner: TComponent);
var
  ArquivoCFG: TIniFile;

begin
  dtmExportacaoNotasTransferencia := TdtmExportacaoNotasTransferencia.Create(Self);
  inherited;
  edtEmissaoInicial.Text := DateToStr(PrimeiroDiaMesPassado(0));
  edtEmissaoFinal.Text := DateToStr(DataLocal);
  fraConsultaCodigoFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaCodigoFilial.edfCodigo.Text := IntToStr(dtmExportacaoNotasTransferencia.FilialBase);
  fraConsultaCodigoFilial.edfCodigo.Exist;

  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
      lblDirExportacao.Caption := ArquivoCFG.ReadString(ExportacaoNotasTransferenciaSection, 'DirExportaçãoNotasTransferencia'  , '');
    finally
      ArquivoCFG.Free
    end;
  end;

end;

procedure TfrmExportacaoNotasTransferencia.dbgNotasDblClick(
  Sender: TObject);
begin
  inherited;
  dtmExportacaoNotasTransferencia.MarcarSelecionados(ckbSelecionarTodas.Checked,False);
  AtualizarContadores(True);
end;

procedure TfrmExportacaoNotasTransferencia.ckbSelecionarTodasClick(
  Sender: TObject);
begin
  inherited;
  dtmExportacaoNotasTransferencia.MarcarSelecionados(ckbSelecionarTodas.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmExportacaoNotasTransferencia.dbgNotasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
    if key = VK_SPACE then
    begin
      dtmExportacaoNotasTransferencia.MarcarSelecionados(ckbSelecionarTodas.Checked,False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmExportacaoNotasTransferencia.sbnConsultarNotasClick(
  Sender: TObject);
begin
  inherited;
  with dtmExportacaoNotasTransferencia do
  begin
    if fraConsultaCodigoFilial.edfCodigo.Text <> '' then
      Filial := StrToInt(fraConsultaCodigoFilial.edfCodigo.Text);
    Serie := edtSerie.Text;
    if edtNumero.Text <> '' then
      Numero := StrToInt(edtNumero.Text);
    DataInicial := StrToDate(edtEmissaoInicial.Text);
    DataFinal := StrToDate(edtEmissaoFinal.Text);

    if GerarConsultaNotas then
      dbgNotas.SetFocus
    else
      MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
  end;
  AtualizarContadores(False);
end;

procedure TfrmExportacaoNotasTransferencia.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F5 then sbnSalvar.Click
  else if key = VK_F6 then sbnConsultarNotas.Click;
end;

procedure TfrmExportacaoNotasTransferencia.sbnSalvarClick(Sender: TObject);
var
  ArquivoCFG: TIniFile;

begin
  inherited;
  if lblDirExportacao.Caption <> '' then
  begin
    if dtmExportacaoNotasTransferencia.GerarArquivosExportacao(lblDirExportacao.Caption) then
    begin
      if FileExists(NomeArquivoCFG) then
      begin
        ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
        try
          ArquivoCFG.WriteString(ExportacaoNotasTransferenciaSection, 'DirExportaçãoNotasTransferencia', lblDirExportacao.Caption);
        finally
          ArquivoCFG.Free
        end;
      end;
      MensagemAviso('Arquivos gerados com sucesso na pasta "' + lblDirExportacao.Caption + '"')
    end
    else
      MensagemAviso('Ocorreu um erro na geração dos arquivos')
  end
  else
    MensagemAviso('Informe o diretório de exportação');
  AtualizarContadores(False);
end;

procedure TfrmExportacaoNotasTransferencia.sbnDiretorioExportacaoClick(
  Sender: TObject);
var
  dir: String;
begin
  inherited;
  if SelectDirectory('Selecionar diretório','',dir) then
    lblDirExportacao.Caption := dir
end;

procedure TfrmExportacaoNotasTransferencia.AtualizarEstadoBotoes;
begin
  sbnSalvar.Enabled := dtmExportacaoNotasTransferencia.TemNotaSelecionada;
end;

procedure TfrmExportacaoNotasTransferencia.dbgNotasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then
  begin
    if dbgNotas.DataSource.DataSet.FieldByName('selecionar').AsBoolean then
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
  end;
  TDBGrid(Sender).Canvas.Font.Style := [];
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
