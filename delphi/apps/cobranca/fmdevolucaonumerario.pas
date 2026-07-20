unit fmdevolucaonumerario;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, DB, Windows,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes, biblio,
  //Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo, frconsultadadoscliente,
  frconsultadadosclientecod,
  //Projeto
  dmdevolucaonumerario,
  //Componentes
  cpdbfindcontrols, cpdbtext, cpdbgrid, ComCtrls, cppagecontrol,
  ZPgSqlQuery, cpquery, ActnList,dmconsultadadoscliente, ToolWin;

type
  TfrmDevolucaoNumerario = class(TfrmAjudaBt)
    edfCodigoCliente: TtecDbEditFind;
    lblCliente: TLabel;
    sbnProcuraCliente: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxDevolucaoNumerario: TGroupBox;
    pgcDevolucaoNumerario: TtecPageControl;
    tstDadosCliente: TTabSheet;
    tstParcelasContrato: TTabSheet;
    gbxDadosCliente: TGroupBox;
    GroupBox1: TGroupBox;
    dbgContratosPorCliente: TtecDBGrid;
    dbgParcelasContrato: TtecDBGrid;
    lblFilialVenda: TLabel;
    dtxFilialVenda: TtecDBText;
    dtxDescricaoFilialVenda: TtecDBText;
    lblAgente: TLabel;
    dtxAgente: TtecDBText;
    dtxDescricaoAgente: TtecDBText;
    lblVendedor: TLabel;
    dtxCodigoVendedor: TtecDBText;
    dtxNomeVendedor: TtecDBText;
    lblAvalista: TLabel;
    dtxCodigoAvalista: TtecDBText;
    dtxNomeAvalista: TtecDBText;
    lblAnalista: TLabel;
    dtxCodigoAnalista: TtecDBText;
    dtxNomeAnalista: TtecDBText;
    dtxNomeCliente: TtecDBText;
    sbnAutorizar: TSpeedButton;
    lblSituacao: TLabel;
    dtxDescricaoSituacao: TtecDBText;
    gbxContratos: TGroupBox;
    lblOrigem: TLabel;
    dtxContratoOrigem: TtecDBText;
    lblNovo: TLabel;
    dtxNovoContrato: TtecDBText;
    lblValorVista: TLabel;
    dtxValorVista: TtecDBText;
    lblValorPrazo: TLabel;
    dtxValorPrazo: TtecDBText;
    fraConsultaDadosClienteCodDevolucaoNumerario: TfraConsultaDadosCliente;
    aclHabilitarBotoes: TActionList;
    actHabilitar: TAction;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure edfCodigoClienteFound(Found: Boolean);
    procedure dbgParcelasContratoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbnAutorizarClick(Sender: TObject);
    procedure dbgParcelasContratoDblClick(Sender: TObject);
    procedure dbgParcelasContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actHabilitarUpdate(Sender: TObject);
  protected
    dtmDevolucaoNumerario : TdtmDevolucaoNumerario;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AfterScrollContrato(Sender: TObject);
    procedure DevolucaoNumerario;
  public
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;
  end;

var
  frmDevolucaoNumerario: TfrmDevolucaoNumerario;

implementation

{$R *.dfm}

{ TfrmDevolucaoNumerario }

procedure TfrmDevolucaoNumerario.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnAutorizar.Enabled:= (dbgParcelasContrato.DataSource.DataSet.RecordCount > 0);
end;

procedure TfrmDevolucaoNumerario.AfterScrollContrato(Sender: TObject);
begin
  fraConsultaDadosClienteCodDevolucaoNumerario.BuscarDadosCliente(
               dtmDevolucaoNumerario.CodigoCliente,
               dtmDevolucaoNumerario.TipoCliente);
end;

constructor TfrmDevolucaoNumerario.Create(AOwner: TComponent);
begin
  dtmDevolucaoNumerario := TdtmDevolucaoNumerario.Create(Self);
  inherited;
  dtmDevolucaoNumerario.Abre(ctCrediarioClientes);
  dtmDevolucaoNumerario.OnAfterScrollContrato:= AfterScrollContrato;
end;

procedure TfrmDevolucaoNumerario.dbgParcelasContratoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
{  if dtmDevolucaoNumerario.PodeDevolverParcela then
    dbgParcelasContrato.Canvas.Brush.Color := $00D5FFD5
  else begin
    if dtmDevolucaoNumerario.ParcelaJaDevolvida then
         dbgParcelasContrato.Canvas.Brush.Color := clInfoBk
    else dbgParcelasContrato.Canvas.Brush.Color := clWhite;
  end;
  dbgParcelasContrato.Canvas.Font.Color  := clBlack;
  dbgParcelasContrato.DefaultDrawColumnCell(Rect, DataCol, Column, State);}
end;

destructor TfrmDevolucaoNumerario.Destroy;
begin
  dtmDevolucaoNumerario:=nil;
  inherited;
  frmDevolucaoNumerario := nil;
end;

procedure TfrmDevolucaoNumerario.edfCodigoClienteFound(Found: Boolean);
begin
  inherited;
  if Found then begin
    dtmDevolucaoNumerario.ReFazConsultaContratosPorCliente;
    if dbgContratosPorCliente.CanFocus then
    begin
      dbgContratosPorCliente.SetFocus;
    end;
  end
  else
  begin
   dtmDevolucaoNumerario.LimparTabelas;
  end;
end;

function TfrmDevolucaoNumerario.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmDevolucaoNumerario.ExisteCliente(nomecampo, value);
end;

function TfrmDevolucaoNumerario.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if (ActiveControl = edfCodigoCliente) and CtrlOn then begin
    dtmDevolucaoNumerario.AbrirConsultaClientes;
    Result := inherited InternoPesquisar('Clientes');
    if Result = mrOK then
      dtmDevolucaoNumerario.Selecionar;
    dtmDevolucaoNumerario.FecharConsultaClientes;
  end;
end;

function TfrmDevolucaoNumerario.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmDevolucaoNumerario.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_ESCAPE: dtmDevolucaoNumerario.LimparTabelas;
    VK_F7    : sbnAutorizar.Click;
  end;
end;

procedure TfrmDevolucaoNumerario.sbnAutorizarClick(Sender: TObject);
begin
  inherited;
  DevolucaoNumerario;
end;

procedure TfrmDevolucaoNumerario.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCodigoCliente.SetFocus;
  InternoPesquisar('');
  pgcDevolucaoNumerario.Enabled := True;
  dbgContratosPorCliente.Enabled := True;
  dbgParcelasContrato.Enabled := True;
  tstParcelasContrato.Enabled := True;
  GroupBox1.Enabled := True;
end;

function TfrmDevolucaoNumerario.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmDevolucaoNumerario.ConsultarCliente;
end;

procedure TfrmDevolucaoNumerario.dbgParcelasContratoDblClick(Sender: TObject);
begin
  inherited;
  DevolucaoNumerario;
end;

procedure TfrmDevolucaoNumerario.dbgParcelasContratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case KEY of
    VK_SPACE: if (Shift = [ssCtrl]) then DevolucaoNumerario;
  end;
  inherited ;
end;

procedure TfrmDevolucaoNumerario.DevolucaoNumerario;
begin
  dtmDevolucaoNumerario.EfetuarDevolucaoNumerario;
  if dbgParcelasContrato.CanFocus then
    dbgParcelasContrato.SetFocus;
end;


end.
