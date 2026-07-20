unit fmconsultatransferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls,
  StdCtrls, DBCtrls, cpdbmemo, frconsulta, frconsultacodigo,
  cpdbradiogroup, Grids, DBGrids, cpdbgrid, frCartaCorrecaoEletronica,
  cptexto, frtelefone, frendereco, cpnumero, cpcpfcnpj, cpdbfindcontrols,
  cpdata, cpdbtext, Mask, cppagecontrol, frlistafiliais, dmconsultatransferencias,
  fmajudabt, clparametrossistema, biblio, ctconstantes, ActnList,
  cpeditioncontrolvalidation;

type
  TfrmConsultaTransferencias = class(TFrmAjudabt)
    sbnGerar: TSpeedButton;
    pgcConsultaNotasCupons: TtecPageControl;
    tstParametros: TTabSheet;
    gbxParametros: TGroupBox;
    gbxSituacao: TGroupBox;
    ckbAberta: TCheckBox;
    ckbFechada: TCheckBox;
    ckbConfirmada: TCheckBox;
    tstRegistrosSelecionados: TTabSheet;
    gbxPeriodoRequisicao: TGroupBox;
    lblA: TLabel;
    lblNumerodeDias: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    edtNumerodedias: TEditNumero;
    ckbCancelada: TCheckBox;
    gbxCurvaABC: TGroupBox;
    ckbCurvaABC_A: TCheckBox;
    ckbCurvaABC_C: TCheckBox;
    ckbCurvaABC_B: TCheckBox;
    ckbCurvaABC_NaoDefinido: TCheckBox;
    fraListaFiliaisRequisitadas: TfraListaFiliais;
    fraListaFiliaisRequisitantes: TfraListaFiliais;
    dbgTransferenciaRequisicao: TtecDBGrid;
    gbxObservacoes: TGroupBox;
    mmoObservacao: TtecDBMemo;
    ecvValida: TtecEditionControlValidation;
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);

  private
    { Private declarations }
  protected
    procedure ExibirMensagemPadronizadaDataInicial;
    procedure ExibirMensagemPadronizadaDataFinal;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    { Public declarations }
    constructor create(AOwner: TComponent); override;
    destructor destroy; override;

    function ValidarInformacao: Boolean;

  end;

var
  frmConsultaTransferencias: TfrmConsultaTransferencias;
  ControleAtivo: TWinControl;
  
implementation

{$R *.dfm}

{ TfrmConsultaTransferencias }

procedure TfrmConsultaTransferencias.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgTransferenciaRequisicao.ColumnByName('valorgrade1').Title.Caption := dtmConsultaTransferencias.LinhadaGrade;
  dbgTransferenciaRequisicao.ColumnByName('valorgrade2').Title.Caption := dtmConsultaTransferencias.ColunadaGrade;
end;

constructor TfrmConsultaTransferencias.create(AOwner: TComponent);
begin
  dtmConsultaTransferencias := TdtmConsultaTransferencias.Create(Self);
  inherited;

  with dtmConsultaTransferencias do
  begin
    if edtNumerodedias.ValorSemFormatacao <> 0 then
      edtDataInicial.Text   := DateToStr(DataServidor-edtNumerodedias.ValorSemFormatacao)
    else
      edtDataInicial.Text   := DateToStr(DataServidor-180);
    edtDataFinal.Text     := DateToStr(DataServidor);
  end;

  edtDataInicial.Minimo := dtmConsultaTransferencias.NDiasLimiteEmissao;
  edtDataInicial.MensagemPadronizada := ExibirMensagemPadronizadaDataInicial;

  edtDataFinal.Minimo := dtmConsultaTransferencias.NDiasLimiteEmissao;
  edtDataFinal.MensagemPadronizada := ExibirMensagemPadronizadaDataFinal;

  dbgTransferenciaRequisicao.ColumnByName('valorgrade1').Visible := ParSistema.UsarGradesProdutos;
  dbgTransferenciaRequisicao.ColumnByName('valorgrade2').Visible := ParSistema.UsarGradesProdutos;

  dbgTransferenciaRequisicao.ColumnByName('estoquerequisitante').Visible := ParSistema.RequisicaoSubtraiEstoque;

  dtmConsultaTransferencias.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;

  if dbgTransferenciaRequisicao.Columnbyname('estoquerequisitada').width < ParSistema.TamanhoMascaraQuantidade then
    dbgTransferenciaRequisicao.Columnbyname('estoquerequisitada').width := ParSistema.TamanhoMascaraQuantidade;

  if dbgTransferenciaRequisicao.Columnbyname('reservapreviarequisitada').width < ParSistema.TamanhoMascaraQuantidade then
    dbgTransferenciaRequisicao.Columnbyname('reservapreviarequisitada').Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgTransferenciaRequisicao.Columnbyname('estoquerequisitante').width < ParSistema.TamanhoMascaraQuantidade then
    dbgTransferenciaRequisicao.Columnbyname('estoquerequisitante').Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgTransferenciaRequisicao.Columnbyname('qtdepedida').width < ParSistema.TamanhoMascaraQuantidade then
    dbgTransferenciaRequisicao.Columnbyname('qtdepedida').Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgTransferenciaRequisicao.Columnbyname('qtderecebida').width < ParSistema.TamanhoMascaraQuantidade then
    dbgTransferenciaRequisicao.Columnbyname('qtderecebida').Width := ParSistema.TamanhoMascaraQuantidade;

end;

destructor TfrmConsultaTransferencias.destroy;
begin
  dtmConsultaTransferencias := nil;
  inherited;
  frmConsultaTransferencias := Nil;
end;

procedure TfrmConsultaTransferencias.ExibirMensagemPadronizadaDataFinal;
begin
  if strtodate(edtDataFinal.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['final',
                     edtDatafinal.Text, 'contábil', ParSistema.DataContabilstring]))
  else
  if strtodate(edtDataFinal.Text) < strtodate(edtDataInicial.Text) then
    MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['final',
                     edtDatafinal.Text, 'emissão', edtDatainicial.Text]))
end;

procedure TfrmConsultaTransferencias.ExibirMensagemPadronizadaDataInicial;
begin
  if strtodate(edtDataInicial.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['inicial',
                     edtDatainicial.Text, 'contábil', ParSistema.DataContabilstring]))
  else
    if strtodate(edtDataInicial.Text) < DataLocal - edtDataInicial.minimo then
      MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['inicial',
                       edtDataInicial.Text, 'retroativa',
                       datetostr(DataLocal - edtDataInicial.Minimo)]))
end;

procedure TfrmConsultaTransferencias.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F6: if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
    else inherited;
  end;
end;

procedure TfrmConsultaTransferencias.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarInformacao then
  begin
    with dtmConsultaTransferencias do
    begin
      DataInicial:= edtDataInicial.Text;
      DataFinal  := edtDataFinal.Text;
      Situacao_A := ckbAberta.checked;
      Situacao_D := ckbConfirmada.checked;
      Situacao_C := ckbCancelada.checked;
      Situacao_F := ckbFechada.checked;


      CurvaABC_A := ckbCurvaABC_A.Checked;
      CurvaABC_B := ckbCurvaABC_B.Checked;
      CurvaABC_C := ckbCurvaABC_C.Checked;
      CurvaABC_NaoDefinido := ckbCurvaABC_NaoDefinido.Checked;

      if not GerarConsultaRequisicao(fraListaFiliaisRequisitantes.ListaSelecionada,
                                 fraListaFiliaisRequisitadas.ListaSelecionada)  then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicial.SetFocus;
      end
      else
      begin
        pgcConsultaNotasCupons.activepage := tstRegistrosSelecionados;
        dbgTransferenciaRequisicao.SetFocus;
      end;
    end;
  end;

end;

function TfrmConsultaTransferencias.ValidarInformacao: Boolean;
begin
  Result:= ecvValida.Verify(gbxPeriodoRequisicao,ControleAtivo);

end;

end.
