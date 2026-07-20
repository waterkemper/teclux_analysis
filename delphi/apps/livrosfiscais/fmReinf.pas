unit fmReinf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls,
  AdvPageControl, frconsultacontabil, frconsultacodigocontabil, StdCtrls,
  Mask, cpdbfindcontrols, dmreinf, AdvGroupBox, AdvOfficeButtons,
  DBAdvOfficeButtons, AdvEdit, DBAdvEd, ctconstantes, Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid;

type
  TfrmReinf = class(TFrmCadastroPadrao)
    pnlReinf: TPanel;
    pgcOperacoesReinf: TAdvPageControl;
    tstPeriodicos: TAdvTabSheet;
    tstContribuinte: TAdvTabSheet;
    tstprocessos: TAdvTabSheet;
    pgcPeriodicos: TAdvPageControl;
    tstServicosTomados: TAdvTabSheet;
    tstServicosPrestados: TAdvTabSheet;
    tstRepasseAssociacaoDesportiva: TAdvTabSheet;
    pgcReinf: TAdvPageControl;
    tstReinfCadastro: TAdvTabSheet;
    tstReinfEnvio: TAdvTabSheet;
    gbxPeriodo: TGroupBox;
    edtMesInicial: TtecDbEditFind;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigoContabil;
    grptpamb: TDBAdvOfficeRadioGroup;
    sbnTransmitir: TSpeedButton;
    DBAdvEdit2: TDBAdvEdit;
    dbgDadosReinf: TDBAdvGrid;
    dbgEnvio_Reinf: TDBAdvGrid;
    gbxEnvio_Processos: TGroupBox;
    dbgEnvio_Processos: TDBAdvGrid;
    gbxEnvio_SuspensaoExibilidadeTributos: TGroupBox;
    dbgEnvio_SuspensaoExibilidadeTributos: TDBAdvGrid;
    dbgEnvioReinf_2010: TDBAdvGrid;
    procedure edtMesInicialMessage(var Msg: String);
    procedure pgcReinfChange(Sender: TObject);
  private
    { Private declarations }
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;
    procedure CondicaoFilialConsolidadora;


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    
  end;

var
  frmReinf: TfrmReinf;

implementation

{$R *.dfm}

{ TfrmReinf }

procedure TfrmReinf.AlterarEstadoBotoes;
begin
  inherited;

end;

procedure TfrmReinf.CondicaoFilialConsolidadora;
begin
  fraconsultafilial.qryprocurafiliais.macrobyname('SQL').asstring := 'and filialconsolidadoradime is null';
  fraconsultafilial.qryconsultafiliais.macrobyname('SQL').asstring := 'and filialconsolidadoradime is null';
end;

constructor TfrmReinf.Create(AOwner: TComponent);
begin
  inherited;
  dtmReinf := TdtmReinf.Create(self);
  dataset := dtmReinf.qryReinf;

  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaFilial.CondicoesdaConsulta := CondicaoFilialConsolidadora;

end;

destructor TfrmReinf.Destroy;
begin
  dtmReinf := nil;
  inherited;
  frmReinf := nil;
end;

procedure TfrmReinf.edtMesInicialMessage(var Msg: String);
begin
  inherited;
  msg := 'O período '+edtMesInicial.Text + ' não esta cadastrado.'
end;

function TfrmReinf.InternoExcluir: Boolean;
begin

end;

function TfrmReinf.InternoGravar: Boolean;
begin

end;

function TfrmReinf.InternoIncluir: Boolean;
begin
  result := inherited internoincluir;
  if result then
    Result := dtmReinf.Incluir;
end;

procedure TfrmReinf.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TfrmReinf.pgcReinfChange(Sender: TObject);
begin
  inherited;
  if pgcReinf.ActivePage = tstReinfCadastro then
  begin
     dbgDadosReinf.DataSource := dtmReinf.dsrEnvio1000_Contribuinte;
     dbgEnvio_Processos.DataSource := dtmReinf.dsr1070_ProcessoJudicialReinf;
     dbgEnvio_SuspensaoExibilidadeTributos.DataSource := dtmReinf.dsr1070_SuspensaoExibilidadeTributos;
  end
  else
  if pgcReinf.ActivePage = tstReinfEnvio then
  begin
     dbgDadosReinf.DataSource := dtmReinf.dsr1000_Contribuinte;
     dbgEnvio_Processos.DataSource := dtmReinf.dsrEnvio1070_ProcessoJudicialReinf;
//     dbgEnvio_SuspensaoExibilidadeTributos.DataSource := dsrEnvio1070_SuspensaoExibilidadeTributos;

  end;
end;

end.
