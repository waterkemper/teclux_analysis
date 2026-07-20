unit fmmanutencaoligacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ExtCtrls, Buttons, StdCtrls, Mask, cpdata, Grids,
  DBGrids,
  //Terceiros
  ZQuery,
  //Componetes
  cpnumero, cpdbfindcontrols,
  //Repositório
  dmmanutencaoligacao, fmconsultabasica, fmconsultaporcampo, cpdbgrid, DBCtrls, cpdbtext;

type
  TtecTipoConsulta = (ctcFiltro,ctcSubstituir);

  TfrmManutencaoLigacao = class(TfrmCadastroPadrao)
    sbnGerar: TSpeedButton;
    GroupBox1: TGroupBox;
    gbxStatusLigacao: TGroupBox;
    ckbNenhuma: TCheckBox;
    ckbIniciando: TCheckBox;
    ckbReligando: TCheckBox;
    ckbCancelado: TCheckBox;
    ckbAtendido: TCheckBox;
    lblLigacao: TLabel;
    edtLigacao: TEditNumero;
    dbgManutencaoLigacoes: TtecDBGrid;
    gbxSubstituirPor: TGroupBox;
    sbnSubstituir: TSpeedButton;
    cmbSubstituirPor: TComboBox;
    lblLigar: TLabel;
    lblCompletadaSemResposta: TLabel;
    lblCompletadaComResposta: TLabel;
    lblCancelada: TLabel;
    lblReligar: TLabel;
    dtxLigar: TtecDBText;
    dtxCompletadaSemResposta: TtecDBText;
    dtxCompletadaComResposta: TtecDBText;
    dtxCancelada: TtecDBText;
    dtxReligar: TtecDBText;
    gbxMarcar: TGroupBox;
    ckbTodas: TCheckBox;
    gbxFiltro: TGroupBox;
    sbnFilial: TSpeedButton;
    edfFiltro: TtecDbEditFind;
    procedure edfFiltroFound(Found: Boolean);
    procedure ckbNenhumaClick(Sender: TObject);
    procedure dbgManutencaoLigacoesDblClick(Sender: TObject);
    procedure dbgManutencaoLigacoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ckbTodasClick(Sender: TObject);
    procedure sbnSubstituirClick(Sender: TObject);
    procedure sbnFilialClick(Sender: TObject);
    procedure edtLigacaoChange(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
  protected
    FConsulta : TtecTipoConsulta;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    function MontaStatusParaConsulta: String;
    function PodeConsultarLigacoes: Boolean;
    function InternoPesquisar(Titulo: String): Integer; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;

    Constructor Create(AOwner: TComponent);   Override;
    destructor  Destroy; override;
  end;

var
  frmManutencaoLigacao: TfrmManutencaoLigacao;

implementation

uses
  ctconstantes,
  biblio,
  QT;

{$R *.dfm}

{ TfrmManutencaoLigacao }

constructor TfrmManutencaoLigacao.Create(AOwner: TComponent);
begin
  dtmManutencaoLigacao:= TdtmManutencaoLigacao.Create(Self);
  inherited Create(AOwner);
  DataSet := dtmManutencaoLigacao.TabelaManutencaoLigacao;
end;

destructor TfrmManutencaoLigacao.Destroy;
begin
  dtmManutencaoLigacao.Fecha(ctTabelaManutencaoLigacao);
  dtmManutencaoLigacao.Fecha(ctCadastroFiltrosSAC);
  dtmManutencaoLigacao:=nil;
  inherited;
  frmManutencaoLigacao:= nil;
end;

procedure TfrmManutencaoLigacao.edfFiltroFound(Found: Boolean);
begin
  inherited;
  if Found then  begin
     dtmManutencaoLigacao.Filtro := edfFiltro.Text;
     ckbNenhuma.SetFocus;
  end;
end;

function TfrmManutencaoLigacao.MontaStatusParaConsulta: String;
var
  str: String;
begin
   str:= '';
  if ckbNenhuma.Checked then
    str:= str + '''' + ctSACNenhuma + '''' + ',';
  if ckbIniciando.Checked then
    str:= str + '''' + ctSACFazendoLigacao + '''' + ',';
  if ckbReligando.Checked then
    str:= str + '''' + ctSACReligando + '''' + ',';
  if ckbCancelado.Checked then
    str:= str + '''' + ctSACCancelarLigacao + '''' + ',';
  if ckbAtendido.Checked then
    str:= str + '''' + ctSACAtendendoLigacao + '''' + ',';
  if (str <> '') then
    if str[Length(str)] = ',' then //Retirar a vírgula caso exista na última posiçao da String.
      Delete(str,Length(str),1);
  Result:= '(' + str + ')';
end;

procedure TfrmManutencaoLigacao.ckbNenhumaClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoLigacao.Status:= MontaStatusParaConsulta;
  edtLigacao.Enabled:= ckbReligando.Checked;
  lblLigacao.Enabled:= ckbReligando.Checked;
  edtLigacao.Text:= '';
  edtLigacaoChange(edtLigacao);
end;

function TfrmManutencaoLigacao.InternoPesquisar(Titulo:String): Integer;
begin
  if CtrlOn then begin
    if FConsulta = ctcFiltro then begin
      dtmManutencaoLigacao.Abre(ctConsultaFiltrosSAC);
      Result := inherited InternoPesquisar('Filtros');
      if Result  = mrok then begin
        try
          edfFiltro.Text:= IntToStr(dtmManutencaoLigacao.NumeroFiltro);
          edfFiltro.SetControl(True);
          edfFiltroFound(True);
        except
        end;
      end;
      dtmManutencaoLigacao.Fecha(ctConsultaFiltrosSAC);
    end
  end
  else
    if PodeConsultarLigacoes then begin
      dtmManutencaoLigacao.ExecutarConsultaManutencaoLigacao;
      dbgManutencaoLigacoes.SelectedIndex := 7;
      dbgManutencaoLigacoes.SetFocus;
      ckbTodas.Enabled         := True;
      cmbSubstituirPor.Enabled := True;
      sbnSubstituir.Enabled    := True;
    end
    else begin
      MensagemAviso(format(ctPARAMETROSINEXISTENTES, []));
      edfFiltro.SetFocus;
    end;
  Result:= 1;
end;

function TfrmManutencaoLigacao.PodeConsultarLigacoes: Boolean;
begin
  Result := ((edfFiltro.Text <> '')  and
             (ckbNenhuma.Checked     or
              ckbIniciando.Checked   or
              ckbReligando.Checked   or
              ckbCancelado.Checked   or
              ckbAtendido.Checked));
end;

procedure TfrmManutencaoLigacao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_F9    : if edfFiltro.Focused then
                  FConsulta:= ctcFiltro;
    VK_F7    : sbnSubstituirClick(sbnSubstituir);
    VK_F6    : sbnGerarClick(Self);
    VK_SPACE : dbgManutencaoLigacoesDblClick(dbgManutencaoLigacoes);
  end;
  inherited;
end;

function TfrmManutencaoLigacao.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  if FConsulta = ctcFiltro then
       Result := dtmManutencaoLigacao.ExisteFiltrosSAC(Parametro, NomeCampo, Value)
  else Result:= False;
end;

function TfrmManutencaoLigacao.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmManutencaoLigacao.TabelaDePesquisa: TZDataSet;
begin
  if FConsulta = ctcFiltro then
       Result := dtmManutencaoLigacao.TabelaConsultaFiltrosSAC
  else Result:= nil;
end;

procedure TfrmManutencaoLigacao.dbgManutencaoLigacoesDblClick(Sender: TObject);
begin
  inherited;
  if TDBGrid(Sender).SelectedIndex = 7 then begin
     dtmManutencaoLigacao.SelecionarLigacaoMudarStatus(False);
  end;
end;

procedure TfrmManutencaoLigacao.dbgManutencaoLigacoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgManutencaoLigacoes.DataSource.DataSet.FieldByName('marcar').AsBoolean then  begin
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmManutencaoLigacao.ckbTodasClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoLigacao.SelecionarLigacaoMudarStatus(True);
end;

procedure TfrmManutencaoLigacao.sbnSubstituirClick(Sender: TObject);
begin
  inherited;
  if (cmbSubstituirPor.Text <> '') then begin
    dtmManutencaoLigacao.SubstituirStatus(cmbSubstituirPor.Text);
    ckbTodas.Enabled         := False;
    cmbSubstituirPor.Enabled := False;
    sbnSubstituir.Enabled    := False;
  end;
end;

procedure TfrmManutencaoLigacao.sbnFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  FConsulta:= ctcFiltro;
  InternoPesquisar('');
end;

procedure TfrmManutencaoLigacao.edtLigacaoChange(Sender: TObject);
begin
  inherited;
  dtmManutencaoLigacao.Religado:= edtLigacao.Text;
end;

procedure TfrmManutencaoLigacao.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if PodeConsultarLigacoes then begin
    dtmManutencaoLigacao.ExecutarConsultaManutencaoLigacao;
    dbgManutencaoLigacoes.SelectedIndex := 7;
    dbgManutencaoLigacoes.SetFocus;
    ckbTodas.Enabled         := True;
    cmbSubstituirPor.Enabled := True;
    sbnSubstituir.Enabled    := True;
  end
  else begin
    MensagemAviso(format(ctPARAMETROSINEXISTENTES, []));
    edfFiltro.SetFocus;
  end;
end;

end.
