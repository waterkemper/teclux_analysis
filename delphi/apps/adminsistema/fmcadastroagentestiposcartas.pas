unit fmcadastroagentestiposcartas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DB, StdCtrls, Mask, DBCtrls,
  // Terceiros
  ZQuery,
  // Constantes
   ctconstantes, biblio,
  // Repositorio
  fmconsultabasica, fmcadastropadrao, fmconsultaporcampo, dmcadastrotabelascrediario,
  // Componentes
  cptexto, cpdbfindcontrols, cpdbtext, ComCtrls, ToolWin;

type
  TfrmCadastroAgentesTiposCartas = class(TfrmCadastroPadrao)
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
    FCadastroTabelasCrediario: TdtmCadastroTabelasCrediario;
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
    procedure SetDataModulo(Dtm: TdtmCadastroTabelasCrediario);
    property CadastroTabelasCrediario: TdtmCadastroTabelasCrediario read FCadastroTabelasCrediario;
  end;

var
  frmCadastroAgentesTiposCartas: TfrmCadastroAgentesTiposCartas;

implementation

{$R *.dfm}

procedure TfrmCadastroAgentesTiposCartas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CadastroTabelasCrediario.TabelaAgentesTiposCartas.State in [dsInsert, dsEdit] then
    CadastroTabelasCrediario.TabelaAgentesTiposCartas.Cancel;
end;

procedure TfrmCadastroAgentesTiposCartas.sbnProcurarAgenteClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkCodigo;
  InternoPesquisar('Agentes');
end;

destructor TfrmCadastroAgentesTiposCartas.Destroy;
begin
  inherited;
  frmCadastroAgentesTiposCartas:= nil;
end;

procedure TfrmCadastroAgentesTiposCartas.SetDataModulo(Dtm: TdtmCadastroTabelasCrediario);
begin
  FCadastroTabelasCrediario:= Dtm;
end;

function TfrmCadastroAgentesTiposCartas.PesquisaHabilitada: Boolean;
begin
  if (CtrlOn) and (ActiveControl = flkCodigo) then
     Result:= True
  else
    Result:= False;
end;

function TfrmCadastroAgentesTiposCartas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= CadastroTabelasCrediario.ExisteAgenteTiposCartas(NomeCampo, Value);
end;

function TfrmCadastroAgentesTiposCartas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroTabelasCrediario.ExcluirAgenteTipoCarta;
  end;
end;

function TfrmCadastroAgentesTiposCartas.InternoGravar: Boolean;
var
  EditandoAgente: Boolean;
begin
  Result:= True;
  with CadastroTabelasCrediario do begin
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

function TfrmCadastroAgentesTiposCartas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroTabelasCrediario.IncluirAgenteTipoCarta(False);
  end;
end;

function TfrmCadastroAgentesTiposCartas.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with CadastroTabelasCrediario do
    begin
      AbrirTabelasConsulta(tbcAGENTETIPOCARTA);
      Result:= inherited InternoPesquisar('Agentes');
      if Result = mrOK then begin
        SelecionarMultiplas(tbcAGENTETIPOCARTA);
        flkCodigo.Modified:= True;
      end;
      FecharTabelasConsulta(tbcAGENTETIPOCARTA);
    end
  else
    Result:= 0;
end;

function TfrmCadastroAgentesTiposCartas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroAgentesTiposCartas.TabelaDePesquisa: TZDataSet;
begin
  Result:= CadastroTabelasCrediario.TabelaConsultaAgentesTiposCartas;
end;

procedure TfrmCadastroAgentesTiposCartas.flkCodigoMessage(var Msg: String);
begin
  Msg := Format(ctREGISTROINCLUIDO,['Agente','no Aviso']);
end;

procedure TfrmCadastroAgentesTiposCartas.flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    if (flkCodigo.ForeignFound = stFound) then
      InternoGravar;
end;

end.
