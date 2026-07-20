unit fmlerdadosopcaoavisos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  Buttons, ExtCtrls,
  ctconstantes,
  fmconsultabasica, fmconsultaporcampo,
  zquery,
  biblio, cpeditioncontrolvalidation, cpnumero;

type
  TfrmLerDadosOpcaoAvisos = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    pnlSeparador: TPanel;
    rgpOpcoesAvisos: TRadioGroup;
    gbxModeloEtiquetasTexto: TGroupBox;
    edfModeloEtiqueta: TtecDbEditFind;
    dtxModeloEtiqueta: TtecDBText;
    sbnPesquisarFilial: TSpeedButton;
    edtNCopias: TEditNumero;
    lblQuantidade: TLabel;
    procedure bbnOKClick(Sender: TObject);
    procedure rgpOpcoesAvisosClick(Sender: TObject);
    procedure sbnPesquisarFilialClick(Sender: TObject);
    procedure bbnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  protected
   function  InternoPesquisar(Titulo: String): Integer; override;
   function  JanelaPesquisa: TfrmConsultaBasica; override;
   function  TabelaDePesquisa: TZDataSet; override;
   function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    { Public declarations }
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   function PesquisaHabilitada: Boolean;
   function TituloPesquisa: String;

  end;

var
  frmLerDadosOpcaoAvisos: TfrmLerDadosOpcaoAvisos;
  TipoPesquisa: TtecPesquisa;

implementation
uses dmaviso;
{$R *.dfm}

procedure TfrmLerDadosOpcaoAvisos.bbnOKClick(Sender: TObject);
begin
  inherited;
  if (rgpOpcoesAvisos.ItemIndex = 2) then
  begin
   if (edtNCopias.ValorSemFormatacao<=0) then
     edtNCopias.SetFocus
   else
   if OperadorTernario((Trim(edfModeloEtiqueta.Text) <> ''),not edfModeloEtiqueta.Exist, true) then
    edfModeloEtiqueta.setfocus
   else
    modalresult := mrok;
  end
  else
    modalresult := mrok;
end;

constructor TfrmLerDadosOpcaoAvisos.Create(AOwner: TComponent);
begin
  inherited;
  rgpOpcoesAvisosClick(rgpOpcoesAvisos);
end;

destructor TfrmLerDadosOpcaoAvisos.Destroy;
begin
  inherited;
  frmLerDadosOpcaoAvisos:=nil;
end;

function TfrmLerDadosOpcaoAvisos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmAviso do
    case TipoPesquisa of
      pesMODELOETIQUETA : result := ExisteCliente(NomeCampo, Value);
      pesTIPOCARTAS : result := ExisteTipoCarta(NomeCampo, Value);
    end;
end;

function TfrmLerDadosOpcaoAvisos.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmAviso do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result := 0;
end;

function TfrmLerDadosOpcaoAvisos.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := True;
  Result := Jan
end;

function TfrmLerDadosOpcaoAvisos.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfModeloEtiqueta.Focused then
      TipoPesquisa := pesMODELOETIQUETA;
    Result:= True;
  end;
end;

procedure TfrmLerDadosOpcaoAvisos.rgpOpcoesAvisosClick(Sender: TObject);
begin
  inherited;
  gbxModeloEtiquetasTexto.Enabled := (rgpOpcoesAvisos.ItemIndex = 2)
end;

function TfrmLerDadosOpcaoAvisos.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmAviso do
  Case TipoPesquisa of
   pesMODELOETIQUETA  : Result := ConsultaModelosEtiquetas;
  end;
end;

function TfrmLerDadosOpcaoAvisos.TituloPesquisa: String;
begin
  case TipoPesquisa of
     pesMODELOETIQUETA  : Result:= ctMODELOETIQUETA
  end;
end;

procedure TfrmLerDadosOpcaoAvisos.sbnPesquisarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  ActiveControl := edfModeloEtiqueta;
  InternoPesquisar(ctMODELOETIQUETA);
end;

procedure TfrmLerDadosOpcaoAvisos.bbnCancelarClick(Sender: TObject);
begin
  inherited;
  modalresult := mrCancel;
end;

end.
