unit fmemissaonotasacrescimofinanceiro;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, Windows,
  ActnList, Grids, DBGrids, cpdata, frconsulta, frconsultacodigo,
  cpdbgrid, biblio, ctconstantes, DBCtrls, cpdbtext, cptexto, cpnumero,
  DateUtils, clparametrossistema, ToolWin;

type
  TfrmEmissaoNotasAcrescimoFinanceiro = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    actHabilitar: TActionList;
    aclHabilitar: TAction;
    gbxECFs: TGroupBox;
    dbgECFs: TtecDBGrid;
    gbxFiltros: TGroupBox;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxEmissao: TGroupBox;
    edtEmissaoInicial: TEditData;
    edtEmissaoFinal: TEditData;
    gbxCupons: TGroupBox;
    dbgCupons: TtecDBGrid;
    lblA: TLabel;
    gbxValores: TGroupBox;
    gbxData: TGroupBox;
    tecDBGrid1: TtecDBGrid;
    procedure aclHabilitarUpdate(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
    procedure edtEmissaoFinalEnter(Sender: TObject);
    procedure edtEmissaoInicialExit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure ExibirMensagemPadronizadaDataInicial;
    procedure ExibirMensagemPadronizadaDataFinal;

//    function InternoGravar: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  frmEmissaoNotasAcrescimoFinanceiro: TfrmEmissaoNotasAcrescimoFinanceiro;

implementation

uses dmemissaonotasacrescimofinanceiro, fmnavcontroles;
{$R *.dfm}

procedure TfrmEmissaoNotasAcrescimoFinanceiro.aclHabilitarUpdate(
  Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled := (trim(edtEmissaoInicial.Text) <> '') and
                      (trim(edtEmissaoFinal.Text) <> '')   and
                      (trim(fraConsultaFilial.edfCodigo.Text) <> '');
  sbnSalvar.Enabled := not dtmEmissaoNotasAcrescimoFinanceiro.TabelaECFsDataVazia;
end;

constructor TfrmEmissaoNotasAcrescimoFinanceiro.Create(AOwner: TComponent);
begin
  dtmEmissaoNotasAcrescimoFinanceiro := TdtmEmissaoNotasAcrescimoFinanceiro.Create(Self);
  inherited;
  DataSet := dtmEmissaoNotasAcrescimoFinanceiro.qryNotasPag;
  fraConsultaFilial.TipoPesquisa   := pesFILIAIS;
  fraConsultaFilial.edfCodigo.Text := IntToStr(dtmEmissaoNotasAcrescimoFinanceiro.FilialBase);
  fraConsultaFilial.edfCodigo.Exist;
  edtEmissaoInicial.Text := DateToStr(dtmEmissaoNotasAcrescimoFinanceiro.DataServidor);
  edtEmissaoFinal.Text   := DateToStr(dtmEmissaoNotasAcrescimoFinanceiro.DataServidor);

  edtEmissaoInicial.Minimo := dtmEmissaoNotasAcrescimoFinanceiro.NDiasLimiteEmissao;
  edtEmissaoInicial.MensagemPadronizada := ExibirMensagemPadronizadaDataInicial;

  edtEmissaoFinal.Minimo := dtmEmissaoNotasAcrescimoFinanceiro.NDiasLimiteEmissao;
  edtEmissaoFinal.MensagemPadronizada := ExibirMensagemPadronizadaDataFinal;

end;
{
function TfrmEmissaoNotasAcrescimoFinanceiro.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    dtmEmissaoNotasAcrescimoFinanceiro.GravarNota;
end;
}
procedure TfrmEmissaoNotasAcrescimoFinanceiro.KeyDown(var Key: Word;
  Shift: TShiftState);
begin 
  if (key = VK_F6) and sbnGerar.Enabled then
    sbnGerar.Click
  else if (key = VK_F5) and sbnSalvar.Enabled then
    sbnSalvar.Click
  else if (key = VK_Escape) then
    dtmEmissaoNotasAcrescimoFinanceiro.FecharTabelas
  else inherited;
end;

procedure TfrmEmissaoNotasAcrescimoFinanceiro.sbnGerarClick(
  Sender: TObject);
begin
  if dtmEmissaoNotasAcrescimoFinanceiro.GerarConsulta(fraConsultaFilial.edfCodigo.Text,
                                                      edtEmissaoInicial.Text,
                                                      edtEmissaoFinal.Text) then
    MensagemAviso(format(ctNENHUMREGISTROENCONTRADO, ['registro']));
//  edtAcrescimoExcluido.Text := FloatToStr(dtmEmissaoNotasAcrescimoFinanceiro.TotIsentas);
///  edtBase.Text := FloatToStr(dtmEmissaoNotasAcrescimoFinanceiro.TotBase);
//  edtICMS.Text := FloatToStr(dtmEmissaoNotasAcrescimoFinanceiro.TotICMS);
end;

procedure TfrmEmissaoNotasAcrescimoFinanceiro.sbnSalvarClick(
  Sender: TObject);
begin
  dtmEmissaoNotasAcrescimoFinanceiro.GravarNota;
end;

procedure TfrmEmissaoNotasAcrescimoFinanceiro.edtEmissaoFinalEnter(
  Sender: TObject);
begin
  inherited;
  if edtEmissaoInicial.Criticar(false) and (edtEmissaoInicial.Text<>'') then
    edtEmissaoFinal.Minimo:= DaysBetween(dtmEmissaoNotasAcrescimoFinanceiro.DataServidor,StrToDate(edtEmissaoInicial.Text));
end;

procedure TfrmEmissaoNotasAcrescimoFinanceiro.ExibirMensagemPadronizadaDataFinal;
begin
  if strtodate(edtEmissaoFinal.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['final',
                     edtEmissaoFinal.Text, 'contábil', ParSistema.DataContabilstring]))
  else
  if strtodate(edtEmissaoFinal.Text) < strtodate(edtEmissaoFinal.Text) then
    MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['final',
                     edtEmissaoFinal.Text, 'emissão', edtEmissaoFinal.Text]))
end;

procedure TfrmEmissaoNotasAcrescimoFinanceiro.ExibirMensagemPadronizadaDataInicial;
begin
  if strtodate(edtEmissaoInicial.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['inicial',
                     edtEmissaoInicial.Text, 'contábil', ParSistema.DataContabilstring]))
  else
    if strtodate(edtEmissaoInicial.Text) < DataLocal - edtEmissaoInicial.minimo then
      MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['inicial',
                       edtEmissaoInicial.Text, 'retroativa',
                       datetostr(DataLocal - edtEmissaoInicial.Minimo)]))
end;

procedure TfrmEmissaoNotasAcrescimoFinanceiro.edtEmissaoInicialExit(
  Sender: TObject);
begin
  inherited;
  edtEmissaoFinal.Minimo := dtmEmissaoNotasAcrescimoFinanceiro.NDiasLimiteData(
                          edtEmissaoInicial.Text);
end;

end.
