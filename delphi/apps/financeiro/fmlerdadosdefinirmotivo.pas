unit fmlerdadosdefinirmotivo;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  Buttons, ExtCtrls,
  dmmanutencaocheques,
  ctconstantes,
  fmconsultabasica, fmconsultaporcampo,
  zquery,
  biblio, cpeditioncontrolvalidation, cpdata;

type
  TfrmLerDadosDefinirMotivo = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxMotivo: TGroupBox;
    sbnMotivo: TSpeedButton;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    lblMotivo: TLabel;
    dtxMotivo: TtecDBText;
    pnlSeparador: TPanel;
    flkMotivo: TtecDbEditFind;
    lblData: TLabel;
    edtData: TEditData;
    ecvValidar: TtecEditionControlValidation;
    procedure bbnOKClick(Sender: TObject);
    procedure sbnMotivoClick(Sender: TObject);
  private
    function GetData: string;
    function GetMotivo: String;
  protected
   function InternoPesquisar(Titulo: String): Integer; override;
   function JanelaPesquisa: TfrmConsultaBasica; override;
   function TabelaDePesquisa: TZDataSet; override;
   function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
   function ValidaControles: Boolean;
  public
   destructor Destroy; override;
   property Data: string read GetData;
   property Motivo: String read GetMotivo;
  end;

var
  frmLerDadosDefinirMotivo: TfrmLerDadosDefinirMotivo;
  TipoProcura: TtecManutencaoCheques;

implementation

{$R *.dfm}

procedure TfrmLerDadosDefinirMotivo.bbnOKClick(Sender: TObject);
begin
  inherited;
  if not ValidaControles then ModalResult := mrNone
  else                        ModalResult := mrOk
end;

destructor TfrmLerDadosDefinirMotivo.Destroy;
begin
  inherited;
  frmLerDadosDefinirMotivo:= Nil;
end;

function TfrmLerDadosDefinirMotivo.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmManutencaoCheques.ExisteMotivo(NomeCampo, Value);
end;

function TfrmLerDadosDefinirMotivo.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if CtrlOn then begin
    if ActiveControl = flkMotivo then begin
      TipoProcura := tpManutencaoChequesMotivo;
      Titulo:= 'Motivos';
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
  end
end;

function TfrmLerDadosDefinirMotivo.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := True;
  Result := Jan
end;

function TfrmLerDadosDefinirMotivo.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmManutencaoCheques.TabelaConsultaMotivos;
end;

function TfrmLerDadosDefinirMotivo.ValidaControles: Boolean;
var
  Ctrl: TWinControl;
begin
Result:= ecvValidar.Verify(gbxMotivo,Ctrl) and
         OperadorTernario((Trim(flkMotivo.Text) <> ''), flkMotivo.Exist, True);
end;

procedure TfrmLerDadosDefinirMotivo.sbnMotivoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkMotivo.SetFocus;
  InternoPesquisar('');
end;

function TfrmLerDadosDefinirMotivo.GetData: string;
begin
  Result:= edtData.Text;
end;

function TfrmLerDadosDefinirMotivo.GetMotivo: String;
begin
  Result:= flkMotivo.Text;
end;

end.
