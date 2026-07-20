unit fmfcont;

interface

uses
  SysUtils, Types, Classes, Graphics, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, fmajudabt, Mask,
  cpdata, ComCtrls, biblio, ctconstantes, Controls, ACBrSped,
  cpdbradiogroup, frconsultacontabil, frconsultacodigocontabil, cpnumero,
  DBCtrls, cpdbtext, cpdbmemo, cptexto, cpdbdata, cpdbmesano, {Qete,} DB,
  fmcadastropadrao, cpdbfindcontrols, dateutils, Grids, DBGrids, cpdbgrid,
  frconsulta,  frconsultacodigo;

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
    gbxNumOrd: TGroupBox;
    edtNum_Ord: TDBEditNumero;
    gbxLivro: TGroupBox;
    gbxNatureza: TGroupBox;
    edtNatureza: TDBEditTexto;
    rbnNormal: TtecRadioButton;
    gbxErro: TGroupBox;
    procedure sbnGerarArquivoClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
  protected
    fraConsultaICMSObrigacoes : TfraConsultaCodigoContabil;
    fraConsultaAjusteICMS : TfraConsultaCodigoContabil;
    fraConsultaecd : TfraConsultaCodigoContabil;
    procedure AbrirECD;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;

  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;
    procedure ACBrSPEDContabilonError(Sender: TObject);
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

uses dmfcont;

{$R *.dfm}

procedure TfrmFCont.ACBrSPEDContabilonError(Sender: TObject);
begin
  mmoErro.Lines.Add(dtmFCont.erro);
end;

constructor TfrmFCont.Create(AOwner: TComponent);
begin
  inherited;
  dtmFCont := TdtmFCont.Create(self);
  DataSet := dtmFCont.qryecd;
  dtmFCont.ACBrSPEDContabilonError := ACBrSPEDContabilonError;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;

  fraConsultaecd := TfraConsultaCodigoContabil.Create(self);
  fraConsultaecd.edfCodigo.Operacao := opPESQUISA;
  fraConsultaecd.AbrirTabelaProcura := false;
  fraConsultaecd.TipoPesquisa := pesECD;
  fraConsultaecd.OnFound := AbrirECD;

  sbnGerarArquivo.Enabled := false;

end;

procedure TfrmFCont.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
  begin
     with dtmFCont do
     begin
       if GerarArquivo(qryecdnomearquivo.AsString) then
         MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[qryecdnomearquivo.AsString]));
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
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a escrita contábil digital'])) = smbOK then
      Result := dtmFCont.Excluirecd
    else
      Result := False
end;

function TfrmFCont.InternoGravar: Boolean;
begin
  inherited InternoGravar;
  Result := dtmFCont.Gravarecd
end;

function TfrmFCont.InternoIncluir: Boolean;
begin
  result := inherited internoincluir;
  if result then
    Result := dtmFCont.Incluirecd;
end;

destructor TfrmFCont.Destroy;
begin
  inherited;
  dtmFCont := nil;
  frmFCont := nil;
end;


procedure TfrmFCont.AbrirECD;
begin
  edtExercicio.Text := fraConsultaecd.qryProcuraECDexercicio.AsString;
  fraConsultaFilial.edfCodigo.Text := fraConsultaecd.qryProcuraECDfilial.AsString;
  dtmFCont.
        refazconsulta(dtmFCont.qryecd,[0,1],
             [fraConsultaecd.qryProcuraECDexercicio.AsString,
              fraConsultaecd.qryProcuraECDfilial.AsString]);
end;

procedure TfrmFCont.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  fraConsultaecd.InternoPesquisar('ECD - Escrita Contábil Digital');
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
        fraConsultaecd.InternoPesquisar('efd - Escrita Contábil Digital');
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
                             (dtmFCont.qryecd.RecordCount<>0);
end;

end.
