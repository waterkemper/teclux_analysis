unit fmarquivodimob;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, ComCtrls, Buttons, ExtCtrls, cpdbradiogroup,
  DBCtrls, cpdbtext, Mask, cpdbfindcontrols, cpnumero, QCheckLst, dateutils,
  cpdata, frlistafiliais, cpeditioncontrolvalidation, biblio, ctconstantes,
  ToolWin;

(*==============================================================================
                         INSTRUÇÕES DE IMPORTAÇÃO

      Estão definidas na aba AJUDA do programa DIMOB distribuído pela RFB.
==============================================================================*)


type
  TfrmArquivoDimob = class(TfrmAjudaBt)
    sbnGerarArquivo: TSpeedButton;
    gbxJanelaFundo: TGroupBox;
    gbxAnoBase: TGroupBox;
    rgbRetificadora: TtecDBRadioGroup;
    rbnNaoRetificadora: TtecRadioButton;
    rbnSimRetificadora: TtecRadioButton;
    gbxNrRecibo: TGroupBox;
    rdbSituacaoEspecial: TtecDBRadioGroup;
    rbnSituacaoEspecial_Nao: TtecRadioButton;
    rbnSituacaoEspecial_Sim: TtecRadioButton;
    gbxDataEvento: TGroupBox;
    rgbSituacao: TtecDBRadioGroup;
    rbnExtincao: TtecRadioButton;
    gbxRetificadora: TGroupBox;
    gbxSituacaoEspecial: TGroupBox;
    rbnNormal: TtecRadioButton;
    rbnFusao: TtecRadioButton;
    rbnIncorporacao: TtecRadioButton;
    rbnCisaoTotal: TtecRadioButton;
    lblIncorporada: TLabel;
    gbxArquivo: TGroupBox;
    sbnArquivo: TSpeedButton;
    lblArqDimob: TLabel;
    edtAnoBase: TEditNumero;
    dlgArquivoaExportar: TSaveDialog;
    edtNRecibo: TEditNumero;
    fraListaFiliais: TfraListaFiliais;
    ecvValidaRecibo: TtecEditionControlValidation;
    ecvValidaDataSituacaoEspecial: TtecEditionControlValidation;
    edtDataEspecial: TEditData;
    procedure sbnArquivoClick(Sender: TObject);
    procedure rbnSituacaoEspecial_SimClick(Sender: TObject);
    procedure rbnSituacaoEspecial_NaoClick(Sender: TObject);
    procedure rbnNaoRetificadoraClick(Sender: TObject);
    procedure rbnSimRetificadoraClick(Sender: TObject);
    procedure sbnGerarArquivoClick(Sender: TObject);
  private
    function GetSituacao: integer;
  private
    { Private declarations }
    function ValidarControles: Boolean;
    property Situacao: integer read GetSituacao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmArquivoDimob: TfrmArquivoDimob;
  ControleValido       : TWinControl;


implementation

uses dmarquivodimob;

{$R *.dfm}

constructor TfrmArquivoDimob.Create(AOwner: TComponent);
begin
  inherited;
  dtmArquivoDimob := TdtmArquivoDimob.Create(self);
  edtAnoBase.Text := inttostr(strtoint(FormatDateTime('YYYY', now()))-1);
end;

destructor TfrmArquivoDimob.Destroy;
begin
  frmArquivoDimob := nil;
  inherited;
end;

procedure TfrmArquivoDimob.sbnArquivoClick(Sender: TObject);
begin
  inherited;
  if dlgArquivoaExportar.Execute then
     lblArqDimob.Caption:=trim(dlgArquivoaExportar.FileName);
end;

procedure TfrmArquivoDimob.rbnSituacaoEspecial_SimClick(Sender: TObject);
begin
  inherited;
  gbxDataEvento.Enabled := true;
  edtDataEspecial.enabled := true;

  rgbSituacao.Enabled := true;
  rbnNormal.enabled := true;
  rbnExtincao.enabled := true;
  rbnFusao.enabled := true;
  rbnIncorporacao.enabled := true;
  rbnCisaoTotal.enabled := true;

end;

procedure TfrmArquivoDimob.rbnSituacaoEspecial_NaoClick(Sender: TObject);
begin
  inherited;
  gbxDataEvento.Enabled := false;
  rgbSituacao.Enabled := false;
  edtDataEspecial.enabled := false;

  rbnNormal.enabled := false;
  rbnExtincao.enabled := false;
  rbnFusao.enabled := false;
  rbnIncorporacao.enabled := false;
  rbnCisaoTotal.enabled := false;


  edtDataEspecial.Clear;
end;

procedure TfrmArquivoDimob.rbnNaoRetificadoraClick(Sender: TObject);
begin
  inherited;
  gbxNrRecibo.Enabled := false;
  edtNRecibo.Clear;
end;

procedure TfrmArquivoDimob.rbnSimRetificadoraClick(Sender: TObject);
begin
  inherited;
  gbxNrRecibo.Enabled := true;
end;

procedure TfrmArquivoDimob.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  if ValidarControles then
  begin
     if dtmArquivoDimob.GerarArquivo(lblArqDimob.caption, strtoint(edtAnoBase.text),
                                   rbnSimRetificadora.Checked, edtNRecibo.text,
                                   rbnSituacaoEspecial_Sim.Checked, edtDataEspecial.text,
                                   situacao, fraListaFiliais.ListaSelecionada ) then
       MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[lblArqDimob.caption]));

  end;


end;

function TfrmArquivoDimob.ValidarControles: Boolean;
begin
  result := true;

  if rbnSimRetificadora.Checked then
    Result:= ecvValidaRecibo.Verify(gbxJanelaFundo, ControleValido);

  if result then
    if rbnSituacaoEspecial_Sim.Checked then
      Result:= ecvValidaDataSituacaoEspecial.Verify(gbxSituacaoEspecial, ControleValido);

end;

function TfrmArquivoDimob.GetSituacao: integer;
begin
  if rbnNormal.Checked then result := strtoint(rbnNormal.Value)
  else
  if rbnExtincao.Checked then result := strtoint(rbnExtincao.Value)
  else
  if rbnFusao.Checked then result := strtoint(rbnFusao.Value)
  else
  if rbnIncorporacao.Checked then result := strtoint(rbnIncorporacao.Value)
  else
  if rbnCisaoTotal.Checked then result := strtoint(rbnCisaoTotal.Value);

end;

end.
