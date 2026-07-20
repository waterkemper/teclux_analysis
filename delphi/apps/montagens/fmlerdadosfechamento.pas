unit fmlerdadosfechamento;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, Buttons, cpdbdata, StdCtrls, cpdbradiogroup, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, ExtCtrls,
  dmfechamentorequisicoesmontagens,
  cpdata,
  ctconstantes,
  fmConsultaBasica, fmConsultaporCampo,
  zquery, cpeditioncontrolvalidation, cpnumero,
  biblio;

type
  TfrmLerDadosFechamento = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    lblTabeladeMontagem: TLabel;
    dtxDescricaoTabeladeMontagem: TtecDBText;
    lblDatadeMontagem: TLabel;
    sbnProcuraTabeladeMontagem: TSpeedButton;
    pnlSeparador: TPanel;
    edfTabeladeMontagem: TtecDbEditFind;
    gbxTipodeMontagem: TGroupBox;
    rbnValorLoja: TtecRadioButton;
    rbnValorDentro: TtecRadioButton;
    rbnValorFora: TtecRadioButton;
    edtDataMontagem: TEditData;
    ecvValida: TtecEditionControlValidation;
    lblValorPagto: TLabel;
    edtValorPagto: TEditNumero;
    rgpTipo: TtecDBRadioGroup;
    rbnPercentual: TtecRadioButton;
    rbnValor: TtecRadioButton;
    procedure sbnProcuraTabeladeMontagemClick(Sender: TObject);
    procedure bbnOKClick(Sender: TObject);
    procedure edfTabeladeMontagemExit(Sender: TObject);
    procedure rbnValorLojaClick(Sender: TObject);
    procedure rbnValorDentroClick(Sender: TObject);
    procedure rbnValorForaClick(Sender: TObject);
  private
    { Private declarations }
  protected
   function InternoPesquisar(Titulo: String): Integer; override;
   function JanelaPesquisa: TfrmConsultaBasica; override;
   function TabelaDePesquisa: TZDataSet; override;
   function PermitirProcura: Boolean;
   function TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
   function ValidaControles: Boolean;
   function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    { Public declarations }
   tipoprocura: TipoProcuraRequisicoes;
   destructor Destroy; override;
  end;

var
  controleValido     : TWinControl;
  frmLerDadosFechamento: TfrmLerDadosFechamento;

implementation

{$R *.dfm}

{ TfrmLerDadosMontagem }

destructor TfrmLerDadosFechamento.Destroy;
begin
  inherited;
  frmLerDadosFechamento:=nil;
end;

function TfrmLerDadosFechamento.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmFechamentoRequisicoesMontagens do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesLerDadosTabeladeMontagem : result := ExisteTabeladeMontagem(NomeCampo, Value);
   end;
end;

function TfrmLerDadosFechamento.InternoPesquisar(Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmFechamentoRequisicoesMontagens do
   begin
    AbreTabelaPesquisa(tipoprocura);
    Titulo := TituloPesquisa(tipoprocura);
    result:=inherited internopesquisar(Titulo);
    if Result = mrOK then
      Selecionar(tipoProcura);
    FechaTabelaPesquisa(tipoprocura);
   end;
  end
  else
   Result := mrNone
end;

function TfrmLerDadosFechamento.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := true;
  Result := Jan
end;

function TfrmLerDadosFechamento.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if edfTabeladeMontagem.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesLerDadosTabeladeMontagem;
    end;
  end;
end;

function TfrmLerDadosFechamento.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmFechamentoRequisicoesMontagens do
  Case tipoprocura of
   tpRequisicoesLerDadosTabeladeMontagem :result := ConsultaTabeladeMontagens;
  end;
end;

function TfrmLerDadosFechamento.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesLerDadosTabeladeMontagem: result := ctTABELADEMONTAGEM;
  end;
end;

function TfrmLerDadosFechamento.ValidaControles: Boolean;
begin
 result:=ecvValida.Verify(gbxFundoJanela, controleValido);
 if result then
  result:=OperadorTernario((Trim(edfTabeladeMontagem.Text) <> ''), edfTabeladeMontagem.Exist, True);
end;

procedure TfrmLerDadosFechamento.sbnProcuraTabeladeMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfTabeladeMontagem, ctTABELADEMONTAGEM)
end;

procedure TfrmLerDadosFechamento.bbnOKClick(Sender: TObject);
begin
  inherited;
  if not ValidaControles then
    modalresult := mrnone
  else
    begin
    with dtmFechamentoRequisicoesMontagens do
     begin
      CodigoTabeladeMontagem    := edfTabeladeMontagem.Text;
      if rbnValorLoja.Checked then
       TipodeMontagem := rbnValorLoja.Value
      else
       if rbnValorDentro.Checked then
        TipodeMontagem := rbnValorDentro.Value
       else
        if rbnValorFora.Checked then
         TipodeMontagem := rbnValorFora.Value;
      DatadeMontagem:=edtDataMontagem.Text;
     end;
    modalresult := mrOK;
    end;
end;

procedure TfrmLerDadosFechamento.edfTabeladeMontagemExit(Sender: TObject);
begin
  inherited;
  with dtmFechamentoRequisicoesMontagens do
  begin
   CodigoTabeladeMontagem := edfTabeladeMontagem.Text;
   if rbnValorLoja.Checked then
     TipodeMontagem := rbnValorLoja.Value
   else
    if rbnValorDentro.Checked then
      TipodeMontagem := rbnValorDentro.Value
    else
     if rbnValorFora.Checked then
       TipodeMontagem := rbnValorFora.Value;
   edtValorPagto.Text:=ValordaMontagem;
  end;
end;

procedure TfrmLerDadosFechamento.rbnValorLojaClick(Sender: TObject);
begin
  inherited;
  with dtmFechamentoRequisicoesMontagens do
  begin
   TipodeMontagem := rbnValorLoja.Value;
   edtValorPagto.Text:=ValordaMontagem;
  end;
end;

procedure TfrmLerDadosFechamento.rbnValorDentroClick(Sender: TObject);
begin
  inherited;
  with dtmFechamentoRequisicoesMontagens do
  begin
   TipodeMontagem := rbnValorDentro.Value;
   edtValorPagto.Text:=ValordaMontagem;
  end;
end;

procedure TfrmLerDadosFechamento.rbnValorForaClick(Sender: TObject);
begin
  inherited;
  with dtmFechamentoRequisicoesMontagens do
  begin
   TipodeMontagem := rbnValorFora.Value;
   edtValorPagto.Text:=ValordaMontagem;
  end;
end;

end.
