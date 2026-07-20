unit fmMonitoraBancoDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajuda, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ExtCtrls, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, AsgMemo, Buttons, biblio, dmbasico, clusuario, ctconstantes;

type
  TfrmMonitoraBancoDados = class(TfrmAjuda)
    Timer1: TTimer;
    dsrMonitora: TtecDataSource;
    qryMonitora: TtecQuery;
    qryMonitoradatname: TStringField;
    qryMonitorapid: TIntegerField;
    qryMonitorausename: TStringField;
    qryMonitoraclient_addr: TStringField;
    qryMonitoraclient_port: TIntegerField;
    qryMonitorabackend_start: TDateTimeField;
    qryMonitoraquery_start: TDateTimeField;
    qryMonitorastate: TStringField;
    qryMonitorastate_change: TDateTimeField;
    qryMonitorawaiting: TBooleanField;
    qryMonitoraquery: TStringField;
    qryLock: TtecQuery;
    dsrLock: TtecDataSource;
    qryLockblocked_pid: TIntegerField;
    qryLockblocked_user: TStringField;
    qryLockblocking_pid: TIntegerField;
    qryLockblocking_user: TStringField;
    qryLockblocked_statement: TStringField;
    lblConBancoDados: TStaticText;
    dbgMonitora: TDBAdvGrid;
    dbgLock: TDBAdvGrid;
    qryLockNotLocked: TtecQuery;
    dsrLockNotLocked: TtecDataSource;
    qryLockNotLockeddatid: TIntegerField;
    qryLockNotLockeddatname: TStringField;
    qryLockNotLockedpid: TIntegerField;
    qryLockNotLockedusesysid: TIntegerField;
    qryLockNotLockedusename: TStringField;
    qryLockNotLockedapplication_name: TMemoField;
    qryLockNotLockedclient_addr: TStringField;
    qryLockNotLockedclient_hostname: TMemoField;
    qryLockNotLockedclient_port: TIntegerField;
    qryLockNotLockedbackend_start: TDateTimeField;
    qryLockNotLockedxact_start: TDateTimeField;
    qryLockNotLockedquery_start: TDateTimeField;
    qryLockNotLockedstate_change: TDateTimeField;
    qryLockNotLockedwaiting: TBooleanField;
    qryLockNotLockedstate: TMemoField;
    qryLockNotLockedbackend_xid: TStringField;
    qryLockNotLockedbackend_xmin: TStringField;
    qryLockNotLockedquery: TMemoField;
    dbgLockNotLocked: TDBAdvGrid;
    pnlBottom: TPanel;
    btnDerrubarProcesso: TBitBtn;
    btnRefazerConsultas: TBitBtn;
    qryDerrubarProcesso: TtecQuery;
    pnlMonitora: TPanel;
    pnlLock: TPanel;
    pnlLockNotLocked: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnGravaLog: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure btnRefazerConsultasClick(Sender: TObject);
    procedure btnDerrubarProcessoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnGravaLogClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

  end;

var
  frmMonitoraBancoDados: TfrmMonitoraBancoDados;

implementation

{$R *.dfm}

constructor TfrmMonitoraBancoDados.Create(AOwner: TComponent);
begin
  inherited;
  Timer1Timer(nil);

  if vLogHabilitado then
    btnGravaLog.Caption := 'Desabilitar Log'
  else
    btnGravaLog.Caption := 'Habilitar Log';

end;

destructor TfrmMonitoraBancoDados.Destroy;
begin

  inherited;
end;

procedure TfrmMonitoraBancoDados.Timer1Timer(Sender: TObject);
begin
  inherited;

  dtmTecSoft.dbaTecSoft.Disconnect;
  dtmTecSoft.dbaTecSoft.Connect;

  qryMonitora.close;
  qryMonitora.open;

(*
  qryMonitora.refresh;


  if dbgMonitora.RowCount <> qryMonitora.recordcount then
    mensagemaviso('1. '+inttostr(dbgMonitora.RowCount) + ' <> ' + inttostr(qryMonitora.recordcount));

  dbgMonitora.DataSource.DataSet.Close;
  dbgMonitora.DataSource.DataSet.open;

  dbgMonitora.DataSource.DataSet.refresh;


//  qryMonitora.Open;

  dbgMonitora.Refresh;


  if dbgMonitora.RowCount <> qryMonitora.recordcount then
    mensagemaviso('2. '+inttostr(dbgMonitora.RowCount) + ' <> ' + inttostr(qryMonitora.recordcount));

*)

  qryLock.Close;
  qryLock.Open;

(*
  dbgLock.DataSource.DataSet.Close;
  dbgLock.DataSource.DataSet.open;

  dbgLock.Refresh;

  dbgLockNotLocked.DataSource.DataSet.Close;
  dbgLockNotLocked.DataSource.DataSet.open;
  *)

  qryLockNotLocked.Close;
  qryLockNotLocked.Open;

//  dbgLockNotLocked.Refresh;

  btnDerrubarProcesso.enabled := qryLockNotLocked.recordCount <> 0;


end;

procedure TfrmMonitoraBancoDados.btnRefazerConsultasClick(Sender: TObject);
begin
  inherited;
  Timer1Timer(nil);
end;

procedure TfrmMonitoraBancoDados.btnDerrubarProcessoClick(Sender: TObject);
begin
  inherited;
  qryDerrubarProcesso.parambyName('pid').asinteger := qryLockNotLockedpid.asinteger;
  qryDerrubarProcesso.close;
  qryDerrubarProcesso.open;
end;

procedure TfrmMonitoraBancoDados.FormResize(Sender: TObject);
begin
  inherited;
  pnlLockNotLocked.Refresh;
end;

procedure TfrmMonitoraBancoDados.btnGravaLogClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;

begin
  inherited;

  vLogHabilitado := not vLogHabilitado;
  if vLogHabilitado then
  begin
    UsuarioAut := tdtmBasico.ObterAutorizacao(taLOGIN, 'Você pressionou as teclas Ctrl+Alt+Shift+L.'+chr(13)+
                                                       'Para habilitar o log digite usuario e senha'+chr(13)+
                                                       'Para desabilitar o LOG pressione as teclas Ctrl+Alt+Shift+L novamente.', '', '');
    vLogHabilitado := Assigned(UsuarioAut);
    if not vLogHabilitado then
      MensagemAviso('Usuário ou senha incorreto.');

  end
  else
    MensagemAviso('Você pressionou as teclas Ctrl+Alt+Shift+L e desabilitou o log!');

  LigarDesligarLog_;
  logCtrlOn := false;
  logShiftOn := false;
  logAltOn := false;


  if vLogHabilitado then
    btnGravaLog.Caption := 'Desabilitar Log'
  else
    btnGravaLog.Caption := 'Habilitar Log';


end;

end.
