unit fmfcont;

interface

uses
  SysUtils, Types, Classes, Graphics, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, fmajudabt, Mask,
  cpdata, ComCtrls, biblio, ctconstantes, Controls, ACBrSped,
  cpdbradiogroup, frconsultacontabil, frconsultacodigocontabil, cpnumero,
  DBCtrls, cpdbtext, cpdbmemo, cptexto, cpdbdata, cpdbmesano, Windows,{Qete,} DB,
  fmcadastropadrao, cpdbfindcontrols, dateutils, Grids, DBGrids, cpdbgrid,
  frconsulta,  frconsultacodigo, ToolWin;

type
  TfrmFCont = class(TfrmCadastroPadrao)
    sbnGerarArquivo: TSpeedButton;
    mmoErro: TMemo;
    pnlTop: TPanel;
    gbxExercicio: TGroupBox;
    gbxArquivo: TGroupBox;
    dtxArquivo: TtecDBText;
    edtExercicio: TtecDbEditFind;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    rbnSituacao: TtecDBRadioGroup;
    rbnAbertura: TtecRadioButton;
    rbnCISAO: TtecRadioButton;
    rbnFUSAO: TtecRadioButton;
    rbnINCORPORACAO: TtecRadioButton;
    rbnEXTINSAO: TtecRadioButton;
    rbnNormal: TtecRadioButton;
    gbxErro: TGroupBox;
    rbnIndicadorInicioPeriodo: TtecDBRadioGroup;
    rbn_Periodo_0: TtecRadioButton;
    rbn_Periodo_1: TtecRadioButton;
    rbn_Periodo_2: TtecRadioButton;
    rbn_Periodo_3: TtecRadioButton;
    ckbTipodeEscrituracao: TtecDBRadioGroup;
    rbnOriginal: TtecRadioButton;
    rbnRetificadora: TtecRadioButton;
    gbxNrRecAnterior: TGroupBox;
    edtReciboAnterior: TDBEditTexto;
    gbxEscrituracaoAnterior: TGroupBox;
    DBEditTexto1: TDBEditTexto;
    gbxEscrituracaoPeriodoAnterior: TGroupBox;
    ckbSituacaoSaldoAnterior: TtecDBRadioGroup;
    tecRadioButton1: TtecRadioButton;
    tecRadioButton2: TtecRadioButton;
    tecRadioButton3: TtecRadioButton;
    tecRadioButton4: TtecRadioButton;
    ckbPermissaoSaldoInicial: TtecDBRadioGroup;
    rbnAjustar: TtecRadioButton;
    tecRadioButton6: TtecRadioButton;
    procedure sbnGerarArquivoClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
  protected
    fraConsultaICMSObrigacoes : TfraConsultaCodigoContabil;
    fraConsultaAjusteICMS : TfraConsultaCodigoContabil;
    fraConsultafcont : TfraConsultaCodigoContabil;
    procedure AbrirFCONT(Found: Boolean);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;

  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;
    procedure ACBrSPEDFContonError(Sender: TObject);
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    { Public declarations}
  end;

var
  frmFCont: TfrmFCont;

implementation

uses dmfcont, ACBrSpedFCont;

{$R *.dfm}

procedure TfrmFCont.ACBrSPEDFContonError(Sender: TObject);
begin
  mmoErro.Lines.Add(dtmFCont.erro);
end;

constructor TfrmFCont.Create(AOwner: TComponent);
begin
  inherited;
  dtmFCont := TdtmFCont.Create(self);
  DataSet := dtmFCont.qryfcont;
  dtmFCont.ACBrSPEDFContonError := ACBrSPEDFContonError;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;

  fraConsultafcont := TfraConsultaCodigoContabil.Create(self);
  fraConsultafcont.edfCodigo.Operacao := opPESQUISA;
  fraConsultafcont.AbrirTabelaProcura := false;
  fraConsultafcont.TipoPesquisa := pesFCont;
  fraConsultafcont.OnFound := AbrirFCONT;

  sbnGerarArquivo.Enabled := false;

end;

procedure TfrmFCont.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
  begin
     with dtmFCont do
     begin
       if GerarArquivo(qryfcontnomearquivo.AsString) then
         MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[qryfcontnomearquivo.AsString]));
     end;
  end
end;

function TfrmFCont.ValidarCamposSelecao: Boolean;
begin
  result := not length(trim(edtExercicio.Text))<>4;
  if not result then
  begin
    MensagemAviso(ctPERIODOINVALIDO);
    edtExercicio.SetFocus;
  end;
end;


function TfrmFCont.InternoExcluir: Boolean;
begin
  Result := inherited InternoExcluir;
  if Result then
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a escrita contábil de transição - FCONT'])) = smbOK then
      Result := dtmFCont.Excluirfcont
    else
      Result := False
end;

function TfrmFCont.InternoGravar: Boolean;
begin
  inherited InternoGravar;
  Result := dtmFCont.Gravarfcont
end;

function TfrmFCont.InternoIncluir: Boolean;
begin
  result := inherited internoincluir;
  if result then
    Result := dtmFCont.Incluirfcont;
end;

destructor TfrmFCont.Destroy;
begin
  inherited;
  dtmFCont := nil;
  frmFCont := nil;
end;


procedure TfrmFCont.AbrirFCONT(Found: Boolean);
begin
  edtExercicio.Text := fraConsultafcont.qryProcuraFContexercicio.AsString;
  fraConsultaFilial.edfCodigo.Text := fraConsultafcont.qryProcuraFContfilial.AsString;
  dtmFCont.
        refazconsulta(dtmFCont.qryfcont,[0,1],
             [fraConsultaFCont.qryProcuraFContexercicio.AsString,
              fraConsultaFCont.qryProcuraFContfilial.AsString]);
end;

procedure TfrmFCont.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  fraConsultaFCont.InternoPesquisar('FCONT - Escrita Contábil de Transição');
  self.SetFocus;
end;

procedure TfrmFCont.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key = VK_F9) then
    begin
      if sbnProcurar.Enabled then
      begin
        fraConsultaFCont.InternoPesquisar('FCONT - Escrita Contábil de Transição');
        self.SetFocus;
      end
    end
    else
    if (key = VK_F8) then
    begin
      if sbnGerarArquivo.Enabled then
        sbnGerarArquivoClick(nil);
    end;
  end;
end;

procedure TfrmFCont.AlterarEstadoBotoes;
begin
  inherited;

  sbnGerarArquivo.Enabled := sbnIncluir.Enabled and
                             not sbnSalvar.Enabled and
                             (dtmFCont.qryfcont.RecordCount<>0);
end;

end.
