unit fmcadastrohistoricosevento;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB,
  //bilbio
  ctconstantes,
  //Componentes
  cpnumero, cpdbfindcontrols, cptexto, cpdbtext,
  //Terceiros
  ZQuery,
  //Repositorio
  dmBasico, fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  //Porjeto
  dmcadastroeventos, ComCtrls, ToolWin;

type
  TfrmCadastroHistoricosEvento = class(TfrmCadastroPadrao)
    sbnProcuraHistorico: TSpeedButton;
    edtMenu: TDBEditTexto;
    flkCodigoHistorico: TtecDBFindLookup;
    dtxHistoricoDescricao: TtecDBText;
    pnlFundoJanela: TPanel;
    gbxHistorico: TGroupBox;
    gbxMenu: TGroupBox;
    procedure edtMenuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnProcuraHistoricoClick(Sender: TObject);
    procedure flkCodigoHistoricoMessage(var Msg: String);
  protected
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; Override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    constructor Create(AOwner: TComponent); Override;
    destructor destroy; override;
end;

var
  frmCadastroHistoricosEvento: TfrmCadastroHistoricosEvento;

implementation

Uses
  //Biblio
  biblio;

{$R *.dfm}

constructor TfrmCadastroHistoricosEvento.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmcadastroeventos.TabelaHistoricoEventos
end;

destructor TfrmCadastroHistoricosEvento.destroy;
begin
  inherited;
  frmCadastroHistoricosEvento := nil;
end;

function TfrmCadastroHistoricosEvento.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmcadastroeventos.ExisteHistorico(NomeCampo, value);
end;

procedure TfrmCadastroHistoricosEvento.flkCodigoHistoricoMessage(var Msg: String);
begin
  inherited;
  Msg := Format(ctREGISTROINCLUIDO, [flkCodigoHistorico.Text, ctNOEVENTO])
end;

function TfrmCadastroHistoricosEvento.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result and not CtrlOn then
    dtmcadastroeventos.ExcluirHistoricosEventos;
  Result:= True;
end;

function TfrmCadastroHistoricosEvento.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result and not CtrlOn then
    dtmcadastroeventos.GravarHistoricosEventos
end;

function TfrmCadastroHistoricosEvento.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result and not CtrlOn then
    dtmcadastroeventos.IncluirHistoricosEventos(False);
end;

function TfrmCadastroHistoricosEvento.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrOk;
  if CtrlOn then begin
    dtmcadastroeventos.AbreConsultaHistoricosEvento;
    Result:= inherited InternoPesquisar(ctHISTORICO);
     if Result = mrOk then
       dtmcadastroeventos.AtribuirHistoricosNoEvento;
     dtmcadastroeventos.Fecha(ctCaixaConsultaHistoricos);
  end;
end;

function TfrmCadastroHistoricosEvento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmCadastroHistoricosEvento.edtMenuKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and TeclaEnterOuReturn(Key) then
    sbnSalvarClick(nil);
end;

procedure TfrmCadastroHistoricosEvento.sbnProcuraHistoricoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  InternoPesquisar('');
end;

function TfrmCadastroHistoricosEvento.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmcadastroeventos.ConsultarHistorico;
end;

function TfrmCadastroHistoricosEvento.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result:= dtmcadastroeventos.ConsultarHistorico;
end;

end.
