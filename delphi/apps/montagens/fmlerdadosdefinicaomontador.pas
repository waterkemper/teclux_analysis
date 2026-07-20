unit fmlerdadosdefinicaomontador;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  Buttons, ExtCtrls,
  dmdefinicaomontador,
  ctconstantes,
  fmconsultabasica, fmconsultaporcampo,
  zquery,
  biblio, cpeditioncontrolvalidation;

type
  TfrmLerDadosDefinicaoMontador = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    sbnProcuraMontador: TSpeedButton;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    lblTabeladeMontagem: TLabel;
    dtxNomeMontador: TtecDBText;
    pnlSeparador: TPanel;
    edfMontador: TtecDbEditFind;
    ecvValida: TtecEditionControlValidation;
    procedure bbnOKClick(Sender: TObject);
    procedure sbnProcuraMontadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
   function InternoPesquisar(Titulo: String): Integer; override;
   function JanelaPesquisa: TfrmConsultaBasica; override;
   function TabelaDePesquisa: TZDataSet; override;
   function PermitirProcura: Boolean;
   function TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
   function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
   function ValidaControles: Boolean;
  public
    { Public declarations }
   tipoprocura: TipoProcuraRequisicoes;
   ControleValido: TWinControl;
   destructor Destroy; override;
  end;

var
  frmLerDadosDefinicaoMontador: TfrmLerDadosDefinicaoMontador;

implementation

{$R *.dfm}

procedure TfrmLerDadosDefinicaoMontador.bbnOKClick(Sender: TObject);
begin
  inherited;
  if not ValidaControles then
    modalresult := mrnone
  else
  begin
   with dtmDefinicaoMontador do
    CodigoMontador := edfMontador.Text;
   modalresult := mrok;
  end;
end;

destructor TfrmLerDadosDefinicaoMontador.Destroy;
begin
  inherited;
  frmLerDadosDefinicaoMontador:=nil;
end;

function TfrmLerDadosDefinicaoMontador.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmDefinicaoMontador do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesLerDadosMontadores : result := ExisteMontador(NomeCampo, Value);
   end;
end;

function TfrmLerDadosDefinicaoMontador.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmDefinicaoMontador do
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

function TfrmLerDadosDefinicaoMontador.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := true;
  Result := Jan
end;

function TfrmLerDadosDefinicaoMontador.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if edfMontador.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesLerDadosMontadores;
    end;
  end;
end;

function TfrmLerDadosDefinicaoMontador.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmDefinicaoMontador do
  Case tipoprocura of
   tpRequisicoesLerDadosMontadores :result := ConsultaMontadores;
  end;
end;

function TfrmLerDadosDefinicaoMontador.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesLerDadosMontadores: result := ctMONTADORES;
  end;
end;

function TfrmLerDadosDefinicaoMontador.ValidaControles: Boolean;
begin
  result:=ecvValida.Verify(gbxFundoJanela, ControleValido);
  if Result then
   result:=OperadorTernario((Trim(edfMontador.Text) <> ''), edfMontador.Exist, True);
end;

procedure TfrmLerDadosDefinicaoMontador.sbnProcuraMontadorClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfMontador, ctMONTADORES);
end;

procedure TfrmLerDadosDefinicaoMontador.FormShow(Sender: TObject);
begin
  inherited;
  edfMontador.SetFocus;
end;

end.
