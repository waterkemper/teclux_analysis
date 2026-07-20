unit fmcadastroagentesaviso;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DB, StdCtrls, Mask, DBCtrls,
  // Terceiros
  ZQuery,
  // Constantes
   ctconstantes, biblio,
  // Repositorio
  fmconsultabasica, fmcadastropadrao, fmconsultaporcampo, dmaviso,
  // Componentes
  cptexto, cpdbfindcontrols, cpdbtext, ComCtrls;

type
  TfrmCadastroAgentesAviso = class(TfrmCadastroPadrao)
    lblCodigo: TLabel;
    lblAgente: TLabel;
    flkCodigo: TtecDBFindLookup;
    sbnProcurarAgente: TSpeedButton;
    dtxAgente: TtecDBText;
    pnlFundoJanela: TPanel;
    gbxAgentesAviso: TGroupBox;
    procedure sbnProcurarAgenteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure flkCodigoMessage(var Msg: String);
    procedure flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    FCadastroAviso: TdtmAviso;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    destructor  Destroy; override;
    function  PesquisaHabilitada: Boolean;
    procedure SetDataModulo(Dtm: TdtmAviso);
    property CadastroAviso: TdtmAviso read FCadastroAviso;
  end;

var
  frmCadastroAgentesAviso: TfrmCadastroAgentesAviso;

implementation

{$R *.dfm}

procedure TfrmCadastroAgentesAviso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dtmAviso.TabelaAgentesTiposCartas.State in [dsInsert, dsEdit] then
    dtmAviso.TabelaAgentesTiposCartas.Cancel;
end;

procedure TfrmCadastroAgentesAviso.sbnProcurarAgenteClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkCodigo;
  InternoPesquisar('Agentes');
end;

destructor TfrmCadastroAgentesAviso.Destroy;
begin
  inherited;
  frmCadastroAgentesAviso:= nil;  
end;

procedure TfrmCadastroAgentesAviso.SetDataModulo(Dtm: TdtmAviso);
begin
  FCadastroAviso:= Dtm;
end;

function TfrmCadastroAgentesAviso.PesquisaHabilitada: Boolean;
begin
  if (CtrlOn) and (ActiveControl = flkCodigo) then
     Result:= True
  else
    Result:= False;
end;

function TfrmCadastroAgentesAviso.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= CadastroAviso.ExisteAgente(NomeCampo, Value);
end;

function TfrmCadastroAgentesAviso.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroAviso.ExcluirAgenteTipoCarta;
  end;
end;

function TfrmCadastroAgentesAviso.InternoGravar: Boolean;
var
  EditandoAgente: Boolean;
begin
  Result:= True;
  with CadastroAviso do begin
    if ActiveControl is TtecFindCustom then
      Result:= TtecFindCustom(ActiveControl).Exist;
    if Result then begin
      EditandoAgente:= TabelaAgentesTiposCartas.State = dsEdit;
      Result:= GravarAgenteTipoCarta;
      if Result then begin
        if EditandoAgente then
             Close
        else InternoIncluir;
      end;
    end
    else
      Result := False;
  end;
end;

function TfrmCadastroAgentesAviso.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroAviso.IncluirAgenteTipoCarta(False);
  end;
end;

function TfrmCadastroAgentesAviso.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with CadastroAviso do
    begin
      AbreTabelaPesquisa(pesAGENTES);
      Result:= inherited InternoPesquisar('Agentes');
      if Result = mrOK then begin
        SelecionarAgente;
        flkCodigo.Modified:= True;
      end;  
      FechaTabelaPesquisa(pesAGENTES);
    end
  else
    Result:= 0;
end;

function TfrmCadastroAgentesAviso.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroAgentesAviso.TabelaDePesquisa: TZDataSet;
begin
  Result:= CadastroAviso.TabelaAgentes;
end;

procedure TfrmCadastroAgentesAviso.flkCodigoMessage(var Msg: String);
begin
  Msg := Format(ctREGISTROINCLUIDO,['Agente','no Aviso']);
end;

procedure TfrmCadastroAgentesAviso.flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    if (flkCodigo.ForeignFound = stFound) then
      InternoGravar;
end;

end.
