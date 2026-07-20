unit fmgerarcobrancacef;

interface

uses
  SysUtils, Windows, FileCtrl, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids,  ComCtrls, Buttons, {Qete,}
  //Repositorio
  fmAjudaBt,
  //Projeto
  dmGerarCobrancaCEF, frlancamentocontabilidade, dmlancamentocontabilidade,
  //Tecsoft
  cpdbgrid, cpdata, frconsulta, frconsultacodigo,
  //Biblio
  Biblio, ctconstantes, ExtCtrls, cptexto, cpdbradiogroup, ToolWin;

type
  TfrmGerarCobracaCEF = class(TfrmAjudaBt)
    gbxParametros: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    gbxEmpreendimento: TGroupBox;
    fraConsultaEmpreendimento: TfraConsultaCodigo;
    sbnGravar: TSpeedButton;
    sbnGerarParcelas: TSpeedButton;
    gbxClientes: TGroupBox;
    gbxDiretorio: TGroupBox;
    sbnDiretorioArquivos: TSpeedButton;
    lblDiretorio: TLabel;
    Panel1: TPanel;
    ckbSelecionartodos: TCheckBox;
    OdgArquivoRetorno: TOpenDialog;
    pgcGrids: TPageControl;
    tstDadosGerados: TTabSheet;
    tstDadosRetorno: TTabSheet;
    dbgClientesSelecao: TtecDBGrid;
    dbgDadosRetorno: TtecDBGrid;
    pnlCampoMaior: TPanel;
    pnlErro: TPanel;
    Label1: TLabel;
    lblA: TLabel;
    rgpFuncao: TtecDBRadioGroup;
    rbnRemessa: TtecRadioButton;
    rbnRetorno: TtecRadioButton;
    sbnImprimirContrato: TSpeedButton;
    pnlParcela: TPanel;
    gbxParcelas: TGroupBox;
    pnlCores: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    gbxVencimento: TGroupBox;
    lblVencimento: TLabel;
    gbxPagamento: TGroupBox;
    lblPagamento: TLabel;
    gbxCreditado: TGroupBox;
    lblCreditado: TLabel;
    procedure sbnGerarParcelasClick(Sender: TObject);
    procedure sbnDiretorioArquivosClick(Sender: TObject);
    procedure sbnGravarClick(Sender: TObject);
    procedure dbgClientesSelecaoDblClick(Sender: TObject);
    procedure ckbSelecionartodosClick(Sender: TObject);
    procedure dbgClientesSelecaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDadosRetornoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure rbnRemessaClick(Sender: TObject);
    procedure rbnRetornoClick(Sender: TObject);
    procedure sbnImprimirContratoClick(Sender: TObject);
    procedure dbgDadosRetornoDblClick(Sender: TObject);
  private
    FDataInicial: String;
    FDataFinal: String;
    FEmpreendimento: String;
    FNomeEmpreendimento: String;
    FAcao: String;
    LancamentosContabeis : TfraLancamentoContabilidade;
    function Validardata(DF, DI : String): String;
    { Private declarations }
  protected

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    property Empreendimento : String read FEmpreendimento write FEmpreendimento;
    property NomeEmpreendimento : String read FNomeEmpreendimento write FNomeEmpreendimento;
    property DataInicial : String read FDataInicial write FDataInicial;
    property DataFinal : String read FDataFinal write FDataFinal;
    property Acao      : String read FAcao write FAcao;
  end;

var
  frmGerarCobracaCEF: TfrmGerarCobracaCEF;

implementation

uses DB;

{$R *.dfm}

{ TfrmGerarCobracaCEF }

constructor TfrmGerarCobracaCEF.Create(AOwner: TComponent);
begin
  dtmGerarCobrancaCEF:= TdtmGerarCobrancaCEF.Create(Self);
  inherited;
  edtPeriodoInicial.Text:= DateToStr(PrimeiroDiaMes(DataLocal));
  edtPeriodoFinal.  Text:= DateToStr(UltimoDiaMes  (DataLocal));
  fraConsultaEmpreendimento.TipoPesquisa := pesEMPREENDIMENTOS;
  lblDiretorio.Caption:= ExtractFilePath(Application.ExeName)+'Remessa\';
  sbnGravar.Enabled:= False;
  sbnImprimirContrato.Enabled:= False;
  FAcao:= 'G';
  pgcGrids.ActivePage:= tstDadosGerados;
  pnlCores.Visible:= False;
  pnlCampoMaior.Visible:= FAlse;
end;

procedure TfrmGerarCobracaCEF.sbnGerarParcelasClick(Sender: TObject);
var Arquivo, Datas: String;
begin
  inherited;
  Arquivo:= lblDiretorio.Caption;
  if rbnRemessa.Checked then
  begin
    FDataInicial:= edtPeriodoInicial.Text;
    FDataFinal  := edtPeriodoFinal.Text;
    dtmGerarCobrancaCEF.DataInicial:= edtPeriodoInicial.Text;
    dtmGerarCobrancaCEF.DataFinal  := edtPeriodoFinal.Text;
    FEmpreendimento := fraConsultaEmpreendimento.edfCodigo.Text;
    FNomeEmpreendimento := fraConsultaEmpreendimento.qryProcuraEmpreendimentosnome.AsString;
    Datas:= Validardata(FDataFinal, FDataInicial);
    if Datas = 'OK' then
    begin
      if not dtmGerarCobrancaCEF.ConsultarClientes(FEmpreendimento, FDataInicial, FDataFinal) then
      begin
        MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
        fraConsultaEmpreendimento.edfCodigo.SetFocus;
      end
      else
      begin
        if dtmGerarCobrancaCEF.ExisteEnderecoTamanhoMaior40 then
          pnlCampoMaior.Visible:= True
        else
          pnlCampoMaior.Visible:= False;
      end;
    end
    else if Datas = 'B' then
    begin
      MensagemAviso(ctDATAEMBRACO);
      edtPeriodoInicial.SetFocus;
    end
    else if Datas = 'M' then
    begin
      MensagemAviso(Format(ctDATAMENOR,['Final','Inicial']));
      edtPeriodoInicial.SetFocus;
    end;
      sbnGravar.Enabled:=  not dtmGerarCobrancaCEF.qryContratosParcelas.IsEmpty;
  end
  else if rbnRetorno.Checked then
  begin
    if FileExists(Arquivo) then
    begin
      dtmGerarCobrancaCEF.ProcessarArquivoRetorno(Arquivo);
      sbnGravar.Enabled:=  not dtmGerarCobrancaCEF.qryDadosRetorno.IsEmpty;
      sbnImprimirContrato.Enabled:=  not dtmGerarCobrancaCEF.qryDadosRetorno.IsEmpty;
    end
    else
      MensagemAviso(ctARQUIVOINEXISTENTE);
  end;
end;

procedure TfrmGerarCobracaCEF.sbnDiretorioArquivosClick(Sender: TObject);
var Dir : String;
begin
  inherited;
  if FAcao = 'G' then
  begin
    if SelectDirectory('Selecionar diretório para'+CrLf+
                       'armazenar o arquivo de remessa:','',Dir) then
    begin
      Dir:= DIR;
      lblDiretorio.Caption:= Dir+'\';
    end;
    edtPeriodoInicial.SetFocus;
  end
  else if FAcao = 'R' then
  begin
    OdgArquivoRetorno.InitialDir:= ExtractFilePath(Application.ExeName)+'Retorno';
    if OdgArquivoRetorno.Execute then
    begin
      sbnGerarParcelas.Enabled:= True;
      lblDiretorio.Caption:= OdgArquivoRetorno.FileName;
      sbnGerarParcelasClick(Self);
    end;
  end;
end;

procedure TfrmGerarCobracaCEF.sbnGravarClick(Sender: TObject);
var Arquivo, NomeArquivo: String;
    Msg: String;
begin
  inherited;
  Arquivo:= lblDiretorio.Caption;
  if rbnRemessa.Checked then
    dtmGerarCobrancaCEF.GerarArquivosRemessa(Arquivo, FNomeEmpreendimento)
  else if rbnRetorno.Checked then
  begin
    if dtmGerarCobrancaCEF.GravarParcelas then
    begin
      NomeArquivo:= ExtractFileName(OdgArquivoRetorno.FileName);
      NomeArquivo:= ChangeFileExt(NomeArquivo,'.PRC');
      if not (RenameFile(OdgArquivoRetorno.FileName, NomeArquivo)) then
        raise Exception.Create('Não foi possível renomear o arquivo');
      sbnGravar.       Enabled:= False;
      sbnGerarParcelas.Enabled:= False;

      if dtmGerarCobrancaCEF.NrErrosDetectados = 0
      then MensagemAviso('Arquivo de retorno processado com sucesso!')
      else if dtmGerarCobrancaCEF.NrErrosDetectados = 1
           then MensagemErro('Foi detectado 1 erro no processamento')
           else MensagemErro('Foram detectados ' +
                        IntToStr(dtmGerarCobrancaCEF.NrErrosDetectados) +
                        ' erros no processamento');
    end;
  end;
end;

procedure TfrmGerarCobracaCEF.dbgClientesSelecaoDblClick(Sender: TObject);
begin
  inherited;
  dtmGerarCobrancaCEF.MarcarSelecionados(ckbSelecionartodos.Checked, False);
end;

procedure TfrmGerarCobracaCEF.ckbSelecionartodosClick(Sender: TObject);
begin
  inherited;
  dtmGerarCobrancaCEF.MarcarSelecionados(ckbSelecionartodos.Checked, True);
end;

procedure TfrmGerarCobracaCEF.dbgClientesSelecaoDrawColumnCell(Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);
begin
  inherited;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('campomaior').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clYellow;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    TDBGrid(Sender).Canvas.Font.Style  := [fsBold];
  end;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('selecionado').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmGerarCobracaCEF.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F6 then
    sbnGerarParcelasClick(Self);
  if key = VK_F5 then
  begin
    if sbnGravar.Enabled then
      sbnGravarClick(Self);
  end
end;

procedure TfrmGerarCobracaCEF.dbgDadosRetornoDrawColumnCell(Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('erro').AsBoolean)  then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clRed;
    TDBGrid(Sender).Canvas.Font.Color  := clWhite;
  end
  else if (TDBGrid(Sender).DataSource.DataSet.FieldByName('Outras').AsBoolean)  then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $0095C2D9;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmGerarCobracaCEF.rbnRemessaClick(Sender: TObject);
begin
  inherited;
  FAcao:= 'G';
  lblDiretorio.Caption:= ExtractFilePath(Application.ExeName)+'Remessa\';
  gbxDiretorio.Caption:= ' DIRETÓRIO ';
  gbxEmpreendimento.Enabled:= True;
  ckbSelecionartodos.Visible:= True;
  pnlCores.Visible:= False;
  pnlCampoMaior.Visible:= True;
  if dtmGerarCobrancaCEF.qryContratosParcelas.RecordCount > 0 then
    sbnGravar.Enabled:= True
  else
    sbnGravar.Enabled:= False;
  sbnGerarParcelas.Enabled:= True;
  fraConsultaEmpreendimento.Enabled:= True;
  gbxPeriodo.Enabled:= True;
  sbnImprimirContrato.Enabled:= false;
  pgcGrids.ActivePage:= tstDadosGerados;
  sbnDiretorioArquivos.Caption:= ' DIRETÓRIO ';
end;

procedure TfrmGerarCobracaCEF.rbnRetornoClick(Sender: TObject);
begin
  inherited;
  FAcao:= 'R';
  sbnGravar.Enabled:= False;
  sbnGerarParcelas.Enabled:= True;
  gbxDiretorio.Caption:= ' ARQUIVO DE RETORNO ';
  fraConsultaEmpreendimento.Enabled:= False;
  gbxPeriodo.Enabled:= False;
  gbxEmpreendimento.Enabled:= False;
  ckbSelecionartodos.Visible:= False;
  pnlCores.Visible:= True;
  pnlCampoMaior.Visible:= False;
  pgcGrids.ActivePage:= tstDadosRetorno;
  sbnDiretorioArquivos.Caption:= ' ARQUIVO ';
end;

procedure TfrmGerarCobracaCEF.sbnImprimirContratoClick(Sender: TObject);
begin
  inherited;
  dtmGerarCobrancaCEF.ImprimirRelatorio;
end;

procedure TfrmGerarCobracaCEF.dbgDadosRetornoDblClick(Sender: TObject);
begin
  inherited;
  with dtmGerarCobrancaCEF do
  begin
    qryDadosRetorno.DisableControls;
    if (qryDadosRetornoerro.AsBoolean) then
      MensagemErro(qryDadosRetornodescerro.AsString)
    else if (qryDadosRetornooutras.AsBoolean) then
      MensagemAviso(qryDadosRetornodescerro.AsString+#10#13+
                    'Operação: '+qryDadosRetornodesccricaomov.AsString);
    qryDadosRetorno.EnableControls;
  end;

end;

function TfrmGerarCobracaCEF.Validardata(DF, DI: String): String;
begin
  Result:= 'OK';
  if not ((DI <> '') and (DF <> '')) then
    Result:= 'B'
  else if (strtodate(DF) < strtodate(DI)) then
    Result:= 'M';
end;



end.
