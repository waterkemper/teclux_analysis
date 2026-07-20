unit fmlerdadosdefinicaocobrador;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  Buttons, ExtCtrls,
  dmmanutencaocheques,
  ctconstantes,
  fmconsultabasica, fmconsultaporcampo,
  zquery,
  biblio, cpeditioncontrolvalidation;

type
  TfrmLerDadosDefinicaoCobrador = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    sbnProcuraCobrador: TSpeedButton;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    lblCobrador: TLabel;
    dtxNomeCobrador: TtecDBText;
    pnlSeparador: TPanel;
    edfCobrador: TtecDbEditFind;
    procedure bbnOKClick(Sender: TObject);
    procedure sbnProcuraCobradorClick(Sender: TObject);
  private
    function GetCobrador: String;
  protected
   function InternoPesquisar(Titulo: String): Integer; override;
   function JanelaPesquisa: TfrmConsultaBasica; override;
   function TabelaDePesquisa: TZDataSet; override;
   function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
   function ValidaControles: Boolean;
  public
   destructor Destroy; override;
   property Cobrador: String read GetCobrador;
  end;

var
  frmLerDadosDefinicaoCobrador: TfrmLerDadosDefinicaoCobrador;
  TipoProcura: TtecManutencaoCheques;

implementation

{$R *.dfm}

procedure TfrmLerDadosDefinicaoCobrador.bbnOKClick(Sender: TObject);
begin
  inherited;
  if not ValidaControles then begin
    MensagemAviso('Nenhum Cobrador foi definido');
    ModalResult := mrNone;
  end
  else ModalResult := mrOk;
end;

destructor TfrmLerDadosDefinicaoCobrador.Destroy;
begin
  inherited;
  frmLerDadosDefinicaoCobrador:= Nil;
end;

function TfrmLerDadosDefinicaoCobrador.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmManutencaoCheques.ExisteCobrador(NomeCampo, Value);
end;

function TfrmLerDadosDefinicaoCobrador.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if ActiveControl = edfCobrador then begin
      TipoProcura:= tpManutencaoChequesDefinicaoCobrador;
      Titulo:= 'Cobradores';
    end
    else
      TipoProcura:= tpManutencaoChequesNenhum;

    if TipoProcura <> tpManutencaoChequesNenhum then begin
      with dtmManutencaoCheques do begin
        AbreTabelaPesquisa(TipoProcura);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoProcura);
        FechaTabelaPesquisa(TipoProcura);
      end;
    end
  end;
end;

function TfrmLerDadosDefinicaoCobrador.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := true;
  Result := Jan
end;

function TfrmLerDadosDefinicaoCobrador.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmManutencaoCheques.TabelaConsultaCobradores;
end;

function TfrmLerDadosDefinicaoCobrador.ValidaControles: Boolean;
begin
  Result:= OperadorTernario((Trim(edfCobrador.Text) <> ''), edfCobrador.Exist, False);
end;

procedure TfrmLerDadosDefinicaoCobrador.sbnProcuraCobradorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCobrador.SetFocus;
  InternoPesquisar('');
end;

function TfrmLerDadosDefinicaoCobrador.GetCobrador: String;
begin
  Result:= edfCobrador.Text;
end;

end.
