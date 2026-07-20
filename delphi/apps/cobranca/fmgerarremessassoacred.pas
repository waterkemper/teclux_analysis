unit fmgerarremessassoacred;

interface

uses
//CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids, Windows,
  ActnList,
//DBF
  DB, VKDBFDataSet,
//Repositorio
  fmajudabt,
//Tecsoft
  frconsulta, frconsultacodigo, cpdbgrid, cpdata, ctconstantes, cptexto,
  cppagecontrol, biblio,
//Projeto
  dmgerarremessassoacred, ToolWin;
type
  TfrmGerarRemessasSoacred = class(TfrmAjudaBt)
    sbnGerarParcelas: TSpeedButton;
    sbnGravar: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxPagamento: TGroupBox;
    gbxDeVencto: TGroupBox;
    edtPagtoInicial: TEditData;
    gbxAteVencto: TGroupBox;
    edtPagtoFinal: TEditData;
    gbxFaturamento: TGroupBox;
    gbxDeFaturamento: TGroupBox;
    edtFaturamentoInicial: TEditData;
    gbxAteFaturamento: TGroupBox;
    edtFaturamentoFinal: TEditData;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxAgente: TGroupBox;
    fraConsultaAgente: TfraConsultaCodigo;
    GroupBox1: TGroupBox;
    sbnDiretorioArquivos: TSpeedButton;
    lblCaminhoDiretorio: TLabel;
    gbxCodLoja: TGroupBox;
    edtCodLoja: TEditTexto;
    ActionList1: TActionList;
    Action1: TAction;
    gbxAlteracaoCadastro: TGroupBox;
    gbxDeAlteracao: TGroupBox;
    edtAlteracaoInicial: TEditData;
    gbxAteAlteracao: TGroupBox;
    edtAlteracaoFinal: TEditData;
    gbxConceito: TGroupBox;
    fraConsultaConceito: TfraConsultaCodigo;
    pgcTabelas: TtecPageControl;
    tstParcelas: TTabSheet;
    dbgParcelas: TtecDBGrid;
    tstVendas: TTabSheet;
    tstClientes: TTabSheet;
    dbgClientes: TtecDBGrid;
    dbgVendas: TtecDBGrid;
    procedure sbnGerarParcelasClick(Sender: TObject);
    procedure sbnDiretorioArquivosClick(Sender: TObject);
    procedure sbnGravarClick(Sender: TObject);
    procedure Action1Update(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function ValidarControles: Boolean;
    procedure LerCodigoLoja;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  frmGerarRemessasSoacred: TfrmGerarRemessasSoacred;

implementation

uses
//CLX
  inifiles
//VCL
{$IFDEF MSWINDOWS}, FileCtrl{$ENDIF};

{$R *.dfm}

constructor TfrmGerarRemessasSoacred.Create(AOwner: TComponent);
begin
  dtmGerarRemessasSoacred := TdtmGerarRemessasSoacred.Create(Self);
  inherited;
  pgcTabelas.ActivePage := tstParcelas;
  fraConsultaAgente.TipoPesquisa   := pesAGENTES;
  fraConsultaConceito.TipoPesquisa := pesCONCEITOS;
  fraConsultaFilial.TipoPesquisa   := pesFILIAIS;
  fraConsultaFilial.edfCodigo.Text := IntToStr(dtmGerarRemessasSoacred.FilialBase);
  fraConsultaFilial.edfCodigo.Exist;
  LerCodigoLoja;
  edtPagtoInicial.Text       := DateToStr(dtmGerarRemessasSoacred.DataServidor);
  edtPagtoFinal.Text         := DateToStr(dtmGerarRemessasSoacred.DataServidor);
  edtFaturamentoInicial.Text := DateToStr(dtmGerarRemessasSoacred.DataServidor);
  edtFaturamentoFinal.Text   := DateToStr(dtmGerarRemessasSoacred.DataServidor);
  edtAlteracaoInicial.Text   := DateToStr(dtmGerarRemessasSoacred.DataServidor);
  edtAlteracaoFinal.Text     := DateToStr(dtmGerarRemessasSoacred.DataServidor);
end;

procedure TfrmGerarRemessasSoacred.sbnGerarParcelasClick(Sender: TObject);
begin
  inherited;
  if ValidarControles then
  begin
    dtmGerarRemessasSoacred.ConsultaParcelas(edtPagtoInicial.Text, edtPagtoFinal.Text,
                                             edtFaturamentoInicial.Text, edtFaturamentoFinal.Text,
                                             edtAlteracaoInicial.Text, edtAlteracaoFinal.Text,
                                             fraConsultaFilial.edfCodigo.Text,
                                             fraConsultaAgente.edfCodigo.Text,
                                             fraConsultaConceito.edfCodigo.Text );
    pgcTabelas.ActivePage := tstParcelas;
    dbgParcelas.SetFocus;
  end;
end;

function TfrmGerarRemessasSoacred.ValidarControles: Boolean;
begin
  Result := (trim(edtPagtoInicial.Text)       <> '') or
            (trim(edtPagtoFinal.Text)         <> '') or
            (trim(edtFaturamentoInicial.Text) <> '') or
            (trim(edtFaturamentoFinal.Text)   <> '') or
            (trim(edtAlteracaoInicial.Text)   <> '') or
            (trim(edtAlteracaoFinal.Text)     <> '') or
            (trim(fraConsultaAgente.edfCodigo.Text) <> '');
end;

procedure TfrmGerarRemessasSoacred.sbnDiretorioArquivosClick(Sender: TObject);
var
  dir : String;
begin
  inherited;
  if SelectDirectory('Selecionar Diretório:','', dir) then
  begin
    dir := Dir;
    lblCaminhoDiretorio.Caption := Dir
  end;
  SetFocus;
end;

procedure TfrmGerarRemessasSoacred.sbnGravarClick(Sender: TObject);
begin
  if not dtmGerarRemessasSoacred.GravarArquivos(lblCaminhoDiretorio.Caption, edtCodLoja.text,
           fraConsultaAgente.edfCodigo.Text, fraConsultaConceito.edfCodigo.Text) then
  begin
    pgcTabelas.ActivePage := tstVendas;
    dbgVendas.SetFocus;
  end;
end;

procedure TfrmGerarRemessasSoacred.LerCodigoLoja;
var
  ArquivoCFG: TIniFile;
begin
  if FileExists(NomeArquivoCFG) then
  begin
     ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
      if ArquivoCFG.SectionExists(SoacredSection) then begin
        edtCodLoja.Text := ArquivoCFG.ReadString(SoacredSection, 'loja', '');
        lblCaminhoDiretorio.Caption := ArquivoCFG.ReadString(SoacredSection, 'dir', '');
        fraConsultaAgente.edfCodigo.Text := ArquivoCFG.ReadString(SoacredSection, 'agente', '');
        fraConsultaConceito.edfCodigo.Text := ArquivoCFG.ReadString(SoacredSection, 'conceito', '');
      end;
    finally
      ArquivoCFG.Free;
      // FAZ COM Q AS PESQUISAS SEJAM FEITAS
      fraConsultaAgente.edfCodigo.Exist;
      fraConsultaConceito.edfCodigo.Exist;
    end;
  end;
end;

procedure TfrmGerarRemessasSoacred.Action1Update(Sender: TObject);
begin
  inherited;
  sbnGravar.Enabled := not (dtmGerarRemessasSoacred.TabelaContratosParcelasVazia and
                            dtmGerarRemessasSoacred.TabelaClientesVazia and
                            dtmGerarRemessasSoacred.TabelaVendasVazia)
                       and (lblCaminhoDiretorio.Caption <> '')
                       and (Trim(edtCodLoja.Text) <> '');
end;

procedure TfrmGerarRemessasSoacred.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE: begin
                  dtmGerarRemessasSoacred.FecharTabelas;
                  pgcTabelas.ActivePage := tstParcelas;
                  LerCodigoLoja;
                  fraConsultaFilial.edfCodigo.Text := IntToStr(dtmGerarRemessasSoacred.FilialBase);
                  fraConsultaFilial.edfCodigo.Exist;
                  edtPagtoInicial.Text       := DateToStr(dtmGerarRemessasSoacred.DataServidor);
                  edtPagtoFinal.Text         := DateToStr(dtmGerarRemessasSoacred.DataServidor);
                  edtFaturamentoInicial.Text := DateToStr(dtmGerarRemessasSoacred.DataServidor);
                  edtFaturamentoFinal.Text   := DateToStr(dtmGerarRemessasSoacred.DataServidor);
                  edtAlteracaoInicial.Text   := DateToStr(dtmGerarRemessasSoacred.DataServidor);
                  edtAlteracaoFinal.Text     := DateToStr(dtmGerarRemessasSoacred.DataServidor);
                end;
    VK_F6 : sbnGerarParcelas.Click;
    VK_F5 : sbnGravar.Click;
  end;
end;

end.
